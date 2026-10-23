unit unit_relatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, RpCon, RpConDS, RpDefine, RpRave;

type
  Tform_relatorios = class(TForm)
    btn_relatorio_beneficiarios: TBitBtn;
    btn_relatorio_dependentes: TBitBtn;
    btn_fechar: TBitBtn;
    Label1: TLabel;
    adoquery_rel_beneficiarios: TADOQuery;
    rvProject: TRvProject;
    rvBeneficiarios: TRvDataSetConnection;
    adoquery_rel_dependentes: TADOQuery;
    rvDependentes: TRvDataSetConnection;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_relatorio_beneficiariosClick(Sender: TObject);
    procedure btn_relatorio_dependentesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_relatorios: Tform_relatorios;

implementation

uses unit_menu;

{$R *.dfm}

procedure Tform_relatorios.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure Tform_relatorios.btn_relatorio_beneficiariosClick(Sender: TObject);
begin
  adoquery_rel_beneficiarios.Close;
  adoquery_rel_beneficiarios.SQL.Clear;
  adoquery_rel_beneficiarios.SQL.Text :=
    'SELECT id_beneficiario, nome, data_nascimento, valor_plano ' +
    'FROM BENEFICIARIOS ' +
    'ORDER BY nome';
  adoquery_rel_beneficiarios.Open;

  rvProject.Open;
  rvProject.SelectReport('Report1', False);
  rvProject.Execute;
  rvProject.Close;
end;

procedure Tform_relatorios.btn_relatorio_dependentesClick(Sender: TObject);
begin
  adoquery_rel_dependentes.Close;
  adoquery_rel_dependentes.SQL.Clear;
  adoquery_rel_dependentes.SQL.Text :=  'SELECT ' +
    'B.id_beneficiario, ' +
    'B.nome AS beneficiario, ' +
    'D.id_dependente, ' +
    'D.nome AS dependente, ' +
    'D.grau_parentesco ' +
    'FROM BENEFICIARIOS B ' +
    'INNER JOIN DEPENDENTES D ' +
    'ON D.id_beneficiario = B.id_beneficiario ' +
    'ORDER BY B.nome, D.nome';

    adoquery_rel_dependentes.Open;

    rvProject.Open;
    rvProject.SelectReport('Report2', false);
    rvProject.Execute;
    rvProject.Close;

end;

end.
