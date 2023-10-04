unit UfrmProdManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmManager, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmProdManager = class(TfrmManager)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdManager: TfrmProdManager;

implementation

uses UfrmProdRegister;

{$R *.dfm}

procedure TfrmProdManager.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterClass := TfrmProdRegister;
  TableName     := 'tb_prod';
  FindFieldName := 'descr';

  AddColumn('id_prod', 'Código', 100);
  AddColumn('descr', 'Descrição', 300);
  AddColumn('vl_cst', 'Valor de Custo', 200);
  AddColumn('vl_vnd', 'Valor de Venda', 200);
  AddColumn('vl_estq', 'Valor de Estoque', 200);

end;

end.
