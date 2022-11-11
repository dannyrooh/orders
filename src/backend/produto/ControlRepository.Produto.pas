unit ControlRepository.Produto;

interface

uses
  Base.ControlRepository,
  DataRepository.Produto,
  Entity.Produto,
  Convert.Produto,
  IMediator.Produto,
  Classes, SysUtils, SqlExpr, DB;

type
  TWrapControlRepositoryProduto = class(TBaseControlRepository);
  TControlRepositoryProduto = class(TInterfacedObject, IMediatorProduto)
  private
    FControl: TWrapControlRepositoryProduto;
    FSqlGetCache: string;
    function Data: TdmdDataRepositoryProduto;
  protected
    function GetSelectDataset(where: string; const args: array of const):
      TEntityProduto;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function GetByCodigo(piCodigo: Integer): TEntityProduto;
  end;

implementation

{ TControlRepositoryProduto }

procedure TControlRepositoryProduto.AfterConstruction;
begin
  inherited;
  FControl := TWrapControlRepositoryProduto.Create;
  FSqlGetCache := trim(Data.qryProdutoGet.SQL.Text)+ ' ';
end;

procedure TControlRepositoryProduto.BeforeDestruction;
begin
  inherited;
  if FControl <> nil then
    FreeAndNil(FControl);
end;

function TControlRepositoryProduto.Data: TdmdDataRepositoryProduto;
begin
  result := TdmdDataRepositoryProduto(FControl.DM);
end;

function TControlRepositoryProduto.GetByCodigo(
  piCodigo: Integer): TEntityProduto;
begin
  result := GetSelectDataset('where pro_codigo=%d',[piCodigo])
end;

function TControlRepositoryProduto.GetSelectDataset(where: string;
  const args: array of const): TEntityProduto;
var
  qry: TSQLQuery;
  sql: string;
begin
  sql := FSqlGetCache + Format(where, args);

  qry := Data.qryProdutoGet;
  qry.Close;
  qry.SQL.Text := sql;
  qry.Open;
  try
    result := TConvertProduto.ToEntity(qry);
  finally
    qry.Close;
  end;
end;

initialization
  RegisterClass(TdmdDataRepositoryProduto)


end.
