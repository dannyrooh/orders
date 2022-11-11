unit Control.PedidoVenda;

interface

uses
  IMediator.PedidoVenda,
  Mediator.PedidoVenda,
  Entity.PedidoVenda,
  SysUtils;

type
  TControlPedidoVenda = class(TInterfacedObject, IMediatorPedidoVenda)
  private
    FMediator: TMediatorPedidoVenda;
    function GetMediator: TMediatorPedidoVenda;
  public
    property Mediator: TMediatorPedidoVenda read GetMediator;

    function NextNumeroPedidoVenda: Integer;

    function AddPedidoVenda(entity: TEntityPedidoVenda): Integer;
    function UpdPedidoVenda(entity: TEntityPedidoVenda): Boolean;
    function DelPedidoVenda(pIdPedidoVenda: integer): Boolean;

    function GetPedidoVendaById(pIdPedidoVenda: Integer): TEntityPedidoVenda;
    function GetPedidoVendaByNumero(pNumeroPedidoVenda: Integer): TEntityPedidoVenda;    
  end;

implementation


{ TControlPedidoVenda }

function TControlPedidoVenda.AddPedidoVenda(
  entity: TEntityPedidoVenda): Integer;
begin
  result := Mediator.AddPedidoVenda(entity);
end;

function TControlPedidoVenda.DelPedidoVenda(pIdPedidoVenda: integer): Boolean;
begin
  Result := Mediator.DelPedidoVenda(pIdPedidoVenda);
end;

function TControlPedidoVenda.GetMediator: TMediatorPedidoVenda;
begin
  if FMediator = nil then
     FMediator := TMediatorPedidoVenda.Create;
  result := FMediator;
end;

function TControlPedidoVenda.GetPedidoVendaById(
  pIdPedidoVenda: Integer): TEntityPedidoVenda;
begin
  result := Mediator.GetPedidoVendaById(pIdPedidoVenda);
end;

function TControlPedidoVenda.GetPedidoVendaByNumero(
  pNumeroPedidoVenda: Integer): TEntityPedidoVenda;
begin
  result := Mediator.GetPedidoVendaByNumero(pNumeroPedidoVenda);
end;

function TControlPedidoVenda.NextNumeroPedidoVenda: Integer;
begin
  result := Mediator.NextNumeroPedidoVenda;
end;

function TControlPedidoVenda.UpdPedidoVenda(
  entity: TEntityPedidoVenda): Boolean;
begin
  result := Mediator.UpdPedidoVenda(entity);
end;

end.
