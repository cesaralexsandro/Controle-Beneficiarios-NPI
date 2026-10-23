unit unit_beneficiarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls, Buttons;

type
  Tform_beneficiarios = class(TForm)
    Label1: TLabel;
    edit_cod: TEdit;
    Label2: TLabel;
    edit_nome: TEdit;
    Label3: TLabel;
    edit_data: TEdit;
    Label4: TLabel;
    edit_valor: TEdit;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    Label5: TLabel;
    adoquery_beneficiarios: TADOQuery;
    dbgrid_beneficiarios: TDBGrid;
    ds_beneficiarios: TDataSource;
    group_dependentes: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edit_cod_dependente: TEdit;
    edit_nome_dependente: TEdit;
    group_beneficiarios: TGroupBox;
    dbgrid_dependente: TDBGrid;
    btn_novo_dependente: TBitBtn;
    btn_salvar_dependente: TBitBtn;
    btn_editar_dependente: TBitBtn;
    btn_excluir_dependente: TBitBtn;
    adoquery_dependentes: TADOQuery;
    ds_dependentes: TDataSource;
    cb_parentesco: TComboBox;
    btn_novo: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrid_beneficiariosCellClick(Column: TColumn);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_novo_dependenteClick(Sender: TObject);
    procedure dbgrid_dependenteCellClick(Column: TColumn);
    procedure btn_fechar_dependenteClick(Sender: TObject);
    procedure btn_salvar_dependenteClick(Sender: TObject);
    procedure btn_editar_dependenteClick(Sender: TObject);
    procedure btn_excluir_dependenteClick(Sender: TObject);
    procedure edit_valorEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_beneficiarios: Tform_beneficiarios;

implementation

uses unit_menu;

{$R *.dfm}

