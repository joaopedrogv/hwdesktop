inherited FrmCadModeloEtiTermica: TFrmCadModeloEtiTermica
  Left = 298
  Top = 124
  Caption = 'Modelos de Etiquetas em Impressoras T'#233'rmicas'
  ClientHeight = 587
  ExplicitWidth = 806
  ExplicitHeight = 621
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 568
    ExplicitHeight = 568
    inherited Splitter2: TSplitter
      Height = 566
      ExplicitHeight = 566
    end
    inherited PanelLeft: TPanel
      Height = 566
      ExplicitHeight = 566
      inherited PageControl1: TPageControl
        Height = 564
        ExplicitHeight = 564
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 533
          inherited ScrollBox1: TScrollBox
            Height = 533
            ExplicitHeight = 533
            inherited PageControl3: TPageControl
              Height = 485
              ExplicitHeight = 485
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 454
                inherited ScrollBox3: TScrollBox
                  Height = 454
                  ExplicitHeight = 454
                  inherited GroupBox1: TGroupBox
                    Height = 433
                    Caption = ''
                    ParentBackground = False
                    ExplicitHeight = 433
                    object Label6: TLabel
                      Left = 74
                      Top = 16
                      Width = 64
                      Height = 13
                      Caption = 'Cod. Modelo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 51
                      Top = 41
                      Width = 87
                      Height = 13
                      Caption = 'Descri'#231#227'o Modelo:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 53
                      Top = 66
                      Width = 85
                      Height = 13
                      Caption = 'Linguagem Script:'
                    end
                    object Label9: TLabel
                      Left = 28
                      Top = 91
                      Width = 110
                      Height = 13
                      Caption = 'Modelo da Impressora:'
                      FocusControl = DBEdit4
                    end
                    object Label10: TLabel
                      Left = 19
                      Top = 141
                      Width = 119
                      Height = 13
                      Caption = 'Config. Modelo Etiqueta:'
                      FocusControl = DBMemo1
                    end
                    object Label17: TLabel
                      Left = 68
                      Top = 116
                      Width = 70
                      Height = 13
                      Caption = 'Num. Colunas:'
                      FocusControl = DBEdit6
                    end
                    object DBEdit1: TDBEdit
                      Left = 142
                      Top = 13
                      Width = 82
                      Height = 21
                      DataField = 'CODIGO'
                      DataSource = dtmProdutos.dsModEitTer
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 142
                      Top = 38
                      Width = 612
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = dtmProdutos.dsModEitTer
                      TabOrder = 1
                    end
                    object DBEdit4: TDBEdit
                      Left = 142
                      Top = 88
                      Width = 612
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'MODELOIMP'
                      DataSource = dtmProdutos.dsModEitTer
                      TabOrder = 3
                    end
                    object DBMemo1: TDBMemo
                      Left = 142
                      Top = 138
                      Width = 612
                      Height = 280
                      DataField = 'CONFIGMODELOETI'
                      DataSource = dtmProdutos.dsModEitTer
                      TabOrder = 5
                    end
                    object DBEdit6: TDBEdit
                      Left = 142
                      Top = 113
                      Width = 82
                      Height = 21
                      DataField = 'NUMCOLUNAS'
                      DataSource = dtmProdutos.dsModEitTer
                      TabOrder = 4
                    end
                    object DBComboBox3: TDBComboBox
                      Left = 142
                      Top = 61
                      Width = 82
                      Height = 21
                      DataField = 'LSCRIPT'
                      DataSource = dtmProdutos.dsModEitTer
                      ItemHeight = 0
                      Items.Strings = (
                        'EPL2'
                        'PPLA'
                        'ZPL')
                      TabOrder = 2
                      OnKeyPress = DBComboBox1KeyPress
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 485
              ExplicitTop = 485
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 533
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [PRO199]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [PRO200]'
            end
          end
          inherited Panel1: TPanel
            Height = 460
            ExplicitHeight = 460
            inherited Splitter1: TSplitter
              Height = 399
              ExplicitHeight = 399
            end
            inherited DBGrid1: TDBGrid
              Height = 399
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [PRO201]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [PRO202]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [PRO205]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Hint = 'Manuten'#231#227'o dos itens do modelo selecionado - [PRO212]'
                Glyph.Data = {
                  76060000424D7606000000000000360400002800000018000000180000000100
                  08000000000040020000130B0000130B00000001000000010000CE630000D67B
                  21002184290039B5520063A5630094DE8C00FFD6A500FFDEB500FFEFD600FFF7
                  EF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000A0A0A0A0A0A
                  0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A000A0A0A0A0A0A0A0A0A
                  0A0A0A0A0A0A0A0A0A0A0A0A0A0A000A0A0A0A0A00000000000000000A0A0A0A
                  0A0A0A0A0A0A00000000000001090908080706000A0A0A0A0A0A0A0A0A0A000A
                  0A0A0A0A010B0B0B080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A01010101
                  010101000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
                  0A0A0A0A0A0A000A0A0A0A0A00000000000000000A0A0A0A0A0A0A0A0A0A0000
                  0000000001090908080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A010B0B0B
                  080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A01010101010101000A0A0A0A
                  0A0A0A0A0A0A000A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A000A
                  0A0A0A0A00000000000000000A0A0A0A0A0A0A0A0A0A00000000000001090908
                  080706000A0A0A0A0A0A0A0A0A0A000A0A0A0A0A010B0B0B080706000A0A0A0A
                  0A0A0A0A0A0A000A0A0A0A0A01010101010101000A0A0A0A0A0A0A0A0A0A000A
                  0A0A0A0A0A0A0A0A0A0A0A0202020A0A0A0A0A00000000000000000A0A0A0A0A
                  0A0A0A0204020A0A0A0A0A01090908080706000A0A0A0A0A0A02020203020202
                  0A0A0A010B0B0B080706000A0A0A0A0A0A020503030304020A0A0A0101010101
                  0101000A0A0A0A0A0A020202030202020A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A
                  0A0A0A0205020A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0202020A0A
                  0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A}
                OnClick = SpeedButton6Click
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
                Hint = 'Ver registros da lixeira - [PRO204]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Visible = False
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 399
              ExplicitHeight = 399
              inherited ScrollBox2: TScrollBox
                Height = 382
                ExplicitHeight = 382
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 533
        end
        object tsItensEti: TTabSheet
          Caption = 'tsItensEti'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 783
            Height = 533
            Align = alClient
            TabOrder = 0
            object GroupBox5: TGroupBox
              Left = 1
              Top = 1
              Width = 781
              Height = 242
              Align = alTop
              Caption = 'Campos da Etiqueta ...'
              TabOrder = 0
              object DBGrid14: TDBGrid
                Left = 2
                Top = 15
                Width = 777
                Height = 193
                Hint = 'Rela'#231#227'o das grades disponiveis para associa'#231#227'o'
                Align = alClient
                DataSource = dtmProdutos.dsItModEitT
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
                    FieldName = 'CODIGO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NITEM'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'INDICECOLUNA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PARAMETROS_IMP'
                    Width = 380
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPOTEXTOIMPRESSO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TEXTO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUMCARACTERES'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CAMPOCURRENCY'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CAMPOIMAGEM'
                    Visible = True
                  end>
              end
              object Panel7: TPanel
                Left = 2
                Top = 208
                Width = 777
                Height = 32
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object BitBtn7: TBitBtn
                  Left = 17
                  Top = 1
                  Width = 75
                  Height = 25
                  Caption = 'Novo'
                  TabOrder = 0
                  OnClick = BitBtn7Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000420B0000420B00000001000000010000B5847300AD73
                    8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                    D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                    FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                    1111111111111111111111111101020202020202020202020211111111011313
                    1313131313131313021111111101131313131313131313130211111111011313
                    1313131313131313021111111101131313131313131313130211111111011313
                    1313131313131313021111111101131313131313131313130211111111011313
                    13131313131313130211111112121210101010101010101002111111120D120C
                    0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                    120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                    0808080806000211111111111212120707070707050011111111}
                end
                object BitBtn8: TBitBtn
                  Left = 98
                  Top = 1
                  Width = 75
                  Height = 25
                  Caption = 'Apagar'
                  TabOrder = 1
                  OnClick = BitBtn8Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000220B0000220B000000010000000100000031DE000031
                    E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
                    0404040404040404000004000004040404040404040404000004040000000404
                    0404040404040000040404000000000404040404040000040404040402000000
                    0404040400000404040404040404000000040000000404040404040404040400
                    0101010004040404040404040404040401010204040404040404040404040400
                    0201020304040404040404040404030201040403030404040404040404050203
                    0404040405030404040404040303050404040404040303040404040303030404
                    0404040404040403040403030304040404040404040404040404030304040404
                    0404040404040404040404040404040404040404040404040404}
                end
                object BitBtn9: TBitBtn
                  Left = 179
                  Top = 1
                  Width = 75
                  Height = 25
                  Caption = 'Alterar'
                  TabOrder = 2
                  OnClick = BitBtn9Click
                  Glyph.Data = {
                    36050000424D3605000000000000360400002800000010000000100000000100
                    08000000000000010000420B0000420B00000001000000010000000000000084
                    0000210021005A4A29004A3939005A5242004A4A4A005A524A0073524A005A52
                    52006300630073737300BD847B00C6947B00CE9C7B00B58484009C948400BD94
                    9400EFCE9400F7CE9400C6A59C00EFCE9C00F7CE9C00F7D69C00C6ADA500CEAD
                    A500F7D6A500C6ADAD00CEB5AD00D6B5AD00EFD6AD00F7D6AD00C6B5B500D6BD
                    B500DEBDB500DEC6B500E7C6B500EFC6B500EFCEB500F7D6B500F7DEB500D6C6
                    BD00DECEBD00EFCEBD00F7DEBD0000C6C600C6C6C600D6CEC600F7DEC600F7E7
                    C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
                    DE00FFEFE700FFF7E70021F7EF00FFF7EF0018F7F700FFF7F700FFFFF700FF00
                    FF0000FFFF0021FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                    FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0041410F0F0F0F
                    0F0F0F0F0F0F0F0F0F4141411438312C281E1A15121212170F41414114382E2E
                    2E2E2E2E2E2E2E150F414141183A3634302C1E15151512150F414141183B3634
                    31302805151515120F4141411C402E2E2E2E2E06002E2E150F4141411D443D3A
                    363431070000291E0F41414121443F3D39363407422D00290F41414121442E2E
                    2E2E2E0B3E2D002911414141224444443F3A393609422D001B41414123444444
                    443F3A3910432D002041414124442E2E2E2E2E2E3604422D0041414124444444
                    4444444032083C2D004141412B44444444444444330D030001004141243F3D3D
                    3D3D3D3D320D0801010241412426262626242426210C410A0A41}
                end
              end
            end
            object GroupBox4: TGroupBox
              Left = 1
              Top = 243
              Width = 781
              Height = 257
              Align = alClient
              TabOrder = 1
              object Panel6: TPanel
                Left = 2
                Top = 15
                Width = 777
                Height = 240
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object Label11: TLabel
                  Left = 67
                  Top = 3
                  Width = 54
                  Height = 13
                  Caption = 'Num. Item:'
                  FocusControl = DBEdit5
                end
                object Label12: TLabel
                  Left = 84
                  Top = 28
                  Width = 37
                  Height = 13
                  Caption = 'Coluna:'
                end
                object Label13: TLabel
                  Left = 9
                  Top = 50
                  Width = 112
                  Height = 13
                  Caption = 'Par'#226'metros Impress'#227'o:'
                  FocusControl = DBEdit7
                end
                object Label14: TLabel
                  Left = 19
                  Top = 72
                  Width = 102
                  Height = 13
                  Caption = 'Tipo Texto Impresso:'
                end
                object Label15: TLabel
                  Left = 42
                  Top = 94
                  Width = 79
                  Height = 13
                  Caption = 'Texto Impresso:'
                  FocusControl = DBEdit9
                end
                object Label16: TLabel
                  Left = 36
                  Top = 116
                  Width = 85
                  Height = 13
                  Caption = 'Num. Caracteres:'
                  FocusControl = DBEdit10
                end
                object Label18: TLabel
                  Left = 42
                  Top = 138
                  Width = 79
                  Height = 13
                  Caption = 'Valor Monet'#225'rio:'
                end
                object Label19: TLabel
                  Left = 28
                  Top = 160
                  Width = 93
                  Height = 13
                  Caption = 'Imagem do Campo:'
                end
                object DBEdit5: TDBEdit
                  Left = 126
                  Top = 0
                  Width = 59
                  Height = 21
                  Hint = 'Ordem de cadastro do item'
                  DataField = 'NITEM'
                  DataSource = dtmProdutos.dsItModEitT
                  TabOrder = 0
                end
                object DBEdit7: TDBEdit
                  Left = 126
                  Top = 47
                  Width = 643
                  Height = 21
                  Hint = 'Par'#226'mentos de configura'#231#227'o da impress'#227'o deste item'
                  DataField = 'PARAMETROS_IMP'
                  DataSource = dtmProdutos.dsItModEitT
                  TabOrder = 1
                end
                object DBEdit9: TDBEdit
                  Left = 126
                  Top = 91
                  Width = 643
                  Height = 21
                  Hint = 
                    'Texto fixo a ser impresso ou nome do campo tal qual est'#225' no banc' +
                    'o de dados para tipo de texto vari'#225'vel'
                  DataField = 'TEXTO'
                  DataSource = dtmProdutos.dsItModEitT
                  TabOrder = 2
                end
                object DBEdit10: TDBEdit
                  Left = 126
                  Top = 113
                  Width = 59
                  Height = 21
                  Hint = 
                    'N'#250'mero m'#225'ximo de caracteres  a serem impressos. O padr'#227'o '#233' zero ' +
                    'para n'#227'o determinar nenhum limite.'
                  DataField = 'NUMCARACTERES'
                  DataSource = dtmProdutos.dsItModEitT
                  TabOrder = 3
                end
                object DBComboBox1: TDBComboBox
                  Left = 126
                  Top = 69
                  Width = 145
                  Height = 21
                  Hint = 
                    'Tipo de texto a ser impresso em cada linha da etiqueta. Pode ser' +
                    ' TEXTO FIXO, TEXTO VARIAVEL, BARCODE, IMAGEM OU CALCULADO'
                  DataField = 'TIPOTEXTOIMPRESSO'
                  DataSource = dtmProdutos.dsItModEitT
                  ItemHeight = 0
                  Items.Strings = (
                    'TEXTO FIXO'
                    'TEXTO VARIAVEL'
                    'BARCODE'
                    'IMAGEM'
                    'CALCULADO')
                  TabOrder = 4
                  OnExit = DBComboBox1Exit
                  OnKeyPress = DBComboBox1KeyPress
                end
                object DBComboBox2: TDBComboBox
                  Left = 126
                  Top = 23
                  Width = 59
                  Height = 21
                  Hint = 'N'#250'mero da coluna para impress'#227'o deste item'
                  DataField = 'INDICECOLUNA'
                  DataSource = dtmProdutos.dsItModEitT
                  ItemHeight = 0
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6')
                  TabOrder = 5
                  OnKeyPress = DBComboBox1KeyPress
                end
                object DBComboBox4: TDBComboBox
                  Left = 126
                  Top = 135
                  Width = 59
                  Height = 21
                  Hint = 'N'#250'mero da coluna para impress'#227'o deste item'
                  DataField = 'CAMPOCURRENCY'
                  DataSource = dtmProdutos.dsItModEitT
                  ItemHeight = 0
                  Items.Strings = (
                    'N'#195'O'
                    'SIM')
                  TabOrder = 6
                  OnExit = DBComboBox4Exit
                  OnKeyPress = DBComboBox1KeyPress
                end
                object DBMemo2: TDBMemo
                  Left = 126
                  Top = 157
                  Width = 643
                  Height = 76
                  DataField = 'CAMPOIMAGEM'
                  DataSource = dtmProdutos.dsItModEitT
                  TabOrder = 7
                end
                object CheckBox2: TCheckBox
                  Left = 191
                  Top = 137
                  Width = 298
                  Height = 17
                  Caption = 'Mascarar valor monet'#225'rio retirando R$, V'#237'rgula e pontos'
                  TabOrder = 8
                  OnClick = CheckBox2Click
                end
              end
            end
            object Panel5: TPanel
              Left = 1
              Top = 500
              Width = 781
              Height = 32
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 2
              object BitBtn10: TBitBtn
                Left = 312
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Salvar Registro - [PRO210]'
                Caption = 'Confirmar'
                TabOrder = 0
                OnClick = BitBtn10Click
                Glyph.Data = {
                  92010000424D9201000000000000920000002800000010000000100000000100
                  08000000000000010000120B0000120B0000170000001700000000000000FFFF
                  FF00FF00FF00004B0000098611000C9C19000A8615000C9518000D931A000F9E
                  1C000F991C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1
                  340024BC430029B548002EC6520035CA5E0039D4650002020202020202020202
                  0202020202020202020202020202020202020202020202020202020303020202
                  0202020202020202020203090C03020202020202020202020203100D050E0302
                  02020202020202020314120F03080B030202020202020203151611030203060A
                  0302020202020202031303020202020307030202020202020203020202020202
                  0304030202020202020202020202020202020303020202020202020202020202
                  0202020303020202020202020202020202020202020202020202020202020202
                  0202020202020202020202020202020202020202020202020202020202020202
                  02020202020202020202020202020202020202020202}
              end
              object BitBtn11: TBitBtn
                Left = 393
                Top = 2
                Width = 75
                Height = 25
                Hint = 'Cancelar Registro - [PRO211]'
                Caption = 'Cancelar'
                TabOrder = 1
                OnClick = BitBtn11Click
                Glyph.Data = {
                  12020000424D1202000000000000120100002800000010000000100000000100
                  08000000000000010000120B0000120B0000370000003700000000000000FFFF
                  FF00FF00FF001442E4001645EB001C4BE7000430EB000C35E4000E3CEB001037
                  DB000027EB00002AEB000027E400012CEB00052BDC00062DE300092ED9000022
                  EB000021E7000020E200001FDC000022DC000020D900001EEB00001FEB000020
                  EB00001DE800001BE300001EE200001FE200001BDF00001CDF00001AEB00001A
                  E2000017DF000019DF00001ADF000011EB000016EB000012E6000010DC000013
                  DC000010D9000009EB00000BEB000008EA000008E700000ADF000004E2000005
                  E2000004DF000005DF000003DB000004DA0000006E0002020202020202020202
                  0202020202020202020202020202020202020202020202020236360202020202
                  0236360202020202361A28360202020236302E36020202023621182A36020236
                  332B34360202020202362419293636312C353602020202020202361E11272D2B
                  3236020202020202020202361B26252F36020202020202020202023612172022
                  36020202020202020202360F06131C0A2336020202020202023607080E363614
                  0B1F3602020202023603041036020236160D1D36020202023605093602020202
                  36150C3602020202023636020202020202363602020202020202020202020202
                  02020202020202020202020202020202020202020202}
              end
              object BitBtn61: TBitBtn
                Left = 635
                Top = 2
                Width = 75
                Height = 25
                Caption = '&Voltar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                OnClick = BitBtn61Click
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
                  1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
                  BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
                  007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
                  4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
                  E75B00D95600D15300C94E00CE7328CF8240CA8041C17332B15510A74100AD43
                  00993C004F1F00FF00FFFF00FFCA4F00F36807E96004DE5A01D45300EAB788FE
                  FEFEFEFEFEFEFEFEFEFEFEC47A3DAD4300993C004E1F00FF00FFFF00FFCA4F00
                  F67A1CF06B0CEB6204E15900D85802D35C09CB5C0BC55B0EDDA674FEFEFEAD43
                  00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516EF6707ED6202F4BB87DC
                  5600D45300CB4F00C55709FEFEFEB647009D3D004F1F00FF00FFFF00FFCA4F00
                  F79F54F07B1FEF6A0AF7BA81FEFEFEE95B00DE5700D45300DE8841FEFEFEC14B
                  00A54100582300FF00FFFF00FFCA4F00F8A760F28128FAD0A9FEFEFEFEFEFEFB
                  E6D1FAD8B7F7D7B7FEFEFEE9AB73CE5000B14500682800FF00FFFF00FFCA4F00
                  F8AD6BF38832FACCA4FEFEFEFEFEFEFAD4B2F7BB84F7BA82EE8E3EDD5600DA55
                  00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F8BF8AFEFEFEEF
                  6C0DEF6A0AEF6404EE5E00E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
                  FABA80F7B477F6A45CF49A4EF8C595F2842CF07A1EEF6A0AEE6203EF5E00F25E
                  00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
                  9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
                  CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
                  00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
          end
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 568
    ExplicitTop = 568
  end
  inherited pnStatusProcessamento: TPanel
    Left = 705
    ExplicitLeft = 705
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
