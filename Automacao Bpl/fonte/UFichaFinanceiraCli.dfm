inherited FrmFichaFinanceiraCli: TFrmFichaFinanceiraCli
  Caption = 'Ficha Financeira do Cliente'
  ClientHeight = 448
  OnCreate = FormCreate
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Top = 407
    ExplicitTop = 407
    inherited BitBtn3: TBitBtn
      OnClick = BitBtn3Click
    end
    inherited CheckBox1: TCheckBox
      Visible = False
    end
    inherited BitBtn6: TBitBtn
      OnClick = BitBtn6Click
    end
  end
  inherited Panel1: TPanel
    Height = 407
    ExplicitHeight = 407
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 577
      Height = 403
      Align = alClient
      Caption = 'Informe os par'#226'metros para consulta:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 115
        Top = 63
        Width = 70
        Height = 13
        Caption = 'Data Inicial:'
      end
      object Label2: TLabel
        Left = 261
        Top = 63
        Width = 63
        Height = 13
        Caption = 'Data Final:'
      end
      object Label3: TLabel
        Left = 131
        Top = 113
        Width = 52
        Height = 13
        Caption = 'Controle:'
      end
      object btSelectAll: TSpeedButton
        Left = 399
        Top = 109
        Width = 23
        Height = 21
        Hint = 'Selecionar todos'
        Enabled = False
        Flat = True
        Glyph.Data = {
          CE010000424DCE01000000000000CE0000002800000010000000100000000100
          08000000000000010000120B0000120B0000260000002600000000000000FFFF
          FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
          5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
          8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
          1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
          430029B548002EC6520035CA5E0039D465000202020202020202020202020202
          0202020202020202020202020202020202020202020202021212020202020202
          0202020202020212181B120202020202020202020202121F1C141D1202020202
          02020202021223211E12171A1202020202020202122425201202121519120202
          02020202021222120A03020212161202020202020203120C080B030202121312
          02020202030F0E0803070903020202121202020310110D030203050803020202
          12120202030E0302020202030603020202020202020302020202020203040302
          0202020202020202020202020202030302020202020202020202020202020203
          030202020202020202020202020202020202}
        ParentShowHint = False
        ShowHint = True
        OnClick = btSelectAllClick
      end
      object btUnSelectAll: TSpeedButton
        Left = 399
        Top = 136
        Width = 23
        Height = 21
        Hint = 'Desfazer sele'#231#227'o'
        Enabled = False
        Flat = True
        Glyph.Data = {
          AA010000424DAA01000000000000AA0000002800000010000000100000000100
          08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
          FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
          AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
          9B009A9A9A009999990098989800979797009494940093939300929292008C8C
          8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
          02020202020202020202020202020202020202021C1C02020202020202020202
          0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
          021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
          021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
          1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
          1B091B020202021B141B020202020202021B0202020202021B181B0202020202
          020202020202020202021B1B0202020202020202020202020202021B1B020202
          0202020202020202020202020202}
        ParentShowHint = False
        ShowHint = True
        OnClick = btUnSelectAllClick
      end
      object MaskEdit1: TMaskEdit
        Left = 188
        Top = 56
        Width = 68
        Height = 21
        EditMask = '!99/99/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
      end
      object MaskEdit2: TMaskEdit
        Left = 325
        Top = 56
        Width = 68
        Height = 21
        EditMask = '!99/99/0000;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
      end
      object CheckBox2: TCheckBox
        Left = 191
        Top = 86
        Width = 137
        Height = 17
        Caption = '&Ficha Financeira'
        TabOrder = 2
        OnClick = CheckBox2Click
      end
      object CheckListBox1: TCheckListBox
        Left = 189
        Top = 109
        Width = 204
        Height = 248
        Enabled = False
        ItemHeight = 13
        Sorted = True
        TabOrder = 3
      end
    end
  end
end
