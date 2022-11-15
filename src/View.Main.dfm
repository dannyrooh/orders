object frmViewMain: TfrmViewMain
  Left = 0
  Top = 0
  Caption = 'Orders - Pedidos de Vendas'
  ClientHeight = 719
  ClientWidth = 1126
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 560
    Top = 368
    object Pedido1: TMenuItem
      Caption = 'Pedido'
      OnClick = Pedido1Click
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      OnClick = Sair1Click
    end
  end
end
