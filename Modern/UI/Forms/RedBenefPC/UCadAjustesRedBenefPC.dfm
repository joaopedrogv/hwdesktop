inherited FrmCadAjustesRedBenefPC: TFrmCadAjustesRedBenefPC
  Left = 0
  Top = 0
  Caption = 
    'Ajustes da redu'#231#227'o do benef'#237'cio fiscal do PIS/COFINS - LC 224/20' +
    '25'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              ActivePage = tabCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tabCadastro: TTabSheet
                Caption = 'Cadastro'
                ImageIndex = 1
                object Label6: TLabel
                  Left = 338
                  Top = 118
                  Width = 76
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST PISCOFINS'
                end
                object Label11: TLabel
                  Left = 117
                  Top = 16
                  Width = 74
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Regra Redu'#231#227'o'
                end
                object Label8: TLabel
                  Left = 98
                  Top = 64
                  Width = 94
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Indicador do Ajuste'
                end
                object Label9: TLabel
                  Left = 332
                  Top = 64
                  Width = 82
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'C'#243'digo do Ajuste'
                end
                object Label15: TLabel
                  Left = 101
                  Top = 118
                  Width = 90
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data de refer'#234'ncia'
                end
                object Label10: TLabel
                  Left = 68
                  Top = 91
                  Width = 124
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Chave do documento DFe'
                end
                object Label12: TLabel
                  Left = 33
                  Top = 145
                  Width = 158
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Detalhamento da base de c'#225'lculo'
                end
                object Label13: TLabel
                  Left = 50
                  Top = 172
                  Width = 142
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Detalhamento da al'#237'quota PIS'
                end
                object Label14: TLabel
                  Left = 351
                  Top = 172
                  Width = 63
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Det Valor PIS'
                end
                object Label16: TLabel
                  Left = 43
                  Top = 199
                  Width = 149
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Detalhamento al'#237'quota COFINS'
                end
                object Label17: TLabel
                  Left = 329
                  Top = 199
                  Width = 85
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Det Valor COFINS'
                end
                object btRegistroSistema: TSpeedButton
                  Left = 33
                  Top = 232
                  Width = 487
                  Height = 33
                  Hint = 'Modificar - [MOD043]'
                  Caption = 'Registro criado pelo sistema. Clique aqui para modificar'
                  OnClick = btRegistroSistemaClick
                end
                object edCST: TMaskEdit
                  Left = 420
                  Top = 115
                  Width = 100
                  Height = 21
                  EditMask = '00;0;_'
                  MaxLength = 2
                  TabOrder = 5
                end
                inline edRegraId: TComboboxEntityPickerFrame
                  Left = 198
                  Top = 13
                  Width = 322
                  Height = 44
                  TabOrder = 0
                  TabStop = True
                  ExplicitLeft = 198
                  ExplicitTop = 13
                  ExplicitWidth = 322
                  ExplicitHeight = 44
                  inherited edEntity: TComboBox
                    Width = 322
                    ExplicitWidth = 298
                  end
                  inherited pnVigencia: TPanel
                    Width = 322
                    ExplicitWidth = 298
                    inherited lbInfo: TLabel
                      Height = 11
                    end
                  end
                end
                object edIndAj: TEditHw
                  Left = 198
                  Top = 61
                  Width = 100
                  Height = 21
                  TabOrder = 1
                  Text = '0'
                  Formato = fInteger
                  FormatSize = '0.2'
                end
                object edCodAj: TEditHw
                  Left = 420
                  Top = 61
                  Width = 100
                  Height = 21
                  TabOrder = 2
                  Text = '00'
                  Formato = fInteger
                  FormatSize = '0.2'
                  DisplayFormat = '00'
                end
                object edDataRef: TMaskEdit
                  Left = 198
                  Top = 115
                  Width = 100
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 4
                  Text = '  /  /    '
                  OnExit = edDataRefExit
                end
                object edChaveDFe: TMaskEdit
                  Left = 198
                  Top = 88
                  Width = 320
                  Height = 21
                  EditMask = '0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000;0;_'
                  MaxLength = 54
                  TabOrder = 3
                end
                object edVBC: TEditHw
                  Left = 197
                  Top = 142
                  Width = 100
                  Height = 21
                  TabOrder = 6
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object edPPisAj: TEditHw
                  Left = 198
                  Top = 169
                  Width = 100
                  Height = 21
                  TabOrder = 7
                  Text = '0,0000'
                  Formato = fNumber
                  FormatSize = '0.4'
                end
                object edVPisAj: TEditHw
                  Left = 420
                  Top = 169
                  Width = 100
                  Height = 21
                  TabOrder = 8
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object edPCofinsAj: TEditHw
                  Left = 198
                  Top = 196
                  Width = 100
                  Height = 21
                  TabOrder = 9
                  Text = '0,0000'
                  Formato = fNumber
                  FormatSize = '0.4'
                end
                object edVCofinsAj: TEditHw
                  Left = 420
                  Top = 196
                  Width = 100
                  Height = 21
                  TabOrder = 10
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
              end
            end
            inherited Panel3: TPanel
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [MOD041]'
              end
              inherited CheckCadSeq: TCheckBox
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            inherited Label1: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label2: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label3: TLabel
              Enabled = False
            end
            inherited Label4: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label5: TLabel
              Enabled = False
              Visible = False
            end
            inherited MaskEdit3: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited MaskEdit1: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited MaskEdit2: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited ComboBox1: TComboBox
              Enabled = False
              Visible = False
            end
            inherited ComboBox2: TComboBox
              Enabled = False
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [MOD038]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [MOD039]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited ComboBox3: TComboBox
              Enabled = False
              Visible = False
            end
            inline FilterFramePadrao1: TFilterFramePadrao
              Left = 3
              Top = 11
              Width = 407
              Height = 54
              TabOrder = 11
              TabStop = True
              ExplicitLeft = 3
              ExplicitTop = 11
              inherited pnCondicao: TPanel
                inherited edCondicao: TComboBox
                  ExplicitLeft = 64
                  ExplicitWidth = 127
                end
              end
              inherited pnConteudos: TPanel
                inherited pnConteudo1: TPanel
                  inherited edConteudo1: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 140
                  end
                end
                inherited pnConteudo2: TPanel
                  inherited edConteudo2: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 72
                  end
                end
                inherited pnBtns: TPanel
                  inherited lbCountFiltros: TLabel
                    Width = 27
                    Height = 21
                  end
                end
              end
            end
          end
          inherited Panel1: TPanel
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [MOD040]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [MOD042]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton4: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton5: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton6: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton7: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton8: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton11: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton12: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton23: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton24: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton25: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
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
end
