object frmVincIntermPag: TfrmVincIntermPag
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Vincular Intermediadores aos Controles - [FPG045]'
  ClientHeight = 356
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnIntermControle: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 356
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 8
    Padding.Top = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 0
    object Label31: TLabel
      Left = 23
      Top = 205
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Controle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 23
      Top = 21
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Id Pag:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 23
      Top = 251
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cond Pag:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 23
      Top = 113
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Caption = 'Intermediador:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 23
      Top = 67
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local Venda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 23
      Top = 159
      Width = 320
      Height = 13
      Alignment = taRightJustify
      Caption = 'Identifica'#231#227'o da empresa no Intermediador(NFe e NFCe)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel16: TPanel
      Left = 8
      Top = 306
      Width = 506
      Height = 42
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 8
      object BitBtn10: TBitBtn
        Left = 153
        Top = 6
        Width = 95
        Height = 25
        Hint = 'OK - [FPG043/FPG044]'
        Caption = 'OK'
        Default = True
        TabOrder = 0
        OnClick = BitBtn10Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
      object BitBtn11: TBitBtn
        Left = 255
        Top = 6
        Width = 95
        Height = 25
        Hint = 'Cancelar'
        Cancel = True
        Caption = 'Cancela'
        TabOrder = 1
        OnClick = BitBtn11Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
    object DBLookupComboBoxControle: TDBLookupComboBox
      Left = 92
      Top = 224
      Width = 411
      Height = 21
      KeyField = 'CODIGO_CTRL'
      ListField = 'NOME_CTRL'
      ListSource = dtmFP.dsCtrlIntermediadorPag
      TabOrder = 5
      OnExit = DBLookupComboBoxControleExit
    end
    object EditHwControle: TEditHw
      Left = 23
      Top = 224
      Width = 63
      Height = 21
      TabOrder = 4
      Text = '                 0'
      OnExit = EditHwControleExit
      OnKeyDown = EditHwControleKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object cbIntermediador: TComboBox
      Left = 23
      Top = 132
      Width = 477
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 2
    end
    object EditHwIdMetodoPag: TEditHw
      Left = 23
      Top = 40
      Width = 63
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '                 0'
      OnExit = EditHwControleExit
      OnKeyDown = EditHwControleKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object EditHwCondPag: TEditHw
      Left = 23
      Top = 270
      Width = 63
      Height = 21
      TabOrder = 6
      Text = '                 0'
      OnExit = EditHwCondPagExit
      OnKeyDown = EditHwCondPagKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object DBLookupComboBoxCondPag: TDBLookupComboBox
      Left = 92
      Top = 270
      Width = 411
      Height = 21
      KeyField = 'COD_COND_PAG'
      ListField = 'DESC_COND_PAG'
      ListSource = dtmFP.dsCondPagIntermediadorPag
      TabOrder = 7
      OnExit = DBLookupComboBoxCondPagExit
    end
    object cbLocalVenda: TComboBox
      Left = 23
      Top = 86
      Width = 477
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
    end
    object edIdcadinttran: TMaskEdit
      Left = 23
      Top = 178
      Width = 477
      Height = 21
      MaxLength = 60
      TabOrder = 3
      Text = 'edIdcadinttran'
    end
  end
end
