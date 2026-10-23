unit unit_funcionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Buttons, Grids, DBGrids, Mask;

type
  Tform_funcionarios = class(TForm)
    Label1: TLabel;
    edit_cod: TEdit;
    Label2: TLabel;
    edit_nome: TEdit;
    Label3: TLabel;
    edit_data: TEdit;
    Label4: TLabel;
    edit_salario: TEdit;
    Label5: TLabel;
    edit_login: TEdit;
    Label6: TLabel;
    edit_senha: TEdit;
    edit_novo: TBitBtn;
    edit_salvar: TBitBtn;
    edit_alterar: TBitBtn;
    edit_excluir: TBitBtn;
    edit_fechar: TBitBtn;
    adoquery_funcionarios: TADOQuery;
    dbgrid_funcionarios: TDBGrid;
    ds_funcionarios: TDataSource;
    Label7: TLabel;
    procedure edit_novoClick(Sender: TObject);
    procedure edit_salvarClick(Sender: TObject);
    procedure edit_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrid_funcionariosCellClick(Column: TColumn);
    procedure edit_alterarClick(Sender: TObject);
    procedure edit_excluirClick(Sender: TObject);
    procedure edit_salarioEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_funcionarios: Tform_funcionarios;

implementation

uses unit_menu;

{$R *.dfm}

procedure Tform_funcionarios.edit_novoClick(Sender: TObject);
begin
  edit_cod.Clear;
  edit_nome.Clear;
  edit_data.Clear;

  edit_salario.Text := 'R$ ';

  edit_login.Clear;
  edit_senha.Clear;

  edit_nome.SetFocus;
end;

procedure Tform_funcionarios.edit_salvarClick(Sender: TObject);
begin
  { Verifica campos vazios }
  if (edit_nome.Text = '') or
     (edit_data.Text = '') or
     (edit_salario.Text = '') or
     (edit_login.Text = '') or
     (edit_senha.Text = '') then
  begin
    ShowMessage('Preencha todos os campos!');
    Exit;
  end;

  { Verifica se o login já existe }
  adoquery_funcionarios.Close;
  adoquery_funcionarios.SQL.Clear;

  adoquery_funcionarios.SQL.Text :=
    'SELECT id_funcionario FROM FUNCIONARIOS ' +
    'WHERE login = :login';

  adoquery_funcionarios.Parameters.ParamByName('login').Value :=
    edit_login.Text;

  adoquery_funcionarios.Open;

  if not adoquery_funcionarios.IsEmpty then
  begin
    ShowMessage('Este login já está cadastrado!');
    edit_login.SetFocus;
    Exit;
  end;

  { Faz o INSERT }
  adoquery_funcionarios.Close;
  adoquery_funcionarios.SQL.Clear;

  adoquery_funcionarios.SQL.Text :=
    'INSERT INTO FUNCIONARIOS ' +
    '(nome, data_nascimento, salario, login, senha) ' +
    'VALUES (:nome, :nascimento, :salario, :login, :senha)';

  adoquery_funcionarios.Parameters.ParamByName('nome').Value :=
    edit_nome.Text;

  adoquery_funcionarios.Parameters.ParamByName('nascimento').Value :=
    edit_data.Text;

 adoquery_funcionarios.Parameters.ParamByName('salario').Value :=
  StrToFloat(
    StringReplace(edit_salario.Text, 'R$ ', '', [rfReplaceAll])
  );

  adoquery_funcionarios.Parameters.ParamByName('login').Value :=
    edit_login.Text;

  adoquery_funcionarios.Parameters.ParamByName('senha').Value :=
    edit_senha.Text;

  adoquery_funcionarios.ExecSQL;

  { Atualiza o Grid }
  adoquery_funcionarios.Close;
  adoquery_funcionarios.SQL.Clear;
  adoquery_funcionarios.SQL.Text :=
    'SELECT * FROM FUNCIONARIOS';
  adoquery_funcionarios.Open;

  ShowMessage('Funcionário cadastrado com sucesso!');

  { Limpa os campos }
  edit_cod.Clear;
  edit_nome.Clear;
  edit_data.Clear;
  edit_salario.Text := 'R$ ';
  edit_login.Clear;
  edit_senha.Clear;
end;

