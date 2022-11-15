unit ConvertRepository.PedidoVendaItem;

interface

uses
  Entity.PedidoVendaItem,
  Convert.Entity,
  DB;

type
  TConvertRepositoryPedidoVendaItem = class
  public
    class function ToEntity(dataset: TDataset):TEntityPedidoVendaItem;
    class function ToList(dataset: TDataset):TListPedidoVendaItem;
    class procedure ToParams(entity: TEntityPedidoVendaItem; params: TParams);
  end;

implementation

{ TConvertRepositoryPedidoVendaItem }

class function TConvertRepositoryPedidoVendaItem.ToEntity(
  dataset: TDataset): TEntityPedidoVendaItem;
begin
  result := TEntityPedidoVendaItem.Create;
  TConvertEntity.toEntity(dataset,result, 'pit_');
end;

class function TConvertRepositoryPedidoVendaItem.ToList(
  dataset: TDataset): TListPedidoVendaItem;
begin
  result := TListPedidoVendaItem.Create;
  dataset.First;
  while not dataset.Eof do
  begin
    result.Add(ToEntity(dataset));
    dataset.Next;
  end;
end;

class procedure TConvertRepositoryPedidoVendaItem.ToParams(
    entity: TEntityPedidoVendaItem; params: TParams);
begin
  TConvertEntity.toParams(entity, params);
end;

end.
