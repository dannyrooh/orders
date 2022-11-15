unit FViewBusca.PedidoVenda;

interface

uses
  Constantes.FrontEnd,
  Dialog.Message,

  Control.PedidoVenda,
  Entity.PedidoVenda,

  Control.Cliente,
  Entity.Cliente,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmViewBuscaPedidoVenda = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    edtNumeroPedido: TEdit;
    BitBtn3: TBitBtn;
    pnlBody: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    lblTotal: TLabel;
    lblPedido: TLabel;
    lblCliente: TLabel;
    lblEmissao: TLabel;
    lblLinhas: TLabel;
    lblQuantidade: TLabel;
    procedure edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEntityPedidoVenda: TEntityPedidoVenda;
    FControlPedidoVenda: TControlPedidoVenda;
    FControlCliente: TControlCliente;

    procedure ClearBody;
  public
    class function ShowExec(
      pControlPedidoVenda: TControlPedidoVenda;
      pControlCliente: TControlCliente;
      out pEntityPedidoVenda: TEntityPedidoVenda ): boolean;
  end;


implementation

{$R *.dfm}

procedure TfrmViewBuscaPedidoVenda.BitBtn1Click(Sender: TObject);
begin
  if FEntityPedidoVenda <> nil then
    FreeAndNil(FEntityPedidoVenda);
end;

procedure TfrmViewBuscaPedidoVenda.BitBtn3Click(Sender: TObject);
var
  numeroPedido, i: integer;
  qtd: Double;
  entityCliente: TEntityCliente;
begin
  numeroPedido := StrToIntDef(edtNumeroPedido.Text, 0);

  if numeroPedido <= 0 then
  begin
    TDialogMessage.Aviso(MSG_BUSCA_INFORME_PEDIDO);
    edtNumeroPedido.SetFocus;
    Exit;
  end;

  FEntityPedidoVenda := FControlPedidoVenda.GetPedidoVendaByNumero(numeroPedido);

  if FEntityPedidoVenda.numero <= 0 then
  begin
    TDialogMessage.Aviso(MSG_BUSCA_PEDIDO_NOT_FOUND);
    edtNumeroPedido.SetFocus;
    ClearBody;
    Exit;
  end;

  lblPedido.Caption := IntToStr(FEntityPedidoVenda.numero);

  try
    entityCliente := FControlCliente.GetById(FEntityPedidoVenda.cliente);
    lblCliente.Caption := IntToStr(entityCliente.Codigo) + ' - ' + entityCliente.Nome;
  finally
    FreeAndNil(entityCliente);
  end;

  lblEmissao.Caption := FormatDateTime('dd/mm/yyyy hh:mm', FEntityPedidoVenda.emissao);
  lblLinhas.Caption := IntToStr(FEntityPedidoVenda.items.Count);
  lblTotal.Caption := FormatFloat(',0.00', FEntityPedidoVenda.valor_total);

  qtd := 0;
  for i := 0 to FEntityPedidoVenda.items.Count - 1 do
    qtd := qtd + FEntityPedidoVenda.items.Items[i].Quantidade;

  lblQuantidade.Caption := FormatFloat(',0.00', qtd);
end;

procedure TfrmViewBuscaPedidoVenda.ClearBody;
var
  i: integer;
begin
  for i := 0 to pnlBody.ControlCount -1 do
   if pnlBody.Controls[i].Tag = 1 then
     TLabel(pnlBody.Controls[i]).Caption := EmptyStr;
end;

procedure TfrmViewBuscaPedidoVenda.edtNumeroPedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #9, #10, #13]) then
    Key := #0;
end;

procedure TfrmViewBuscaPedidoVenda.FormCreate(Sender: TObject);
begin
  ClearBody;
end;

class function TfrmViewBuscaPedidoVenda.ShowExec(
  pControlPedidoVenda: TControlPedidoVenda;
  pControlCliente: TControlCliente;
  out pEntityPedidoVenda: TEntityPedidoVenda): boolean;
var
  frmViewBuscaPedidoVenda : TfrmViewBuscaPedidoVenda;
begin
  frmViewBuscaPedidoVenda := TfrmViewBuscaPedidoVenda.Create(Application.MainForm);
  with frmViewBuscaPedidoVenda do
  try
    FControlPedidoVenda := pControlPedidoVenda;
    FControlCliente := pControlCliente;
    result := (ShowModal = mrOk) and (FEntityPedidoVenda <> nil) ;
    if result then
      pEntityPedidoVenda := FEntityPedidoVenda
  finally
    FreeAndNil(frmViewBuscaPedidoVenda);
  end;
end;

end.
