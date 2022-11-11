unit FView.ItensPedidoVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TfrmViewItensPedidoVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
  private
    { Private declarations }
  public
    class procedure IncluirItens;
  end;

implementation

{$R *.dfm}

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
begin
  frmViewItensPedidoVenda := TfrmViewItensPedidoVenda.Create(Application.MainForm);
  try
    frmViewItensPedidoVenda.ShowModal;
  finally
    FreeAndNil(frmViewItensPedidoVenda);
  end;
end;

end.
