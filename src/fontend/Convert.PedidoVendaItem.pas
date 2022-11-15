unit Convert.PedidoVendaItem;

interface

uses
  Convert.Entity,
  Entity.PedidoVendaItem,
  DB;

type
  TClassConvertPedidoVendaItem = class of TConvertPedidoVendaItem;
  TConvertPedidoVendaItem = class
  public
    class function toEntity(dataset: TDataSet): TEntityPedidoVendaItem;
    class function toList(dataset: TDataSet): TListPedidoVendaItem;

    class procedure toDataSet(sourceEntity: TEntityPedidoVendaItem; datasetDestiny: TDataSet);
  end;


implementation

{ TConvertPedidoVendaItem }

class procedure TConvertPedidoVendaItem.toDataSet(
  sourceEntity : TEntityPedidoVendaItem; datasetDestiny: TDataSet);
begin
  TConvertEntity.toDataSet(sourceEntity, datasetDestiny,true, true, true);
end;

class function TConvertPedidoVendaItem.toEntity(
  dataset: TDataSet): TEntityPedidoVendaItem;
begin
  result := TEntityPedidoVendaItem.Create;
  TConvertEntity.toEntity(dataset,result);
end;

class function TConvertPedidoVendaItem.toList(
  dataset: TDataSet): TListPedidoVendaItem;
begin
  result := TListPedidoVendaItem.Create;

  if not dataset.Active then
    Exit; 

  dataset.DisableControls;
  try
    dataset.First;
    while not dataset.Eof do
    begin
      result.Add( toEntity(dataset) );
      dataset.Next;
    end;
  finally
    dataset.First;
    dataset.EnableControls;
  end;

end;

end.
