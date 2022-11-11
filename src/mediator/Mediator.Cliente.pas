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
    
    function GetByCodigo(piCodigo: Integer): TEntityCliente;
    function GetByNome(psNome: string): TEntityCliente;
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

function TMediatorCliente.GetByCodigo(piCodigo: Integer): TEntityCliente;
begin
  result := FMediator.GetByCodigo(piCodigo);
end;

function TMediatorCliente.GetByNome(psNome: string): TEntityCliente;
begin
  result := FMediator.GetByNome(psNome); 
end;

end.
