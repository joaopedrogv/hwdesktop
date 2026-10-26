inherited frmBalanco: TfrmBalanco
  Left = 273
  Top = 87
  Caption = 'Balan'#231'o...'
  ClientHeight = 510
  ClientWidth = 663
  Font.Height = -16
  Font.Style = [fsBold]
  Menu = MainMenu1
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 671
  ExplicitHeight = 564
  PixelsPerInch = 96
  TextHeight = 19
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 663
    Height = 471
    ActivePage = TabSheet_Contagem
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TabSheet_Contagem: TTabSheet
      Caption = 'Contagem'
      OnEnter = TabSheet_ContagemEnter
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox_Produto: TGroupBox
        Left = 0
        Top = 0
        Width = 655
        Height = 116
        Align = alTop
        Caption = 'Informa'#231#245'es do produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 23
          Width = 59
          Height = 16
          Caption = 'Produto:'
        end
        object Label_Descricao: TLabel
          Left = 10
          Top = 53
          Width = 76
          Height = 16
          Caption = 'Descri'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label_Locacao: TLabel
          Left = 10
          Top = 83
          Width = 83
          Height = 16
          Caption = 'Aloca'#231#227'o 1:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 378
          Top = 83
          Width = 83
          Height = 16
          Caption = 'Aloca'#231#227'o 2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 390
          Top = 23
          Width = 47
          Height = 16
          Caption = 'Grupo:'
        end
        object Label17: TLabel
          Left = 517
          Top = 23
          Width = 55
          Height = 16
          Caption = 'C'#243'digo:'
        end
        object MaskEdit_produto: TMaskEdit
          Left = 103
          Top = 17
          Width = 267
          Height = 24
          Hint = 'Informe o c'#243'digo de barras do produto'
          CharCase = ecUpperCase
          MaxLength = 20
          TabOrder = 0
          OnEnter = MaskEdit_produtoEnter
          OnExit = MaskEdit_produtoExit
          OnKeyDown = MaskEdit_produtoKeyDown
        end
        object MaskEdit_Descricao: TMaskEdit
          Left = 103
          Top = 49
          Width = 549
          Height = 24
          CharCase = ecUpperCase
          Enabled = False
          TabOrder = 1
          OnEnter = MaskEdit_produtoEnter
          OnExit = MaskEdit_produtoExit
        end
        object MaskEdit_AlocProd1: TMaskEdit
          Left = 103
          Top = 79
          Width = 155
          Height = 24
          Enabled = False
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 2
          OnEnter = MaskEdit_produtoEnter
          OnExit = MaskEdit_produtoExit
        end
        object MaskEdit_AlocProd2: TMaskEdit
          Left = 495
          Top = 79
          Width = 156
          Height = 24
          Enabled = False
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 3
          OnEnter = MaskEdit_produtoEnter
          OnExit = MaskEdit_produtoExit
        end
        object MaskEdit_grupo: TMaskEdit
          Left = 445
          Top = 17
          Width = 52
          Height = 24
          Hint = 'Grupo do produto'
          CharCase = ecUpperCase
          Enabled = False
          MaxLength = 20
          TabOrder = 4
          OnEnter = MaskEdit_produtoEnter
          OnExit = MaskEdit_produtoExit
          OnKeyDown = MaskEdit_produtoKeyDown
        end
        object MaskEdit_codprod: TMaskEdit
          Left = 580
          Top = 17
          Width = 73
          Height = 24
          Hint = 'C'#243'digo do produto'
          CharCase = ecUpperCase
          Enabled = False
          MaxLength = 20
          TabOrder = 5
          OnEnter = MaskEdit_produtoEnter
          OnExit = MaskEdit_produtoExit
          OnKeyDown = MaskEdit_produtoKeyDown
        end
      end
      object GroupBox_Valores: TGroupBox
        Left = 0
        Top = 116
        Width = 235
        Height = 148
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label3: TLabel
          Left = 13
          Top = 25
          Width = 85
          Height = 16
          Alignment = taRightJustify
          Caption = 'Quantidade:'
        end
        object Label_QtdAloc1: TLabel
          Left = 10
          Top = 58
          Width = 83
          Height = 16
          Caption = 'Aloca'#231#227'o 1:'
        end
        object Label_QtdAloc2: TLabel
          Left = 10
          Top = 91
          Width = 83
          Height = 16
          Caption = 'Aloca'#231#227'o 2:'
        end
        object MaskEdit_Quantidade: TMaskEdit
          Left = 103
          Top = 23
          Width = 115
          Height = 24
          Hint = 'Quantidade contada do produto'
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 0
          OnExit = MaskEdit_QuantidadeExit
        end
        object MaskEdit_AlocQtd1: TMaskEdit
          Left = 103
          Top = 55
          Width = 114
          Height = 24
          Hint = 'Primeiro lugar da localiza'#231#227'o do produto'
          CharCase = ecUpperCase
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 1
        end
        object MaskEdit_AlocQtd2: TMaskEdit
          Left = 103
          Top = 87
          Width = 114
          Height = 24
          Hint = 'Segundo lugar da localiza'#231#227'o do produto'
          CharCase = ecUpperCase
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 2
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 405
        Width = 655
        Height = 35
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object BitBtn_MudarPagina: TBitBtn
          Left = 516
          Top = 1
          Width = 138
          Height = 33
          Hint = 'Mudar P'#225'gina'
          Align = alRight
          Caption = 'Mudar p'#225'gina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn_MudarPaginaClick
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000330B0000330B00000001000000010000317B3100397B
            390039843900398C3900428C420042944200429C42004A9C4A004AA54A004AAD
            4A004AB54A0052B552005AB55A0063BD63006BBD6B0073C673007BC67B0084CE
            84008CCE8C0094CE94009CD69C00A5D6A500ADDEAD00B5DEB500EFF7EF00FF00
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
            1919191919191919191919191919191919191919191919191919191919191919
            1919191919191919191919191919191919191919191919191919191919191919
            1919191912040102020202020201010201020101011219191919191907070809
            0909090909080808080706050402191919191919060B0C0D0D0D0D0D0B0C0C0B
            0B0B09070601191919191919080B0C0E0E0F0E0E0D0C0C0B0B0B080906011919
            19191919080C0D0F0F1818150D0D0C0B0B0B0B0907011919191919190B0D0F0F
            0F181A18150D0C0C0B0B090B07021919191919190B0E0F0F0F181A1A18150D0C
            0B0B0B0B08021919191919190B0F0F0F0F181A1A1A18150C0B0B090B08041919
            191919190D100F100F181A1A1A1A18150B0B0B0C08021919191919190F0F1010
            10181A1A1A1A1A18150C0B0B0B041919191919190E1110100F181A1A1A1A1815
            0B0B080B0B041919191919190F11111110181A1A1A18150B0B0B0B0C0B021919
            191919190F12131111181A1A18150D0C0B0C0D0C0B041919191919190F131312
            11181A18150D0D0D0D0B0B0C0B0419191919191910151413121818150F0F0F0E
            0F0D0D0D0B041919191919191116161413131211111111100F0F0F0D0B021919
            191919191216161413111111111111100F0F0E0D09051919191919191212110F
            0F0F0E0E0E0F0D0C0D0D0B0B0812191919191919191919191919191919191919
            1919191919191919191919191919191919191919191919191919191919191919
            1919191919191919191919191919191919191919191919191919}
        end
        object BitBtn_Incluir: TBitBtn
          Left = 1
          Top = 1
          Width = 111
          Height = 33
          Hint = 'Incluir - [BAL001]'
          Align = alLeft
          Caption = 'Incluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn_IncluirClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object CheckBox_EmitirSom: TCheckBox
          Left = 134
          Top = 4
          Width = 102
          Height = 16
          Hint = 'Aumente o volume do som de seu computador'
          Caption = 'Emitir sinal sonoro'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = CheckBox_EmitirSomClick
        end
        object ckAutoInc: TCheckBox
          Left = 134
          Top = 17
          Width = 102
          Height = 16
          Hint = 'Aumente o volume do som de seu computador'
          Caption = 'Auto Incremento'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnExit = ckAutoIncExit
        end
        object ckAutoIncGrade: TCheckBox
          Left = 245
          Top = 4
          Width = 125
          Height = 16
          Hint = 'Aumente o volume do som de seu computador'
          Caption = 'Auto Incremento Grade'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnExit = ckAutoIncGradeExit
        end
        object ckSemprePedirGrade: TCheckBox
          Left = 395
          Top = 4
          Width = 108
          Height = 16
          Caption = 'Sempre pedir grade'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
      object GroupBox2: TGroupBox
        Left = 235
        Top = 116
        Width = 420
        Height = 148
        Align = alRight
        Caption = 'Informa'#231#245'es do item:'
        Color = clGradientActiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
        object Label12: TLabel
          Left = 238
          Top = 27
          Width = 71
          Height = 16
          Caption = 'Est. Total:'
        end
        object Label13: TLabel
          Left = 225
          Top = 60
          Width = 84
          Height = 16
          Caption = 'Em Req/Os:'
        end
        object Label2: TLabel
          Left = 29
          Top = 29
          Width = 63
          Height = 16
          Caption = 'Contado:'
        end
        object Label6: TLabel
          Left = 10
          Top = 91
          Width = 83
          Height = 16
          Caption = 'Aloca'#231#227'o 2:'
        end
        object Label7: TLabel
          Left = 10
          Top = 58
          Width = 83
          Height = 16
          Caption = 'Aloca'#231#227'o 1:'
        end
        object Label_EstGrade: TLabel
          Left = 229
          Top = 90
          Width = 78
          Height = 16
          Caption = 'Est. Grade:'
        end
        object Edit_Estoque: TEdit
          Left = 323
          Top = 23
          Width = 91
          Height = 24
          Enabled = False
          TabOrder = 0
          Text = '0'
        end
        object Edit_ReqOs: TEdit
          Left = 323
          Top = 55
          Width = 91
          Height = 24
          Enabled = False
          TabOrder = 1
          Text = '0'
        end
        object Edit_Contado: TEdit
          Left = 105
          Top = 23
          Width = 115
          Height = 24
          Enabled = False
          TabOrder = 2
          Text = '0'
        end
        object MaskEdit_AlocInfo2: TMaskEdit
          Left = 105
          Top = 87
          Width = 114
          Height = 24
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 3
        end
        object MaskEdit_AlocInfo1: TMaskEdit
          Left = 105
          Top = 55
          Width = 114
          Height = 24
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 4
        end
        object Edit_EstGrade: TEdit
          Left = 323
          Top = 86
          Width = 91
          Height = 24
          Enabled = False
          TabOrder = 5
          Text = '0'
        end
      end
      object GroupBox6: TGroupBox
        Left = 0
        Top = 264
        Width = 655
        Height = 141
        Align = alBottom
        Caption = #218'ltimos cinco produtos contados'
        TabOrder = 4
        object DBGridContados: TDBGrid
          Left = 2
          Top = 18
          Width = 651
          Height = 121
          Align = alClient
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnExit = DBGridContadosExit
        end
      end
    end
    object TabSheet_Conf: TTabSheet
      Caption = 'Confer'#234'ncia e confirma'#231#227'o'
      ImageIndex = 1
      OnEnter = TabSheet_ConfEnter
      OnShow = TabSheet_ConfShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 655
        Height = 405
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label10: TLabel
          Left = 7
          Top = 197
          Width = 50
          Height = 16
          Caption = 'Se'#231#227'o:'
        end
        object Bevel1: TBevel
          Left = 3
          Top = 267
          Width = 650
          Height = 4
        end
        object Bevel2: TBevel
          Left = 3
          Top = 152
          Width = 650
          Height = 4
        end
        object RadioButton_RelProdContado: TRadioButton
          Left = 7
          Top = 173
          Width = 263
          Height = 16
          Caption = 'Rel'#225'torio de produtos contados'
          TabOrder = 8
        end
        object MaskEdit_Pasta: TMaskEdit
          Left = 382
          Top = 91
          Width = 274
          Height = 24
          TabOrder = 7
          Visible = False
        end
        object RadioButton_RelProdNaoCont: TRadioButton
          Left = 10
          Top = 60
          Width = 263
          Height = 16
          Caption = 'Relatar produtos n'#227'o contados'
          TabOrder = 1
          OnClick = RadioButton_RelProdNaoContClick
          OnEnter = RadioButton_RelProdNaoContClick
        end
        object RadioButton_RelProdEstDif: TRadioButton
          Left = 10
          Top = 79
          Width = 334
          Height = 16
          Caption = 'Relatar produtos com estoque diferente'
          TabOrder = 2
          OnClick = RadioButton_RelProdNaoContClick
          OnEnter = RadioButton_RelProdNaoContClick
        end
        object RadioButton_ConfBalanco: TRadioButton
          Left = 10
          Top = 97
          Width = 287
          Height = 16
          Caption = 'Confirmar balan'#231'o'
          TabOrder = 3
          OnClick = RadioButton_RelProdNaoContClick
          OnEnter = RadioButton_RelProdNaoContClick
        end
        object RadioButton_TranfArqBalanco: TRadioButton
          Left = 382
          Top = 69
          Width = 223
          Height = 17
          Caption = 'Transferir arquivo da pasta para o balan'#231'o:'
          TabOrder = 6
          Visible = False
          OnClick = RadioButton_TranfArqBalancoClick
        end
        object RadioButton_DesligarPC: TRadioButton
          Left = 3
          Top = 285
          Width = 181
          Height = 23
          Caption = 'Desligar computador'
          TabOrder = 13
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 656
          Height = 43
          TabOrder = 0
          object Label11: TLabel
            Left = 257
            Top = 15
            Width = 85
            Height = 16
            Caption = 'Grupo Final:'
          end
          object Label8: TLabel
            Left = 10
            Top = 15
            Width = 92
            Height = 16
            Caption = 'Grupo Inicial:'
          end
          object Edit_GrupoFim: TEdit
            Left = 357
            Top = 12
            Width = 115
            Height = 24
            Hint = 'Final do grupo do produto'
            CharCase = ecUpperCase
            MaxLength = 9
            TabOrder = 1
            OnExit = Edit_GrupoFimExit
          end
          object Edit_GrupoIni: TEdit
            Left = 118
            Top = 12
            Width = 115
            Height = 24
            Hint = 'Primeiro grupo do produto'
            CharCase = ecUpperCase
            MaxLength = 9
            TabOrder = 0
            OnExit = Edit_GrupoIniExit
          end
          object ChkSomenteconsumo: TCheckBox
            Left = 501
            Top = 23
            Width = 147
            Height = 16
            Caption = 'Somente Consumo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object RadioButton_ApagarArquivoBalanco: TRadioButton
          Left = 10
          Top = 114
          Width = 287
          Height = 19
          Caption = 'Apagar arquivo do balan'#231'o'
          TabOrder = 4
          OnClick = RadioButton_RelProdNaoContClick
          OnEnter = RadioButton_RelProdNaoContClick
        end
        object CheckBox_ContabMedio: TCheckBox
          Left = 452
          Top = 197
          Width = 131
          Height = 16
          Caption = 'Cont'#225'bil m'#233'dio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          Visible = False
        end
        object CheckBox_NumFab: TCheckBox
          Left = 276
          Top = 197
          Width = 166
          Height = 16
          Caption = 'N'#250'mero do fabricante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
        object CheckBox_Contabil: TCheckBox
          Left = 187
          Top = 198
          Width = 84
          Height = 16
          Caption = 'Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object MaskEdit_Secao: TMaskEdit
          Left = 67
          Top = 189
          Width = 114
          Height = 24
          Hint = 'Se'#231#227'o de impress'#227'o do relat'#243'rio'
          CharCase = ecUpperCase
          MaxLength = 9
          TabOrder = 9
        end
        object RadioGroup1: TRadioGroup
          Left = 382
          Top = 48
          Width = 271
          Height = 98
          Caption = 'Ordem'
          ItemIndex = 1
          Items.Strings = (
            'Alfabetica'
            'Numero Fabricante')
          TabOrder = 5
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 405
        Width = 655
        Height = 35
        Align = alBottom
        TabOrder = 1
        object Label19: TLabel
          Left = 129
          Top = 6
          Width = 348
          Height = 39
          Caption = 
            '*Aten'#231#227'o! No controle de estoque fechado apenas as mercadorias c' +
            'om status igual a "NT" est'#227'o fisicamente no estoque, portando fa' +
            'z parte da contagem*'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object BitBtn2: TBitBtn
          Left = 516
          Top = 1
          Width = 138
          Height = 33
          Hint = 'Mudar P'#225'gina'
          Align = alRight
          Caption = 'Mudar p'#225'gina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn2Click
          Glyph.Data = {
            76060000424D7606000000000000360400002800000018000000180000000100
            08000000000040020000230B0000230B00000001000000010000317B3100397B
            390039843900398C3900428C420042944200429C42004A9C4A004AA54A004AAD
            4A004AB54A0052B552005AB55A0063BD63006BBD6B0073C673007BC67B0084CE
            84008CCE8C0094CE94009CD69C00A5D6A500ADDEAD00B5DEB500EFF7EF00FF00
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00191919191919
            1919191919191919191919191919191919191919191919191919191919191919
            1919191919191919191919191919191919191919191919191919191919191919
            1919191912040102020202020201010201020101011219191919191907070809
            0909090909080808080706050402191919191919060B0C0D0D0D0D0D0B0C0C0B
            0B0B09070601191919191919080B0C0E0E0F0E0E0D0C0C0B0B0B080906011919
            19191919080C0D0F0F0F0E0D0D1518180B0B0B0907011919191919190B0D0F0F
            0F0F0F0E15181A180B0B090B07021919191919190B0E0F0F0F0F0F15181A1A18
            0B0B0B0B08021919191919190B0F0F0F0F0F15181A1A1A180B0B090B08041919
            191919190D100F100F15181A1A1A1A180B0B0B0C08021919191919190F0F1010
            15181A1A1A1A1A180C0C0B0B0B041919191919190E1110100F15181A1A1A1A18
            0B0B080B0B041919191919190F111111100F15181A1A1A180B0B0B0C0B021919
            191919190F121311110F0F15181A1A180B0C0D0C0B041919191919190F131312
            11100F0F15181A180D0B0B0C0B0419191919191910151413121111100F151818
            0F0D0D0D0B041919191919191116161413131211111111100F0F0F0D0B021919
            191919191216161413111111111111100F0F0E0D09051919191919191212110F
            0F0F0E0E0E0F0D0C0D0D0B0B0812191919191919191919191919191919191919
            1919191919191919191919191919191919191919191919191919191919191919
            1919191919191919191919191919191919191919191919191919}
        end
        object BitBtn_Confirmar: TBitBtn
          Left = 1
          Top = 1
          Width = 111
          Height = 33
          Hint = 'Confirmar'
          Align = alLeft
          Caption = 'Confirmar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BitBtn_ConfirmarClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333330000333333333333333333333333F33333333333
            00003333344333333333333333388F3333333333000033334224333333333333
            338338F3333333330000333422224333333333333833338F3333333300003342
            222224333333333383333338F3333333000034222A22224333333338F338F333
            8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
            33333338F83338F338F33333000033A33333A222433333338333338F338F3333
            0000333333333A222433333333333338F338F33300003333333333A222433333
            333333338F338F33000033333333333A222433333333333338F338F300003333
            33333333A222433333333333338F338F00003333333333333A22433333333333
            3338F38F000033333333333333A223333333333333338F830000333333333333
            333A333333333333333338330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
    end
    object TabSheet_Grade: TTabSheet
      Caption = 'Grade'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel_Grade: TPanel
        Left = 0
        Top = 0
        Width = 655
        Height = 440
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnEnter = Panel_GradeEnter
        object DBGrid_Grade: TDBGrid
          Left = 1
          Top = 107
          Width = 653
          Height = 293
          Hint = '[Enter: Entrar no cadastro, Ver detalhes]'
          Align = alClient
          DataSource = dtmBalanco.dsVisGrade
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDblClick = DBGrid_GradeDblClick
          OnKeyDown = DBGrid_GradeKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_GRADE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO1'
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 653
          Height = 106
          Align = alTop
          TabOrder = 0
          object Label4: TLabel
            Left = 159
            Top = 8
            Width = 59
            Height = 16
            Caption = 'Produto:'
          end
          object Label5: TLabel
            Left = 15
            Top = 37
            Width = 190
            Height = 16
            Caption = 'Quantidade grade contado:'
          end
          object Label9: TLabel
            Left = 365
            Top = 41
            Width = 146
            Height = 16
            Caption = 'Estoque Real Grade:'
          end
          object Label15: TLabel
            Left = 34
            Top = 72
            Width = 191
            Height = 16
            BiDiMode = bdRightToLeft
            Caption = 'Digite o texto para localizar'
            ParentBiDiMode = False
          end
          object Edit_ProdutoGrade: TEdit
            Left = 230
            Top = 5
            Width = 417
            Height = 24
            Enabled = False
            TabOrder = 0
            OnKeyDown = Edit_ProdutoGradeKeyDown
          end
          object Edit_QtdGradeCont: TEdit
            Left = 230
            Top = 37
            Width = 115
            Height = 24
            Enabled = False
            TabOrder = 1
            Text = '0'
            OnKeyDown = Edit_ProdutoGradeKeyDown
          end
          object Edit_EstRealGrade: TEdit
            Left = 532
            Top = 37
            Width = 115
            Height = 24
            Enabled = False
            TabOrder = 2
            Text = '0'
            OnKeyDown = Edit_ProdutoGradeKeyDown
          end
          object EditLocalizarGrade: TEdit
            Left = 231
            Top = 69
            Width = 416
            Height = 24
            CharCase = ecUpperCase
            TabOrder = 3
            OnChange = EditLocalizarGradeChange
            OnKeyDown = Edit_ProdutoGradeKeyDown
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 400
          Width = 653
          Height = 39
          Align = alBottom
          TabOrder = 2
          object BitBtn_Grade_OK: TBitBtn
            Left = 261
            Top = 5
            Width = 85
            Height = 28
            Hint = 'Confirmar'
            Caption = '&OK'
            TabOrder = 0
            OnClick = BitBtn_Grade_OKClick
            OnKeyDown = Edit_ProdutoGradeKeyDown
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000D30E0000D30E00000001000000010000008C00000094
              0000009C000000A5000000940800009C100000AD100000AD180000AD210000B5
              210000BD210018B5290000C62900319C310000CE310029AD390031B5420018C6
              420000D6420052A54A0029AD4A0029CE5A006BB5630000FF63008CBD7B00A5C6
              94005AE7A500FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B1B1B1B1B13
              04161B1B1B1B1B1B1B1B1B1B1B1B1B0B0A01181B1B1B1B1B1B1B1B1B1B1B160A
              0C030D1B1B1B1B1B1B1B1B1B1B1B050E0C0601191B1B1B1B1B1B1B1B1B130E0C
              170E02001B1B1B1B1B1B1B1B1B0B1517170A0C01181B1B1B1B1B1B1B1B111717
              13130C030D1B1B1B1B1B1B1B1B1B08081B1B070C01191B1B1B1B1B1B1B1B1B1B
              1B1B100C02001B1B1B1B1B1B1B1B1B1B1B1B1B090C01181B1B1B1B1B1B1B1B1B
              1B1B1B130C0F101B1B1B1B1B1B1B1B1B1B1B1B1B141A0F181B1B1B1B1B1B1B1B
              1B1B1B1B1012181B1B1B1B1B1B1B1B1B1B1B1B1B1B191B1B1B1B1B1B1B1B1B1B
              1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B1B}
          end
        end
      end
    end
    object TabSheet_Outros: TTabSheet
      Caption = 'Outros'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnApagarBalanco: TPanel
        Left = 0
        Top = 0
        Width = 655
        Height = 440
        Align = alClient
        TabOrder = 0
        object PageControlApagarBalanco: TPageControl
          Left = 1
          Top = 1
          Width = 653
          Height = 438
          ActivePage = TabSheet_Apagar_Balanco_Geral
          Align = alClient
          TabOrder = 0
          object TabSheet_Apagar_Balanco_Geral: TTabSheet
            Caption = 'Apagar Balan'#231'o Geral'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label18: TLabel
              Left = 16
              Top = 32
              Width = 230
              Height = 16
              Caption = 'Apagar arquivo de balan'#231'o geral'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -15
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object pnApagar_Balanco_Geral: TPanel
              Left = 0
              Top = 373
              Width = 645
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtnDelApagar_Balanco_Geral: TBitBtn
                Left = 273
                Top = 3
                Width = 95
                Height = 25
                Hint = 'Apagar'
                Caption = 'Apagar'
                TabOrder = 0
                OnClick = BitBtnDelApagar_Balanco_GeralClick
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
              object BitBtnVoltarApagar_Balanco_Geral: TBitBtn
                Left = 539
                Top = 4
                Width = 95
                Height = 25
                Hint = 'Voltar a tela anterior'
                Caption = '&Voltar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BitBtnVoltarApagar_Balanco_GeralClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                  03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                  972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                  00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                  4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                  E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                  03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                  9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                  2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                  A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                  01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                  8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                  993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                  02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                  00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
          end
          object TabSheet_Apagar_Balanco_Dia: TTabSheet
            Caption = 'Apagar Balan'#231'o por Data'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object pnApagar_Balanco_Dia: TPanel
              Left = 0
              Top = 373
              Width = 645
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtnDelApagar_Balanco_Dia: TBitBtn
                Left = 273
                Top = 3
                Width = 95
                Height = 25
                Hint = 'Apagar'
                Caption = 'Apagar'
                TabOrder = 0
                OnClick = BitBtnDelApagar_Balanco_DiaClick
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
              object BitBtnVoltarlApagar_Balanco_Dia: TBitBtn
                Left = 539
                Top = 3
                Width = 95
                Height = 25
                Hint = 'Voltar a tela anterior'
                Caption = '&Voltar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BitBtnVoltarlApagar_Balanco_DiaClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                  03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                  972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                  00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                  4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                  E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                  03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                  9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                  2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                  A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                  01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                  8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                  993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                  02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                  00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
            object GroupBoxApagar_Balanco_Dia: TGroupBox
              Left = 0
              Top = 0
              Width = 645
              Height = 373
              Align = alClient
              Caption = 'Selecione o dia que deseja apagar do arquivo de balan'#231'o'
              TabOrder = 1
              object DBGrid_Balanco_Dia: TDBGrid
                Left = 2
                Top = 18
                Width = 641
                Height = 353
                Align = alClient
                DataSource = dtmBalanco.dsBalancoDia
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -15
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DATA'
                    Width = 550
                    Visible = True
                  end>
              end
            end
          end
          object TabSheet_Apagar_Balango_Registro: TTabSheet
            Caption = 'Apagar Balan'#231'o por Registro'
            ImageIndex = 2
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object pnApagar_Balanco_Registro: TPanel
              Left = 0
              Top = 373
              Width = 645
              Height = 34
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtnDelApagar_Balanco_Registro: TBitBtn
                Left = 273
                Top = 3
                Width = 95
                Height = 25
                Hint = 'Apagar'
                Caption = 'Apagar'
                TabOrder = 0
                OnClick = BitBtnDelApagar_Balanco_RegistroClick
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
              object BitBtnVoltarApagar_Balanco_Registro: TBitBtn
                Left = 539
                Top = 4
                Width = 95
                Height = 25
                Hint = 'Voltar a tela anterior'
                Caption = '&Voltar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BitBtnVoltarApagar_Balanco_RegistroClick
                Glyph.Data = {
                  36030000424D3603000000000000360000002800000010000000100000000100
                  18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFA13701AF4101892603FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF922D02BF4E00AC40018926
                  03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FF952E02C45000A53A01872303FF00FFFF00FF912D049D3604
                  972F02972E019931029831029831029930028E2803FF00FFFF00FF9D3401C250
                  00972F02872403FF00FFAD470DEE871FD1640ABF4D01BA4800BC4B00BC4B00BD
                  4C00962E02FF00FFFF00FFFF00FFA63B01B848008B2703882502AF4A0FFE9F34
                  E67F1ED0650D8F2A018B28028F2A028F29028B2803FF00FFFF00FFFF00FF8B28
                  03BC4B009E3502842403AF490FFFA537B65012E98220C2590E862202FF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFB04101AB3F01862403AF490FFFAA39
                  9A3507A9440DFC982BC1580F862201FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFAD4001AF4101872503AF490FFFA939A13D0A7D1900892603FF9D2DC95F118A
                  2702FF00FFFF00FFFF00FFFF00FF8A2703BA4A00A93C01862503AF490FFFA939
                  A13D0AFF00FFFF00FF892603FB9C2EDA7319952D03832001842302872403A73C
                  01C45000952E02882502B14B10FFB03DA33F0BFF00FFFF00FFFF00FF892603E3
                  8024EB841FC2580CAC4103B44400C14E009F3501952E02FF00FFA33F0BE28829
                  993507FF00FFFF00FFFF00FFFF00FF892603AC480DC45D11BB5007A63A01912C
                  02872403FF00FFFF00FFA33F0B902B038A2602FF00FFFF00FFFF00FFFF00FFFF
                  00FF8825028825028A2703882503882502FF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              end
            end
            object GroupBoxApagar_Balanco_Registro: TGroupBox
              Left = 0
              Top = 65
              Width = 645
              Height = 308
              Align = alClient
              Caption = 'Selecione o registro que deseja apagar do arquivo de balan'#231'o'
              TabOrder = 1
              object DBGrid_Balanco_Registro: TDBGrid
                Left = 2
                Top = 18
                Width = 641
                Height = 288
                Align = alClient
                DataSource = dtmBalanco.dsBalancoRegistro
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -15
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'COD_BARRA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DATA_HORA_LEITURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QTDE_CONT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'GRUPO_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_PROD'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COD_GRADE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO1'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCR_PROD'
                    Visible = True
                  end>
              end
            end
            object GroupBoxLocApagar_Balanco_Registro: TGroupBox
              Left = 0
              Top = 0
              Width = 645
              Height = 65
              Align = alTop
              Caption = 'Localizar Registro'
              TabOrder = 2
              object Label20: TLabel
                Left = 10
                Top = 27
                Width = 59
                Height = 16
                Caption = 'Produto:'
              end
              object MaskEdit_produtolocalizar: TMaskEdit
                Left = 103
                Top = 24
                Width = 267
                Height = 24
                Hint = 'Informe o c'#243'digo de barras do produto'
                CharCase = ecUpperCase
                MaxLength = 20
                TabOrder = 0
                OnChange = MaskEdit_produtolocalizarChange
              end
            end
          end
        end
      end
    end
  end
  object Panel_Inferior: TPanel
    Left = 0
    Top = 471
    Width = 663
    Height = 39
    Align = alBottom
    TabOrder = 1
    object Gauge_HistoricoBalanco: TGauge
      Left = 1
      Top = 1
      Width = 584
      Height = 37
      Align = alClient
      Progress = 0
      Visible = False
    end
    object BitBtn_Sair: TBitBtn
      Left = 585
      Top = 1
      Width = 77
      Height = 37
      Hint = 'Sair desta tela'
      Align = alRight
      Caption = 'Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn_SairClick
      Glyph.Data = {
        2E020000424D2E020000000000002E0100002800000010000000100000000100
        08000000000000010000120B0000120B00003E0000003E00000000000000FFFF
        FF00FF00FF00BB410000BB420000FFF6EF00E69C5900E69D5900E9A36200FFF4
        EA00FFF8F200FECA9500FFCE9C00FFD4A900FEEBD800FEF0E200FFF2E500FFF3
        E700FFFBF700FECE9C00FED3A500FED5AA00FEDAB400FFDCB600FEDDB800FEDD
        BA00FFE3C500FEE2C400FFE5C900FFE6CA00FEE5CA00FFEBD500FEF3E700FFDA
        AD00FFEAD100FFFAF400FFD8A700FFD9A900FFDAAB00FFE1B800FFE7C700FEEE
        D900FFFBF600FFDCAC00FFE1B500FFE7C400FFEFD700FFEAC200FFFAEA00FFFE
        FB00FFFFFA00FFFFFE00315EFF002A56FF00123BFF00153DFF001841FF001A44
        FF001D47FF00072BFF00001EFF00000D66000202020202020202020202020202
        0202020202020202020202020202020202020204040404040404040404040402
        020202040132302E28272125242F04020202020401050F221B1614130B260402
        0202020401310A101F1A170D0C2B04020202020401013323110E1C18152C0402
        02020204010101332A20291D192D040202020204010101010112093D1E2E043D
        020202040101010101013D363D013D3C3D020204080606060606073D373D3B3D
        0202020203040404040404043D383D0202020202020202020202023D353D393D
        020202020202020202023D343D023D3A3D020202020202020202023D0202023D
        020202020202020202020202020202020202}
    end
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 192
    object Configurar1: TMenuItem
      Caption = 'Configurar'
      object Sinalsonoro1: TMenuItem
        Caption = 'Sinal sonoro'
        object Habilitar3: TMenuItem
          Caption = 'Habilitar'
          OnClick = Habilitar3Click
        end
        object Desabilitar3: TMenuItem
          Caption = 'Desabilitar'
          OnClick = Desabilitar3Click
        end
      end
      object AutoIncremento1: TMenuItem
        Caption = 'Auto Incremento'
        object Habilitar1: TMenuItem
          Caption = 'Habilitar'
          OnClick = Habilitar1Click
        end
        object Desabilitar1: TMenuItem
          Caption = 'Desabilitar'
          OnClick = Desabilitar1Click
        end
      end
      object AutoIncrementonaGrade1: TMenuItem
        Caption = 'Auto Incremento na Grade'
        object Habilitar2: TMenuItem
          Caption = 'Habilitar'
          OnClick = Habilitar2Click
        end
        object Desabilitar2: TMenuItem
          Caption = 'Desabilitar'
          OnClick = Desabilitar2Click
        end
      end
      object Sempre1: TMenuItem
        Caption = 'Sempre pedir grade'
        object Habilitar4: TMenuItem
          Caption = 'Habilitar'
          OnClick = Habilitar4Click
        end
        object Desabilitar4: TMenuItem
          Caption = 'Desabilitar'
          OnClick = Desabilitar4Click
        end
      end
    end
  end
end
