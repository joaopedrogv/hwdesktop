object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 691
  ClientWidth = 1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1082
    Height = 73
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 1066
      Height = 57
      Align = alClient
      Caption = 'Api'
      TabOrder = 0
      object Label1: TLabel
        Left = 22
        Top = 24
        Width = 28
        Height = 13
        Caption = 'UrlApi'
      end
      object Edit1: TEdit
        Left = 56
        Top = 21
        Width = 488
        Height = 21
        TabOrder = 0
        Text = 'http://hwsistemas.homelinux.com/webapihwteste/api/'
      end
      object BitBtn3: TBitBtn
        Left = 810
        Top = 17
        Width = 105
        Height = 25
        Caption = 'AcessToken'
        TabOrder = 1
        OnClick = BitBtn3Click
      end
      object edUsuarioApi: TEdit
        Left = 550
        Top = 21
        Width = 127
        Height = 21
        TabOrder = 2
        Text = 'HW'
      end
      object edPassowordApi: TEdit
        Left = 683
        Top = 21
        Width = 121
        Height = 21
        PasswordChar = '*'
        TabOrder = 3
        Text = '^/||'
      end
      object BitBtn45: TBitBtn
        Left = 921
        Top = 17
        Width = 105
        Height = 25
        Caption = 'TokenAtivo'
        TabOrder = 4
        OnClick = BitBtn45Click
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 1082
    Height = 618
    ActivePage = TabSheet14
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Chamado'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 919
        Height = 590
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 0
        object Splitter2: TSplitter
          Left = 6
          Top = 381
          Width = 903
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 174
          ExplicitWidth = 390
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 27
          Width = 903
          Height = 354
          Align = alTop
          Caption = 'Envio'
          TabOrder = 0
          object Splitter1: TSplitter
            Left = 537
            Top = 15
            Height = 337
            ExplicitLeft = 536
            ExplicitTop = 32
            ExplicitHeight = 100
          end
          object txtEnvio: TMemo
            Left = 2
            Top = 15
            Width = 535
            Height = 337
            Align = alLeft
            Lines.Strings = (
              'txtEnvio')
            TabOrder = 0
          end
          object txtEnvioFormat: TMemo
            Left = 540
            Top = 15
            Width = 361
            Height = 337
            Align = alClient
            Lines.Strings = (
              'txtEnvioFormat')
            TabOrder = 1
          end
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 384
          Width = 903
          Height = 196
          Align = alClient
          Caption = 'Resposta'
          TabOrder = 1
          object Splitter3: TSplitter
            Left = 537
            Top = 15
            Height = 179
            ExplicitLeft = 520
            ExplicitTop = 88
            ExplicitHeight = 100
          end
          object txtResposta: TMemo
            Left = 2
            Top = 15
            Width = 535
            Height = 179
            Align = alLeft
            Lines.Strings = (
              'txtResposta')
            TabOrder = 0
          end
          object txtRespostaFormat: TMemo
            Left = 540
            Top = 15
            Width = 361
            Height = 179
            Align = alClient
            Lines.Strings = (
              'txtRespostaFormat')
            TabOrder = 1
          end
        end
        object edAcao: TEdit
          Left = 6
          Top = 6
          Width = 903
          Height = 21
          Align = alTop
          TabOrder = 2
        end
      end
      object Panel3: TPanel
        Left = 919
        Top = 0
        Width = 155
        Height = 590
        Align = alRight
        Caption = 'Panel3'
        TabOrder = 1
        object BitBtn4: TBitBtn
          Left = 16
          Top = 8
          Width = 121
          Height = 25
          Caption = 'Obter Chamado'
          TabOrder = 0
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 16
          Top = 39
          Width = 121
          Height = 25
          Caption = 'Alterar Chamado'
          TabOrder = 1
          OnClick = BitBtn5Click
        end
        object BitBtn7: TBitBtn
          Left = 16
          Top = 70
          Width = 121
          Height = 25
          Caption = 'Incluir Chamado'
          TabOrder = 2
          OnClick = BitBtn7Click
        end
        object BitBtn11: TBitBtn
          Left = 16
          Top = 101
          Width = 121
          Height = 25
          Caption = 'Incluir Chamado'
          TabOrder = 3
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Pesquisas'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1074
        Height = 49
        Align = alTop
        TabOrder = 0
        object BitBtn10: TBitBtn
          Left = 4
          Top = 10
          Width = 117
          Height = 25
          Caption = 'Pesquisar Chamados'
          TabOrder = 0
          OnClick = BitBtn10Click
        end
        object BitBtn12: TBitBtn
          Left = 127
          Top = 10
          Width = 154
          Height = 25
          Caption = 'root'
          TabOrder = 1
          OnClick = BitBtn12Click
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 49
        Width = 1074
        Height = 541
        Align = alClient
        TabOrder = 1
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 1072
          Height = 256
          Align = alTop
          BorderWidth = 6
          Caption = 'Panel7'
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 7
            Top = 7
            Width = 1058
            Height = 242
            Align = alClient
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
      end
    end
    object Outros: TTabSheet
      Caption = 'Outros'
      ImageIndex = 1
      object Splitter4: TSplitter
        Left = 526
        Top = 81
        Height = 509
        ExplicitLeft = 568
        ExplicitTop = 248
        ExplicitHeight = 100
      end
      object txtTest: TMemo
        Left = 0
        Top = 81
        Width = 526
        Height = 509
        Align = alLeft
        Lines.Strings = (
          'txtTest')
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1074
        Height = 81
        Align = alTop
        Caption = 'Panel4'
        TabOrder = 1
        object BitBtn1: TBitBtn
          Left = 3
          Top = 16
          Width = 105
          Height = 25
          Caption = 'Login componente'
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 114
          Top = 16
          Width = 105
          Height = 25
          Caption = 'Add Pessoa'
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object BitBtn6: TBitBtn
          Left = 225
          Top = 16
          Width = 105
          Height = 25
          Caption = 'Add Pessoa2'
          TabOrder = 2
          OnClick = BitBtn6Click
        end
        object BitBtn8: TBitBtn
          Left = 336
          Top = 16
          Width = 105
          Height = 25
          Caption = 'Dictionary'
          TabOrder = 3
          OnClick = BitBtn8Click
        end
        object BitBtn9: TBitBtn
          Left = 447
          Top = 16
          Width = 122
          Height = 25
          Caption = 'BitBtn9'
          TabOrder = 4
          OnClick = BitBtn9Click
        end
        object BitBtn13: TBitBtn
          Left = 575
          Top = 16
          Width = 75
          Height = 25
          Caption = 'urlEncode'
          TabOrder = 5
          OnClick = BitBtn13Click
        end
        object BitBtn14: TBitBtn
          Left = 656
          Top = 16
          Width = 75
          Height = 25
          Caption = 'rtti 1'
          TabOrder = 6
          OnClick = BitBtn14Click
        end
        object BitBtn15: TBitBtn
          Left = 737
          Top = 16
          Width = 75
          Height = 25
          Caption = 'rtti 2'
          TabOrder = 7
          OnClick = BitBtn15Click
        end
        object BitBtn16: TBitBtn
          Left = 818
          Top = 16
          Width = 75
          Height = 25
          Caption = 'rtti 3'
          TabOrder = 8
          OnClick = BitBtn16Click
        end
        object BitBtn17: TBitBtn
          Left = 114
          Top = 47
          Width = 105
          Height = 25
          Caption = 'Add Pessoas Array'
          TabOrder = 9
        end
        object BitBtn46: TBitBtn
          Left = 225
          Top = 47
          Width = 105
          Height = 25
          Caption = 'JSONObject'
          TabOrder = 10
          OnClick = BitBtn46Click
        end
        object BitBtn47: TBitBtn
          Left = 336
          Top = 47
          Width = 105
          Height = 25
          Caption = 'JSONPair to Obj'
          TabOrder = 11
          OnClick = BitBtn47Click
        end
      end
      object txtTestFormat: TMemo
        Left = 529
        Top = 81
        Width = 545
        Height = 509
        Align = alClient
        Lines.Strings = (
          'txtTestFormat')
        TabOrder = 2
      end
    end
    object Rtti: TTabSheet
      Caption = 'Rtti'
      ImageIndex = 3
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 1074
        Height = 590
        ActivePage = TabSheet4
        Align = alClient
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = 'Metas / Estudo'
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Lucida Console'
            Font.Style = []
            Lines.Strings = (
              'Testes e estudo para os metodos rtti'
              'Metas:'
              ''
              
                '01 - Criar ClientDataset em memoria com base em um objetos/class' +
                'e'
              ''
              '02 - Definir fields de um dataset com base em um objeto/classe'
              ''
              
                '03 - Atribuir os valores de um objeto para um DATASET um registr' +
                'o apenas'
              ''
              
                '04 - Atribuir os valores de um objeto para um DBCLIENT um regist' +
                'ro apenas'
              ''
              
                '05 - Atribuir os valores de um array objeto para um DATASET loop' +
                '     --  NAO CONSEGUI'
              ''
              
                '06 - Atribuir os valores de um array objeto para um DBCLIENT loo' +
                'p    --  NAO CONSEGUI'
              ''
              
                '07 - Atribuir valores de um row dataset para um objeto          ' +
                '     --  FALTA EXEMPLO'
              ''
              
                '08 - Atribuir valores de um all dataset para um array objeto    ' +
                '     --  FALTA EXEMPLO'
              ''
              
                '09 - Retornar SQL UpdateOrInsert personalizados com base no obje' +
                'to/class            --  FALTA EXEMPLO'
              ''
              
                '10 - Retornar SQL Update, Insert, Select personalizados com base' +
                ' no objeto/class    --  FALTA EXEMPLO'
              ''
              
                '11 - Atribuir valores do objeto aos parametros de uma query     ' +
                '                    --  FALTA EXEMPLO'
              ''
              'Tabelas abaixo usadas nos exemplos'
              'CREATE TABLE CPESSOA'
              '('
              'CODIGO INTEGER NOT NULL,'
              'NOME VARCHAR(50),'
              'DATACADASTRO TIMESTAMP,'
              'TELEFONE VARCHAR(14),'
              'SALARIO DOUBLE PRECISION,'
              'PRIMARY KEY(CODIGO)'
              ');'
              'CREATE TABLE IBPT ('
              '    CODIGO          VARCHAR(8) NOT NULL,'
              '    UF              CHAR(2) NOT NULL,'
              '    EX              INTEGER NOT NULL,'
              '    DESCRICAO       VARCHAR(150),'
              
                '    NACIONAL        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
                'DEFAULT 000000000.00 */,'
              
                '    ESTADUAL        T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
                'DEFAULT 000000000.00 */,'
              
                '    IMPORTADO       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
                'DEFAULT 000000000.00 */,'
              
                '    MUNICIPAL       T_VL_TODOS /* T_VL_TODOS = DOUBLE PRECISION ' +
                'DEFAULT 000000000.00 */,'
              '    TIPO            VARCHAR(50),'
              '    VIGENCIAINICIO  TIMESTAMP,'
              '    VIGENCIAFIM     TIMESTAMP,'
              '    CHAVE           VARCHAR(50),'
              '    VERSAO          VARCHAR(50),'
              '    DATACONSULTA    TIMESTAMP,'
              '    CONSULTAR       CHAR(1)'
              ');'
              
                'ALTER TABLE IBPT ADD CONSTRAINT PK_IBPT PRIMARY KEY (CODIGO, UF,' +
                ' EX);')
            ParentFont = False
            TabOrder = 0
          end
        end
        object TabSheet4: TTabSheet
          Caption = '01 - ClassToDBClient'
          ImageIndex = 1
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel9: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 41
              Align = alTop
              TabOrder = 0
              object BitBtn18: TBitBtn
                Left = 8
                Top = 8
                Width = 113
                Height = 25
                Caption = 'ClassToDBClient'
                TabOrder = 0
                OnClick = BitBtn18Click
              end
              object BitBtn19: TBitBtn
                Left = 127
                Top = 8
                Width = 113
                Height = 25
                Caption = 'ToDBClient'
                TabOrder = 1
                OnClick = BitBtn19Click
              end
            end
            object Memo2: TMemo
              Left = 7
              Top = 48
              Width = 1052
              Height = 507
              Align = alClient
              TabOrder = 1
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = '02 - SetPropertiesFields'
          ImageIndex = 2
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel11: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 41
              Align = alTop
              TabOrder = 0
              object BitBtn20: TBitBtn
                Left = 8
                Top = 8
                Width = 145
                Height = 25
                Caption = 'SetPropertiesFields - class'
                TabOrder = 0
                OnClick = BitBtn20Click
              end
              object BitBtn21: TBitBtn
                Left = 159
                Top = 8
                Width = 154
                Height = 25
                Caption = 'SetPropertiesFields - object'
                TabOrder = 1
                OnClick = BitBtn21Click
              end
            end
            object Memo3: TMemo
              Left = 7
              Top = 48
              Width = 1052
              Height = 257
              Align = alTop
              TabOrder = 1
            end
            object Memo4: TMemo
              Left = 7
              Top = 305
              Width = 1052
              Height = 250
              Align = alClient
              TabOrder = 2
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = '03 - ObjectToDataSetRow'
          ImageIndex = 3
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel13: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 74
              Align = alTop
              TabOrder = 0
              object BitBtn22: TBitBtn
                Left = 0
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Open DB'
                TabOrder = 0
                OnClick = BitBtn22Click
              end
              object BitBtn23: TBitBtn
                Left = 81
                Top = 0
                Width = 128
                Height = 25
                Caption = 'ObjectToDataSetRow'
                TabOrder = 1
                OnClick = BitBtn23Click
              end
              object RadioButton1: TRadioButton
                Left = 640
                Top = 0
                Width = 113
                Height = 17
                Caption = 'Update'
                Checked = True
                TabOrder = 2
                TabStop = True
              end
              object RadioButton2: TRadioButton
                Left = 776
                Top = 0
                Width = 113
                Height = 17
                Caption = 'Insert'
                TabOrder = 3
              end
              object RadioButton3: TRadioButton
                Left = 896
                Top = 0
                Width = 113
                Height = 17
                Caption = 'Append'
                TabOrder = 4
              end
              object BitBtn26: TBitBtn
                Left = 215
                Top = 0
                Width = 106
                Height = 25
                HelpType = htKeyword
                Caption = 'ToDataSetRow'
                TabOrder = 5
                OnClick = BitBtn26Click
              end
            end
            object Memo5: TMemo
              Left = 7
              Top = 81
              Width = 1052
              Height = 257
              Align = alTop
              TabOrder = 1
            end
            object DBGrid2: TDBGrid
              Left = 7
              Top = 338
              Width = 1052
              Height = 217
              Align = alClient
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
        object TabSheet7: TTabSheet
          Caption = '04 - ObjectToDBClientRow'
          ImageIndex = 4
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel15: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 74
              Align = alTop
              TabOrder = 0
              object BitBtn24: TBitBtn
                Left = 0
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Open DB'
                TabOrder = 0
                OnClick = BitBtn24Click
              end
              object BitBtn25: TBitBtn
                Left = 81
                Top = 0
                Width = 136
                Height = 25
                Caption = 'ObjectToDBClientRow'
                TabOrder = 1
                OnClick = BitBtn25Click
              end
              object RadioButton4: TRadioButton
                Left = 640
                Top = 0
                Width = 113
                Height = 17
                Caption = 'Update'
                Checked = True
                TabOrder = 2
                TabStop = True
              end
              object RadioButton5: TRadioButton
                Left = 776
                Top = 0
                Width = 113
                Height = 17
                Caption = 'Insert'
                TabOrder = 3
              end
              object RadioButton6: TRadioButton
                Left = 896
                Top = 0
                Width = 113
                Height = 17
                Caption = 'Append'
                TabOrder = 4
              end
              object BitBtn27: TBitBtn
                Left = 223
                Top = 0
                Width = 114
                Height = 25
                Caption = 'ToDBClientRow'
                TabOrder = 5
                OnClick = BitBtn27Click
              end
            end
            object Memo6: TMemo
              Left = 7
              Top = 81
              Width = 1052
              Height = 257
              Align = alTop
              TabOrder = 1
            end
            object DBGrid3: TDBGrid
              Left = 7
              Top = 338
              Width = 1052
              Height = 217
              Align = alClient
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
        object TabSheet8: TTabSheet
          Caption = '05 - 06 - ArrayToDataSet'
          ImageIndex = 5
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel17: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 74
              Align = alTop
              TabOrder = 0
              object BitBtn28: TBitBtn
                Left = 0
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Open DB'
                TabOrder = 0
                OnClick = BitBtn28Click
              end
              object BitBtn29: TBitBtn
                Left = 81
                Top = 0
                Width = 128
                Height = 25
                Caption = 'ArrayObjectToDataSet'
                TabOrder = 1
                OnClick = BitBtn29Click
              end
              object BitBtn42: TBitBtn
                Left = 215
                Top = 0
                Width = 128
                Height = 25
                Caption = 'ArrayObjectToDBClient'
                TabOrder = 2
                OnClick = BitBtn42Click
              end
            end
            object Memo7: TMemo
              Left = 7
              Top = 81
              Width = 1052
              Height = 257
              Align = alTop
              TabOrder = 1
            end
            object DBGrid4: TDBGrid
              Left = 7
              Top = 338
              Width = 1052
              Height = 217
              Align = alClient
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
        object TabSheet10: TTabSheet
          Caption = '07 - 08 - DataSetRowToObject'
          ImageIndex = 7
          object Panel18: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel19: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 74
              Align = alTop
              TabOrder = 0
              object BitBtn30: TBitBtn
                Left = 0
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Open DB'
                TabOrder = 0
                OnClick = BitBtn30Click
              end
              object BitBtn31: TBitBtn
                Left = 81
                Top = 0
                Width = 128
                Height = 25
                Caption = 'DataSetRowToObject'
                TabOrder = 1
                OnClick = BitBtn31Click
              end
              object BitBtn32: TBitBtn
                Left = 215
                Top = 0
                Width = 128
                Height = 25
                Caption = 'DataSetToObject'
                TabOrder = 2
                OnClick = BitBtn32Click
              end
            end
            object Memo8: TMemo
              Left = 7
              Top = 81
              Width = 1052
              Height = 257
              Align = alTop
              TabOrder = 1
            end
            object DBGrid5: TDBGrid
              Left = 7
              Top = 338
              Width = 1052
              Height = 217
              Align = alClient
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
        object TabSheet12: TTabSheet
          Caption = '09 - 10 - ToSql'
          ImageIndex = 9
          object Panel20: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel21: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 74
              Align = alTop
              TabOrder = 0
              object BitBtn33: TBitBtn
                Left = 0
                Top = 0
                Width = 153
                Height = 25
                Caption = 'ClassToSqlUpdateOrInsert'
                TabOrder = 0
                OnClick = BitBtn33Click
              end
              object BitBtn34: TBitBtn
                Left = 159
                Top = 0
                Width = 153
                Height = 25
                Caption = 'ClassToSqlUpdate'
                TabOrder = 1
                OnClick = BitBtn34Click
              end
              object BitBtn35: TBitBtn
                Left = 318
                Top = 0
                Width = 153
                Height = 25
                Caption = 'ClassToSqlInsert'
                TabOrder = 2
                OnClick = BitBtn35Click
              end
              object BitBtn36: TBitBtn
                Left = 477
                Top = 0
                Width = 153
                Height = 25
                Caption = 'ClassToSqlSelect'
                TabOrder = 3
                OnClick = BitBtn36Click
              end
              object GroupBox4: TGroupBox
                Left = 656
                Top = 1
                Width = 395
                Height = 72
                Align = alRight
                Caption = 'GroupBox4'
                TabOrder = 4
                object BitBtn37: TBitBtn
                  Left = 208
                  Top = 24
                  Width = 153
                  Height = 25
                  Caption = 'ClassToSql'
                  TabOrder = 0
                  OnClick = BitBtn37Click
                end
                object RadioButton7: TRadioButton
                  Left = 16
                  Top = 16
                  Width = 113
                  Height = 17
                  Caption = 'Update'
                  Checked = True
                  TabOrder = 1
                  TabStop = True
                end
                object RadioButton8: TRadioButton
                  Left = 16
                  Top = 33
                  Width = 113
                  Height = 17
                  Caption = 'Insert'
                  TabOrder = 2
                end
                object RadioButton9: TRadioButton
                  Left = 16
                  Top = 50
                  Width = 113
                  Height = 17
                  Caption = 'Select'
                  TabOrder = 3
                end
              end
            end
            object Memo9: TMemo
              Left = 7
              Top = 81
              Width = 1052
              Height = 257
              Align = alTop
              Lines.Strings = (
                'Memo9')
              TabOrder = 1
            end
          end
        end
        object TabSheet13: TTabSheet
          Caption = '11 - ObjectToDataSetParams'
          ImageIndex = 10
          object Panel22: TPanel
            Left = 0
            Top = 0
            Width = 1066
            Height = 562
            Align = alClient
            BorderWidth = 6
            TabOrder = 0
            object Panel23: TPanel
              Left = 7
              Top = 7
              Width = 1052
              Height = 74
              Align = alTop
              TabOrder = 0
              object BitBtn38: TBitBtn
                Left = 0
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Open DB'
                TabOrder = 0
                OnClick = BitBtn38Click
              end
              object BitBtn39: TBitBtn
                Left = 81
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Select'
                TabOrder = 1
                OnClick = BitBtn39Click
              end
              object BitBtn40: TBitBtn
                Left = 162
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Update'
                TabOrder = 2
                OnClick = BitBtn40Click
              end
              object BitBtn41: TBitBtn
                Left = 243
                Top = 0
                Width = 75
                Height = 25
                Caption = 'Insert'
                TabOrder = 3
                OnClick = BitBtn41Click
              end
            end
            object Memo10: TMemo
              Left = 7
              Top = 81
              Width = 1052
              Height = 280
              Align = alTop
              TabOrder = 1
            end
            object DBGrid6: TDBGrid
              Left = 7
              Top = 361
              Width = 1052
              Height = 194
              Align = alClient
              TabOrder = 2
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
            end
          end
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Chat via webbrowser'
      ImageIndex = 4
      object Panel24: TPanel
        Left = 0
        Top = 0
        Width = 1074
        Height = 81
        Align = alTop
        TabOrder = 0
        object Edit2: TEdit
          Left = 1
          Top = 1
          Width = 1072
          Height = 21
          Align = alTop
          TabOrder = 0
          Text = 'http://hwsistemas.homelinux.com/hwteste?usuario=HW&acesstoken='
        end
        object BitBtn43: TBitBtn
          Left = 0
          Top = 49
          Width = 75
          Height = 25
          Caption = 'Navegar'
          TabOrder = 1
          OnClick = BitBtn43Click
        end
        object Edit4: TEdit
          Left = 1
          Top = 22
          Width = 1072
          Height = 21
          Align = alTop
          TabOrder = 2
          Text = 'Edit4'
        end
        object BitBtn44: TBitBtn
          Left = 81
          Top = 49
          Width = 144
          Height = 25
          Caption = 'Logar no chat via sistema'
          TabOrder = 3
          OnClick = BitBtn44Click
        end
      end
      object Panel25: TPanel
        Left = 0
        Top = 81
        Width = 1074
        Height = 509
        Align = alClient
        ParentBackground = False
        TabOrder = 1
        object WebBrowser1: TWebBrowser
          Left = 1
          Top = 22
          Width = 1072
          Height = 486
          Align = alClient
          TabOrder = 0
          OnNavigateComplete2 = WebBrowser1NavigateComplete2
          ExplicitLeft = 573
          ExplicitTop = 168
          ExplicitWidth = 300
          ExplicitHeight = 150
          ControlData = {
            4C000000CB6E00003B3200000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E126208000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
        object Edit3: TEdit
          Left = 1
          Top = 1
          Width = 1072
          Height = 21
          Align = alTop
          Enabled = False
          TabOrder = 1
        end
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'TabSheet11'
      ImageIndex = 5
      object BitBtn48: TBitBtn
        Left = 32
        Top = 3
        Width = 75
        Height = 25
        Caption = 'BitBtn48'
        TabOrder = 0
        OnClick = BitBtn48Click
      end
      object ListView1: TListView
        Left = 48
        Top = 256
        Width = 805
        Height = 150
        Columns = <
          item
            AutoSize = True
            Caption = '...'
          end
          item
            AutoSize = True
            Caption = 'FileName'
          end
          item
            Caption = 'Pathname/Filename'
          end>
        GridLines = True
        SmallImages = ImageList1
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
    object TabSheet14: TTabSheet
      Caption = 'hw.utils.dx'
      ImageIndex = 6
      object BitBtn49: TBitBtn
        Left = 3
        Top = 16
        Width = 158
        Height = 25
        Caption = 'cloud_sinc'
        TabOrder = 0
        OnClick = BitBtn49Click
      end
      object MaskEdit1: TMaskEdit
        Left = 3
        Top = 47
        Width = 766
        Height = 21
        TabOrder = 1
        Text = ';cnpj=20599221000216;empresaId=2;caixaId=1;urgency=true'
      end
    end
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://hwsistemas.homelinux.com/webapihw/api/security/token'
    ContentType = 'application/json'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 1040
    Top = 320
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Name = 'grant_type'
        Value = 'password'
      end
      item
        Name = 'username'
        Value = 'HW'
      end
      item
        Name = 'password'
        Value = '<}24(}'
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 1040
    Top = 368
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 1080
    Top = 320
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 972
    Top = 121
  end
  object ImageList1: TImageList
    Left = 272
    Top = 208
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084000000840000008400000084000000840000008400000084
      0000008400000084000000840000008400000000000000000000000000000000
      0000000000001515CC001515CC001515CC001515CC001515CC001515CC001515
      CC001515CC001515CC001515CC001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AA7F7A00B8838400B8838400B883
      8400B883840000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000095655F00A5696A00A5696A00A569
      6A00A5696A001515CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD827B00FCEBCE00F7DFBF00F4DA
      B300F3D6AB0000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA96001515CC00FFFFFF002020D0002222D000E7E7FA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1857C00FDEDD500F5DFC500F4DB
      BB00F2D7B20000840000FFFFFF0091CA910000840000309B3000FBFDFB0084C4
      84000084000068B66800FFFFFF00008400009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E001515CC00FFFFFF00C9C9F4003838D7002222D0003E3ED800B7B7
      F200DCDCFA004F4FDC00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6897E00FEF2DE00F7E5CE00F5E0
      C500F4DCBC0000840000FFFFFF00FFFFFF00C4E3C400048604001C911C000084
      000084C48400FFFFFF00FFFFFF0000840000A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA001515CC00FFFFFF00FFFFFF00FFFFFF002626D1007676E5002929
      D3002929D1002121D000FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA8D8000FFF7E800F8E8D600F6E4
      CD00F5E0C40000840000FFFFFF00FFFFFF00FFFFFF0069B7690000840000178F
      1700FBFDFB00FFFFFF00FFFFFF0000840000A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B4001515CC00FFFFFF00FFFFFF00FFFFFF00A5A5EE002D2DD4006464
      E100EFEFFC00FFFFFF00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF918300FFFCF200F9EDDF00F7E8
      D600F6E4CD0000840000FFFFFF00FFFFFF007ABF7A000084000065B565000486
      04003AA03A00F2F9F200FFFFFF0000840000AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF001515CC00FFFFFF00FFFFFF00FFFFFF00F7F7FC002D2DD400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C4968500FFFFFC00FAF1E800F9EC
      DE00F8E8D50000840000FFFFFF0061B36100008400007BBF7B00FFFFFF00CAE5
      CA00038503003AA03A00FFFFFF0000840000B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C9001515CC00FFFFFF00FFFFFF00FFFFFF008989E9002828D100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C99B8700FFFFFF00FDF7F200FBF1
      E800FAEEDF0000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000840000BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D5001515CC00FFFFFF00FFFFFF00FFFFFF003A3AD7002D2DD400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CD9E8A00FFFFFF00FFFCFB00FEF7
      F100FBF2E70000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000840000BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE0001515CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1A38B00FFFFFF00FFFFFF00FFFD
      FB00FDF7F1000084000000840000008400000084000000840000008400000084
      000000840000008400000084000000840000C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED001515CC001515CC001515CC001515CC001515CC001515CC001515
      CC001515CC001515CC001515CC001515CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6A78D00FFFFFF00FFFFFF00FFFF
      FF00FFFDFB00FDF7F100FBF1E600FAEDDE00FDF0DD00EADDCA00C7BFB000B883
      840000000000000000000000000000000000CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9AA8F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFDFB00FDF8F000FBF3E700B8838400B8838400B8838400B883
      840000000000000000000000000000000000CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDAC9100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFD00F7F0EC00B8838400E9B67600F3AE5200CA8A
      6A0000000000000000000000000000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFAF9200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAFAFE00B8838400EBB87A00D09877000000
      000000000000000000000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DBA68500DBA68500DBA68500DBA6
      8500DBA68500DBA68500DBA68500DBA68500B8838400CA978400000000000000
      000000000000000000000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00F800F800000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000F000F00000000000F000F00000000000F000F00000000
      001F001F00000000003F003F0000000000000000000000000000000000000000
      000000000000}
  end
end
