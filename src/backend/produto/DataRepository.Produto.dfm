object dmdDataRepositoryProduto: TdmdDataRepositoryProduto
  OldCreateOrder = False
  Height = 283
  Width = 389
  object qryProdutoGet: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'select pro_id, pro_codigo, pro_descricao, pro_preco_venda from p' +
        'roduto')
    SQLConnection = dmdDataMain.conexao
    Left = 72
    Top = 24
  end
end
