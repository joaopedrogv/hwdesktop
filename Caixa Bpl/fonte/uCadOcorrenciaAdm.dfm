inherited frmCadOcorrenciaAdm: TfrmCadOcorrenciaAdm
  Caption = 'Ocorrencia Administradora'
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
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
                inherited ScrollBox3: TScrollBox
                  inherited GroupBox1: TGroupBox
                    Width = 754
                    Height = 432
                    Caption = 'Cadastro de Ocorrencias Administradora'
                    ExplicitWidth = 754
                    ExplicitHeight = 432
                    object Label6: TLabel
                      Left = 111
                      Top = 40
                      Width = 33
                      Height = 13
                      Caption = 'C'#243'digo'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 89
                      Top = 67
                      Width = 55
                      Height = 13
                      Caption = 'Tipo Tabela'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 75
                      Top = 94
                      Width = 70
                      Height = 13
                      Caption = 'ID Tabela Adm'
                      FocusControl = DBEdit3
                    end
                    object Label9: TLabel
                      Left = 44
                      Top = 121
                      Width = 101
                      Height = 13
                      Caption = 'Descri'#231#227'o Ocorrencia'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 31
                      Top = 148
                      Width = 114
                      Height = 13
                      Caption = 'C'#243'digo Pl. Contas Saida'
                      FocusControl = DBEdit5
                    end
                    object Label11: TLabel
                      Left = 19
                      Top = 175
                      Width = 126
                      Height = 13
                      Caption = 'C'#243'digo Pl. Contas Entrada'
                      FocusControl = DBEdit6
                    end
                    object DBEdit1: TDBEdit
                      Left = 150
                      Top = 37
                      Width = 75
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ID_OCORR_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 150
                      Top = 64
                      Width = 401
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO_TABELA_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 151
                      Top = 91
                      Width = 126
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'IDTABELA_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 151
                      Top = 118
                      Width = 401
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESC_OCORR_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      TabOrder = 3
                    end
                    object DBEdit5: TDBEdit
                      Left = 151
                      Top = 145
                      Width = 75
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'N_CONTA_PLC_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      TabOrder = 4
                    end
                    object DBEdit6: TDBEdit
                      Left = 151
                      Top = 172
                      Width = 75
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'N_CONTA_PLCE_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      TabOrder = 5
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 232
                      Top = 145
                      Width = 319
                      Height = 21
                      DataField = 'N_CONTA_PLC_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      KeyField = 'N_CONTA_PLC'
                      ListField = 'DESC_PLC'
                      ListSource = DtmCadBasicosCx.dsPlanoContasBuscaSaida
                      TabOrder = 6
                    end
                    object DBLookupComboBox2: TDBLookupComboBox
                      Left = 232
                      Top = 172
                      Width = 319
                      Height = 21
                      DataField = 'N_CONTA_PLCE_ADM'
                      DataSource = DtmCadBasicosCx.dsOcorrenciaAdm
                      KeyField = 'N_CONTA_PLC'
                      ListField = 'DESC_PLC'
                      ListSource = DtmCadBasicosCx.dsPlanoContasBusca
                      TabOrder = 7
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar - [CXG096]'
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CXG098]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [CXG091]'
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CXG092]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Enviar para Lixeira - [CXG093]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CXG095]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Visible = False
              end
              inherited SpeedButton7: TSpeedButton
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [CXG097]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
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
