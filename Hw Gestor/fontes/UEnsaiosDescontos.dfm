inherited FrmEnsaiosDescontos: TFrmEnsaiosDescontos
  Left = 139
  Top = 55
  Caption = 'Ensaios de Diversos/Descontos'
  ClientHeight = 709
  ClientWidth = 928
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  ExplicitWidth = 936
  ExplicitHeight = 743
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 928
    Height = 709
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Ensaios Diversos'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 920
        Height = 49
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 14
          Width = 82
          Height = 13
          Caption = 'Escolha o Depto:'
        end
        object Label14: TLabel
          Left = 347
          Top = 14
          Width = 23
          Height = 13
          Caption = 'M'#234's:'
        end
        object Label15: TLabel
          Left = 419
          Top = 14
          Width = 22
          Height = 13
          Caption = 'Ano:'
        end
        object Label2: TLabel
          Left = 8
          Top = 34
          Width = 196
          Height = 13
          Caption = 'Dados da Empresa/Depto(Abaixo):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ComboBox1: TComboBox
          Left = 94
          Top = 6
          Width = 235
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'EMPRESA'
        end
        object Edit1: TEdit
          Left = 372
          Top = 6
          Width = 42
          Height = 21
          TabOrder = 1
        end
        object Edit2: TEdit
          Left = 450
          Top = 6
          Width = 53
          Height = 21
          TabOrder = 2
        end
        object BitBtn1: TBitBtn
          Left = 518
          Top = 2
          Width = 75
          Height = 25
          Hint = 'Verificar - [GES025]'
          Caption = 'Verificar >>'
          TabOrder = 3
          OnClick = BitBtn1Click
        end
        object BitBtn4: TBitBtn
          Left = 611
          Top = 2
          Width = 134
          Height = 25
          Hint = 'Limpar Dados Apura'#231#227'o'
          Caption = 'Limpar Dados Apura'#231#227'o'
          TabOrder = 4
          OnClick = BitBtn4Click
        end
        object BitBtn2: TBitBtn
          Left = 760
          Top = 2
          Width = 75
          Height = 25
          Hint = 'Sair desta tela'
          Caption = 'Sair'
          Default = True
          ModalResult = 1
          TabOrder = 5
          OnClick = BitBtn2Click
          Glyph.Data = {
            0E030000424D0E030000000000003600000028000000110000000E0000000100
            180000000000D8020000C30E0000C30E00000000000000000000BFBFBF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F007F7F007F7F007F7F
            007F7F007F7F007F7F007F7F007F7F007F7F007F7F000000BFBFBFBFBFBFBFBF
            BF00BFBFBF000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
            007F7F007F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F00
            7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F000000
            BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F007F7F007F7F007F7F007F7F00
            7F7F007F7F007F7F007F7F007F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBF
            BF000000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
            7F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBFBF000000007F7F007F7F007F
            7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F000000BFBFBFBF
            BFBFBFBFBF00BFBFBF000000007F7F007F7F007F7F007F7F007F7F007F7F007F
            7F007F7F007F7F007F7F007F7F000000BFBFBFBFBFBFBFBFBF00BFBFBF7F7F7F
            0000000000000000000000000000000000000000000000000000000000000000
            007F7F7FBFBFBFBFBFBFBFBFBF00BFBFBFBFBFBF000000FFFFFFFFFFFFFFFFFF
            000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBF
            BF00BFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBFBF00BFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F0000BFBFBF
            7F0000BFBFBFBFBFBF00BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F00007F0000BFBFBFBFBFBFBFBFBF00BFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF7F00007F00007F0000BFBFBFBFBFBF00}
          NumGlyphs = 2
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 49
        Width = 920
        Height = 202
        Align = alTop
        TabOrder = 1
        object StCustosEmp: TStringGrid
          Left = 1
          Top = 1
          Width = 918
          Height = 200
          Align = alClient
          FixedCols = 0
          RowCount = 9
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ColWidths = (
            278
            122
            81
            118
            83)
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 251
        Width = 920
        Height = 379
        Align = alTop
        TabOrder = 2
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 918
          Height = 111
          Align = alTop
          Enabled = False
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 1
            Top = 1
            Width = 916
            Height = 109
            Align = alTop
            Caption = 'Custos/Descontos'
            TabOrder = 0
            object Label3: TLabel
              Left = 21
              Top = 16
              Width = 123
              Height = 13
              Caption = 'Redu'#231#227'o Custos Fixos(%):'
            end
            object Label4: TLabel
              Left = 60
              Top = 39
              Width = 84
              Height = 13
              Caption = 'Redu'#231#227'o CMV(%)'
            end
            object Label5: TLabel
              Left = 61
              Top = 62
              Width = 83
              Height = 13
              Caption = 'Redu'#231#227'o OCV(%)'
            end
            object Label6: TLabel
              Left = 312
              Top = 16
              Width = 95
              Height = 13
              Caption = 'Lucro Desejado (%):'
            end
            object Label7: TLabel
              Left = 270
              Top = 39
              Width = 137
              Height = 13
              Caption = 'Lucro Desejado em Dinheiro:'
            end
            object Label8: TLabel
              Left = 225
              Top = 62
              Width = 182
              Height = 13
              Caption = 'Lucro esperado com este faturamento:'
            end
            object Label9: TLabel
              Left = 630
              Top = 16
              Width = 91
              Height = 13
              Caption = 'Perc. Desconto(%):'
            end
            object EdtCustos: TEditMoeda
              Left = 149
              Top = 8
              Width = 66
              Height = 21
              Alignment = taRightJustify
              TabOrder = 0
              FormatReal = fNumber
              FormatSize = '10.2'
            end
            object EdtRedCMV: TEditMoeda
              Left = 149
              Top = 31
              Width = 66
              Height = 21
              Alignment = taRightJustify
              TabOrder = 1
              FormatReal = fNumber
              FormatSize = '10.2'
            end
            object EdtRedOCV: TEditMoeda
              Left = 149
              Top = 54
              Width = 66
              Height = 21
              Alignment = taRightJustify
              TabOrder = 2
              FormatReal = fNumber
              FormatSize = '10.2'
            end
            object EdtPercLucro: TEditMoeda
              Left = 410
              Top = 8
              Width = 66
              Height = 21
              Alignment = taRightJustify
              TabOrder = 3
              FormatReal = fNumber
              FormatSize = '10.2'
              OnExit = EdtPercLucroExit
            end
            object EdtLucrodinheiro: TEditMoeda
              Left = 410
              Top = 31
              Width = 132
              Height = 21
              Alignment = taRightJustify
              TabOrder = 4
              FormatReal = fMoney
              FormatSize = '10.2'
              OnExit = EdtLucrodinheiroExit
            end
            object EdtFaturamento: TEditMoeda
              Left = 410
              Top = 54
              Width = 132
              Height = 21
              Alignment = taRightJustify
              TabOrder = 5
              FormatReal = fMoney
              FormatSize = '10.2'
              OnExit = EdtFaturamentoExit
            end
            object BitBtn3: TBitBtn
              Left = 385
              Top = 78
              Width = 75
              Height = 25
              Hint = 'Obter - [GES026]'
              Caption = 'Obter >>'
              TabOrder = 7
              OnClick = BitBtn3Click
            end
            object EdtPercDesconto: TEditMoeda
              Left = 725
              Top = 8
              Width = 66
              Height = 21
              Alignment = taRightJustify
              TabOrder = 6
              FormatReal = fNumber
              FormatSize = '10.2'
            end
            object BitBtn5: TBitBtn
              Left = 719
              Top = 78
              Width = 202
              Height = 25
              Hint = 'Sugest'#227'o para Venda de Produtos -[GES027]'
              Caption = 'Sugest'#227'o para Venda  de Produtos >>'
              TabOrder = 8
              OnClick = BitBtn5Click
            end
            object BitBtn7: TBitBtn
              Left = 466
              Top = 77
              Width = 111
              Height = 26
              Hint = 'Exportar Excel'
              Caption = '&Exportar Excel'
              TabOrder = 9
              OnClick = BitBtn7Click
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
                7777770000007777777777777777770000007777777777770007770000007444
                4400000006007700000074FFFF08880600080700000074F008000060EE070700
                000074FFFFF8060EE0047700000074F0088060EE00F47700000074FFFF060EE0
                00747700000074F00800EE0EE0047700000074FFFF0EE0F0EE047700000074F0
                080000F000047700000074FFFFFFFFFFFFF47700000074444444444444447700
                000074F444F444F444F477000000744444444444444477000000777777777777
                777777000000777777777777777777000000}
            end
          end
        end
        object PageControl2: TPageControl
          Left = 1
          Top = 112
          Width = 918
          Height = 266
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 1
          object TabSheet3: TTabSheet
            Caption = 'Resultados dos Ensaios'
            object stEnsaios: TStringGrid
              Left = 0
              Top = 0
              Width = 910
              Height = 238
              Align = alClient
              FixedCols = 0
              RowCount = 11
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ColWidths = (
                270
                121
                87
                118
                79)
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Dicas'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sugest'#227'o para Venda'
      ImageIndex = 1
      object GROUP: TPanel
        Left = 0
        Top = 0
        Width = 920
        Height = 275
        Align = alTop
        TabOrder = 0
        object Label10: TLabel
          Left = 11
          Top = 11
          Width = 130
          Height = 13
          Caption = 'Qtde dias Dispon'#237'veis M'#234's:'
        end
        object Label11: TLabel
          Left = 2
          Top = 30
          Width = 135
          Height = 13
          Caption = 'Curvas a Serem  Analisadas:'
        end
        object LbContador: TLabel
          Left = 11
          Top = 184
          Width = 6
          Height = 13
          Caption = '0'
        end
        object Edit3: TEdit
          Left = 144
          Top = 3
          Width = 49
          Height = 21
          TabOrder = 0
        end
        object CheckListBox1: TCheckListBox
          Left = 144
          Top = 26
          Width = 121
          Height = 47
          ItemHeight = 13
          Items.Strings = (
            'A'
            'B'
            'C')
          TabOrder = 1
        end
        object CheckBox1: TCheckBox
          Left = 11
          Top = 80
          Width = 254
          Height = 17
          Caption = 'Verificar Produtos Com Classe Atualidade = "R"'
          TabOrder = 2
        end
        object ProgressContador: TProgressBar
          Left = 11
          Top = 200
          Width = 894
          Height = 17
          TabOrder = 3
        end
        object GroupBox2: TGroupBox
          Left = 271
          Top = 0
          Width = 626
          Height = 179
          Caption = 'Dados Produtos'
          TabOrder = 4
          object Label12: TLabel
            Left = 5
            Top = 28
            Width = 73
            Height = 13
            Caption = 'Tipo de Venda:'
          end
          object Label13: TLabel
            Left = 347
            Top = 11
            Width = 145
            Height = 13
            Caption = 'Percentual de Venda por Tipo:'
          end
          object ChecktpVendas: TCheckListBox
            Left = 83
            Top = 28
            Width = 254
            Height = 118
            ItemHeight = 13
            Items.Strings = (
              'V - Varejo'
              'A - Atacado'
              'C - Consignado'
              'T - Televenda'
              'L - Aplicadores'
              'O - Outras Empresas')
            TabOrder = 0
          end
          object StpercVenda: TStringGrid
            Left = 344
            Top = 26
            Width = 276
            Height = 120
            ColCount = 3
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            ColWidths = (
              93
              90
              64)
          end
        end
        object BitBtn6: TBitBtn
          Left = 3
          Top = 250
          Width = 143
          Height = 25
          Hint = 'Nova Sugest'#227'o  - [GES028]'
          Caption = 'Nova Sugest'#227'o >>'
          TabOrder = 5
          OnClick = BitBtn6Click
        end
      end
    end
  end
end
