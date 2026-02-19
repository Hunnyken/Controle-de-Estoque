object DM: TDM
  Height = 483
  Width = 667
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=estoque'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 48
  end
  object tbProdutos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'produto'
    Left = 104
    Top = 48
    object tbProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tbProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
    object tbProdutosfabricante: TStringField
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Required = True
      Size = 50
    end
    object tbProdutosvalidade: TDateField
      FieldName = 'validade'
      Origin = 'validade'
      Required = True
      EditMask = '##/##/####;1;_'
    end
    object tbProdutosestoque_atual: TIntegerField
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
      ReadOnly = True
    end
  end
  object dsProdutos: TDataSource
    DataSet = tbProdutos
    Left = 104
    Top = 112
  end
  object tbMovimentacao: TFDTable
    Active = True
    BeforeDelete = tbMovimentacaoBeforeDelete
    IndexFieldNames = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'movimentacoes'
    Left = 192
    Top = 48
    object tbMovimentacaoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tbMovimentacaotipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
    end
    object tbMovimentacaodataHora: TDateTimeField
      FieldName = 'dataHora'
      Origin = 'dataHora'
      Required = True
    end
    object tbMovimentacaoresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Required = True
      Size = 30
    end
    object tbMovimentacaoobservacoes: TMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Required = True
      BlobType = ftMemo
    end
  end
  object dsMovimentacao: TDataSource
    DataSet = tbMovimentacao
    Left = 192
    Top = 112
  end
  object tbMovProdutos: TFDTable
    Active = True
    AfterPost = tbMovProdutosAfterPost
    BeforeDelete = tbMovProdutosBeforeDelete
    AfterDelete = tbMovProdutosAfterDelete
    IndexName = 'id_movimentacao'
    MasterSource = dsMovimentacao
    MasterFields = 'id'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.movimentacoes_produtos'
    Left = 288
    Top = 48
    object tbMovProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tbMovProdutosid_movimentacao: TIntegerField
      FieldName = 'id_movimentacao'
      Origin = 'id_movimentacao'
      Required = True
    end
    object tbMovProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object tbMovProdutosqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
    end
    object tbMovProdutosnomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tbProdutos
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'id_produto'
      Size = 50
      Lookup = True
    end
  end
  object dsMovProdutos: TDataSource
    DataSet = tbMovProdutos
    Left = 288
    Top = 112
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'UPDATE produto SET estoque_atual = estoque_atual + :pQtd WHERE  ' +
        'id = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 32
    Top = 200
  end
  object sqlDiminuiEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'UPDATE produto SET estoque_atual = estoque_atual - :pQtd where i' +
        'd = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 32
    Top = 264
  end
  object sqlMovimentacoes: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT *FROM movimentacoes')
    Left = 160
    Top = 200
    ParamData = <
      item
        Name = 'pDataInicial'
      end
      item
        Name = 'pDataFinal'
      end>
  end
  object dsSqlMovimentacoes: TDataSource
    DataSet = sqlMovimentacoes
    Left = 160
    Top = 264
  end
  object sqlMovProdutos: TFDQuery
    Active = True
    IndexFieldNames = 'id_movimentacao'
    MasterSource = dsSqlMovimentacoes
    MasterFields = 'id'
    Connection = Conexao
    SQL.Strings = (
      'SELECT *FROM movimentacoes_produtos')
    Left = 280
    Top = 200
    object sqlMovProdutosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object sqlMovProdutosid_movimentacao: TIntegerField
      FieldName = 'id_movimentacao'
      Origin = 'id_movimentacao'
      Required = True
    end
    object sqlMovProdutosid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object sqlMovProdutosqtd: TIntegerField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
    end
    object sqlMovProdutosnomeProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeProduto'
      LookupDataSet = tbProdutos
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'id_produto'
      Size = 50
      Lookup = True
    end
  end
  object dsSqlMovProdutos: TDataSource
    DataSet = sqlMovProdutos
    Left = 280
    Top = 264
  end
end
