unit Convert.PedidoVenda;

interface

uses
  Entity.PedidoVenda,
  Convert.PedidoVendaItem,
  DB;

type
  TConvertPedidoVenda = class
  public
    class function toEntity(dataset: TDataSet): TEntityPedidoVenda;
    class function Item: TClassConvertPedidoVendaItem;
  end;

implementation

{ TConvertViewPedidoVenda }

class function TConvertPedidoVenda.Item: TClassConvertPedidoVendaItem;
begin
  result := TConvertPedidoVendaItem;
end;

class function TConvertPedidoVenda.toEntity(
  dataset: TDataSet): TEntityPedidoVenda;
begin
  result := TEntityPedidoVenda.Create;

  result.id := dataset.FieldByName('id').AsInteger;
  result.cliente := dataset.FieldByName('cliente_id').AsInteger;
  result.numero := dataset.FieldByName('numero').AsInteger;
  result.emissao := dataset.FieldByName('emissao').AsDateTime;
  result.valor_total := dataset.FieldByName('valor_total').AsFloat;

end;

end.
