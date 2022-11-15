unit ControlRepository.Cliente;

interface

uses
  Base.ControlRepository,
  DataRepository.Cliente,
  Entity.Cliente,
  Convert.Cliente,
  IMediator.Cliente,
  Classes, SysUtils, SqlExpr, DB;

type
  TWrapControlRepositoryCliente = class(TBaseControlRepository);
  TControlRepositoryCliente = class(TInterfacedObject, IMediatorCliente)
  private
    FControl: TWrapControlRepositoryCliente;
    FSqlGetCache: string;
    function Data: TdmdDataRepositoryCliente;
  protected
    function GetSelectDataset(where: string; const args: array of const):
      TEntityCliente;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function GetById(pinId: Integer): TEntityCliente;
    function GetByCodigo(pinCodigo: Integer): TEntityCliente;
    function GetByNome(pstNome: string): TEntityCliente;
  end;

implementation

{ TControlRepositoryCliente }

procedure TControlRepositoryCliente.AfterConstruction;
begin
  inherited;
  FControl := TWrapControlRepositoryCliente.Create;
  FSqlGetCache := trim(Data.qryClienteGet.SQL.Text) + ' ';
end;

procedure TControlRepositoryCliente.BeforeDestruction;
begin
  inherited;
  if FControl <> nil then
    FreeAndNil(FControl);
end;

function TControlRepositoryCliente.Data: TdmdDataRepositoryCliente;
begin
  result := TdmdDataRepositoryCliente(FControl.DM);
end;

function TControlRepositoryCliente.GetByCodigo(
  pinCodigo: Integer): TEntityCliente;
begin
  result := GetSelectDataset('where cli_codigo = %d', [pinCodigo]);
end;

function TControlRepositoryCliente.GetById(pinId: Integer): TEntityCliente;
begin
  result := GetSelectDataset('where cli_id = %d', [pinId]);
end;

function TControlRepositoryCliente.GetByNome(pstNome: string): TEntityCliente;
begin
  result := GetSelectDataset('where cli_nome = %s', [quotedStr(pstNome)]);
end;

function TControlRepositoryCliente.GetSelectDataset(where: string;
  const args: array of const): TEntityCliente;
var
  qry: TSQLQuery;
  sql: string;
begin

  sql := FSqlGetCache + Format(where, args);

  qry := Data.qryClienteGet;
  qry.Close;
  qry.SQL.Text := sql;
  qry.Open;
  try
    result := TConvertCliente.ToEntity(qry);
  finally
    qry.Close;
  end;
end;

initialization
  RegisterClass(TdmdDataRepositoryCliente);

end.
