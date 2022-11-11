unit Mediator.PedidoVenda;

interface

uses
  Global.Main,
  Common.Messages,
  IMediator.PedidoVenda,
  Entity.PedidoVenda,
  DataRepository.PedidoVenda,
  ControlRepository.PedidoVenda,
  //Rest.PedidoVenda,
  SysUtils;

type
  TMediatorPedidoVenda = class(TInterfacedObject, IMediatorPedidoVenda)
  private
    FMediator: IMediatorPedidoVenda;
  public
    procedure AfterConstruction; override;
    function NextNumeroPedidoVenda: Integer;

    function AddPedidoVenda(entity: TEntityPedidoVenda): Integer;
    function UpdPedidoVenda(entity: TEntityPedidoVenda): Boolean;
    function DelPedidoVenda(pIdPedidoVenda: integer): Boolean;

    function GetPedidoVendaById(pIdPedidoVenda: Integer): TEntityPedidoVenda;
    function GetPedidoVendaByNumero(pNumeroPedidoVenda: Integer): TEntityPedidoVenda;    
  end;



implementation

{ TMediatorPedidoVenda }

function TMediatorPedidoVenda.AddPedidoVenda(
  entity: TEntityPedidoVenda): Integer;
begin
  result := FMediator.AddPedidoVenda(entity);
end;

procedure TMediatorPedidoVenda.AfterConstruction;
begin
  inherited;
  if TGlobalMain.IsRest then
    raise Exception.Create(MSG_ERRO_REST_NOT_IMPLEMENTED)
  else
    FMediator := TControlRepositoryPedidoVenda.Create;
end;

function TMediatorPedidoVenda.DelPedidoVenda(pIdPedidoVenda: integer): Boolean;
begin
  result := FMediator.DelPedidoVenda(pIdPedidoVenda);
end;

function TMediatorPedidoVenda.GetPedidoVendaById(
  pIdPedidoVenda: Integer): TEntityPedidoVenda;
begin
  result := FMediator.GetPedidoVendaById(pIdPedidoVenda);
end;

function TMediatorPedidoVenda.GetPedidoVendaByNumero(
  pNumeroPedidoVenda: Integer): TEntityPedidoVenda;
begin
  result := FMediator.GetPedidoVendaByNumero(pNumeroPedidoVenda);
end;

function TMediatorPedidoVenda.NextNumeroPedidoVenda: Integer;
begin
  result := FMediator.NextNumeroPedidoVenda;
end;

function TMediatorPedidoVenda.UpdPedidoVenda(
  entity: TEntityPedidoVenda): Boolean;
begin
  result := FMediator.UpdPedidoVenda(entity);
end;

end.
