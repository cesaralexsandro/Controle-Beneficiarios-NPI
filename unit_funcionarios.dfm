object form_funcionarios: Tform_funcionarios
  Left = 212
  Top = 125
  Width = 1162
  Height = 539
  Caption = 'Cadastro de Funcion'#225'rios'
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
  object Label1: TLabel
    Left = 280
    Top = 112
    Width = 36
    Height = 14
    Caption = 'Codigo:'
  end
  object Label2: TLabel
    Left = 528
    Top = 112
    Width = 30
    Height = 14
    Caption = 'Nome:'
  end
  object Label3: TLabel
    Left = 216
    Top = 144
    Width = 98
    Height = 14
    Caption = 'Data de nascimento:'
  end
  object Label4: TLabel
    Left = 280
    Top = 176
    Width = 36
    Height = 14
    Caption = 'Salario:'
  end
  object Label5: TLabel
    Left = 536
    Top = 144
    Width = 29
    Height = 14
    Caption = 'Login:'
  end
  object Label6: TLabel
    Left = 530
    Top = 176
    Width = 34
    Height = 14
    Caption = 'Senha:'
  end
  object Label7: TLabel
    Left = 360
    Top = 32
    Width = 299
    Height = 32
    Caption = 'Cadastro de Funcionario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edit_cod: TEdit
    Left = 320
    Top = 104
    Width = 81
    Height = 22
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object edit_nome: TEdit
    Left = 568
    Top = 104
    Width = 257
    Height = 22
    TabOrder = 1
  end
  object edit_data: TEdit
    Left = 320
    Top = 136
    Width = 81
    Height = 22
    TabOrder = 2
  end
  object edit_salario: TEdit
    Left = 320
    Top = 168
    Width = 81
    Height = 22
    TabOrder = 3
    OnEnter = edit_salarioEnter
  end
  object edit_login: TEdit
    Left = 568
    Top = 136
    Width = 121
    Height = 22
    TabOrder = 4
  end
  object edit_senha: TEdit
    Left = 568
    Top = 168
    Width = 121
    Height = 22
    TabOrder = 5
  end
  object edit_novo: TBitBtn
    Left = 48
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 6
    OnClick = edit_novoClick
  end
  object edit_salvar: TBitBtn
    Left = 128
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = edit_salvarClick
  end
  object edit_alterar: TBitBtn
    Left = 208
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 8
    OnClick = edit_alterarClick
  end
  object edit_excluir: TBitBtn
    Left = 288
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 9
    OnClick = edit_excluirClick
  end
  object edit_fechar: TBitBtn
    Left = 368
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 10
    OnClick = edit_fecharClick
  end
  object dbgrid_funcionarios: TDBGrid
    Left = 32
    Top = 232
    Width = 1097
    Height = 169
    DataSource = ds_funcionarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgrid_funcionariosCellClick
  end
  object adoquery_funcionarios: TADOQuery
    Connection = form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from funcionarios order by id_funcionario')
    Left = 776
    Top = 32
  end
  object ds_funcionarios: TDataSource
    DataSet = adoquery_funcionarios
    Left = 808
    Top = 32
  end
end
