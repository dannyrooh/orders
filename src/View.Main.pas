unit View.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

type
  TfrmViewMain = class(TForm)
    MainMenu1: TMainMenu;
    Pedido1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EnterVsTab(var ptyMessage: TMsg; var pboHandled: boolean );
  public
    { Public declarations }
  end;

var
  frmViewMain: TfrmViewMain;

implementation

uses
  FView.PedidoVenda;


{$R *.dfm}

procedure TfrmViewMain.EnterVsTab(var ptyMessage: TMsg;
  var pboHandled: boolean);
begin
  if (ptyMessage.message = WM_KEYDOWN)
    and (ptyMessage.wParam = VK_RETURN)
    and (not (Screen.ActiveControl IS TButtonControl))
  then
    Screen.ActiveForm.Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmViewMain.FormCreate(Sender: TObject);
begin
  Application.OnMessage := EnterVsTab;
end;

procedure TfrmViewMain.Pedido1Click(Sender: TObject);
begin
  TfrmViewPedidoVenda.Create(Self).ShowModal;
end;

procedure TfrmViewMain.Sair1Click(Sender: TObject);
begin
  Self.Close;
end;

end.
