object frmViewItensPedidoVenda: TfrmViewItensPedidoVenda
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Itens do Pedido de Venda'
  ClientHeight = 245
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 313
    Top = 123
    Width = 201
    Height = 49
  end
  object Label1: TLabel
    Left = 42
    Top = 70
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sequ'#234'ncia:'
  end
  object Label2: TLabel
    Left = 53
    Top = 97
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Produto:'
  end
  object Label4: TLabel
    Left = 35
    Top = 126
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Quantidade:'
  end
  object Label3: TLabel
    Left = 27
    Top = 154
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor Unit'#225'rio:'
  end
  object DBText1: TDBText
    Left = 411
    Top = 134
    Width = 90
    Height = 25
    Alignment = taRightJustify
    AutoSize = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 51
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 527
    object Label5: TLabel
      Left = 18
      Top = 16
      Width = 206
      Height = 17
      Caption = 'Inclus'#227'o de Itens do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 194
    Width = 530
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 184
    ExplicitWidth = 527
    object BitBtn1: TBitBtn
      Left = 438
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 357
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 0
      Kind = bkOK
    end
  end
  object DBEdit1: TDBEdit
    Left = 101
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 101
    Top = 95
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 228
    Top = 95
    Width = 285
    Height = 21
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 101
    Top = 123
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 101
    Top = 151
    Width = 121
    Height = 21
    TabOrder = 6
  end
end
