unit unit_dependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tform_dependentes = class(TForm)
    Label1: TLabel;
    edit_cod_beneficiario: TEdit;
    Label2: TLabel;
    edit_codigo: TEdit;
    Label3: TLabel;
    edit_nome: TEdit;
    Label4: TLabel;
    edit_parentesco: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_dependentes: Tform_dependentes;

implementation

{$R *.dfm}

end.
