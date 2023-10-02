unit UfrmCliRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmRegister, Vcl.StdCtrls, Vcl.ExtCtrls, UAppLibrary,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmCliRegister = class(TfrmRegister)
    Label1: TLabel;
    Label2: TLabel;
    edtIdCli: TEdit;
    edtNome: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliRegister: TfrmCliRegister;

implementation

{$R *.dfm}

procedure TfrmCliRegister.FormCreate(Sender: TObject);
begin
  inherited;

  TableName := 'tb_cli';
  IdFieldname := 'id_cli';

  AddMapping(TNumericFieldExtender.Create('id_cli', edtIdCli, 0));
  AddMapping(TFieldExtender.Create('nome', edtNome));
end;

end.
