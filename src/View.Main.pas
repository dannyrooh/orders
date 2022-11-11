unit View.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmViewMain = class(TForm)
    MainMenu1: TMainMenu;
    Pedido1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewMain: TfrmViewMain;

implementation

uses
  FView.PedidoVenda;


{$R *.dfm}

procedure TfrmViewMain.Pedido1Click(Sender: TObject);
begin
  TfrmViewPedidoVenda.Create(Self).ShowModal;
end;

procedure TfrmViewMain.Sair1Click(Sender: TObject);
begin
  Self.Close;
end;

end.
