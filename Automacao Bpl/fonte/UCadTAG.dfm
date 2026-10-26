inherited frmCadTAG: TfrmCadTAG
  Left = 229
  Top = 124
  Caption = 'TAG'#39's'
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
                    Height = 426
                    Caption = 'Cadastro de Tags'
                    ExplicitHeight = 426
                    object GroupBox6: TGroupBox
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 174
                      Align = alTop
                      Caption = 'TAG:'
                      TabOrder = 0
                      object Label6: TLabel
                        Left = 64
                        Top = 72
                        Width = 50
                        Height = 13
                        Caption = 'Descri'#231#227'o:'
                        FocusControl = DBEdit_Descricao
                      end
                      object Label_Codigo: TLabel
                        Left = 77
                        Top = 17
                        Width = 37
                        Height = 13
                        Caption = 'C'#243'digo:'
                        FocusControl = DBEdit_Codigo
                      end
                      object Label8: TLabel
                        Left = 78
                        Top = 96
                        Width = 36
                        Height = 13
                        Caption = 'Tabela:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label9: TLabel
                        Left = 83
                        Top = 43
                        Width = 31
                        Height = 13
                        Caption = 'Nome:'
                        FocusControl = DBEdit_Nome
                      end
                      object Label10: TLabel
                        Left = 78
                        Top = 124
                        Width = 36
                        Height = 13
                        Caption = 'Campo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBEdit_Descricao: TDBEdit
                        Left = 120
                        Top = 69
                        Width = 285
                        Height = 21
                        Hint = 'Descri'#231#227'o da TAG'
                        CharCase = ecUpperCase
                        DataField = 'DESCRICAO'
                        DataSource = DtmCadBasicos.dsTAGs
                        MaxLength = 63
                        TabOrder = 2
                      end
                      object DBEdit_Codigo: TDBEdit
                        Left = 120
                        Top = 13
                        Width = 67
                        Height = 21
                        Hint = 'C'#243'digo sequencial'
                        CharCase = ecUpperCase
                        DataField = 'MACRO'
                        DataSource = DtmCadBasicos.dsTAGs
                        MaxLength = 9
                        TabOrder = 0
                      end
                      object DBComboBox_Tabela: TDBComboBox
                        Left = 120
                        Top = 96
                        Width = 180
                        Height = 19
                        Hint = 'Tabela do banco de dados'
                        Style = csOwnerDrawFixed
                        DataField = 'TABELA'
                        DataSource = DtmCadBasicos.dsTAGs
                        ItemHeight = 13
                        Items.Strings = (
                          'PRODUTOS'
                          'VE'#205'CULOS')
                        TabOrder = 3
                        OnChange = DBComboBox_TabelaChange
                      end
                      object DBEdit_Nome: TDBEdit
                        Left = 120
                        Top = 40
                        Width = 285
                        Height = 21
                        Hint = 'Nome da TAG'
                        CharCase = ecUpperCase
                        DataField = 'NOME'
                        DataSource = DtmCadBasicos.dsTAGs
                        MaxLength = 63
                        TabOrder = 1
                      end
                      object DBComboBox_Campo: TDBComboBox
                        Left = 120
                        Top = 121
                        Width = 180
                        Height = 19
                        Hint = 'Campo da tabela do banco de dados'
                        Style = csOwnerDrawFixed
                        DataField = 'CAMPO'
                        DataSource = DtmCadBasicos.dsTAGs
                        ItemHeight = 13
                        Items.Strings = (
                          'PRODUTOS'
                          'VE'#205'CULOS')
                        TabOrder = 4
                      end
                      object GroupBox_Rel: TGroupBox
                        Left = 2
                        Top = 140
                        Width = 763
                        Height = 32
                        Align = alBottom
                        TabOrder = 5
                        object CheckBox_Relacionamento: TCheckBox
                          Left = 120
                          Top = 9
                          Width = 97
                          Height = 17
                          Hint = 'Relacionamento com outra tabela do banco de dados'
                          Caption = 'Relacionamento'
                          TabOrder = 0
                          OnClick = CheckBox_RelacionamentoClick
                        end
                      end
                    end
                    object GroupBox_Buscar: TGroupBox
                      Left = 2
                      Top = 189
                      Width = 767
                      Height = 120
                      Align = alTop
                      Caption = 'Buscar em:'
                      TabOrder = 1
                      object Label11: TLabel
                        Left = 78
                        Top = 18
                        Width = 36
                        Height = 13
                        Caption = 'Tabela:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label12: TLabel
                        Left = 78
                        Top = 41
                        Width = 36
                        Height = 13
                        Caption = 'Campo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBComboBox_TabelaBuscar: TDBComboBox
                        Left = 120
                        Top = 13
                        Width = 180
                        Height = 19
                        Hint = 'Tabela do banco de dados do relacionamento'
                        Style = csOwnerDrawFixed
                        DataField = 'TABELA_RELAC'
                        DataSource = DtmCadBasicos.dsTAGs
                        ItemHeight = 13
                        Items.Strings = (
                          'PRODUTOS'
                          'VE'#205'CULOS')
                        TabOrder = 0
                        OnChange = DBComboBox_TabelaBuscarChange
                      end
                      object DBComboBox_CampoBuscar: TDBComboBox
                        Left = 120
                        Top = 34
                        Width = 180
                        Height = 19
                        Hint = 'Campo do banco de dados para relacionamento'
                        Style = csOwnerDrawFixed
                        DataField = 'CAMPO_RELAC'
                        DataSource = DtmCadBasicos.dsTAGs
                        ItemHeight = 13
                        Items.Strings = (
                          'PRODUTOS'
                          'VE'#205'CULOS')
                        TabOrder = 1
                      end
                      object Panel4: TPanel
                        Left = 2
                        Top = 91
                        Width = 763
                        Height = 27
                        Align = alBottom
                        BevelOuter = bvNone
                        TabOrder = 3
                        object Label15: TLabel
                          Left = 76
                          Top = 6
                          Width = 36
                          Height = 13
                          Caption = 'Campo:'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -11
                          Font.Name = 'MS Sans Serif'
                          Font.Style = []
                          ParentFont = False
                        end
                        object DBComboBox_Campo2: TDBComboBox
                          Left = 118
                          Top = 3
                          Width = 180
                          Height = 19
                          Hint = 'Campo da tabela do banco de dados'
                          Style = csOwnerDrawFixed
                          DataField = 'CAMPO2'
                          DataSource = DtmCadBasicos.dsTAGs
                          ItemHeight = 13
                          Items.Strings = (
                            'PRODUTOS'
                            'VE'#205'CULOS')
                          TabOrder = 0
                        end
                      end
                      object GroupBox_Rel2: TGroupBox
                        Left = 2
                        Top = 59
                        Width = 763
                        Height = 32
                        Align = alBottom
                        TabOrder = 2
                        object CheckBox_Relacionamento2: TCheckBox
                          Left = 120
                          Top = 9
                          Width = 121
                          Height = 17
                          Hint = 'Relacionamento com outra tabela do banco de dados'
                          Caption = 'Relacionamento 2'
                          TabOrder = 0
                          OnClick = CheckBox_Relacionamento2Click
                        end
                      end
                    end
                    object GroupBox_Buscar2: TGroupBox
                      Left = 2
                      Top = 309
                      Width = 767
                      Height = 67
                      Align = alTop
                      Caption = 'Buscar em:'
                      TabOrder = 2
                      object Label7: TLabel
                        Left = 78
                        Top = 18
                        Width = 36
                        Height = 13
                        Caption = 'Tabela:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object Label13: TLabel
                        Left = 78
                        Top = 41
                        Width = 36
                        Height = 13
                        Caption = 'Campo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBComboBox_TabelaBuscar2: TDBComboBox
                        Left = 120
                        Top = 16
                        Width = 180
                        Height = 19
                        Hint = 'Tabela do banco de dados do relacionamento'
                        Style = csOwnerDrawFixed
                        DataField = 'TABELA_RELAC2'
                        DataSource = DtmCadBasicos.dsTAGs
                        ItemHeight = 13
                        Items.Strings = (
                          'PRODUTOS'
                          'VE'#205'CULOS')
                        TabOrder = 0
                        OnChange = DBComboBox_TabelaBuscar2Change
                      end
                      object DBComboBox_CampoBuscar2: TDBComboBox
                        Left = 120
                        Top = 41
                        Width = 180
                        Height = 19
                        Hint = 'Campo do banco de dados para relacionamento'
                        Style = csOwnerDrawFixed
                        DataField = 'CAMPO_RELAC2'
                        DataSource = DtmCadBasicos.dsTAGs
                        ItemHeight = 13
                        Items.Strings = (
                          'PRODUTOS'
                          'VE'#205'CULOS')
                        TabOrder = 1
                      end
                    end
                    object GroupBox_Exibir: TGroupBox
                      Left = 2
                      Top = 376
                      Width = 767
                      Height = 44
                      Align = alTop
                      Caption = 'Exibir valor:'
                      TabOrder = 3
                      object Label14: TLabel
                        Left = 78
                        Top = 20
                        Width = 36
                        Height = 13
                        Caption = 'Campo:'
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -11
                        Font.Name = 'MS Sans Serif'
                        Font.Style = []
                        ParentFont = False
                      end
                      object DBComboBox_CampoExibir: TDBComboBox
                        Left = 120
                        Top = 17
                        Width = 180
                        Height = 19
                        Hint = 'Campo de exibi'#231#227'o do relacionamento do banco de dados'
                        Style = csOwnerDrawFixed
                        DataField = 'CAMPO_RETORNO'
                        DataSource = DtmCadBasicos.dsTAGs
                        ItemHeight = 13
                        Items.Strings = (
                          'PRODUTOS'
                          'VE'#205'CULOS')
                        TabOrder = 0
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'Confirmar Registro - [BAS168]'
              end
              inherited BitBtn5: TBitBtn
                Hint = 'Cancelar Registro - [BAS175]'
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
              Hint = 'Clique para pesquisar - [BAS167]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [BAS168]'
            end
          end
          inherited Panel1: TPanel
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'MACRO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOME'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRICAO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TABELA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CAMPO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RELACIONAMENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TABELA_RELAC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CAMPO_RELAC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CAMPO_RETORNO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BASE'
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
                Hint = 'Editar Registro - [BAS169]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [BAS171]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [BAS172]'
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
                Hint = 'Ver registros da lixeira - [BAS173]'
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
