object formConsMovimentacao: TformConsMovimentacao
  Left = 0
  Top = 0
  Caption = 'Consulta de Movimenta'#231#245'es'
  ClientHeight = 591
  ClientWidth = 830
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  TextHeight = 17
  object Label4: TLabel
    Left = 32
    Top = 544
    Width = 175
    Height = 20
    Caption = 'Total de Movimenta'#231#245'es:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 213
    Top = 546
    Width = 7
    Height = 17
    Caption = '0'
  end
  object DBGrid1: TDBGrid
    Left = 17
    Top = 192
    Width = 384
    Height = 329
    DataSource = DM.dsSqlMovimentacoes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'TIPO'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataHora'
        Title.Caption = 'DATA / HORA'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'RESPONS'#193'VEL'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 432
    Top = 192
    Width = 385
    Height = 329
    DataSource = DM.dsSqlMovProdutos
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'nomeProduto'
        Title.Caption = 'PRODUTO'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd'
        Title.Caption = 'QUANTIDADE'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 81
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 877
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 298
      Height = 32
      Caption = 'Consultar Movimenta'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 830
    Height = 88
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 877
    object Label2: TLabel
      Left = 17
      Top = 23
      Width = 114
      Height = 17
      Caption = 'Movimenta'#231#245'es de:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 194
      Top = 23
      Width = 22
      Height = 17
      Caption = 'At'#233':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object txtDataInicial: TMaskEdit
      Left = 17
      Top = 46
      Width = 120
      Height = 25
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object txtDataFinal: TMaskEdit
      Left = 194
      Top = 46
      Width = 120
      Height = 25
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object btConsultar: TButton
      Left = 360
      Top = 32
      Width = 177
      Height = 38
      Caption = 'Consultar Movimenta'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btConsultarClick
    end
  end
end
