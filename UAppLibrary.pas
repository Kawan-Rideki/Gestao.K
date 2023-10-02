unit UAppLibrary;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, StrUtils;

type
  TFieldExtender = class(TComponent)
    protected
       procedure Apply; virtual;
    public
    Control: TwinControl;
    FieldName: String;
      constructor Create(AFieldName: String; AControl: TWinControl);
      destructor Destroy;

      procedure Clear; virtual;

      function GetValue: Variant; virtual;
      function SetValue(AValue: Variant): TFieldExtender; virtual;
  end;

  TNumericFieldExtender = class(TFieldExtender)
  protected
    procedure Apply; override;
    procedure OnKeyPress(ASender: TObject; var AKey: Char);
    procedure OnEnter(ASender: TObject);
    procedure OnExit(ASender: TObject);
  public
    Decimals: Integer;
    constructor Create(AFieldName: String; AControl: TWinControl; ADecimals: Integer = 0);

    function GetValue: Variant; virtual;
    function SetValue(AValue: Variant): TFieldExtender; virtual;

    function GetMask: String;

    procedure Clear; override;
  end;

  //TDateFieldExtender = class(TFieldExtender)
    //private
    //public
  //end;

function TextToFloat(Avalue: String): Double;

implementation

{ TFieldExtender }

{ TFieldExtender }

procedure TFieldExtender.Apply;
begin

end;

procedure TFieldExtender.Clear;
begin
  if (Control is TCustomEdit) then
  begin
    TCustomEdit(Control).Text := '';
  end;
end;

constructor TFieldExtender.Create(AFieldName: String; AControl: TWinControl);
begin
  Control := AControl;
  FieldName := AFieldName;
  Apply;
end;

destructor TFieldExtender.Destroy;
begin

end;

function TFieldExtender.GetValue: Variant;
begin
   Result := '';

    if (Control is TCustomEdit) then
    begin
      Result := TCustomEdit(Control).Text;
    end;
end;

function TFieldExtender.SetValue(AValue: Variant): TFieldExtender;
begin
  if (Control is TCustomEdit) then
  begin
    TCustomEdit(Control).Text := AValue;
  end;

  Result := Self;
end;

{ TNumericFieldExtender }


{ TDateFieldExtender }



{ TNumericFieldExtender }

procedure TNumericFieldExtender.Apply;
begin

  inherited;

  if (Control is TMaskEdit) then
  begin
    TMaskEdit(Control).OnKeyPress := OnKeyPress;
    TMaskEdit(Control).OnEnter    := OnEnter;
    TMaskEdit(Control).OnExit     := OnExit;
    TMaskEdit(Control).Alignment  := TAlignment.taRightJustify;
    TMaskEdit(Control).Text       := '';
    TMaskEdit(Control).OnExit(Control);
  end
  else if (Control is TEdit) then
  begin
    TEdit(Control).OnKeyPress := OnKeyPress;
    TEdit(Control).OnEnter    := OnEnter;
    TEdit(Control).OnExit     := OnExit;
    TEdit(Control).Alignment  := TAlignment.taRightJustify;
    TEdit(Control).Text       := '';
    TEdit(Control).OnExit(Control);

  end;

end;

procedure TNumericFieldExtender.Clear;
begin
  inherited;

  OnExit(Control);
end;

constructor TNumericFieldExtender.Create(AFieldName: String; AControl: TWinControl;
  ADecimals: Integer);
begin
  Decimals := ADecimals;

  inherited Create(AFieldName, AControl);
end;

function TNumericFieldExtender.GetValue: Variant;
begin
  Result := 0;

  if (Control is TCustomEdit) then
  begin
    if (TCustomEdit(Control).Text <> '') then
    begin
    Result := TextToFloat(TCustomEdit(Control).Text);
    end;
  end;
end;

function TNumericFieldExtender.GetMask: String;
begin
  Result := '###,###,###,##0';

  if (Decimals > 0) then
  begin
    Result := '.' + DupeString('0', Decimals);
  end;
end;

procedure TNumericFieldExtender.OnEnter(ASender: TObject);
begin
if (Control is TCustomEdit) then

begin
  TCustomEdit(Control).Text := Trim(AnsiReplaceStr(TCustomEdit(Control).Text, FormatSettings.ThousandSeparator, ''));

end;
end;

procedure TNumericFieldExtender.OnExit(ASender: TObject);
var
  Value: Double;
begin
  if (Control is TCustomEdit) then
  begin
    Value := StrToFloatDef(TMaskEdit(Control).Text, 0);
    TCustomEdit(Control).Text := FormatFloat(GetMask, Value);
  end;
end;

procedure TNumericFieldExtender.OnKeyPress(ASender: TObject; var AKey: Char);
begin
 if (AKey = '.') and (Pos(FormatSettings.DecimalSeparator, TCustomEdit(control).Text) = 0) and (Decimals <> 0) then
  begin
    AKey := ',';
    Exit;
  end;
  if (Copy(TCustomEdit(control).Text, 1, 1) = '=') or (AKey = '=') then
  begin
    if (not (AKey in ['0'..'9', '+', '-', 'x', 'X', '*', '/', '(', ')', ' ', '=', '%', #13, #27, #8,
      FormatSettings.DecimalSeparator, #17, ^V, ^C, ^X])) then
    begin
      AKey := #0;
    end;
    exit;
  end;
  if (Pos(FormatSettings.DecimalSeparator, TCustomEdit(control).Text) = 0) and (Decimals <> 0) then
  begin
    if (not (AKey in ['0'..'9', '+', '-', 'x', 'X', '*', '/', #13, #27, #8, FormatSettings.DecimalSeparator, #17, ^V, ^C, ^X])) then
    begin
      AKey := #0;
    end;
  end
  else
  begin
    if (not (AKey in ['0'..'9', '+', '-', 'x', 'X', '*', '/', #13, #27, #8, #17, ^V, ^C, ^X])) then
    begin
      AKey := #0;
    end;
  end;
end;

function TNumericFieldExtender.SetValue(AValue: Variant): TFieldExtender;
begin
  if (Control is TCustomEdit) then
  begin
  TCustomEdit(Control).Text := FormatFloat(GetMask, AValue);
  end;

  Result := Self;

end;

function TextToFloat(Avalue: String): Double;
begin
 AValue := Trim(AnsiReplaceStr(AValue, FormatSettings.ThousandSeparator, ''));
 Result := StrToFloat(AValue);
end;
end.
