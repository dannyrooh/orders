unit Convert.Entity;
{
  Usada para simplificar a convers?o de dados de dataset para classes, e vice versa

  15/11/22
  - Retirado a dependencia de objeto querys, passar o params para executar a query

  05/10/22
  - A query esta usando a biblioteca Zeus (zDataset), para utilizar com query
  subsituir pelo component que utiliza para persistencia de dados

  dannyrooh@hotmail.com
}

interface

uses

  Convert.Convention,
  TypInfo, Classes, SysUtils, Variants, DB, strUtils;

type
  TClassConvertEntity = class of TConvertEntity;

  TConvertEntity = class
  public
    class function Str(objeto: TObject; prop, value: string):
      TClassConvertEntity;
    class function Int(objeto: TObject; prop: string; value: Integer):
      TClassConvertEntity;
    class function Dub(objeto: TObject; prop: string; value: Double):
      TClassConvertEntity;
    class function Val(objeto: TObject; prop: string; value: Variant):
      TClassConvertEntity;


    class function toDataSet(
      sourceEntity: TObject;
      dataset: TdataSet;
      const doEdit: boolean = true;
      const doPost: boolean = true;
      const camelToSnake: boolean = true): TClassConvertEntity;

    //alias de from dataset
    class function toEntity(sourceDataset: TdataSet; destinyEntity: TObject;
      const removePrefixField: string = '';
      const toCamelConvention: boolean = true): TClassConvertEntity;

    class function toParams(sourceEntity: TObject;
     destinyParams: TParams; const toSnakeConvention: boolean = true): TClassConvertEntity;

    //mostra as propriedades e valores
    class function StringList(objeto: TObject): TStringList;

    class function ClearParamsZero(params: TParams; paramFields: array of
      string): TClassConvertEntity;

  end;

implementation

{ TConvertEntity }

class function TConvertEntity.ClearParamsZero(params: TParams;
  paramFields: array of string): TClassConvertEntity;
var
  i: integer;
  p: TParam;
begin
  for i := low(paramFields) to high(paramFields) do
  begin
    p := params.FindParam(paramFields[i]);
    if (p <> nil) and (not p.IsNull)
      and ((p.AsString = '0') or (p.AsString = '00:00:00')) then
      p.Clear;
  end;
  result := Self;
end;

class function TConvertEntity.Dub(objeto: TObject; prop: string;
  value: Double): TClassConvertEntity;
begin
  SetFloatProp(objeto, prop, value);
  result := TConvertEntity;
end;

class function TConvertEntity.Int(objeto: TObject; prop: string;
  value: Integer): TClassConvertEntity;
begin
  SetOrdProp(objeto, prop, value);
  result := TConvertEntity;
end;

class function TConvertEntity.Str(objeto: TObject; prop, value: string):
  TClassConvertEntity;
begin
  SetStrProp(objeto, prop, value);
  result := TConvertEntity;
end;

class function TConvertEntity.stringList(objeto: TObject): TStringList;
var
  PropList: PPropList;
  PropCount, I: Integer;
begin
  result := TStringList.Create;

  PropCount := GetPropList(objeto, PropList);
  try
    for I := 0 to PropCount - 1 do
      // use PropList[I]^ as needed...
      result.Add(PropList[I].Name + '=' + VarToStr(GetPropValue(objeto,
        PropList[I].Name)));
  finally
    FreeMem(PropList);
  end;
end;

class function TConvertEntity.toDataSet(sourceEntity: TObject; dataset: TdataSet;
  const doEdit, doPost, camelToSnake: boolean): TClassConvertEntity;
var
  PropList: PPropList;
  PropCount, I: Integer;
  f: TField;
  propName, fieldName: string;
