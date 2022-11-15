unit ControlRepository.PedidoVenda;

interface

uses
  Base.ControlRepository,
  DataRepository.PedidoVenda,
  IMediator.PedidoVenda,
  Entity.PedidoVenda,
  ConvertRepository.PedidoVenda,
  ControlRepository.PedidoVendaItem,
  Classes, SysUtils, DB, SqlExpr, DBXCommon;

type
  TWrapControlRepositoryPedidoVenda = class(TBaseControlRepository);
  TControlRepositoryPedidoVenda = class(TInterfacedObject, IMediatorPedidoVenda)
  private
    FSqlGetCache: string;
    FControl: TWrapControlRepositoryPedidoVenda;
    FControlPedidoVendaItem: TControlRepositoryPedidoVendaItem;
    function Data: TdmdDataRepositoryPedidoVenda;
    function GetControlRepositoryPedidoVendaItem: TControlRepositoryPedidoVendaItem;
  protected
     function GetSelectDataset(where: string; const args: array of const):TEntityPedidovenda;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function NextNumeroPedidoVenda: Integer;

    function AddPedidoVenda(entity: TEntityPedidoVenda): Integer;
    function UpdPedidoVenda(entity: TEntityPedidoVenda): Boolean;
    function DelPedidoVenda(pIdPedidoVenda: integer): Boolean;

    function GetPedidoVendaById(pIdPedidoVenda: Integer): TEntityPedidoVenda;
    function GetPedidoVendaByNumero(pNumeroPedidoVenda: Integer): TEntityPedidoVenda;

    property ControlPedidoVendaItem: TControlRepositoryPedidoVendaItem read GetControlRepositoryPedidoVendaItem;

  end;

implementation

{ TControlRepositoryPedidoVenda }

function TControlRepositoryPedidoVenda.AddPedidoVenda(
  entity: TEntityPedidoVenda): Integer;
var
  qry: TSQLQuery;
  res: TEntityPedidoVenda;
  trans: TDBXTransaction;
begin
   qry := Data.qryAddPedidoVenda;
  TConvertRepositoryPedidoVenda.ToParams(entity,qry.Params);

  Trans := qry.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    qry.ExecSQL();

    res := GetPedidoVendaByNumero(entity.numero);
    try
      result := res.id;
    finally
      FreeAndNil(res);
    end;

    if entity.items <> nil then
      ControlPedidoVendaItem.AddPedidoVendaItens( entity.items, result );

    qry.SQLConnection.CommitFreeAndNil(Trans);
  except
    on e: exception do
    begin
      qry.SQLConnection.RollbackFreeAndNil(Trans);
      raise;
    end;
  end;
end;

procedure TControlRepositoryPedidoVenda.AfterConstruction;
begin
  inherited;
  FControl := TWrapControlRepositoryPedidoVenda.Create;
  FSqlGetCache := trim(Data.qryPedidoVendaGet.SQL.Text)+ ' ';
end;

procedure TControlRepositoryPedidoVenda.BeforeDestruction;
begin
  inherited;
  if FControlPedidoVendaItem <> nil then
    FreeAndNil(FControlPedidoVendaItem);
  if FControl <> nil then
    FreeAndNil(FControl);
end;

function TControlRepositoryPedidoVenda.Data: TdmdDataRepositoryPedidoVenda;
begin
  result := TdmdDataRepositoryPedidoVenda(FControl.DM);
end;

function TControlRepositoryPedidoVenda.DelPedidoVenda(
  pIdPedidoVenda: integer): Boolean;
var
  qry: TSQLQuery;
  trans: TDBXTransaction;
begin
  qry := Data.qryAddPedidoVenda;
  qry.Params[0].AsInteger := pIdPedidoVenda;

  Trans := qry.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    ControlPedidoVendaItem.DelPedidoVendaItemByPedidoVenda(pIdPedidoVenda);

    qry.ExecSQL();

    result := qry.RowsAffected > 0;
    qry.SQLConnection.CommitFreeAndNil(Trans);
  except
    on e: exception do
    begin
      qry.SQLConnection.RollbackFreeAndNil(Trans);
      raise;
    end;
  end;
end;

function TControlRepositoryPedidoVenda.GetControlRepositoryPedidoVendaItem: TControlRepositoryPedidoVendaItem;
begin
  if FControlPedidoVendaItem = nil then
    FControlPedidoVendaItem := TControlRepositoryPedidoVendaItem.Create(
      Data.qryAddPedidoVendaItem,
      Data.qryUpdPedidoVendaItem,
      Data.qryPedidoVendaItemDel,
      Data.qryPedidoVendaItemGet
    );

  result := FControlPedidoVendaItem;
end;

function TControlRepositoryPedidoVenda.GetPedidoVendaById(
  pIdPedidoVenda: Integer): TEntityPedidoVenda;
begin
  result := GetSelectDataset('where ped_id=%d',[pIdPedidoVenda]);
end;

function TControlRepositoryPedidoVenda.GetPedidoVendaByNumero(
  pNumeroPedidoVenda: Integer): TEntityPedidoVenda;
begin
  result := GetSelectDataset('where ped_numero=%d',[pNumeroPedidoVenda]);
end;

function TControlRepositoryPedidoVenda.GetSelectDataset(where: string;
  const args: array of const): TEntityPedidovenda;
var
  qry: TSQLQuery;
  sql: string;
begin
  sql := FSqlGetCache + Format(where, args);

  qry := Data.qryPedidoVendaGet;
  qry.Close;
  qry.SQL.Text := sql;
  qry.Open;
  
  try
    result := TConvertRepositoryPedidoVenda.ToEntity(qry);
    if Result.id > 0 then
      result.items := ControlPedidoVendaItem.GetPedidoVendaItemByPedidoVenda(result.id); 
  finally
    qry.Close;
  end;
  
end;

function TControlRepositoryPedidoVenda.NextNumeroPedidoVenda: integer;
var
  qry: TSQLQuery;
begin
  qry := Data.qryNextNumeroPedido;
  qry.Open;

  try
    result := qry.Fields[0].AsInteger;
    if result = 0 then
      result := 1;
  finally
    qry.Close;
  end;
  
end;

function TControlRepositoryPedidoVenda.UpdPedidoVenda(
  entity: TEntityPedidoVenda): Boolean;
var
  qry: TSQLQuery;
  trans: TDBXTransaction;
begin
  qry := Data.qryUpdPedidoVenda;
  TConvertRepositoryPedidoVenda.ToParams(entity,qry.Params);

  Trans := qry.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
  try
    qry.ExecSQL();
    result := qry.RowsAffected > 0;
    qry.SQLConnection.CommitFreeAndNil(Trans);
  except
    on e: exception do
    begin
      qry.SQLConnection.RollbackFreeAndNil(Trans);
      raise;
    end;
  end;
end;

initialization
  RegisterClass(TdmdDataRepositoryPedidoVenda);

end.
