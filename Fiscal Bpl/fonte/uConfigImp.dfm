inherited frmConfigImp: TfrmConfigImp
  Left = 233
  Top = 149
  Caption = 'Configura'#231#245'es  do ECF'
  ClientHeight = 389
  ClientWidth = 723
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  ExplicitWidth = 739
  ExplicitHeight = 427
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 723
    Height = 345
    Align = alTop
    Caption = 'Configura'#231#227'o do Equipamento '
    TabOrder = 0
    object Label1: TLabel
      Left = 83
      Top = 23
      Width = 54
      Height = 13
      Caption = 'Impressora:'
    end
    object Label2: TLabel
      Left = 497
      Top = 49
      Width = 28
      Height = 13
      Caption = 'Porta:'
    end
    object Label3: TLabel
      Left = 75
      Top = 158
      Width = 65
      Height = 13
      Caption = 'Cod Terminal:'
    end
    object Label4: TLabel
      Left = 43
      Top = 185
      Width = 97
      Height = 13
      Caption = 'Observa'#231#227'o Cupom:'
    end
    object Label5: TLabel
      Left = 79
      Top = 77
      Width = 63
      Height = 13
      Caption = 'Al'#237'quota ISS:'
    end
    object Label6: TLabel
      Left = 407
      Top = 23
      Width = 120
      Height = 13
      Caption = 'N'#250'mero de S'#233'rie do ECF:'
    end
    object Label7: TLabel
      Left = 20
      Top = 131
      Width = 120
      Height = 13
      Caption = 'N'#250'mero do Equipamento:'
    end
    object Label8: TLabel
      Left = 348
      Top = 157
      Width = 179
      Height = 13
      Caption = 'Qtde de Vias dos Cupons n'#227'o Fiscais:'
    end
    object Label9: TLabel
      Left = 403
      Top = 77
      Width = 126
      Height = 13
      Caption = 'Modelo Documento Fiscal:'
    end
    object Label10: TLabel
      Left = 38
      Top = 104
      Width = 104
      Height = 13
      Caption = 'Contador de Rein'#237'cio:'
    end
    object Label12: TLabel
      Left = 78
      Top = 50
      Width = 67
      Height = 13
      Caption = 'Balan'#231'a PDV:'
    end
    object Label13: TLabel
      Left = 329
      Top = 131
      Width = 195
      Height = 13
      Caption = 'Percentual M'#225'ximo de desconto por item:'
    end
    object Label14: TLabel
      Left = 361
      Top = 103
      Width = 164
      Height = 13
      Caption = 'Qtde de Digitos do DAV(de 10 13):'
    end
    object Label15: TLabel
      Left = 434
      Top = 185
      Width = 92
      Height = 13
      Caption = 'Endere'#231'o HwF.fdb:'
      Visible = False
    end
    object SpeedButton1: TSpeedButton
      Left = 684
      Top = 182
      Width = 23
      Height = 22
      Caption = '...'
      Visible = False
      OnClick = SpeedButton1Click
    end
    object Label16: TLabel
      Left = 94
      Top = 213
      Width = 48
      Height = 13
      Caption = 'Usar TEF:'
    end
    object Label50: TLabel
      Left = 459
      Top = 213
      Width = 68
      Height = 13
      Caption = 'Imp DAV ECF:'
    end
    object SpeedButton2: TSpeedButton
      Left = 312
      Top = 78
      Width = 36
      Height = 36
      Hint = 'Configurar tabelas de pre'#231'o para o PAF-ECF'
      Glyph.Data = {
        3E060000424D3E06000000000000FE0300002800000018000000180000000100
        08000000000040020000120B0000120B0000F2000000F2000000FF00FF000143
        0300014203000138020001340200024E040002480400014E040001410300039E
        0B0003970B0002640600026306000252060002500500024D0500036808000358
        070003A40C0003A10D0003A00C00039E0C00039E0D00039E0F0004A10D0004A1
        0F0005A11100036C0B0003690900059F1000035F0900035C0800046E0C000468
        0A0005780D0006810F00056F0C00056B0C000789110016AA2000D8F2DA0005A3
        130006A1130006A0150004700D0007A5170007A3150007A3160005750E000575
        0F0005740F00067A1100089215002EB53900C5EDC90007A5180008A51A0008A3
        19000678120009A71C0009A41B000995180009881700088016000A8F1A008CD9
        950009A41D000AA921000AA71F000AA61E000AA51F000AA520000BA621000CA9
        23000CA622000B961E000A8B1D000A871A000C991F000C981F000D98200041BF
        53000BA623000CAA26000CA725000DA727000C9322007FD58C00EDFAEF00EBF8
        ED000DA728000EAC2B000EAB2B000DA028000EA92A000FAC2D000FAA2C000E98
        260048C25F0081D791000FA92E0011AF330010AA300011AB320011AA3000B6E7
        C00011AA330012AD350012AD360013AC370013AC380013AB350014AC37003DBD
        59004AC2650084D89700EDFAF00013AF390014AD3B0016AD3D0016AD3E0016AC
        3B0018AD3E001EB1430088D99D0015AF3E0016B0410016AF400017AF420018B0
        430017AB400019B142001CB1460043C0670018B1460018B1470018AD44001AB0
        47001EB24A001FB44D0023B5500038BF62006CD08B0019B149001AB24B001AB0
        49001CB44E001CB24E001FB2500024B6540054C7790099E0B0001CB552001CB4
        51001DB250001EB553001FB655001FB5520020B4520022B5540023B5550024B7
        560025B8590025B758002ABA5D0029B85A002BBA5C002DBA5D002DBA5E002EBA
        5F0030BB600034BC640037BD660038BF68003ABF68003CC06B003EC06C0041C1
        6E0046C4730047C574004BC776004AC475004DC6780078D59900BBEACB00CEF0
        DA002FBB630035BD660036BF68003FC16E0042C2700045C5730048C5750048C5
        76004BC577004FC77B0052C77D0056CA810056C9800058CB820059CB84005ACB
        83005ECC870060CE890062CE8B0063CE8A0065CF8C0064CE8B0066D08E006BD1
        92006BD090006DD192006FD395006ED1920073D4980072D3950073D3960074D3
        970075D4980076D4990079D59C0080D8A1007FD7A00086DAA50087DAA5008CDC
        AA0090DDAD0092DEAF0093DEAF009AE1B500C0EDD100CAEFD800EFFAF3006DD3
        950078D59D007AD79F0087DAA70089DCA900A6E5BF00D5F3E100FFFFFF000000
        000000000000000000000000000000000000000000000000000000001F1F110D
        0F06010808080808080808080808030300000030253A312C1B100B0C0C0C0C0C
        0C0C0C0C0B0B0704030000305D5B4945382E1A13141414141414141414120A05
        0300003E6C655C53433B2D2919F01414141414141412120B0800004077756760
        554A42392AF01515151515151514140B0800004B8981796F687369F0F0F03641
        271515151514140C0800004F9E9E847A70F0586248F05159F03509151514140C
        0800004FA5A4958A83F07C645AF04657F02816151514140C0800004FBBBCA8A1
        8BF0856F66F05463F0F02A171514140C0800004FB3C1BBA3A3B48C786DF07158
        F0F0392B1D13140C0800004FC7C8B1A5A59F939697F0F0F0F058473C2F29180B
        0200004FCFD0B3A8A7BFB9F0F0F0F0F07472554842372A1C0600004FD2E9B6AA
        A9E6F0F0F0F0B88E7B6A645A524438200E00004FD4D6C4ABABF0F0E8CEF09387
        7E766B665E5343321100004FD8EAC7ADAFF0F0E39EF0949AF08D786E675F5A33
        1E00004FDBDDCDB0C0E7F0EEA5F0A0C9F0B5897F766B663F2100004FDCECD7B1
        C0C5EFF0E5F0E1E8F0D99A91807D6D4D2400004FB7E1E0C7C4C2BEDEE3F0E3E1
        D1A6949A90867F4C2200004FD4EDE4E1DFDEDAD2CAF0B2ACA6A0949A92928F56
        2300004ECCEBEDE2E2E1DFEBD4CBC3BDBAA29C9B999B98612600004E82CBD5B7
        DCDCD9D3CDC6C0AEA7A19D9A9299883D260000004F4F4F4F4F4F4F4F4F4F4F4F
        4F4F4F504F4F3434000000000000000000000000000000000000000000000000
        0000}
      OnClick = SpeedButton2Click
    end
    object ckAbrirGaveta: TCheckBox
      Left = 381
      Top = 241
      Width = 97
      Height = 17
      Caption = 'Abrir Gaveta'
      TabOrder = 15
    end
    object ckUsarCodBarra: TCheckBox
      Left = 381
      Top = 258
      Width = 129
      Height = 17
      Caption = 'Usar C'#243'digo de Barras'
      TabOrder = 17
    end
    object edObs: TEdit
      Left = 147
      Top = 182
      Width = 211
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 11
    end
    object edECF: TEdit
      Left = 533
      Top = 20
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object ckVerifPapel: TCheckBox
      Left = 381
      Top = 276
      Width = 97
      Height = 17
      Caption = 'Verificar Papel'
      TabOrder = 19
    end
    object edModDocFiscal: TEdit
      Left = 533
      Top = 74
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object spPorta: TSpinEdit
      Left = 533
      Top = 46
      Width = 145
      Height = 22
      MaxValue = 10
      MinValue = 0
      TabOrder = 3
      Value = 1
    end
    object spQtdeViasCPnaoF: TSpinEdit
      Left = 533
      Top = 154
      Width = 145
      Height = 22
      MaxValue = 10
      MinValue = 1
      TabOrder = 10
      Value = 1
    end
    object ckConfEst: TCheckBox
      Left = 381
      Top = 293
      Width = 105
      Height = 17
      Caption = 'Conferir estoque'
      TabOrder = 20
    end
    object ck3DigVrUnit: TCheckBox
      Left = 538
      Top = 241
      Width = 145
      Height = 17
      Caption = '3 D'#237'gitos no valor Unit'#225'rio'
      TabOrder = 16
    end
    object ckTecladoPDV: TCheckBox
      Left = 538
      Top = 258
      Width = 97
      Height = 17
      Caption = 'Teclado PDV'
      TabOrder = 18
    end
    object ckSupermercado: TCheckBox
      Left = 538
      Top = 276
      Width = 97
      Height = 17
      Caption = 'Supermercado'
      TabOrder = 21
    end
    object cbBalanca: TComboBox
      Left = 147
      Top = 47
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'Filizola - MF'
      Items.Strings = (
        'Nenhuma'
        'Filizola - IDS'
        'Rice Lake - IQPLUS 810'
        'Toledo - 9091'
        'Toledo - 8132'
        'Filizola - ID10000'
        'Filizola - BP'
        'Filizola - MF'
        'Filizola - IDC')
    end
    object GroupBox2: TGroupBox
      Left = 20
      Top = 241
      Width = 166
      Height = 87
      Caption = 'Leitor Serial'
      TabOrder = 12
      object Label11: TLabel
        Left = 15
        Top = 49
        Width = 57
        Height = 13
        Caption = 'Porta Serial:'
      end
      object spPortaLeitor: TSpinEdit
        Left = 80
        Top = 41
        Width = 57
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 0
        Value = 2
      end
      object ckLeitorSerial: TCheckBox
        Left = 15
        Top = 18
        Width = 97
        Height = 17
        Caption = 'Usar Leitor'
        TabOrder = 1
      end
    end
    object spQtdeDigDAV: TSpinEdit
      Left = 533
      Top = 100
      Width = 145
      Height = 22
      MaxValue = 13
      MinValue = 10
      TabOrder = 7
      Value = 10
    end
    object RadioGroup1: TRadioGroup
      Left = 192
      Top = 241
      Width = 166
      Height = 87
      Caption = 'Valor do Item'
      Items.Strings = (
        'Truncar'
        'Arredondar')
      TabOrder = 13
    end
    object cbImp: TComboBox
      Left = 147
      Top = 20
      Width = 176
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'BematechMP20'
        'Sweda10'
        'BematechMFD'
        'DARUMA'
        'DARUMAMFD'
        'ELGIN'
        'ELGINMFD'
        'EPSON')
    end
    object edCodTerminal: TDBEdit
      Left = 147
      Top = 155
      Width = 121
      Height = 21
      DataField = 'COD_TERMINAL'
      DataSource = DtmConfigF.dsConfImp
      TabOrder = 9
    end
    object edAliqISS: TDBEdit
      Left = 147
      Top = 74
      Width = 121
      Height = 21
      DataField = 'ALIQ_ISS'
      DataSource = DtmConfigF.dsConfImp
      TabOrder = 4
    end
    object edContReinicio: TDBEdit
      Left = 147
      Top = 101
      Width = 121
      Height = 21
      DataField = 'CONTADOR_REINICIO'
      DataSource = DtmConfigF.dsConfImp
      TabOrder = 6
    end
    object edNumEquip: TEdit
      Left = 147
      Top = 128
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 8
    end
    object ckMovOperador: TCheckBox
      Left = 538
      Top = 293
      Width = 146
      Height = 17
      Caption = 'Movimento de Operador'
      TabOrder = 14
    end
    object edPercMaxDescItem: TDBEdit
      Left = 533
      Top = 128
      Width = 145
      Height = 21
      DataField = 'MAX_DESC_ITEM'
      DataSource = DtmConfigF.dsConfImp
      TabOrder = 22
    end
    object ckPoPreco: TCheckBox
      Left = 381
      Top = 311
      Width = 146
      Height = 17
      Caption = 'Pol'#237'tica de Pre'#231'o'
      TabOrder = 23
    end
    object Button1: TButton
      Left = 274
      Top = 47
      Width = 75
      Height = 25
      Caption = 'Configurar'
      TabOrder = 24
      OnClick = Button1Click
    end
    object edEnderecoHwF: TEdit
      Left = 533
      Top = 182
      Width = 145
      Height = 21
      TabOrder = 25
      Text = 'edEnderecoHwF'
      Visible = False
    end
    object ComboBox1: TComboBox
      Left = 147
      Top = 209
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 26
      Items.Strings = (
        'N - N'#227'o utilizar TEF.'
        'E - TEF Dedicado.'
        'I - TEF Discado.')
    end
    object edImpDavECF: TEdit
      Left = 533
      Top = 209
      Width = 27
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 27
      Text = 'N'
      OnChange = edImpDavECFChange
    end
    object Panel8: TPanel
      Left = 361
      Top = -9
      Width = 346
      Height = 223
      BorderWidth = 6
      TabOrder = 28
      Visible = False
      object pnPrecoAdicional: TPanel
        Left = 7
        Top = 7
        Width = 332
        Height = 209
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object SpeedButton3: TSpeedButton
          Left = 153
          Top = 73
          Width = 23
          Height = 22
          Caption = '>>'
          OnClick = SpeedButton3Click
        end
        object SpeedButton12: TSpeedButton
          Left = 153
          Top = 101
          Width = 23
          Height = 22
          Caption = '<<'
          OnClick = SpeedButton12Click
        end
        object ListBox3: TListBox
          Left = 26
          Top = 56
          Width = 121
          Height = 97
          ItemHeight = 13
          Items.Strings = (
            'Prazo 30'
            'Prazo 60'
            'Prazo 90')
          TabOrder = 0
          OnDblClick = SpeedButton3Click
        end
        object ListBox4: TListBox
          Left = 182
          Top = 53
          Width = 121
          Height = 97
          ItemHeight = 13
          Sorted = True
          TabOrder = 1
          OnDblClick = SpeedButton12Click
        end
        object BitBtn3: TBitBtn
          Left = 228
          Top = 164
          Width = 75
          Height = 25
          Caption = 'Voltar'
          ModalResult = 2
          TabOrder = 2
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000D30E0000D30E00000001000000010000AD4A0000B54A
            0000B5520000BD520000BD5A0000C65A0000C6630000CE630000CE6B0000D673
            0000DE730000DE7B0000E77B0000E7840000F7940000CE6B0800FF9C0800A542
            1000AD4A1000B5521000C6631000B55A2100CE732100B55A3100BD633100FFAD
            3100CE7B3900BD6B4200C6734200CE844200CE844A00BD735200BD7B5200C67B
            5200C6845A00C6846300FFBD6300C68C7300CE947B00CE9C8400FF00FF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00282828282828
            2828281F05002828282828282828282828282817050713282828282828282828
            2828282817060715282828282828282828282828281507062328280004040404
            040404232828000701282802090807070707061B28282706062328040B090711
            2727272828282800071328060D070A07232828282828281C070128070E13020B
            082028282828281C0701280F101D28020D0818282828280107132816191E2828
            140D0C03212513060623281A2421282828150C0D0B0908061228282622282828
            282827140808041B282828282828282828282828282828282828282828282828
            2828282828282828282828282828282828282828282828282828}
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 328
          Height = 41
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          BorderWidth = 6
          Color = clWhite
          TabOrder = 3
          object Label51: TLabel
            Left = 6
            Top = 6
            Width = 316
            Height = 29
            Align = alClient
            Caption = 
              'Informe qual tabela de pre'#231'o adicional vai estar dispon'#237'vel para' +
              ' utiliza'#231#227'o do PAF-ECF'
            WordWrap = True
            ExplicitWidth = 302
            ExplicitHeight = 26
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 343
    Width = 723
    Height = 46
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 273
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000942929009431
        31009C3131009C393900A53939009C4242009C4A4A00A54A4A00B54A4A00AD52
        4A00B5524A00A5525200AD525200B5525200B55A5200AD525A00AD5A5A00B55A
        5A00BD5A5A00C65A5A00CE5A5A00CE636300CE6B6B00D66B6B00B5737300BD7B
        73009C7B7B009C848400AD848400B5848400C6848400AD8C8C00B58C8C00C694
        8C00AD949400C6949400A59C9C00B59C9C00D69C9C00BDA5A500D6A5A500D6AD
        A500CEADAD00D6ADAD00DEADAD00CEB5B500D6B5B500CEBDBD00DEBDBD00E7BD
        BD00E7C6C600C6CEC600CECEC600C6CECE00CECECE00D6CECE00E7CECE00E7D6
        CE00D6D6D600DED6D600EFD6D600DEDED600D6DEDE00DEDEDE00E7DEDE00E7E7
        E700EFEFEF00F7EFEF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004848100C0722
        33343433332505050B4848191516111B27384647452D0002131048191515111A
        05184046492E0102121048191515111C03032F42493200011210481915151120
        0601243A493200011210481915151221231D1F27322C04041310481915151515
        1515151313151515160F48190D111E282B292B2828292B26150C481909384544
        4545454545454530130F48190A3C46434343434343434530130F48190A3C423A
        3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230130F48190A3C4440
        4040404040404230130F48190A3C423A3A3A3A3A3A3A4230130F48190A394643
        4343434343434630130F4848092D3A363636363636363A2A0748}
    end
    object BitBtn2: TBitBtn
      Left = 354
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BitBtn2Click
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
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.fdb'
    FileName = 'HwF.fdb'
    Filter = 'FireBird/Interbase (*.fdb;*.gdb)|*.fdb;*.gdb'
    InitialDir = 'C:\Basesauto'
    Title = 'Selecionar HwF.fbd'
    Left = 352
    Top = 184
  end
end
