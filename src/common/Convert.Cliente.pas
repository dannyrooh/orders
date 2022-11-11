unit Convert.Cliente;

interface

uses
  Entity.Cliente,
  DB;

type
  TClassConvertCliente = class of TConvertCliente;
  TConvertCliente = class
  public
    class function ToEntity(dataset: TDataset): TEntityCliente;
    class function ToDataset(entity: TEntityCliente; dataSet: TDataSet): TClassConvertCliente;
  end;

implementation


{ TConvertCliente }

class function TConvertCliente.ToDataset(entity: TEntityCliente;
  dataSet: TDataSet): TClassConvertCliente;
begin
  result := TConvertCliente;

  if not (dataSet.State in dsEditModes) then
    dataSet.edit;

  dataset.FieldByName('cli_id').AsInteger := entity.Id;
  dataset.FieldByName('cli_codigo').AsInteger := entity.Codigo;
  dataset.FieldByName('cli_nome').AsString := entity.Nome;
  dataset.FieldByName('cli_cidade').AsString := entity.Cidade;
  dataset.FieldByName('cli_uf').AsString := entity.Uf;

end;

class function TConvertCliente.ToEntity(dataset: TDataset): TEntityCliente;
begin
  result := TEntityCliente.Create;
  result.Id := dataset.FieldByName('cli_id').AsInteger;
  result.Codigo := dataset.FieldByName('cli_codigo').AsInteger;
  result.Nome := dataset.FieldByName('cli_nome').AsString;
  result.Cidade := dataset.FieldByName('cli_cidade').AsString;
  result.Uf := dataset.FieldByName('cli_uf').AsString;
end;

end.