begin

  if doEdit then
    dataset.Append;

  PropCount := GetPropList(sourceEntity, PropList);
  try
    for I := 0 to PropCount - 1 do
    begin

      propName := PropList[I].Name;

      if camelToSnake then
        fieldName := TConvertConvention.CamelToSnake(propName)
      else
        fieldName := propName;

      f := dataset.Fields.FindField(fieldName);

      if f = nil then
        Continue;

      if f.DataType in [ftSmallint, ftInteger, ftWord] then
        f.AsInteger := GetOrdProp(sourceEntity, propName)
      else if f.DataType in [ftFloat, ftCurrency, ftBCD, ftDate, ftTime,
        ftDateTime, ftFMTBcd] then
        f.AsFloat := GetFloatProp(sourceEntity, propName)
      else if f.DataType in [ftString, ftMemo, ftFmtMemo, ftFixedChar,
        ftWideString] then
        f.AsString := GetStrProp(sourceEntity, propName)
      else
        f.Value := GetPropValue(sourceEntity, propName);

    end;
  finally
    FreeMem(PropList);
  end;

  if doPost then
    dataset.Post;

  result := TConvertEntity;

end;

class function TConvertEntity.toEntity(sourceDataset: TdataSet; destinyEntity: TObject;
  const removePrefixField: string; const toCamelConvention: boolean):
    TClassConvertEntity;
var
  i: integer;
  f: TField;
  propName: string;
begin
  result := TConvertEntity;

  if sourceDataset.IsEmpty then
    Exit;

  for i := 0 to sourceDataset.FieldCount - 1 do
  begin
    f := sourceDataset.Fields[i];

    propName := f.FieldName;

    if removePrefixField <> emptyStr then
      propName := StringReplace(propName, removePrefixField, '', []);

    if toCamelConvention then
      propName := TConvertConvention.SnakeToCamel(propName);

    if not IsPublishedProp(destinyEntity, propName) then
      Continue;

    if f.DataType in [ftSmallint, ftInteger, ftWord] then
      Self.Int(destinyEntity, propName, f.AsInteger)
    else if f.DataType in [ftFloat, ftCurrency, ftBCD, ftDate, ftTime,
      ftDateTime, ftFMTBcd] then
      self.Dub(destinyEntity, propName, f.AsFloat)
    else if f.DataType in [ftString, ftMemo, ftFmtMemo, ftFixedChar,
      ftWideString] then
      self.Str(destinyEntity, propName, f.AsString)
    else
      self.Val(destinyEntity, propName, f.AsVariant);
  end;


end;

class function TConvertEntity.toParams(sourceEntity: TObject;
  destinyParams: TParams;
  const toSnakeConvention: boolean): TClassConvertEntity;
var
  PropList: PPropList;
  PropCount, i: Integer;
  f: TParam;
  propName, propType: string;
begin
  result := TConvertEntity;

  for i := 0 to destinyParams.Count - 1 do
    destinyParams[i].Clear;

  PropCount := GetPropList(sourceEntity, PropList);
  try
    for i := 0 to PropCount - 1 do
    begin

      propName := PropList[i]^.Name;

      if toSnakeConvention then
        propName := TConvertConvention.CamelToSnake(propName);

      propType := LowerCase(PropList[i]^.PropType^.name);

      f := destinyParams.FindParam(propName);

      if f = nil then
        Continue;

      if propType = 'integer' then
        f.AsInteger := GetOrdProp(sourceEntity, PropList[i]^.Name)
      else if propType = 'double' then
        f.AsFloat := GetFloatProp(sourceEntity, PropList[i]^.Name)
      else if propType = 'tdatetime' then
        //f.AsDateTime := GetPropValue(sourceEntity, PropList[i]^.Name)
        f.AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss',GetPropValue(sourceEntity, PropList[i]^.Name))
      else if propType = 'string' then
        f.AsString := GetStrProp(sourceEntity, PropList[i]^.Name)
      else
        f.Value := GetPropValue(sourceEntity, PropList[i]^.Name);

    end;
  finally
    FreeMem(PropList);
  end;
end;

class function TConvertEntity.Val(objeto: TObject; prop: string;
  value: Variant): TClassConvertEntity;
begin
  SetPropValue(objeto, prop, value);
  result := TConvertEntity;
end;

end.
