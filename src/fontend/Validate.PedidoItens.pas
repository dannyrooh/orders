unit Validate.PedidoItens;

interface

uses
 Entity.PedidoVendaItem,
 Constantes.FrontEnd,
 Dialog.Message,
 DB;

type
  TClassValidatePedidoItens = class of TValidatePedidoItens;
  TValidatePedidoItens = class
  public
    class function Exec(entity: TEntityPedidoVendaItem): boolean;
  end;

implementation

{ TValidatePedidoItens }

class function TValidatePedidoItens.Exec(
  entity: TEntityPedidoVendaItem): boolean;
begin
  result := false;

  if entity.Produto = 0 then
  begin
    TDialogMessage.Erro(ERRO_ITEM_PRODUTO_NOT_FOUND);
    Exit;
  end;

  if entity.Quantidade = 0 then
  begin
    TDialogMessage.Erro(ERRO_ITEM_QUANTIDADE_NOT_FOUND);
    Exit;
  end;

  if entity.ValorUnitario = 0 then
  begin
    TDialogMessage.Erro(ERRO_ITEM_VALORUNITARIO_NOT_FOUND);
    Exit;
  end;

  result := true;
  
end;

end.
