object form_login: Tform_login
  Left = 192
  Top = 125
  Width = 1044
  Height = 540
  Caption = 'Login'
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
    Left = 440
    Top = 176
    Width = 37
    Height = 14
    Caption = 'Usuario'
  end
  object Label2: TLabel
    Left = 440
    Top = 216
    Width = 31
    Height = 14
    Caption = 'Senha'
  end
  object edt_usuario: TEdit
    Left = 440
    Top = 192
    Width = 121
    Height = 22
    TabOrder = 0
  end
  object edt_senha: TEdit
    Left = 440
    Top = 232
    Width = 121
    Height = 22
    PasswordChar = '*'
    TabOrder = 1
  end
  object btn_entrar: TBitBtn
    Left = 440
    Top = 264
    Width = 49
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btn_entrarClick
  end
  object btn_fechar: TBitBtn
    Left = 512
    Top = 264
    Width = 49
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
  end
  object adoquery_login: TADOQuery
    Connection = form_menu.ConexaoBD
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'senha'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      
        'Select * from funcionarios where login = :login and senha = :sen' +
        'ha'
      '')
    Left = 768
    Top = 128
  end
end
