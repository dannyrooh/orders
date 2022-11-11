unit Validate.Pedido;

interface

uses
 Entity.PedidoVenda,
 Entity.PedidoVendaItem,
 Constantes.FrontEnd,
 Dialog.Message,
 DB;

type
  TValidatePedido = class
  public
    class function Exec(entity: TEntityPedidoVenda): boolean;
  end;

implementation

{ TValidatePedido }

class function TValidatePedido.Exec(entity: TEntityPedidoVenda): boolean;
begin
  result := false;

  if entity.cliente = 0 then
  begin
    TDialogMessage.Erro(ERRO_CLIENT_PEDIDO_NOT_FOUND);
    Exit;
  end;

  if entity.numero = 0 then
  begin
    TDialogMessage.Erro(ERRO_NUMERO_PEDIDO_NOT_FOUND);
    Exit;
  end;

  if entity.emissao = 0 then
  begin
    TDialogMessage.Erro(ERRO_EMISSAO_PEDIDO_NOT_FOUND);
    Exit;
  end;

  if (entity.items = nil) or (entity.items.Count = 0) then
  begin
    TDialogMessage.Erro(ERRO_ITEM_PEDIDO_NOT_FOUND);
    Exit;
  end;

  if entity.valor_total <= 0 then
  begin
    TDialogMessage.Erro(ERRO_VALOR_PEDIDO_NOT_FOUND);
    Exit;
  end;

  result := true;


end;

end.
