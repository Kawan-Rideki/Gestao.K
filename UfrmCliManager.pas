unit UfrmCliManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmManager, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCliManager = class(TfrmManager)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliManager: TfrmCliManager;

implementation

uses UfrmCliRegister;

{$R *.dfm}

procedure TfrmCliManager.FormCreate(Sender: TObject);
begin
  inherited;

  RegisterClass := TfrmCliRegister;
  TableName     := 'tb_cli';
  FindFieldName := 'nome';

  AddColumn('id_cli', 'Código', 100);
  AddColumn('nome', 'Nome', 300);
end;

end.
