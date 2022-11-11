unit Convert.Produto;

interface

uses
  Entity.Produto,DB;

type
  TClassConvertProduto = class of TConvertProduto;
  TConvertProduto = class
  public
    class function ToEntity(dataset: TDataset): TEntityProduto;
    class function ToDataset(entity: TEntityProduto; dataSet: TDataSet): TClassConvertProduto;
  end;

implementation

{ TConvertProduto }

class function TConvertProduto.ToDataset(entity: TEntityProduto;
  dataSet: TDataSet): TClassConvertProduto;
begin
  result := TConvertProduto;

  if not (dataSet.State in dsEditModes) then
    dataSet.edit;

  dataset.FieldByName('pro_id').AsInteger := entity.Id;
  dataset.FieldByName('pro_codigo').AsInteger := entity.Codigo;
  dataset.FieldByName('pro_descricao').AsString := entity.Descricao;
  dataset.FieldByName('pro_preco_venda').AsFloat := entity.Preco_Venda;
end;

class function TConvertProduto.ToEntity(dataset: TDataset): TEntityProduto;
begin
  result := TEntityProduto.Create;
  result.Id := dataset.FieldByName('pro_id').AsInteger;
  result.Codigo := dataset.FieldByName('pro_codigo').AsInteger;
  result.Descricao := dataset.FieldByName('pro_descricao').AsString;
  result.Preco_Venda := dataset.FieldByName('pro_preco_venda').AsFloat;
end;

end.
