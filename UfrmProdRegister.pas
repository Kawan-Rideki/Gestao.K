unit UfrmProdRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmRegister, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask;

type
  TfrmProdRegister = class(TfrmRegister)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtIdProd: TEdit;
    edtNome: TEdit;
    edtVlCst: TMaskEdit;
    edtVlVnd: TMaskEdit;
    edtVlEstq: TMaskEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdRegister: TfrmProdRegister;

implementation

{$R *.dfm}

procedure TfrmProdRegister.FormCreate(Sender: TObject);
begin
  inherited;
  TableName := 'tb_prod';
  IdFieldname := 'id_prod';


end;

end.
