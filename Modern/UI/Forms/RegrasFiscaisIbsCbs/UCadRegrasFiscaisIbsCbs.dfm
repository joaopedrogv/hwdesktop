inherited frmCadRegrasFiscaisIbsCbs: TfrmCadRegrasFiscaisIbsCbs
  Caption = 'Cadastro de Regras Fiscais do IBS e CBS'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    BevelOuter = bvNone
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 545
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 545
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 545
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 545
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 545
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 545
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 514
            ExplicitWidth = 787
            ExplicitHeight = 514
            inherited PageControl3: TPageControl
              Width = 787
              Height = 466
              ActivePage = tabCadastro
              ExplicitWidth = 787
              ExplicitHeight = 466
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 435
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 435
                  ExplicitWidth = 779
                  ExplicitHeight = 435
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    ExplicitWidth = 775
                  end
                end
              end
              object tabCadastro: TTabSheet
                Caption = 'Cadastro'
                ImageIndex = 1
                object Label6: TLabel
                  Left = 66
                  Top = 59
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o'
                end
                object Label7: TLabel
                  Left = 51
                  Top = 16
                  Width = 61
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Classifica'#231#227'o'
                end
                object Label9: TLabel
                  Left = 66
                  Top = 232
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Empresas'
                end
                object Label8: TLabel
                  Left = 21
                  Top = 153
                  Width = 91
                  Height = 13
                  Alignment = taRightJustify
                  Caption = '% Diferimento CBS'
                end
                object Label10: TLabel
                  Left = 274
                  Top = 151
                  Width = 104
                  Height = 13
                  Alignment = taRightJustify
                  Caption = '% Diferimento IBS UF'
                end
                object Label11: TLabel
                  Left = 533
                  Top = 151
                  Width = 134
                  Height = 13
                  Alignment = taRightJustify
                  Caption = '% Diferimento IBS Munic'#237'pio'
                end
                object Label15: TLabel
                  Left = 30
                  Top = 178
                  Width = 82
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'In'#237'cio da vig'#234'ncia'
                end
                object Label16: TLabel
                  Left = 39
                  Top = 205
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fim da vig'#234'ncia'
                end
                object lbRegraFiscalTribRegular: TLabel
                  Left = 39
                  Top = 83
                  Width = 73
                  Height = 40
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Regra Fiscal da Tributa'#231#227'o Regular'
                  WordWrap = True
                end
                object btUnlockRegraTribRegular: TSpeedButton
                  Left = 738
                  Top = 83
                  Width = 23
                  Height = 22
                  Cursor = crHandPoint
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFD5D5D58D8D8D8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C
                    8C8C8C8C8C8C8C8CC5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2640531387D8
                    1289D91289D91289D91289D91289D91289D91289D91289D90F3C5EF3F3F3FFFF
                    FFFFFFFFFFFFFFFFFFFF1648670CABFB0BACFB0BACFB0BACFB0DAAFB0BACFB0B
                    ACFB0BACFB0BACFB095684E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF134D6807B2FC
                    07B3FD07B3FD07B3FD0F599208B1FC07B3FD07B3FD07B3FD055C85E8E8E8FFFF
                    FFFFFFFFFFFFFFFFFFFF10516902BAFE02BAFE02BAFE05B3F7041D2E06A2E202
                    BAFE02BAFE02BAFE016387E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF10536900BEFF
                    00BEFF00BEFF01BFFD007C9601B9F300BEFF00BEFF00BEFF006587E8E8E8FFFF
                    FFFFFFFFFFFFFFFFFFFF10556900C5FF00C4FF00C4FF00C4FF00C4FF00C4FF00
                    C4FF00C4FF00C4FF006A87E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF1C515900D7F8
                    00D9FA00D9FA00D9FA00D9FA00D9FA00DAFB02DCFD00D9FA045E6CF0F0F0FFFF
                    FF7A7A7A3D3A37333130C3C3C37171717070707070707070707070707070703B
                    3531B2AAA4353535AEAEAEFFFFFFFFFFFF6D6D6DB4ABA2454240FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF423E3AB4ABA36F6F6FFFFFFFFFFFFFFFFF
                    FF656565BAB0A8454140FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF48
                    4746C6BEB7484644C5C5C5F3F3F3BFBFBF4E4A48C5BDB64E4D4CFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A57A7471CFCAC67874725D5A587D79
                    76D2CDC9706B69B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFF8989895D5958B4B0AFC8C5C4B1AEAD575554939393FFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E39C9C9C8C8C8C9E9E
                    9EE6E6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btUnlockRegraTribRegularClick
                end
                object lbRegraFiscalTribRegProblem: TLabel
                  Left = 118
                  Top = 129
                  Width = 495
                  Height = 13
                  Cursor = crHandPoint
                  Caption = 
                    'Classifica'#231#227'o Exige Tributa'#231#227'o Regular e Regra Fiscal n'#227'o inform' +
                    'ada. Clique aqu para liberar o cadastro'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clHighlight
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  Visible = False
                  OnClick = lbRegraFiscalTribRegProblemClick
                end
                object edDescricao: TEdit
                  Left = 118
                  Top = 56
                  Width = 643
                  Height = 21
                  CharCase = ecUpperCase
                  Color = clWhite
                  MaxLength = 128
                  TabOrder = 1
                  Text = 'EDDESCRICAO'
                end
                inline CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame
                  Left = 118
                  Top = 229
                  Width = 395
                  Height = 59
                  TabOrder = 5
                  TabStop = True
                  ExplicitLeft = 118
                  ExplicitTop = 229
                  ExplicitWidth = 395
                  ExplicitHeight = 59
                  inherited CheckListBoxEmpresas1: TCheckListBox
                    Width = 395
                    Height = 59
                    ExplicitWidth = 395
                    ExplicitHeight = 59
                  end
                end
                inline ComboBoxClassTribFrame1: TComboBoxClassTribFrame
                  Left = 118
                  Top = 13
                  Width = 643
                  Height = 37
                  TabOrder = 0
                  TabStop = True
                  OnExit = ComboBoxClassTribFrame1Exit
                  ExplicitLeft = 118
                  ExplicitTop = 13
                  ExplicitWidth = 643
                  inherited btDetalhes: TSpeedButton
                    Left = 620
                    ExplicitLeft = 617
                  end
                  inherited edCClassTribList: TComboBox
                    Width = 544
                    ExplicitWidth = 544
                  end
                  inherited pnVigencia: TPanel
                    Width = 643
                    ExplicitWidth = 643
                  end
                end
                object edInicioVigencia: TMaskEdit
                  Left = 118
                  Top = 175
                  Width = 67
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 3
                  Text = '  /  /    '
                end
                inline edFinalVigencia: TMaskEditNullableFrame
                  Left = 118
                  Top = 202
                  Width = 88
                  Height = 21
                  TabOrder = 4
                  TabStop = True
                  ExplicitLeft = 118
                  ExplicitTop = 202
                  ExplicitWidth = 88
                  inherited ckNotNull: TCheckBox
                    Left = 70
                    ExplicitLeft = 70
                  end
                  inherited edMask: TMaskEdit
                    Width = 67
                    ExplicitLeft = 0
                    ExplicitWidth = 67
                  end
                end
                inline ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame
                  Left = 118
                  Top = 83
                  Width = 617
                  Height = 37
                  TabOrder = 2
                  TabStop = True
                  ExplicitLeft = 118
                  ExplicitTop = 83
                  ExplicitWidth = 617
                  inherited pnVigencia: TPanel
                    Width = 617
                    ExplicitWidth = 617
                  end
                  inherited pnRegras: TPanel
                    Width = 617
                    ExplicitWidth = 617
                    inherited btDetalhes: TSpeedButton
                      Left = 595
                      ExplicitLeft = 595
                    end
                    inherited edRegrasFiscais: TComboBox
                      Width = 592
                      ExplicitWidth = 592
                    end
                  end
                end
                object edPDifCbs: TEditHw
                  Left = 118
                  Top = 148
                  Width = 85
                  Height = 21
                  TabOrder = 6
                  Text = '0,0000'
                  Formato = fNumber
                  FormatSize = '0.4'
                  Nullable = True
                end
                object edPDifIbsUf: TEditHw
                  Left = 384
                  Top = 148
                  Width = 85
                  Height = 21
                  TabOrder = 7
                  Text = '0,0000'
                  Formato = fNumber
                  FormatSize = '0.4'
                  Nullable = True
                end
                object edPDifIbsMun: TEditHw
                  Left = 673
                  Top = 148
                  Width = 85
                  Height = 21
                  TabOrder = 8
                  Text = '0,0000'
                  Formato = fNumber
                  FormatSize = '0.4'
                  Nullable = True
                end
              end
            end
            inherited Panel3: TPanel
              Top = 466
              Width = 787
              ExplicitTop = 466
              ExplicitWidth = 787
              inherited LabelSeq: TLabel
                Visible = False
              end
              inherited CheckCadSeq: TCheckBox
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitWidth = 787
            inherited imgInformation: TImage
              Left = 761
              ExplicitLeft = 761
            end
            object SpeedButton9: TSpeedButton [6]
              Left = 417
              Top = 44
              Width = 23
              Height = 22
              Cursor = crHandPoint
              Hint = 'Download tabela fiscal'
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAF3E7CCABEACEABECCFABECCFABEC
                CFABECCFABECCFABECCFABEACEABE7CCABFEFAF3FFFFFFFFFFFFFFFFFFFEFBF5
                EDBE58B66603BF6B03C56F03C66F03C77003C77003C66F03C56F03BF6B03B666
                03ECBC54FEFAF3FFFFFFFFFFFFEEC462E9AF28CE9856D49C56D89E56D99E56D9
                9F56D99F56D99E56D89E56D49C56CE9856E9AF28EEC462FFFFFFFFFFFFEBB42C
                ECB62DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFECB62DEBB42CFFFFFFFFFFFFFAEAC0FAEBC1FFFFFFFFFFFFFFFFFFFFFFFFFE
                FCF7FEFCF7FFFFFFFFFFFFFFFFFFFFFFFFFAEBC1FAEAC0FFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFDFAF1EBBA50EBB84CFDF8EEFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAF1EDBC52E7
                AA24E7A923ECB84CFDF8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFF7E2B0F0C96FE8AD26E8AC25F0C76DF6E0AEFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9
                AF28E9AE27FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAB22AEAB129FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB
                B42BEBB32BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECB72DECB52CFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
                B92FEDB82EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAC1FAEAC0FFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              OnClick = SpeedButton9Click
            end
            object lbProgressDownload: TLabel [7]
              Left = 446
              Top = 48
              Width = 97
              Height = 13
              Caption = 'lbProgressDownload'
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Left = 577
              Top = 50
              Visible = False
              ExplicitLeft = 577
              ExplicitTop = 50
            end
            inherited CheckBox1: TCheckBox
              Left = 672
              Top = 50
              Visible = False
              ExplicitLeft = 672
              ExplicitTop = 50
            end
            object ckLixeira: TCheckBox
              Left = 257
              Top = 50
              Width = 112
              Height = 17
              Caption = 'Pesquisar na lixeira'
              TabOrder = 11
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 441
            ExplicitWidth = 787
            ExplicitHeight = 441
            inherited Splitter1: TSplitter
              Height = 380
              ExplicitHeight = 380
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 380
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton2: TSpeedButton
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton4: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton5: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton6: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton7: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton8: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton11: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton12: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton23: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton24: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton25: TSpeedButton
                Left = 691
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 380
              ExplicitHeight = 380
              inherited ScrollBox2: TScrollBox
                Height = 363
                ExplicitHeight = 363
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 514
        end
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Top = 11
  end
  inherited Timer1: TTimer
    Top = 11
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Top = 11
  end
end
