object dmdDataRepositoryCliente: TdmdDataRepositoryCliente
  OldCreateOrder = False
  Height = 311
  Width = 365
  object qryClienteGet: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select  cli_id, cli_codigo, cli_nome, cli_cidade, cli_uf from cl' +
        'iente')
    SQLConnection = dmdDataMain.conexao
    Left = 56
    Top = 32
  end
  object qryClienteIns: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'cli_codigo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cli_nome'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cli_cidade'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cli_uf'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'insert into cliente(cli_codigo, cli_nome, cli_cidade, cli_uf) va' +
        'lues(:cli_codigo, :cli_nome, :cli_cidade, :cli_uf)')
    SQLConnection = dmdDataMain.conexao
    Left = 56
    Top = 96
  end
  object qryClienteUpd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'cli_codigo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cli_nome'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cli_cidade'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cli_uf'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'cli_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'update cliente '#10' '
      
        '      set cli_codigo = :cli_codigo, cli_nome = :cli_nome, cli_ci' +
        'dade = :cli_cidade, cli_uf = :cli_uf'
      ' '#10'where cli_id = :cli_id')
    SQLConnection = dmdDataMain.conexao
    Left = 56
    Top = 168
  end
  object qryClienteDel: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'cli_id'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'delete from cliente where cli_id = :cli_id')
    SQLConnection = dmdDataMain.conexao
    Left = 56
    Top = 232
  end
end