procedure Tform_beneficiarios.btn_fecharClick(Sender: TObject);
begin
  if MessageDlg('Deseja fechar o cadastro de beneficiários?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Close;
  end;
end;

procedure Tform_beneficiarios.btn_novoClick(Sender: TObject);
begin
  edit_cod.Clear;
  edit_nome.Clear;
  edit_data.Clear;
  edit_valor.Text := 'R$ ';

  edit_cod_dependente.Clear;
  edit_nome_dependente.Clear;
  cb_parentesco.ItemIndex := -1;

  adoquery_dependentes.Close;

  edit_nome.SetFocus;

end;

procedure Tform_beneficiarios.btn_salvarClick(Sender: TObject);
begin
  adoquery_beneficiarios.Close;
  if (edit_nome.Text = '') or
   (edit_data.Text = '') or
   (edit_valor.Text = '') or
   (edit_valor.Text = 'R$ ') then
begin
  ShowMessage('Preencha todos os campos!');
  Exit;
end;

  if StrToFloat(
  StringReplace(edit_valor.Text, 'R$ ', '', [rfReplaceAll])
) <= 0 then
begin
  ShowMessage('O valor do plano deve ser maior que zero!');
  edit_valor.SetFocus;
  Exit;
end;

  adoquery_beneficiarios.SQL.Text :=
  'INSERT INTO BENEFICIARIOS ' +
    '(nome, data_nascimento, valor_plano) ' +
    'VALUES (:nome, :nascimento, :valor)';

  adoquery_beneficiarios.Parameters.ParamByName('nome').Value := edit_nome.Text;
  adoquery_beneficiarios.Parameters.ParamByName('nascimento').Value := edit_data.Text;
  adoquery_beneficiarios.Parameters.ParamByName('valor').Value :=
  StrToFloat(
    StringReplace(edit_valor.Text, 'R$ ', '', [rfReplaceAll])
  );

  adoquery_beneficiarios.ExecSQL;
 adoquery_beneficiarios.Close;
adoquery_beneficiarios.SQL.Clear;

adoquery_beneficiarios.SQL.Text :=
  'SELECT * FROM BENEFICIARIOS';

adoquery_beneficiarios.Open;

  Showmessage ('Operação concluida com sucesso!');

  edit_cod.Clear;
  edit_nome.Clear;
  edit_data.Clear;
  edit_valor.Text := 'R$ ';

edit_nome.SetFocus;
end;

procedure Tform_beneficiarios.FormShow(Sender: TObject);
begin
  adoquery_beneficiarios.Open;
  adoquery_dependentes.Open;
end;

procedure Tform_beneficiarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  adoquery_beneficiarios.Close;
  adoquery_dependentes.Close;
end;

procedure Tform_beneficiarios.dbgrid_beneficiariosCellClick(
  Column: TColumn);
begin
  edit_cod.Text :=
    adoquery_beneficiarios.fieldbyname('id_beneficiario').AsString;
  edit_nome.Text :=
    adoquery_beneficiarios.fieldbyname('nome').AsString;
  edit_data.Text :=
    adoquery_beneficiarios.fieldbyname('data_nascimento').AsString;
  edit_valor.Text :=
  'R$ ' + FormatFloat('0.00',
    adoquery_beneficiarios.FieldByName('valor_plano').AsFloat);

  adoquery_dependentes.Close;
  adoquery_dependentes.SQL.Clear;

  adoquery_dependentes.SQL.Text :=
  'SELECT * FROM DEPENDENTES ' +
  'WHERE id_beneficiario = :codigo';

  adoquery_dependentes.Parameters.ParamByName('codigo').Value :=
  StrToInt(edit_cod.Text);

  adoquery_dependentes.Open;
end;

procedure Tform_beneficiarios.btn_alterarClick(Sender: TObject);
begin
  if (edit_nome.Text = '') or
   (edit_data.Text = '') or
   (edit_valor.Text = '') or
   (edit_valor.Text = 'R$ ') then
begin
  ShowMessage('Preencha todos os campos!');
  Exit;
end;
  if StrToFloat(
  StringReplace(edit_valor.Text, 'R$ ', '', [rfReplaceAll])
) <= 0 then
begin
  ShowMessage('O valor do plano deve ser maior que zero!');
  edit_valor.SetFocus;
  Exit;
end;

    adoquery_beneficiarios.SQL.Text :=
  'UPDATE BENEFICIARIOS SET ' +
  'nome = :nome, ' +
  'data_nascimento = :nascimento, ' +
  'valor_plano = :valor ' +
  'WHERE id_beneficiario = :codigo';

  adoquery_beneficiarios.Parameters.ParamByName('codigo').Value:= StrToInt(edit_cod.Text);
  adoquery_beneficiarios.Parameters.ParamByName('nome').Value:= edit_nome.Text;
  adoquery_beneficiarios.Parameters.ParamByName('nascimento').Value := StrToDate(edit_data.Text);
  adoquery_beneficiarios.Parameters.ParamByName('valor').Value := StrToFloat(
  StringReplace(edit_valor.Text, 'R$ ', '', [rfReplaceAll])
);

  adoquery_beneficiarios.ExecSQL;

  adoquery_beneficiarios.Close;
  adoquery_beneficiarios.SQL.Clear;
  adoquery_beneficiarios.SQL.Text := 'SELECT * FROM BENEFICIARIOS ';
  adoquery_beneficiarios.Open;

  showmessage('Beneficiario alterado com sucesso!');

  edit_cod.Clear;
edit_nome.Clear;
edit_data.Clear;
edit_valor.Text := 'R$ ';

edit_cod_dependente.Clear;
edit_nome_dependente.Clear;
cb_parentesco.ItemIndex := -1;

adoquery_dependentes.Close;

edit_nome.SetFocus; 
  end;

procedure Tform_beneficiarios.btn_excluirClick(Sender: TObject);
begin
  if edit_cod.Text = '' then
  begin
    ShowMessage('Selecione um beneficiário!');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir este beneficiário?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

    adoquery_dependentes.Close;
adoquery_dependentes.SQL.Clear;

adoquery_dependentes.SQL.Text :=
  'SELECT COUNT(*) AS quantidade FROM DEPENDENTES ' +
  'WHERE id_beneficiario = :codigo';

adoquery_dependentes.Parameters.ParamByName('codigo').Value :=
  StrToInt(edit_cod.Text);

adoquery_dependentes.Open;

if adoquery_dependentes.FieldByName('quantidade').AsInteger > 0 then
begin
  ShowMessage(
    'Não é possível excluir este beneficiário, pois ele possui dependentes!'
  );
  Exit;
end;

  adoquery_beneficiarios.Close;
  adoquery_beneficiarios.SQL.Clear;

  adoquery_beneficiarios.SQL.Text :=
    'DELETE FROM BENEFICIARIOS ' +
    'WHERE id_beneficiario = :codigo';

  adoquery_beneficiarios.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod.Text);

  adoquery_beneficiarios.ExecSQL;

  { Atualiza o Grid }
  adoquery_beneficiarios.Close;
  adoquery_beneficiarios.SQL.Clear;
  adoquery_beneficiarios.SQL.Text :=
    'SELECT * FROM BENEFICIARIOS';
  adoquery_beneficiarios.Open;

  ShowMessage('Beneficiário excluído com sucesso!');

  edit_cod.Clear;
  edit_nome.Clear;
  edit_data.Clear;
  edit_valor.Text := 'R$ ';

  edit_cod_dependente.Clear;
  edit_nome_dependente.Clear;
  cb_parentesco.ItemIndex := -1;

  adoquery_dependentes.Close;

  edit_nome.SetFocus;
end;

procedure Tform_beneficiarios.btn_novo_dependenteClick(Sender: TObject);
begin
  if edit_cod.Text = '' then
  begin
    showmessage('Selecione primeiro um beneficiario!');
    exit;
    end;

    edit_cod_dependente.Clear;
    edit_nome_dependente.Clear;
    cb_parentesco.ItemIndex := -1;

    edit_nome_dependente.SetFocus;

end;

procedure Tform_beneficiarios.dbgrid_dependenteCellClick(Column: TColumn);
begin
 edit_cod_dependente.Text :=
  adoquery_dependentes.FieldByName('id_dependente').AsString;

edit_nome_dependente.Text :=
  adoquery_dependentes.FieldByName('nome').AsString;

