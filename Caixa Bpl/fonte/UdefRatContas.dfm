inherited FrmRatContas: TFrmRatContas
  Caption = 'Rateio de Conta para Conta...'
  ClientHeight = 302
  ClientWidth = 815
  Position = poScreenCenter
  ExplicitWidth = 823
  ExplicitHeight = 336
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = '[CONTA]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 138
    Width = 815
    Height = 21
    Align = alTop
    Caption = 'CONTAS A RATEAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Panel3: TPanel
    Left = 0
    Top = 270
    Width = 815
    Height = 32
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 3
    object lbQtdeEmp: TLabel
      Left = 776
      Top = 6
      Width = 22
      Height = 13
      Caption = '1 / 1'
      Visible = False
    end
    object lbCPF: TLabel
      Left = 16
      Top = 8
      Width = 27
      Height = 13
      Caption = 'lbCPF'
      Visible = False
    end
    object BitBtn1: TBitBtn
      Left = 328
      Top = 2
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 409
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancela'
      ModalResult = 1
      TabOrder = 1
      OnClick = BitBtn2Click
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 815
    Height = 97
    Align = alTop
    TabOrder = 1
    Visible = False
    object Label9: TLabel
      Left = 31
      Top = 19
      Width = 86
      Height = 13
      Caption = 'Nome do Fornec.:'
    end
    object Label13: TLabel
      Left = 89
      Top = 46
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor:'
    end
    object Label1: TLabel
      Left = 431
      Top = 46
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Cont'#225'bil:'
    end
    object Label2: TLabel
      Left = 72
      Top = 73
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Controle:'
    end
    object EditHwFornec: TEditHw
      Left = 119
      Top = 16
      Width = 53
      Height = 21
      TabOrder = 0
      Text = '0'
      OnExit = EditHwFornecExit
      OnKeyDown = EditHwFornecKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object EditFornec: TEdit
      Left = 178
      Top = 16
      Width = 426
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'EDITFORNEC'
    end
    object EditHwValor: TEditHw
      Left = 119
      Top = 43
      Width = 100
      Height = 21
      TabOrder = 2
      Text = '0,00'
      OnExit = EditHwValorExit
      Formato = fNumber
      FormatSize = '0.2'
    end
    object EditHwValorContabil: TEditHw
      Left = 504
      Top = 43
      Width = 100
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '0,00'
      Formato = fNumber
      FormatSize = '0.2'
    end
    object EditHwControle: TEditHw
      Left = 119
      Top = 70
      Width = 53
      Height = 21
      TabOrder = 4
      Text = '0'
      OnExit = EditHwControleExit
      OnKeyDown = EditHwControleKeyDown
      Formato = fInteger
      FormatSize = '0.2'
    end
    object DBLookupComboBoxControle: TDBLookupComboBox
      Left = 178
      Top = 70
      Width = 426
      Height = 21
      Hint = 'Descri'#231#227'o do controle'
      KeyField = 'CODIGO_CTRL'
      ListField = 'NOME_CTRL;CODIGO_CTRL'
      ListSource = dtmContasAPagar.dsControles
      TabOrder = 5
      OnExit = DBLookupComboBoxControleExit
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 159
    Width = 815
    Height = 111
    Align = alClient
    DataSource = dtmContasAPagar.DtDefRateios
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object IBQuery1: TIBQuery
    Left = 784
    Top = 8
  end
end
