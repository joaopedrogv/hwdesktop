inherited frmCadPerfTribAd: TfrmCadPerfTribAd
  Caption = 'Perfil de Tributa'#231#227'o Adicional'
  ClientHeight = 620
  ExplicitWidth = 806
  ExplicitHeight = 654
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 601
    BevelOuter = bvNone
    ExplicitHeight = 601
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 601
      ExplicitLeft = 799
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 601
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 601
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 601
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 601
        inherited TabSheet1: TTabSheet
          ExplicitWidth = 787
          ExplicitHeight = 570
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 570
            ExplicitWidth = 787
            ExplicitHeight = 570
            inherited PageControl3: TPageControl
              Width = 787
              Height = 522
              ActivePage = tsCadastro
              ExplicitWidth = 787
              ExplicitHeight = 522
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 491
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 491
                  ExplicitWidth = 779
                  ExplicitHeight = 491
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    ExplicitWidth = 775
                  end
                end
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 779
                  Height = 491
                  Align = alClient
                  Caption = 'Cadastro de Perfil de Tributa'#231#227'o Adicional'
                  TabOrder = 0
                  OnEnter = GroupBox4Enter
                  object Label6: TLabel
                    Left = 113
                    Top = 43
                    Width = 33
                    Height = 13
                    Caption = 'Codigo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 100
                    Top = 70
                    Width = 46
                    Height = 13
                    Caption = 'Descri'#231#227'o'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 78
                    Top = 97
                    Width = 68
                    Height = 13
                    Caption = 'Siglas Estados'
                    FocusControl = DBEdit3
                  end
                  object Label9: TLabel
                    Left = 87
                    Top = 124
                    Width = 59
                    Height = 13
                    Caption = 'Contribuinte'
                  end
                  object Label10: TLabel
                    Left = 89
                    Top = 151
                    Width = 57
                    Height = 13
                    Caption = 'Tipo Pessoa'
                  end
                  object Label11: TLabel
                    Left = 99
                    Top = 205
                    Width = 47
                    Height = 13
                    Caption = 'CST ICMS'
                  end
                  object Label12: TLabel
                    Left = 119
                    Top = 232
                    Width = 27
                    Height = 13
                    Caption = 'CFOP'
                    FocusControl = DBEdit4
                  end
                  object Label13: TLabel
                    Left = 33
                    Top = 259
                    Width = 113
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Aliq ICMS Interestadual'
                    FocusControl = DBEdit5
                  end
                  object Label14: TLabel
                    Left = 76
                    Top = 286
                    Width = 70
                    Height = 13
                    Caption = 'Perc. Redu'#231#227'o'
                    FocusControl = DBEdit6
                  end
                  object Label15: TLabel
                    Left = 122
                    Top = 432
                    Width = 543
                    Height = 13
                    BiDiMode = bdLeftToRight
                    Caption = 
                      'Selecione ou remova os estados com um duplo clique ou pressionan' +
                      'do a tecla Espa'#231'o sobre o estado desejado ->'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentBiDiMode = False
                    ParentFont = False
                  end
                  object Label17: TLabel
                    Left = 335
                    Top = 259
                    Width = 182
                    Height = 13
                    Caption = 'Usar redu'#231#227'o do Cadastro do Produto'
                  end
                  object Label19: TLabel
                    Left = 65
                    Top = 176
                    Width = 81
                    Height = 13
                    Caption = 'Consumidor Final'
                  end
                  object Label20: TLabel
                    Left = 478
                    Top = 286
                    Width = 39
                    Height = 13
                    Caption = 'Aliq FCP'
                    FocusControl = DBEdit9
                  end
                  object Label21: TLabel
                    Left = 48
                    Top = 408
                    Width = 98
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Finalidade espec'#237'fica'
                    FocusControl = DBEdit6
                  end
                  object Label22: TLabel
                    Left = 30
                    Top = 381
                    Width = 116
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Motivo de  Desonera'#231#227'o'
                    FocusControl = DBEdit6
                  end
                  object DBEdit1: TDBEdit
                    Left = 152
                    Top = 40
                    Width = 134
                    Height = 21
                    DataField = 'COD_TRIB_PF'
                    DataSource = dtmProdutos.dsPFTribAd
                    Enabled = False
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 152
                    Top = 67
                    Width = 505
                    Height = 21
                    Hint = 'Uma descri'#231#227'o para identificar o perfil'
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO_PF'
                    DataSource = dtmProdutos.dsPFTribAd
                    TabOrder = 1
                  end
                  object DBEdit3: TDBEdit
                    Left = 152
                    Top = 94
                    Width = 505
                    Height = 21
                    Hint = 
                      'Informar aqui para quais estados aplicar a regra quando for util' +
                      'izar este perfil no cadastro do produto'
                    DataField = 'SIGLA_UF'
                    DataSource = dtmProdutos.dsPFTribAd
                    Enabled = False
                    TabOrder = 2
                  end
                  object ListBox1: TListBox
                    Left = 671
                    Top = 40
                    Width = 51
                    Height = 407
                    Hint = 
                      'Informar aqui para quais estados aplicar a regra quando for util' +
                      'izar este perfil no cadastro do produto ou "**" apenas para n'#227'o ' +
                      'vincular a uma UF especifica'
                    Style = lbOwnerDrawFixed
                    ItemHeight = 13
                    Items.Strings = (
                      '**'
                      'AC'
                      'AL'
                      'AM'
                      'AP'
                      'BA'
                      'CE'
                      'DF'
                      'ES'
                      'GO'
                      'MA'
                      'MG'
                      'MS'
                      'MT'
                      'PA'
                      'PB'
                      'PE'
                      'PI'
                      'PR'
                      'RJ'
                      'RN'
                      'RO'
                      'RR'
                      'RS'
                      'SC'
                      'SE'
                      'SP'
                      'TO')
                    TabOrder = 3
                    OnDblClick = ListBox1DblClick
                    OnDrawItem = ListBox1DrawItem
                    OnEnter = ListBox1Enter
                    OnExit = ListBox1Exit
                    OnKeyDown = ListBox1KeyDown
                  end
                  object DBComboBox2: TDBComboBox
                    Left = 152
                    Top = 148
                    Width = 134
                    Height = 21
                    Style = csDropDownList
                    DataField = 'PESSOA'
                    DataSource = dtmProdutos.dsPFTribAd
                    ItemHeight = 0
                    Items.Strings = (
                      'PJ'
                      'PF'
                      'Ambos')
                    TabOrder = 5
                  end
                  object DBComboBox18: TDBComboBox
                    Left = 152
                    Top = 202
                    Width = 134
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CST_ICMS'
                    DataSource = dtmProdutos.dsPFTribAd
                    ItemHeight = 0
                    Items.Strings = (
                      '00'
                      '10'
                      '20'
                      '30'
                      '40'
                      '41'
                      '50'
                      '51'
                      '60'
                      '70'
                      '90')
                    TabOrder = 7
                  end
                  object DBEdit4: TDBEdit
                    Left = 152
                    Top = 229
                    Width = 134
                    Height = 21
                    DataField = 'CODIGO_NOP'
                    DataSource = dtmProdutos.dsPFTribAd
                    TabOrder = 8
                  end
                  object DBEdit5: TDBEdit
                    Left = 152
                    Top = 256
                    Width = 134
                    Height = 21
                    DataField = 'ALIQ_INTER'
                    DataSource = dtmProdutos.dsPFTribAd
                    TabOrder = 9
                  end
                  object DBEdit6: TDBEdit
                    Left = 152
                    Top = 283
                    Width = 134
                    Height = 21
                    DataField = 'PERC_RED_PROD'
                    DataSource = dtmProdutos.dsPFTribAd
                    TabOrder = 11
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 152
                    Top = 121
                    Width = 134
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CONTRIBUINTE'
                    DataSource = dtmProdutos.dsPFTribAd
                    ItemHeight = 0
                    Items.Strings = (
                      'Sim'
                      'Nao'
                      'Ambos')
                    TabOrder = 4
                  end
                  object DBComboBox3: TDBComboBox
                    Left = 523
                    Top = 256
                    Width = 134
                    Height = 21
                    Style = csDropDownList
                    DataField = 'REDUCAO_CAD_PRODUTO'
                    DataSource = dtmProdutos.dsPFTribAd
                    ItemHeight = 0
                    Items.Strings = (
                      'S'
                      'N')
                    TabOrder = 10
                    OnExit = GroupBox4Enter
                  end
                  object GroupBox5: TGroupBox
                    Left = 48
                    Top = 310
                    Width = 617
                    Height = 62
                    Caption = 'Substitui'#231#227'o Tribut'#225'ria e/ou Opera'#231#227'o interna'
                    TabOrder = 13
                    object Label16: TLabel
                      Left = 13
                      Top = 27
                      Width = 85
                      Height = 13
                      Caption = 'Aliq Intraestadual'
                      FocusControl = DBEdit7
                    end
                    object Label18: TLabel
                      Left = 432
                      Top = 27
                      Width = 21
                      Height = 13
                      Caption = 'MVA'
                      FocusControl = DBEdit8
                    end
                    object DBEdit7: TDBEdit
                      Left = 104
                      Top = 24
                      Width = 134
                      Height = 21
                      DataField = 'ALIQ_INTRA'
                      DataSource = dtmProdutos.dsPFTribAd
                      TabOrder = 0
                    end
                    object DBEdit8: TDBEdit
                      Left = 459
                      Top = 24
                      Width = 134
                      Height = 21
                      DataField = 'MVA'
                      DataSource = dtmProdutos.dsPFTribAd
                      TabOrder = 2
                    end
                    object ck_usarmvaanexoxv: TDBCheckBox
                      Left = 253
                      Top = 26
                      Width = 161
                      Height = 17
                      Alignment = taLeftJustify
                      Caption = 'Usar MVA do AnexoXV(CEST)'
                      DataField = 'USAR_MVA_ANEXOXV'
                      DataSource = dtmProdutos.dsPFTribAd
                      TabOrder = 1
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      OnClick = ck_usarmvaanexoxvClick
                    end
                  end
                  object DBComboBox4: TDBComboBox
                    Left = 152
                    Top = 175
                    Width = 134
                    Height = 21
                    Style = csDropDownList
                    DataField = 'CONSUMIDOR_FINAL'
                    DataSource = dtmProdutos.dsPFTribAd
                    ItemHeight = 0
                    Items.Strings = (
                      'Sim'
                      'Nao'
                      'Ambos')
                    TabOrder = 6
                  end
                  object DBEdit9: TDBEdit
                    Left = 523
                    Top = 283
                    Width = 134
                    Height = 21
                    DataField = 'FCP_ALIQ'
                    DataSource = dtmProdutos.dsPFTribAd
                    TabOrder = 12
                  end
                  object DBLookupComboBox1: TDBLookupComboBox
                    Left = 152
                    Top = 405
                    Width = 513
                    Height = 21
                    DataField = 'FINALIDADEID'
                    DataSource = dtmProdutos.dsPFTribAd
                    TabOrder = 15
                  end
                  object DBLookupComboBox2: TDBLookupComboBox
                    Left = 152
                    Top = 378
                    Width = 513
                    Height = 21
                    DataField = 'IND_DESONERACAO'
                    DataSource = dtmProdutos.dsPFTribAd
                    TabOrder = 14
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 522
              Width = 787
              ExplicitTop = 522
              ExplicitWidth = 787
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar dados - [PRO277]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 570
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitWidth = 787
            inherited imgInformation: TImage
              Left = 761
              ExplicitLeft = 765
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO279]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO272]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 497
            ExplicitWidth = 787
            ExplicitHeight = 497
            inherited Splitter1: TSplitter
              Height = 436
              ExplicitHeight = 369
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 436
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO272]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO274]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO276]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [PRO278]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 436
              ExplicitHeight = 436
              inherited ScrollBox2: TScrollBox
                Height = 419
                ExplicitHeight = 419
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 570
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 802
      Top = 0
      Height = 545
      ExplicitLeft = 802
      ExplicitTop = 0
      ExplicitHeight = 545
      inherited bMarketingHW: TBitBtn
        Top = 523
        ExplicitTop = 523
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 601
    ExplicitTop = 601
  end
  inherited pnStatusProcessamento: TPanel
    Left = 780
    Top = 610
    ExplicitLeft = 780
    ExplicitTop = 610
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
