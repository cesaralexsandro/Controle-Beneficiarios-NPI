object form_relatorios: Tform_relatorios
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Relat'#243'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 416
    Top = 32
    Width = 181
    Height = 32
    Caption = 'RELAT'#211'RIOS '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btn_relatorio_beneficiarios: TBitBtn
    Left = 432
    Top = 120
    Width = 145
    Height = 25
    Caption = 'Relat'#243'rio de Benefici'#225'rios'
    TabOrder = 0
    OnClick = btn_relatorio_beneficiariosClick
  end
  object btn_relatorio_dependentes: TBitBtn
    Left = 432
    Top = 152
    Width = 145
    Height = 25
    Caption = 'Relat'#243'rio de Dependentes'
    TabOrder = 1
    OnClick = btn_relatorio_dependentesClick
  end
  object btn_fechar: TBitBtn
    Left = 472
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object adoquery_rel_beneficiarios: TADOQuery
    Connection = form_menu.ConexaoBD
    Parameters = <>
    SQL.Strings = (
      'SELECT'#10
      '  id_beneficiario,'#10
      '  nome,'#10
      '  data_nascimento,'#10
      '  valor_plano'#10
      'FROM BENEFICIARIOS'#10
      'ORDER BY nome')
    Left = 792
    Top = 112
  end
  object rvProject: TRvProject
    ProjectFile = 'C:\Users\NpiDEV04\Desktop\Controle Beneficiarios\Relatorios.rav'
    Left = 832
    Top = 112
  end
  object rvBeneficiarios: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_rel_beneficiarios
    Left = 872
    Top = 112
  end
  object adoquery_rel_dependentes: TADOQuery
    Connection = form_menu.ConexaoBD
    Parameters = <>
    SQL.Strings = (
      'SELECT'#10
      '    B.id_beneficiario,'#10
      '    B.nome AS beneficiario,'#10
      '    D.id_dependente,'#10
      '    D.nome AS dependente,'#10
      '    D.grau_parentesco'#10
      'FROM BENEFICIARIOS B'#10
      'INNER JOIN DEPENDENTES D'#10
      '    ON D.id_beneficiario = B.id_beneficiario'#10
      'ORDER BY B.nome, D.nome')
    Left = 792
    Top = 160
  end
  object rvDependentes: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_rel_dependentes
    Left = 832
    Top = 160
  end
end
