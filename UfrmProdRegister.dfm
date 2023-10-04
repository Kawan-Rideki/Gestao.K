inherited frmProdRegister: TfrmProdRegister
  Caption = 'frmProdRegister'
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 16
    Top = 59
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 16
    Top = 112
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 168
    Width = 78
    Height = 15
    Caption = 'Pre'#231'o de custo'
  end
  object Label4: TLabel [3]
    Left = 152
    Top = 168
    Width = 81
    Height = 15
    Caption = 'Pre'#231'o de venda'
  end
  object Label5: TLabel [4]
    Left = 288
    Top = 168
    Width = 42
    Height = 15
    Caption = 'Estoque'
  end
  object edtIdProd: TEdit [6]
    Left = 16
    Top = 80
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'edtIdProd'
  end
  object edtDescr: TEdit [7]
    Left = 16
    Top = 133
    Width = 306
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object edtVlCst: TMaskEdit [8]
    Left = 16
    Top = 189
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'edtVlCst'
  end
  object edtVlVnd: TMaskEdit [9]
    Left = 152
    Top = 189
    Width = 121
    Height = 23
    TabOrder = 4
    Text = 'MaskEdit1'
  end
  object edtVlEstq: TMaskEdit [10]
    Left = 288
    Top = 189
    Width = 121
    Height = 23
    TabOrder = 5
    Text = 'MaskEdit1'
  end
  inherited qItem: TFDQuery
    Left = 184
    Top = 272
  end
end
