unit Convert.Convention;

interface

uses
  SysUtils;

type
  TConvertConvention = class
  public
    class function SnakeToCamel(value: String): String;
    class function CamelToSnake(value: String): String;
  end;

implementation

{ TConvertConvention }

class function TConvertConvention.CamelToSnake(value: String): String;
var
  i:integer;
begin
  try
    Result := LowerCase(value[1]);
  except
    Result := EmptyStr;
  end;

  for i := 2 to Length(value) do
    if value[i] in ['A'..'Z'] then
      Result := Result + '_' + LowerCase(value[i])
    else
      Result := Result + value[i];
end;

class function TConvertConvention.SnakeToCamel(value: String): String;
var
  i: Integer;
  b: Boolean;
begin
  result := EmptyStr;
  b:= true;
  for i := 1 to Length(value) do
  begin

    if value[i] = '_' then
      b := true
    else if b then
    begin
      result := result + UpperCase(value[i]);
      b := false;
    end
    else
      result := result + value[i];
  end;
    
end;

end.
