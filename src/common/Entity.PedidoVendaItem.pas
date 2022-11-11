unit Entity.PedidoVendaItem;

interface

uses
  Contnrs;

{$M+}

type
  TEntityPedidoVendaItem = class
  private
    Fproduto: integer;
    Fsequencia: integer;
    Fquantidade: double;
    FpedidoVenda: integer;
    FvalorUnitario: double;
    FvalorTotal: double;
  published
    property PedidoVenda: integer read FpedidoVenda write FpedidoVenda;
    property Produto: integer read Fproduto write Fproduto;
    property Sequencia: integer read Fsequencia write Fsequencia;
    property Quantidade: double read Fquantidade write Fquantidade;
    property ValorUnitario: double read FvalorUnitario write FvalorUnitario;
    property ValorTotal: double read FvalorTotal write FvalorTotal;
  end;

  TListPedidoVendaItem = class(TObjectList)
  private
    function GetItems(index: integer): TEntityPedidoVendaItem;
    procedure SetItems(index: integer; const Value: TEntityPedidoVendaItem);
  public
    property Items[index: integer]: TEntityPedidoVendaItem read GetItems write SetItems;
    function Add(entity: TEntityPedidoVendaItem): integer; reintroduce;

    function TotalPedido: Double;
  end;

implementation

{ TListPedidoVendaItem }

function TListPedidoVendaItem.add(entity: TEntityPedidoVendaItem): integer;
begin
  result := inherited Add(entity);
end;

function TListPedidoVendaItem.GetItems(index: integer): TEntityPedidoVendaItem;
begin
  result := TEntityPedidoVendaItem(inherited Items[index]);
end;

procedure TListPedidoVendaItem.SetItems(index: integer;
  const Value: TEntityPedidoVendaItem);
begin
  inherited Items[index] := value;
end;

function TListPedidoVendaItem.TotalPedido: Double;
var
  i: Integer;
begin
  result := 0;
  for i := 0 to Count - 1 do
   result := result + Items[i].ValorTotal;
end;

end.
