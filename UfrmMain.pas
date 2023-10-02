unit UfrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Themes, Vcl.Styles, IniFiles,
  Vcl.Mask, UAppLibrary;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    Lanamentos1: TMenuItem;
    Vendas1: TMenuItem;
    FDConnection1: TFDConnection;
    Panel1: TPanel;
    cboStyle: TComboBox;
    procedure Fechar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure cboStyleChange(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses UfrmCliManager, UfrmProdManagerOld;

procedure TfrmMain.cboStyleChange(Sender: TObject);
var
  Ini: TIniFile;
begin
  TStyleManager.TrySetStyle(cboStyle.Text);

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  Ini.WriteString('appliccation', 'stylename', cboStyle.Text);
  Ini.Free;
end;

procedure TfrmMain.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCliManager, frmCliManager);
end;

procedure TfrmMain.Fechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  StyleName: String;
  Ini: TIniFile;
  //Extender: TNumericFieldExtender;
begin
  //Extender := TNumericFieldExtender.Create(MaskEdit1, 2);

  FDConnection1.Connected := True;

  cboStyle.Clear;
  for StyleName in TStyleManager.StyleNames do
  begin
    cboStyle.Items.Add(StyleName);
  end;

  Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  StyleName := Ini.ReadString('appliccation', 'stylename', '' );
  Ini.Free;

  if (StyleName <> '') then
  begin
    TStyleManager.TrySetStyle(StyleName);
    cboStyle.ItemIndex := cboStyle.Items.IndexOf(StyleName);
  end;

end;

procedure TfrmMain.Produtos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmProdManagerOld, frmProdManagerOld);
end;

end.
