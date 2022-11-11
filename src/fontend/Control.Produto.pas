unit Control.Produto;

interface

uses
  Entity.Produto,
  IMediator.Produto,
  Mediator.Produto,
  SysUtils;


type
  TControlProduto = class(TInterfacedObject, IMediatorProduto)
  private
    FMediatorProduto: TMediatorProduto;
  public
    procedure AfterConstruction; override;
    function GetByCodigo(piCodigo: Integer): TEntityProduto;
  end;

implementation

{ TControlProduto }


{ TControlProduto }

procedure TControlProduto.AfterConstruction;
begin
  inherited;
  FMediatorProduto := TMediatorProduto.Create;
end;

function TControlProduto.GetByCodigo(piCodigo: Integer): TEntityProduto;
begin
  result := FMediatorProduto.GetByCodigo(piCodigo);
end;

end.
