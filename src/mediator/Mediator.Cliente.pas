unit Mediator.Cliente;

interface

uses
  Common.Messages,
  Global.Main,
  Entity.Cliente,
  ControlRepository.Cliente,
  IMediator.Cliente,
  SysUtils;

type
  TMediatorCliente = class(TInterfacedObject, IMediatorCliente)
  private
    FMediator: IMediatorCliente;
  public
    procedure AfterConstruction; override;

    function GetById(pinId: Integer): TEntityCliente;
    function GetByCodigo(pinCodigo: Integer): TEntityCliente;
    function GetByNome(pstNome: string): TEntityCliente;
  end;

implementation

{ TMediatorCliente }

procedure TMediatorCliente.AfterConstruction;
begin
  inherited;
  if TGlobalMain.IsRest then
    raise Exception.Create(MSG_ERRO_REST_NOT_IMPLEMENTED)
  else
    FMediator := TControlRepositoryCliente.Create;
end;

function TMediatorCliente.GetByCodigo(pinCodigo: Integer): TEntityCliente;
begin
  result := FMediator.GetByCodigo(pinCodigo);
end;

function TMediatorCliente.GetById(pinId: Integer): TEntityCliente;
begin
  result := FMediator.GetById(pinId);
end;

function TMediatorCliente.GetByNome(pstNome: string): TEntityCliente;
begin
  result := FMediator.GetByNome(pstNome);
end;

end.
