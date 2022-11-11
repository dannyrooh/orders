unit Entity.PedidoVenda;

interface

{$M+}

uses
  Entity.PedidoVendaItem,
  SysUtils;

type
  TEntityPedidoVenda = class
  private
    Fvalor_total: double;
    Fcliente: integer;
    Fid: integer;
    Fnumero: integer;
    Femissao: TDateTime;
    Fitems: TListPedidoVendaItem;
    procedure Setitems(const Value: TListPedidoVendaItem);
    function Getitems: TListPedidoVendaItem;
  protected
    procedure consumerValorTotal(value:double);
  public
    procedure BeforeDestruction; override;
  published
    property id: integer read Fid write Fid;
    property cliente: integer read Fcliente write Fcliente;
    property numero: integer read Fnumero write Fnumero;
    property emissao: TDateTime read Femissao write Femissao;
    property valor_total: double read Fvalor_total write Fvalor_total;

    property items: TListPedidoVendaItem read Getitems write Setitems;
  end;

implementation

{ TEntityPedidoVenda }

procedure TEntityPedidoVenda.BeforeDestruction;
begin
  inherited;
  if Assigned(Fitems) then
    FreeAndNil(Fitems);
end;

procedure TEntityPedidoVenda.consumerValorTotal(value: double);
begin
  valor_total := value;
end;

function TEntityPedidoVenda.Getitems: TListPedidoVendaItem;
begin
  if Fitems = nil then
    Fitems := TListPedidoVendaItem.Create;
  result := Fitems;
end;

procedure TEntityPedidoVenda.Setitems(const Value: TListPedidoVendaItem);
begin
  Fitems := Value;
end;

end.

