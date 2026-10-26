inherited frmNFCeConfig: TfrmNFCeConfig
  Caption = 'Configura'#231#227'o da NFC-e'
  ClientHeight = 478
  ClientWidth = 720
  Position = poScreenCenter
  OnClose = FormClose
  ExplicitWidth = 728
  ExplicitHeight = 512
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 478
    Align = alClient
    BorderWidth = 6
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 425
      Width = 706
      Height = 5
      Align = alBottom
      AutoSize = False
      ExplicitLeft = 1
      ExplicitTop = 452
      ExplicitWidth = 734
    end
    object Label29: TLabel
      Left = 7
      Top = 57
      Width = 706
      Height = 5
      Align = alTop
      AutoSize = False
      ExplicitLeft = 49
      ExplicitTop = -4
    end
    object Panel2: TPanel
      Left = 7
      Top = 430
      Width = 706
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn4: TBitBtn
        Left = 273
        Top = 6
        Width = 75
        Height = 25
        Hint = 'Salvar registro - [NFC005]'
        Caption = '&OK'
        TabOrder = 0
        OnClick = BitBtn4Click
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
      object BitBtn5: TBitBtn
        Left = 354
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Cancela'
        TabOrder = 1
        OnClick = BitBtn5Click
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
    object Panel3: TPanel
      Left = 7
      Top = 62
      Width = 706
      Height = 363
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 2
      object PageControl1: TPageControl
        Left = 6
        Top = 6
        Width = 690
        Height = 347
        ActivePage = tsCertificado
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object tsCertificado: TTabSheet
          Caption = 'Certificado'
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 682
            Height = 169
            Align = alTop
            TabOrder = 0
            object Label3: TLabel
              Left = 32
              Top = 24
              Width = 64
              Height = 13
              Caption = 'Arquivos PFX'
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 65
              Top = 51
              Width = 31
              Height = 13
              Caption = 'Senha'
              FocusControl = DBEdit2
            end
            object Label4: TLabel
              Left = 248
              Top = 51
              Width = 79
              Height = 13
              Caption = 'N'#250'mero de S'#233'rie'
              FocusControl = DBEdit3
            end
            object Label31: TLabel
              Left = 32
              Top = 96
              Width = 561
              Height = 53
              AutoSize = False
              Caption = 
                'Aqui pode ser informado o endere'#231'o do arquivo PFX e a senha do a' +
                'rquivo, neste caso o mesmo n'#227'o precisa ser instalado nos computa' +
                'dores que ir'#227'o enviar a NFC-e, apenas precisam ter acesso ao arq' +
                'uivo.                                         Se informar o n'#250'me' +
                'ro de s'#233'rie o sistema desconsidera o arquivo informado e necessi' +
                'ta da instala'#231#227'o do mesmo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object SpeedButton1: TSpeedButton
              Left = 599
              Top = 20
              Width = 23
              Height = 22
              Hint = 'Procurar'
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000D30E0000D30E00000001000000010000181810001818
                18002929290031313100313931004A39310039393900423939004A423900524A
                3900424242004A4A42004A4A4A00524A4A0052524A00735A4A00525252005A5A
                5A007B6B5A00846B5A00636363006B6363006B6B6B0094846B00737373009484
                73009C8C7300737B7B007B7B7B0094947B00A5947B00848484009C948400A594
                8400AD94840084848C008C8C8C0094948C00A59C8C00AD9C8C00ADA58C00EFBD
                8C0094949400A59C9400B5A59400BDB59400C6B59400DEBD9400EFBD9400F7BD
                9400EFC6940094949C009C9C9C00A5A59C00B5AD9C00EFBD9C00E7C69C00EFC6
                9C00E7CE9C009CA5A500A5A5A500A5ADA500B5ADA500B5B5A500C6BDA500CEBD
                A500D6BDA500E7C6A500F7CEA500EFD6A500FFD6A500ADADAD00B5ADAD00B5B5
                AD00DEC6AD00EFC6AD00DECEAD00EFCEAD00F7CEAD00F7D6AD00FFD6AD00F7DE
                AD00B5B5B500CEC6B500E7CEB500F7D6B500FFD6B500FFDEB500BDBDBD00EFD6
                BD00F7D6BD00FFD6BD00F7DEBD00FFDEBD00FFE7BD00BDBDC600BDC6C600C6C6
                C600F7D6C600F7DEC600FFDEC600FFF7C600C6C6CE00CECECE00D6D6CE00EFDE
                CE00FFDECE00F7E7CE00FFE7CE00FFEFCE00D6D6D600DEDED600FFDED600FFE7
                D600FFEFD600DEDEDE00FFF7DE00FFFFDE00E7E7E700EFE7E700FFEFE700FFF7
                E700FFFFE700EFEFEF00FFF7EF00FFFFEF00F7F7F700FFFFF700FF00FF00F7FF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00808080808080
                8080808080808080808080808080808080808080808052068080808080808080
                8080808080470C2A1C80808080808080808080803C0A2A6E2480808080808080
                808080471134612A80808080808080808080581634522A808080808080343434
                34801601161F808080808080580C0D0C103C06165880808080808033176B7974
                7121166F808080808080580779744A4A6C7F15618080808080803C2E714B3030
                386B1A18808080808080344271634444646C271F808080808080494056647474
                5A561E2380808080808067265071817F70561D3C80808080808080672D4F7A74
                4541588080808080808080803C3F453A53358080808080808080}
              OnClick = SpeedButton1Click
            end
            object DBText1: TDBText
              Left = 102
              Top = 75
              Width = 491
              Height = 17
              DataField = 'CERT_DADOSPFX'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label50: TLabel
              Left = 42
              Top = 75
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dados PFX'
              FocusControl = DBEdit2
            end
            object SpeedButton2: TSpeedButton
              Left = 599
              Top = 72
              Width = 23
              Height = 22
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B0000000100000001000000840000088C
                0800108C080018941000219410001894180029941800219C2100299C210029A5
                2900E78C31005AA53900B56B4A006BAD4A0073AD4A008C6B5200946B5200E79C
                5200A5635A00A56B5A00BD7B5A0084B55A00FFB55A0063BD6300A5636B00A573
                6B00BD846B00C6846B00D6946B00A5B56B0073BD6B00DE9C7300CEB5730094BD
                73009CBD7300ADBD730073C673007BC6730084C6730094C673009CC67300E7AD
                7B00DEBD7B00EFBD7B009CC67B00EFC67B00EFBD84009CC68400EFC68400F7C6
                840084CE8400EFC68C00F7CE8C00B5AD9400ADB59400EFC69400A5CE9400C6CE
                9400D6CE9400E7CE9400F7CE9400BDCE9C00EFCE9C00BDD69C00EFCEA500ADD6
                A500BDD6A500F7D6A500A5DEA500EFD6AD00F7D6AD00B5DEAD00DECEB500F7D6
                B500F7DEB500F7DEBD00DEC6C600FFEFC600FFEFCE00E7E7D600F7EFD600FFEF
                DE00DEF7DE00E7F7DE00FFEFE700E7F7E700FFF7E700F7F7EF00FFF7EF00FFF7
                F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005C5C18181818
                1818181818181818185C5C5C184D393A3E3B302E2B2E2E30185C5C5C184E2208
                0D04040B202B2B30185C5C5C12513D0200000000062A2B30185C5C5C12563D03
                0003230E000E2E30185C5C5C19584201000015401D0D3330185C5C5C195D4F38
                2F212245402C3733185C5C5C1A5D4454502F212122403E3C185C5C5C1A5D2441
                5426000001454043185C5C5C1C5D32002541050002494640185C5C5C1C5D5709
                00000000024E4835185C5C5C1F5D5D521707071E08101313185C5C5C1F5D5D5D
                5D52525B360F110A0C5C5C5C295D5D5D5D5D5D5D4C1316145C5C5C5C29575757
                575757574C131A5C5C5C5C5C291C1C1C1C1C1C1C1C135C5C5C5C}
              OnClick = SpeedButton2Click
            end
            object SpeedButton3: TSpeedButton
              Left = 628
              Top = 72
              Width = 23
              Height = 22
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
              OnClick = SpeedButton3Click
            end
            object SpeedButton4: TSpeedButton
              Left = 628
              Top = 21
              Width = 23
              Height = 21
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
              OnClick = SpeedButton4Click
            end
            object DBEdit1: TDBEdit
              Left = 102
              Top = 21
              Width = 491
              Height = 21
              DataField = 'CERT_ARQUIVOPFX'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 102
              Top = 48
              Width = 140
              Height = 21
              DataField = 'CERT_SENHA'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              PasswordChar = '*'
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 333
              Top = 48
              Width = 260
              Height = 21
              DataField = 'CERT_NUM_SERIE'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 2
            end
          end
        end
        object tsCSC: TTabSheet
          Caption = 'CSC'
          ImageIndex = 1
          object Label40: TLabel
            Left = 45
            Top = 179
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Envio'
            Visible = False
          end
          object Label48: TLabel
            Left = 252
            Top = 174
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pacote NFC-e'
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 682
            Height = 161
            Align = alTop
            Caption = 'CSC - C'#243'digo de Seguran'#231'a do Contribuinte'
            TabOrder = 0
            object Label5: TLabel
              Left = 76
              Top = 24
              Width = 20
              Height = 13
              Caption = 'ID 1'
              FocusControl = DBEdit4
            end
            object Label6: TLabel
              Left = 279
              Top = 24
              Width = 40
              Height = 13
              Caption = 'Token 1'
              FocusControl = DBEdit5
            end
            object Label7: TLabel
              Left = 76
              Top = 51
              Width = 20
              Height = 13
              Caption = 'ID 2'
              FocusControl = DBEdit6
            end
            object Label8: TLabel
              Left = 279
              Top = 51
              Width = 40
              Height = 13
              Caption = 'Token 2'
              FocusControl = DBEdit7
            end
            object Label32: TLabel
              Left = 24
              Top = 96
              Width = 561
              Height = 53
              AutoSize = False
              Caption = 
                'O contribuinte pode ter mais de um token ativo, por'#233'm o sistema ' +
                'utiliza apenas a primeira op'#231#227'o, a segunda '#233' apenas para control' +
                'e interno do contribuinte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object DBEdit4: TDBEdit
              Left = 102
              Top = 21
              Width = 82
              Height = 21
              DataField = 'CSC_ID1'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 0
            end
            object DBEdit5: TDBEdit
              Left = 325
              Top = 21
              Width = 260
              Height = 21
              DataField = 'CSC_TOKEN1'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 1
            end
            object DBEdit6: TDBEdit
              Left = 102
              Top = 48
              Width = 82
              Height = 21
              DataField = 'CSC_ID2'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 2
            end
            object DBEdit7: TDBEdit
              Left = 325
              Top = 48
              Width = 260
              Height = 21
              DataField = 'CSC_TOKEN2'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 3
            end
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 102
            Top = 171
            Width = 116
            Height = 21
            DataField = 'WS_SINC_ASSINC'
            DataSource = dtmNFConsumidor.dsNFCe_Config
            TabOrder = 1
            Visible = False
          end
          object ed_wslibssl2: TDBLookupComboBox
            Left = 325
            Top = 171
            Width = 115
            Height = 21
            DataField = 'WS_LIB_SSL'
            DataSource = dtmNFConsumidor.dsNFCe_Config
            TabOrder = 2
          end
        end
        object tsWebService: TTabSheet
          Caption = 'WebService'
          ImageIndex = 2
          object GroupBox3: TGroupBox
            Left = 0
            Top = 0
            Width = 682
            Height = 281
            Align = alTop
            TabOrder = 0
            object Label9: TLabel
              Left = 82
              Top = 24
              Width = 14
              Height = 13
              Caption = 'UF'
            end
            object Label10: TLabel
              Left = 275
              Top = 24
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ambiente'
            end
            object Label11: TLabel
              Left = 492
              Top = 27
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Envio'
            end
            object Label12: TLabel
              Left = 53
              Top = 51
              Width = 43
              Height = 13
              Caption = 'Aguardar'
              FocusControl = DBEdit8
            end
            object Label13: TLabel
              Left = 264
              Top = 51
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Quantidade'
              FocusControl = DBEdit9
            end
            object Label14: TLabel
              Left = 502
              Top = 51
              Width = 41
              Height = 13
              Caption = 'Intervalo'
              FocusControl = DBEdit10
            end
            object Label19: TLabel
              Left = 56
              Top = 154
              Width = 40
              Height = 13
              Caption = 'TimeOut'
              FocusControl = DBEdit15
            end
            object Label33: TLabel
              Left = 32
              Top = 238
              Width = 499
              Height = 13
              Caption = 
                'Tipo de Envio pode depender de estado para estado, prefira sempr' +
                'e o envio Sincrono por ser mais r'#225'pido.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label34: TLabel
              Left = 138
              Top = 51
              Width = 46
              Height = 13
              Caption = 'segundos'
            end
            object Label35: TLabel
              Left = 619
              Top = 51
              Width = 46
              Height = 13
              Caption = 'segundos'
            end
            object Label36: TLabel
              Left = 395
              Top = 51
              Width = 46
              Height = 13
              Caption = 'tentativas'
            end
            object Label37: TLabel
              Left = 32
              Top = 257
              Width = 416
              Height = 13
              Caption = 
                'Os campos Aguardar, Quantidade de tentativas e Intervalo possuem' +
                ' o valor m'#225'ximo de5'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 138
              Top = 154
              Width = 46
              Height = 13
              Caption = 'segundos'
            end
            object Label45: TLabel
              Left = 319
              Top = 154
              Width = 224
              Height = 13
              Alignment = taRightJustify
              Caption = 'Visualizar mensagens durante o processamento'
            end
            object Label47: TLabel
              Left = 476
              Top = 181
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pacote NFC-e'
            end
            object lkAmbiente: TDBLookupComboBox
              Left = 325
              Top = 21
              Width = 116
              Height = 21
              DataField = 'WS_TBAMB'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 1
            end
            object lkTipoEnvio: TDBLookupComboBox
              Left = 549
              Top = 21
              Width = 116
              Height = 21
              DataField = 'WS_SINC_ASSINC'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 2
            end
            object DBEdit8: TDBEdit
              Left = 102
              Top = 48
              Width = 30
              Height = 21
              DataField = 'WS_AGUARDAR'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 3
            end
            object DBEdit9: TDBEdit
              Left = 325
              Top = 48
              Width = 64
              Height = 21
              DataField = 'WS_TENTATIVAS'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 4
            end
            object DBEdit10: TDBEdit
              Left = 549
              Top = 48
              Width = 68
              Height = 21
              DataField = 'WS_INTERVALO'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 5
            end
            object GroupBox4: TGroupBox
              Left = 16
              Top = 70
              Width = 648
              Height = 75
              Caption = 'Proxy'
              TabOrder = 6
              object Label15: TLabel
                Left = 58
                Top = 19
                Width = 22
                Height = 13
                Caption = 'Host'
                FocusControl = DBEdit11
              end
              object Label16: TLabel
                Left = 502
                Top = 19
                Width = 25
                Height = 13
                Caption = 'Porta'
                FocusControl = DBEdit12
              end
              object Label17: TLabel
                Left = 44
                Top = 46
                Width = 36
                Height = 13
                Caption = 'Usu'#225'rio'
                FocusControl = DBEdit13
              end
              object Label18: TLabel
                Left = 496
                Top = 46
                Width = 31
                Height = 13
                Caption = 'Senha'
                FocusControl = DBEdit14
              end
              object DBEdit11: TDBEdit
                Left = 86
                Top = 16
                Width = 347
                Height = 21
                DataField = 'WS_PROXY_HOST'
                DataSource = dtmNFConsumidor.dsNFCe_Config
                TabOrder = 0
              end
              object DBEdit12: TDBEdit
                Left = 533
                Top = 16
                Width = 100
                Height = 21
                DataField = 'WS_PROXY_PORT'
                DataSource = dtmNFConsumidor.dsNFCe_Config
                TabOrder = 1
              end
              object DBEdit13: TDBEdit
                Left = 86
                Top = 43
                Width = 187
                Height = 21
                DataField = 'WS_PROXY_USER'
                DataSource = dtmNFConsumidor.dsNFCe_Config
                TabOrder = 2
              end
              object DBEdit14: TDBEdit
                Left = 533
                Top = 43
                Width = 100
                Height = 21
                DataField = 'WS_PROXY_PASS'
                DataSource = dtmNFConsumidor.dsNFCe_Config
                PasswordChar = '*'
                TabOrder = 3
              end
            end
            object DBEdit15: TDBEdit
              Left = 102
              Top = 151
              Width = 30
              Height = 21
              DataField = 'WS_TIMEOUT'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 7
            end
            object DBEdit23: TDBEdit
              Left = 102
              Top = 21
              Width = 82
              Height = 21
              DataField = 'WS_UF'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 0
            end
            object lkWsVisaulizar: TDBLookupComboBox
              Left = 549
              Top = 151
              Width = 116
              Height = 21
              DataField = 'WS_VISUALIZAR'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 8
            end
            object BitBtn1: TBitBtn
              Left = 640
              Top = 205
              Width = 24
              Height = 24
              TabOrder = 9
              Visible = False
              OnClick = BitBtn1Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000890B0000890B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFE8A200E8A200E8A200E8A200E8A200E8A200E8
                A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200FF00FFFF00FFE8A200
                E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A2
                00E8A200E8A200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFE8A200E8A200FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8A200E8
                A200E8A200E8A200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFE8A200E8A200E8A200E8A200E8A200E8A200FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8A200E8A200E8
                A200E8A200E8A200E8A200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFE8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE8A200E8A200E8A200E8A200E8
                A200E8A200E8A200E8A200E8A200E8A200FF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFE8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A2
                00FF00FFFF00FFFF00FFFF00FFFF00FFE8A200E8A200E8A200E8A200E8A200E8
                A200E8A200E8A200E8A200E8A200E8A200E8A200FF00FFFF00FFFF00FFE8A200
                E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A2
                00E8A200E8A200FF00FFFF00FFE8A200E8A200E8A200E8A200E8A200E8A200E8
                A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200FF00FFFF00FFFF00FF
                E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A200E8A2
                00E8A200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            end
            object ed_wslibssl: TDBLookupComboBox
              Left = 549
              Top = 178
              Width = 115
              Height = 21
              DataField = 'WS_LIB_SSL'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 10
            end
          end
        end
        object tsArquivos: TTabSheet
          Caption = 'Arquivos'
          ImageIndex = 3
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 682
            Height = 209
            Align = alTop
            TabOrder = 0
            object Label20: TLabel
              Left = 24
              Top = 24
              Width = 72
              Height = 13
              Caption = 'Salvar XML em'
              FocusControl = DBEdit16
            end
            object Label21: TLabel
              Left = 13
              Top = 51
              Width = 83
              Height = 13
              Caption = 'Arquivos Schema'
              FocusControl = DBEdit17
            end
            object Label22: TLabel
              Left = 28
              Top = 78
              Width = 68
              Height = 13
              Caption = 'Logo Empresa'
              FocusControl = DBEdit18
            end
            object Label39: TLabel
              Left = 32
              Top = 136
              Width = 561
              Height = 53
              AutoSize = False
              Caption = 
                'Caso n'#227'o seja informado o diret'#243'rio onde ir'#225' gravar os arquivos ' +
                'XML o sistema ir'#225' automaticamente salvar os arquivos na pr'#243'pria ' +
                'pasta onde est'#225' a aplica'#231#227'o, uma pasta NFCe ser'#225' criada neste lo' +
                'cal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object DBEdit16: TDBEdit
              Left = 102
              Top = 21
              Width = 491
              Height = 21
              DataField = 'ARQ_PATH_SALVAR'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 0
            end
            object DBEdit17: TDBEdit
              Left = 102
              Top = 48
              Width = 491
              Height = 21
              DataField = 'ARQ_PATH_SCHEMA'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 1
            end
            object DBEdit18: TDBEdit
              Left = 102
              Top = 75
              Width = 491
              Height = 21
              DataField = 'ARQ_LOGO_EMP'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 2
            end
          end
        end
        object tsEmail: TTabSheet
          Caption = 'email'
          ImageIndex = 4
          object GroupBox6: TGroupBox
            Left = 0
            Top = 0
            Width = 682
            Height = 247
            Align = alTop
            TabOrder = 0
            object Label23: TLabel
              Left = 40
              Top = 24
              Width = 55
              Height = 13
              Caption = 'Host SMTP'
              FocusControl = DBEdit19
            end
            object Label24: TLabel
              Left = 485
              Top = 24
              Width = 58
              Height = 13
              Caption = 'Porta SMTP'
              FocusControl = DBEdit20
            end
            object Label25: TLabel
              Left = 60
              Top = 51
              Width = 36
              Height = 13
              Caption = 'Usuario'
              FocusControl = DBEdit21
            end
            object Label26: TLabel
              Left = 512
              Top = 51
              Width = 31
              Height = 13
              Caption = 'Senha'
              FocusControl = DBEdit22
            end
            object Label28: TLabel
              Left = 25
              Top = 105
              Width = 71
              Height = 13
              Caption = 'Assunto NFC-e'
              FocusControl = DBEdit24
            end
            object Label41: TLabel
              Left = 44
              Top = 132
              Width = 52
              Height = 13
              Caption = 'Mensagem'
              FocusControl = DBMemo1
            end
            object Label27: TLabel
              Left = 54
              Top = 78
              Width = 42
              Height = 13
              Caption = 'Usa SSL'
            end
            object Label46: TLabel
              Left = 501
              Top = 78
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Usa TLS'
            end
            object DBEdit19: TDBEdit
              Left = 102
              Top = 21
              Width = 307
              Height = 21
              DataField = 'EMAIL_SMPT_HOST'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 0
            end
            object DBEdit20: TDBEdit
              Left = 549
              Top = 21
              Width = 100
              Height = 21
              DataField = 'EMAIL_SMTP_PORTA'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 1
            end
            object DBEdit21: TDBEdit
              Left = 102
              Top = 48
              Width = 307
              Height = 21
              DataField = 'EMAIL_USERNAME'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 2
            end
            object DBEdit22: TDBEdit
              Left = 549
              Top = 48
              Width = 100
              Height = 21
              DataField = 'EMAIL_PASSWORD'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              PasswordChar = '*'
              TabOrder = 3
            end
            object DBEdit24: TDBEdit
              Left = 102
              Top = 102
              Width = 547
              Height = 21
              DataField = 'EMAIL_ASSUNTO'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 6
            end
            object DBMemo1: TDBMemo
              Left = 102
              Top = 129
              Width = 547
              Height = 104
              DataField = 'EMAIL_MENSAGEM'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 7
            end
            object lkUsaSSL: TDBLookupComboBox
              Left = 102
              Top = 75
              Width = 171
              Height = 21
              DataField = 'EMAIL_USA_SSL'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 4
            end
            object lkUsaTLS: TDBLookupComboBox
              Left = 549
              Top = 75
              Width = 100
              Height = 21
              DataField = 'EMAIL_USA_TLS'
              DataSource = dtmNFConsumidor.dsNFCe_Config
              TabOrder = 5
            end
          end
        end
        object tsEmissao: TTabSheet
          Caption = 'Emiss'#227'o / Conting'#234'ncia'
          ImageIndex = 5
          object Label42: TLabel
            Left = 32
            Top = 21
            Width = 78
            Height = 13
            Caption = 'Tipo de Emissao'
          end
          object Label43: TLabel
            Left = 273
            Top = 21
            Width = 160
            Height = 13
            Caption = 'Data de Entrada em Conting'#234'ncia'
            FocusControl = DBEdit26
          end
          object Label44: TLabel
            Left = 32
            Top = 67
            Width = 190
            Height = 13
            Caption = 'Justificativa da entrada em conting'#234'ncia'
            FocusControl = DBEdit27
          end
          object Label49: TLabel
            Left = 32
            Top = 113
            Width = 526
            Height = 13
            Caption = 
              'Justificativa automatica da entrada em conting'#234'ncia (Quando uma ' +
              'NFCe Normal '#233' Convertida em Conting'#234'ncia)'
            FocusControl = DBEdit25
          end
          object DBEdit26: TDBEdit
            Left = 273
            Top = 40
            Width = 160
            Height = 21
            DataField = 'DHCONT'
            DataSource = dtmNFConsumidor.dsNFCe_Config
            Enabled = False
            TabOrder = 0
          end
          object DBEdit27: TDBEdit
            Left = 32
            Top = 86
            Width = 617
            Height = 21
            DataField = 'XJUST'
            DataSource = dtmNFConsumidor.dsNFCe_Config
            Enabled = False
            TabOrder = 1
          end
          object lkTpEmis: TDBLookupComboBox
            Left = 32
            Top = 40
            Width = 225
            Height = 21
            DataField = 'TPEMIS'
            DataSource = dtmNFConsumidor.dsNFCe_Config
            ReadOnly = True
            TabOrder = 2
          end
          object btAtivarDesativarContingencia: TBitBtn
            Left = 496
            Top = 38
            Width = 153
            Height = 25
            Caption = 'Ativar contingencia'
            TabOrder = 3
            OnClick = btAtivarDesativarContingenciaClick
          end
          object DBEdit25: TDBEdit
            Left = 32
            Top = 132
            Width = 617
            Height = 21
            DataField = 'XJUST_AUTO'
            DataSource = dtmNFConsumidor.dsNFCe_Config
            TabOrder = 4
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 7
      Top = 7
      Width = 706
      Height = 50
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      object Label30: TLabel
        Left = 128
        Top = 16
        Width = 164
        Height = 13
        Caption = 'Usar mesma configura'#231#227'o da NF-e'
      end
      object lkMesmaConfig: TDBLookupComboBox
        Left = 298
        Top = 12
        Width = 145
        Height = 21
        DataField = 'USAR_CONF_NFE'
        DataSource = dtmNFConsumidor.dsNFCe_Config
        TabOrder = 0
        OnExit = lkMesmaConfigExit
      end
    end
  end
end
