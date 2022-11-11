unit ConvertRepository.PedidoVendaItem;

interface

uses
  Entity.PedidoVendaItem,
  SysUtils, DB;

type
  TConvertPedidoVendaItem = class
  public
    class function ToEntity(dataset: TDataset; const prefix: string = ''): TEntityPedidoVendaItem;
    class function ToList(dataset: TDataset; const prefix: string = ''): TListPedidoVendaItem;
    class function ToDataset(entity: TEntityPedidoVendaItem; dataSet: TDataSet): TDataSet;
    class function ToParams(entity: TEntityPedidoVendaItem; params: TParams): TDataSet;
  end;

implementation

{ TConvertPedidoVendaItem }

class function TConvertPedidoVendaItem.ToDataset(entity: TEntityPedidoVendaItem;
  dataSet: TDataSet): TDataSet;
begin
  result := dataSet;

  dataSet.Edit;
  dataSet.FieldByName('pedido_venda').AsInteger := entity.PedidoVenda;
  dataSet.FieldByName('produto').AsInteger := entity.Produto;
  dataSet.FieldByName('sequencia').AsInteger := entity.Sequencia;
  dataSet.FieldByName('valor_unitario').AsFloat := entity.ValorUnitario;
  dataSet.FieldByName('valor_total').AsFloat := entity.ValorTotal;
  dataSet.Post;
end;

class function TConvertPedidoVendaItem.ToEntity(
  dataset: TDataset; const prefix: string): TEntityPedidoVendaItem;
begin
  result := TEntityPedidoVendaItem.Create;
  result.PedidoVenda := dataSet.FieldByName(prefix+'pedido_venda').AsInteger;
  result.Produto := dataSet.FieldByName(prefix+'produto').AsInteger;
  result.Sequencia := dataSet.FieldByName(prefix+'sequencia').AsInteger;
  result.ValorUnitario := dataSet.FieldByName(prefix+'valor_unitario').AsFloat;
  result.ValorTotal := dataSet.FieldByName(prefix+'valor_total').AsFloat;
end;

class function TConvertPedidoVendaItem.ToList(
  dataset: TDataset;const prefix: string): TListPedidoVendaItem;
begin
  result := TListPedidoVendaItem.Create;
  dataset.First;
  while not dataset.Eof do
  begin
    result.Add(ToEntity(dataset, prefix));
    dataset.Next;
  end;
end;

class function TConvertPedidoVendaItem.ToParams(entity: TEntityPedidoVendaItem;
  params: TParams): TDataSet;
begin

  Params.ParamByName('pedido_venda').AsInteger := entity.PedidoVenda;
  Params.ParamByName('produto').AsInteger := entity.Produto;
  Params.ParamByName('sequencia').AsInteger := entity.Sequencia;
  Params.ParamByName('valor_unitario').AsFloat := entity.ValorUnitario;
  Params.ParamByName('valor_total').AsFloat := entity.ValorTotal;

  result := TDataSet(params.Owner);

end;

end.