procedure Tform_funcionarios.edit_fecharClick(Sender: TObject);
begin
  if MessageDlg('Deseja fechar o cadastro de funcionários?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Close;
  end;
end;

procedure Tform_funcionarios.FormShow(Sender: TObject);
begin
  adoquery_funcionarios.Open;
end;

procedure Tform_funcionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  adoquery_funcionarios.Close;
end;

procedure Tform_funcionarios.dbgrid_funcionariosCellClick(Column: TColumn);
begin
 edit_cod.Text :=
  adoquery_funcionarios.FieldByName('id_funcionario').AsString;

edit_nome.Text :=
  adoquery_funcionarios.FieldByName('nome').AsString;

edit_data.Text :=
  adoquery_funcionarios.FieldByName('data_nascimento').AsString;

edit_salario.Text :=
  'R$ ' + FormatFloat('0.00',
    adoquery_funcionarios.FieldByName('salario').AsFloat);

edit_login.Text :=
  adoquery_funcionarios.FieldByName('login').AsString;

edit_senha.Text :=
  adoquery_funcionarios.FieldByName('senha').AsString;

end;

procedure Tform_funcionarios.edit_alterarClick(Sender: TObject);
begin
  adoquery_funcionarios.Close;
  if edit_cod.Text = '' then
begin
  ShowMessage('Selecione um funcionário!');
  Exit;
end;
  if (edit_nome.Text = '') or
   (edit_data.Text = '') or
   (edit_salario.Text = '') or
   (edit_salario.Text = 'R$ ') or
   (edit_login.Text = '') or
   (edit_senha.Text = '') then
begin
  ShowMessage('Preencha todos os campos!');
  Exit;
end;
  if StrToFloat(
  StringReplace(edit_salario.Text, 'R$ ', '', [rfReplaceAll])
) <= 0 then
begin
  ShowMessage('O salário deve ser maior que zero!');
  edit_salario.SetFocus;
  Exit;
end;

adoquery_funcionarios.SQL.Clear;

adoquery_funcionarios.SQL.Text :=
  'SELECT id_funcionario FROM FUNCIONARIOS ' +
  'WHERE login = :login AND id_funcionario <> :codigo';

adoquery_funcionarios.Parameters.ParamByName('login').Value :=
  edit_login.Text;

adoquery_funcionarios.Parameters.ParamByName('codigo').Value :=
  StrToInt(edit_cod.Text);

adoquery_funcionarios.Open;

if not adoquery_funcionarios.IsEmpty then
begin
  ShowMessage('Este login já pertence a outro funcionário!');
  edit_login.SetFocus;
  Exit;
end;

   adoquery_funcionarios.SQL.Text :=
  'UPDATE FUNCIONARIOS SET ' +
  'nome = :nome, ' +
  'data_nascimento = :nascimento, ' +
  'salario = :salario, ' +
  'login = :login, ' +
  'senha = :senha ' +
  'WHERE id_funcionario = :codigo';


adoquery_funcionarios.Parameters.ParamByName('nascimento').Value :=
  edit_data.Text;

 adoquery_funcionarios.Parameters.ParamByName('nome').Value :=
    edit_nome.Text;

  adoquery_funcionarios.Parameters.ParamByName('salario').Value :=
  StrToFloat(
    StringReplace(edit_salario.Text, 'R$ ', '', [rfReplaceAll])
  );

  adoquery_funcionarios.Parameters.ParamByName('login').Value :=
    edit_login.Text;

  adoquery_funcionarios.Parameters.ParamByName('senha').Value :=
    edit_senha.Text;

  adoquery_funcionarios.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod.Text);

  adoquery_funcionarios.ExecSQL;
  adoquery_funcionarios.Close;
  adoquery_funcionarios.SQL.Clear;
  adoquery_funcionarios.SQL.Text := 'SELECT * FROM FUNCIONARIOS ';
  adoquery_funcionarios.Open;

  ShowMessage('Funcionário alterado com sucesso!');

  edit_cod.Clear;
  edit_nome.Clear;
  edit_data.Clear;
  edit_salario.Text := 'R$ ';
  edit_login.Clear;
  edit_senha.Clear;

  edit_nome.SetFocus;
end;

procedure Tform_funcionarios.edit_excluirClick(Sender: TObject);
begin
  if edit_cod.Text = '' then
  begin
    Showmessage('Selecione um funcionario!');
    exit;
    end;
      if MessageDlg('Deseja realmente excluir este funcionario? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;

    adoquery_funcionarios.Close;
    adoquery_funcionarios.SQL.Clear;

    adoquery_funcionarios.SQL.Text :=
    'DELETE FROM FUNCIONARIOS ' +
    'WHERE id_funcionario = :codigo';

    adoquery_funcionarios.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod.Text);

    adoquery_funcionarios.ExecSQL;

    adoquery_funcionarios.Close;
    adoquery_funcionarios.SQL.Text := 'SELECT * FROM FUNCIONARIOS';
    adoquery_funcionarios.Open;

    Showmessage('Funcionario excluido com exito!');

  edit_cod.Clear;
  edit_nome.Clear;
  edit_data.Clear;
  edit_salario.Text := 'R$ ';
  edit_login.Clear;
  edit_senha.Clear;

  edit_nome.SetFocus;

end;

procedure Tform_funcionarios.edit_salarioEnter(Sender: TObject);
begin
  if edit_salario.Text = '' then
  begin
    edit_salario.Text := 'R$ ';
    edit_salario.SelStart := Length(edit_salario.Text);
  end;
end;
end.
