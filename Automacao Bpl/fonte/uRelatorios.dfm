inherited frmRelatorios: TfrmRelatorios
  Caption = 'Relat'#243'rios Gerais'
  ClientHeight = 641
  ClientWidth = 806
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnResize = FormResize
  ExplicitWidth = 814
  ExplicitHeight = 675
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 806
    Height = 48
    Align = alTop
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    object Label3: TLabel
      Left = 14
      Top = 20
      Width = 70
      Height = 13
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 201
      Top = 20
      Width = 63
      Height = 13
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 87
      Top = 17
      Width = 80
      Height = 21
      EditMask = '!99/99/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '01/08/2011'
      OnExit = MaskEdit1Exit
    end
    object MaskEdit2: TMaskEdit
      Left = 270
      Top = 17
      Width = 80
      Height = 21
      EditMask = '!99/99/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '02/08/2011'
      OnExit = MaskEdit2Exit
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 519
    Width = 806
    Height = 122
    Align = alBottom
    TabOrder = 1
    object Label5: TLabel
      Left = 11
      Top = 3
      Width = 106
      Height = 13
      Alignment = taCenter
      Caption = 'Nome do Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgInformation: TImage
      Left = 781
      Top = 1
      Width = 24
      Height = 120
      Cursor = crHelp
      Align = alRight
      Picture.Data = {
        055449636F6E0000010001001818000001002000880900001600000028000000
        1800000030000000010020000000000060090000000000000000000000000000
        00000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000021
        0000002700000000000000000000000000000000000000000000000000000000
        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000023170B0088
        27150286060400080E0700000F0800000F0800000F0800000F0800000F080000
        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
        000000000000000000000000000000000000000604000050492A0CC3BE9263FF
        B4895BEE5D2F0033492702004122010041220100412201004222010042220100
        FFFFFF00FFFFFF00030100000100000000000000000000000000000000000000
        0000000400000022000000450200005F1F0C0097774F26EBE0B98EFFFFECCBFF
        C29667E0502700210A0600000000000000000000000000000000000000000000
        FFFFFF00FFFFFF0003010000010000000000000000000000000000000000002A
        150800844B2B0ACB805931ED9B754DF7BF986DFFEFCEA7FFFFE9CBFFFFE5C2FF
        996F44E20000003A000000000000000000000000020100000301000003010000
        FFFFFF00FFFFFF00030100000100000000000000000000040700005A573715CF
        BC9468FFF5D8B7FFFFE7C8FFFFE8C8FFFFECCEFFFFEED2FFFFECCEFFFFE5C5FF
        C8A176FF5E3D1BD70E0300730000000F00000000020100000301000003010000
        FFFFFF00FFFFFF0003010000000000000000000D1A0A007F8A6337EFEFD1AFFF
        FFF1DAFFFFEAD0FFFFE8CDFFFFE9CFFFF2D2B6FFBF7855FFE0B293FFFFEACEFF
        FFEDD1FFF7D8B4FFAB8255FA2D17019F0000001B010000000301000003010000
        FFFFFF00FFFFFF00010000000000000425100086A07446FCFBE2C6FFFFF4DFFF
        FFEAD3FFFFEAD2FFFFEAD1FFFFEED6FFDDB296FF962300FF9A3109FFDDAF91FF
        FFEDD2FFFFEBD0FFFFEED0FFCEA67AFF3B2004A5000000110201000003010000
        FFFFFF00FFFFFF00000000031508004F956636F9ECD3B5FFFFF5E3FFFFEDD9FF
        FFECD8FFFFECD7FFFFEBD6FFFFEFD9FFE8C7AEFF992B00FFA64C26FFA6502CFF
        E9C5AAFFFFECD3FFFFEAD1FFFFF2D8FFCBA479FF291302800000000003010000
        FFFFFF00FFFFFF0017090031623B11BBCEAB84FFF6E5D2FFFFF2E2FFFFEFDEFF
        FFEFDCFFFFEEDCFFFFEEDBFFFFEFDCFFF7E1CDFF9F370AFFC5805AFFD6AB92FF
        E6C5ACFFFFEED7FFFFEAD2FFFFEBD4FFFFEED5FFA0784DF00D05003600000000
        FFFFFF00FFFFFF0046270772936A3FE9D7B998FFFEF1E3FFFFF3E4FFFFF2E3FF
        FFF1E2FFFFF1E0FFFFF1E0FFFFF1E0FFFDEDDCFFC06F3FFFC97B49FFF9E5D2FF
        FFF8E5FFFFECD9FFFFEDD7FFFFECD6FFFFF0DBFFF2D7B9FF4E2D0B9C0A00001A
        FFFFFF00FFFFFF00673C0E98A88157F6D8BD9EFFFFF6EBFFFFF5E9FFFFF4E7FF
        FFF3E6FFFFF3E5FFFFF2E4FFFFF5E6FFFCF1E5FFD9A079FFD88543FFF4DAC4FF
        FFF5E6FFFFEFDFFFFFEFDDFFFFEEDCFFFFEEDCFFFFF3DDFF99754EDA321B0454
        FFFFFF00FFFFFF007946109EB1895EF8D9BD9EFFFCF3E8FFFFF7EEFFFFF6ECFF
        FFF6ECFFFFF5EAFFFFF8EDFFF6E7D9FFC58C72FFD5A587FFD47B32FFEFD0B5FF
        FFF6EBFFFFF2E3FFFFF1E2FFFFF1E1FFFFF1E1FFFFF7E6FFC4A98CF1613C148C
        FFFFFF00FFFFFF007D480E87AE8456EFD6B997FFF4E8DBFFFFFCF6FFFFF8F0FF
        FFF8EFFFFFF8EFFFFFF9F0FFFAF5ECFFBD7D62FFA84E22FFC15F1EFFDAA889FF
        FEF5ECFFFFF5E9FFFFF4E7FFFFF4E6FFFFF3E6FFFFFBEFFFDCC5ACFA855422A2
        FFFFFF00FFFFFF00743E05479A6934D5D5B38EFFEAD8C3FFFFFEFAFFFFFAF5FF
        FFFAF3FFFFF9F4FFFFF9F2FFFFFCF5FFFAF3ECFFBC7B5EFFA73D08FFC07D5CFF
        FEF7EEFFFFF7EEFFFFF6ECFFFFF6ECFFFFF5EBFFFFFDF4FFDAC4ACF78554229B
        FFFFFF00FFFFFF006B34000E82490C89CDA87FFFE2C6A7FFFAF2EAFFFFFEFBFF
        FFFCF8FFFFFBF7FFFFFBF7FFFFFAF6FFFFFFFAFFFDF9F3FFDAB6A8FFE6CCC1FF
        FFFAF5FFFFFAF3FFFFF8F0FFFFF8F1FFFFF8F0FFFFFCF5FFC7A98CEA82501B79
        FFFFFF00FFFFFF007C4203007D410017A26F39E2E3C4A1FFEFDAC0FFFEFCF9FF
        FFFEFDFFFFFDFAFFFFFDFAFFFFFCF9FFFFFBF8FFFFFFFFFFF1E1DBFFD6AFA0FF
        FCF6F0FFFFFCF7FFFFFBF5FFFFFAF4FFFFFBF6FFFEF9F3FF9E6F3EC47D430731
        FFFFFF00FFFFFF0083470500814503008345054AB78A59F6F0D3B1FFF7E5CFFF
        FEFDFBFFFFFFFFFFFFFEFCFFFFFEFCFFFFFDFCFFFFFFFFFFCA9680FFB44B0AFF
        E0C0AFFFFFFFFFFFFFFCF9FFFFFDFAFFFFFFFFFFD0B89DFF84480A527E430404
        FFFFFF00FFFFFF00824605008246050084470700874B0C5DB98C5BF3F4D7B4FF
        FDE9D0FFFFF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9D5CDFFD0936EFF
        EAD5CAFFFFFFFFFFFFFFFFFFFFFFFFFFDBC9B4FF8D551B8B83480900874D0E00
        FFFFFF00FFFFFF008246050082460500854909008549090083460543A47139D1
        E2BE95FFFDE5C7FFFFF3E2FFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFF
        FFFFFFFFFFFEFEFFF4EFE9FFBF9F7EF48A51157A85490C04864D0F00864C0E00
        FFFFFF00FFFFFF00824605008246050085490900864B0B00864A09008042010D
        894E0F77A9763ECFCFA679EEDFBC96FFE1C4A5FFE1CBB3FFE0CCB7FFDAC6B1F7
        C7AB8FE5AD855BD08D571C958347082D84490A00894F1400864C0E00864C0E00
        FFFFFF00FFFFFF00824605008246050085490900864B0B00874B0B0083460600
        8346060C864A0A3E8E531486996126B7A57139D0A3713BCF99652DBA915A209A
        8C551971864B0D3E7F42001484480900874D0F00894F1300864C0E00864C0E00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFCFF00FFF87F00FFE07F00FE007F00FC007F00F0001F00
        E0000F00C0000700800007008000030080000100800001008000010080000100
        8000010080000100C0000100E0000100F0000700F8000700FC001F00FE003F00
        FFFFFF00}
      ExplicitLeft = 814
      ExplicitTop = 11
      ExplicitHeight = 192
    end
    object Label80: TLabel
      Left = 11
      Top = 25
      Width = 74
      Height = 13
      Alignment = taCenter
      Caption = 'Coment'#225'rios:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 288
      Top = 96
      Width = 75
      Height = 25
      Hint = 'OK'
      Caption = '&Ok'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B00400009D0400009D0400000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFDFDFDE7E7E7A9A9A98787877A7A7A878787AAAAAAE8E8E8FDFDFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6
        F68291821472140D73001575001773000E6E00016801616A618C8C8CE1E1E1FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB89A289037B00049200
        0094000092000091000A89002E71002F6F002C6D001F6F00166C16A9A9A9FBFB
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF699A69019102019A03019A0200990100
        9800009600009400009100008E00346C00316C002C6C00547354AAAAAAFFFFFF
        FFFFFFFFFFFFFFFFFFCAD6CA0DA21507A00F07A00F07A00F24BD4938CD690FA8
        1F029B05009800009500009100068A00366B002D6C00156C15E1E1E1FFFFFFFF
        FFFFFDFDFD017F020AA3170BA4180BA41824BC47F0F0F0F7F7F7B0E9C312AB25
        039C06009902009500009100078900326C001F6F008C8C8CFDFDFDFFFFFFB1CE
        B120AB2C0FA81F0FA82011AA23ECECECF0F0F0F7F7F7FBFBFBB3ECC6069F0D04
        9D09009901009500009100356C002D6E00616B61E7E7E7FFFFFF01850345BE56
        14AD2B0DA418E5E5E5EBEBEBEFEFEFF5F5F5F9F9F9FDFDFDB5ECC714AD2A049D
        0A019A04009700048E00316F00006A00A7A7A7FFFFFF139C1E4FC362039A05E0
        E0E0E4E4E4EAEAEAEEEEEEF4F4F4F8F8F8FBFBFBFFFFFFB6ECC807A010049D09
        019A030094003171000D7100848484FFFFFF30B3435BCA710C930CDEDEDEE2E2
        E2E3E6E30FA8201BB4385CC66EF8F8F8FCFCFCFEFEFEB1EAC314AD2A049D0A00
        98001A8200187600777777FEFEFE30B34460CD7820B84231A031E0E0E007A00F
        22BB461FB8401CB53A5BC56CF9F9F9FBFBFBFDFDFDB1EAC313AC28019A020C8D
        00157800868686FFFFFF1EA62E64D07E27C04F28C1511AAF3527C05026BF4D23
        BC4720B9411CB53AEEF3EFF7F7F7F9F9F9F9F9F9AFE7C0029B060792000C7700
        A9A9A9FFFFFF14921466D3844CCE732EC75D2EC75E2DC65C2BC45827C05024BD
        4A21BA431BB4375CC36AF3F3F3F3F3F3F3F3F352CE770C9202177617E8E8E8FF
        FFFFC9E5C953CB7379DC9832CB6532CB6531CA632FC85F2AC35526BF4E23BC47
        1DB63B18B133E8EDE9EFEFEFEFEFEF29C050148D03879387FDFDFDFFFFFFFFFF
        FF5DB45D72DB957BDE9C35CC6733CC6632CB652DC65B29C25325BE4B1EB73F1A
        B33614AD2A13AB2715AE2B069F0D037E01F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
        43C16073DC967ADD9B33CC6633CC662EC75C29C25425BE4C1FB83F1BB43714AD
        2B10A9230CA51A07910999AC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96D09642
        C05D70DB9478DD9943D0722DC65C29C25425BE4C1FB83F1BB43714AD2B10A922
        0DA51A7FA67FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EBE
        6E54CD7568D88C65D48561D17F5ACD7646C36041C0571EAB2F068306DDE2DDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEF0DE
        2B9F2B1FA52D31B34530B345139C1D018702D1DFD1FEFEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
    end
    object BitBtn2: TBitBtn
      Left = 369
      Top = 96
      Width = 75
      Height = 25
      Hint = 'Sair'
      Caption = '&Sair'
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 450
      Top = 96
      Width = 75
      Height = 25
      Hint = 'Parar'
      Caption = '&Parar'
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF00008200008200058E00058E000082000082FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0002880114A5021DB1021DB102
        1DB1021DB1021DB1021DB10114A5000288FF00FFFF00FFFF00FFFF00FFFF00FF
        000082021BB5021DB5021DB1021DB1021DB1021DB1021DB1021DB1021DB1021B
        AF000082FF00FFFF00FFFF00FF000288011CCB021EC9021EC2021DB7021DB202
        1DB1021DB1021DB1021DB1021DB1021DB1021BAF000288FF00FFFF00FF0115BD
        011FDC011ED0001BC92F4DCF011BB7021DB1021DB10018AF2744C20018AF021D
        B1021DB10114A5FF00FF000082011FF2011FEB011FDE1131DDFFFFFFFFFFFF00
        16B80013B1F7F8FEFFFFFF2C49C4021DB1021DB1021DB1000082000082011FF8
        011FF3011FE60019DEE5E9FBFFFFFF5670DA3E5AD1FFFFFFFBFBFE0018AF021D
        B1021DB1021DB10000820005970F31FA0425FA011FF6011FEF0015E02243E5FF
        FFFFFFFFFF4462D50013B5021DB1021DB1021DB1021DB100058E0005982D4FFB
        1033FA011FFA011FF70016EA3857EDFFFFFFFFFFFF5672DD0017BF021DB5021D
        B1021DB1021DB100058E0000825C79FC506EFC011FFA001CFAF7F8FFFFFFFF3F
        5DEF2342E7FFFFFFFFFFFF021CC4021DBD021DB2021DB1000082000082506EFC
        8299FC0323FA1133FAFFFFFFFBFBFF0017EE0015E6E5E9FCFFFFFF2C4BD7021E
        C5021DBA021DB4000082FF00FF0D26DD5F7BFC6F8AFC173AFB1438FB001CFA01
        1FFA011FF80019EB0F31E9001CD9011ED4021EC70114ADFF00FFFF00FF000391
        1B3CF4BFCBFE7F97FC0A2DFA0221FA011FFA011FFA011FF4011FEE011FE1011F
        DC011CC6000288FF00FFFF00FFFF00FF0000821C3EF46984FCBFCBFEA5B6FE64
        7FFC516FFC4565FB3658FB0626F0011CDE000082FF00FFFF00FFFF00FFFF00FF
        FF00FF0003920F28DE6782FC8AA0FE93A7FE8299FC4767FC2245FB0116CE0002
        8BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00008200008200
        059D00059C000082000082FF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object ProgressBar: TProgressBar
      Left = 7
      Top = 75
      Width = 768
      Height = 17
      TabOrder = 3
    end
    object MemoComentario: TMemo
      Left = 91
      Top = 25
      Width = 684
      Height = 48
      Hint = 'Duplo click para visualizar coment'#225'rios'
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 4
      OnDblClick = MemoComentarioDblClick
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 48
    Width = 806
    Height = 471
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 2
    object pageRelatorios: TPageControl
      Left = 0
      Top = 0
      Width = 806
      Height = 471
      ActivePage = tbsResumo
      Align = alTop
      MultiLine = True
      Style = tsButtons
      TabOrder = 0
      OnChange = pageRelatoriosChange
      object tbsResumo: TTabSheet
        AlignWithMargins = True
        Caption = 'tbsResumo'
        object pageResumo: TPageControl
          Left = 0
          Top = 0
          Width = 792
          Height = 434
          ActivePage = TabSheet3
          Align = alClient
          HotTrack = True
          MultiLine = True
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = pageResumoChange
          OnExit = pageGerenciaisExit
          object TabSheet3: TTabSheet
            Caption = 'Pc / Oficina'
          end
          object tbsVendaBalcao: TTabSheet
            Caption = 'Sa'#237'das Balc'#227'o'
            ImageIndex = 2
            OnShow = tbsVendaBalcaoShow
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Panel33: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 64
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label41: TLabel
                  Left = 77
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox36: TComboBox
                  Left = 184
                  Top = 8
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
                object DBLookupComboBox3: TDBLookupComboBox
                  Left = 184
                  Top = 39
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'SIGLA'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipVnd
                  TabOrder = 1
                end
                object CheckBox14: TCheckBox
                  Left = 3
                  Top = 41
                  Width = 177
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  OnClick = CheckBox14Click
                end
              end
              object Panel34: TPanel
                Left = 1
                Top = 65
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object btSelectAllVendSaidasBalcao: TSpeedButton
                  Left = 695
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendSaidasBalcaoClick
                end
                object btUnSelectAllVendSaidasBalcao: TSpeedButton
                  Left = 722
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendSaidasBalcaoClick
                end
                object DBEdit1: TDBEdit
                  Left = 695
                  Top = 33
                  Width = 67
                  Height = 21
                  DataField = 'COD_VENDEDOR'
                  DataSource = dtmRelatorios.dsLocColab
                  Enabled = False
                  TabOrder = 3
                  Visible = False
                end
                object CheckListBox1: TCheckListBox
                  Left = 184
                  Top = 7
                  Width = 505
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 0
                  Visible = False
                end
                object CheckBox13: TCheckBox
                  Left = 44
                  Top = 6
                  Width = 136
                  Height = 17
                  Hint = 'Filtrar vendedor - [REL002]'
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  OnClick = CheckBox13Click
                end
                object DBLookupComboBox1: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                  ListSource = dtmRelatorios.dsLocColab
                  TabOrder = 2
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel35: TPanel
                Left = 1
                Top = 94
                Width = 782
                Height = 123
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object Label39: TLabel
                  Left = 48
                  Top = 34
                  Width = 132
                  Height = 13
                  Caption = 'Com Total por Produto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label42: TLabel
                  Left = 58
                  Top = 62
                  Width = 122
                  Height = 13
                  Caption = 'Com Total por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label36: TLabel
                  Left = 108
                  Top = 88
                  Width = 72
                  Height = 13
                  Caption = 'Ordenar por:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox37: TComboBox
                  Left = 184
                  Top = 31
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox41: TComboBox
                  Left = 184
                  Top = 59
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox26: TComboBox
                  Left = 184
                  Top = 85
                  Width = 140
                  Height = 21
                  Hint = 'Ordenar por campo desejado'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 3
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  Text = 'GRUPO E CODIGO'
                  Items.Strings = (
                    'NUM PEDIDO'
                    'DESCRICAO'
                    'CODPRODUTO'
                    'GRUPO E CODIGO')
                end
                object CheckBox12: TCheckBox
                  Left = 63
                  Top = 7
                  Width = 117
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox12Click
                end
                object DBLookupComboBox2: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'CODIGO_GRUP'
                  ListField = 'DESCRICAO;CODIGO_GRUP'
                  ListSource = dtmRelatorios.dsLocG
                  TabOrder = 1
                  OnExit = DBLookupComboBox2Exit
                end
                object DBEdit2: TDBEdit
                  Left = 692
                  Top = 3
                  Width = 67
                  Height = 21
                  DataField = 'CODIGO_GRUP'
                  DataSource = dtmRelatorios.dsLocG
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
              end
            end
          end
          object tbsVendaBalcaoPariticipante: TTabSheet
            Caption = 'Sa'#237'das Balc'#227'o Participante'
            ImageIndex = 13
            OnShow = tbsVendaBalcaoPariticipanteShow
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Panel36: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 64
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label32: TLabel
                  Left = 77
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox20: TComboBox
                  Left = 184
                  Top = 8
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
                object DBLookupComboBox31: TDBLookupComboBox
                  Left = 184
                  Top = 39
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'SIGLA'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipVnd
                  TabOrder = 1
                end
                object CheckBox55: TCheckBox
                  Left = 3
                  Top = 41
                  Width = 177
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  OnClick = CheckBox55Click
                end
              end
              object Panel37: TPanel
                Left = 1
                Top = 65
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object btSelectAllVendSaidasBalcaoPart: TSpeedButton
                  Left = 695
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendSaidasBalcaoPartClick
                end
                object btUnSelectAllVendSaidasBalcaoPart: TSpeedButton
                  Left = 722
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendSaidasBalcaoPartClick
                end
                object Label34: TLabel
                  Left = 33
                  Top = 7
                  Width = 131
                  Height = 13
                  Hint = 'Filtrar participante'
                  Alignment = taRightJustify
                  Caption = 'Filtrar por Participante:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = Label34Click
                end
                object DBEdit18: TDBEdit
                  Left = 693
                  Top = 33
                  Width = 67
                  Height = 21
                  DataField = 'COD_PARTICIPANTE'
                  DataSource = dtmRelatorios.dsLocPart
                  Enabled = False
                  TabOrder = 1
                  Visible = False
                end
                object CheckBox96: TCheckBox
                  Left = 165
                  Top = 6
                  Width = 15
                  Height = 17
                  Alignment = taLeftJustify
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  OnClick = CheckBox96Click
                end
                object CheckListBox2: TCheckListBox
                  Left = 184
                  Top = 7
                  Width = 505
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 3
                  Visible = False
                end
                object DBLookupComboBox29: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_PARTICIPANTE'
                  ListField = 'NOME_PARTICIPANTE;COD_PARTICIPANTE'
                  ListSource = dtmRelatorios.dsLocPart
                  TabOrder = 0
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel38: TPanel
                Left = 1
                Top = 94
                Width = 782
                Height = 113
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object Label31: TLabel
                  Left = 48
                  Top = 34
                  Width = 132
                  Height = 13
                  Caption = 'Com Total por Produto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label33: TLabel
                  Left = 58
                  Top = 61
                  Width = 122
                  Height = 13
                  Caption = 'Com Total por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label38: TLabel
                  Left = 108
                  Top = 88
                  Width = 72
                  Height = 13
                  Caption = 'Ordenar por:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox21: TComboBox
                  Left = 184
                  Top = 31
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object CheckBox53: TCheckBox
                  Left = 63
                  Top = 7
                  Width = 117
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox53Click
                end
                object DBLookupComboBox30: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'CODIGO_GRUP'
                  ListField = 'DESCRICAO;CODIGO_GRUP'
                  ListSource = dtmRelatorios.dsLocG
                  TabOrder = 1
                  OnExit = DBLookupComboBox2Exit
                end
                object DBEdit19: TDBEdit
                  Left = 693
                  Top = 3
                  Width = 67
                  Height = 21
                  DataField = 'CODIGO_GRUP'
                  DataSource = dtmRelatorios.dsLocG
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object ComboBox22: TComboBox
                  Left = 184
                  Top = 58
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox28: TComboBox
                  Left = 184
                  Top = 85
                  Width = 140
                  Height = 21
                  Hint = 'Ordenar por campo desejado'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 3
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  Text = 'GRUPO E CODIGO'
                  Items.Strings = (
                    'NUM PEDIDO'
                    'DESCRICAO'
                    'CODPRODUTO'
                    'GRUPO E CODIGO')
                end
              end
            end
          end
          object tbsVendaOficina: TTabSheet
            Caption = 'Sa'#237'das Prod. em Servi'#231'os'
            ImageIndex = 3
            OnShow = tbsVendaOficinaShow
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              OnClick = BitBtn1Click
              object Panel39: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 64
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label47: TLabel
                  Left = 76
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox43: TComboBox
                  Left = 184
                  Top = 8
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
                object DBLookupComboBox6: TDBLookupComboBox
                  Left = 184
                  Top = 39
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'TIPO_OS'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipoOS
                  TabOrder = 2
                end
                object CheckBox17: TCheckBox
                  Left = 55
                  Top = 41
                  Width = 124
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar OS por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  OnClick = CheckBox17Click
                end
              end
              object Panel40: TPanel
                Left = 1
                Top = 65
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object btSelectAllVendSaidasProdServ: TSpeedButton
                  Left = 695
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendSaidasProdServClick
                end
                object btUnSelectAllVendSaidasProdServ: TSpeedButton
                  Left = 722
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendSaidasProdServClick
                end
                object CheckBox16: TCheckBox
                  Left = 46
                  Top = 7
                  Width = 133
                  Height = 17
                  Hint = 'Filtrar vendedor - [REL004]'
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox16Click
                end
                object DBEdit3: TDBEdit
                  Left = 693
                  Top = 33
                  Width = 67
                  Height = 21
                  DataField = 'COD_VENDEDOR'
                  DataSource = dtmRelatorios.dsLocColab
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckListBox3: TCheckListBox
                  Left = 184
                  Top = 7
                  Width = 505
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 3
                  Visible = False
                end
                object DBLookupComboBox4: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                  ListSource = dtmRelatorios.dsLocColab
                  TabOrder = 1
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel41: TPanel
                Left = 1
                Top = 94
                Width = 782
                Height = 179
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object Label45: TLabel
                  Left = 47
                  Top = 62
                  Width = 132
                  Height = 13
                  Caption = 'Com Total por Produto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label50: TLabel
                  Left = 57
                  Top = 90
                  Width = 122
                  Height = 13
                  Caption = 'Com Total por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CheckBox15: TCheckBox
                  Left = 62
                  Top = 8
                  Width = 117
                  Height = 13
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox15Click
                end
                object DBLookupComboBox5: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 505
                  Height = 21
                  Enabled = False
                  KeyField = 'CODIGO_GRUP'
                  ListField = 'DESCRICAO;CODIGO_GRUP'
                  ListSource = dtmRelatorios.dsLocG
                  TabOrder = 1
                  OnExit = DBLookupComboBox2Exit
                end
                object DBEdit4: TDBEdit
                  Left = 691
                  Top = 14
                  Width = 67
                  Height = 21
                  DataField = 'CODIGO_GRUP'
                  DataSource = dtmRelatorios.dsLocG
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckBox48: TCheckBox
                  Left = 25
                  Top = 33
                  Width = 154
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Area de Exec:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox48Click
                end
                object DBComboBox1: TDBComboBox
                  Left = 184
                  Top = 31
                  Width = 505
                  Height = 21
                  Style = csDropDownList
                  DataField = 'AREA_EXEC'
                  DataSource = dtmRelatorios.dsLocAreaExec
                  Enabled = False
                  ItemHeight = 13
                  TabOrder = 4
                end
                object ComboBox44: TComboBox
                  Left = 184
                  Top = 58
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox48: TComboBox
                  Left = 184
                  Top = 85
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
              end
            end
          end
          object tbsVendaGeral: TTabSheet
            Caption = 'Sa'#237'das Geral'
            ImageIndex = 4
            OnShow = tbsVendaGeralShow
            object Panel15: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Panel42: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 96
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label48: TLabel
                  Left = 76
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox42: TComboBox
                  Left = 185
                  Top = 10
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
                object DBLookupComboBox9: TDBLookupComboBox
                  Left = 185
                  Top = 68
                  Width = 488
                  Height = 21
                  Enabled = False
                  KeyField = 'TIPO_OS'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipoOS
                  TabOrder = 1
                end
                object CheckBox20: TCheckBox
                  Left = 54
                  Top = 72
                  Width = 125
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar OS por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  OnClick = CheckBox20Click
                end
                object CheckBox21: TCheckBox
                  Left = 2
                  Top = 41
                  Width = 177
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox21Click
                end
                object DBLookupComboBox10: TDBLookupComboBox
                  Left = 185
                  Top = 39
                  Width = 488
                  Height = 21
                  Enabled = False
                  KeyField = 'SIGLA'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipVnd
                  TabOrder = 4
                end
              end
              object Panel43: TPanel
                Left = 1
                Top = 97
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object btSelectAllVendSaidasGeral: TSpeedButton
                  Left = 679
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendSaidasGeralClick
                end
                object btUnSelectAllVendSaidasGeral: TSpeedButton
                  Left = 706
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendSaidasGeralClick
                end
                object CheckBox19: TCheckBox
                  Left = 43
                  Top = 6
                  Width = 136
                  Height = 17
                  Hint = 'Filtrar vendedor - [REL006]'
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox19Click
                end
                object DBEdit5: TDBEdit
                  Left = 679
                  Top = 33
                  Width = 67
                  Height = 21
                  DataField = 'COD_VENDEDOR'
                  DataSource = dtmRelatorios.dsLocColab
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckListBox4: TCheckListBox
                  Left = 185
                  Top = 7
                  Width = 488
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 3
                  Visible = False
                end
                object DBLookupComboBox7: TDBLookupComboBox
                  Left = 185
                  Top = 3
                  Width = 489
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                  ListSource = dtmRelatorios.dsLocColab
                  TabOrder = 1
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel44: TPanel
                Left = 1
                Top = 126
                Width = 782
                Height = 113
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object Label46: TLabel
                  Left = 47
                  Top = 62
                  Width = 132
                  Height = 13
                  Caption = 'Com Total por Produto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label49: TLabel
                  Left = 57
                  Top = 88
                  Width = 122
                  Height = 13
                  Caption = 'Com Total por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CheckBox18: TCheckBox
                  Left = 62
                  Top = 6
                  Width = 117
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Grupo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox18Click
                end
                object DBLookupComboBox8: TDBLookupComboBox
                  Left = 185
                  Top = 2
                  Width = 488
                  Height = 21
                  Enabled = False
                  KeyField = 'CODIGO_GRUP'
                  ListField = 'DESCRICAO;CODIGO_GRUP'
                  ListSource = dtmRelatorios.dsLocG
                  TabOrder = 1
                  OnExit = DBLookupComboBox2Exit
                end
                object DBEdit6: TDBEdit
                  Left = 679
                  Top = 2
                  Width = 67
                  Height = 21
                  DataField = 'CODIGO_GRUP'
                  DataSource = dtmRelatorios.dsLocG
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckBox49: TCheckBox
                  Left = 25
                  Top = 33
                  Width = 154
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Area de Exec:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox49Click
                end
                object DBComboBox2: TDBComboBox
                  Left = 185
                  Top = 31
                  Width = 489
                  Height = 21
                  Style = csDropDownList
                  DataField = 'AREA_EXEC'
                  DataSource = dtmRelatorios.dsLocAreaExec
                  Enabled = False
                  ItemHeight = 13
                  TabOrder = 4
                end
                object ComboBox45: TComboBox
                  Left = 185
                  Top = 58
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox46: TComboBox
                  Left = 185
                  Top = 85
                  Width = 140
                  Height = 21
                  Hint = 'Agrupar por Produto ou Grupo'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
              end
            end
          end
          object tbsVendaVendedor: TTabSheet
            Caption = 'Sa'#237'das por Vendedor'
            ImageIndex = 5
            OnShow = tbsVendaVendedorShow
            object Panel16: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              OnEnter = Panel16Enter
              object Panel45: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 79
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label52: TLabel
                  Left = 133
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox47: TComboBox
                  Left = 239
                  Top = 8
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  OnExit = ComboBox47Exit
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
                object DBLookupComboBox13: TDBLookupComboBox
                  Left = 239
                  Top = 57
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'TIPO_OS'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipoOS
                  TabOrder = 4
                end
                object CheckBox24: TCheckBox
                  Left = 111
                  Top = 59
                  Width = 125
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar OS por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox24Click
                end
                object CheckBox25: TCheckBox
                  Left = 59
                  Top = 33
                  Width = 177
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  OnClick = CheckBox25Click
                end
                object DBLookupComboBox14: TDBLookupComboBox
                  Left = 239
                  Top = 32
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'SIGLA'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipVnd
                  TabOrder = 2
                end
              end
              object Panel46: TPanel
                Left = 1
                Top = 242
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object btSelectAllVendSaidasVend: TSpeedButton
                  Left = 692
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendSaidasVendClick
                end
                object btUnSelectAllVendSaidasVend: TSpeedButton
                  Left = 719
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendSaidasVendClick
                end
                object CheckBox23: TCheckBox
                  Left = 100
                  Top = 7
                  Width = 136
                  Height = 17
                  Hint = 'Filtrar vendedor - [REL008]'
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox23Click
                end
                object DBEdit7: TDBEdit
                  Left = 692
                  Top = 33
                  Width = 58
                  Height = 21
                  DataField = 'COD_VENDEDOR'
                  DataSource = dtmRelatorios.dsLocColab
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckListBox5: TCheckListBox
                  Left = 239
                  Top = 8
                  Width = 450
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 3
                  Visible = False
                end
                object DBLookupComboBox11: TDBLookupComboBox
                  Left = 239
                  Top = 3
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                  ListSource = dtmRelatorios.dsLocColab
                  TabOrder = 1
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel47: TPanel
                Left = 1
                Top = 80
                Width = 782
                Height = 162
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object Label51: TLabel
                  Left = 150
                  Top = 29
                  Width = 83
                  Height = 13
                  Caption = 'Total P/ M.O.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label53: TLabel
                  Left = 145
                  Top = 76
                  Width = 90
                  Height = 13
                  Caption = 'Listar Produtos:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label2: TLabel
                  Left = 6
                  Top = 54
                  Width = 230
                  Height = 13
                  Caption = 'Vendedores Comissionados sem vendas:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label30: TLabel
                  Left = 10
                  Top = 99
                  Width = 226
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Agrupamento descri'#231#227'o padr'#227'o servi'#231'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label110: TLabel
                  Left = 139
                  Top = 122
                  Width = 96
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Total por Venda:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label111: TLabel
                  Left = 94
                  Top = 144
                  Width = 141
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Recebimento por Venda:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CheckBox50: TCheckBox
                  Left = 82
                  Top = 6
                  Width = 154
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Area de Exec:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox50Click
                end
                object DBComboBox3: TDBComboBox
                  Left = 239
                  Top = 2
                  Width = 450
                  Height = 21
                  Style = csDropDownList
                  DataField = 'AREA_EXEC'
                  DataSource = dtmRelatorios.dsLocAreaExec
                  Enabled = False
                  ItemHeight = 13
                  TabOrder = 1
                end
                object ComboBox49: TComboBox
                  Left = 239
                  Top = 26
                  Width = 140
                  Height = 21
                  Hint = 'Total P/M.O'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox50: TComboBox
                  Left = 239
                  Top = 73
                  Width = 140
                  Height = 21
                  Hint = 'Listar produtos'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  Text = 'SIM'
                  OnExit = ComboBox50Exit
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox2: TComboBox
                  Left = 239
                  Top = 50
                  Width = 140
                  Height = 21
                  Hint = 'Exibir vendedores comissionados sem vendas'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  Text = 'N'#195'O'
                  Items.Strings = (
                    'N'#195'O'
                    'SIM')
                end
                object ComboBox19: TComboBox
                  Left = 239
                  Top = 96
                  Width = 140
                  Height = 21
                  Hint = 'Agrupamento descri'#231#227'o padr'#227'o servi'#231'o'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox87: TComboBox
                  Left = 239
                  Top = 119
                  Width = 140
                  Height = 21
                  Hint = 'Total por Venda'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  Text = 'N'#195'O'
                  Items.Strings = (
                    'N'#195'O'
                    'SIM')
                end
                object ComboBox88: TComboBox
                  Left = 239
                  Top = 141
                  Width = 140
                  Height = 21
                  Hint = 'Recebimento por Venda'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 7
                  Text = 'N'#195'O'
                  Items.Strings = (
                    'N'#195'O'
                    'SIM')
                end
              end
            end
          end
          object tbsVendaVendedorAcrescCondPagVend: TTabSheet
            Caption = 
              'Sa'#237'das por Vendedor de Acordo com a Condi'#231#227'o de Pagamento e Comi' +
              'ss'#227'o do Vendedor'
            ImageIndex = 19
            OnShow = tbsVendaVendedorAcrescCondPagVendShow
            object Panel54: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              OnEnter = Panel54Enter
              object Panel55: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 76
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label113: TLabel
                  Left = 133
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox90: TComboBox
                  Left = 239
                  Top = 8
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  OnExit = ComboBox90Exit
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
                object DBLookupComboBox65: TDBLookupComboBox
                  Left = 239
                  Top = 55
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'TIPO_OS'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipoOS
                  TabOrder = 4
                end
                object CheckBox54: TCheckBox
                  Left = 111
                  Top = 57
                  Width = 125
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar OS por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox54Click
                end
                object CheckBox97: TCheckBox
                  Left = 59
                  Top = 33
                  Width = 177
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                  OnClick = CheckBox97Click
                end
                object DBLookupComboBox66: TDBLookupComboBox
                  Left = 239
                  Top = 32
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'SIGLA'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipVnd
                  TabOrder = 2
                end
              end
              object Panel56: TPanel
                Left = 1
                Top = 240
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object btSelectAllVendSaidasVendAcrescVend: TSpeedButton
                  Left = 692
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendSaidasVendAcrescVendClick
                end
                object btUnSelectAllVendSaidasVendAcrescVend: TSpeedButton
                  Left = 719
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendSaidasVendAcrescVendClick
                end
                object CheckBox98: TCheckBox
                  Left = 100
                  Top = 7
                  Width = 136
                  Height = 17
                  Hint = 'Filtrar vendedor - [REL064]'
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox98Click
                end
                object DBEdit42: TDBEdit
                  Left = 692
                  Top = 33
                  Width = 58
                  Height = 21
                  DataField = 'COD_VENDEDOR'
                  DataSource = dtmRelatorios.dsLocColab
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckListBox8: TCheckListBox
                  Left = 239
                  Top = 8
                  Width = 450
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 3
                  Visible = False
                end
                object DBLookupComboBox67: TDBLookupComboBox
                  Left = 239
                  Top = 5
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                  ListSource = dtmRelatorios.dsLocColab
                  TabOrder = 1
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel57: TPanel
                Left = 1
                Top = 77
                Width = 782
                Height = 163
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object Label114: TLabel
                  Left = 150
                  Top = 52
                  Width = 83
                  Height = 13
                  Caption = 'Total P/ M.O.:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label115: TLabel
                  Left = 145
                  Top = 76
                  Width = 89
                  Height = 13
                  Caption = 'Listar produtos:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label117: TLabel
                  Left = 10
                  Top = 99
                  Width = 226
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Agrupamento descri'#231#227'o padr'#227'o servi'#231'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label118: TLabel
                  Left = 139
                  Top = 122
                  Width = 96
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Total por Venda:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label119: TLabel
                  Left = 94
                  Top = 146
                  Width = 141
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Recebimento por Venda:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label120: TLabel
                  Left = 134
                  Top = 28
                  Width = 101
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Exibir valor bruto:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CheckBox99: TCheckBox
                  Left = 82
                  Top = 6
                  Width = 154
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Area de Exec:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox99Click
                end
                object DBComboBox8: TDBComboBox
                  Left = 239
                  Top = 2
                  Width = 450
                  Height = 21
                  Style = csDropDownList
                  DataField = 'AREA_EXEC'
                  DataSource = dtmRelatorios.dsLocAreaExec
                  Enabled = False
                  ItemHeight = 13
                  TabOrder = 1
                end
                object ComboBox91: TComboBox
                  Left = 239
                  Top = 49
                  Width = 140
                  Height = 21
                  Hint = 'Total P/M.O'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox92: TComboBox
                  Left = 239
                  Top = 73
                  Width = 140
                  Height = 21
                  Hint = 'Listar produtos'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  Text = 'SIM'
                  OnExit = ComboBox92Exit
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox94: TComboBox
                  Left = 239
                  Top = 96
                  Width = 140
                  Height = 21
                  Hint = 'Agrupamento descri'#231#227'o padr'#227'o servi'#231'o'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
                object ComboBox95: TComboBox
                  Left = 239
                  Top = 119
                  Width = 140
                  Height = 21
                  Hint = 'Total por Venda'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  Text = 'N'#195'O'
                  Items.Strings = (
                    'N'#195'O'
                    'SIM')
                end
                object ComboBox96: TComboBox
                  Left = 239
                  Top = 143
                  Width = 140
                  Height = 21
                  Hint = 'Recebimento por Venda'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 7
                  Text = 'N'#195'O'
                  Items.Strings = (
                    'N'#195'O'
                    'SIM')
                end
                object ComboBox97: TComboBox
                  Left = 239
                  Top = 25
                  Width = 140
                  Height = 21
                  Hint = 'Exibir valor bruto'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
              end
            end
          end
          object tbsComprasPorPeriodo: TTabSheet
            Caption = 'Compras por Per'#237'odo'
            ImageIndex = 6
            OnShow = tbsComprasPorPeriodoShow
            object Panel17: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Label55: TLabel
                Left = 78
                Top = 11
                Width = 103
                Height = 13
                Caption = 'Tipo de Relat'#243'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label56: TLabel
                Left = 91
                Top = 39
                Width = 90
                Height = 13
                Caption = 'Listar Produtos:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label40: TLabel
                Left = 159
                Top = 67
                Width = 22
                Height = 13
                Caption = 'DA:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label43: TLabel
                Left = 42
                Top = 123
                Width = 139
                Height = 13
                Caption = 'Agrupar por Fornecedor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label7: TLabel
                Left = 109
                Top = 180
                Width = 72
                Height = 13
                Caption = 'Ordenar por:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 114
                Top = 209
                Width = 67
                Height = 13
                Alignment = taRightJustify
                Caption = 'Com Grade:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label106: TLabel
                Left = 42
                Top = 95
                Width = 139
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agrupar por Nota Fiscal:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label112: TLabel
                Left = 89
                Top = 151
                Width = 92
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total por CFOP:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox51: TComboBox
                Left = 184
                Top = 8
                Width = 140
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'SINT'#201'TICO'
                OnChange = ComboBox51Change
                OnExit = ComboBox51Exit
                Items.Strings = (
                  'SINT'#201'TICO'
                  'ANAL'#205'TICO')
              end
              object ComboBox53: TComboBox
                Left = 184
                Top = 36
                Width = 140
                Height = 21
                Hint = 'Agrupar por Produto ou Grupo'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Text = 'SIM'
                OnChange = ComboBox53Change
                OnExit = ComboBox53Exit
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox35: TComboBox
                Left = 184
                Top = 64
                Width = 140
                Height = 21
                Hint = 'Agrupar por Produto ou Grupo'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 1
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                Text = 'N'#195'O'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox38: TComboBox
                Left = 184
                Top = 120
                Width = 140
                Height = 21
                Hint = 'Agrupar por Produto ou Grupo'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox4: TComboBox
                Left = 184
                Top = 177
                Width = 140
                Height = 21
                Hint = 'Ordenar por campo desejado'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 6
                Text = 'DATA'
                Items.Strings = (
                  'DATA'
                  'NUM NF'
                  'CFOP')
              end
              object ComboBox7: TComboBox
                Left = 184
                Top = 206
                Width = 140
                Height = 21
                Hint = 'Agrupar por Produto ou Grupo'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 1
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                Text = 'N'#195'O'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox83: TComboBox
                Left = 184
                Top = 92
                Width = 140
                Height = 21
                Hint = 'Agrupar por Nota Fiscal'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox89: TComboBox
                Left = 184
                Top = 148
                Width = 140
                Height = 21
                Hint = 'Agrupar por Produto ou Grupo'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 1
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                Text = 'N'#195'O'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
            end
          end
          object tbsEstoque: TTabSheet
            Caption = 'Estoque'
            ImageIndex = 7
            OnShow = tbsEstoqueShow
            object Panel18: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Label59: TLabel
                Left = 39
                Top = 26
                Width = 116
                Height = 13
                Caption = 'Data de Refer'#234'ncia:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object MaskEdit4: TMaskEdit
                Left = 158
                Top = 23
                Width = 80
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
            end
          end
          object tbsResumoGeral: TTabSheet
            Caption = 'Resumo Geral'
            ImageIndex = 9
          end
          object tbsComissaoRecebimento: TTabSheet
            Caption = 'Comissao Produtos de Acordo com Recebimento'
            ImageIndex = 8
            OnShow = tbsComissaoRecebimentoShow
            object Panel19: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Panel48: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 33
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label54: TLabel
                  Left = 78
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox39: TComboBox
                  Left = 184
                  Top = 8
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
              end
              object Panel49: TPanel
                Left = 1
                Top = 34
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object btSelectAllVendComissProdRec: TSpeedButton
                  Left = 677
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendComissProdRecClick
                end
                object btUnSelectAllVendComissProdRec: TSpeedButton
                  Left = 704
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendComissProdRecClick
                end
                object CheckBox22: TCheckBox
                  Left = 45
                  Top = 6
                  Width = 136
                  Height = 17
                  Hint = 'Filtrar vendedor - [REL012]'
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox22Click
                end
                object DBEdit8: TDBEdit
                  Left = 677
                  Top = 33
                  Width = 67
                  Height = 21
                  DataField = 'COD_VENDEDOR'
                  DataSource = dtmRelatorios.dsLocColab
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckListBox6: TCheckListBox
                  Left = 184
                  Top = 8
                  Width = 489
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 3
                  Visible = False
                end
                object DBLookupComboBox12: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 489
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                  ListSource = dtmRelatorios.dsLocColab
                  TabOrder = 1
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel50: TPanel
                Left = 1
                Top = 63
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object CheckBox74: TCheckBox
                  Left = 53
                  Top = 5
                  Width = 128
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Controle:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox74Click
                end
                object DBLookupComboBox48: TDBLookupComboBox
                  Left = 184
                  Top = 3
                  Width = 489
                  Height = 21
                  Enabled = False
                  KeyField = 'CODIGO_CTRL'
                  ListField = 'NOME_CTRL'
                  ListSource = dtmRelatorios.dsLocControles
                  TabOrder = 1
                  OnExit = DBLookupComboBox1Exit
                end
                object DBEdit29: TDBEdit
                  Left = 677
                  Top = 3
                  Width = 67
                  Height = 21
                  DataField = 'CODIGO_CTRL'
                  DataSource = dtmRelatorios.dsLocControles
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
              end
            end
          end
          object tbsVendaVendedorComissaoFaixaDesc: TTabSheet
            Caption = 'Comiss'#227'o por Faixa de Desconto'
            ImageIndex = 15
            OnShow = tbsVendaVendedorComissaoFaixaDescShow
            object Panel29: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              OnEnter = Panel29Enter
              object Panel51: TPanel
                Left = 1
                Top = 1
                Width = 782
                Height = 97
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label88: TLabel
                  Left = 133
                  Top = 11
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Relat'#243'rio:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ComboBox62: TComboBox
                  Left = 239
                  Top = 8
                  Width = 140
                  Height = 21
                  Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  Text = 'SINT'#201'TICO'
                  OnExit = ComboBox62Exit
                  Items.Strings = (
                    'SINT'#201'TICO'
                    'ANAL'#205'TICO')
                end
                object DBLookupComboBox50: TDBLookupComboBox
                  Left = 239
                  Top = 69
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'TIPO_OS'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipoOS
                  TabOrder = 1
                end
                object CheckBox76: TCheckBox
                  Left = 111
                  Top = 70
                  Width = 125
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar OS por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                  OnClick = CheckBox76Click
                end
                object CheckBox77: TCheckBox
                  Left = 59
                  Top = 38
                  Width = 177
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 3
                  OnClick = CheckBox77Click
                end
                object DBLookupComboBox51: TDBLookupComboBox
                  Left = 239
                  Top = 37
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'SIGLA'
                  ListField = 'DESCRICAO'
                  ListSource = dtmRelatorios.dsLocTipVnd
                  TabOrder = 4
                end
              end
              object Panel52: TPanel
                Left = 1
                Top = 98
                Width = 782
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object btSelectAllVendComissFaixaDesc: TSpeedButton
                  Left = 692
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btSelectAllVendComissFaixaDescClick
                end
                object btUnSelectAllVendComissFaixaDesc: TSpeedButton
                  Left = 719
                  Top = 3
                  Width = 23
                  Height = 21
                  Hint = 'Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  Visible = False
                  OnClick = btUnSelectAllVendComissFaixaDescClick
                end
                object CheckBox75: TCheckBox
                  Left = 100
                  Top = 7
                  Width = 136
                  Height = 17
                  Hint = 'Filtrar vendedor - [REL008]'
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox75Click
                end
                object DBEdit30: TDBEdit
                  Left = 692
                  Top = 33
                  Width = 58
                  Height = 21
                  DataField = 'COD_VENDEDOR'
                  DataSource = dtmRelatorios.dsLocColab
                  Enabled = False
                  TabOrder = 2
                  Visible = False
                end
                object CheckListBox7: TCheckListBox
                  Left = 239
                  Top = 8
                  Width = 450
                  Height = 97
                  ItemHeight = 13
                  TabOrder = 3
                  Visible = False
                end
                object DBLookupComboBox49: TDBLookupComboBox
                  Left = 239
                  Top = 3
                  Width = 450
                  Height = 21
                  Enabled = False
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                  ListSource = dtmRelatorios.dsLocColab
                  TabOrder = 1
                  OnExit = DBLookupComboBox1Exit
                end
              end
              object Panel53: TPanel
                Left = 1
                Top = 127
                Width = 782
                Height = 84
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object Label87: TLabel
                  Left = 146
                  Top = 62
                  Width = 90
                  Height = 13
                  Caption = 'Listar Produtos:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CheckBox78: TCheckBox
                  Left = 81
                  Top = 6
                  Width = 155
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Filtrar por Area de Exec:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  OnClick = CheckBox78Click
                end
                object DBComboBox7: TDBComboBox
                  Left = 239
                  Top = 3
                  Width = 450
                  Height = 21
                  Style = csDropDownList
                  DataField = 'AREA_EXEC'
                  DataSource = dtmRelatorios.dsLocAreaExec
                  Enabled = False
                  ItemHeight = 13
                  TabOrder = 1
                end
                object CheckBox79: TCheckBox
                  Left = 82
                  Top = 33
                  Width = 154
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Exibir comiss'#227'o t'#233'cnico:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 2
                end
                object ComboBox63: TComboBox
                  Left = 239
                  Top = 58
                  Width = 140
                  Height = 21
                  Hint = 'Listar produtos'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  ItemHeight = 13
                  ItemIndex = 0
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  Text = 'SIM'
                  Items.Strings = (
                    'SIM'
                    'N'#195'O')
                end
              end
            end
          end
          object tbsFinVendaModalidadePag: TTabSheet
            Caption = '(Financeiro) Venda por Modalidades de Pagamento'
            ImageIndex = 10
            OnShow = tbsFinVendaModalidadePagShow
          end
          object tbsFinVendaVendedor: TTabSheet
            Caption = '(Financeiro) Venda p/ Vendedor'
            ImageIndex = 11
            OnShow = tbsFinVendaVendedorShow
          end
          object tbsFinVendaVendedorComissaoServ: TTabSheet
            Caption = '(Financeiro) Vendas por Vendedor (Comiss'#227'o por servi'#231'o)'
            ImageIndex = 12
            OnShow = tbsFinVendaVendedorComissaoServShow
            object Panel20: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Label103: TLabel
                Left = 106
                Top = 21
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Situa'#231#227'o da OS:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label104: TLabel
                Left = 141
                Top = 175
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Filtrar por:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBLookupComboBox15: TDBLookupComboBox
                Left = 205
                Top = 81
                Width = 527
                Height = 21
                Enabled = False
                KeyField = 'COD_FUNCAO'
                ListField = 'DESC_FUNCAO;COD_FUNCAO'
                ListSource = dtmRelatorios.dsListaFuncoes
                TabOrder = 4
                OnExit = DBLookupComboBox15Exit
              end
              object CheckBox27: TCheckBox
                Left = 47
                Top = 83
                Width = 153
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Fun'#231#227'o do Colaborador:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                OnClick = CheckBox27Click
              end
              object DBLookupComboBox17: TDBLookupComboBox
                Left = 205
                Top = 50
                Width = 527
                Height = 21
                Enabled = False
                KeyField = 'TIPO_OS'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipoOS
                TabOrder = 2
              end
              object CheckBox28: TCheckBox
                Left = 76
                Top = 52
                Width = 124
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar OS por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox28Click
              end
              object CheckBox7: TCheckBox
                Left = 6
                Top = 113
                Width = 194
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Exibir ORC convertido em DAV:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
              end
              object CheckBox51: TCheckBox
                Left = 46
                Top = 141
                Width = 154
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Area de Exec:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnClick = CheckBox51Click
              end
              object DBComboBox4: TDBComboBox
                Left = 205
                Top = 139
                Width = 527
                Height = 21
                Style = csDropDownList
                DataField = 'AREA_EXEC'
                DataSource = dtmRelatorios.dsLocAreaExec
                Enabled = False
                ItemHeight = 13
                TabOrder = 7
              end
              object ComboBox80: TComboBox
                Left = 205
                Top = 18
                Width = 140
                Height = 21
                Hint = 'Status da OS'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'AMBOS'
                OnExit = ComboBox80Exit
                Items.Strings = (
                  'AMBOS'
                  'ABERTA'
                  'FECHADA')
              end
              object ComboBox81: TComboBox
                Left = 205
                Top = 172
                Width = 140
                Height = 21
                Hint = 'Filtrar por'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 8
                Text = 'DATA OS'
                Items.Strings = (
                  'DATA OS'
                  'DATA FECHAMENTO')
              end
            end
          end
          object tbsVendedores: TTabSheet
            Caption = 'Lista de Vendedores'
            ImageIndex = 13
            object pnVendedores: TPanel
              Left = 72
              Top = 0
              Width = 529
              Height = 344
              TabOrder = 0
              object GroupBox3: TGroupBox
                Left = 1
                Top = 1
                Width = 527
                Height = 286
                Align = alClient
                Caption = 'Rela'#231#227'o dos Vendedores por Fun'#231#227'o'
                TabOrder = 0
                object DBGrid1: TDBGrid
                  Left = 2
                  Top = 15
                  Width = 523
                  Height = 269
                  Align = alClient
                  DataSource = dtmRelatorios.dsLocColab
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
                      FieldName = 'COD_VENDEDOR'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NOME_VENDEDOR'
                      Visible = True
                    end>
                end
              end
              object GroupBox4: TGroupBox
                Left = 1
                Top = 287
                Width = 527
                Height = 56
                Align = alBottom
                TabOrder = 1
                object BitBtn4: TBitBtn
                  Left = 226
                  Top = 16
                  Width = 75
                  Height = 25
                  Caption = 'OK'
                  Default = True
                  TabOrder = 0
                  OnClick = BitBtn4Click
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
                object CheckBox26: TCheckBox
                  Left = 10
                  Top = 21
                  Width = 159
                  Height = 17
                  Caption = 'Todos os Vendedores'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
          end
          object tbsPagamentoFinanceiro: TTabSheet
            Caption = '(Financeiro) Pagamentos'
            ImageIndex = 16
            OnShow = tbsPagamentoFinanceiroShow
            object Panel30: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              TabOrder = 0
              object Label89: TLabel
                Left = 129
                Top = 11
                Width = 103
                Height = 13
                Caption = 'Tipo de Relat'#243'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label90: TLabel
                Left = 170
                Top = 127
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Filtrar por:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbCodigoEmpUnificada2: TLabel
                Left = 5
                Top = 185
                Width = 227
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'digo Empresa Unificada (0 - TODAS):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbAgruparUnificadas2: TLabel
                Left = 61
                Top = 213
                Width = 171
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agrupar Empresas Unificadas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label93: TLabel
                Left = 92
                Top = 157
                Width = 137
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir detalhes pag/rec:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label99: TLabel
                Left = 393
                Top = 157
                Width = 143
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir totais por controle:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox64: TComboBox
                Left = 235
                Top = 8
                Width = 140
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'SINT'#201'TICO'
                OnExit = ComboBox64Exit
                Items.Strings = (
                  'SINT'#201'TICO'
                  'ANAL'#205'TICO')
              end
              object CheckBox80: TCheckBox
                Left = 101
                Top = 98
                Width = 128
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                OnClick = CheckBox80Click
              end
              object DBLookupComboBox52: TDBLookupComboBox
                Left = 235
                Top = 95
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocControlesPag
                TabOrder = 6
                OnExit = DBLookupComboBox1Exit
              end
              object ComboBox65: TComboBox
                Left = 235
                Top = 124
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                Text = 'QUITADOS'
                Items.Strings = (
                  'QUITADOS'
                  'NAO QUITADOS'
                  'AMBOS')
              end
              object edCodigoEmpUnificada2: TEdit
                Left = 235
                Top = 182
                Width = 140
                Height = 21
                TabOrder = 10
                Text = '0'
                OnKeyPress = edCodigoEmpUnificada2KeyPress
              end
              object cbAgruparUnificadas2: TComboBox
                Left = 235
                Top = 211
                Width = 140
                Height = 21
                Hint = 'Agrupar Empresas Unificadas'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'NAO')
              end
              object DBLookupComboBox53: TDBLookupComboBox
                Left = 235
                Top = 38
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsLocClientesPag
                TabOrder = 2
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox53KeyDown
              end
              object CheckBox81: TCheckBox
                Left = 107
                Top = 40
                Width = 122
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox81Click
              end
              object DBEdit31: TDBEdit
                Left = 687
                Top = 38
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsLocClientesPag
                Enabled = False
                TabOrder = 12
                Visible = False
              end
              object DBEdit32: TDBEdit
                Left = 687
                Top = 94
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocControlesPag
                Enabled = False
                TabOrder = 13
                Visible = False
              end
              object CheckBox91: TCheckBox
                Left = 59
                Top = 70
                Width = 170
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Origem Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                OnClick = CheckBox91Click
              end
              object DBLookupComboBox61: TDBLookupComboBox
                Left = 235
                Top = 67
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocOrigControlesPag
                TabOrder = 4
                OnExit = DBLookupComboBox1Exit
              end
              object DBEdit38: TDBEdit
                Left = 687
                Top = 66
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocOrigControlesPag
                Enabled = False
                TabOrder = 14
                Visible = False
              end
              object ComboBox70: TComboBox
                Left = 235
                Top = 153
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 8
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox76: TComboBox
                Left = 541
                Top = 153
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
            end
          end
          object tbsRecebimentoFinanceiro: TTabSheet
            Caption = '(Financeiro) Recebimentos '
            ImageIndex = 14
            OnShow = tbsRecebimentoFinanceiroShow
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Label35: TLabel
                Left = 129
                Top = 11
                Width = 103
                Height = 13
                Caption = 'Tipo de Relat'#243'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label68: TLabel
                Left = 170
                Top = 236
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Filtrar por:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbAgruparUnificadas: TLabel
                Left = 61
                Top = 315
                Width = 171
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agrupar Empresas Unificadas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbCodigoEmpUnificada: TLabel
                Left = 5
                Top = 287
                Width = 227
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'digo Empresa Unificada (0 - TODAS):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label94: TLabel
                Left = 92
                Top = 263
                Width = 137
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir detalhes pag/rec:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label100: TLabel
                Left = 393
                Top = 263
                Width = 143
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir totais por controle:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox23: TComboBox
                Left = 235
                Top = 8
                Width = 140
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'SINT'#201'TICO'
                OnExit = ComboBox23Exit
                Items.Strings = (
                  'SINT'#201'TICO'
                  'ANAL'#205'TICO')
              end
              object CheckBox57: TCheckBox
                Left = 52
                Top = 61
                Width = 177
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                OnClick = CheckBox57Click
              end
              object DBLookupComboBox33: TDBLookupComboBox
                Left = 235
                Top = 58
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'SIGLA'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipVndRec
                TabOrder = 4
              end
              object CheckBox58: TCheckBox
                Left = 104
                Top = 84
                Width = 125
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar OS por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                OnClick = CheckBox58Click
              end
              object DBLookupComboBox34: TDBLookupComboBox
                Left = 235
                Top = 83
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'TIPO_OS'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipoOSRec
                TabOrder = 6
              end
              object CheckBox59: TCheckBox
                Left = 28
                Top = 109
                Width = 201
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar Venda Ve'#237'culos por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                OnClick = CheckBox59Click
              end
              object DBLookupComboBox35: TDBLookupComboBox
                Left = 235
                Top = 108
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'TIPO_OS'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipoVeicRec
                TabOrder = 8
              end
              object CheckBox60: TCheckBox
                Left = 31
                Top = 35
                Width = 198
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Venda (SIM ou N'#195'O):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox60Click
              end
              object ComboBox24: TComboBox
                Left = 235
                Top = 33
                Width = 140
                Height = 21
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'NAO')
              end
              object CheckBox61: TCheckBox
                Left = 124
                Top = 185
                Width = 105
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 13
                OnClick = CheckBox61Click
              end
              object ComboBox25: TComboBox
                Left = 235
                Top = 183
                Width = 140
                Height = 21
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 14
                Text = 'SAIDAS/VENDAS'
                Items.Strings = (
                  'SAIDAS/VENDAS'
                  'RECIBO ANTECIPADO'
                  'CREDIARIO/CHEQUE')
              end
              object CheckBox62: TCheckBox
                Left = 103
                Top = 211
                Width = 126
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 15
                OnClick = CheckBox62Click
              end
              object DBLookupComboBox36: TDBLookupComboBox
                Left = 235
                Top = 208
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocControlesRec
                TabOrder = 16
                OnExit = DBLookupComboBox1Exit
              end
              object ComboBox29: TComboBox
                Left = 235
                Top = 233
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 17
                Text = 'QUITADOS'
                Items.Strings = (
                  'QUITADOS'
                  'NAO QUITADOS'
                  'AMBOS')
              end
              object cbAgruparUnificadas: TComboBox
                Left = 235
                Top = 309
                Width = 140
                Height = 21
                Hint = 'Agrupar Empresas Unificadas'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 21
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'NAO')
              end
              object edCodigoEmpUnificada: TEdit
                Left = 235
                Top = 285
                Width = 140
                Height = 21
                TabOrder = 20
                Text = '0'
                OnKeyPress = edCodigoEmpUnificadaKeyPress
              end
              object DBLookupComboBox32: TDBLookupComboBox
                Left = 235
                Top = 133
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsLocClientesRec
                TabOrder = 10
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox32KeyDown
              end
              object CheckBox56: TCheckBox
                Left = 110
                Top = 134
                Width = 119
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                OnClick = CheckBox56Click
              end
              object DBEdit20: TDBEdit
                Left = 687
                Top = 133
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsLocClientesRec
                Enabled = False
                TabOrder = 22
                Visible = False
              end
              object DBEdit33: TDBEdit
                Left = 687
                Top = 208
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocControlesRec
                Enabled = False
                TabOrder = 23
                Visible = False
              end
              object CheckBox89: TCheckBox
                Left = 60
                Top = 160
                Width = 169
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Origem Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 11
                OnClick = CheckBox89Click
              end
              object DBLookupComboBox59: TDBLookupComboBox
                Left = 235
                Top = 158
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocOrigControlesRec
                TabOrder = 12
                OnExit = DBLookupComboBox1Exit
              end
              object DBEdit36: TDBEdit
                Left = 687
                Top = 158
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocOrigControlesRec
                Enabled = False
                TabOrder = 24
                Visible = False
              end
              object ComboBox71: TComboBox
                Left = 235
                Top = 259
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 18
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox77: TComboBox
                Left = 541
                Top = 259
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 19
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
            end
          end
          object tbsPagamentoRecebimentoFinanceiro: TTabSheet
            Caption = '(Financeiro) Pagamentos / Recebimentos'
            ImageIndex = 17
            OnShow = tbsPagamentoRecebimentoFinanceiroShow
            object Panel31: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Label91: TLabel
                Left = 129
                Top = 11
                Width = 103
                Height = 13
                Caption = 'Tipo de Relat'#243'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label92: TLabel
                Left = 170
                Top = 236
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'Filtrar por:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbAgruparUnificadas3: TLabel
                Left = 61
                Top = 315
                Width = 171
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agrupar Empresas Unificadas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbCodigoEmpUnificada3: TLabel
                Left = 5
                Top = 288
                Width = 227
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'digo Empresa Unificada (0 - TODAS):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label95: TLabel
                Left = 92
                Top = 263
                Width = 137
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir detalhes pag/rec:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label101: TLabel
                Left = 393
                Top = 263
                Width = 143
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir totais por controle:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox66: TComboBox
                Left = 235
                Top = 8
                Width = 140
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'SINT'#201'TICO'
                OnExit = ComboBox66Exit
                Items.Strings = (
                  'SINT'#201'TICO'
                  'ANAL'#205'TICO')
              end
              object CheckBox82: TCheckBox
                Left = 52
                Top = 61
                Width = 177
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                OnClick = CheckBox82Click
              end
              object DBLookupComboBox54: TDBLookupComboBox
                Left = 235
                Top = 58
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'SIGLA'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipVndPagRec
                TabOrder = 4
              end
              object CheckBox83: TCheckBox
                Left = 104
                Top = 84
                Width = 125
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar OS por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                OnClick = CheckBox83Click
              end
              object DBLookupComboBox55: TDBLookupComboBox
                Left = 235
                Top = 83
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'TIPO_OS'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipoOSPagRec
                TabOrder = 6
              end
              object CheckBox84: TCheckBox
                Left = 28
                Top = 109
                Width = 201
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar Venda Ve'#237'culos por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                OnClick = CheckBox84Click
              end
              object DBLookupComboBox56: TDBLookupComboBox
                Left = 235
                Top = 108
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'TIPO_OS'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipoVeicPagRec
                TabOrder = 8
              end
              object CheckBox85: TCheckBox
                Left = 31
                Top = 35
                Width = 198
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Venda (SIM ou N'#195'O):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox85Click
              end
              object ComboBox67: TComboBox
                Left = 235
                Top = 34
                Width = 140
                Height = 21
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'NAO')
              end
              object CheckBox86: TCheckBox
                Left = 124
                Top = 185
                Width = 105
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 13
                OnClick = CheckBox86Click
              end
              object ComboBox68: TComboBox
                Left = 235
                Top = 183
                Width = 140
                Height = 21
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 14
                Text = 'CONTAS A PAGAR'
                Items.Strings = (
                  'CONTAS A PAGAR'
                  'SAIDAS/VENDAS'
                  'RECIBO ANTECIPADO'
                  'CREDIARIO/CHEQUE')
              end
              object CheckBox87: TCheckBox
                Left = 103
                Top = 211
                Width = 126
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 15
                OnClick = CheckBox87Click
              end
              object DBLookupComboBox57: TDBLookupComboBox
                Left = 235
                Top = 208
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocControlesPagRec
                TabOrder = 16
                OnExit = DBLookupComboBox1Exit
              end
              object ComboBox69: TComboBox
                Left = 235
                Top = 233
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 17
                Text = 'QUITADOS'
                Items.Strings = (
                  'QUITADOS'
                  'NAO QUITADOS'
                  'AMBOS')
              end
              object cbAgruparUnificadas3: TComboBox
                Left = 235
                Top = 309
                Width = 140
                Height = 21
                Hint = 'Agrupar Empresas Unificadas'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 21
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'NAO')
              end
              object edCodigoEmpUnificada3: TEdit
                Left = 235
                Top = 285
                Width = 140
                Height = 21
                TabOrder = 20
                Text = '0'
                OnKeyPress = edCodigoEmpUnificadaKeyPress
              end
              object DBLookupComboBox58: TDBLookupComboBox
                Left = 235
                Top = 133
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsLocClientesPagRec
                TabOrder = 10
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox58KeyDown
              end
              object CheckBox88: TCheckBox
                Left = 110
                Top = 134
                Width = 119
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                OnClick = CheckBox88Click
              end
              object DBEdit34: TDBEdit
                Left = 687
                Top = 133
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsLocClientesPagRec
                Enabled = False
                TabOrder = 22
                Visible = False
              end
              object DBEdit35: TDBEdit
                Left = 687
                Top = 208
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocControlesPagRec
                Enabled = False
                TabOrder = 23
                Visible = False
              end
              object CheckBox90: TCheckBox
                Left = 60
                Top = 160
                Width = 169
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Origem Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 11
                OnClick = CheckBox90Click
              end
              object DBLookupComboBox60: TDBLookupComboBox
                Left = 235
                Top = 158
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocOrigControlesPagRec
                TabOrder = 12
                OnExit = DBLookupComboBox1Exit
              end
              object DBEdit37: TDBEdit
                Left = 687
                Top = 158
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocOrigControlesPagRec
                Enabled = False
                TabOrder = 24
                Visible = False
              end
              object ComboBox72: TComboBox
                Left = 235
                Top = 259
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 18
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox78: TComboBox
                Left = 541
                Top = 259
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 19
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
            end
          end
          object tbsRecebimentoCaixaAuxiliar: TTabSheet
            Caption = '(Caixa Auxiliar) Recebimentos'
            ImageIndex = 18
            OnShow = tbsRecebimentoCaixaAuxiliarShow
            object Panel32: TPanel
              Left = 0
              Top = 0
              Width = 784
              Height = 307
              Align = alClient
              TabOrder = 0
              object Label96: TLabel
                Left = 129
                Top = 11
                Width = 103
                Height = 13
                Caption = 'Tipo de Relat'#243'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label97: TLabel
                Left = 27
                Top = 40
                Width = 205
                Height = 13
                Caption = 'Codigo Operador CXL  (0 - TODOS):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbCodigoEmpUnificada4: TLabel
                Left = 3
                Top = 209
                Width = 227
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'digo Empresa Unificada (0 - TODAS):'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbAgruparUnificadas4: TLabel
                Left = 59
                Top = 239
                Width = 171
                Height = 13
                Alignment = taRightJustify
                Caption = 'Agrupar Empresas Unificadas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label98: TLabel
                Left = 92
                Top = 181
                Width = 137
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir detalhes pag/rec:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label102: TLabel
                Left = 393
                Top = 181
                Width = 143
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir totais por controle:'
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox73: TComboBox
                Left = 235
                Top = 8
                Width = 140
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'SINT'#201'TICO'
                OnExit = ComboBox73Exit
                Items.Strings = (
                  'SINT'#201'TICO'
                  'ANAL'#205'TICO')
              end
              object Edit1: TEdit
                Left = 235
                Top = 37
                Width = 173
                Height = 21
                TabOrder = 1
                Text = '0'
                OnKeyPress = edCodigoEmpUnificadaKeyPress
              end
              object edCodigoEmpUnificada4: TEdit
                Left = 234
                Top = 206
                Width = 140
                Height = 21
                TabOrder = 12
                Text = '0'
                OnKeyPress = edCodigoEmpUnificadaKeyPress
              end
              object cbAgruparUnificadas4: TComboBox
                Left = 234
                Top = 236
                Width = 140
                Height = 21
                Hint = 'Agrupar Empresas Unificadas'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 13
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'NAO')
              end
              object CheckBox92: TCheckBox
                Left = 122
                Top = 123
                Width = 105
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnClick = CheckBox92Click
              end
              object ComboBox75: TComboBox
                Left = 235
                Top = 121
                Width = 140
                Height = 21
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                Text = 'VEICULOS'
                Items.Strings = (
                  'VEICULOS'
                  'ECOMMERCE'
                  'BALCAO'
                  'SERVICOS'
                  'RECIBO ANTECIPADO'
                  'LANCAMENTO AVULSO'
                  'PRESTACOES')
              end
              object DBLookupComboBox62: TDBLookupComboBox
                Left = 235
                Top = 66
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsLocClientesRecCXL
                TabOrder = 3
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox58KeyDown
              end
              object CheckBox93: TCheckBox
                Left = 108
                Top = 67
                Width = 119
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
                OnClick = CheckBox93Click
              end
              object CheckBox94: TCheckBox
                Left = 58
                Top = 96
                Width = 169
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Origem Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                OnClick = CheckBox94Click
              end
              object DBLookupComboBox63: TDBLookupComboBox
                Left = 235
                Top = 94
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocOrigControlesRecCXL
                TabOrder = 5
                OnExit = DBLookupComboBox1Exit
              end
              object CheckBox95: TCheckBox
                Left = 101
                Top = 151
                Width = 126
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Controle:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
                OnClick = CheckBox95Click
              end
              object DBLookupComboBox64: TDBLookupComboBox
                Left = 235
                Top = 148
                Width = 446
                Height = 21
                Enabled = False
                KeyField = 'CODIGO_CTRL'
                ListField = 'NOME_CTRL'
                ListSource = dtmRelatorios.dsLocControlesRecCXL
                TabOrder = 9
                OnExit = DBLookupComboBox1Exit
              end
              object DBEdit39: TDBEdit
                Left = 685
                Top = 146
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocControlesRecCXL
                Enabled = False
                TabOrder = 14
                Visible = False
              end
              object DBEdit40: TDBEdit
                Left = 685
                Top = 66
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsLocClientesRecCXL
                Enabled = False
                TabOrder = 15
                Visible = False
              end
              object DBEdit41: TDBEdit
                Left = 685
                Top = 93
                Width = 67
                Height = 21
                DataField = 'CODIGO_CTRL'
                DataSource = dtmRelatorios.dsLocOrigControlesRecCXL
                Enabled = False
                TabOrder = 16
                Visible = False
              end
              object ComboBox74: TComboBox
                Left = 235
                Top = 177
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 10
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
              object ComboBox79: TComboBox
                Left = 541
                Top = 177
                Width = 140
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                Enabled = False
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                Text = 'SIM'
                Items.Strings = (
                  'SIM'
                  'N'#195'O')
              end
            end
          end
        end
      end
      object tbsGerenciais: TTabSheet
        Caption = 'tbsGerenciais'
        ImageIndex = 1
        object pageGerenciais: TPageControl
          Left = 0
          Top = 0
          Width = 798
          Height = 440
          ActivePage = tbsNotasEmitidasPorPeriodo
          Align = alClient
          MultiLine = True
          Style = tsFlatButtons
          TabOrder = 0
          OnChange = pageGerenciaisChange
          OnExit = pageGerenciaisExit
          object tbsNotasEmitidasPorPeriodo: TTabSheet
            Caption = 'Notas Emitidas por Per'#237'odo'
            OnShow = tbsNotasEmitidasPorPeriodoShow
            object Label8: TLabel
              Left = 81
              Top = 187
              Width = 72
              Height = 13
              Caption = 'Ordenar por:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label105: TLabel
              Left = 117
              Top = 22
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Exibir:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label107: TLabel
              Left = 26
              Top = 103
              Width = 127
              Height = 13
              Alignment = taRightJustify
              Caption = 'Exibir Total por CFOP:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label108: TLabel
              Left = 20
              Top = 131
              Width = 133
              Height = 13
              Alignment = taRightJustify
              Caption = 'Exibir Total NFCe/NFe:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label109: TLabel
              Left = 24
              Top = 159
              Width = 129
              Height = 13
              Alignment = taRightJustify
              Caption = 'Exibir Total Entr/Sa'#237'd:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object CheckBox29: TCheckBox
              Left = 56
              Top = 48
              Width = 110
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Filtrar por CFOP:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = CheckBox29Click
            end
            object DBLookupComboBox16: TDBLookupComboBox
              Left = 242
              Top = 46
              Width = 527
              Height = 21
              DropDownRows = 10
              Enabled = False
              KeyField = 'CODIGO_NOP'
              ListField = 'DESCRICAO_NOP;CODIGO_NOP'
              ListSource = dtmRelatorios.dsListaCFOP
              TabOrder = 3
              OnCloseUp = DBLookupComboBox16CloseUp
              OnExit = DBLookupComboBox1Exit
              OnKeyDown = DBLookupComboBox16KeyDown
              OnKeyUp = DBLookupComboBox16KeyUp
            end
            object edmCFOP: TEditMoeda
              Left = 169
              Top = 46
              Width = 69
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              TabOrder = 2
              FormatReal = fInteger
              FormatSize = '10.2'
              OnExit = edmCFOPExit
            end
            object CheckBox11: TCheckBox
              Left = 63
              Top = 74
              Width = 103
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Filtrar por Tipo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = CheckBox11Click
            end
            object ComboBox11: TComboBox
              Left = 169
              Top = 72
              Width = 298
              Height = 21
              Hint = 'Filtrar por Tipo de Nota Fiscal'
              Style = csDropDownList
              Enabled = False
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 5
              Text = 'PRODUTOS/SERVICOS'
              Items.Strings = (
                'PRODUTOS/SERVICOS'
                'VEICULOS'
                'OUTRAS NOTAS'
                'DESPESAS')
            end
            object ComboBox5: TComboBox
              Left = 169
              Top = 184
              Width = 298
              Height = 21
              Hint = 'Ordenar por campo desejado'
              Style = csDropDownList
              CharCase = ecUpperCase
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 9
              Text = 'CFOP'
              Items.Strings = (
                'CFOP'
                'NUM NF'
                'DATA')
            end
            object ComboBox82: TComboBox
              Left = 169
              Top = 19
              Width = 298
              Height = 21
              Hint = 'Exibir Ambas, NFe e NFCe'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'AMBAS (NFe / NFCe)'
              OnChange = ComboBox82Change
              OnExit = ComboBox82Exit
              Items.Strings = (
                'AMBAS (NFe / NFCe)'
                'NFe - NOTA FISCAL ELETR'#212'NICA'
                'NFCe - NOTA FISCAL DE CONSUMIDOR ELETR'#212'NICA')
            end
            object ComboBox84: TComboBox
              Left = 169
              Top = 100
              Width = 298
              Height = 21
              Hint = 'Total por CFOP'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              Text = 'N'#195'O'
              OnChange = ComboBox82Change
              OnExit = ComboBox82Exit
              Items.Strings = (
                'SIM'
                'N'#195'O')
            end
            object ComboBox85: TComboBox
              Left = 169
              Top = 128
              Width = 298
              Height = 21
              Hint = 'Exibir Total NFCe / NFe'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              Text = 'N'#195'O'
              OnChange = ComboBox82Change
              OnExit = ComboBox82Exit
              Items.Strings = (
                'SIM'
                'N'#195'O')
            end
            object ComboBox86: TComboBox
              Left = 169
              Top = 156
              Width = 298
              Height = 21
              Hint = 'Exibir Total Entrada / Sa'#237'da'
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              Text = 'SIM'
              OnChange = ComboBox82Change
              OnExit = ComboBox82Exit
              Items.Strings = (
                'SIM'
                'N'#195'O')
            end
          end
          object tbsProdutosComPendenciasEmOSREQ: TTabSheet
            Caption = 'Produtos com Pend'#234'ncias em Pedidos de Venda'
            ImageIndex = 1
            OnShow = tbsProdutosComPendenciasEmOSREQShow
          end
          object tbsRequisicoesEmitidasPorPeriodo: TTabSheet
            Caption = 'Requisi'#231#245'es Emitidas por Per'#237'odo'
            ImageIndex = 2
            OnShow = tbsRequisicoesEmitidasPorPeriodoShow
            object Panel21: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              object Label57: TLabel
                Left = 28
                Top = 18
                Width = 140
                Height = 13
                Caption = 'Situa'#231#227'o da Requisi'#231#227'o:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label84: TLabel
                Left = 21
                Top = 142
                Width = 147
                Height = 13
                Alignment = taRightJustify
                Caption = 'Raz'#227'o ou Nome Fantasia:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox40: TComboBox
                Left = 184
                Top = 15
                Width = 140
                Height = 21
                Hint = 'Status da Requisi'#231#227'o'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'AMBOS'
                Items.Strings = (
                  'AMBOS'
                  'ABERTA'
                  'FECHADA')
              end
              object DBLookupComboBox18: TDBLookupComboBox
                Left = 184
                Top = 45
                Width = 497
                Height = 21
                Enabled = False
                KeyField = 'COD_COND_PAG'
                ListField = 'DESC_COND_PAG;COD_COND_PAG'
                ListSource = dtmRelatorios.dsListaCondPag
                TabOrder = 2
                OnExit = DBLookupComboBox1Exit
              end
              object CheckBox31: TCheckBox
                Left = 6
                Top = 47
                Width = 175
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar Condi'#231#227'o Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox31Click
              end
              object DBEdit9: TDBEdit
                Left = 686
                Top = 45
                Width = 67
                Height = 21
                DataField = 'COD_COND_PAG'
                DataSource = dtmRelatorios.dsListaCondPag
                Enabled = False
                TabOrder = 3
                Visible = False
              end
              object CheckBox36: TCheckBox
                Left = 6
                Top = 76
                Width = 175
                Height = 20
                Alignment = taLeftJustify
                Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                OnClick = CheckBox36Click
              end
              object DBLookupComboBox21: TDBLookupComboBox
                Left = 184
                Top = 75
                Width = 497
                Height = 21
                Enabled = False
                KeyField = 'SIGLA'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipVnd
                TabOrder = 5
              end
              object CheckBox67: TCheckBox
                Left = 65
                Top = 107
                Width = 116
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnClick = CheckBox67Click
              end
              object DBLookupComboBox42: TDBLookupComboBox
                Left = 184
                Top = 105
                Width = 497
                Height = 21
                Hint = '[F3 - Pesquisar]'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsListaCliente
                TabOrder = 7
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox20KeyDown
              end
              object DBEdit25: TDBEdit
                Left = 686
                Top = 105
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsListaCliente
                Enabled = False
                TabOrder = 8
                Visible = False
              end
              object RadioGroupRouF1: TRadioGroup
                Left = 185
                Top = 131
                Width = 496
                Height = 31
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Raz'#227'o Social'
                  'Nome Fantasia')
                TabOrder = 9
              end
            end
          end
          object tbsOrdensDeServicosEmitidasPorPeriodo: TTabSheet
            Caption = 'Ordens de Servi'#231'os Emitidas por Per'#237'odo'
            ImageIndex = 3
            OnShow = tbsOrdensDeServicosEmitidasPorPeriodoShow
            object Panel22: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              TabOrder = 0
              object Label44: TLabel
                Left = 4
                Top = 18
                Width = 178
                Height = 13
                Caption = 'Situa'#231#227'o da Ordem de Servi'#231'o:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label85: TLabel
                Left = 35
                Top = 171
                Width = 147
                Height = 13
                Alignment = taRightJustify
                Caption = 'Raz'#227'o ou Nome Fantasia:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox52: TComboBox
                Left = 184
                Top = 15
                Width = 140
                Height = 21
                Hint = 'Status da OS'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'AMBOS'
                Items.Strings = (
                  'AMBOS'
                  'ABERTA'
                  'FECHADA')
              end
              object CheckBox30: TCheckBox
                Left = 72
                Top = 77
                Width = 123
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar OS por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                OnClick = CheckBox30Click
              end
              object DBLookupComboBox19: TDBLookupComboBox
                Left = 197
                Top = 75
                Width = 489
                Height = 21
                Enabled = False
                KeyField = 'TIPO_OS'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipoOS
                TabOrder = 5
              end
              object CheckBox45: TCheckBox
                Left = 20
                Top = 47
                Width = 175
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar Condi'#231#227'o Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox45Click
              end
              object DBLookupComboBox26: TDBLookupComboBox
                Left = 197
                Top = 45
                Width = 489
                Height = 21
                Enabled = False
                KeyField = 'COD_COND_PAG'
                ListField = 'DESC_COND_PAG;COD_COND_PAG'
                ListSource = dtmRelatorios.dsListaCondPag
                TabOrder = 2
                OnExit = DBLookupComboBox1Exit
              end
              object DBEdit15: TDBEdit
                Left = 690
                Top = 45
                Width = 67
                Height = 21
                DataField = 'COD_COND_PAG'
                DataSource = dtmRelatorios.dsListaCondPag
                Enabled = False
                TabOrder = 3
                Visible = False
              end
              object CheckBox52: TCheckBox
                Left = 42
                Top = 137
                Width = 153
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Area de Exec:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                OnClick = CheckBox52Click
              end
              object DBComboBox5: TDBComboBox
                Left = 198
                Top = 135
                Width = 488
                Height = 21
                Style = csDropDownList
                DataField = 'AREA_EXEC'
                DataSource = dtmRelatorios.dsLocAreaExec
                Enabled = False
                ItemHeight = 13
                TabOrder = 10
              end
              object CheckBox68: TCheckBox
                Left = 79
                Top = 107
                Width = 116
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnClick = CheckBox68Click
              end
              object DBLookupComboBox43: TDBLookupComboBox
                Left = 197
                Top = 105
                Width = 489
                Height = 21
                Hint = '[F3 - Pesquisar]'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsListaCliente
                TabOrder = 7
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox43KeyDown
              end
              object DBEdit26: TDBEdit
                Left = 690
                Top = 103
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsListaCliente
                Enabled = False
                TabOrder = 8
                Visible = False
              end
              object RadioGroupRouF2: TRadioGroup
                Left = 198
                Top = 160
                Width = 486
                Height = 31
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Raz'#227'o Social'
                  'Nome Fantasia')
                TabOrder = 11
              end
            end
          end
          object tbsRequisicoesOrdemServicoEmitidasPorPeriodo: TTabSheet
            Caption = 'Requisi'#231#245'es e Ordens de Servico Emitidas Por Per'#237'odo'
            ImageIndex = 29
            OnShow = tbsRequisicoesOrdemServicoEmitidasPorPeriodoShow
            object Panel28: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object Label81: TLabel
                Left = 12
                Top = 5
                Width = 171
                Height = 13
                Alignment = taRightJustify
                Caption = 'Situa'#231#227'o da Requisi'#231#227'o / OS:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label82: TLabel
                Left = 115
                Top = 180
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir Itens:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label83: TLabel
                Left = 32
                Top = 210
                Width = 151
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir Credi'#225'rio em Aberto:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label86: TLabel
                Left = 35
                Top = 246
                Width = 147
                Height = 13
                Alignment = taRightJustify
                Caption = 'Raz'#227'o ou Nome Fantasia:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox34: TComboBox
                Left = 184
                Top = 2
                Width = 140
                Height = 21
                Hint = 'Status REQ e OS'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'AMBOS'
                Items.Strings = (
                  'AMBOS'
                  'ABERTA'
                  'FECHADA')
              end
              object CheckBox69: TCheckBox
                Left = 71
                Top = 95
                Width = 124
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar OS por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox69Click
              end
              object DBLookupComboBox44: TDBLookupComboBox
                Left = 200
                Top = 92
                Width = 489
                Height = 21
                Enabled = False
                KeyField = 'TIPO_OS'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipoOS
                TabOrder = 2
              end
              object CheckBox70: TCheckBox
                Left = 20
                Top = 34
                Width = 175
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar Condi'#231#227'o Pagamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
                OnClick = CheckBox70Click
              end
              object DBLookupComboBox45: TDBLookupComboBox
                Left = 200
                Top = 32
                Width = 489
                Height = 21
                Enabled = False
                KeyField = 'COD_COND_PAG'
                ListField = 'DESC_COND_PAG;COD_COND_PAG'
                ListSource = dtmRelatorios.dsListaCondPag
                TabOrder = 4
                OnExit = DBLookupComboBox1Exit
              end
              object DBEdit27: TDBEdit
                Left = 695
                Top = 32
                Width = 67
                Height = 21
                DataField = 'COD_COND_PAG'
                DataSource = dtmRelatorios.dsListaCondPag
                Enabled = False
                TabOrder = 5
                Visible = False
              end
              object CheckBox71: TCheckBox
                Left = 41
                Top = 151
                Width = 154
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Area de Exec:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnClick = CheckBox71Click
              end
              object DBComboBox6: TDBComboBox
                Left = 200
                Top = 149
                Width = 489
                Height = 21
                Style = csDropDownList
                DataField = 'AREA_EXEC'
                DataSource = dtmRelatorios.dsLocAreaExec
                Enabled = False
                ItemHeight = 13
                TabOrder = 7
              end
              object CheckBox72: TCheckBox
                Left = 78
                Top = 123
                Width = 117
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
                OnClick = CheckBox72Click
              end
              object DBLookupComboBox46: TDBLookupComboBox
                Left = 200
                Top = 121
                Width = 489
                Height = 21
                Hint = '[F3 - Pesquisar]'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsListaCliente
                TabOrder = 9
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox46KeyDown
              end
              object DBEdit28: TDBEdit
                Left = 695
                Top = 121
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsListaCliente
                Enabled = False
                TabOrder = 10
                Visible = False
              end
              object CheckBox73: TCheckBox
                Left = 19
                Top = 66
                Width = 176
                Height = 20
                Alignment = taLeftJustify
                Caption = 'Filtrar Requisi'#231#245'es por Tipo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 11
                OnClick = CheckBox73Click
              end
              object DBLookupComboBox47: TDBLookupComboBox
                Left = 200
                Top = 65
                Width = 489
                Height = 21
                Enabled = False
                KeyField = 'SIGLA'
                ListField = 'DESCRICAO'
                ListSource = dtmRelatorios.dsLocTipVnd
                TabOrder = 12
              end
              object ComboBox60: TComboBox
                Left = 197
                Top = 177
                Width = 140
                Height = 21
                Hint = 'Exibir Itens'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 13
                Text = 'N'#195'O'
                Items.Strings = (
                  'N'#195'O'
                  'SIM')
              end
              object ComboBox61: TComboBox
                Left = 197
                Top = 207
                Width = 140
                Height = 21
                Hint = 'Exibir Itens'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 14
                Text = 'N'#195'O'
                Items.Strings = (
                  'N'#195'O'
                  'SIM')
              end
              object RadioGroupRouF3: TRadioGroup
                Left = 197
                Top = 235
                Width = 527
                Height = 31
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Raz'#227'o Social'
                  'Nome Fantasia')
                TabOrder = 15
              end
            end
          end
          object tbsRecibos: TTabSheet
            Caption = 'Recibos'
            ImageIndex = 5
            OnShow = tbsRecibosShow
            object pageRecibos: TPageControl
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              ActivePage = tbsRecibosEmitidos
              Align = alClient
              Style = tsButtons
              TabOrder = 0
              object tbsRecibosEmitidos: TTabSheet
                Caption = 'Recibos Emitidos'
                OnShow = tbsRecibosEmitidosShow
                object Panel27: TPanel
                  Left = 0
                  Top = 0
                  Width = 782
                  Height = 210
                  Align = alClient
                  ParentBackground = False
                  TabOrder = 0
                  object Label63: TLabel
                    Left = 148
                    Top = 13
                    Width = 30
                    Height = 13
                    Caption = 'Tipo:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label62: TLabel
                    Left = 87
                    Top = 37
                    Width = 84
                    Height = 13
                    Caption = 'Departamento:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object ComboBox56: TComboBox
                    Left = 184
                    Top = 10
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    ItemHeight = 13
                    ItemIndex = 0
                    TabOrder = 0
                    Text = 'CONFIRMADO'
                    Items.Strings = (
                      'CONFIRMADO'
                      'N'#195'O CONFIRMADO')
                  end
                  object ComboBox57: TComboBox
                    Left = 184
                    Top = 34
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    ItemHeight = 13
                    ItemIndex = 0
                    TabOrder = 1
                    Text = 'TODOS'
                    Items.Strings = (
                      'TODOS'
                      'ESTOQUE'
                      'OFICINA'
                      'VENDAS')
                  end
                end
              end
              object tbsInventarioRec: TTabSheet
                Caption = 'Invent'#225'rio dos Recibos'
                ImageIndex = 1
                OnShow = tbsInventarioRecShow
                object Panel26: TPanel
                  Left = 0
                  Top = 0
                  Width = 782
                  Height = 210
                  Align = alClient
                  ParentBackground = False
                  TabOrder = 0
                  object Label65: TLabel
                    Left = 80
                    Top = 17
                    Width = 98
                    Height = 13
                    Caption = 'Data Refer'#234'ncia:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label66: TLabel
                    Left = 87
                    Top = 40
                    Width = 84
                    Height = 13
                    Caption = 'Departamento:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object MaskEdit8: TMaskEdit
                    Left = 184
                    Top = 9
                    Width = 68
                    Height = 21
                    EditMask = '!99/99/0000;1;_'
                    MaxLength = 10
                    TabOrder = 0
                    Text = '  /  /    '
                  end
                  object ComboBox58: TComboBox
                    Left = 184
                    Top = 36
                    Width = 145
                    Height = 21
                    ItemHeight = 13
                    ItemIndex = 0
                    TabOrder = 1
                    Text = 'TODOS'
                    Items.Strings = (
                      'TODOS'
                      'ESTOQUE'
                      'OFICINA'
                      'VENDAS')
                  end
                end
              end
              object tbsHistoricoRecibos: TTabSheet
                Caption = 'Hist'#243'ricos dos Recibos'
                ImageIndex = 2
                OnShow = tbsHistoricoRecibosShow
                object Panel25: TPanel
                  Left = 0
                  Top = 0
                  Width = 782
                  Height = 210
                  Align = alClient
                  ParentBackground = False
                  TabOrder = 0
                  object Label61: TLabel
                    Left = 87
                    Top = 22
                    Width = 84
                    Height = 13
                    Caption = 'Departamento:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object ComboBox59: TComboBox
                    Left = 184
                    Top = 19
                    Width = 145
                    Height = 21
                    Enabled = False
                    ItemHeight = 13
                    ItemIndex = 0
                    TabOrder = 0
                    Text = 'TODOS'
                    Items.Strings = (
                      'TODOS'
                      'ESTOQUE'
                      'OFICINA'
                      'VENDAS')
                  end
                end
              end
            end
          end
          object tbsListaDeAlteracaoDePreco: TTabSheet
            Caption = 'Lista de Altera'#231#227'o de Pre'#231'os'
            ImageIndex = 6
            OnShow = tbsListaDeAlteracaoDePrecoShow
            object Panel23: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              TabOrder = 0
              object Label58: TLabel
                Left = 24
                Top = 18
                Width = 158
                Height = 13
                Caption = 'Op'#231#227'o para lista de pre'#231'os:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox54: TComboBox
                Left = 184
                Top = 15
                Width = 393
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'LISTA POR ENTRADA DE PRODUTOS'
                Items.Strings = (
                  'LISTA POR ENTRADA DE PRODUTOS'
                  'LISTA DE PRE'#199'O POR ALTERA'#199#195'O')
              end
            end
          end
          object tbsRelatoriosdeVendasPlacaCliente: TTabSheet
            Caption = 'Relat'#243'rio de vendas por Placa/Cliente'
            ImageIndex = 7
            OnShow = tbsRelatoriosdeVendasPlacaClienteShow
            object Panel24: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              OnEnter = Panel24Enter
              object Label60: TLabel
                Left = 17
                Top = 94
                Width = 163
                Height = 13
                Caption = 'Situa'#231#227'o da Requisi'#231#227'o/OS:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object labelperiodo: TLabel
                Left = 184
                Top = 156
                Width = 72
                Height = 13
                Alignment = taCenter
                Caption = 'Per'#237'odo de: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox55: TComboBox
                Left = 184
                Top = 91
                Width = 140
                Height = 21
                Hint = 'Status da REQ e OS'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'AMBOS'
                Items.Strings = (
                  'AMBOS'
                  'ABERTA'
                  'FECHADA')
              end
              object DBLookupComboBox20: TDBLookupComboBox
                Left = 184
                Top = 124
                Width = 489
                Height = 21
                Hint = '[F3 - Pesquisar]'
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsListaCliente
                TabOrder = 2
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox20KeyDown
              end
              object CheckBox32: TCheckBox
                Left = 63
                Top = 125
                Width = 117
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox32Click
              end
              object DBEdit10: TDBEdit
                Left = 677
                Top = 124
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsListaCliente
                Enabled = False
                TabOrder = 3
                Visible = False
              end
              object CheckBox33: TCheckBox
                Left = 42
                Top = 15
                Width = 138
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Exibir Vendas Balc'#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                OnClick = CheckBox33Click
              end
              object CheckBox34: TCheckBox
                Left = 63
                Top = 42
                Width = 117
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Exibir Vendas OS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                OnClick = CheckBox34Click
              end
              object CheckBox35: TCheckBox
                Left = 74
                Top = 155
                Width = 106
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnClick = CheckBox35Click
              end
              object CheckBox37: TCheckBox
                Left = 74
                Top = 186
                Width = 106
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por placa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                OnClick = CheckBox37Click
              end
              object MaskEdit5: TMaskEdit
                Left = 184
                Top = 184
                Width = 121
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 8
                Text = 'MASKEDIT5'
              end
              object CheckBox6: TCheckBox
                Left = 17
                Top = 65
                Width = 163
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Exibir Apenas DAVs ORC'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 9
                OnClick = CheckBox6Click
              end
            end
          end
          object tbsRelatoriodeVendasObjetoCliente: TTabSheet
            Caption = 'Relat'#243'rio de vendas por Objeto/Cliente'
            ImageIndex = 8
            OnShow = tbsRelatoriodeVendasObjetoClienteShow
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              ParentBackground = False
              TabOrder = 0
              OnEnter = Panel1Enter
              object Label1: TLabel
                Left = 17
                Top = 73
                Width = 163
                Height = 13
                Caption = 'Situa'#231#227'o da Requisi'#231#227'o/OS:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object labelPeriodo1: TLabel
                Left = 184
                Top = 135
                Width = 72
                Height = 13
                Alignment = taCenter
                Caption = 'Per'#237'odo de: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox1: TComboBox
                Left = 184
                Top = 70
                Width = 140
                Height = 21
                Hint = 'Status da REQ e OS'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'AMBOS'
                Items.Strings = (
                  'AMBOS'
                  'ABERTA'
                  'FECHADA')
              end
              object DBLookupComboBox22: TDBLookupComboBox
                Left = 184
                Top = 102
                Width = 497
                Height = 21
                Hint = '[F3 - Pesquisar]'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsListaCliente
                TabOrder = 2
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox22KeyDown
              end
              object CheckBox1: TCheckBox
                Left = 63
                Top = 104
                Width = 117
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox1Click
              end
              object DBEdit11: TDBEdit
                Left = 686
                Top = 102
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsListaCliente
                Enabled = False
                TabOrder = 3
                Visible = False
              end
              object CheckBox2: TCheckBox
                Left = 42
                Top = 15
                Width = 138
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Exibir Vendas Balc'#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                OnClick = CheckBox33Click
              end
              object CheckBox3: TCheckBox
                Left = 63
                Top = 42
                Width = 117
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Exibir Vendas OS'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 5
                OnClick = CheckBox34Click
              end
              object CheckBox4: TCheckBox
                Left = 74
                Top = 134
                Width = 106
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
                OnClick = CheckBox35Click
              end
              object CheckBox5: TCheckBox
                Left = 68
                Top = 165
                Width = 112
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por objeto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                OnClick = CheckBox5Click
              end
              object DBLookupComboBox23: TDBLookupComboBox
                Left = 184
                Top = 163
                Width = 497
                Height = 21
                Hint = '[F3 - Pesquisar]'
                Enabled = False
                KeyField = 'COD_EQUIP'
                ListField = 'NOM_EQUIP;COD_EQUIP'
                ListSource = dtmRelatorios.dsListaEquip
                TabOrder = 8
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox23KeyDown
              end
              object DBEdit12: TDBEdit
                Left = 686
                Top = 163
                Width = 67
                Height = 21
                DataField = 'COD_EQUIP'
                DataSource = dtmRelatorios.dsListaEquip
                Enabled = False
                TabOrder = 9
                Visible = False
              end
            end
          end
          object tbsRelatorioApuracaoICMS: TTabSheet
            Caption = 'Relat'#243'rio Apura'#231#227'o de ICMS'
            ImageIndex = 8
            OnShow = tbsRelatorioApuracaoICMSShow
            object Label6: TLabel
              Left = 77
              Top = 11
              Width = 103
              Height = 13
              Caption = 'Tipo de Relat'#243'rio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 111
              Top = 64
              Width = 69
              Height = 13
              Caption = 'Saldo Anterior:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 105
              Top = 88
              Width = 75
              Height = 13
              Caption = 'Outros Cr'#233'ditos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 107
              Top = 112
              Width = 73
              Height = 13
              Caption = 'Outros Debitos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 70
              Top = 37
              Width = 110
              Height = 13
              Caption = 'Modelo Pontilhado:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object ComboBox3: TComboBox
              Left = 186
              Top = 8
              Width = 140
              Height = 21
              Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
              Style = csDropDownList
              CharCase = ecUpperCase
              ItemHeight = 13
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = 'SINT'#201'TICO'
              OnExit = ComboBox3Exit
              Items.Strings = (
                'SINT'#201'TICO'
                'ENTRADA'
                'SA'#205'DA')
            end
            object EditHw1: TEditHw
              Left = 186
              Top = 61
              Width = 121
              Height = 21
              TabOrder = 1
              Text = '                                   0'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object EditHw2: TEditHw
              Left = 186
              Top = 85
              Width = 121
              Height = 21
              TabOrder = 2
              Text = '                                   0'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object EditHw3: TEditHw
              Left = 186
              Top = 109
              Width = 121
              Height = 21
              TabOrder = 3
              Text = '                                   0'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object ComboBox6: TComboBox
              Left = 186
              Top = 35
              Width = 140
              Height = 21
              Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
              Style = csDropDownList
              CharCase = ecUpperCase
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Text = 'SIM'
              Visible = False
              OnExit = ComboBox3Exit
              Items.Strings = (
                'N'#195'O'
                'SIM')
            end
          end
          object tbsRelatorioVeiculosNegociados: TTabSheet
            Caption = 'Relat'#243'rio Ve'#237'culos Negociados'
            ImageIndex = 9
            OnShow = tbsRelatorioVeiculosNegociadosShow
            object Label14: TLabel
              Left = 57
              Top = 101
              Width = 84
              Height = 13
              Caption = 'Departamento:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object CheckBox8: TCheckBox
              Left = 23
              Top = 75
              Width = 136
              Height = 17
              Hint = 'Filtrar vendedor - [REL046]'
              Alignment = taLeftJustify
              Caption = 'Filtrar por Vendedor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = CheckBox8Click
            end
            object DBLookupComboBox24: TDBLookupComboBox
              Left = 163
              Top = 73
              Width = 527
              Height = 21
              Enabled = False
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
              ListSource = dtmRelatorios.dsLocColab
              TabOrder = 5
            end
            object DBEdit13: TDBEdit
              Left = 691
              Top = 73
              Width = 67
              Height = 21
              DataField = 'COD_VENDEDOR'
              DataSource = dtmRelatorios.dsLocColab
              Enabled = False
              TabOrder = 6
              Visible = False
            end
            object ComboBox8: TComboBox
              Left = 163
              Top = 21
              Width = 147
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              Text = 'AV'
              Items.Strings = (
                'AV'
                'CDCP'
                'CP'
                'CT'
                'CTR'
                'CTA'
                'CTV'
                'CNH'
                'CDCT'
                'CC'
                'PP'
                'LSG')
            end
            object ComboBox9: TComboBox
              Left = 163
              Top = 48
              Width = 147
              Height = 21
              ItemHeight = 13
              TabOrder = 3
              Text = 'NOVO'
              Items.Strings = (
                'NOVO'
                'USADO')
            end
            object CheckBox9: TCheckBox
              Left = 53
              Top = 23
              Width = 106
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Tipo de Venda:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox9Click
            end
            object CheckBox10: TCheckBox
              Left = 44
              Top = 49
              Width = 115
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Tipo de Ve'#237'culo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = CheckBox10Click
            end
            object ComboBox10: TComboBox
              Left = 163
              Top = 100
              Width = 147
              Height = 21
              ItemHeight = 13
              TabOrder = 7
              Text = 'TODOS'
              Visible = False
              Items.Strings = (
                'TODOS'
                'ESTOQUE'
                'OFICINA'
                'VENDAS')
            end
          end
          object tbsRelatorioVeiculosemDemonstracao: TTabSheet
            Caption = 'Relat'#243'rio Ve'#237'culos em Demonstra'#231#227'o'
            ImageIndex = 10
            OnShow = tbsRelatorioVeiculosemDemonstracaoShow
            object Label15: TLabel
              Left = 38
              Top = 21
              Width = 103
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo de Relat'#243'rio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object CheckBox38: TCheckBox
              Left = 53
              Top = 47
              Width = 106
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Tipo de Venda:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = CheckBox38Click
            end
            object ComboBox12: TComboBox
              Left = 163
              Top = 45
              Width = 147
              Height = 21
              Enabled = False
              ItemHeight = 13
              TabOrder = 2
              Text = 'AV'
              Items.Strings = (
                'AV'
                'CDCP'
                'CP'
                'CT'
                'CTR'
                'CTA'
                'CTV'
                'CNH'
                'CDCT'
                'CC'
                'PP'
                'LSG')
            end
            object ComboBox13: TComboBox
              Left = 163
              Top = 18
              Width = 147
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'N'#195'O FATURADAS'
              Items.Strings = (
                'N'#195'O FATURADAS'
                'VENDIDOS')
            end
          end
          object tbsRelatorioAcompanhamentodeVeiculo: TTabSheet
            Caption = 'Relat'#243'rio Acompanhamento de Ve'#237'culo'
            ImageIndex = 11
            OnShow = tbsRelatorioAcompanhamentodeVeiculoShow
          end
          object tbsRelatorioPosicaodeEstoqueVeiculos: TTabSheet
            Caption = 'Relat'#243'rio Posi'#231#227'o de Estoque Ve'#237'culos'
            ImageIndex = 12
            OnShow = tbsRelatorioPosicaodeEstoqueVeiculosShow
            object Panel2: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              BiDiMode = bdLeftToRight
              Caption = 'Digite a Quantidade a Faturar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBiDiMode = False
              ParentFont = False
              TabOrder = 0
            end
            object Panel3: TPanel
              Left = 0
              Top = 41
              Width = 790
              Height = 150
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel3'
              TabOrder = 1
              object DBGrid2: TDBGrid
                Left = 0
                Top = 0
                Width = 790
                Height = 150
                Align = alClient
                DataSource = dtmRelatorios.Dt99
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnColEnter = DBGrid2ColEnter
                OnColExit = DBGrid2ColExit
                OnTitleClick = DBGrid2TitleClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CODIGO'
                    Title.Caption = 'Codigo'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'Descricao'
                    Width = 280
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESFAB'
                    Title.Caption = 'Descr Fabr'
                    Width = 280
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AFATURAR'
                    Title.Caption = 'A faturar'
                    Visible = True
                  end>
              end
            end
            object RadioGroup1: TRadioGroup
              Left = 0
              Top = 191
              Width = 790
              Height = 50
              Align = alBottom
              ItemIndex = 0
              Items.Strings = (
                'Estoque sem Reservadas'
                'Estoque sem Vendidas N'#227'o Faturadas')
              TabOrder = 2
            end
          end
          object tbsRelatorioVeiculosemTransito: TTabSheet
            Caption = 'Relat'#243'rio Ve'#237'culos em Tr'#226'nsito'
            ImageIndex = 13
            OnShow = tbsRelatorioVeiculosemTransitoShow
            object Label16: TLabel
              Left = 116
              Top = 21
              Width = 41
              Height = 13
              Caption = 'Status:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object ComboBox14: TComboBox
              Left = 163
              Top = 18
              Width = 147
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'AMBOS'
              Items.Strings = (
                'AMBOS'
                'RESERVADA'
                'N'#195'O RESERVADA')
            end
          end
          object tbsRelatorioDiarioDiretoria: TTabSheet
            Caption = 'Relat'#243'rio Di'#225'rio Diretoria'
            ImageIndex = 14
            OnShow = tbsRelatorioDiarioDiretoriaShow
            object Label17: TLabel
              Left = 112
              Top = 37
              Width = 68
              Height = 13
              Caption = 'Qtde Cotas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EditHw4: TEditHw
              Left = 186
              Top = 34
              Width = 121
              Height = 21
              TabOrder = 0
              Text = '                                   0'
              Formato = fNumber
              FormatSize = '0.2'
            end
          end
          object tbsInventarioVeiculos: TTabSheet
            Caption = 'Invent'#225'rio de Ve'#237'culos'
            ImageIndex = 15
            OnShow = tbsInventarioVeiculosShow
            object Label18: TLabel
              Left = 107
              Top = 46
              Width = 73
              Height = 13
              Caption = 'Valor Pe'#231'as:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 68
              Top = 77
              Width = 112
              Height = 13
              Caption = 'Tipo de Cabe'#231'alho:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label20: TLabel
              Left = 94
              Top = 107
              Width = 86
              Height = 13
              Caption = 'P'#225'gina Inicial::'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 93
              Top = 138
              Width = 87
              Height = 13
              Caption = '% Acres/Decr.:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 82
              Top = 12
              Width = 98
              Height = 13
              Caption = 'Data Refer'#234'ncia:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EditHw5: TEditHw
              Left = 186
              Top = 43
              Width = 121
              Height = 21
              TabOrder = 1
              Text = '                                   0'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object ComboBox15: TComboBox
              Left = 186
              Top = 74
              Width = 121
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 2
              Text = 'Geral'
              Items.Strings = (
                'Geral'
                'Cont'#225'bil')
            end
            object EditHw6: TEditHw
              Left = 186
              Top = 104
              Width = 121
              Height = 21
              TabOrder = 3
              Text = '                                   0'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object EditHw7: TEditHw
              Left = 186
              Top = 135
              Width = 121
              Height = 21
              TabOrder = 4
              Text = '                                   0'
              Formato = fNumber
              FormatSize = '0.2'
            end
            object CheckBox39: TCheckBox
              Left = 311
              Top = 137
              Width = 97
              Height = 17
              Caption = '(Divis'#227'o)'
              TabOrder = 5
            end
            object CheckBox40: TCheckBox
              Left = 186
              Top = 168
              Width = 97
              Height = 17
              Caption = 'Com Status'
              TabOrder = 6
            end
            object CheckBox41: TCheckBox
              Left = 186
              Top = 191
              Width = 97
              Height = 17
              Caption = 'Ve'#237'culo Novo'
              TabOrder = 7
            end
            object CheckBox42: TCheckBox
              Left = 186
              Top = 214
              Width = 97
              Height = 17
              Caption = 'Ve'#237'culo Usado'
              TabOrder = 8
            end
            object CheckBox43: TCheckBox
              Left = 186
              Top = 237
              Width = 97
              Height = 17
              Caption = 'Gravar Tipo 74'
              TabOrder = 9
            end
            object MaskEdit3: TMaskEdit
              Left = 186
              Top = 9
              Width = 80
              Height = 21
              EditMask = '!99/99/0000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 10
              ParentFont = False
              TabOrder = 0
              Text = '01/08/2011'
              OnExit = MaskEdit1Exit
            end
          end
          object tsbRelatorioSituacaodoEstoqueFechado: TTabSheet
            Caption = 'Relat'#243'rio Situa'#231#227'o do Estoque Fechado'
            ImageIndex = 16
            OnShow = tsbRelatorioSituacaodoEstoqueFechadoShow
            object Label21: TLabel
              Left = 77
              Top = 64
              Width = 72
              Height = 13
              Caption = 'Ordenar por:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object CheckBox44: TCheckBox
              Left = 30
              Top = 32
              Width = 136
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Filtrar por Vendedor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox44Click
            end
            object DBLookupComboBox25: TDBLookupComboBox
              Left = 172
              Top = 30
              Width = 509
              Height = 21
              Enabled = False
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
              ListSource = dtmRelatorios.dsLocColab
              TabOrder = 1
              OnExit = DBLookupComboBox1Exit
            end
            object DBEdit14: TDBEdit
              Left = 685
              Top = 30
              Width = 67
              Height = 21
              DataField = 'COD_VENDEDOR'
              DataSource = dtmRelatorios.dsLocColab
              Enabled = False
              TabOrder = 2
              Visible = False
            end
            object ComboBox16: TComboBox
              Left = 172
              Top = 61
              Width = 140
              Height = 21
              Hint = 'Ordenar por campo desejado'
              Style = csDropDownList
              CharCase = ecUpperCase
              ItemHeight = 13
              ItemIndex = 1
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Text = 'DESCRICAO'
              Items.Strings = (
                'CODIGO'
                'DESCRICAO'
                'LOCACAO'
                'LOCACAO2'
                'DATA')
            end
          end
          object tbsRelatorioVeiculosPagosAntecipados: TTabSheet
            Caption = 'Relat'#243'rio Ve'#237'culos Pagos Antecipados'
            ImageIndex = 17
            OnShow = tbsRelatorioVeiculosPagosAntecipadosShow
          end
          object tbsRelatorioVeiculosQueChegaramAntesDoPagamento: TTabSheet
            Caption = 'Relat'#243'rio Ve'#237'culos que Chegaram antes do Pagamento'
            ImageIndex = 18
            OnShow = tbsRelatorioVeiculosQueChegaramAntesDoPagamentoShow
            object Label24: TLabel
              Left = 14
              Top = 20
              Width = 69
              Height = 13
              Caption = 'Data Limite:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MaskEdit6: TMaskEdit
              Left = 89
              Top = 17
              Width = 80
              Height = 21
              EditMask = '!99/99/0000;1;_'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MaxLength = 10
              ParentFont = False
              TabOrder = 0
              Text = '01/08/2011'
              OnExit = MaskEdit1Exit
            end
          end
          object tbsRelatorioFaturamentodeVeiculos: TTabSheet
            Caption = 'Relat'#243'rio Faturamento de Ve'#237'culos'
            ImageIndex = 19
            OnShow = tbsRelatorioFaturamentodeVeiculosShow
            object CheckBox46: TCheckBox
              Left = 23
              Top = 21
              Width = 136
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Filtrar por Vendedor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = CheckBox46Click
            end
            object DBLookupComboBox27: TDBLookupComboBox
              Left = 165
              Top = 19
              Width = 508
              Height = 21
              Enabled = False
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
              ListSource = dtmRelatorios.dsLocColab
              TabOrder = 1
              OnExit = DBLookupComboBox1Exit
            end
            object DBEdit16: TDBEdit
              Left = 677
              Top = 19
              Width = 67
              Height = 21
              DataField = 'COD_VENDEDOR'
              DataSource = dtmRelatorios.dsLocColab
              Enabled = False
              TabOrder = 2
              Visible = False
            end
            object ckGerente: TCheckBox
              Left = 146
              Top = 48
              Width = 97
              Height = 17
              Caption = 'Gerente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = ckGerenteClick
            end
            object ckConcessionaria: TCheckBox
              Left = 314
              Top = 105
              Width = 127
              Height = 17
              Caption = 'Concession'#225'ria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
              OnClick = ckConcessionariaClick
            end
            object ckEstoque: TCheckBox
              Left = 146
              Top = 82
              Width = 97
              Height = 17
              Caption = 'Estoque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = ckEstoqueClick
            end
            object ckConsignado: TCheckBox
              Left = 314
              Top = 82
              Width = 97
              Height = 17
              Caption = 'Consignado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              OnClick = ckConsignadoClick
            end
            object ckIntermediacao: TCheckBox
              Left = 474
              Top = 82
              Width = 103
              Height = 17
              Caption = 'Intermedia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
              OnClick = ckIntermediacaoClick
            end
            object ckEstoqueReal: TCheckBox
              Left = 146
              Top = 105
              Width = 97
              Height = 17
              Caption = 'Estoque Real'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
              OnClick = ckEstoqueRealClick
            end
          end
          object tbsRelatorioparaGerenciaVeiculos: TTabSheet
            Caption = 'Relat'#243'rio para Ger'#234'ncia de Ve'#237'culos'
            ImageIndex = 20
            OnShow = tbsRelatorioparaGerenciaVeiculosShow
            object ckEstoque2: TCheckBox
              Left = 146
              Top = 36
              Width = 97
              Height = 17
              Caption = 'Estoque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = ckEstoque2Click
            end
            object ckConsignado2: TCheckBox
              Left = 314
              Top = 36
              Width = 97
              Height = 17
              Caption = 'Consignado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = ckConsignado2Click
            end
            object ckIntermediacao2: TCheckBox
              Left = 474
              Top = 36
              Width = 103
              Height = 17
              Caption = 'Intermedia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = ckIntermediacao2Click
            end
            object ckGerente2: TCheckBox
              Left = 146
              Top = 13
              Width = 97
              Height = 17
              Caption = 'Gerente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
          object tbsRelatorioTabeladePrecosVeiculos: TTabSheet
            Caption = 'Relat'#243'rio Tabela de Pre'#231'os Ve'#237'culos'
            ImageIndex = 21
            OnShow = tbsRelatorioTabeladePrecosVeiculosShow
            object Label25: TLabel
              Left = 104
              Top = 16
              Width = 36
              Height = 13
              Caption = 'Marca'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object ckEstoque3: TCheckBox
              Left = 146
              Top = 36
              Width = 97
              Height = 17
              Caption = 'Estoque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = ckEstoque3Click
            end
            object ckConsignado3: TCheckBox
              Left = 314
              Top = 36
              Width = 97
              Height = 17
              Caption = 'Consignado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = ckConsignado3Click
            end
            object ckIntermediacao3: TCheckBox
              Left = 474
              Top = 36
              Width = 103
              Height = 17
              Caption = 'Intermedia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = ckIntermediacao3Click
            end
            object cbMarca: TComboBox
              Left = 146
              Top = 11
              Width = 559
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = 'TODOS'
              Items.Strings = (
                'TODOS')
            end
          end
          object tbsRelatorioRecebimentodeVeiculos: TTabSheet
            Caption = 'Relat'#243'rio Recebimento de Ve'#237'culos'
            ImageIndex = 22
            OnShow = tbsRelatorioRecebimentodeVeiculosShow
          end
          object tbsRelatorioDespesasdeVeiculos: TTabSheet
            Caption = 'Relat'#243'rio Despesas de Ve'#237'culos'
            ImageIndex = 23
            OnShow = tbsRelatorioDespesasdeVeiculosShow
            object Label29: TLabel
              Left = 56
              Top = 66
              Width = 83
              Height = 13
              Caption = 'Pesquisar Por:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object ckEstoque4: TCheckBox
              Left = 146
              Top = 12
              Width = 97
              Height = 17
              Caption = 'Estoque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = ckEstoque3Click
            end
            object ckConsignado4: TCheckBox
              Left = 314
              Top = 12
              Width = 97
              Height = 17
              Caption = 'Consignado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = ckConsignado3Click
            end
            object ckIntermediacao4: TCheckBox
              Left = 474
              Top = 12
              Width = 103
              Height = 17
              Caption = 'Intermedia'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = ckIntermediacao3Click
            end
            object ckConcessionaria4: TCheckBox
              Left = 146
              Top = 35
              Width = 135
              Height = 17
              Caption = 'Concession'#225'ria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = ckEstoque3Click
            end
            object ComboBox18: TComboBox
              Left = 145
              Top = 63
              Width = 160
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 4
              Text = 'DATA CADASTRO'
              Items.Strings = (
                'DATA CADASTRO'
                'DATA VENCIMENTO'
                'DATA QUITACAO')
            end
          end
          object tbsRelatorioPendenciasdeVeiculos: TTabSheet
            Caption = 'Relat'#243'rio Pend'#234'ncias de Ve'#237'culos'
            ImageIndex = 24
            OnShow = tbsRelatorioPendenciasdeVeiculosShow
            object Label26: TLabel
              Left = 117
              Top = 12
              Width = 42
              Height = 13
              Caption = 'Chassi:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label27: TLabel
              Left = 422
              Top = 12
              Width = 37
              Height = 13
              Caption = 'Placa:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 72
              Top = 111
              Width = 83
              Height = 13
              Caption = 'Pesquisar Por:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EditChassi: TEdit
              Left = 162
              Top = 9
              Width = 242
              Height = 21
              MaxLength = 17
              TabOrder = 0
              Text = 'EditChassi'
            end
            object EditPlaca: TEdit
              Left = 465
              Top = 9
              Width = 99
              Height = 21
              MaxLength = 17
              TabOrder = 1
              Text = 'EditPlaca'
            end
            object CheckBox47: TCheckBox
              Left = 6
              Top = 38
              Width = 149
              Height = 17
              Hint = 'Filtrar colaborador - [REL044]'
              Alignment = taLeftJustify
              Caption = 'Filtrar por Funcion'#225'rio:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = CheckBox47Click
            end
            object DBLookupComboBox28: TDBLookupComboBox
              Left = 161
              Top = 36
              Width = 480
              Height = 21
              Enabled = False
              KeyField = 'COD_VENDEDOR'
              ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
              ListSource = dtmRelatorios.dsLocColab
              TabOrder = 3
              OnExit = DBLookupComboBox1Exit
            end
            object RadioGroupSituacao: TRadioGroup
              Left = 3
              Top = 61
              Width = 782
              Height = 44
              Caption = 'Situa'#231#227'o'
              Columns = 3
              ItemIndex = 0
              Items.Strings = (
                'Todos'
                'Pendente'
                'Regular')
              TabOrder = 4
            end
            object DBEdit17: TDBEdit
              Left = 647
              Top = 34
              Width = 67
              Height = 21
              DataField = 'COD_VENDEDOR'
              DataSource = dtmRelatorios.dsLocColab
              Enabled = False
              TabOrder = 5
              Visible = False
            end
            object ComboBox17: TComboBox
              Left = 161
              Top = 108
              Width = 121
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 6
              Text = 'DATA CADASTRO'
              Items.Strings = (
                'DATA CADASTRO'
                'DATA PREVISTA')
            end
          end
          object tbsRelatorioContratoContaCorrente: TTabSheet
            Caption = 'Extrato Conta Corrente (Prog Fid)'
            ImageIndex = 25
            OnShow = tbsRelatorioContratoContaCorrenteShow
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              TabOrder = 0
              object Label37: TLabel
                Left = 45
                Top = 34
                Width = 125
                Height = 26
                Alignment = taRightJustify
                Caption = 'Exibir total de pontos dos pr'#243'ximos:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object Label64: TLabel
                Left = 251
                Top = 43
                Width = 138
                Height = 13
                Caption = 'vencimentos do per'#237'odo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object CheckBox63: TCheckBox
                Left = 51
                Top = 13
                Width = 121
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                OnClick = CheckBox63Click
              end
              object DBLookupComboBox37: TDBLookupComboBox
                Left = 176
                Top = 11
                Width = 497
                Height = 21
                Hint = '[F3 - Pesquisar]'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsListaCliente
                TabOrder = 1
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox37KeyDown
              end
              object DBEdit21: TDBEdit
                Left = 676
                Top = 11
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsListaCliente
                Enabled = False
                TabOrder = 2
              end
              object EditMoedaTotpontosVencimentos: TEditMoeda
                Left = 176
                Top = 40
                Width = 69
                Height = 21
                Alignment = taRightJustify
                TabOrder = 3
                FormatReal = fInteger
                FormatSize = '10.2'
                Valor = 5.000000000000000000
                OnExit = edmCFOPExit
              end
            end
          end
          object tbsRelatorioVendasRecProgFid: TTabSheet
            Caption = 'Documentos Recebidos com Vales Resgate (Prog Fid)'
            ImageIndex = 26
            OnShow = tbsRelatorioVendasRecProgFidShow
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              TabOrder = 0
              object Label67: TLabel
                Left = 77
                Top = 11
                Width = 103
                Height = 13
                Caption = 'Tipo de Relat'#243'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox27: TComboBox
                Left = 184
                Top = 8
                Width = 140
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'SINT'#201'TICO'
                Items.Strings = (
                  'SINT'#201'TICO'
                  'ANAL'#205'TICO')
              end
              object CheckBox64: TCheckBox
                Left = 59
                Top = 37
                Width = 121
                Height = 17
                Alignment = taLeftJustify
                Caption = 'Filtrar por Cliente:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
                OnClick = CheckBox64Click
              end
              object DBLookupComboBox38: TDBLookupComboBox
                Left = 184
                Top = 35
                Width = 489
                Height = 21
                Hint = '[F3 - Pesquisar]'
                Enabled = False
                KeyField = 'COD_CLIENTE'
                ListField = 'NOME_CLIENTE;COD_CLIENTE'
                ListSource = dtmRelatorios.dsListaCliente
                TabOrder = 2
                OnExit = DBLookupComboBox1Exit
                OnKeyDown = DBLookupComboBox20KeyDown
              end
              object DBEdit22: TDBEdit
                Left = 676
                Top = 35
                Width = 67
                Height = 21
                DataField = 'COD_CLIENTE'
                DataSource = dtmRelatorios.dsListaCliente
                Enabled = False
                TabOrder = 3
                Visible = False
              end
            end
          end
          object tbsRelatorioTitulosporRota: TTabSheet
            Caption = 'Relat'#243'rio de T'#237'tulos por Rota'
            ImageIndex = 27
            OnShow = tbsRelatorioTitulosporRotaShow
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              TabOrder = 0
              object Panel10: TPanel
                Left = 1
                Top = 1
                Width = 788
                Height = 107
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Label69: TLabel
                  Left = 26
                  Top = 30
                  Width = 153
                  Height = 13
                  Caption = 'Tipo de Plano do Controle:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btSelectAll: TSpeedButton
                  Left = 679
                  Top = 2
                  Width = 23
                  Height = 21
                  Hint = '[ F2 ] - Selecionar todos'
                  Flat = True
                  Glyph.Data = {
                    CE010000424DCE01000000000000CE0000002800000010000000100000000100
                    08000000000000010000120B0000120B0000260000002600000000000000FFFF
                    FF00FF00FF00A4262600BA414100BB444400BD4A4A00BD4B4B00BF4E4E00C050
                    5000C0515100C1535300C1545400C55C5C00CB6C6C00CF777700D17D7D00D483
                    8300004B0000098611000C9C19000A8615000C9518000D931A000F9E1C000F99
                    1C000E9D1D000F9D1E0011A4220011A02100139224001CB135001CA1340024BC
                    430029B548002EC6520035CA5E0039D465000202020202020202020202020202
                    0202020202020202020202020202020202020202020202021212020202020202
                    0202020202020212181B120202020202020202020202121F1C141D1202020202
                    02020202021223211E12171A1202020202020202122425201202121519120202
                    02020202021222120A03020212161202020202020203120C080B030202121312
                    02020202030F0E0803070903020202121202020310110D030203050803020202
                    12120202030E0302020202030603020202020202020302020202020203040302
                    0202020202020202020202020202030302020202020202020202020202020203
                    030202020202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btSelectAllClick
                end
                object btUnSelectAll: TSpeedButton
                  Left = 708
                  Top = 2
                  Width = 23
                  Height = 21
                  Hint = '[ F4 ] - Desfazer sele'#231#227'o'
                  Flat = True
                  Glyph.Data = {
                    AA010000424DAA01000000000000AA0000002800000010000000100000000100
                    08000000000000010000120B0000120B00001D0000001D00000000000000FFFF
                    FF00FF00FF00CACACA00C4C4C400BFBFBF00BCBCBC00B8B8B800B5B5B500AEAE
                    AE00ABABAB00A5A5A500A4A4A4009F9F9F009E9E9E009D9D9D009C9C9C009B9B
                    9B009A9A9A009999990098989800979797009494940093939300929292008C8C
                    8C008A8A8A007A7A7A0065656500020202020202020202020202020202020202
                    02020202020202020202020202020202020202021C1C02020202020202020202
                    0202021C12121C02020202020202020202021C0A0E15101C0202020202020202
                    021C0508141C16131C020202020202021C04030B1C021C19141C020202020202
                    021C081C0F1B02021C171C0202020202021B1C0D110E1B02021C1A1C02020202
                    1B0809111B13101B0202021C1C02021B07060C1B021B16111B0202021C1C0202
                    1B091B020202021B141B020202020202021B0202020202021B181B0202020202
                    020202020202020202021B1B0202020202020202020202020202021B1B020202
                    0202020202020202020202020202}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btUnSelectAllClick
                end
                object Label70: TLabel
                  Left = 147
                  Top = 5
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Rota:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label71: TLabel
                  Left = 32
                  Top = 57
                  Width = 147
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Raz'#227'o ou Nome Fantasia:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label72: TLabel
                  Left = 56
                  Top = 84
                  Width = 123
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Exibir Valor Corrigido:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object ckCartao: TCheckBox
                  Left = 184
                  Top = 29
                  Width = 85
                  Height = 17
                  Caption = 'C - Cart'#227'o'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  OnClick = ckCartaoClick
                end
                object ckFinanc: TCheckBox
                  Left = 275
                  Top = 29
                  Width = 110
                  Height = 17
                  Caption = 'F - Financiamento'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  OnClick = ckCartaoClick
                end
                object ckBoleta: TCheckBox
                  Left = 399
                  Top = 29
                  Width = 70
                  Height = 17
                  Caption = 'B - Boleta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  OnClick = ckCartaoClick
                end
                object ckChequePre: TCheckBox
                  Left = 482
                  Top = 29
                  Width = 97
                  Height = 17
                  Caption = 'E - Cheque Pr'#233
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnClick = ckCartaoClick
                end
                object DBLookupComboBox39: TDBLookupComboBox
                  Left = 184
                  Top = 2
                  Width = 489
                  Height = 21
                  Hint = '[F3 - Pesquisar]'
                  KeyField = 'COD_ROTA'
                  ListField = 'ROTA'
                  ListSource = dtmRelatorios.dsListaRota
                  TabOrder = 0
                  OnExit = DBLookupComboBox1Exit
                end
                object RadioGroupRouF: TRadioGroup
                  Left = 184
                  Top = 46
                  Width = 489
                  Height = 31
                  Columns = 2
                  ItemIndex = 0
                  Items.Strings = (
                    'Raz'#227'o Social'
                    'Nome Fantasia')
                  TabOrder = 6
                end
                object ComboBoxValorCorrigido: TComboBox
                  Left = 184
                  Top = 80
                  Width = 145
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  ItemIndex = 0
                  TabOrder = 7
                  Text = 'N'#195'O'
                  Items.Strings = (
                    'N'#195'O'
                    'SIM')
                end
                object ckOutros: TCheckBox
                  Left = 585
                  Top = 29
                  Width = 97
                  Height = 17
                  Caption = 'O - Outros'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  OnClick = ckCartaoClick
                end
              end
              object DBGrid3: TDBGrid
                Left = 1
                Top = 108
                Width = 788
                Height = 132
                Align = alClient
                DataSource = dtmRelatorios.dsCtrlTitRot
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid3DrawColumnCell
                OnKeyDown = DBGrid3KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SEL'
                    Title.Caption = 'Sel'
                    Width = 25
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_CTRL'
                    Title.Caption = 'Cod Controle'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME_CTRL'
                    Title.Caption = 'Controle'
                    Width = 580
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TP_PLANO'
                    Title.Caption = 'Tipo Plano'
                    Visible = True
                  end>
              end
            end
          end
          object tbsRelatorioComissaoPorVenda: TTabSheet
            Caption = 'Relat'#243'rio Comiss'#227'o Por Venda'
            ImageIndex = 28
            OnShow = tbsRelatorioComissaoPorVendaShow
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 790
              Height = 241
              Align = alClient
              TabOrder = 0
              object Label73: TLabel
                Left = 77
                Top = 9
                Width = 103
                Height = 13
                Caption = 'Tipo de Relat'#243'rio:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label74: TLabel
                Left = 98
                Top = 204
                Width = 82
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir Vendas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label75: TLabel
                Left = 33
                Top = 65
                Width = 147
                Height = 13
                Alignment = taRightJustify
                Caption = 'Raz'#227'o ou Nome Fantasia:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label76: TLabel
                Left = 55
                Top = 176
                Width = 125
                Height = 13
                Alignment = taRightJustify
                Caption = 'Situa'#231#227'o das Vendas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label77: TLabel
                Left = 81
                Top = 93
                Width = 99
                Height = 13
                Alignment = taRightJustify
                Caption = 'Exibir Comiss'#245'es:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label78: TLabel
                Left = 14
                Top = 228
                Width = 723
                Height = 28
                AutoSize = False
                Caption = 
                  '................................................................' +
                  '................................................................' +
                  '................................................................' +
                  '................................................................' +
                  '............................................. ..................' +
                  '................................................................' +
                  '................................................................' +
                  '................................................................' +
                  '................................................................' +
                  '...........................'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                WordWrap = True
              end
              object Label79: TLabel
                Left = 74
                Top = 33
                Width = 106
                Height = 13
                Caption = 'Listas Vendas por:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ComboBox30: TComboBox
                Left = 184
                Top = 6
                Width = 140
                Height = 21
                Hint = 'Tipo do relat'#243'rio se Sint'#233'tico ou Anal'#237'tico'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'SINT'#201'TICO'
                Items.Strings = (
                  'SINT'#201'TICO'
                  'ANAL'#205'TICO')
              end
              object ComboBox31: TComboBox
                Left = 184
                Top = 201
                Width = 345
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                Text = 'TODAS AS VENDAS'
                Items.Strings = (
                  'TODAS AS VENDAS'
                  'VENDAS COM COMISSAO'
                  'VENDAS SEM COMISSAO')
              end
              object CheckBox65: TCheckBox
                Left = 48
                Top = 121
                Width = 132
                Height = 17
                Hint = 'Filtrar vendedor - [REL055]'
                Alignment = taLeftJustify
                Caption = 'Filtrar por Vendedor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
                OnClick = CheckBox65Click
              end
              object DBLookupComboBox40: TDBLookupComboBox
                Left = 185
                Top = 119
                Width = 480
                Height = 21
                Enabled = False
                KeyField = 'COD_VENDEDOR'
                ListField = 'NOME_VENDEDOR;COD_VENDEDOR'
                ListSource = dtmRelatorios.dsLocColab
                TabOrder = 5
                OnExit = DBLookupComboBox1Exit
              end
              object CheckBox66: TCheckBox
                Left = 33
                Top = 147
                Width = 147
                Height = 17
                Hint = 'Filtrar participante - [REL056]'
                Alignment = taLeftJustify
                Caption = 'Filtrar por Participante:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
                OnClick = CheckBox66Click
              end
              object DBLookupComboBox41: TDBLookupComboBox
                Left = 184
                Top = 146
                Width = 480
                Height = 21
                Enabled = False
                KeyField = 'COD_PARTICIPANTE'
                ListField = 'NOME_PARTICIPANTE;COD_PARTICIPANTE'
                ListSource = dtmRelatorios.dsLocPart
                TabOrder = 8
                OnExit = DBLookupComboBox1Exit
              end
              object DBEdit23: TDBEdit
                Left = 670
                Top = 119
                Width = 67
                Height = 21
                DataField = 'COD_VENDEDOR'
                DataSource = dtmRelatorios.dsLocColab
                Enabled = False
                TabOrder = 6
                Visible = False
              end
              object DBEdit24: TDBEdit
                Left = 670
                Top = 146
                Width = 67
                Height = 21
                DataField = 'COD_PARTICIPANTE'
                DataSource = dtmRelatorios.dsLocPart
                Enabled = False
                TabOrder = 9
                Visible = False
              end
              object RadioGroupRouFComissaoPorVenda: TRadioGroup
                Left = 184
                Top = 53
                Width = 552
                Height = 32
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  'Raz'#227'o Social'
                  'Nome Fantasia')
                TabOrder = 2
              end
              object ComboBox32: TComboBox
                Left = 185
                Top = 173
                Width = 344
                Height = 21
                Hint = 'Exibir'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 10
                Text = 'FECHADA'
                Items.Strings = (
                  'FECHADA'
                  'ABERTA'
                  'AMBAS (ABERTA E FECHADA)')
              end
              object ComboBox33: TComboBox
                Left = 184
                Top = 90
                Width = 345
                Height = 21
                Hint = 'Listar'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                Text = 'AMBOS (VENDEDOR E PARTICIPANTE)'
                OnExit = ComboBox33Exit
                Items.Strings = (
                  'AMBOS (VENDEDOR E PARTICIPANTE)'
                  'VENDEDOR'
                  'PARTICIPANTE')
              end
              object ComboBoXMovVenc: TComboBox
                Left = 184
                Top = 31
                Width = 345
                Height = 21
                Hint = 'Listar'
                Style = csDropDownList
                CharCase = ecUpperCase
                ItemHeight = 13
                ItemIndex = 0
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Text = 'DATA DOCUMENTO'
                Items.Strings = (
                  'DATA DOCUMENTO'
                  'DATA FECHAMENTO'
                  'DATA MOVIMENTO'
                  'DATA VENCIMENTO')
              end
            end
          end
        end
      end
      object tbsComentario: TTabSheet
        Caption = 'tbsComentario'
        ImageIndex = 2
        object pnComentario: TPanel
          Left = 3
          Top = 3
          Width = 710
          Height = 333
          Caption = 'pnComentario'
          TabOrder = 0
          OnEnter = pnComentarioEnter
          object Panel12: TPanel
            Left = 1
            Top = 291
            Width = 708
            Height = 41
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 0
            object BitBtn5: TBitBtn
              Left = 617
              Top = 6
              Width = 75
              Height = 25
              Hint = 'Sair'
              Caption = '&Sair'
              TabOrder = 0
              OnClick = BitBtn5Click
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
          object GroupBox2: TGroupBox
            Left = 1
            Top = 1
            Width = 708
            Height = 290
            Align = alClient
            Caption = 'Coment'#225'rio'
            TabOrder = 1
            object MemoComentario2: TMemo
              Left = 2
              Top = 15
              Width = 704
              Height = 273
              Align = alClient
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
    end
  end
end
