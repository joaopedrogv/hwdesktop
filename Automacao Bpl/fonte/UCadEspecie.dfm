inherited frmCadEspecie: TfrmCadEspecie
  Caption = 
    'Esp'#233'cie - Fins de segmenta'#231#227'o de produtos vendidos por tipo de v' +
    'e'#237'culos'
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
                    Align = alClient
                    Caption = ''
                    ExplicitHeight = 427
                    object Label_Codigo: TLabel
                      Left = 57
                      Top = 34
                      Width = 36
                      Height = 13
                      Caption = 'C'#243'digo:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 42
                      Top = 62
                      Width = 51
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label6: TLabel
                      Left = 42
                      Top = 99
                      Width = 3
                      Height = 13
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label7: TLabel
                      Left = 32
                      Top = 91
                      Width = 61
                      Height = 13
                      Caption = 'Observa'#231#227'o:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBEdit_Codigo: TDBEdit
                      Left = 99
                      Top = 31
                      Width = 54
                      Height = 21
                      Hint = 'C'#243'digo da esp'#233'cie'
                      DataField = 'CODIGO_ESP'
                      DataSource = DtmCadBasicos.dsEspecies
                      Enabled = False
                      MaxLength = 9
                      TabOrder = 0
                    end
                    object DBMemo_Observacao: TDBMemo
                      Left = 99
                      Top = 88
                      Width = 398
                      Height = 89
                      Hint = 'Observa'#231#245'es adicionais da esp'#233'cie'
                      DataField = 'OBSERVACAO_ESP'
                      DataSource = DtmCadBasicos.dsEspecies
                      TabOrder = 2
                    end
                    object DBEdit_Descricao: TDBEdit
                      Left = 99
                      Top = 59
                      Width = 398
                      Height = 21
                      Hint = 'Descri'#231#227'o da esp'#233'cie'
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO_ESP'
                      DataSource = DtmCadBasicos.dsEspecies
                      TabOrder = 1
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS141]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS142]'
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
              Hint = 'Clique para pesquisar - [BAS134]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS135]'
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              DataSource = DtmCadBasicos.dsEspecies
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CODIGO_ESP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO_ESP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'OBSERVACAO_ESP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ATIVO'
                  Visible = True
                end>
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [BAS136]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS138]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS139]'
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
                Hint = 'Ver registros da lixeira - [BAS140]'
                OnClick = SpeedButton25Click
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
