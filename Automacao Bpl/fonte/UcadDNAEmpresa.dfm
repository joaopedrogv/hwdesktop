inherited FrmcadDNAEmpresa: TFrmcadDNAEmpresa
  Caption = 'Cadastro do DNA da empresa'
  ClientHeight = 438
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 792
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 438
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 782
      Height = 395
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Cadastro de DNA Empresa'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 367
          Align = alClient
          DataSource = DtmCadBasicos.DtApuracaoDep
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Altera'#231#227'o/Inclus'#227'o de DNA Empresa'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 45
          Top = 11
          Width = 73
          Height = 13
          Caption = 'Departamento:'
        end
        object Label2: TLabel
          Left = 95
          Top = 38
          Width = 23
          Height = 13
          Caption = 'M'#234's:'
        end
        object Label3: TLabel
          Left = 95
          Top = 65
          Width = 23
          Height = 13
          Caption = 'Ano:'
        end
        object Label4: TLabel
          Left = 48
          Top = 120
          Width = 70
          Height = 13
          Caption = 'Tipo de Custo:'
        end
        object Label6: TLabel
          Left = 90
          Top = 146
          Width = 28
          Height = 13
          Caption = 'Valor:'
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 42
          Top = 172
          Width = 76
          Height = 13
          Caption = 'Ponto de Equil.:'
          FocusControl = DBEdit7
        end
        object Label8: TLabel
          Left = 21
          Top = 307
          Width = 97
          Height = 13
          Caption = 'DNA Departamento:'
          FocusControl = DBEdit8
        end
        object Label5: TLabel
          Left = 36
          Top = 196
          Width = 82
          Height = 13
          Caption = 'Perc. do Fat(%):'
          FocusControl = DBEdit3
        end
        object Label9: TLabel
          Left = 8
          Top = 227
          Width = 110
          Height = 13
          Caption = 'Valor Monet'#225'rio Custo:'
          FocusControl = DBEdit4
        end
        object Label10: TLabel
          Left = 43
          Top = 92
          Width = 75
          Height = 13
          Caption = 'Valor Faturado:'
          FocusControl = DBEdit5
        end
        object Label11: TLabel
          Left = 41
          Top = 253
          Width = 77
          Height = 13
          Caption = 'Margem M'#237'nima:'
          FocusControl = DBEdit9
        end
        object Label12: TLabel
          Left = 38
          Top = 280
          Width = 80
          Height = 13
          Caption = 'MARKUP M'#237'nimo:'
          FocusControl = DBEdit10
        end
        object Label13: TLabel
          Left = 264
          Top = 146
          Width = 13
          Height = 13
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label14: TLabel
          Left = 266
          Top = 253
          Width = 60
          Height = 13
          Caption = 'Ex.: 0,6223'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 266
          Top = 280
          Width = 60
          Height = 13
          Caption = 'Ex.: 1,4567'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit6: TDBEdit
          Left = 126
          Top = 138
          Width = 134
          Height = 21
          DataField = 'VALOR'
          DataSource = DtmCadBasicos.DtApuracaoDep
          TabOrder = 5
          OnExit = DBEdit6Exit
        end
        object DBEdit7: TDBEdit
          Left = 126
          Top = 165
          Width = 134
          Height = 21
          DataField = 'PE'
          DataSource = DtmCadBasicos.DtApuracaoDep
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 127
          Top = 299
          Width = 418
          Height = 21
          DataField = 'DNADEP'
          DataSource = DtmCadBasicos.DtApuracaoDep
          Enabled = False
          TabOrder = 11
        end
        object DBComboBox1: TDBComboBox
          Left = 127
          Top = 30
          Width = 74
          Height = 21
          DataField = 'MES'
          DataSource = DtmCadBasicos.DtApuracaoDep
          ItemHeight = 0
          Items.Strings = (
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '10'
            '11'
            '12')
          TabOrder = 1
        end
        object DBEdit2: TDBEdit
          Left = 127
          Top = 57
          Width = 74
          Height = 21
          DataField = 'ANO'
          DataSource = DtmCadBasicos.DtApuracaoDep
          TabOrder = 2
        end
        object DBComboBox2: TDBComboBox
          Left = 126
          Top = 112
          Width = 134
          Height = 21
          DataField = 'TPDESP'
          DataSource = DtmCadBasicos.DtApuracaoDep
          ItemHeight = 0
          Items.Strings = (
            'CF'
            'CMV'
            'OCV'
            'RAT'
            'AIR')
          TabOrder = 4
          OnExit = DBComboBox2Exit
        end
        object DBEdit3: TDBEdit
          Left = 126
          Top = 192
          Width = 59
          Height = 21
          DataField = 'PERC_VALOR'
          DataSource = DtmCadBasicos.DtApuracaoDep
          Enabled = False
          TabOrder = 7
        end
        object DBEdit4: TDBEdit
          Left = 126
          Top = 219
          Width = 134
          Height = 21
          DataField = 'VALOR_DINHEIRO'
          DataSource = DtmCadBasicos.DtApuracaoDep
          Enabled = False
          TabOrder = 8
        end
        object DBEdit5: TDBEdit
          Left = 126
          Top = 84
          Width = 134
          Height = 21
          DataField = 'VALOR_FATURADO'
          DataSource = DtmCadBasicos.DtApuracaoDep
          TabOrder = 3
        end
        object DBEdit9: TDBEdit
          Left = 126
          Top = 245
          Width = 134
          Height = 21
          DataField = 'MARGMIN'
          DataSource = DtmCadBasicos.DtApuracaoDep
          TabOrder = 9
        end
        object DBEdit10: TDBEdit
          Left = 126
          Top = 272
          Width = 134
          Height = 21
          DataField = 'MARKUPMIN'
          DataSource = DtmCadBasicos.DtApuracaoDep
          TabOrder = 10
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 128
          Top = 3
          Width = 132
          Height = 21
          DataField = 'COD_DEP'
          DataSource = DtmCadBasicos.DtApuracaoDep
          KeyField = 'COD_DEP'
          ListField = 'DESC_DEP'
          ListSource = DtmCadBasicos.DtDepto
          TabOrder = 0
        end
        object BitBtn5: TBitBtn
          Left = 185
          Top = 333
          Width = 75
          Height = 25
          Caption = 'OK'
          Default = True
          TabOrder = 12
          OnClick = BitBtn5Click
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
        object BitBtn6: TBitBtn
          Left = 297
          Top = 333
          Width = 75
          Height = 25
          Cancel = True
          Caption = 'Cancel'
          TabOrder = 13
          OnClick = BitBtn6Click
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
    end
    object Panel2: TPanel
      Left = 1
      Top = 396
      Width = 782
      Height = 41
      Align = alBottom
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 4
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Incluir'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 85
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 169
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 250
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 3
        OnClick = BitBtn4Click
      end
    end
  end
end
