object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Gest'#227'o K'
  ClientHeight = 466
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 425
    Width = 675
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object cboStyle: TComboBox
      Left = 8
      Top = 10
      Width = 233
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnChange = cboStyleChange
    end
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 72
    object Cadastro1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = 'Fechar'
        OnClick = Fechar1Click
      end
    end
    object Lanamentos1: TMenuItem
      Caption = 'Lan'#231'amentos'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Database=db_aula'
      'Password=n9e8o7'
      'Server=localhost'
      'User_Name=postgres')
    LoginPrompt = False
    Left = 184
    Top = 80
  end
end
