unit IMediator.PedidoVenda;

interface

uses
  Entity.PedidoVenda,
  Entity.PedidoVendaItem;

type
  IMediatorPedidoVenda = interface
    ['{9A3D477F-4F97-4FC1-AC66-B2E63F162D82}']
    function NextNumeroPedidoVenda: integer;

    function AddPedidoVenda(entity: TEntityPedidoVenda): Integer;
    function UpdPedidoVenda(entity: TEntityPedidoVenda): Boolean;
    function DelPedidoVenda(pIdPedidoVenda: integer): Boolean;

    function GetPedidoVendaById(pIdPedidoVenda: Integer): TEntityPedidoVenda;
    function GetPedidoVendaByNumero(pNumeroPedidoVenda: Integer): TEntityPedidoVenda;

  end;

implementation

end.
