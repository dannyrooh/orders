unit Cache.Delete.PedidoVendaItem;

interface

uses
  DB, SysUtils;

type
  TCacheDeletePedidoVendaItem = class
  private
    FList: array of integer;
  public
    procedure BeforeDestruction; override;

    function Find(pinSequencia: integer): Boolean;
    function Add(pinSequencia: integer): Integer;
    function Delete(pinSequencia: integer): TCacheDeletePedidoVendaItem;
    function Clear: TCacheDeletePedidoVendaItem; 
  end;

implementation

{ TCacheDeletePedidoVendaItem }


function TCacheDeletePedidoVendaItem.Add(pinSequencia: integer): Integer;
var
  i: integer;
begin
  for i := 0 to Length(FList) - 1 do
    if FList[i] = pinSequencia then
    begin
      Result := i;
      Exit;
    end;

  i := Length(FList);
  SetLength(FList,Succ(i));
  FList[i] := pinSequencia;
  Result := i;
end;

procedure TCacheDeletePedidoVendaItem.BeforeDestruction;
begin
  inherited;
  Clear;
end;

function TCacheDeletePedidoVendaItem.Clear: TCacheDeletePedidoVendaItem;
begin
  SetLength(FList,0);
  Result := Self;
end;

function TCacheDeletePedidoVendaItem.Delete(
  pinSequencia: integer): TCacheDeletePedidoVendaItem;
var
  i, len , j: integer;
begin
  Result := Self;
  len := Length(FList) -1;
  for i := 0 to len do
    if FList[i] = pinSequencia then
    begin
      for j := i to len-1 do
        FList[j] := FList[succ(j)];
      Break;
    end;
  SetLength(FList, pred(len));
end;

function TCacheDeletePedidoVendaItem.Find(pinSequencia: integer): Boolean;
var
  i: integer;
begin
  Result := false;
  for i := 0 to Length(FList) - 1 do
    if FList[i] = pinSequencia then
    begin
      Result := true;
      Exit;
    end;
end;

end.
