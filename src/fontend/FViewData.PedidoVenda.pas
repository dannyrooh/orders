unit FViewData.PedidoVenda;

interface

uses
  Entity.PedidoVenda,
  Entity.PedidoVendaItem,
  Entity.Cliente,
  Control.Cliente,
  Entity.Produto,
  Control.Produto,
  Control.PedidoVenda,
  Convert.PedidoVenda,
  Validate.Pedido,
  Common.Messages,
  Cache.Delete.PedidoVendaItem,
  SysUtils, Classes, DB, DBClient, Variants;

type
  TNotifyCliente = procedure(value: boolean) of object;

  TdmdViewDataPedidoVenda = class(TDataModule)
    dtsItensPedido: TDataSource;
    dtsPedido: TDataSource;
    cdsPedido: TClientDataSet;
    cdsPedidoid: TIntegerField;
    cdsPedidonumero: TIntegerField;
    cdsPedidoemissao: TDateTimeField;
    cdsPedidocliente: TIntegerField;
    cdsPedidocliente_nome: TStringField;
    cdsPedidovalor_total: TFloatField;
    cdsPedidocliente_codigo: TIntegerField;
    cdsItensPedido: TClientDataSet;
    cdsItensPedidoid: TIntegerField;
    cdsItensPedidosequencia: TIntegerField;
    cdsItensPedidopedido_id: TIntegerField;
    cdsItensPedidoproduto_id: TIntegerField;
    cdsItensPedidoquantidade: TFloatField;
    cdsItensPedidovalor_unitario: TFloatField;
    cdsItensPedidovalor_total: TFloatField;
    cdsItensPedidoproduto_descricao: TStringField;
    cdsItensPedidoproduto_codigo: TIntegerField;
    cdsItensPedidoseq: TAggregateField;
    cdsItensPedidototal: TAggregateField;
    procedure cdsPedidoNewRecord(DataSet: TDataSet);
    procedure cdsItensPedidoproduto_codigoSetText(Sender: TField;
      const Text: string);
    procedure cdsItensPedidoNewRecord(DataSet: TDataSet);
    procedure cdsItensPedidoquantidadeValidate(Sender: TField);
    procedure cdsItensPedidovalor_unitarioValidate(Sender: TField);
    procedure cdsItensPedidoBeforeDelete(DataSet: TDataSet);
    procedure cdsItensPedidoAfterDelete(DataSet: TDataSet);
    procedure cdsPedidocliente_codigoValidate(Sender: TField);
    procedure cdsPedidocliente_codigoSetText(Sender: TField;
      const Text: string);
  private
    FControlCliente: TControlCliente;
    FControlProduto: TControlProduto;
    FControlPedidoVenda: TControlPedidoVenda;
    FDeleteSeq: integer;
    FonNotifyCliente: TNotifyCliente;
    FCacheDeletePedidoVendaItem: TCacheDeletePedidoVendaItem;

    function GetBuscarPedido(piNumeroPedido: integer): boolean;
    procedure SetControlCliente(const Value: TControlCliente);
    function GetControlCliente: TControlCliente;
    procedure SetControlProduto(const Value: TControlProduto);
    function GetControlProduto: TControlProduto;
    procedure SetControlPedidoVenda(const Value: TControlPedidoVenda);
    function GetControlPedidoVenda: TControlPedidoVenda;

    procedure AtualizarValorTotalItens;
    procedure AjustarSequenciaExcluida;

    procedure LimparItens;
    procedure SetonNotifyCliente(const Value: TNotifyCliente);
  private
    procedure InitDataset;
  public
    procedure Novo;
    procedure Post;
    procedure Delete;
    procedure Cancelar;
    procedure Load(entity: TEntityPedidoVenda);

    procedure BeforeDestruction; override;
  published
    property ControlCliente: TControlCliente read GetControlCliente write
      SetControlCliente;
    property ControlProduto: TControlProduto read GetControlProduto write
      SetControlProduto;
    property ControlPedidoVenda: TControlPedidoVenda read GetControlPedidoVenda
      write SetControlPedidoVenda;

    property onNotifyCliente: TNotifyCliente read FonNotifyCliente write
      SetonNotifyCliente;
  end;

var
  dmdViewDataPedidoVenda: TdmdViewDataPedidoVenda;

implementation

{$R *.dfm}

{ TdmdViewDataPedidoVenda }

procedure TdmdViewDataPedidoVenda.AjustarSequenciaExcluida;
var
  dataset: TDataSet;
begin
  dataset := dtsItensPedido.DataSet;

  if dataset.IsEmpty then
    Exit;

  try
    dataset.DisableControls;
    dataset.First;
    while not dataset.Eof do
    begin
      if FDeleteSeq < dataset.FieldByName('sequencia').AsInteger then
      begin
        dataset.Edit;
        dataset.FieldByName('sequencia').AsInteger :=
          dataset.FieldByName('sequencia').AsInteger - 1;
        dataset.Post;
      end;
      dataset.Next;
    end;
  finally
    dataset.Locate('sequencia', FDeleteSeq, []);
    dataset.EnableControls;
  end;

