program GestaoK;

uses
  Vcl.Forms,
  UfrmMain in 'UfrmMain.pas' {Form1},
  UfrmCliManagerOld in 'UfrmCliManagerOld.pas' {frmCliManagerOld},
  UfrmCliRegisterOld in 'UfrmCliRegisterOld.pas' {FrmCliRegisterOld},
  Vcl.Themes,
  Vcl.Styles,
  UfrmProdManagerOld in 'UfrmProdManagerOld.pas' {frmProdManagerOld},
  UfrmProdRegisterOld in 'UfrmProdRegisterOld.pas' {frmProdRegisterOld},
  UAppLibrary in 'UAppLibrary.pas',
  UfrmDefault in 'UfrmDefault.pas' {frmDefault},
  UfrmRegister in 'UfrmRegister.pas' {frmRegister},
  UfrmManager in 'UfrmManager.pas' {frmManager},
  UfrmCliManager in 'UfrmCliManager.pas' {frmCliManager},
  UfrmCliRegister in 'UfrmCliRegister.pas' {frmCliRegister},
  UfrmProdManager in 'UfrmProdManager.pas' {frmProdManager},
  UfrmProdRegister in 'UfrmProdRegister.pas' {frmProdRegister};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
