unit Convert.PedidoVendaItem;

interface

uses
  Entity.PedidoVendaItem,
  DB;

type
  TClassConvertPedidoVendaItem = class of TConvertPedidoVendaItem;
  TConvertPedidoVendaItem = class
  public
    class function toEntity(dataset: TDataSet): TEntityPedidoVendaItem;
    class function toList(dataset: TDataSet): TListPedidoVendaItem;
  end;


implementation

{ TConvertPedidoVendaItem }

class function TConvertPedidoVendaItem.toEntity(
  dataset: TDataSet): TEntityPedidoVendaItem;
begin
  result := TEntityPedidoVendaItem.Create;
  result.PedidoVenda := dataset.FieldByName('pedido_id').AsInteger;
  result.Produto := dataset.FieldByName('produto_id').AsInteger;
  result.Sequencia := dataset.FieldByName('sequencia').AsInteger;
  result.Quantidade := dataset.FieldByName('quantidade').AsFloat;
  result.ValorUnitario := dataset.FieldByName('valor_unitario').AsFloat;
  result.ValorTotal := dataset.FieldByName('valor_total').AsFloat;
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