end;

procedure TdmdViewDataPedidoVenda.AtualizarValorTotalItens;
begin
  with dtsItensPedido.DataSet do
    FieldByName('valor_total').AsFloat := FieldByName('quantidade').AsFloat *
      FieldByName('valor_unitario').AsFloat;
end;

procedure TdmdViewDataPedidoVenda.BeforeDestruction;
begin
  if FControlCliente <> nil then
    FreeAndNil(FControlCliente);

  if FControlProduto <> nil then
    FreeAndNil(FControlProduto);

  if FControlPedidoVenda <> nil then
    FreeAndNil(FControlPedidoVenda);

  inherited;
end;

procedure TdmdViewDataPedidoVenda.Cancelar;
begin
  if cdsPedido.State in dsEditModes then
    Novo;
end;

procedure TdmdViewDataPedidoVenda.cdsItensPedidoAfterDelete(DataSet: TDataSet);
begin
  AjustarSequenciaExcluida;
end;

procedure TdmdViewDataPedidoVenda.cdsItensPedidoBeforeDelete(DataSet: TDataSet);
begin
  FDeleteSeq := dtsItensPedido.DataSet.FieldByName('sequencia').AsInteger;

  //quando não estiver em mode de inclusão
  if dtsPedido.DataSet.FieldByName('id').AsInteger > 0 then
  begin
    if FCacheDeletePedidoVendaItem = nil then
      FCacheDeletePedidoVendaItem := TCacheDeletePedidoVendaItem.Create;
    FCacheDeletePedidoVendaItem.Add(FDeleteSeq)
  end;
end;

procedure TdmdViewDataPedidoVenda.cdsItensPedidoNewRecord(DataSet: TDataSet);
var
  linSequencia: integer;
begin
  linSequencia := StrToIntDef(VarToStr(cdsItensPedidoseq.Value), 0) + 1;

  DataSet.FieldByName('quantidade').AsFloat := 1;
  DataSet.FieldByName('sequencia').AsInteger := linSequencia;
  DataSet.FieldByName('id').AsInteger := linSequencia * -1;
end;

procedure TdmdViewDataPedidoVenda.cdsItensPedidoproduto_codigoSetText(
  Sender: TField; const Text: string);
var
  entityProduto: TEntityProduto;
  produto_codigo: Integer;

  procedure ClearItens;
  begin
    Sender.Clear;
    Sender.DataSet.FieldByName('produto').Clear;
    Sender.DataSet.FieldByName('produto_descricao').Clear;
    Sender.DataSet.FieldByName('valor_unitario').Clear;
    Sender.DataSet.FieldByName('quantidade').Clear;
  end;

begin
  produto_codigo := StrToIntDef(Text, 0);

  if produto_codigo = 0 then
    ClearItens
  else
  begin
    entityProduto := ControlProduto.GetByCodigo(produto_codigo);
    try
      if entityProduto.id = 0 then
      begin
        ClearItens;
        raise Exception.CreateFmt(FMT_ERRO_PRODUTO_NOT_FOUND, [produto_codigo]);
      end
      else
      begin
        Sender.Asinteger := produto_codigo;

        Sender.DataSet.FieldByName('produto').AsInteger := entityProduto.id;
        Sender.DataSet.FieldByName('produto_descricao').AsString :=
          entityProduto.descricao;
        Sender.DataSet.FieldByName('valor_unitario').AsFloat :=
          entityProduto.preco_venda;
        if Sender.DataSet.FieldByName('quantidade').AsFloat <= 0 then
          Sender.DataSet.FieldByName('quantidade').AsFloat := 1;
      end;
    finally
      FreeAndNil(entityProduto);
    end;
  end;

end;

procedure TdmdViewDataPedidoVenda.cdsItensPedidoquantidadeValidate(
  Sender: TField);
begin
  AtualizarValorTotalItens;
end;

procedure TdmdViewDataPedidoVenda.cdsItensPedidovalor_unitarioValidate(
  Sender: TField);
begin
  AtualizarValorTotalItens;
end;

procedure TdmdViewDataPedidoVenda.cdsPedidocliente_codigoSetText(Sender: TField;
  const Text: string);
var
  entityCliente: TEntityCliente;
  cliente_codigo: Integer;
