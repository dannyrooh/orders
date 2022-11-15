unit Convert.PedidoVenda;

interface

uses
  Entity.PedidoVenda,
  Convert.Entity,
  Convert.PedidoVendaItem,
  DB;

type
  TConvertPedidoVenda = class
  public
    class function toEntity(dataset: TDataSet): TEntityPedidoVenda;
    class function Item: TClassConvertPedidoVendaItem;

    class procedure toDataset(
      souceEntity: TEntityPedidoVenda;
      datasetPedidoVenda, datasetPedidoVendaItem: TDataSet);
  end;

implementation

{ TConvertViewPedidoVenda }

class function TConvertPedidoVenda.Item: TClassConvertPedidoVendaItem;
begin
  result := TConvertPedidoVendaItem;
end;

class procedure TConvertPedidoVenda.toDataset(souceEntity: TEntityPedidoVenda;
  datasetPedidoVenda, datasetPedidoVendaItem: TDataSet);
var
  i: integer;
begin
  TConvertEntity.toDataSet(souceEntity,datasetPedidoVenda);

  for i := 0 to souceEntity.items.Count-1 do
    Item.toDataSet(souceEntity.items.Items[i],datasetPedidoVendaItem);

end;

class function TConvertPedidoVenda.toEntity(
  dataset: TDataSet): TEntityPedidoVenda;
begin
  result := TEntityPedidoVenda.Create;
  TConvertEntity.toEntity(dataset,result,'',false);
end;

end.
