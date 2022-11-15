object frmViewBuscaPedidoVenda: TfrmViewBuscaPedidoVenda
  Left = 0
  Top = 0
  ActiveControl = edtNumeroPedido
  BorderStyle = bsDialog
  Caption = 'frmViewBuscaPedidoVenda'
  ClientHeight = 252
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 51
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 530
    object Label5: TLabel
      Left = 18
      Top = 16
      Width = 200
      Height = 18
      Caption = 'Buscar de Pedido de Venda'
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
    Top = 201
    Width = 537
    Height = 51
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 194
    ExplicitWidth = 530
    object BitBtn1: TBitBtn
      Left = 438
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BitBtn1Click
      Kind = bkCancel
    end
    object BitBtn2: TBitBtn
      Left = 357
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Confirmar'
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 51
    Width = 537
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 240
    ExplicitTop = 104
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 18
      Top = 14
      Width = 72
      Height = 13
      Caption = 'Pedido N'#250'mero'
    end
    object edtNumeroPedido: TEdit
      Left = 97
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = edtNumeroPedidoKeyPress
    end
    object BitBtn3: TBitBtn
      Left = 240
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Buscar'
      Default = True
      TabOrder = 1
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 92
    Width = 537
    Height = 109
    Align = alClient
    BevelKind = bkSoft
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 40
      Top = 12
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pedido n'#186':'
    end
    object Label3: TLabel
      Left = 53
      Top = 32
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object Label4: TLabel
      Left = 48
      Top = 54
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Emiss'#227'o:'
    end
    object Label6: TLabel
      Left = 56
      Top = 78
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Linhas:'
    end
    object Label7: TLabel
      Left = 158
      Top = 78
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantidade:'
    end
    object Shape1: TShape
      Left = 323
      Top = 30
      Width = 201
      Height = 49
    end
    object lblTotal: TLabel
      Tag = 1
      Left = 467
      Top = 42
      Width = 46
      Height = 25
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPedido: TLabel
      Tag = 1
      Left = 96
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Pedido n'#186':'
    end
    object lblCliente: TLabel
      Tag = 1
      Left = 96
      Top = 32
      Width = 50
      Height = 13
      Caption = 'Pedido n'#186':'
    end
    object lblEmissao: TLabel
      Tag = 1
      Left = 96
      Top = 54
      Width = 50
      Height = 13
      Caption = 'Pedido n'#186':'
    end
    object lblLinhas: TLabel
      Tag = 1
      Left = 96
      Top = 78
      Width = 50
      Height = 13
      Caption = 'Pedido n'#186':'
    end
    object lblQuantidade: TLabel
      Tag = 1
      Left = 224
      Top = 78
      Width = 50
      Height = 13
      Caption = 'Pedido n'#186':'
    end
  end
end
