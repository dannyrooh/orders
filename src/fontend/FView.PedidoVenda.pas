unit FView.PedidoVenda;

interface

uses
  FViewData.PedidoVenda,
  FView.ItensPedidoVenda,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Db,
  Dialogs, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, Mask, DBCtrls, ActnList;

type
  TfrmViewPedidoVenda = class(TForm)
    pnlHeaderPedidoVenda: TPanel;
    pnlFooterPedidoVenda: TPanel;
    pnlPedidoVenda: TPanel;
    pnlItens: TPanel;
    grdItens: TDBGrid;
    btnovo: TButton;
    btnBuscar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    SpeedButton1: TSpeedButton;
    pnlTotal: TPanel;
    ldbTotal: TDBText;
    btnGravar: TButton;
    btnFechar: TButton;
    actPedidos: TActionList;
    actFechar: TAction;
    actNovo: TAction;
    actPost: TAction;
    btnInserirItens: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNovoExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actPostExecute(Sender: TObject);
    procedure btnInserirItensClick(Sender: TObject);
  private
    FViewDataPedidoVenda: TdmdViewDataPedidoVenda;
    procedure HabilitarIncluirItens(value: boolean);
  public

  end;

var
  frmViewPedidoVenda: TfrmViewPedidoVenda;

implementation

{$R *.dfm}

procedure TfrmViewPedidoVenda.actFecharExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmViewPedidoVenda.actNovoExecute(Sender: TObject);
begin
  FViewDataPedidoVenda.Novo;
end;

procedure TfrmViewPedidoVenda.actPostExecute(Sender: TObject);
begin
  FViewDataPedidoVenda.Post;

end;

procedure TfrmViewPedidoVenda.btnInserirItensClick(Sender: TObject);
begin
  if not (FViewDataPedidoVenda.cdsItensPedido.State in dsEditModes) then
    FViewDataPedidoVenda.cdsItensPedido.Append;

  TfrmViewItensPedidoVenda.IncluirItens;
end;

procedure TfrmViewPedidoVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmViewPedidoVenda.FormCreate(Sender: TObject);
begin
  FViewDataPedidoVenda := TdmdViewDataPedidoVenda.Create(Self);
  FViewDataPedidoVenda.onNotifyAddItens := HabilitarIncluirItens;
end;

procedure TfrmViewPedidoVenda.FormDestroy(Sender: TObject);
begin
  if FViewDataPedidoVenda <> nil then
    FreeAndNil(FViewDataPedidoVenda);
end;

procedure TfrmViewPedidoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  dataset: Tdataset;
begin
  if (Key = VK_INSERT) and (ssCtrl in Shift) then
    TfrmViewItensPedidoVenda.IncluirItens
  else if Key = VK_ESCAPE then
  begin
    dataset := grdItens.DataSource.DataSet;

    if dataset.State in dsEditModes then
      dataset.Cancel
    else
      Self.Close;
  end;

end;

procedure TfrmViewPedidoVenda.HabilitarIncluirItens(value: boolean);
begin
  btnInserirItens.Visible := value;
end;

end.
