inherited frmCadTipoReserva: TfrmCadTipoReserva
  Caption = 'Tipo de Reserva'
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
                    Height = 427
                    Caption = ''
                    OnEnter = GroupBox1Enter
                    ExplicitHeight = 427
                    object Label_Codigo: TLabel
                      Left = 93
                      Top = 50
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 80
                      Top = 106
                      Width = 50
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 106
                      Top = 77
                      Width = 24
                      Height = 13
                      Caption = 'Tipo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 101
                      Top = 130
                      Width = 26
                      Height = 13
                      Caption = 'Sigla:'
                      FocusControl = DBEdit_Sigla
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 52
                      Top = 157
                      Width = 78
                      Height = 13
                      Caption = 'Ordem exibi'#231#227'o:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label6: TLabel
                      Left = 66
                      Top = 184
                      Width = 64
                      Height = 13
                      Caption = 'Dias reserva:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label8: TLabel
                      Left = 93
                      Top = 233
                      Width = 37
                      Height = 13
                      Caption = 'Cliente:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label11: TLabel
                      Left = 80
                      Top = 261
                      Width = 50
                      Height = 13
                      Caption = 'Vendedor:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label12: TLabel
                      Left = 48
                      Top = 314
                      Width = 82
                      Height = 13
                      Caption = 'Retirar reservas:'
                      FocusControl = DBEdit_Ordem
                      WordWrap = True
                    end
                    object Label13: TLabel
                      Left = 284
                      Top = 313
                      Width = 320
                      Height = 13
                      Caption = '* Retirar reservas vencidas automaticamente ao entrar no sistema'
                      Color = clBtnFace
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = False
                      ParentFont = False
                    end
                    object Label16: TLabel
                      Left = 8
                      Top = 286
                      Width = 119
                      Height = 13
                      Caption = 'Visualizar reservas venc:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label17: TLabel
                      Left = 284
                      Top = 286
                      Width = 143
                      Height = 13
                      Caption = '* Visualizar reservas vencidas'
                      Color = clBtnFace
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = False
                      ParentFont = False
                    end
                    object Label15: TLabel
                      Left = 25
                      Top = 333
                      Width = 105
                      Height = 26
                      BiDiMode = bdRightToLeft
                      Caption = 'Dias para exibir alerta vencimento:'
                      FocusControl = DBEdit_Ordem
                      ParentBiDiMode = False
                      WordWrap = True
                    end
                    object Label18: TLabel
                      Left = 75
                      Top = 208
                      Width = 55
                      Height = 13
                      Caption = 'Dias renov:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label19: TLabel
                      Left = 237
                      Top = 183
                      Width = 145
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dias reserva ap'#243's assembl'#233'ia:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label20: TLabel
                      Left = 246
                      Top = 206
                      Width = 136
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Dias renov ap'#243's assembl'#233'ia:'
                      FocusControl = DBEdit_Ordem
                    end
                    object Label21: TLabel
                      Left = 41
                      Top = 363
                      Width = 86
                      Height = 26
                      BiDiMode = bdRightToLeft
                      Caption = 'Dias reserva ap'#243's vencimento:'
                      FocusControl = DBEdit_Ordem
                      ParentBiDiMode = False
                      WordWrap = True
                    end
                    object Label22: TLabel
                      Left = 192
                      Top = 363
                      Width = 412
                      Height = 26
                      Caption = 
                        '*  Intervalo de dias que o vendedor/cliente pode efetuar a reser' +
                        'va do mesmo ve'#237'culo ap'#243's seu vencimento ou ap'#243's retirar reserva.'
                      Color = clBtnFace
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ParentColor = False
                      ParentFont = False
                      WordWrap = True
                    end
                    object DBEdit_Descricao: TDBEdit
                      Left = 133
                      Top = 101
                      Width = 398
                      Height = 21
                      Hint = 'Descri'#231#227'o do tipo de reserva'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      MaxLength = 49
                      TabOrder = 2
                    end
                    object DBEdit_Codigo: TDBEdit
                      Left = 133
                      Top = 47
                      Width = 49
                      Height = 21
                      Hint = 'C'#243'digo do tipo de reserva'
                      CharCase = ecUpperCase
                      DataField = 'CODIGO'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      Enabled = False
                      MaxLength = 9
                      TabOrder = 0
                    end
                    object DBComboBox_Tipo: TDBComboBox
                      Left = 133
                      Top = 74
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'TIPO_RES'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      ItemHeight = 0
                      Items.Strings = (
                        'V - VENDA'
                        'M - MONTAGEM'
                        'B - FATURAMENTO BANCO'
                        'C - CONSORCIO'
                        'F - FILA'
                        'T - TRANSITO')
                      TabOrder = 1
                      OnExit = DBComboBox_TipoExit
                    end
                    object DBEdit_Sigla: TDBEdit
                      Left = 133
                      Top = 127
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'SIGLA'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 3
                    end
                    object DBEdit_Ordem: TDBEdit
                      Left = 133
                      Top = 154
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'ORDEMEXIBICAO'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 4
                    end
                    object DBEdit_DiasReserva: TDBEdit
                      Left = 133
                      Top = 180
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'QUANT_DIAS_RESERVA'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 5
                    end
                    object DBComboBox_Cliente: TDBComboBox
                      Left = 133
                      Top = 230
                      Width = 398
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CONFIG_CLIENTE'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      ItemHeight = 0
                      Items.Strings = (
                        'V - VALIDAR'
                        'M - EXIBIR MENSAGEM'
                        'N - N'#195'O VALIDAR E N'#195'O EXIBIR MENSAGEM')
                      TabOrder = 9
                    end
                    object DBComboBox_Vendedor: TDBComboBox
                      Left = 133
                      Top = 257
                      Width = 398
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'CONFIG_VENDEDOR'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      ItemHeight = 0
                      Items.Strings = (
                        'V - VALIDAR'
                        'M - EXIBIR MENSAGEM'
                        'N - N'#195'O VALIDAR E N'#195'O EXIBIR MENSAGEM')
                      TabOrder = 10
                    end
                    object DBComboBox_RetirarReservas: TDBComboBox
                      Left = 133
                      Top = 311
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'RETIRAR_RESERVAS_VENC'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      ItemHeight = 0
                      Items.Strings = (
                        'S - SIM'
                        'N - N'#195'O')
                      TabOrder = 12
                      OnExit = DBComboBox_TipoExit
                    end
                    object DBComboBox_VisualizarReservas: TDBComboBox
                      Left = 133
                      Top = 284
                      Width = 145
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'VISUALIZAR_RESERVAS_VENC'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      ItemHeight = 0
                      Items.Strings = (
                        'S - SIM'
                        'N - N'#195'O')
                      TabOrder = 11
                      OnExit = DBComboBox_TipoExit
                    end
                    object DBEdit_DiasExibirVencimento: TDBEdit
                      Left = 133
                      Top = 339
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MENSAGEM_VENC_DIAS'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 13
                    end
                    object DBEdit_DiasRenov: TDBEdit
                      Left = 133
                      Top = 205
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DIAS_RENOV'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 7
                    end
                    object DBEdit_DiasReservaAss: TDBEdit
                      Left = 383
                      Top = 180
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'QUANT_DIAS_RESERVA_ASS'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 6
                    end
                    object DBEdit_DiasRenovAss: TDBEdit
                      Left = 383
                      Top = 203
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DIAS_RENOV_ASS'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 8
                    end
                    object DBEdit_DiasReservaVencimento: TDBEdit
                      Left = 133
                      Top = 367
                      Width = 49
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DIAS_RESERV_APOS_VENC'
                      DataSource = DtmCadBasicos.dsTipoReserva
                      TabOrder = 14
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [BAS359]'
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
              Hint = 'Clique para pesquisar - [BAS353]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS354]'
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS355]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS356]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [BAS360]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
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