cb_parentesco.ItemIndex :=
  cb_parentesco.Items.IndexOf(
  adoquery_dependentes.FieldByName('grau_parentesco').AsString);
end;

procedure Tform_beneficiarios.btn_fechar_dependenteClick(Sender: TObject);
begin
  close;
end;

procedure Tform_beneficiarios.btn_salvar_dependenteClick(Sender: TObject);
begin
  if (edit_nome_dependente.Text = '') or
   (cb_parentesco.ItemIndex = -1) then
begin
  ShowMessage('Preencha o nome e selecione o grau de parentesco!');
  Exit;
end;

  if (edit_nome_dependente.Text = '') or
     (cb_parentesco.Text = '') then
  begin
    ShowMessage('Preencha os dados do dependente!');
    Exit;
  end;

  { SALVA O DEPENDENTE }
  adoquery_dependentes.Close;
  adoquery_dependentes.SQL.Clear;

  adoquery_dependentes.SQL.Text :=
    'INSERT INTO DEPENDENTES ' +
    '(id_beneficiario, nome, grau_parentesco) ' +
    'VALUES (:beneficiario, :nome, :parentesco)';

  adoquery_dependentes.Parameters.ParamByName('beneficiario').Value :=
    StrToInt(edit_cod.Text);

  adoquery_dependentes.Parameters.ParamByName('nome').Value :=
    edit_nome_dependente.Text;

  adoquery_dependentes.Parameters.ParamByName('parentesco').Value :=
    cb_parentesco.Text;

  adoquery_dependentes.ExecSQL;


  { ATUALIZA O GRID DOS DEPENDENTES }
  adoquery_dependentes.Close;
  adoquery_dependentes.SQL.Clear;

  adoquery_dependentes.SQL.Text :=
    'SELECT * FROM DEPENDENTES ' +
    'WHERE id_beneficiario = :codigo';

  adoquery_dependentes.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod.Text);

  adoquery_dependentes.Open;


  { LIMPA OS CAMPOS }
  edit_cod_dependente.Clear;
  edit_nome_dependente.Clear;
  cb_parentesco.ItemIndex := -1;

  ShowMessage('Dependente cadastrado com sucesso!');
end;

procedure Tform_beneficiarios.btn_editar_dependenteClick(Sender: TObject);
begin
  if (edit_nome_dependente.Text = '') or
   (cb_parentesco.ItemIndex = -1) then
begin
  ShowMessage('Preencha o nome e selecione o grau de parentesco!');
  Exit;
end;

    adoquery_dependentes.Close;
    adoquery_dependentes.SQL.Clear;

    adoquery_dependentes.SQL.Text := 'UPDATE DEPENDENTES SET ' +
                                     'nome = :nome, ' +
                                     'grau_parentesco = :parentesco '+
                                     'WHERE id_dependente = :codigo';

      adoquery_dependentes.Parameters.ParamByName('nome').Value :=
    edit_nome_dependente.Text;

  adoquery_dependentes.Parameters.ParamByName('parentesco').Value :=
    cb_parentesco.Text;

  adoquery_dependentes.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod_dependente.Text);

  adoquery_dependentes.ExecSQL;

    adoquery_dependentes.Close;
  adoquery_dependentes.SQL.Clear;

  adoquery_dependentes.SQL.Text :=
    'SELECT * FROM DEPENDENTES ' +
    'WHERE id_beneficiario = :codigo';

  adoquery_dependentes.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod.Text);

  adoquery_dependentes.Open;

  ShowMessage('Dependente alterado com sucesso!');

end;

procedure Tform_beneficiarios.btn_excluir_dependenteClick(Sender: TObject);
begin
 if edit_cod_dependente.Text = '' then
  begin
    ShowMessage('Selecione um dependente!');
    Exit;
  end;

  if MessageDlg('Deseja realmente excluir este dependente?',
    mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  adoquery_dependentes.Close;
  adoquery_dependentes.SQL.Clear;

  adoquery_dependentes.SQL.Text :=
    'DELETE FROM DEPENDENTES ' +
    'WHERE id_dependente = :codigo';

  adoquery_dependentes.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod_dependente.Text);

  adoquery_dependentes.ExecSQL;

  { Atualiza o Grid }
  adoquery_dependentes.Close;
  adoquery_dependentes.SQL.Clear;

  adoquery_dependentes.SQL.Text :=
    'SELECT * FROM DEPENDENTES ' +
    'WHERE id_beneficiario = :codigo';

  adoquery_dependentes.Parameters.ParamByName('codigo').Value :=
    StrToInt(edit_cod.Text);

  adoquery_dependentes.Open;

  { Limpa os campos }
  edit_cod_dependente.Clear;
  edit_nome_dependente.Clear;
  cb_parentesco.ItemIndex := -1;

  ShowMessage('Dependente excluído com sucesso!');
end;

procedure Tform_beneficiarios.edit_valorEnter(Sender: TObject);
begin
  if edit_valor.Text = '' then
  begin
    edit_valor.Text := 'R$ ';
    edit_valor.SelStart := Length(edit_valor.text);
end;

end;
end.
