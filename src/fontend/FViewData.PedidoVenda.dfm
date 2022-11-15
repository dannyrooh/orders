object dmdViewDataPedidoVenda: TdmdViewDataPedidoVenda
  OldCreateOrder = False
  Height = 274
  Width = 238
  object dtsItensPedido: TDataSource
    DataSet = cdsItensPedido
    Left = 176
    Top = 96
  end
  object dtsPedido: TDataSource
    DataSet = cdsPedido
    Left = 176
    Top = 40
  end
  object cdsPedido: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsPedidoNewRecord
    Left = 88
    Top = 40
    Data = {
      A00000009619E0BD010000001800000007000000000003000000A00002696404
      00010000000000066E756D65726F040001000000000007656D697373616F0800
      08000000000007636C69656E746504000100000000000C636C69656E74655F6E
      6F6D6501004900000001000557494454480200020080000B76616C6F725F746F
      74616C08000400000000000E636C69656E74655F636F6469676F040001000000
      00000000}
    object cdsPedidoid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsPedidonumero: TIntegerField
      FieldName = 'numero'
    end
    object cdsPedidoemissao: TDateTimeField
      FieldName = 'emissao'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = '!90/00/0000 00:00;1;_'
    end
    object cdsPedidocliente: TIntegerField
      FieldName = 'cliente'
    end
    object cdsPedidocliente_nome: TStringField
      FieldName = 'cliente_nome'
      Size = 128
    end
    object cdsPedidovalor_total: TFloatField
      FieldName = 'valor_total'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsPedidocliente_codigo: TIntegerField
      FieldName = 'cliente_codigo'
      OnSetText = cdsPedidocliente_codigoSetText
      OnValidate = cdsPedidocliente_codigoValidate
    end
  end
  object cdsItensPedido: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    IndexName = 'DEFAULT_ORDER'
    Params = <>
    BeforeDelete = cdsItensPedidoBeforeDelete
    AfterDelete = cdsItensPedidoAfterDelete
    OnNewRecord = cdsItensPedidoNewRecord
    Left = 88
    Top = 96
    Data = {
      C30000009619E0BD010000001800000008000000000003000000C30002696404
      000100000000000973657175656E63696104000100000000000C70656469646F
      5F76656E646104000100000000000770726F6475746F04000100000000000A71
      75616E74696461646508000400000000000E76616C6F725F756E69746172696F
      08000400000000001170726F6475746F5F64657363726963616F010049000000
      010005574944544802000200FA000E70726F6475746F5F636F6469676F040001
      00000000000000}
    object cdsItensPedidoid: TIntegerField
      FieldName = 'id'
    end
    object cdsItensPedidosequencia: TIntegerField
      DisplayLabel = 'Sequ'#234'ncia'
      FieldName = 'sequencia'
    end
    object cdsItensPedidopedido_id: TIntegerField
      FieldName = 'pedido_venda'
    end
    object cdsItensPedidoproduto_id: TIntegerField
      DisplayLabel = 'Produto'
      FieldName = 'produto'
    end
    object cdsItensPedidoquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      OnValidate = cdsItensPedidoquantidadeValidate
      DisplayFormat = '0'
      EditFormat = '0'
    end
    object cdsItensPedidovalor_unitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'valor_unitario'
      OnValidate = cdsItensPedidovalor_unitarioValidate
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsItensPedidovalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldKind = fkInternalCalc
      FieldName = 'valor_total'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsItensPedidoproduto_descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'produto_descricao'
      Size = 250
    end
    object cdsItensPedidoproduto_codigo: TIntegerField
      FieldName = 'produto_codigo'
      OnSetText = cdsItensPedidoproduto_codigoSetText
    end
    object cdsItensPedidoseq: TAggregateField
      FieldName = 'seq'
      KeyFields = 'id'
      Active = True
      Expression = 'max(sequencia)'
    end
    object cdsItensPedidototal: TAggregateField
      FieldName = 'total'
      Active = True
      currency = True
      DisplayFormat = ',0.00'
      Expression = 'sum(valor_total)'
    end
  end
end
