inherited frmCadCEP: TfrmCadCEP
  Caption = 'CEP'
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
                    Height = 177
                    Caption = ''
                    ExplicitHeight = 177
                    object Label11: TLabel
                      Left = 68
                      Top = 53
                      Width = 17
                      Height = 13
                      Caption = 'UF:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label13: TLabel
                      Left = 49
                      Top = 80
                      Width = 36
                      Height = 13
                      Caption = 'Cidade:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label10: TLabel
                      Left = 53
                      Top = 107
                      Width = 30
                      Height = 13
                      Caption = 'Bairro:'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label14: TLabel
                      Left = 63
                      Top = 26
                      Width = 22
                      Height = 13
                      Caption = 'Cep:'
                      FocusControl = DBEdit_Descricao
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object Label9: TLabel
                      Left = 27
                      Top = 134
                      Width = 57
                      Height = 13
                      Caption = 'Logradouro:'
                      FocusControl = DBEdit9
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                    end
                    object DBEdit5: TDBEdit
                      Left = 159
                      Top = 50
                      Width = 300
                      Height = 21
                      Hint = 'Estado'
                      DataField = 'ESTADO'
                      DataSource = DtmCadBasicos.dsCEPs
                      Enabled = False
                      TabOrder = 2
                    end
                    object DBLookupComboBox1: TDBLookupComboBox
                      Left = 91
                      Top = 50
                      Width = 62
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - Estado'
                      DataField = 'COD_ESTADO'
                      DataSource = DtmCadBasicos.dsCEPs
                      KeyField = 'CODIGO_UF'
                      ListField = 'SIGLA_UF'
                      ListSource = DtmCadBasicos.dsAbreEstados
                      TabOrder = 1
                      OnDropDown = DBLookupComboBox1DropDown
                      OnExit = DBLookupComboBox1Exit
                      OnKeyDown = DBLookupComboBox1KeyDown
                    end
                    object DBLookupComboBox6: TDBLookupComboBox
                      Left = 159
                      Top = 77
                      Width = 300
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - Cidade'
                      DataField = 'COD_CIDADE'
                      DataSource = DtmCadBasicos.dsCEPs
                      KeyField = 'COD_CIDADE'
                      ListField = 'NOME_CIDADE'
                      ListSource = DtmCadBasicos.dsAbreCidades
                      TabOrder = 4
                      OnExit = DBLookupComboBox6Exit
                      OnKeyDown = DBLookupComboBox6KeyDown
                    end
                    object DBEdit11: TDBEdit
                      Left = 91
                      Top = 77
                      Width = 62
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - Cidade'
                      DataField = 'COD_CIDADE'
                      DataSource = DtmCadBasicos.dsCEPs
                      MaxLength = 9
                      TabOrder = 3
                      OnExit = DBEdit11Exit
                      OnKeyDown = DBEdit11KeyDown
                    end
                    object DBLookupComboBox7: TDBLookupComboBox
                      Left = 159
                      Top = 104
                      Width = 300
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - Bairro'
                      DataField = 'COD_BAIRRO'
                      DataSource = DtmCadBasicos.dsCEPs
                      KeyField = 'COD_BAIRRO'
                      ListField = 'NOME_BAIRRO'
                      ListSource = DtmCadBasicos.dsAbreBairros
                      TabOrder = 6
                      OnExit = DBLookupComboBox7Exit
                      OnKeyDown = DBLookupComboBox7KeyDown
                    end
                    object DBEdit10: TDBEdit
                      Left = 91
                      Top = 104
                      Width = 62
                      Height = 21
                      Hint = '[F3: Consultar] [F4: Novo]  - Bairro'
                      DataField = 'COD_BAIRRO'
                      DataSource = DtmCadBasicos.dsCEPs
                      MaxLength = 9
                      TabOrder = 5
                      OnExit = DBEdit10Exit
                      OnKeyDown = DBEdit10KeyDown
                    end
                    object DBEdit_Descricao: TDBEdit
                      Left = 91
                      Top = 23
                      Width = 100
                      Height = 21
                      Hint = 'C'#243'digo de endere'#231'amento postal'
                      DataField = 'COD_CORREIOS'
                      DataSource = DtmCadBasicos.dsCEPs
                      TabOrder = 0
                    end
                    object DBEdit9: TDBEdit
                      Left = 91
                      Top = 131
                      Width = 368
                      Height = 21
                      Hint = 'Endere'#231'o'
                      CharCase = ecUpperCase
                      DataField = 'ENDERECO'
                      DataSource = DtmCadBasicos.dsCEPs
                      TabOrder = 7
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Salvar Registro - [BAS153]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS160]'
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
              Hint = 'Clique para pesquisar - [BAS152]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS153]'
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              DataSource = DtmCadBasicos.dsCEPs
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COD_CEP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CORREIOS'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENDERECO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BAIRRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SIGLA_ESTADO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTADO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_BAIRRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_CIDADE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COD_ESTADO'
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
                Hint = 'Editar Registro - [BAS154]'
              end
              inherited SpeedButton2: TSpeedButton
                Top = 5
                Hint = 'Apagar Registro - [BAS156]'
                OnClick = SpeedButton2Click
                ExplicitTop = 5
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS157]'
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
                Hint = 'Ver registros da lixeira - [BAS158]'
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
  inherited PopupMenu2: TPopupMenu
    Left = 638
    Top = 211
  end
  inherited Timer1: TTimer
    Left = 606
    Top = 211
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 574
    Top = 211
  end
end
