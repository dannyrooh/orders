unit Control.Cliente;

interface

uses
  Entity.Cliente,
  IMediator.Cliente,
  Mediator.Cliente,
  SysUtils, DB, variants;

type
  TControlCliente = class(TInterfacedObject, IMediatorCliente)
  private
    FMediator: TMediatorCliente;
  public
    procedure AfterConstruction; override;
    
    function GetByCodigo(piCodigo: Integer): TEntityCliente;
    function GetByNome(psNome: string): TEntityCliente;
  end;

implementation

{ TControlCliente }

procedure TControlCliente.AfterConstruction;
begin
  inherited;
  FMediator := TMediatorCliente.Create;
end;

function TControlCliente.GetByCodigo(piCodigo: Integer): TEntityCliente;
begin
  result := FMediator.GetByCodigo(piCodigo);
end;

function TControlCliente.GetByNome(psNome: string): TEntityCliente;
begin
  result := FMediator.GetByNome(psNome);
end;

end.
