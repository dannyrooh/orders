object dmdDataRepositoryPedidoVenda: TdmdDataRepositoryPedidoVenda
  OldCreateOrder = False
  Height = 339
  Width = 430
  object qryAddPedidoVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'cliente'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'numero'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'emissao'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_total'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'insert into pedido_venda(ped_cliente, ped_numero, ped_emissao, p' +
        'ed_valor_total)'
      'values( :cliente , :numero, :emissao , :valor_total )')
    SQLConnection = dmdDataMain.conexao
    Left = 64
    Top = 48
  end
  object qryUpdPedidoVenda: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'emissao'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_total'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update pedido_venda'
      '   set ped_emissao = :emissao,'
      '       ped_valor_total = :valor_total '
      ' where ped_id = :id')
    SQLConnection = dmdDataMain.conexao
    Left = 64
    Top = 112
  end
  object qryPedidoVendaGet: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '   ped_id, '
      '   ped_cliente,'
      '   ped_numero,'
      '   ped_emissao,'
      '   ped_valor_total'
      '  from pedido_venda')
    SQLConnection = dmdDataMain.conexao
    Left = 64
    Top = 176
  end
  object qryAddPedidoVendaItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pedido_venda'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sequencia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_unitario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_total'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'insert into pedido_venda_item('
      '  pit_pedido_venda,'
      '  pit_produto,'
      '  pit_sequencia,'
      '  pit_quantidade,'
      '  pit_valor_unitario,'
      '  pit_valor_total )'
      'values('
      '  :pedido_venda,'
      '  :produto,'
      '  :sequencia,'
      '  :quantidade,'
      '  :valor_unitario,'
      '  :valor_total'
      ')')
    SQLConnection = dmdDataMain.conexao
    Left = 200
    Top = 48
  end
  object qryUpdPedidoVendaItem: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'pedido_venda'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'produto'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'sequencia'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'quantidade'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_unitario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valor_total'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update pedido_venda_item set'
      '  pit_pedido_venda = :pedido_venda,'
      '  pit_produto = :produto,'
      '  pit_sequencia = :sequencia,'
      '  pit_quantidade = :quantidade,'
      '  pit_valor_unitario = :valor_unitario,'
      '  pit_valor_total = :valor_total'
      'where pit_id = :id')
    SQLConnection = dmdDataMain.conexao
    Left = 200
    Top = 112
  end
  object qryPedidoVendaItemGet: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select'
      '  pit_id,'
      '  pit_pedido_venda,'
      '  pit_produto,'
      '  pit_sequencia,'
      '  pit_quantidade,'
      '  pit_valor_unitario,'
      '  pit_valor_total'
      ' from pedido_venda_item'
      '')
    SQLConnection = dmdDataMain.conexao
    Left = 200
    Top = 176
  end
  object qryNextNumeroPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select (max(ped_numero) + 1) numero from pedido_venda ')
    SQLConnection = dmdDataMain.conexao
    Left = 336
    Top = 48
  end
  object qryPedidoVendaDel: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from pedido_venda where pro_id = :id')
    SQLConnection = dmdDataMain.conexao
    Left = 56
    Top = 256
  end
  object qryPedidoVendaItemDel: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'delete from pedido_venda_item')
    SQLConnection = dmdDataMain.conexao
    Left = 208
    Top = 256
  end
end
