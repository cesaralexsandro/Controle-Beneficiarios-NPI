object form_beneficiarios: Tform_beneficiarios
  Left = 273
  Top = 119
  Width = 1044
  Height = 632
  Caption = 'Cadastro de Benefici'#225'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Label5: TLabel
    Left = 360
    Top = 40
    Width = 312
    Height = 32
    Caption = 'Cadastro de Benefici'#225'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btn_salvar: TBitBtn
    Left = 192
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 0
    OnClick = btn_salvarClick
  end
  object btn_alterar: TBitBtn
    Left = 272
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 1
    OnClick = btn_alterarClick
  end
  object btn_excluir: TBitBtn
    Left = 352
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = btn_excluirClick
  end
  object btn_fechar: TBitBtn
    Left = 928
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
  end
  object dbgrid_beneficiarios: TDBGrid
    Left = 32
    Top = 360
    Width = 481
    Height = 193
    DataSource = ds_beneficiarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgrid_beneficiariosCellClick
  end
  object group_dependentes: TGroupBox
    Left = 552
    Top = 80
    Width = 449
    Height = 217
    Caption = 'Dependentes'
    TabOrder = 5
    object Label6: TLabel
      Left = 24
      Top = 24
      Width = 36
      Height = 14
      Caption = 'C'#243'digo:'
    end
    object Label7: TLabel
      Left = 24
      Top = 64
      Width = 30
      Height = 14
      Caption = 'Nome:'
    end
    object Label8: TLabel
      Left = 24
      Top = 104
      Width = 100
      Height = 14
      Caption = 'Grau de Parentesco:'
    end
    object edit_cod_dependente: TEdit
      Left = 24
      Top = 40
      Width = 121
      Height = 22
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object edit_nome_dependente: TEdit
      Left = 24
      Top = 80
      Width = 201
      Height = 22
      TabOrder = 1
    end
    object cb_parentesco: TComboBox
      Left = 24
      Top = 120
      Width = 153
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 2
      Items.Strings = (
        'Filho(a)'
        'Pai'
        'M'#227'e'
        'Conjug'#234
        'Irm'#227'o(a)'
        'Neto(a)'
        'Outros')
    end
  end
  object group_beneficiarios: TGroupBox
    Left = 48
    Top = 82
    Width = 473
    Height = 215
    Caption = 'Benefici'#225'rios'
    TabOrder = 6
    object Label2: TLabel
      Left = 109
      Top = 80
      Width = 30
      Height = 14
      Caption = 'Nome:'
    end
    object Label1: TLabel
      Left = 104
      Top = 40
      Width = 36
      Height = 14
      Caption = 'Codigo:'
    end
    object Label3: TLabel
      Left = 41
      Top = 113
      Width = 99
      Height = 14
      Caption = 'Data de Nascimento:'
    end
    object Label4: TLabel
      Left = 67
      Top = 145
      Width = 72
      Height = 14
      Caption = 'Valor do plano:'
    end
    object edit_cod: TEdit
      Left = 144
      Top = 32
      Width = 121
      Height = 22
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object edit_nome: TEdit
      Left = 144
      Top = 72
      Width = 217
      Height = 22
      TabOrder = 1
    end
    object edit_data: TEdit
      Left = 144
      Top = 105
      Width = 121
      Height = 22
      TabOrder = 2
    end
    object edit_valor: TEdit
      Left = 144
      Top = 137
      Width = 121
      Height = 22
      TabOrder = 3
      OnEnter = edit_valorEnter
    end
  end
  object dbgrid_dependente: TDBGrid
    Left = 552
    Top = 360
    Width = 449
    Height = 193
    DataSource = ds_dependentes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgrid_dependenteCellClick
  end
  object btn_novo_dependente: TBitBtn
    Left = 648
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 8
    OnClick = btn_novo_dependenteClick
  end
  object btn_salvar_dependente: TBitBtn
    Left = 728
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 9
    OnClick = btn_salvar_dependenteClick
  end
  object btn_editar_dependente: TBitBtn
    Left = 808
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 10
    OnClick = btn_editar_dependenteClick
  end
  object btn_excluir_dependente: TBitBtn
    Left = 888
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 11
    OnClick = btn_excluir_dependenteClick
  end
  object btn_novo: TBitBtn
    Left = 112
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 12
    OnClick = btn_novoClick
  end
  object adoquery_beneficiarios: TADOQuery
    Connection = form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM BENEFICIARIOS ORDER BY ID_BENEFICIARIO')
    Left = 64
    Top = 32
  end
  object ds_beneficiarios: TDataSource
    DataSet = adoquery_beneficiarios
    Left = 32
    Top = 32
  end
  object adoquery_dependentes: TADOQuery
    Connection = form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM DEPENDENTES WHERE ID_BENEFICIARIO = 1')
    Left = 96
    Top = 32
  end
  object ds_dependentes: TDataSource
    DataSet = adoquery_dependentes
    Left = 136
    Top = 32
  end
end
