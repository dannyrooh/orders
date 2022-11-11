unit Mediator.Produto;

interface

uses
  Common.Messages,
  Global.Main,
  Entity.Produto,
  ControlRepository.Produto,
  IMediator.Produto,
  SysUtils;

type
  TMediatorProduto = class(TInterfacedObject, IMediatorProduto)
  private
    FMediator: IMediatorProduto;
  public
    procedure AfterConstruction; override;
    function GetByCodigo(piCodigo: Integer): TEntityProduto;
  end;


implementation

{ TMediatorProduto }

procedure TMediatorProduto.AfterConstruction;
begin
  inherited;
  if TGlobalMain.IsRest then
    raise Exception.Create(MSG_ERRO_REST_NOT_IMPLEMENTED)
  else
    FMediator := TControlRepositoryProduto.Create;
end;

function TMediatorProduto.GetByCodigo(piCodigo: Integer): TEntityProduto;
begin
  result := FMediator.GetByCodigo(piCodigo);
end;

end.
