object frmViewPedidoVenda: TfrmViewPedidoVenda
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmViewPedidoVenda - Pedido Venda'
  ClientHeight = 542
  ClientWidth = 866
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeaderPedidoVenda: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 49
    Align = alTop
    TabOrder = 0
    object btnovo: TButton
      Left = 4
      Top = 3
      Width = 109
      Height = 40
      Action = actNovo
      TabOrder = 0
    end
    object btnBuscar: TButton
      Left = 119
      Top = 3
      Width = 109
      Height = 40
      Caption = '&Buscar (F3)'
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 234
      Top = 3
      Width = 109
      Height = 40
      Caption = 'Cancelar (f4)'
      TabOrder = 2
    end
  end
  object pnlFooterPedidoVenda: TPanel
    Left = 0
    Top = 489
    Width = 866
    Height = 53
    Align = alBottom
    TabOrder = 1
    object btnGravar: TButton
      Left = 616
      Top = 6
      Width = 118
      Height = 40
      Action = actPost
      TabOrder = 0
    end
    object btnFechar: TButton
      Left = 740
      Top = 7
      Width = 109
      Height = 40
      Action = actFechar
      TabOrder = 1
    end
  end
  object pnlPedidoVenda: TPanel
    Left = 0
    Top = 49
    Width = 866
    Height = 80
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 36
      Top = 16
      Width = 77
      Height = 13
      Alignment = taRightJustify
      Caption = 'PedIdo n'#250'mero:'
    end
    object Label2: TLabel
      Left = 269
      Top = 16
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Emiss'#227'o:'
    end
    object Label3: TLabel
      Left = 76
      Top = 47
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object SpeedButton1: TSpeedButton
      Left = 519
      Top = 44
      Width = 23
      Height = 22
      Caption = '...'
    end
    object DBEdit1: TDBEdit
      Left = 119
      Top = 13
      Width = 121
      Height = 21
      DataField = 'numero'
      DataSource = dmdViewDataPedidoVenda.dstPedido
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 343
      Top = 13
      Width = 121
      Height = 21
      DataField = 'emissao'
      DataSource = dmdViewDataPedidoVenda.dstPedido
      MaxLength = 16
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 119
      Top = 44
      Width = 121
      Height = 21
      DataField = 'cliente_id'
      DataSource = dmdViewDataPedidoVenda.dstPedido
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 246
      Top = 44
      Width = 267
      Height = 21
      TabStop = False
      DataField = 'cliente_nome'
      DataSource = dmdViewDataPedidoVenda.dstPedido
      TabOrder = 3
    end
  end
  object pnlItens: TPanel
    Left = 0
    Top = 129
    Width = 866
    Height = 360
    Align = alClient
    Caption = 'pnlHeaderPedidoVenda'
    TabOrder = 3
    object grdItens: TDBGrid
      Left = 1
      Top = 1
      Width = 864
      Height = 317
      Align = alClient
      DataSource = dmdViewDataPedidoVenda.dtsItensPedido
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'sequencia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto_codigo'
          Title.Caption = 'C'#243'digo'
          Width = 72
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'produto_descricao'
          Width = 382
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Quanitdade'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          Width = 116
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'valor_total'
          ReadOnly = True
          Title.Caption = 'Total'
          Width = 109
          Visible = True
        end>
    end
    object pnlTotal: TPanel
      Left = 1
      Top = 318
      Width = 864
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ldbTotal: TDBText
        AlignWithMargins = True
        Left = 825
        Top = 12
        Width = 4
        Height = 18
        Alignment = taRightJustify
        AutoSize = True
        DataField = 'total'
        DataSource = dmdViewDataPedidoVenda.dtsItensPedido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object actPedidos: TActionList
    Left = 40
    Top = 216
    object actFechar: TAction
      Caption = '&Fechar (ESC)'
      Hint = 'Fechar tela de pedido'
      OnExecute = actFecharExecute
    end
    object actNovo: TAction
      Caption = 'Novo (F12)'
      ShortCut = 123
      OnExecute = actNovoExecute
    end
    object actPost: TAction
      Caption = '&Gravar'
      ShortCut = 16397
      OnExecute = actPostExecute
    end
  end
end
