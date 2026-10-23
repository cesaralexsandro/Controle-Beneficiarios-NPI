unit unit_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons;

type
  Tform_menu = class(TForm)
    ConexaoBD: TADOConnection;
    ADOQuery1: TADOQuery;
    btn_funcionarios: TBitBtn;
    btn_sair: TBitBtn;
    btn_beneficiario: TBitBtn;
    lbl_usuario: TLabel;
    Label2: TLabel;
    btn_relatorios: TBitBtn;
    procedure btn_funcionariosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_beneficiarioClick(Sender: TObject);
    procedure btn_relatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_menu: Tform_menu;

implementation

uses unit_funcionarios, unit_beneficiarios,unit_relatorios;

{$R *.dfm}

procedure Tform_menu.btn_funcionariosClick(Sender: TObject);
begin
  form_funcionarios.showmodal;
end;

procedure Tform_menu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ConexaoBD.Close;
end;

procedure Tform_menu.FormShow(Sender: TObject);
begin
  ConexaoBD.Open;
end;

procedure Tform_menu.btn_sairClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair do sistema?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Application.Terminate;
  end;
end;

procedure Tform_menu.btn_beneficiarioClick(Sender: TObject);
begin
  form_beneficiarios.showmodal;
end;

procedure Tform_menu.btn_relatoriosClick(Sender: TObject);
begin
  form_relatorios.ShowModal;
end;

end.
