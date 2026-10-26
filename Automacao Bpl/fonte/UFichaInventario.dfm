inherited FrmFichaInv: TFrmFichaInv
  Left = 360
  Top = 43
  Caption = 'Ficha de Invent'#225'rio '
  ClientHeight = 562
  ClientWidth = 518
  Position = poMainFormCenter
  Scaled = False
  OnClose = FormClose
  ExplicitWidth = 526
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 518
    Height = 517
    ActivePage = tsFichaMovimentacao
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsFichaMovimentacao: TTabSheet
      Caption = 'Ficha de &Movimenta'#231#227'o'
      OnShow = tsFichaMovimentacaoShow
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 510
        Height = 486
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 33
          Top = 55
          Width = 57
          Height = 13
          Caption = 'Data Inicial:'
        end
        object Label2: TLabel
          Left = 177
          Top = 55
          Width = 52
          Height = 13
          Caption = 'Data Final:'
        end
        object MaskEdit1: TMaskEdit
          Left = 96
          Top = 47
          Width = 69
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
        end
        object MaskEdit2: TMaskEdit
          Left = 233
          Top = 47
          Width = 68
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 1
          Text = '  /  /    '
        end
        object ProgressBar1: TProgressBar
          Left = 1
          Top = 469
          Width = 508
          Height = 16
          Align = alBottom
          TabOrder = 2
        end
      end
    end
    object tsFichaInventario: TTabSheet
      Caption = '&Ficha de Inventario Geral'
      ImageIndex = 1
      OnShow = tsFichaInventarioShow
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 510
        Height = 486
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 18
          Top = 38
          Width = 36
          Height = 13
          Caption = 'Ordem:'
        end
        object Label4: TLabel
          Left = 7
          Top = 67
          Width = 43
          Height = 13
          Caption = 'Loca'#231'ao:'
        end
        object Label5: TLabel
          Left = 95
          Top = 67
          Width = 73
          Height = 13
          Caption = 'Qual Loca'#231#227'o?:'
        end
        object Label11: TLabel
          Left = 8
          Top = 91
          Width = 46
          Height = 13
          Caption = 'Gr.Inicial:'
        end
        object Label12: TLabel
          Left = 114
          Top = 91
          Width = 58
          Height = 13
          Caption = 'Grupo Final:'
        end
        object ComboBox1: TComboBox
          Left = 56
          Top = 32
          Width = 161
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 0
          Text = 'Alfab'#233'tica'
          Items.Strings = (
            'Num'#233'rica'
            'Alfab'#233'tica')
        end
        object MaskEdit3: TMaskEdit
          Left = 56
          Top = 60
          Width = 28
          Height = 21
          EditMask = '99;0;_'
          MaxLength = 2
          TabOrder = 1
        end
        object ComboBox2: TComboBox
          Left = 176
          Top = 60
          Width = 41
          Height = 19
          Style = csOwnerDrawFixed
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = '1'
          Items.Strings = (
            '1'
            '2')
        end
        object CheckBox2: TCheckBox
          Left = 56
          Top = 130
          Width = 114
          Height = 17
          Caption = 'Somente Consumo'
          TabOrder = 6
        end
        object Edit3: TEdit
          Left = 56
          Top = 84
          Width = 34
          Height = 21
          TabOrder = 3
        end
        object Edit4: TEdit
          Left = 176
          Top = 85
          Width = 40
          Height = 21
          TabOrder = 4
        end
        object CheckBox1: TCheckBox
          Left = 56
          Top = 109
          Width = 97
          Height = 17
          Caption = 'Com etiqueta'
          TabOrder = 5
        end
        object CheckBox4: TCheckBox
          Left = 56
          Top = 149
          Width = 114
          Height = 17
          Caption = 'Com Grade'
          TabOrder = 7
        end
        object CheckBox5: TCheckBox
          Left = 56
          Top = 170
          Width = 97
          Height = 17
          Caption = 'Grupo e C'#243'digo'
          TabOrder = 8
        end
      end
    end
    object tsBalancoEstoque: TTabSheet
      Caption = '&Balan'#231'o Di'#225'rio de Estoque'
      ImageIndex = 2
      OnShow = tsBalancoEstoqueShow
      object GroupBox1: TGroupBox
        Left = 0
        Top = 441
        Width = 510
        Height = 45
        Align = alBottom
        ParentBackground = False
        TabOrder = 1
        object BitBtn3: TBitBtn
          Left = 154
          Top = 10
          Width = 125
          Height = 25
          Cancel = True
          Caption = '&Confirmar Balan'#231'o'
          TabOrder = 1
          OnClick = BitBtn3Click
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000130B0000130B0000000100000001000000630000007B
            0000089C210010A5290010B539007BD67B00FF00FF00FFFFFF00FFFFFF00FFFF
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00060606060606
            0606060606060606060606060606060606060606060606060606060606060601
            0000000001060606060606060606000003030202000006060606060606000003
            0304040202000006060606060100030404040404020200010606060600030404
            0403030404020200060606060005040403030303040402000606060600050404
            0303030304040200060606060005050404030304040202000606060601000505
            0404040402020001060606060600000505040402020000060606060606060000
            0505020200000606060606060606060100000000010606060606060606060606
            0606060606060606060606060606060606060606060606060606}
        end
        object BitBtn5: TBitBtn
          Left = 380
          Top = 10
          Width = 75
          Height = 25
          Cancel = True
          Caption = '&Sair'
          ModalResult = 2
          TabOrder = 2
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000030F0000030F00000001000000010000B55A0000BD5A
            0000C65A0000CE630000CE6B0000D66B0000D6730000DE730000DE7B0000E77B
            0000EF7B0000F77B000000840000F7840000FF840000009C0000DE7B0800F784
            0800AD5A100094521800E77B1800DE84180008A5180008AD180010AD1800DE73
            290021AD310018BD310021BD31008C4A390029BD39004242420029C64A0031C6
            4A008C63630042D66B0084848400FFE7C600FFEFD600FFF7D600FFF7DE00FF00
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
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00292929292929
            29292929292929292929292929291F1F1F1F292929292929292929221F1F1D13
            001F2222222222222929292200001200021F160C0C0C16222929292202020202
            031F211818180F222929292202030303031F211C1C2023222929292203040404
            061F0C1A1E2123222929292204041528061F0C0C0C0F0F222929292206061006
            061F2525252525222929292206060808081F2626262626222929292208090909
            0A1F272828282822292929220E0D0A0A0A1F272727272722292929220E0E110D
            0E1F27272727272229292929222219140E1F2424242424242929292929292222
            221F292929292929292929292929292929292929292929292929}
        end
        object BitBtn6: TBitBtn
          Left = 3
          Top = 10
          Width = 145
          Height = 25
          Caption = '&Rel. Prod. Contados'
          TabOrder = 0
          OnClick = BitBtn6Click
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
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 510
        Height = 441
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        object Label6: TLabel
          Left = 67
          Top = 62
          Width = 42
          Height = 13
          Caption = 'Produto:'
        end
        object Label7: TLabel
          Left = 5
          Top = 88
          Width = 104
          Height = 13
          Caption = 'Quantidade Contada:'
        end
        object Label8: TLabel
          Left = 53
          Top = 114
          Width = 52
          Height = 13
          Caption = 'Loca'#231#227'o 1:'
        end
        object Label9: TLabel
          Left = 215
          Top = 114
          Width = 52
          Height = 13
          Caption = 'Loca'#231#227'o 2:'
        end
        object lbDescProd: TLabel
          Left = 7
          Top = 203
          Width = 9
          Height = 13
          Caption = '::'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbLocacao: TLabel
          Left = 7
          Top = 217
          Width = 9
          Height = 13
          Caption = '::'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbContado: TLabel
          Left = 7
          Top = 244
          Width = 9
          Height = 13
          Caption = '::'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbInforme: TLabel
          Left = 7
          Top = 403
          Width = 9
          Height = 13
          Caption = '::'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbQtdGrade: TLabel
          Left = 7
          Top = 259
          Width = 65
          Height = 13
          Caption = 'lbQtdGrade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 174
          Top = 110
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
            0404040404040404040404040404040404040404040404040404040404040404
            0404040404040404040404010000000000000104040404040404040002020202
            0202000004040404040404000202020202020001000404040404040100020202
            0202000101000404040404040003030303030300010100040404040404000303
            0303030300010100040404040404000303030303030001010004040404040400
            0303030303030001000404040404040400030303030303000004040404040404
            0400030303030303000404040404040404040100000000010104040404040404
            0404040404040404040404040404040404040404040404040404}
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 336
          Top = 110
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000EE0E0000EE0E000000010000000100006B6B6B008484
            8400C6C6C600DEDEDE00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
            0404040404040404040404040404040404040404040404040404040404040404
            0404040404040404040404010000000000000104040404040404040002020202
            0202000004040404040404000202020202020001000404040404040100020202
            0202000101000404040404040003030303030300010100040404040404000303
            0303030300010100040404040404000303030303030001010004040404040400
            0303030303030001000404040404040400030303030303000004040404040404
            0400030303030303000404040404040404040100000000010104040404040404
            0404040404040404040404040404040404040404040404040404}
          OnClick = SpeedButton2Click
        end
        object lbCodGrupo: TLabel
          Left = 7
          Top = 187
          Width = 9
          Height = 13
          Caption = '::'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbCodProd: TLabel
          Left = 79
          Top = 187
          Width = 9
          Height = 13
          Caption = '::'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditNumFabProd: TEdit
          Left = 111
          Top = 59
          Width = 120
          Height = 21
          BiDiMode = bdLeftToRight
          CharCase = ecUpperCase
          ParentBiDiMode = False
          TabOrder = 2
          OnExit = EditNumFabProdExit
          OnKeyDown = EditNumFabProdKeyDown
        end
        object MaskEdit4: TMaskEdit
          Left = 111
          Top = 111
          Width = 57
          Height = 21
          CharCase = ecUpperCase
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 4
        end
        object MaskEdit5: TMaskEdit
          Left = 273
          Top = 111
          Width = 57
          Height = 21
          CharCase = ecUpperCase
          EditMask = '99-A-999;0;_'
          MaxLength = 8
          TabOrder = 5
        end
        object ProgressBar2: TProgressBar
          Left = 1
          Top = 423
          Width = 508
          Height = 17
          Align = alBottom
          TabOrder = 7
        end
        object CheckBox3: TCheckBox
          Left = 111
          Top = 8
          Width = 296
          Height = 17
          Caption = 'Imprimir Custo M'#233'dio no Relat'#243'rio de Produtos Contados'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 111
          Top = 148
          Width = 75
          Height = 25
          Hint = 'Incluir - [PRO149]'
          Caption = '&Incluir'
          TabOrder = 6
          OnClick = BitBtn4Click
          OnEnter = BitBtn4Enter
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
        object EditMoeda1: TEditMoeda
          Left = 111
          Top = 85
          Width = 121
          Height = 21
          Alignment = taRightJustify
          TabOrder = 3
          FormatReal = fNumber
          FormatSize = '10.2'
        end
        object EditCodProd: TEdit
          Left = 273
          Top = 59
          Width = 57
          Height = 21
          BiDiMode = bdLeftToRight
          CharCase = ecUpperCase
          Enabled = False
          ParentBiDiMode = False
          TabOrder = 8
          Visible = False
          OnExit = EditNumFabProdExit
          OnKeyDown = EditNumFabProdKeyDown
        end
        object EditGrupoProd: TEditHw
          Left = 238
          Top = 59
          Width = 25
          Height = 21
          TabOrder = 9
          Text = '0'
          Visible = False
          Formato = fInteger
          FormatSize = '0.2'
        end
        object CheckBox6: TCheckBox
          Left = 111
          Top = 31
          Width = 296
          Height = 17
          Caption = 'Imprimir Loca'#231#227'o 1 e Loca'#231#227'o 2'
          TabOrder = 1
        end
      end
    end
    object tsRelFichaInvBalanco: TTabSheet
      Caption = 'tsRelFichaInvBalanco'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 510
        Height = 486
        ActivePage = tsRelComEtiqueta
        Align = alClient
        TabOrder = 0
        object tsRelComEtiqueta: TTabSheet
          Caption = 'tsRelComEtiqueta'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object qrpFichaInventario: TQuickRep
            Left = 0
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            DataSet = dtmProdutos.qrFichaInvBal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            OnPreview = qrpFichaInventarioPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 2
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
              50.000000000000000000
              0.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsNormal
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand1: TQRBand
              Left = 19
              Top = 38
              Width = 775
              Height = 91
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                240.770833333333300000
                2050.520833333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRLabel1: TQRLabel
                Left = 293
                Top = 38
                Width = 189
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  775.229166666666800000
                  100.541666666666700000
                  500.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Ficha de Invent'#225'rio para Balan'#231'o'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData1: TQRSysData
                Left = 4
                Top = 39
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  103.187500000000000000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDate
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel2: TQRLabel
                Left = 664
                Top = 59
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1756.833333333333000000
                  156.104166666666700000
                  132.291666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData2: TQRSysData
                Left = 720
                Top = 59
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1905.000000000000000000
                  156.104166666666700000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel3: TQRLabel
                Left = 5
                Top = 72
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  13.229166666666670000
                  190.500000000000000000
                  132.291666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Loca'#231#227'o'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel10: TQRLabel
                Left = 344
                Top = 8
                Width = 85
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  910.166666666666600000
                  21.166666666666670000
                  224.895833333333300000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel10'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
            end
            object DetailBandFichaInv: TQRBand
              Left = 19
              Top = 129
              Width = 387
              Height = 114
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                301.625000000000000000
                1023.937500000000000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRLabel4: TQRLabel
                Left = 4
                Top = 85
                Width = 39
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  10.583333333333330000
                  224.895833333333300000
                  103.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Loc 1:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel5: TQRLabel
                Left = 161
                Top = 86
                Width = 39
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  425.979166666666700000
                  227.541666666666700000
                  103.187500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Loc 2:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel6: TQRLabel
                Left = 4
                Top = 65
                Width = 27
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  10.583333333333330000
                  171.979166666666700000
                  71.437500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Est.:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel7: TQRLabel
                Left = 35
                Top = 65
                Width = 58
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  92.604166666666680000
                  171.979166666666700000
                  153.458333333333300000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel7'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel8: TQRLabel
                Left = 118
                Top = 66
                Width = 82
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  312.208333333333400000
                  174.625000000000000000
                  216.958333333333400000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Est. contado:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel9: TQRLabel
                Left = 203
                Top = 66
                Width = 134
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  537.104166666666700000
                  174.625000000000000000
                  354.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = '___________________'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText2: TQRDBText
                Left = 45
                Top = 85
                Width = 108
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  119.062500000000000000
                  224.895833333333300000
                  285.750000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'LOCACAO_PROD'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText3: TQRDBText
                Left = 203
                Top = 86
                Width = 122
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  537.104166666666700000
                  227.541666666666700000
                  322.791666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'LOCACAO_PROD_1'
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRDBText4: TQRDBText
                Left = 4
                Top = 48
                Width = 333
                Height = 19
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  50.270833333333330000
                  10.583333333333330000
                  127.000000000000000000
                  881.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'DESCR_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRBarcode1: TQRBarcode
                Left = 4
                Top = 2
                Width = 25
                Height = 45
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  119.062500000000000000
                  10.583333333333330000
                  5.291666666666667000
                  66.145833333333340000)
                Picture.Data = {
                  07544269746D6170CA110000424DCA1100000000000036000000280000001900
                  00002D0000000100200000000000941100000000000000000000000000000000
                  000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
                  FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
                  FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
                  FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
                  FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
                  FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
                  FF0000000000FFFFFF000000000000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF0000000000FFFF
                  FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF0000000000FFFFFF000000
                  0000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF000000
                  000000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
                  FF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
                  FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF000000
                  0000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFF000000
                  0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00000000000000
                  0000FFFFFF000000000000000000FFFFFF0000000000}
                Modul = 1
                Ratio = 2.000000000000000000
                TextShow = tsBarCode
                AutoWidth = True
                About = 
                  'BarCode VCL Component, Copyright(C) Han-soft Software.(http://ww' +
                  'w.han-soft.com)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Alignment = taLeftJustify
                Color = clWhite
                UseDockManager = False
              end
              object QrLbGradComEti: TQRLabel
                Left = 344
                Top = 48
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  910.166666666666800000
                  127.000000000000000000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QrLbGradComEti'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
            end
          end
        end
        object tsRelSemEtiqueta: TTabSheet
          Caption = 'tsRelSemEtiqueta'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object qrpFichaInvSemEtiqueta: TQuickRep
            Left = 0
            Top = 0
            Width = 794
            Height = 1123
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            AfterPrint = qrpFichaInvSemEtiquetaAfterPrint
            DataSet = dtmProdutos.qrFichaInvBal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            Functions.Strings = (
              'PAGENUMBER'
              'COLUMNNUMBER'
              'REPORTTITLE')
            Functions.DATA = (
              '0'
              '0'
              #39#39)
            OnPreview = qrpFichaInventarioPreview
            Options = [FirstPageHeader, LastPageFooter]
            Page.Columns = 1
            Page.Orientation = poPortrait
            Page.PaperSize = A4
            Page.Values = (
              100.000000000000000000
              2970.000000000000000000
              100.000000000000000000
              2100.000000000000000000
              50.000000000000000000
              0.000000000000000000
              0.000000000000000000)
            PrinterSettings.Copies = 1
            PrinterSettings.OutputBin = Auto
            PrinterSettings.Duplex = False
            PrinterSettings.FirstPage = 0
            PrinterSettings.LastPage = 0
            PrinterSettings.UseStandardprinter = False
            PrinterSettings.UseCustomBinCode = False
            PrinterSettings.CustomBinCode = 0
            PrinterSettings.ExtendedDuplex = 0
            PrinterSettings.UseCustomPaperCode = False
            PrinterSettings.CustomPaperCode = 0
            PrinterSettings.PrintMetaFile = False
            PrinterSettings.PrintQuality = 0
            PrinterSettings.Collate = 0
            PrinterSettings.ColorOption = 0
            PrintIfEmpty = True
            SnapToGrid = True
            Units = MM
            Zoom = 100
            PrevFormStyle = fsNormal
            PreviewInitialState = wsNormal
            PrevInitialZoom = qrZoomToFit
            PreviewDefaultSaveType = stQRP
            object QRBand2: TQRBand
              Left = 19
              Top = 38
              Width = 775
              Height = 94
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                248.708333333333300000
                2050.520833333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbPageHeader
              object QRLabel11: TQRLabel
                Left = 293
                Top = 38
                Width = 189
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  775.229166666666800000
                  100.541666666666700000
                  500.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Ficha de Invent'#225'rio para Balan'#231'o'
                Color = clWhite
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData3: TQRSysData
                Left = 4
                Top = 39
                Width = 38
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  103.187500000000000000
                  100.541666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsDate
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel12: TQRLabel
                Left = 664
                Top = 42
                Width = 50
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1756.833333333333000000
                  111.125000000000000000
                  132.291666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'P'#225'gina:'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 10
              end
              object QRSysData4: TQRSysData
                Left = 720
                Top = 42
                Width = 46
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1905.000000000000000000
                  111.125000000000000000
                  121.708333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                Color = clWhite
                Data = qrsPageNumber
                Transparent = False
                ExportAs = exptText
                FontSize = 10
              end
              object QRLabel13: TQRLabel
                Left = 128
                Top = 75
                Width = 55
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  338.666666666666700000
                  198.437500000000000000
                  145.520833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Descri'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel14: TQRLabel
                Left = 344
                Top = 8
                Width = 85
                Height = 20
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  52.916666666666670000
                  910.166666666666600000
                  21.166666666666670000
                  224.895833333333300000)
                Alignment = taCenter
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel14'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 12
              end
              object QRLabel15: TQRLabel
                Left = 3
                Top = 75
                Width = 59
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  7.937500000000000000
                  198.437500000000000000
                  156.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Aloca'#231#227'o 1'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel16: TQRLabel
                Left = 65
                Top = 75
                Width = 59
                Height = 21
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  55.562500000000000000
                  171.979166666666700000
                  198.437500000000000000
                  156.104166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Aloca'#231#227'o 2'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel19: TQRLabel
                Left = 558
                Top = 76
                Width = 68
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1476.375000000000000000
                  201.083333333333300000
                  179.916666666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Est. contado'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel17: TQRLabel
                Left = 500
                Top = 76
                Width = 52
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1322.916666666667000000
                  201.083333333333300000
                  137.583333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Est. Atual'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel21: TQRLabel
                Left = 637
                Top = 76
                Width = 90
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1685.395833333333000000
                  201.083333333333300000
                  238.125000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'Num. Fabrica'#231#227'o'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRLabel22: TQRLabel
                Left = 478
                Top = 76
                Width = 15
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1264.708333333333000000
                  201.083333333333300000
                  39.687500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'UN'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
            end
            object DetailBFichaInvSemEti: TQRBand
              Left = 19
              Top = 132
              Width = 775
              Height = 31
              Frame.Color = clBlack
              Frame.DrawTop = False
              Frame.DrawBottom = False
              Frame.DrawLeft = False
              Frame.DrawRight = False
              AlignToBottom = False
              Color = clWhite
              TransparentBand = False
              ForceNewColumn = False
              ForceNewPage = False
              Size.Values = (
                82.020833333333340000
                2050.520833333333000000)
              PreCaluculateBandHeight = False
              KeepOnOnePage = False
              BandType = rbDetail
              object QRLabel18: TQRLabel
                Left = 505
                Top = 3
                Width = 47
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1336.145833333333000000
                  7.937500000000000000
                  124.354166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Caption = 'QRLabel18'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRLabel20: TQRLabel
                Left = 558
                Top = 3
                Width = 78
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1476.375000000000000000
                  7.937500000000000000
                  206.375000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = '___________________'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 8
              end
              object QRDBText1: TQRDBText
                Left = 4
                Top = 3
                Width = 55
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  10.583333333333330000
                  7.937500000000000000
                  145.520833333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'LOCACAO_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText6: TQRDBText
                Left = 64
                Top = 3
                Width = 58
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  169.333333333333300000
                  7.937500000000000000
                  153.458333333333300000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'LOCACAO_PROD_1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText7: TQRDBText
                Left = 128
                Top = 3
                Width = 301
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  338.666666666666700000
                  7.937500000000000000
                  796.395833333333200000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'DESCR_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText8: TQRDBText
                Left = 637
                Top = 3
                Width = 77
                Height = 14
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  37.041666666666670000
                  1685.395833333333000000
                  7.937500000000000000
                  203.729166666666700000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'NUM_FAB_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText9: TQRDBText
                Left = 478
                Top = 3
                Width = 21
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1264.708333333333000000
                  7.937500000000000000
                  55.562500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'UNIDADE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QrLbGrade: TQRLabel
                Left = 431
                Top = 3
                Width = 45
                Height = 17
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1140.354166666667000000
                  7.937500000000000000
                  119.062500000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Caption = 'QrLbGrade'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText5: TQRDBText
                Left = 642
                Top = 3
                Width = 47
                Height = 17
                Enabled = False
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1698.625000000000000000
                  7.937500000000000000
                  124.354166666666700000)
                Alignment = taRightJustify
                AlignToBand = False
                AutoSize = False
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'GRUPO_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
              object QRDBText10: TQRDBText
                Left = 713
                Top = 3
                Width = 54
                Height = 17
                Enabled = False
                Frame.Color = clBlack
                Frame.DrawTop = False
                Frame.DrawBottom = False
                Frame.DrawLeft = False
                Frame.DrawRight = False
                Size.Values = (
                  44.979166666666670000
                  1886.479166666667000000
                  7.937500000000000000
                  142.875000000000000000)
                Alignment = taLeftJustify
                AlignToBand = False
                AutoSize = True
                AutoStretch = False
                Color = clWhite
                DataSet = dtmProdutos.qrFichaInvBal
                DataField = 'COD_PROD'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Transparent = False
                WordWrap = True
                ExportAs = exptText
                FontSize = 7
              end
            end
          end
        end
      end
    end
    object TabSheet_Grade: TTabSheet
      Caption = 'TabSheet_Grade'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel_Grade: TPanel
        Left = 0
        Top = 0
        Width = 510
        Height = 486
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object DBGrid_Grade: TDBGrid
          Left = 1
          Top = 74
          Width = 508
          Height = 370
          Hint = '[Enter: Entrar no cadastro, Ver detalhes]'
          DataSource = dtmProdutos.dsVisGrade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
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
          Width = 508
          Height = 73
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          TabOrder = 1
          object Label10: TLabel
            Left = 19
            Top = 31
            Width = 49
            Height = 13
            Caption = 'Produto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Edit_ProdutoGrade: TEdit
            Left = 74
            Top = 28
            Width = 415
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel5: TPanel
          Left = 1
          Top = 444
          Width = 508
          Height = 41
          Align = alBottom
          TabOrder = 2
          object BitBtn_Grade_OK: TBitBtn
            Left = 216
            Top = 6
            Width = 75
            Height = 25
            Caption = '&OK'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtn_Grade_OKClick
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
  end
  object GroupBox37: TGroupBox
    Left = 0
    Top = 517
    Width = 518
    Height = 45
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object BitBtn8: TBitBtn
      Left = 221
      Top = 10
      Width = 75
      Height = 25
      Hint = 'Confirmar - [PRO148]'
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn8Click
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
    object BitBtn1: TBitBtn
      Left = 384
      Top = 10
      Width = 75
      Height = 25
      Hint = 'Sair desta tela'
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000030F0000030F00000001000000010000B55A0000BD5A
        0000C65A0000CE630000CE6B0000D66B0000D6730000DE730000DE7B0000E77B
        0000EF7B0000F77B000000840000F7840000FF840000009C0000DE7B0800F784
        0800AD5A100094521800E77B1800DE84180008A5180008AD180010AD1800DE73
        290021AD310018BD310021BD31008C4A390029BD39004242420029C64A0031C6
        4A008C63630042D66B0084848400FFE7C600FFEFD600FFF7D600FFF7DE00FF00
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00292929292929
        29292929292929292929292929291F1F1F1F292929292929292929221F1F1D13
        001F2222222222222929292200001200021F160C0C0C16222929292202020202
        031F211818180F222929292202030303031F211C1C2023222929292203040404
        061F0C1A1E2123222929292204041528061F0C0C0C0F0F222929292206061006
        061F2525252525222929292206060808081F2626262626222929292208090909
        0A1F272828282822292929220E0D0A0A0A1F272727272722292929220E0E110D
        0E1F27272727272229292929222219140E1F2424242424242929292929292222
        221F292929292929292929292929292929292929292929292929}
    end
  end
end
