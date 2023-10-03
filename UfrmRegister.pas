unit UfrmRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UfrmDefault, Vcl.StdCtrls, Vcl.ExtCtrls, UAppLibrary, System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask;

type
  TfrmRegister = class(TfrmDefault)
    Panel1: TPanel;
    btnSave: TButton;
    btnNew: TButton;
    qItem: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public

    Mapping: TDictionary<String, TFieldExtender>;
    TableName: String;
    IdFieldname: String;
    procedure AddMapping(AFieldExtender: TFieldExtender);
    procedure IdOnExit(ASender: TObject);
  end;

var
  frmRegister: TfrmRegister;

implementation

uses
  UfrmMain;

{$R *.dfm}

{ TfrmRegister }

procedure TfrmRegister.AddMapping(AFieldExtender: TFieldExtender);
begin
  Mapping.Add(AFieldExtender.FieldName, AFieldExtender)
end;

procedure TfrmRegister.btnNewClick(Sender: TObject);
begin
  inherited;

  for var Item in Mapping do
    begin
      Item.Value.Clear;
    end;
end;

procedure TfrmRegister.btnSaveClick(Sender: TObject);
var
  IdValue: Integer;
begin
  inherited;

  qItem.Close;
  qItem.SQL.Text := 'select * from ' + TableName + ' where ' + IdFieldName + ' = :' + IdFieldName;

  Mapping.Items[IdFieldName].GetValue;

  qItem.ParamByName(IdFieldName).AsInteger := IdValue;

  qItem.Open;

  if (qItem.IsEmpty) then
  begin
  qItem.Append;
  end
  else
  begin
    qItem.Edit;
  end;

  for var Item in Mapping do
  begin
    qItem.FieldByName(Item.Value.FieldName).Value := Item.Value.GetValue;
  end;
  qItem.Post;

  ShowMessage('Registro salvo com sucesso');

end;

procedure TfrmRegister.FormCreate(Sender: TObject);
begin
  inherited;

  qItem.Connection := frmMain.FDConnection1;

  Mapping := TDictionary<String, TFieldExtender>.Create;
end;

procedure TfrmRegister.FormDestroy(Sender: TObject);
begin
  inherited;
  Mapping.Free;
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin
  inherited;
  btnNewClick(btnNew);

  if (Mapping.Items[IdFieldName].Control is TEdit) then
  begin
    TEdit(Mapping.Items[IdFieldName].Control).OnExit := IdOnExit;
  end
  else if (Mapping.Items[IdFieldName].Control is TMaskEdit) then
  begin
    TMaskEdit(Mapping.Items[IdFieldName].Control).OnExit := IdOnExit;
  end;
end;

procedure TfrmRegister.IdOnExit(ASender: TObject);
var
  IdValue: Integer;
begin
  inherited;

  qItem.Close;
  qItem.SQL.Text := 'select * from ' + TableName + ' where ' + IdFieldName + ' = :' + IdFieldName;

  Mapping.Items[IdFieldName].GetValue;

  qItem.ParamByName(IdFieldName).AsInteger := IdValue;

  qItem.Open;

  if (qItem.IsEmpty) then

  begin
    ShowMessage('Registro não encontrado');
    Exit;
  end;

  for var Item in Mapping do
  begin
    if (Item.Key <> IdFieldName) then
    begin
    Item.Value.SetValue(qItem.FieldByName(Item.Value.FieldName).Value);
    end;
  end;

end;

end.
