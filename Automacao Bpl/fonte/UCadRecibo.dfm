inherited frmCadRecibo: TfrmCadRecibo
  Caption = 'Recibo'
  ClientHeight = 641
  ClientWidth = 826
  Scaled = False
  ExplicitWidth = 834
  ExplicitHeight = 675
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 826
    Height = 622
    ExplicitWidth = 826
    ExplicitHeight = 622
    inherited Splitter2: TSplitter
      Height = 620
      ExplicitHeight = 625
    end
    inherited PanelLeft: TPanel
      Width = 821
      Height = 620
      ExplicitWidth = 821
      ExplicitHeight = 620
      inherited PageControl1: TPageControl
        Width = 819
        Height = 618
        ExplicitWidth = 819
        ExplicitHeight = 618
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 811
          ExplicitHeight = 587
          inherited ScrollBox1: TScrollBox
            Width = 811
            Height = 587
            ExplicitWidth = 811
            ExplicitHeight = 587
            inherited PageControl3: TPageControl
              Width = 811
              Height = 539
              ExplicitWidth = 811
              ExplicitHeight = 539
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 803
                ExplicitHeight = 508
                inherited ScrollBox3: TScrollBox
                  Width = 803
                  Height = 508
                  ExplicitWidth = 803
                  ExplicitHeight = 508
                  inherited GroupBox1: TGroupBox
                    Width = 799
                    Height = 432
                    Caption = ''
                    ParentColor = False
                    ExplicitWidth = 799
                    ExplicitHeight = 432
                    object Shape1: TShape
                      Left = 17
                      Top = 12
                      Width = 744
                      Height = 404
                      Brush.Color = clBtnFace
                    end
                    object Shape2: TShape
                      Left = 592
                      Top = 30
                      Width = 145
                      Height = 69
                    end
                    object Shape3: TShape
                      Left = 32
                      Top = 113
                      Width = 713
                      Height = 1
                      Pen.Style = psDot
                    end
                    object Label6: TLabel
                      Left = 608
                      Top = 33
                      Width = 80
                      Height = 29
                      Caption = 'Recibo'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -24
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 608
                      Top = 62
                      Width = 26
                      Height = 29
                      Caption = 'N'#186
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -24
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 90
                      Top = 176
                      Width = 64
                      Height = 13
                      Caption = 'a import'#226'ncia'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 315
                      Top = 175
                      Width = 54
                      Height = 13
                      Caption = 'Desc. Valor'
                    end
                    object Label11: TLabel
                      Left = 88
                      Top = 200
                      Width = 62
                      Height = 13
                      Caption = 'Referente a:'
                      FocusControl = DBEdit5
                    end
                    object Label12: TLabel
                      Left = 88
                      Top = 320
                      Width = 51
                      Height = 13
                      Caption = 'Local/Data'
                      FocusControl = DBEdit9
                    end
                    object Label8: TLabel
                      Left = 88
                      Top = 148
                      Width = 73
                      Height = 13
                      Caption = 'Recebemos de '
                    end
                    object Label14: TLabel
                      Left = 106
                      Top = 366
                      Width = 55
                      Height = 13
                      Caption = 'Benefici'#225'rio'
                    end
                    object Label13: TLabel
                      Left = 116
                      Top = 394
                      Width = 43
                      Height = 13
                      Caption = 'Pr'#233'posto'
                      FocusControl = DBEdit12
                    end
                    object Label17: TLabel
                      Left = 90
                      Top = 52
                      Width = 4
                      Height = 13
                      Caption = '.'
                    end
                    object Label23: TLabel
                      Left = 648
                      Top = 394
                      Width = 27
                      Height = 13
                      Caption = 'Dpto.'
                      Visible = False
                    end
                    object DBText4: TDBText
                      Left = 29
                      Top = 92
                      Width = 500
                      Height = 17
                      DataField = 'CEPCIDADEUF'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object DBText3: TDBText
                      Left = 29
                      Top = 75
                      Width = 500
                      Height = 17
                      DataField = 'ENDERECO'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object DBText2: TDBText
                      Left = 29
                      Top = 58
                      Width = 500
                      Height = 17
                      DataField = 'CPFCGC'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object DBText1: TDBText
                      Left = 29
                      Top = 41
                      Width = 500
                      Height = 17
                      DataField = 'NOME_CLIENTE'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object lbCodUnificada: TLabel
                      Left = 115
                      Top = 121
                      Width = 44
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Unificada'
                      FocusControl = DBEdit1
                    end
                    object DBEdit1: TDBEdit
                      Left = 640
                      Top = 68
                      Width = 77
                      Height = 21
                      DataField = 'NRECIBO'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 1
                      OnEnter = DBEdit15Enter
                    end
                    object DBEdit4: TDBEdit
                      Left = 167
                      Top = 172
                      Width = 142
                      Height = 21
                      DataField = 'VALOR'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 6
                      OnExit = DBEdit4Exit
                    end
                    object DBEdit5: TDBEdit
                      Left = 88
                      Top = 219
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA1'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 7
                    end
                    object DBEdit6: TDBEdit
                      Left = 88
                      Top = 246
                      Width = 531
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA2'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 8
                    end
                    object DBEdit7: TDBEdit
                      Left = 88
                      Top = 273
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA3'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 9
                    end
                    object DBEdit8: TDBEdit
                      Left = 88
                      Top = 300
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA4'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 10
                    end
                    object DBEdit9: TDBEdit
                      Left = 88
                      Top = 336
                      Width = 532
                      Height = 21
                      DataField = 'LOCALDATA'
                      DataSource = dtmRecibo.dsRecibo
                      Enabled = False
                      TabOrder = 11
                    end
                    object DBEdit2: TDBEdit
                      Left = 240
                      Top = 145
                      Width = 380
                      Height = 21
                      DataField = 'NOME_DEV'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 5
                    end
                    object DBEdit3: TDBEdit
                      Left = 167
                      Top = 364
                      Width = 67
                      Height = 21
                      DataField = 'COD_BENEF'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 13
                      OnExit = DBEdit3Exit
                      OnKeyDown = DBEdit3KeyDown
                    end
                    object DBEdit10: TDBEdit
                      Left = 167
                      Top = 145
                      Width = 67
                      Height = 21
                      DataField = 'COD_DEVEDOR'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 4
                      OnExit = DBEdit10Exit
                      OnKeyDown = DBEdit10KeyDown
                    end
                    object DBEdit12: TDBEdit
                      Left = 167
                      Top = 391
                      Width = 67
                      Height = 21
                      DataField = 'COD_PREP'
                      DataSource = dtmRecibo.dsRecibo
                      Enabled = False
                      TabOrder = 15
                      OnExit = DBEdit12Exit
                      OnKeyDown = DBEdit12KeyDown
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 240
                      Top = 391
                      Width = 380
                      Height = 21
                      DataField = 'COD_PREP'
                      DataSource = dtmRecibo.dsRecibo
                      Enabled = False
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = dtmRecibo.dsPrep
                      TabOrder = 16
                      OnEnter = DBEdit15Enter
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 640
                      Top = 363
                      Width = 379
                      Height = 21
                      DataField = 'COD_BENEF'
                      DataSource = dtmRecibo.dsRecibo
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = dtmRecibo.dsClientes
                      TabOrder = 14
                      Visible = False
                    end
                    object DBComboBox1: TDBComboBox
                      Left = 681
                      Top = 390
                      Width = 78
                      Height = 21
                      DataField = 'DEPREC'
                      DataSource = dtmRecibo.dsRecibo
                      ItemHeight = 13
                      Items.Strings = (
                        'ESTOQUE'
                        'OFICINA '
                        'VE'#205'CULOS')
                      TabOrder = 12
                      Visible = False
                    end
                    object DBEdit15: TDBEdit
                      Left = 240
                      Top = 364
                      Width = 380
                      Height = 21
                      DataField = 'BENEF_CLIENT'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 17
                      OnEnter = DBEdit15Enter
                    end
                    object CheckBox2: TCheckBox
                      Left = 648
                      Top = 168
                      Width = 97
                      Height = 17
                      Caption = 'F6 - Preposto'
                      TabOrder = 0
                      OnClick = CheckBox2Click
                    end
                    object DBCheckBox1: TDBCheckBox
                      Left = 648
                      Top = 145
                      Width = 97
                      Height = 17
                      Caption = 'F5 - Antecipado'
                      DataField = 'RECANT'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 18
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                    object DBEditCodUnificada: TDBEdit
                      Left = 167
                      Top = 118
                      Width = 67
                      Height = 21
                      Hint = 'C'#243'digo Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 2
                      OnExit = DBEditCodUnificadaExit
                    end
                    object DBLookupComboBoxCodUnificada: TDBLookupComboBox
                      Left = 239
                      Top = 118
                      Width = 381
                      Height = 21
                      Hint = 'Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmRecibo.dsRecibo
                      KeyField = 'COD_EMPRESA'
                      ListField = 'IDENTIFICACAO_EMP'
                      ListSource = dtmRecibo.dsEmpresasUnificadas
                      TabOrder = 3
                      OnExit = DBEditCodUnificadaExit
                    end
                  end
                end
              end
              object TabSheet5: TTabSheet
                Caption = 'TabSheet5'
                ImageIndex = 1
                object ScrollBox5: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 803
                  Height = 508
                  Align = alClient
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  TabOrder = 0
                  object GroupBox6: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 782
                    Height = 563
                    Align = alTop
                    Color = clBtnFace
                    ParentColor = False
                    TabOrder = 0
                    object Shape4: TShape
                      Left = 17
                      Top = 10
                      Width = 744
                      Height = 544
                      Brush.Color = clBtnFace
                    end
                    object Label30: TLabel
                      Left = 618
                      Top = 510
                      Width = 27
                      Height = 13
                      Caption = 'Dpto.'
                      Visible = False
                    end
                    object Label20: TLabel
                      Left = 310
                      Top = 185
                      Width = 54
                      Height = 13
                      Caption = 'Desc. Valor'
                    end
                    object Label29: TLabel
                      Left = 88
                      Top = 26
                      Width = 4
                      Height = 13
                      Caption = '.'
                    end
                    object Shape5: TShape
                      Left = 599
                      Top = 14
                      Width = 145
                      Height = 69
                    end
                    object DBText5: TDBText
                      Left = 27
                      Top = 66
                      Width = 500
                      Height = 17
                      DataField = 'CEPCIDADEUF'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object DBText6: TDBText
                      Left = 27
                      Top = 49
                      Width = 500
                      Height = 17
                      DataField = 'ENDERECO'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object DBText7: TDBText
                      Left = 27
                      Top = 32
                      Width = 217
                      Height = 17
                      DataField = 'CPFCGC'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object DBText8: TDBText
                      Left = 27
                      Top = 14
                      Width = 500
                      Height = 17
                      DataField = 'NOME_CLIENTE'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object Label15: TLabel
                      Left = 606
                      Top = 17
                      Width = 80
                      Height = 29
                      Caption = 'Recibo'
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -24
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 606
                      Top = 46
                      Width = 26
                      Height = 29
                      Caption = 'N'#186
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -24
                      Font.Name = 'Arial'
                      Font.Style = [fsBold]
                      ParentFont = False
                    end
                    object Label27: TLabel
                      Left = 39
                      Top = 500
                      Width = 59
                      Height = 13
                      Caption = 'Benefici'#225'rio:'
                    end
                    object Label25: TLabel
                      Left = 44
                      Top = 472
                      Width = 55
                      Height = 13
                      Caption = 'Local/Data:'
                      FocusControl = DBEdit22
                    end
                    object Label33: TLabel
                      Left = 36
                      Top = 400
                      Width = 62
                      Height = 13
                      Caption = 'Observa'#231#227'o:'
                      FocusControl = DBEdit17
                    end
                    object Label24: TLabel
                      Left = 36
                      Top = 305
                      Width = 62
                      Height = 13
                      Caption = 'Referente a:'
                      FocusControl = DBEdit18
                    end
                    object Label32: TLabel
                      Left = 39
                      Top = 233
                      Width = 57
                      Height = 13
                      Caption = 'Atrav'#233's de:'
                      FocusControl = DBEdit17
                    end
                    object Label19: TLabel
                      Left = 31
                      Top = 205
                      Width = 65
                      Height = 13
                      Caption = 'A quantia de:'
                    end
                    object Label26: TLabel
                      Left = 37
                      Top = 179
                      Width = 59
                      Height = 13
                      Caption = 'Recebemos:'
                    end
                    object Label31: TLabel
                      Left = 33
                      Top = 152
                      Width = 65
                      Height = 13
                      Caption = 'Respons'#225'vel:'
                    end
                    object Label34: TLabel
                      Left = 250
                      Top = 205
                      Width = 54
                      Height = 13
                      Caption = 'Desc. Valor'
                    end
                    object Label28: TLabel
                      Left = 49
                      Top = 528
                      Width = 47
                      Height = 13
                      Caption = 'Pr'#233'posto:'
                      FocusControl = DBEdit26
                    end
                    object Shape6: TShape
                      Left = 22
                      Top = 88
                      Width = 713
                      Height = 1
                      Pen.Style = psDot
                    end
                    object Label35: TLabel
                      Left = 26
                      Top = 127
                      Width = 73
                      Height = 13
                      Caption = 'Departamento:'
                    end
                    object DBText9: TDBText
                      Left = 287
                      Top = 32
                      Width = 217
                      Height = 17
                      DataField = 'FONE_CLIENTE'
                      DataSource = dtmRecibo.dsClRec
                    end
                    object lbCodUnificada2: TLabel
                      Left = 51
                      Top = 99
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Unificada:'
                      FocusControl = DBEdit1
                    end
                    object DBLookupComboBox4: TDBLookupComboBox
                      Left = 616
                      Top = 502
                      Width = 379
                      Height = 21
                      DataField = 'COD_BENEF'
                      DataSource = dtmRecibo.dsRecibo
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = dtmRecibo.dsClientes
                      TabOrder = 26
                      Visible = False
                    end
                    object DBComboBox2: TDBComboBox
                      Left = 658
                      Top = 529
                      Width = 78
                      Height = 21
                      DataField = 'DEPREC'
                      DataSource = dtmRecibo.dsRecibo
                      ItemHeight = 13
                      Items.Strings = (
                        'ESTOQUE'
                        'OFICINA '
                        'VE'#205'CULOS')
                      TabOrder = 25
                      Visible = False
                    end
                    object DBEdit16: TDBEdit
                      Left = 638
                      Top = 52
                      Width = 77
                      Height = 21
                      DataField = 'NUM_REC_DEP'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 1
                      OnEnter = DBEdit15Enter
                    end
                    object DBEdit28: TDBEdit
                      Left = 102
                      Top = 149
                      Width = 67
                      Height = 21
                      DataField = 'COD_US'
                      DataSource = dtmRecibo.dsRecibo
                      Enabled = False
                      TabOrder = 5
                      OnExit = DBEdit28Exit
                      OnKeyDown = DBEdit28KeyDown
                    end
                    object DBEdit25: TDBEdit
                      Left = 102
                      Top = 176
                      Width = 67
                      Height = 21
                      DataField = 'COD_DEVEDOR'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 7
                      OnExit = DBEdit10Exit
                      OnKeyDown = DBEdit10KeyDown
                    end
                    object DBEdit23: TDBEdit
                      Left = 172
                      Top = 176
                      Width = 462
                      Height = 21
                      DataField = 'NOME_DEV'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 8
                    end
                    object DBEdit17: TDBEdit
                      Left = 102
                      Top = 203
                      Width = 142
                      Height = 21
                      DataField = 'VALOR'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 9
                      OnExit = DBEdit4Exit
                    end
                    object CheckBox4: TCheckBox
                      Left = 645
                      Top = 151
                      Width = 97
                      Height = 17
                      Caption = 'F6 - Preposto'
                      TabOrder = 0
                      OnClick = CheckBox2Click
                    end
                    object DBCheckBox2: TDBCheckBox
                      Left = 645
                      Top = 128
                      Width = 97
                      Height = 17
                      Caption = 'F5 - Antecipado'
                      DataField = 'RECANT'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 27
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                    end
                    object DBEdit18: TDBEdit
                      Left = 102
                      Top = 302
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA1'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 13
                    end
                    object DBEdit19: TDBEdit
                      Left = 102
                      Top = 325
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA2'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 14
                    end
                    object DBEdit20: TDBEdit
                      Left = 102
                      Top = 347
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA3'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 15
                    end
                    object DBEdit21: TDBEdit
                      Left = 102
                      Top = 369
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'REFERENCIA4'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 16
                    end
                    object DBEdit22: TDBEdit
                      Left = 102
                      Top = 469
                      Width = 532
                      Height = 21
                      DataField = 'LOCALDATA'
                      DataSource = dtmRecibo.dsRecibo
                      Enabled = False
                      TabOrder = 20
                    end
                    object DBEdit24: TDBEdit
                      Left = 102
                      Top = 498
                      Width = 67
                      Height = 21
                      DataField = 'COD_BENEF'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 21
                      OnExit = DBEdit3Exit
                      OnKeyDown = DBEdit3KeyDown
                    end
                    object DBEdit27: TDBEdit
                      Left = 172
                      Top = 498
                      Width = 461
                      Height = 21
                      DataField = 'BENEF_CLIENT'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 22
                      OnEnter = DBEdit15Enter
                    end
                    object DBEdit26: TDBEdit
                      Left = 102
                      Top = 525
                      Width = 67
                      Height = 21
                      DataField = 'COD_PREP'
                      DataSource = dtmRecibo.dsRecibo
                      Enabled = False
                      TabOrder = 23
                      OnExit = DBEdit12Exit
                      OnKeyDown = DBEdit12KeyDown
                    end
                    object DBLookupComboBox3: TDBLookupComboBox
                      Left = 172
                      Top = 525
                      Width = 462
                      Height = 21
                      DataField = 'COD_PREP'
                      DataSource = dtmRecibo.dsRecibo
                      Enabled = False
                      KeyField = 'COD_CLIENTE'
                      ListField = 'NOME_CLIENTE'
                      ListSource = dtmRecibo.dsPrep
                      TabOrder = 24
                      OnEnter = DBEdit15Enter
                    end
                    object DBLookupComboBox5: TDBLookupComboBox
                      Left = 172
                      Top = 149
                      Width = 462
                      Height = 21
                      DataField = 'COD_US'
                      DataSource = dtmRecibo.dsRecibo
                      KeyField = 'COD_VENDEDOR'
                      ListField = 'NOME_VENDEDOR'
                      ListSource = dtmRecibo.dsColaborador
                      TabOrder = 6
                    end
                    object DBEdit29: TDBEdit
                      Left = 102
                      Top = 230
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ATRAVES1'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 10
                    end
                    object DBEdit30: TDBEdit
                      Left = 102
                      Top = 252
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ATRAVES2'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 11
                    end
                    object DBEdit31: TDBEdit
                      Left = 102
                      Top = 274
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ATRAVES3'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 12
                    end
                    object DBEdit32: TDBEdit
                      Left = 102
                      Top = 396
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'OBSERVACAO1'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 17
                    end
                    object DBEdit33: TDBEdit
                      Left = 102
                      Top = 418
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'OBSERVACAO2'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 18
                    end
                    object DBEdit34: TDBEdit
                      Left = 102
                      Top = 440
                      Width = 532
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'OBSERVACAO3'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 19
                    end
                    object DBLookupComboBox6: TDBLookupComboBox
                      Left = 102
                      Top = 122
                      Width = 532
                      Height = 21
                      DataField = 'COD_DEPTO'
                      DataSource = dtmRecibo.dsRecibo
                      KeyField = 'COD_DEPTO'
                      ListField = 'NOME_DEPTO'
                      ListSource = dtmRecibo.dsDepto
                      TabOrder = 4
                      OnExit = DBLookupComboBox6Exit
                    end
                    object DBEditCodUnificada2: TDBEdit
                      Left = 102
                      Top = 96
                      Width = 67
                      Height = 21
                      Hint = 'C'#243'digo Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmRecibo.dsRecibo
                      TabOrder = 2
                    end
                    object DBLookupComboBoxCodUnificada2: TDBLookupComboBox
                      Left = 175
                      Top = 96
                      Width = 459
                      Height = 21
                      Hint = 'Empresa Unificada'
                      DataField = 'COD_EMP_MULT'
                      DataSource = dtmRecibo.dsRecibo
                      KeyField = 'COD_EMPRESA'
                      ListField = 'IDENTIFICACAO_EMP'
                      ListSource = dtmRecibo.dsEmpresasUnificadas
                      TabOrder = 3
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 539
              Width = 811
              ExplicitTop = 539
              ExplicitWidth = 811
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [REC003]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro'
              end
              inherited BitBtn6: TBitBtn
                Hint = 'Sair desta Tela'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 811
          ExplicitHeight = 587
          inherited GroupBox3: TGroupBox
            Width = 811
            ExplicitWidth = 811
            inherited imgInformation: TImage
              Left = 785
              ExplicitLeft = 785
            end
            object SpeedButton40: TSpeedButton [6]
              Left = 656
              Top = 44
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000007B00000084
                0000008C00000094000008940800009C0800089C080008A50800008C1000088C
                100008A5100010A5100018731800318C180021941800109C180010A5180018A5
                180010AD1800317B21005A8421001894210018B52100217B2900399429005294
                2900299C29004AA5290052A5290018AD290018B5290021B52900428C3100399C
                310031A5310021B5310031B5310021BD3100218C390018A5390039A5390029C6
                39006B844200188C4200319C4200399C420042B5420029C642005A944A00429C
                4A007B9C4A0073AD4A008CB54A0052BD4A0031CE4A00525252006B63520039CE
                520031D6520039D652005A5A5A007B735A0018A55A0063A55A008CA55A0021AD
                5A004ACE5A0039D65A0063636300736B6300847363008C73630063C6630073C6
                630042D66300214A6B006B6B6B006B736B0063D66B0042DE6B004ADE6B0042E7
                6B004AE76B00295A73004AE77300294A7B00316B7B00426B7B0073737B00B59C
                7B0084BD7B00B5C67B007BCE7B005AE77B0063E77B0052EF7B00104284002952
                84005263840018848400CEAD840073B5840073D6840052EF84005AEF84000042
                8C00295A8C00426B8C008C8C8C00B5A58C00214A940000529400215294002163
                94006BF7940029639C004A849C0073849C009C9C9C009CA59C0031AD9C00C6B5
                9C000063A5000863A500006BA5001873A5004A94A500A5A5A50094E7A500006B
                AD00086BAD001873AD002173AD009CEFAD008CF7AD001073B500007BB500217B
                B500297BB500218CB5003194B50039A5B500C6BDB500ADEFB500007BBD001884
                BD002184BD00188CBD0063ADBD0073ADBD00A5C6BD00008CC600108CC600298C
                C6001094C60042A5C6009CC6C6000894CE001094CE002994CE00009CCE00089C
                CE00109CCE00189CCE00CECECE00CED6CE00089CD60010A5D60018A5D60029A5
                D60021ADD60039ADD6005AADD60063C6D6009CCED600D6D6D600DEDED60018A5
                DE0021A5DE0029A5DE0042A5DE0031ADDE004AADDE0042B5DE0042BDDE00BDD6
                DE00DEDEDE00E7EFDE0029ADE70039ADE70042ADE70031B5E70039B5E70042B5
                E70052B5E70063BDE7006BC6E70039B5EF004AB5EF0042BDEF004ABDEF0052C6
                EF005AC6EF006BC6EF004ABDF7004AC6F70052C6F700FF00FF005AC6FF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFCFCFCFCFCF
                CFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF7569CFCFCFCFCFCFCFCFCFCFCF
                8483618AA96A6F7BCFCFCFCFCFCFCFCFB6C17B9FB5829A9ECFCFCFCFCFCFCF70
                99C8C7C1B5B3A89A6962CFCFCFCFCF6EBECEC8C3747D9E9A7C71CFCFCFCFCFC4
                C9C8CBBA4C539A9DA294CFCFCFCFCF268DC8CBBA4C56A8A3A3CFCF3F09001839
                78B7ADAF4457A9A9CFCFCF1A50231D39273E2E7937479BA3CFCFCF0D50544339
                2F25110E2ACFCFCFCFCF2823545466651510100619CFCFCFCFCF80725F50AF7F
                17040A1049CFCFCFCFCFCF4A5050AF7F2D25111BCFCFCFCFCFCFCFCF5D50A46C
                303548CFCFCFCFCFCFCFCFCFCF4A6D45341FCFCFCFCFCFCFCFCF}
              OnClick = SpeedButton40Click
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [REC001]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [REC002]'
            end
            inherited CheckBox3: TCheckBox
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Visible = False
            end
            object ckRecebido: TCheckBox
              Left = 448
              Top = 40
              Width = 161
              Height = 15
              Caption = 'Satus recebido [F11]'
              TabOrder = 11
            end
            object ckNaoRecebido: TCheckBox
              Left = 448
              Top = 58
              Width = 161
              Height = 14
              Caption = 'Status n'#227'o recebido [F12]'
              TabOrder = 12
            end
          end
          inherited Panel1: TPanel
            Width = 811
            Height = 514
            ExplicitWidth = 811
            ExplicitHeight = 514
            inherited Splitter1: TSplitter
              Height = 453
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              Width = 518
              Height = 453
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NRECIBO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REFERENCIA1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REFERENCIA2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REFERENCIA3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'REFERENCIA4'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BENEF_CLIENT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME_DEV'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_REC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOCALDATA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RECANT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STATUS_REC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_BENEF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DEPREC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NDOCANT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIA_CXL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_MOV_CXL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBS_CXL_RQ'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STATUS_CXL_RQ'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_RQ_PG_CXL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_BAIXA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HISTORICO_REC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_PREP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SELEC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OP_CXL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_US'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_DEVEDOR'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              Width = 807
              ExplicitWidth = 807
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [REC004]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - Lixeira [REC005] - Definitivo [REC013]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Hint = 'Imprimir - [REC006]'
                OnClick = SpeedButton3Click
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [REC008]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Receber Recibo - [REC009]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000010000EFA53900EFA5
                  5200FFB55200E7AD6B00F7BD6B00AD7B7300AD847300B5847300AD7B7B00AD73
                  84009C7B8400A57B8400AD7B8400B57B8400B5848400BD848400E7B58400BD84
                  8C00C68C8C00CE948C00DEA58C00EFC68C00D69C9400DEA59400B5AD9400EFCE
                  9400B5AD9C00EFCE9C00CEADA500BDB5A500DEC6A500EFCEA500F7D6A500CEBD
                  AD00F7D6AD00F7D6B500F7DEB500DEC6BD00E7CEBD00EFD6BD00F7D6BD00F7DE
                  BD00E7CEC600EFCEC600EFDEC600F7DEC600F7E7C600C6BDCE00DEC6CE00E7D6
                  CE00E7DECE00F7DECE00F7E7CE00ADADD600CEC6D600DECED600E7D6D600EFDE
                  D600F7DED600F7E7D600949CDE009CA5DE00ADA5DE00BDB5DE00C6C6DE00CEC6
                  DE00CECEDE00D6CEDE00F7E7DE00F7EFDE007384E7008C94E7009CA5E700D6CE
                  E700F7EFE700FFF7E700526BEF006B7BEF007B8CEF008C9CEF00F7EFEF00FFF7
                  EF00425AF7005273F700637BF700FFF7F700FFFFF700FF00FF002942FF00294A
                  FF002952FF00315AFF00395AFF004263FF00426BFF004A6BFF006B84FF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00575757080E0E
                  0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E5757575757092C2E29242322201B1B19
                  191919191919190E5757575757092C2E2D292322221F1B1B191919191919190E
                  57575757570933342D2D292322221F1B1B1919191919190E575757575709343B
                  342D29293747301F1B1B19191919190E5757575757093B453B342D354C593C22
                  1F1B1B191919190E57575757570C44453B41605A595A5C30221F1B1B1919190E
                  57575757570D4A4A2F52585C3D4D5A4622221F1B1B19190E57575757570E4A51
                  425F544134435C5B3F22221F1B1B190E57575757570F50514A4A453B3434475A
                  532722221F1B190E5757575757115556514A4A453B34345D5A3D2322221F1B0E
                  575757575712556155514A4A453B343E5A5F302322221F0E5757575757125561
                  6155514A4A453B345459462923221F0E5757575757125561616155514A4A453B
                  40524E392923220E575757575713556161616155514A4A453B36342D29291E0B
                  57575757571355616161616155514A4A453B34342721180A5757575757165561
                  616161616155514A45454532211D1A0A57575757571655616161616161615551
                  4B3907060505050557575757571755616161616161615655512A07100301000E
                  57575757571755616161616161616161562A071504020E575757575757175561
                  616161616161616161310715040E575757575757571761616161616161616161
                  613807150E5757575757575757142627272B262626262525251C070E57575757
                  5757575757575757575757575757575757575757575757575757}
                OnClick = SpeedButton6Click
              end
              inherited SpeedButton7: TSpeedButton
                Hint = 'Detalhes do Recebimento do recibo - [REC014]'
                Glyph.Data = {
                  02050000424D0205000000000000C20200002800000018000000180000000100
                  08000000000040020000120B0000120B0000A3000000A3000000BCBADC00BDB2
                  D000BCACC200FF00FF00BBA6B500B0909900FFFEFE008B5B58008E5D5900905E
                  590093655E00AA807A009E6C630095665E00B5918B009A6A600098685F009F67
                  5A00A06F6400A5726500AB796B00C9A19600F6EFED00AC786700A9766600B17B
                  6900E5D0C900FAF2EF00BA7E6500BA826C00B5806A00BD866D00CA9F8C00D5B1
                  A100EDE0DA00F0E5E000CC917300CA8F7200C58C6F00C1896E00E2C5B600CF8B
                  6400C9876400CE8E6900D1906B00D1967400CF957400DCA78A00CF8E6800D093
                  6F00D4987500E0B69C00EFD4C400F3E2D800F8F0EB00E3BFA700E9CEBB00FFFC
                  FA00FFFBF800FEEEE100FFF3E900FCD0A700FED9B800FEDDC000FFE3C900FEE2
                  C900FEE5CE00FEE6D100FEEAD800FFF4EA00FFF6EE00FFC28400FFC58A00FFC6
                  8C00FFC78E00FFCA9500FFCC9800FFD1A300FFD5AA00FFDDBA00FFDEBC00FCDC
                  BD00FBDCBD00FFEBD700F8E5D300FEEBD900FEF0E200FFF2E500FEF4EA00FEF8
                  F200FFFBF700FFC58600FFC48700FFC58900FFC68B00FFC98C00FFC99100FFCA
                  9100FFCB9300FFCC9700FFCF9C00FFCF9D00FFD09E00FFD09F00FFD1A000FFD3
                  A300FFD4A600FFD4A700FFD7AA00FFD8AD00FFD8AF00FFD9B000FFDAB200FFDC
                  B700FFE0BF00FFE1C000FFE2C400FFE3C400FFE3C500FCE1C500FFE5C900FFE7
                  CC00FFE7CE00FFEBD500FFEDDA00FFEFDD00FFEFDE00FA962100FFCF9800FFD1
                  9C00FFD8AA00FFEAD000FFEED900FFF2E200FFF8F000FEF7EF00FFFAF400FAC6
                  8000F8CB9000FFE2BB00FFF2E100FFE0B500FFE7C400FFF6E900FFEFD500FFFA
                  F200FFF3DE00FFFEFC00FFF7E000FFF7D800FFFEED00FFFFDE00FFFFE300FFFF
                  F000FFFFF400FFFFF700FFFFFA00FFFFFB00FFFFFE0000008200BDBDE500FFFF
                  FF00000000000303030303030311110303030303030303030303030303030303
                  03030303111182111111030303030303030303030303030303030303118E118E
                  8E821109030303030303030303030303030303070A1111111111111111111111
                  1111111111030303030303080A8E8B8D82688061484747474747474711030303
                  030303070D8E52053D3D6881805F5B5B5B5B5B5B110303030303100B1095519F
                  3E8D11111111111111111147110303030303100E0F9477043F8B6967644C4B60
                  4A5E5D5C11030303030310200C94429F418E1111111111111111114911030303
                  03141A2012994402439071706E6C6B4D666463621103030303141A20139D3B9F
                  5590111111111111111111651103030303141522189E3C0156927A7875735071
                  706D4E6A110303031C9E201617A1879F58961111111111111111116F11030303
                  1C9E209E19A15A00599A857E7C5383794074724F110303031C2320A11EA1939F
                  3A9C111111111111111111761103032A352821A11DA1A1A006A188864645578C
                  7D847B971103032B362F38A11FA1A19FA1A11111111111111111119711032B33
                  A12F35A127A1A1A0A1A1A1A1A1A19B969A99989711032B34A12F1BA126A1A1A1
                  A1A1A1A139918F8F9797979711032C29342FA1A125A1A1A1A1A1A1A1A139919B
                  11111111110303033137A1A124A1A1A1A1A1A1A1A1A19DA1118989897F030303
                  293038542EA1A1A1A1A1A1A1A1A1A1A111898A7F03030303030330542DA1A1A1
                  A1A1A1A1A1A1A1A111897F030303030303030329323030303030303030303030
                  117F03030303}
                OnClick = SpeedButton7Click
              end
              inherited SpeedButton8: TSpeedButton
                Left = 349
                Hint = 'Verificar Hist'#243'rico de Recibos - [REC010]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000010000CE630000D66B
                  0000D6730000DE7B0000D6731000D67B2100CE636300E7A563009C9C9C00FF9C
                  9C00FFEFD600FFF7EF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000000000000000000000000
                  0C0C0C0C000D0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A000C0C0C0C000D0B0B
                  0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B060B0B06060B06060B
                  06060B06060B0A000C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A00
                  0C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B06
                  0B0B09090B09090B09090B09090B0A000C0C0C0C000D0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0A000C0C0C0C000D0B060B0B09090B09090B09090B09090B0A00
                  0C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B06
                  0B0B09090B09090B09090B09090B0A000C0C0C0C000D0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0A000C0C0C0C000D0B08080808080808080808080808080B0A00
                  0C0C0C0C000D0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0A000C0C0C0C000D0B0B
                  0B0B09090B09090B09090B09090B0A000C0C0C0C010D0B0B0B0B0B0B0B0B0B0B
                  0B0B0B0B0B0B0A000C0C0C0C010D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0A00
                  0C0C0C0C02030303030303030303030303030303030303000C0C0C0C00000000
                  000000000000000000000000000000070C0C0C0C0C0404040404040404040404
                  040404040404050C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
                  0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C}
                OnClick = SpeedButton8Click
                ExplicitLeft = 349
              end
              inherited SpeedButton11: TSpeedButton
                Hint = 'Alterar departamento - [REC017]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000320B0000320B00000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDE4E4E4
                  E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4FDFDFDFDFDE4090908A4090909090909
                  09090909090909E4FDFDFDFDFDE4FFFF08A5B7F60909090909090909090909E4
                  FDFDFDFDFDE4FFFF07AFAFAF0709090909090909090909E4FDFDFDFDFDE4FFFF
                  FFAFB7276709090909090909090909E4FDFDFDFDFDE4FFFFFFB76F6F1FB70909
                  09090909090909E4FDFDFDFDFDE4FFFFFFFFBF6F6F1F090909090909090909E4
                  FDFDFDFDFDE4FFFFFFFFFF777767F60909090909090909E4FDFDFDFDFDE4FFFF
                  FFFFFFF66FAF670909090909090909E4FDFDFDFDFDE4FFFFFFFFFFFFB76F1F08
                  09090909090909E4FDFDFDFDFDE4F6FFFFFFFFFFF66F276709090909090909E4
                  FDFDFDFDFDE4FFFFF6FFFFFFFFB76F1FB7090909090909E4FDFDFDFDFDE4FFFF
                  FFFFFFFFFFF677271F090909090909E4FDFDFDFDFDE4FFFFFFFFFFFFFFFF6F6F
                  1FAF0909090909E4FDFDFDFDFDECFFFFFFFFFFFFFFFF776F675DF609090909E4
                  FDFDFDFDFDECFFFFFFFFFFFFFFFFFF0707F6F70809F5EDA4FDFDFDFDFDEDFFFF
                  FFFFFFFFFFFFFFF6F7079EAFF5F5EDA4FDFDFDFDFDEDFFFFFFFFFFFFFFFFFFFF
                  EE5656E4E4E4E4E4FDFDFDFDFDEDFFFFFFFFFFFFFFFFFFFFFF07E4FFEBEBEAE4
                  FDFDFDFDFDEDFFFFFFFFFFFFFFFFFFFFFFFFE4FFF3F3E4FDFDFDFDFDFDEDFFFF
                  FFFFFFFFFFFFFFFFFF08E409F3E4FDFDFDFDFDFDFDEDFFFFFFFFFFFFFFFFFFFF
                  FF08E409E4FDFDFDFDFDFDFDFDEC0909090909090909070707EDE4E4FDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
                OnClick = SpeedButton11Click
              end
              inherited SpeedButton12: TSpeedButton
                Hint = 'Enviar boleto por email - [REC023]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000120B0000120B00000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE4E4E4E4E4E4E4
                  E4E4E4E4E4E4E4E4E4E4FDFDFDFDFDFDFDE40909090909090909090909090909
                  09E4FDFDFDFDFD0202020200090009000900090009000900F6E4FDFDFDFD0229
                  21E4F600F600F600F600F600F600F600FFE4FDFDFD022902FDE4F600F600FF00
                  FF00FF00FF00F600FFE4FDFD02282902FDE4FF00F600FF00FF00FF00FF00F600
                  FFE4FDFD02297202FDE4FF00FF00FF00FF00FF00FF00FF00FFE4020202727302
                  0202FF00FF00FF00FF00FF00FF00FF00FFE4020272737C7C2902FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFE4FD02697C7C6A02E4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFE4E4E402737202E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E40909020209
                  09E4FFFFFFFFFFFFFFFFFFFFFF0202FFFFE4E4090909090909E4E4E4E4E4E4E4
                  E4E4E4E402727302E4E4E4F600F600F600F600F600F600F600FFE4026A7C7C69
                  02FDE4F600F600FF00FF00FF00FF00FF00FF02297C7C73720202E4FF00F600FF
                  00FF00FF00FF00FF00FF0202027372020202E4FF00FF00FF00FF00FF00FF00FF
                  00FFE4FD02722902FDFDE4FF00FF00FF00FF00FF00FF00FF00FFE4FD02292802
                  FDFDE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4FD022902FDFDFDE4FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFE4212902FDFDFDFDE4FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF02020202FDFDFDFDFDE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4FDFDFDFDFD
                  FDFDE4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4E4FDFDFDFDFDFDFD}
                OnClick = SpeedButton12Click
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Top = 5
                Hint = 'Ver registros da lixeira - [REC007]'
                OnClick = SpeedButton25Click
                ExplicitTop = 5
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 453
              ExplicitHeight = 453
              inherited ScrollBox2: TScrollBox
                Height = 436
                ExplicitHeight = 436
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 811
          ExplicitHeight = 587
        end
        object tsRecebimento: TTabSheet
          Caption = 'tsRecebimento'
          ImageIndex = 2
          object GroupBox4: TGroupBox
            Left = 3
            Top = 0
            Width = 781
            Height = 153
            TabOrder = 0
            object Label18: TLabel
              Left = 46
              Top = 37
              Width = 68
              Height = 13
              Caption = 'Valor da Baixa'
              FocusControl = DBEdit11
            end
            object Label21: TLabel
              Left = 73
              Top = 64
              Width = 41
              Height = 13
              Caption = 'Hist'#243'rico'
              FocusControl = DBEdit13
            end
            object Label22: TLabel
              Left = 32
              Top = 92
              Width = 82
              Height = 13
              Caption = 'Num. Documento'
              FocusControl = DBEdit14
            end
            object DBEdit11: TDBEdit
              Left = 120
              Top = 34
              Width = 134
              Height = 21
              DataField = 'VALOR_BAIXA'
              DataSource = dtmRecibo.dsHistRecibo
              TabOrder = 0
            end
            object DBEdit13: TDBEdit
              Left = 120
              Top = 61
              Width = 569
              Height = 21
              DataField = 'HISTORICO_REC'
              DataSource = dtmRecibo.dsHistRecibo
              TabOrder = 1
            end
            object DBEdit14: TDBEdit
              Left = 120
              Top = 89
              Width = 134
              Height = 21
              DataField = 'NDOCANT'
              DataSource = dtmRecibo.dsHistRecibo
              TabOrder = 2
            end
            object BitBtn7: TBitBtn
              Left = 120
              Top = 116
              Width = 75
              Height = 25
              Hint = 'Confirmar - [REC011]'
              Caption = 'Confirmar'
              TabOrder = 3
              OnClick = BitBtn7Click
            end
            object BitBtn8: TBitBtn
              Left = 201
              Top = 116
              Width = 75
              Height = 25
              Hint = 'Cancelar'
              Caption = 'Cancelar'
              TabOrder = 4
              OnClick = BitBtn8Click
            end
          end
        end
        object tsHistorico: TTabSheet
          Caption = 'tsHistorico'
          ImageIndex = 3
          object GroupBox5: TGroupBox
            Left = 3
            Top = 3
            Width = 775
            Height = 238
            Caption = 'Detalhes'
            TabOrder = 0
            object DBGrid2: TDBGrid
              Left = 3
              Top = 16
              Width = 758
              Height = 209
              DataSource = dtmRecibo.dsHistRecibo
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_EMPRESA'
                  Title.Caption = 'Cod Unificada'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NRECIBO'
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_REC_DEP'
                  Title.Caption = 'N'#186' Recibo'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'HISTORICO_REC'
                  Width = 269
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_BAIXA'
                  Width = 92
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_RECIBO'
                  Width = 99
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TP_DOC_BAIXA'
                  Title.Caption = 'Tipo Doc Baixa'
                  Width = 64
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NDOCANT'
                  Width = 92
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_REC'
                  Width = 95
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DATA_BAIXA'
                  Width = 85
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TP_BAIXA'
                  Width = 64
                  Visible = True
                end>
            end
          end
          object BitBtn10: TBitBtn
            Left = 372
            Top = 271
            Width = 75
            Height = 25
            Hint = 'Voltar a tela anterior'
            Caption = '&Voltar'
            TabOrder = 1
            OnClick = BitBtn10Click
          end
          object BtnExcluirBaixa: TBitBtn
            Left = 285
            Top = 271
            Width = 75
            Height = 25
            Hint = 'Excluir Registro - [REC012]'
            Caption = '&Excluir'
            TabOrder = 2
            OnClick = BtnExcluirBaixaClick
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 4
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 0
            Width = 811
            Height = 587
            Align = alClient
            TabOrder = 0
            object QuickRep1: TQuickRep
              Left = 1
              Top = 9
              Width = 794
              Height = 1123
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              BeforePrint = QuickRep1BeforePrint
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Functions.Strings = (
                'PAGENUMBER'
                'COLUMNNUMBER'
                'REPORTTITLE')
              Functions.DATA = (
                '0'
                '0'
                #39#39)
              OnPreview = QuickRep1Preview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = A4
              Page.Values = (
                100.000000000000000000
                2970.000000000000000000
                100.000000000000000000
                2100.000000000000000000
                100.000000000000000000
                100.000000000000000000
                0.000000000000000000)
              PrinterSettings.Copies = 1
              PrinterSettings.OutputBin = Auto
              PrinterSettings.Duplex = False
              PrinterSettings.FirstPage = 0
              PrinterSettings.LastPage = 0
              PrinterSettings.UseStandardprinter = False
              PrinterSettings.UseCustomBinCode = False
              PrinterSettings.CustomBinCode = 0
              PrinterSettings.ExtendedDuplex = 0
              PrinterSettings.UseCustomPaperCode = False
              PrinterSettings.CustomPaperCode = 0
              PrinterSettings.PrintMetaFile = False
              PrinterSettings.PrintQuality = 0
              PrinterSettings.Collate = 0
              PrinterSettings.ColorOption = 0
              PrintIfEmpty = True
              ReportTitle = 'Recibo'
              SnapToGrid = True
              Units = MM
              Zoom = 100
              PrevFormStyle = fsNormal
              PreviewInitialState = wsMaximized
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object TitleBand1: TQRBand
                Left = 38
                Top = 38
                Width = 718
                Height = 519
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  1373.187500000000000000
                  1899.708333333333000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbTitle
                object QRShape2: TQRShape
                  Left = 3
                  Top = 163
                  Width = 710
                  Height = 350
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    926.041666666666800000
                    7.937500000000000000
                    431.270833333333400000
                    1878.541666666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRPShape1: TQRPShape
                  Left = 546
                  Top = 172
                  Width = 154
                  Height = 76
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    201.083333333333300000
                    1444.625000000000000000
                    455.083333333333300000
                    407.458333333333300000)
                  Shape = qrpsRectangle
                  VertAdjust = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                end
                object QRHRule1: TQRHRule
                  Left = 12
                  Top = 248
                  Width = 694
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    31.750000000000000000
                    656.166666666666800000
                    1836.208333333333000000)
                  VertAdjust = 0
                  Pen.Style = psDot
                end
                object QRPLabel1: TQRPLabel
                  Left = 569
                  Top = 193
                  Width = 87
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1505.479166666667000000
                    510.645833333333300000
                    230.187500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recibo N'#186
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 12
                end
                object QRPLabel3: TQRPLabel
                  Left = 12
                  Top = 263
                  Width = 121
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    695.854166666666800000
                    320.145833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recebi(emos) de, '
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel5: TQRPLabel
                  Left = 12
                  Top = 286
                  Width = 118
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    756.708333333333400000
                    312.208333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'A import'#226'ncia de:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel6: TQRPLabel
                  Left = 12
                  Top = 338
                  Width = 84
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    894.291666666666800000
                    222.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Referente a:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel7: TQRPLabel
                  Left = 12
                  Top = 427
                  Width = 374
                  Height = 19
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    50.270833333333330000
                    31.750000000000000000
                    1129.770833333333000000
                    989.541666666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Para clareza firmo o presente, como express'#227'o de verdade.'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 11
                end
                object QRPLabel8: TQRPLabel
                  Left = 513
                  Top = 488
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1357.312500000000000000
                    1291.166666666667000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Assinatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 8
                end
                object QRHRule2: TQRHRule
                  Left = 399
                  Top = 481
                  Width = 296
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    1055.687500000000000000
                    1272.645833333333000000
                    783.166666666666800000)
                  VertAdjust = 0
                end
                object QRDBText1: TQRDBText
                  Left = 134
                  Top = 263
                  Width = 73
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    354.541666666666700000
                    695.854166666666800000
                    193.145833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NOME_DEV'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText3: TQRDBText
                  Left = 41
                  Top = 354
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    936.625000000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText4: TQRDBText
                  Left = 41
                  Top = 372
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    984.250000000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText5: TQRDBText
                  Left = 41
                  Top = 391
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    1034.520833333333000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText6: TQRDBText
                  Left = 41
                  Top = 410
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    1084.791666666667000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA4'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText11: TQRDBText
                  Left = 562
                  Top = 219
                  Width = 84
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1486.958333333333000000
                    579.437500000000000000
                    222.250000000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NRECIBO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
                object QRLabel2: TQRLabel
                  Left = 41
                  Top = 309
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    817.562500000000000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel2'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel3: TQRLabel
                  Left = 41
                  Top = 447
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    1182.687500000000000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel3'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText17: TQRDBText
                  Left = 12
                  Top = 172
                  Width = 112
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    455.083333333333300000
                    296.333333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'NOME_CLIENTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText18: TQRDBText
                  Left = 12
                  Top = 190
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    502.708333333333400000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CPFCGC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText19: TQRDBText
                  Left = 12
                  Top = 209
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    552.979166666666700000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'ENDERECO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText20: TQRDBText
                  Left = 12
                  Top = 228
                  Width = 92
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    603.250000000000000000
                    243.416666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CEPCIDADEUF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel30: TQRLabel
                  Left = 392
                  Top = 198
                  Width = 145
                  Height = 41
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    108.479166666666700000
                    1037.166666666667000000
                    523.875000000000000000
                    383.645833333333300000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel30'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
              end
              object SummaryBand1: TQRBand
                Left = 38
                Top = 557
                Width = 718
                Height = 428
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  1132.416666666667000000
                  1899.708333333333000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbSummary
                object QRLabel5: TQRLabel
                  Left = 392
                  Top = 100
                  Width = 140
                  Height = 41
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    108.479166666666700000
                    1037.166666666667000000
                    264.583333333333300000
                    370.416666666666700000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel5'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
                object QRShape1: TQRShape
                  Left = 3
                  Top = 64
                  Width = 710
                  Height = 350
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    926.041666666666800000
                    7.937500000000000000
                    169.333333333333300000
                    1878.541666666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRPShape2: TQRPShape
                  Left = 546
                  Top = 76
                  Width = 154
                  Height = 76
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    201.083333333333300000
                    1444.625000000000000000
                    201.083333333333300000
                    407.458333333333300000)
                  Shape = qrpsRectangle
                  VertAdjust = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                end
                object QRHRule3: TQRHRule
                  Left = 12
                  Top = 152
                  Width = 694
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    31.750000000000000000
                    402.166666666666700000
                    1836.208333333333000000)
                  VertAdjust = 0
                  Pen.Style = psDot
                end
                object QRPLabel2: TQRPLabel
                  Left = 572
                  Top = 95
                  Width = 87
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1513.416666666667000000
                    251.354166666666700000
                    230.187500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recibo N'#186
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 12
                end
                object QRPLabel4: TQRPLabel
                  Left = 12
                  Top = 167
                  Width = 121
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    441.854166666666700000
                    320.145833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recebi(emos) de, '
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel9: TQRPLabel
                  Left = 12
                  Top = 190
                  Width = 118
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    502.708333333333400000
                    312.208333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'A import'#226'ncia de:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel10: TQRPLabel
                  Left = 12
                  Top = 242
                  Width = 84
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    640.291666666666800000
                    222.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Referente a:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel11: TQRPLabel
                  Left = 12
                  Top = 331
                  Width = 374
                  Height = 19
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    50.270833333333330000
                    31.750000000000000000
                    875.770833333333400000
                    989.541666666666800000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Para clareza firmo o presente, como express'#227'o de verdade.'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 11
                end
                object QRPLabel12: TQRPLabel
                  Left = 516
                  Top = 390
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    1365.250000000000000000
                    1031.875000000000000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Assinatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 8
                end
                object QRHRule4: TQRHRule
                  Left = 402
                  Top = 383
                  Width = 296
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    1063.625000000000000000
                    1013.354166666667000000
                    783.166666666666800000)
                  VertAdjust = 0
                end
                object QRDBText2: TQRDBText
                  Left = 134
                  Top = 167
                  Width = 73
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    354.541666666666700000
                    441.854166666666700000
                    193.145833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NOME_DEV'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText9: TQRDBText
                  Left = 41
                  Top = 261
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    690.562500000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText10: TQRDBText
                  Left = 41
                  Top = 279
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    738.187500000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText12: TQRDBText
                  Left = 41
                  Top = 297
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    785.812500000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText13: TQRDBText
                  Left = 41
                  Top = 315
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    833.437500000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA4'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText16: TQRDBText
                  Left = 565
                  Top = 121
                  Width = 84
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1494.895833333333000000
                    320.145833333333400000
                    222.250000000000000000)
                  Alignment = taRightJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NRECIBO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
                object QRLabel8: TQRLabel
                  Left = 41
                  Top = 351
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    928.687500000000000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel3'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText7: TQRDBText
                  Left = 12
                  Top = 132
                  Width = 92
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    349.250000000000000000
                    243.416666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CEPCIDADEUF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText8: TQRDBText
                  Left = 12
                  Top = 112
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    296.333333333333400000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'ENDERECO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText14: TQRDBText
                  Left = 12
                  Top = 94
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    248.708333333333300000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CPFCGC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText15: TQRDBText
                  Left = 12
                  Top = 76
                  Width = 112
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    201.083333333333300000
                    296.333333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'NOME_CLIENTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel7: TQRLabel
                  Left = 41
                  Top = 216
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    571.500000000000000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel7'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape3: TQRShape
                  Left = 0
                  Top = 6
                  Width = 721
                  Height = 417
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    1103.312500000000000000
                    0.000000000000000000
                    15.875000000000000000
                    1907.645833333333000000)
                  Pen.Style = psClear
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
              end
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'TabSheet6'
          ImageIndex = 6
          object ScrollBox6: TScrollBox
            Left = 0
            Top = 0
            Width = 811
            Height = 587
            Align = alClient
            TabOrder = 0
            object QuickRep2: TQuickRep
              Left = -9
              Top = 0
              Width = 794
              Height = 1123
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              BeforePrint = QuickRep2BeforePrint
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              Functions.Strings = (
                'PAGENUMBER'
                'COLUMNNUMBER'
                'REPORTTITLE')
              Functions.DATA = (
                '0'
                '0'
                #39#39)
              OnPreview = QuickRep2Preview
              Options = [FirstPageHeader, LastPageFooter]
              Page.Columns = 1
              Page.Orientation = poPortrait
              Page.PaperSize = A4
              Page.Values = (
                100.000000000000000000
                2970.000000000000000000
                100.000000000000000000
                2100.000000000000000000
                100.000000000000000000
                100.000000000000000000
                0.000000000000000000)
              PrinterSettings.Copies = 1
              PrinterSettings.OutputBin = Auto
              PrinterSettings.Duplex = False
              PrinterSettings.FirstPage = 0
              PrinterSettings.LastPage = 0
              PrinterSettings.UseStandardprinter = False
              PrinterSettings.UseCustomBinCode = False
              PrinterSettings.CustomBinCode = 0
              PrinterSettings.ExtendedDuplex = 0
              PrinterSettings.UseCustomPaperCode = False
              PrinterSettings.CustomPaperCode = 0
              PrinterSettings.PrintMetaFile = False
              PrinterSettings.PrintQuality = 0
              PrinterSettings.Collate = 0
              PrinterSettings.ColorOption = 0
              PrintIfEmpty = True
              ReportTitle = 'Recibo'
              SnapToGrid = True
              Units = MM
              Zoom = 100
              PrevFormStyle = fsNormal
              PreviewInitialState = wsMaximized
              PrevInitialZoom = qrZoomToFit
              PreviewDefaultSaveType = stQRP
              object QRBand1: TQRBand
                Left = 38
                Top = 38
                Width = 718
                Height = 519
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  1373.187500000000000000
                  1899.708333333333000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbTitle
                object QRSchape3: TQRShape
                  Left = 3
                  Top = 115
                  Width = 710
                  Height = 398
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    1053.041666666667000000
                    7.937500000000000000
                    304.270833333333400000
                    1878.541666666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRPShape3: TQRPShape
                  Left = 551
                  Top = 123
                  Width = 154
                  Height = 71
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    187.854166666666700000
                    1457.854166666667000000
                    325.437500000000000000
                    407.458333333333400000)
                  Shape = qrpsRectangle
                  VertAdjust = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                end
                object QRHRule5: TQRHRule
                  Left = 12
                  Top = 195
                  Width = 694
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    31.750000000000000000
                    515.937500000000000000
                    1836.208333333333000000)
                  VertAdjust = 0
                  Pen.Style = psDot
                end
                object QRPLabel13: TQRPLabel
                  Left = 562
                  Top = 137
                  Width = 87
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1486.958333333333000000
                    362.479166666666700000
                    230.187500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recibo N'#186
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 12
                end
                object QRPLabel14: TQRPLabel
                  Left = 12
                  Top = 225
                  Width = 102
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    595.312500000000000000
                    269.875000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recebemos de:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel15: TQRPLabel
                  Left = 12
                  Top = 245
                  Width = 112
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    648.229166666666800000
                    296.333333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'A quantia de: R$'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel16: TQRPLabel
                  Left = 12
                  Top = 318
                  Width = 84
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    841.375000000000000000
                    222.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Referente a:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel17: TQRPLabel
                  Left = 12
                  Top = 442
                  Width = 265
                  Height = 19
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    50.270833333333330000
                    31.750000000000000000
                    1169.458333333333000000
                    701.145833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Por ser verdade, afirmo o presente Recibo'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 11
                end
                object QRPLabel18: TQRPLabel
                  Left = 336
                  Top = 498
                  Width = 61
                  Height = 14
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    37.041666666666670000
                    889.000000000000000000
                    1317.625000000000000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Assinatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 8
                end
                object QRHRule6: TQRHRule
                  Left = 222
                  Top = 491
                  Width = 296
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    587.375000000000000000
                    1299.104166666667000000
                    783.166666666666800000)
                  VertAdjust = 0
                end
                object QRDBText21: TQRDBText
                  Left = 118
                  Top = 225
                  Width = 73
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    312.208333333333400000
                    595.312500000000000000
                    193.145833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NOME_DEV'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText23: TQRDBText
                  Left = 41
                  Top = 336
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    889.000000000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText24: TQRDBText
                  Left = 41
                  Top = 355
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    939.270833333333400000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText25: TQRDBText
                  Left = 41
                  Top = 374
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    989.541666666666800000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA4'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText26: TQRDBText
                  Left = 562
                  Top = 163
                  Width = 136
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1486.958333333333000000
                    431.270833333333400000
                    359.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NUM_REC_DEP'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
                object QRLabel1: TQRLabel
                  Left = 131
                  Top = 245
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    346.604166666666700000
                    648.229166666666800000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel1'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel4: TQRLabel
                  Left = 41
                  Top = 461
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    1219.729166666667000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel4'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText27: TQRDBText
                  Left = 12
                  Top = 124
                  Width = 112
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    328.083333333333400000
                    296.333333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'NOME_CLIENTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText28: TQRDBText
                  Left = 12
                  Top = 142
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    375.708333333333400000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CPFCGC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText29: TQRDBText
                  Left = 12
                  Top = 161
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    425.979166666666700000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'ENDERECO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText30: TQRDBText
                  Left = 12
                  Top = 180
                  Width = 92
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    476.250000000000000000
                    243.416666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CEPCIDADEUF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel6: TQRLabel
                  Left = 400
                  Top = 150
                  Width = 145
                  Height = 41
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    108.479166666666700000
                    1058.333333333333000000
                    396.875000000000000000
                    383.645833333333400000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel6'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
                object QRPLabel25: TQRPLabel
                  Left = 12
                  Top = 204
                  Width = 88
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    539.750000000000000000
                    232.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Respons'#225'vel:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRDBText41: TQRDBText
                  Left = 105
                  Top = 204
                  Width = 117
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    277.812500000000000000
                    539.750000000000000000
                    309.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsColaborador
                  DataField = 'NOME_VENDEDOR'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRPLabel26: TQRPLabel
                  Left = 12
                  Top = 266
                  Width = 79
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    703.791666666666800000
                    209.020833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Atrav'#233's de:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel27: TQRPLabel
                  Left = 12
                  Top = 391
                  Width = 85
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    1034.520833333333000000
                    224.895833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Observa'#231#227'o:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRDBText22: TQRDBText
                  Left = 101
                  Top = 318
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    267.229166666666700000
                    841.375000000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText43: TQRDBText
                  Left = 236
                  Top = 142
                  Width = 99
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    624.416666666666800000
                    375.708333333333400000
                    261.937500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'FONE_CLIENTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText46: TQRDBText
                  Left = 41
                  Top = 284
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    751.416666666666800000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'ATRAVES2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText47: TQRDBText
                  Left = 41
                  Top = 302
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    799.041666666666800000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'ATRAVES3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText48: TQRDBText
                  Left = 41
                  Top = 409
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    1082.145833333333000000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'OBSERVACAO2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText49: TQRDBText
                  Left = 41
                  Top = 427
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    1129.770833333333000000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'OBSERVACAO3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText50: TQRDBText
                  Left = 103
                  Top = 391
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    272.520833333333400000
                    1034.520833333333000000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'OBSERVACAO1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText56: TQRDBText
                  Left = 97
                  Top = 266
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    256.645833333333400000
                    703.791666666666800000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'ATRAVES1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
              end
              object SummaryBand2: TQRBand
                Left = 38
                Top = 557
                Width = 718
                Height = 518
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                AlignToBottom = False
                Color = clWhite
                TransparentBand = False
                ForceNewColumn = False
                ForceNewPage = False
                Size.Values = (
                  1370.541666666667000000
                  1899.708333333333000000)
                PreCaluculateBandHeight = False
                KeepOnOnePage = False
                BandType = rbSummary
                object QRShape6: TQRShape
                  Left = 643
                  Top = 33
                  Width = 721
                  Height = 409
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    1082.145833333333000000
                    1701.270833333333000000
                    87.312500000000000000
                    1907.645833333333000000)
                  Pen.Style = psClear
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRShape4: TQRShape
                  Left = 3
                  Top = 61
                  Width = 710
                  Height = 398
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    1053.041666666667000000
                    7.937500000000000000
                    161.395833333333300000
                    1878.541666666667000000)
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
                object QRPShape4: TQRPShape
                  Left = 551
                  Top = 67
                  Width = 154
                  Height = 71
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    187.854166666666700000
                    1457.854166666667000000
                    177.270833333333300000
                    407.458333333333400000)
                  Shape = qrpsRectangle
                  VertAdjust = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                end
                object QRHRule7: TQRHRule
                  Left = 12
                  Top = 139
                  Width = 694
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    31.750000000000000000
                    367.770833333333400000
                    1836.208333333333000000)
                  VertAdjust = 0
                  Pen.Style = psDot
                end
                object QRPLabel19: TQRPLabel
                  Left = 562
                  Top = 81
                  Width = 87
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1486.958333333333000000
                    214.312500000000000000
                    230.187500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recibo N'#186
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 12
                end
                object QRPLabel20: TQRPLabel
                  Left = 12
                  Top = 169
                  Width = 102
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    447.145833333333400000
                    269.875000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Recebemos de:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel21: TQRPLabel
                  Left = 12
                  Top = 189
                  Width = 112
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    500.062500000000100000
                    296.333333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'A quantia de: R$'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel22: TQRPLabel
                  Left = 12
                  Top = 262
                  Width = 84
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    693.208333333333400000
                    222.250000000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Referente a:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel23: TQRPLabel
                  Left = 12
                  Top = 386
                  Width = 265
                  Height = 19
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    50.270833333333330000
                    31.750000000000000000
                    1021.291666666667000000
                    701.145833333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Por ser verdade, afirmo o presente Recibo'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -15
                  Font.Name = 'Times New Roman'
                  Font.Style = [fsBold, fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 11
                end
                object QRPLabel24: TQRPLabel
                  Left = 336
                  Top = 443
                  Width = 61
                  Height = 14
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    37.041666666666670000
                    889.000000000000000000
                    1172.104166666667000000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Assinatura'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Verdana'
                  Font.Style = [fsItalic]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 8
                end
                object QRHRule8: TQRHRule
                  Left = 222
                  Top = 436
                  Width = 296
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    26.458333333333330000
                    587.375000000000000000
                    1153.583333333333000000
                    783.166666666666800000)
                  VertAdjust = 0
                end
                object QRDBText31: TQRDBText
                  Left = 118
                  Top = 169
                  Width = 73
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    312.208333333333400000
                    447.145833333333400000
                    193.145833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NOME_DEV'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText32: TQRDBText
                  Left = 41
                  Top = 280
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    740.833333333333400000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText33: TQRDBText
                  Left = 41
                  Top = 299
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    791.104166666666800000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText34: TQRDBText
                  Left = 41
                  Top = 318
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    841.375000000000000000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA4'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText35: TQRDBText
                  Left = 562
                  Top = 107
                  Width = 136
                  Height = 20
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    52.916666666666670000
                    1486.958333333333000000
                    283.104166666666700000
                    359.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'NUM_REC_DEP'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
                object QRLabel9: TQRLabel
                  Left = 131
                  Top = 189
                  Width = 61
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    346.604166666666700000
                    500.062500000000100000
                    161.395833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel1'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel10: TQRLabel
                  Left = 41
                  Top = 405
                  Width = 69
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    1071.562500000000000000
                    182.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'QRLabel10'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText36: TQRDBText
                  Left = 12
                  Top = 68
                  Width = 112
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    179.916666666666700000
                    296.333333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'NOME_CLIENTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText37: TQRDBText
                  Left = 12
                  Top = 86
                  Width = 53
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    227.541666666666700000
                    140.229166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CPFCGC'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText38: TQRDBText
                  Left = 12
                  Top = 105
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    277.812500000000000000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'ENDERECO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText39: TQRDBText
                  Left = 12
                  Top = 124
                  Width = 92
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    328.083333333333400000
                    243.416666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'CEPCIDADEUF'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRLabel11: TQRLabel
                  Left = 400
                  Top = 94
                  Width = 145
                  Height = 41
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    108.479166666666700000
                    1058.333333333333000000
                    248.708333333333300000
                    383.645833333333400000)
                  Alignment = taCenter
                  AlignToBand = False
                  AutoSize = False
                  AutoStretch = False
                  Caption = 'QRLabel6'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 12
                end
                object QRPLabel28: TQRPLabel
                  Left = 12
                  Top = 148
                  Width = 88
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    391.583333333333400000
                    232.833333333333400000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Respons'#225'vel:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRDBText40: TQRDBText
                  Left = 105
                  Top = 148
                  Width = 117
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    277.812500000000000000
                    391.583333333333400000
                    309.562500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsColaborador
                  DataField = 'NOME_VENDEDOR'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRPLabel29: TQRPLabel
                  Left = 12
                  Top = 210
                  Width = 79
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    555.625000000000000000
                    209.020833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Atrav'#233's de:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRPLabel30: TQRPLabel
                  Left = 12
                  Top = 335
                  Width = 85
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    31.750000000000000000
                    886.354166666666900000
                    224.895833333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Caption = 'Observa'#231#227'o:'
                  Color = clWhite
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  Degree = 0
                  FixBottomPosition = False
                  StretchHeightWithBand = False
                  FontSize = 10
                end
                object QRDBText42: TQRDBText
                  Left = 102
                  Top = 262
                  Width = 89
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    269.875000000000000000
                    693.208333333333400000
                    235.479166666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'REFERENCIA1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText44: TQRDBText
                  Left = 236
                  Top = 86
                  Width = 99
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    624.416666666666800000
                    227.541666666666700000
                    261.937500000000000000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsClrec
                  DataField = 'FONE_CLIENTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText45: TQRDBText
                  Left = 99
                  Top = 210
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    261.937500000000000000
                    555.625000000000000000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'ATRAVES1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText51: TQRDBText
                  Left = 41
                  Top = 227
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    600.604166666666800000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'ATRAVES2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText52: TQRDBText
                  Left = 41
                  Top = 245
                  Width = 70
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    648.229166666666800000
                    185.208333333333300000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'ATRAVES3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText53: TQRDBText
                  Left = 104
                  Top = 335
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    275.166666666666700000
                    886.354166666666900000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'OBSERVACAO1'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText54: TQRDBText
                  Left = 41
                  Top = 352
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    931.333333333333500000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'OBSERVACAO2'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRDBText55: TQRDBText
                  Left = 41
                  Top = 372
                  Width = 98
                  Height = 17
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    44.979166666666670000
                    108.479166666666700000
                    984.249999999999900000
                    259.291666666666700000)
                  Alignment = taLeftJustify
                  AlignToBand = False
                  AutoSize = True
                  AutoStretch = False
                  Color = clWhite
                  DataSet = dtmRecibo.cdsRecibo
                  DataField = 'OBSERVACAO3'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  Transparent = False
                  WordWrap = True
                  ExportAs = exptText
                  FontSize = 10
                end
                object QRShape5: TQRShape
                  Left = 0
                  Top = 16
                  Width = 721
                  Height = 496
                  Frame.Color = clBlack
                  Frame.DrawTop = False
                  Frame.DrawBottom = False
                  Frame.DrawLeft = False
                  Frame.DrawRight = False
                  Size.Values = (
                    1312.333333333333000000
                    0.000000000000000000
                    42.333333333333340000
                    1907.645833333333000000)
                  Pen.Style = psClear
                  Shape = qrsRectangle
                  VertAdjust = 0
                end
              end
            end
          end
        end
        object tsImpressao: TTabSheet
          Caption = 'tsImpressao'
          ImageIndex = 7
          object pnImpressao: TPanel
            Left = 3
            Top = 32
            Width = 382
            Height = 169
            TabOrder = 0
            object Panel67: TPanel
              Left = 1
              Top = 127
              Width = 380
              Height = 41
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn55: TBitBtn
                Left = 110
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Imprimir'
                Caption = '&Imprimir'
                TabOrder = 0
                OnClick = BitBtn55Click
                Glyph.Data = {
                  42020000424D4202000000000000420000002800000010000000100000000100
                  10000300000000020000120B0000120B00000000000000000000007C0000E003
                  00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C1F7C1F7C4B294B296C2D8D31AE35EF3DF03DCF39AD358C316B2D
                  4B291F7C1F7C1F7C1F7C9245DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
                  92451F7C1F7CB75D3146EF3DD65AFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F1963
                  EF3D3146B75D1042F75E734E6C2D5A6B5A6B5A6B5A6B5A6B5A6B5A6B5A6BF03D
                  734EF75E104210429452AE358610861086108610861086108610861086108610
                  AE35945210423146F75EAE358610861086108610861086108610861086108610
                  AE35F75E3146524ABD7795523246324632463246324632463246324632463246
                  9552BD77524A3146BD77F85ED85AD85AD85AD85AD85AD85AD85AD85AD85AD85A
                  F85EBD7731469A69524AB656D75AD75AD75AD75AD75AD75AD75AD75AD75AD75A
                  B656524A9A691F7C1F7C1F7CAD357B6FDE7BDE7BDE7BDE7BFF7FFF7F7B6FAD35
                  1F7C1F7C1F7C1F7C1F7C1F7CCE397B6FDE7BDE7BDE7BDE7BDE7BFF7F7B6FCE39
                  1F7C1F7C1F7C1F7C1F7C1F7CF03D7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6FF03D
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C7B6FDE7BDE7BDE7BDE7BDE7BDE7B7B6F1F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C186339673967396739673967396718631F7C
                  1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
                  1F7C1F7C1F7C}
              end
              object BitBtn56: TBitBtn
                Left = 191
                Top = 6
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = BitBtn56Click
                Glyph.Data = {
                  E6010000424DE60100000000000036000000280000000C0000000C0000000100
                  180000000000B0010000C40E0000C40E00000000000000000000FFFFFF9E9EDA
                  9696BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484BF9B9BC0FFFFFF9C9C
                  ED0000C50000B69191BAFFFFFFFFFFFFFFFFFFFFFFFF7F7FC500009100008FA2
                  A2C64848EC0000DD0000D50000BC9292BBFFFFFFFFFFFF7A7AC80000A30000A7
                  0000938F8FC9FFFFFF3636EF0000E60000DE0000C99999BD6B6BCE0000AD0000
                  B40000A67D7DCBFFFFFFFFFFFFFFFFFF3838EF0000E60101E40000D40000C401
                  01BE0000AF7474CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626F10000EA0000E9
                  0000DD0000CE5F5FD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8DE10F0F
                  ED0C0CEC0303EC0000E28E8EC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484DD39
                  39E86868ED5A5AF04848F03F3FF21212E69E9EC4FFFFFFFFFFFFFFFFFF8787DD
                  4B4BE16A6AE75959E88C8CE67070ED6868F36D6DF64343E89E9EC6FFFFFF8A8A
                  DD4D4DDE7373E46868E48E8EE4FFFFFFFFFFFF7B7BEB6C6CF06F6FF73D3DEAA6
                  A6CE8787E36262DD6767E09191E3FFFFFFFFFFFFFFFFFFFFFFFF8080E96D6DEF
                  5555F2A4A4E9FFFFFF8F8FE49393E2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF7D7DE9A4A4EDFFFFFF}
              end
            end
            object RadioGroup1: TRadioGroup
              Left = 1
              Top = 1
              Width = 380
              Height = 60
              Align = alTop
              Caption = 'Exibir'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Valor restante'
                'Valor original')
              TabOrder = 0
            end
            object RadioGroup2: TRadioGroup
              Left = 1
              Top = 61
              Width = 380
              Height = 60
              Align = alTop
              Caption = 'C'#243'pias por p'#225'gina'
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                '1 C'#243'pia'
                '2 C'#243'pias')
              TabOrder = 1
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 656
      Top = 269
      ExplicitLeft = 656
      ExplicitTop = 269
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 622
    Width = 826
    ExplicitTop = 622
    ExplicitWidth = 826
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 28
    Top = 233
  end
  inherited PopupMenu2: TPopupMenu
    Left = 518
    Top = 3
  end
  inherited Timer1: TTimer
    Top = 19
  end
end
