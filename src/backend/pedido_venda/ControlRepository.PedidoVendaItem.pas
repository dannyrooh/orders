unit ControlRepository.PedidoVendaItem;

interface

uses
  Entity.PedidoVendaItem,
  ConvertRepository.PedidoVendaItem,
  SysUtils, DB, SqlExpr;

type
  TClassControlRepositoryPedidoVendaItem = class of TControlRepositoryPedidoVendaItem;
  TControlRepositoryPedidoVendaItem = class
  private
    FSqlDelCache, FSqlGetCache: string;
    FQryAdd, FQryUpd, FQryDel, FQryGet: TSQLQuery;
  protected
     function Del(where: string; const args: array of const): boolean;
     function Get(where: string; const args: array of const): TDataSet;
  public
     constructor Create(pQryAdd, pQryUpd, pQryDel, pQryGet: TSQLQuery);

     function AddPedidoVendaItem(entity: TEntityPedidoVendaItem): boolean;
     function AddPedidoVendaItens(list: TListPedidoVendaItem; const pIdPedidoVenda: Integer = 0): TClassControlRepositoryPedidoVendaItem;

     function UpdPedidoVendaItem(entity: TEntityPedidoVendaItem): boolean;

     function DelPedidoVendaItemByPedidoVenda(pIdPedidoVenda: integer): boolean;
     function DelPedidoVendaItemBySequencia(pIdPedidoVenda, pSequencia: integer): boolean;

     function GetPedidoVendaItemByPedidoVenda(pIdPedidoVenda: Integer): TListPedidoVendaItem;
     function GetPedidoVendaItem(pPedidoVenda, pSequencia: Integer): TEntityPedidoVendaItem;
  end;

const
  WHERE_PEDIDOVENDA_SEQUENCIA = 'where pit_pedido_venda=%d and pit_sequencia=%d';
  WHERE_PEDIDOVENDA = 'where pit_pedido_venda=%d';

implementation

{ TControlRepositoryPedidoVendaItem }

function TControlRepositoryPedidoVendaItem.AddPedidoVendaItem(
  entity: TEntityPedidoVendaItem): boolean;
begin
  TConvertPedidoVendaItem.ToParams(entity,FQryAdd.Params);
  FQryAdd.ExecSQL();
  result := FQryAdd.RowsAffected > 0;
end;

function TControlRepositoryPedidoVendaItem.AddPedidoVendaItens(
  list: TListPedidoVendaItem; const pIdPedidoVenda: Integer): TClassControlRepositoryPedidoVendaItem;
var
  i: Integer;
begin
  result := TControlRepositoryPedidoVendaItem;

  for i := 0 to list.Count - 1 do
  begin
    if pIdPedidoVenda > 0 then
      list.Items[i].PedidoVenda := pIdPedidoVenda;
    AddPedidoVendaItem(list.Items[i]);
  end;
    
end;

constructor TControlRepositoryPedidoVendaItem.Create(pQryAdd, pQryUpd, pQryDel,
  pQryGet: TSQLQuery);
begin
  FQryAdd := pQryAdd;
  FQryUpd := pQryUpd;
  FQryDel := pQryDel;
  FQryGet := pQryGet;

  FSqlDelCache := FQryDel.SQL.Text + ' ';
  FSqlGetCache := FQryGet.SQL.Text + ' '; 
end;

function TControlRepositoryPedidoVendaItem.Del(where: string;
  const args: array of const): boolean;
begin
  FQryDel.SQL.Text := FSqlDelCache + Format(where, args);
  FQryDel.ExecSQL();
  result := FQryDel.RowsAffected > 0;
end;

function TControlRepositoryPedidoVendaItem.DelPedidoVendaItemBySequencia(
  pIdPedidoVenda, pSequencia: integer): boolean;
begin
  result := Del(WHERE_PEDIDOVENDA_SEQUENCIA,[pIdPedidoVenda, pSequencia]);
end;

function TControlRepositoryPedidoVendaItem.DelPedidoVendaItemByPedidoVenda(
  pIdPedidoVenda: integer): boolean;
begin
  result := Del(WHERE_PEDIDOVENDA,[pIdPedidoVenda]);
end;

function TControlRepositoryPedidoVendaItem.Get(where: string;
  const args: array of const): TDataSet;
begin
  FQryGet.Close;
  FQryGet.SQL.Text := FSqlGetCache + Format(where, args);
  FQryGet.Open;
  result := FQryGet;
end;

function TControlRepositoryPedidoVendaItem.GetPedidoVendaItem(
  pPedidoVenda, pSequencia: Integer): TEntityPedidoVendaItem;
var
  dataset: TDataSet;
begin
  dataset := Get(WHERE_PEDIDOVENDA_SEQUENCIA,[pPedidoVenda, pSequencia]);
  result := TConvertPedidoVendaItem.ToEntity(dataset);
end;

function TControlRepositoryPedidoVendaItem.GetPedidoVendaItemByPedidoVenda(
  pIdPedidoVenda: Integer): TListPedidoVendaItem;
var
  dataset: TDataSet;
begin
  dataset := Get(WHERE_PEDIDOVENDA,[pIdPedidoVenda]);
  result := TConvertPedidoVendaItem.ToList(dataset);
end;

function TControlRepositoryPedidoVendaItem.UpdPedidoVendaItem(
  entity: TEntityPedidoVendaItem): boolean;
begin
  TConvertPedidoVendaItem.ToParams(entity,FQryUpd.Params);
  FQryUpd.ExecSQL();
  result := FQryUpd.RowsAffected > 0;
end;

end.
