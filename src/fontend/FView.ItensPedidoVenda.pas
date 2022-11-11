unit FView.ItensPedidoVenda;

interface

uses
  Entity.PedidoVendaItem,
  Convert.PedidoVendaItem,
  Validate.Pedido,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB;

type
  TfrmViewItensPedidoVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    edtProduto: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    DBText1: TDBText;
    Shape1: TShape;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure IncluirItens;
  end;

implementation

{$R *.dfm}

procedure TfrmViewItensPedidoVenda.BitBtn2Click(Sender: TObject);
var
  dataset: TDataSet;
  entity: TEntityPedidoVendaItem;
begin
  dataset := edtProduto.DataSource.DataSet;
  entity := TConvertPedidoVendaItem.toEntity(dataset);

  //fecha a tela
  if entity.Produto = 0 then
    dataset.Cancel
  else
    if TValidatePedido.Items.Exec(entity) then
    begin
      dataset.Post;
      ModalResult := mrNone;
      dataset.Append;
      dataset.FieldByName('produto_codigo').FocusControl;
    end;
end;

procedure TfrmViewItensPedidoVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmViewItensPedidoVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

class procedure TfrmViewItensPedidoVenda.IncluirItens;
var
  frmViewItensPedidoVenda: TfrmViewItensPedidoVenda;
  i: integer;
  c: TControl;
begin
  frmViewItensPedidoVenda := TfrmViewItensPedidoVenda.Create(Application.MainForm);
  try
    frmViewItensPedidoVenda.ShowModal;
  finally
    FreeAndNil(frmViewItensPedidoVenda);
  end;
end;

end.