begin
  cliente_codigo := StrToIntDef(Text, 0);

  if cliente_codigo = 0 then
  begin
    Sender.Clear;
    Sender.DataSet.FieldByName('cliente').Clear;
    Sender.DataSet.FieldByName('cliente_nome').Clear;
  end
  else
  begin
    entityCliente := ControlCliente.GetByCodigo(cliente_codigo);
    try
      if entityCliente.Id = 0 then
      begin
        Sender.Clear;
        Sender.DataSet.FieldByName('cliente').Clear;
        Sender.DataSet.FieldByName('cliente_nome').Clear;
        raise Exception.CreateFmt(FMT_ERRO_CLIENT_NOT_FOUND, [cliente_codigo]);
      end
      else
      begin
        Sender.AsInteger := entityCliente.Codigo;
        Sender.DataSet.FieldByName('cliente').AsInteger := entityCliente.Id;
        Sender.DataSet.FieldByName('cliente_nome').AsString := entityCliente.Nome;
      end;
    finally
      FreeAndNil(entityCliente);
    end;
  end;

end;

procedure TdmdViewDataPedidoVenda.cdsPedidocliente_codigoValidate(
  Sender: TField);
begin
  if Assigned(onNotifyCliente) then
    onNotifyCliente(Sender.AsInteger > 0);
end;

procedure TdmdViewDataPedidoVenda.cdsPedidoNewRecord(DataSet: TDataSet);
begin
  cdsPedidonumero.AsInteger := ControlPedidoVenda.NextNumeroPedidoVenda;
  cdsPedidoemissao.AsDateTime := Now;
  onNotifyCliente(false);
end;

procedure TdmdViewDataPedidoVenda.Delete;
begin

end;

procedure TdmdViewDataPedidoVenda.LimparItens;
begin
  with cdsItensPedido do
    while not IsEmpty do
      cdsItensPedido.Delete;
end;

procedure TdmdViewDataPedidoVenda.Load(entity: TEntityPedidoVenda);
var
  entityCliente: TEntityCliente;
begin
  InitDataset;

  TConvertPedidoVenda.toDataset(entity, cdsPedido, cdsItensPedido);

  if entity.cliente > 0 then
  try
    entityCliente := ControlCliente.GetById(entity.cliente);
    cdsPedido.Edit;
    cdsPedido.FieldByName('cliente_codigo').AsInteger := entityCliente.Codigo;
    cdsPedido.FieldByName('cliente_nome').AsString := entityCliente.Nome;
    cdsPedido.Post;
  finally
    FreeAndNil(entityCliente);
  end;

end;

function TdmdViewDataPedidoVenda.GetBuscarPedido(
  piNumeroPedido: integer): boolean;
var
  entity: TEntityPedidoVenda;
begin
  entity := TEntityPedidoVenda.Create;
  result := Entity.id = 0;

  if result then
  begin
    //abrir pedido

  end;
end;

function TdmdViewDataPedidoVenda.GetControlCliente: TControlCliente;
begin
  if FControlCliente = nil then
    FControlCliente := TControlCliente.Create;
  result := FControlCliente;
end;

function TdmdViewDataPedidoVenda.GetControlPedidoVenda: TControlPedidoVenda;
begin
  if FControlPedidoVenda = nil then
    FControlPedidoVenda := TControlPedidoVenda.Create;
  result := FControlPedidoVenda;
end;

function TdmdViewDataPedidoVenda.GetControlProduto: TControlProduto;
begin
  if FControlProduto = nil then
    FControlProduto := TControlProduto.Create;
  result := FControlProduto;
end;

procedure TdmdViewDataPedidoVenda.InitDataset;
begin
  if not cdsItensPedido.Active then
    cdsItensPedido.Open
  else
    LimparItens;

  cdsPedido.Close;
  cdsPedido.Open;

end;

procedure TdmdViewDataPedidoVenda.Novo;
begin
  InitDataset;
  cdsPedido.Append;
  cdsPedidocliente_codigo.FocusControl;
end;

procedure TdmdViewDataPedidoVenda.Post;
var
  entityPedidoVenda: TEntityPedidoVenda;
begin
  if cdsPedido.State in dsEditModes then
    cdsPedido.Post;

  entityPedidoVenda := TConvertPedidoVenda.ToEntity(cdsPedido);
  entityPedidoVenda.items := TConvertPedidoVenda.item.toList(cdsItensPedido);
  entityPedidoVenda.valor_total := entityPedidoVenda.items.TotalPedido;

  if not TValidatePedido.Exec(entityPedidoVenda) then
    Abort;

  if ControlPedidoVenda.AddPedidoVenda(entityPedidoVenda) > 0 then
    Novo;

end;

procedure TdmdViewDataPedidoVenda.SetControlCliente(
  const Value: TControlCliente);
begin
  FControlCliente := Value;
end;

procedure TdmdViewDataPedidoVenda.SetControlPedidoVenda(
  const Value: TControlPedidoVenda);
begin
  FControlPedidoVenda := Value;
end;

procedure TdmdViewDataPedidoVenda.SetControlProduto(
  const Value: TControlProduto);
begin
  FControlProduto := Value;
end;

procedure TdmdViewDataPedidoVenda.SetonNotifyCliente(
  const Value: TNotifyCliente);
begin
  FonNotifyCliente := Value;
end;

end.
