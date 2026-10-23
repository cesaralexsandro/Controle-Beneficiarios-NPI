unit unit_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  Tform_login = class(TForm)
    Label1: TLabel;
    edt_usuario: TEdit;
    Label2: TLabel;
    edt_senha: TEdit;
    btn_entrar: TBitBtn;
    btn_fechar: TBitBtn;
    adoquery_login: TADOQuery;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_entrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_login: Tform_login;

implementation

uses unit_menu;

{$R *.dfm}

procedure Tform_login.btn_fecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tform_login.btn_entrarClick(Sender: TObject);
begin

 if (edt_usuario.Text = '') or (edt_senha.Text = '') then
  begin
    ShowMessage('Login ou senha incorretos!');
  exit;
  end;

  adoquery_login.Close;
  adoquery_login.SQL.Clear;

  adoquery_login.SQL.Add('SELECT * FROM FUNCIONARIOS');
  adoquery_login.SQL.Add('WHERE LOGIN = :login and SENHA = :senha');



  adoquery_login.Parameters.ParamByName('login').Value := edt_usuario.Text;
  adoquery_login.Parameters.ParamByName('senha').Value := edt_senha.Text;

  adoquery_login.Open;

  if not adoquery_login.IsEmpty then
  begin
  form_menu.lbl_usuario.Caption := 'Usuario:' + adoquery_login.fieldbyname('nome').AsString;
  
  showmessage('Login realizado com sucesso!');
  form_menu.Show;
  close;
  end
  else
  begin
  showmessage('Login ou senha incorreto!');

  edt_senha.Clear;
  edt_senha.SetFocus;
end;
end;
end.
