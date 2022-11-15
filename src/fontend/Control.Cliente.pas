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

    function GetById(pinId: Integer): TEntityCliente;
    function GetByCodigo(pinCodigo: Integer): TEntityCliente;
    function GetByNome(pstNome: string): TEntityCliente;
  end;

implementation

{ TControlCliente }

procedure TControlCliente.AfterConstruction;
begin
  inherited;
  FMediator := TMediatorCliente.Create;
end;

function TControlCliente.GetByCodigo(pinCodigo: Integer): TEntityCliente;
begin
  result := FMediator.GetByCodigo(pinCodigo);
end;

function TControlCliente.GetById(pinId: Integer): TEntityCliente;
begin
  result := FMediator.GetByID(pinId);
end;

function TControlCliente.GetByNome(pstNome: string): TEntityCliente;
begin
  result := FMediator.GetByNome(pstNome);
end;

end.
