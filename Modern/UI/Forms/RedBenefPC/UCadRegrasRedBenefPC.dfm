inherited FrmCadRegrasRedBenefPC: TFrmCadRegrasRedBenefPC
  Left = 0
  Top = 0
  Caption = 
    'Regras de redu'#231#227'o do benef'#237'cios fiscal do PIS/COFINS - LC 224/20' +
    '25'
  ClientHeight = 526
  ClientWidth = 828
  ExplicitWidth = 836
  ExplicitHeight = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Width = 828
    Height = 507
    ExplicitWidth = 828
    ExplicitHeight = 507
    inherited Splitter2: TSplitter
      Height = 505
      ExplicitHeight = 505
    end
    inherited PanelLeft: TPanel
      Width = 823
      Height = 505
      ExplicitWidth = 823
      ExplicitHeight = 505
      inherited PageControl1: TPageControl
        Width = 821
        Height = 503
        ExplicitWidth = 821
        ExplicitHeight = 503
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 813
          ExplicitHeight = 472
          inherited ScrollBox1: TScrollBox
            Width = 813
            Height = 472
            ExplicitWidth = 813
            ExplicitHeight = 472
            inherited PageControl3: TPageControl
              Width = 813
              Height = 424
              ActivePage = tabCadastro
              ExplicitWidth = 813
              ExplicitHeight = 424
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 805
                ExplicitHeight = 393
                inherited ScrollBox3: TScrollBox
                  Width = 805
                  Height = 393
                  ExplicitWidth = 805
                  ExplicitHeight = 393
                  inherited GroupBox1: TGroupBox
                    Width = 801
                    ExplicitWidth = 801
                  end
                end
              end
              object tabCadastro: TTabSheet
                Caption = 'tabCadastro'
                ImageIndex = 1
                object Label6: TLabel
                  Left = 506
                  Top = 21
                  Width = 19
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'CST'
                end
                object Label7: TLabel
                  Left = 114
                  Top = 43
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o'
                end
                object Label9: TLabel
                  Left = 114
                  Top = 342
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Empresas'
                end
                object Label8: TLabel
                  Left = 370
                  Top = 202
                  Width = 85
                  Height = 65
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'NCM'#39's em que a regra N'#195'O se aplica.(ex: 56230190, 4113, 84, etc)'
                  WordWrap = True
                end
                object Label10: TLabel
                  Left = 75
                  Top = 202
                  Width = 85
                  Height = 65
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Naturezas da receita em que a regra SE aplica'
                  WordWrap = True
                end
                object Label16: TLabel
                  Left = 261
                  Top = 318
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fim da vig'#234'ncia'
                end
                object Label15: TLabel
                  Left = 78
                  Top = 318
                  Width = 82
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'In'#237'cio da vig'#234'ncia'
                end
                object Label11: TLabel
                  Left = 127
                  Top = 16
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Codigo'
                end
                object Label12: TLabel
                  Left = 286
                  Top = 70
                  Width = 169
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Percentual de redu'#231#227'o do benef'#237'cio'
                end
                object btNatRecAdd: TSpeedButton
                  Left = 259
                  Top = 202
                  Width = 23
                  Height = 22
                  Hint = 'Novo registro'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9FCF2
                    BCDDF2BCDDFEF9FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFF2BCDDD42691D42691F2BCDDFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD4
                    2691D42691F1B7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD42691D42691F1B7DAFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD4
                    2691D42691F1B7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFD
                    F9C1E3F9BCE0F8BBDFF8BADFED98CAD454A1D353A0EC96C9F7B7DBF7B6DAF7B5
                    D9F7BADBFEF9FCFFFFFFFFFFFFFAC3E5EE3BA9ED3AA7ED38A5EC36A3EC34A1EB
                    319EEA2F9CE92D9AE92B97E82995E72793E62491F7BBDCFFFFFFFFFFFFFAC4E6
                    EF40ADEF3EABEE3CA9ED3AA7ED38A5EC36A3EC34A1EB329FEA309CE92D9AE92B
                    98E82996F8BCDEFFFFFFFFFFFFFFFAFDFBC5E7FAC0E4FABFE4FABFE3F693CFEE
                    3AA7ED38A5F490CCF9BBE0F8BBDFF8BADEF8BEE0FEF9FCFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFABFE4EF3EACEE3CAAF9BEE2FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC1E5F0
                    42B0F041AEFABFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFBC2E7F147B4F145B2FAC0E5FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8EAF3
                    4BB9F249B7FBC6E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFCC8EBFBC8EAFFFAFDFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btNatRecAddClick
                end
                object btNatRecDel: TSpeedButton
                  Left = 259
                  Top = 230
                  Width = 23
                  Height = 22
                  Hint = 'Excluir registro'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D3FBC3BEF9C3BEF9C3BEF9C3
                    BEF9C3BEF9C3BEF9C3BEF9C3BEF9D7D4FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF4C3FED483AED483AED483AED483AED483AED483AED483AED483AED4C3F
                    EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4538EC4538EC4538EC4538EC45
                    38EC4538EC4538EC4538EC4538EC4538ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF4335EB4335EB4B3EE55A4FE54335EB4335EB594EE54B3EE74335EB4335
                    EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4032EB4032EBA29CECF0EFFC61
                    56E66156E6F0EFFC9F99EB4032EB4032EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF3E2FEA3E2FEA4435E6CBC7F3F0EFFBF0EFFBCBC7F34536E53E2FEA3E2F
                    EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B2DE93B2DE93B2DE9645AE3FE
                    FEFFFEFEFF645AE33B2DE93B2DE93B2DE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF392AE8392AE85B50E3F0EFFBCAC7F3CAC7F3F0EFFB5B50E3392AE8392A
                    E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3727E73727E78D84E7C8C4F23E
                    2FE33E2FE3C8C4F28C83E73727E73727E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF3425E63425E63425E53425E33425E63425E63425E33425E53425E63425
                    E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3222E63222E63222E63222E632
                    22E63222E63222E63222E63222E63222E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    EDEDFF9793F99793F99793F99793F99793F99793F99793F99793F99793F99793
                    F9EDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFFCACAFFC5C5FFC5C5FF9D9BFB9D
                    9BFB9D9BFB9D9BFBC5C5FFC5C5FFCACAFFFAFAFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFA59FF99088F79088F7A59FF9FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btNatRecDelClick
                end
                object btNatRecCopy: TSpeedButton
                  Left = 259
                  Top = 258
                  Width = 23
                  Height = 22
                  Hint = 'Copiar para '#225'rea de transfer'#234'ncia'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E8C6F9E6A5FFF7C5F7DD92FFF7C5F9E6
                    A5F9E8C6FFFFFFFFFFFFFFFFFFFFFFFFE7EDF6789BCD7398CC7297CBB19F64E6
                    B230F3C93AFFE650EEBB30FFE650F3C93AE9B531ECCB7EFFFFFFFFFFFFFFFFFF
                    BACCE6A3B3CAD6D6D6D6D6D6E4B039F5CE3FFFE650FFE650FFE650FFE650FFE6
                    50F5CE3FEBB740FFFFFFFFFFFFFFFFFFBACCE7C5CBD4F3F3F3F3F3F3F4E37FFF
                    E650FFE650FFE650FFE650FFE650FFE650FFE650FFEE8AFFFFFFFFFFFFFFFFFF
                    BBCDE7C5CCD4F3F3F3F3F3F3ECC353F9D644FFE650FFE650FFE650FFE650FFE6
                    50F9D644F2C959FFFFFFFFFFFFFFFFFFBBCDE8B9C7DCF3F3F3F3F3F3F0D46AFC
                    DE4AFFE650FFE650FFE650FFE650FFE650FCDE4AF9DD72FFFFFFFFFFFFFFFFFF
                    BCCEE8B3C6E0F3F3F3F3F3F3F0D46AFCDE4AFFE650FFE650FFE650FFE650FFE6
                    50FCDE4AF9DD72FFFFFFFFFFFFFFFFFFBCCEE9B4C6E1F3F3F3F3F3F3ECC353F9
                    D644FFE650FFE650FFE650FFE650FFE650F9D644F2C959FFFFFFFFFFFFFFFFFF
                    BCCFE9B4C7E1F3F3F3F3F3F3F4E37FFFE650FFE650FFE650FFE650FFE650FFE6
                    50FFE650FFEE8AFFFFFFFFFFFFFFFFFFBDCFEAB5C7E2F3F3F3F3F3F3E7B33CF5
                    CE3FFFE650FFE650FFE650FFE650FFE650F5CE3FEBB740FFFFFFFFFFFFFFFFFF
                    BDD0EAB5C8E2F3F3F3F3F3F3E1C174ECBA37F5CD3DFFE650F0C035FFE650F5CD
                    3DEAB837EDCD7FFFFFFFFFFFFFFFFFFFBED0EBB6C8E3F3F3F3F3F3F3F1F1F1E8
                    D9B8EBD99DEEE6B4ECD589EEE6B4C9C294C5C4B6FFFFFFFFFFFFFFFFFFFFFFFF
                    BED1EBB6C9E3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3B5C7
                    E2BDCFE9FFFFFFFFFFFFFFFFFFFFFFFFBFD1ECB1C5E2F3F3F3E5E2DFC7BCB3CA
                    BFB6CEC2B9D1C6BCEAE7E4F3F3F3AFC3E0BDD0EAFFFFFFFFFFFFFFFFFFFFFFFF
                    E9EFF884A8DB7FA4D98BA6CDA5AAB7BBB7B8BEBAB9ABB1BD8DA7CF7DA2D781A4
                    D8E9EFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
                    F2F1F3F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btNatRecCopyClick
                end
                object btNatRecPaste: TSpeedButton
                  Left = 259
                  Top = 286
                  Width = 23
                  Height = 22
                  Hint = 'Colar da '#225'rea de transfer'#234'ncia'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADDFF
                    F096FFF096FFF096FFF096FFF096FFF096FFF3A9FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7397CA6F90BF6F90BFB3B580FFE650FFE650FFE650FFE650FFE650FFE6
                    50FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7795C1DFDFDFDFDFDFE7DA8FFF
                    E650FFE650FFE650FFE650FFE650FFE650FFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF809CC5F3F3F3F3F3F3F1E499FFE650C7A829C5A728C5A728CDAF2DFFE6
                    50FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9ECAF3F3F3F3F3F3F1E499FF
                    E650C7A829C5A728C5A728C5A728E3C83DFFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7B9FD1F3F3F3F3F3F3F1E499FFE650C7A92AC5A728C5A728CDB02DFFE6
                    50FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C9FD2F3F3F3F3F3F3F1E499FF
                    E650D4B733D2B431D2B431D4B632EFD545FFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7DA0D3F3F3F3F3F3F3F1E499FFE650DDC139DBBE37DBBE37DBBE37EFD5
                    45FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FA2D4F3F3F3F3F3F3F1E499FF
                    E650FFE650FFE650FFE650FFE650FFE650FFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7FA2D5F3F3F3F3F3F3EFE5A9FFE650FFE650FFE650FFE650FFE650FFE6
                    50FFE963FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80A3D7F3F3F3F3F3F3F2F2F2ED
                    EDEDEDEDEDEDEDEDEDEDEDEDEDED7C9DD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF82A5D7F3F3F3F1F1F1DFD9D5E0DBD5E3DDD7E5DFDAF2F1F1F3F3F37FA2
                    D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FA3D887A8D88BA8D2BDB3AABD
                    B7B4C1BAB7C9BEB58CA9D284A5D57DA1D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E1DEE5E2E0FFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btNatRecPasteClick
                  OnMouseEnter = btNatRecPasteMouseEnter
                end
                object btRestrNcmAdd: TSpeedButton
                  Left = 567
                  Top = 202
                  Width = 23
                  Height = 22
                  Hint = 'Novo registro'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF9FCF2
                    BCDDF2BCDDFEF9FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFF2BCDDD42691D42691F2BCDDFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD4
                    2691D42691F1B7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD42691D42691F1B7DAFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1B7DAD4
                    2691D42691F1B7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFD
                    F9C1E3F9BCE0F8BBDFF8BADFED98CAD454A1D353A0EC96C9F7B7DBF7B6DAF7B5
                    D9F7BADBFEF9FCFFFFFFFFFFFFFAC3E5EE3BA9ED3AA7ED38A5EC36A3EC34A1EB
                    319EEA2F9CE92D9AE92B97E82995E72793E62491F7BBDCFFFFFFFFFFFFFAC4E6
                    EF40ADEF3EABEE3CA9ED3AA7ED38A5EC36A3EC34A1EB329FEA309CE92D9AE92B
                    98E82996F8BCDEFFFFFFFFFFFFFFFAFDFBC5E7FAC0E4FABFE4FABFE3F693CFEE
                    3AA7ED38A5F490CCF9BBE0F8BBDFF8BADEF8BEE0FEF9FCFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFABFE4EF3EACEE3CAAF9BEE2FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC1E5F0
                    42B0F041AEFABFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFBC2E7F147B4F145B2FAC0E5FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8EAF3
                    4BB9F249B7FBC6E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFCC8EBFBC8EAFFFAFDFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btRestrNcmAddClick
                end
                object btRestrNcmDel: TSpeedButton
                  Left = 567
                  Top = 230
                  Width = 23
                  Height = 22
                  Hint = 'Excluir registro'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D3FBC3BEF9C3BEF9C3BEF9C3
                    BEF9C3BEF9C3BEF9C3BEF9C3BEF9D7D4FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF4C3FED483AED483AED483AED483AED483AED483AED483AED483AED4C3F
                    EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4538EC4538EC4538EC4538EC45
                    38EC4538EC4538EC4538EC4538EC4538ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF4335EB4335EB4B3EE55A4FE54335EB4335EB594EE54B3EE74335EB4335
                    EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4032EB4032EBA29CECF0EFFC61
                    56E66156E6F0EFFC9F99EB4032EB4032EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF3E2FEA3E2FEA4435E6CBC7F3F0EFFBF0EFFBCBC7F34536E53E2FEA3E2F
                    EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B2DE93B2DE93B2DE9645AE3FE
                    FEFFFEFEFF645AE33B2DE93B2DE93B2DE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF392AE8392AE85B50E3F0EFFBCAC7F3CAC7F3F0EFFB5B50E3392AE8392A
                    E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3727E73727E78D84E7C8C4F23E
                    2FE33E2FE3C8C4F28C83E73727E73727E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF3425E63425E63425E53425E33425E63425E63425E33425E53425E63425
                    E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3222E63222E63222E63222E632
                    22E63222E63222E63222E63222E63222E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    EDEDFF9793F99793F99793F99793F99793F99793F99793F99793F99793F99793
                    F9EDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFFCACAFFC5C5FFC5C5FF9D9BFB9D
                    9BFB9D9BFB9D9BFBC5C5FFC5C5FFCACAFFFAFAFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFA59FF99088F79088F7A59FF9FFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btRestrNcmDelClick
                end
                object btRestrNcmCopy: TSpeedButton
                  Left = 567
                  Top = 258
                  Width = 23
                  Height = 22
                  Hint = 'Copiar para '#225'rea de transfer'#234'ncia'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E8C6F9E6A5FFF7C5F7DD92FFF7C5F9E6
                    A5F9E8C6FFFFFFFFFFFFFFFFFFFFFFFFE7EDF6789BCD7398CC7297CBB19F64E6
                    B230F3C93AFFE650EEBB30FFE650F3C93AE9B531ECCB7EFFFFFFFFFFFFFFFFFF
                    BACCE6A3B3CAD6D6D6D6D6D6E4B039F5CE3FFFE650FFE650FFE650FFE650FFE6
                    50F5CE3FEBB740FFFFFFFFFFFFFFFFFFBACCE7C5CBD4F3F3F3F3F3F3F4E37FFF
                    E650FFE650FFE650FFE650FFE650FFE650FFE650FFEE8AFFFFFFFFFFFFFFFFFF
                    BBCDE7C5CCD4F3F3F3F3F3F3ECC353F9D644FFE650FFE650FFE650FFE650FFE6
                    50F9D644F2C959FFFFFFFFFFFFFFFFFFBBCDE8B9C7DCF3F3F3F3F3F3F0D46AFC
                    DE4AFFE650FFE650FFE650FFE650FFE650FCDE4AF9DD72FFFFFFFFFFFFFFFFFF
                    BCCEE8B3C6E0F3F3F3F3F3F3F0D46AFCDE4AFFE650FFE650FFE650FFE650FFE6
                    50FCDE4AF9DD72FFFFFFFFFFFFFFFFFFBCCEE9B4C6E1F3F3F3F3F3F3ECC353F9
                    D644FFE650FFE650FFE650FFE650FFE650F9D644F2C959FFFFFFFFFFFFFFFFFF
                    BCCFE9B4C7E1F3F3F3F3F3F3F4E37FFFE650FFE650FFE650FFE650FFE650FFE6
                    50FFE650FFEE8AFFFFFFFFFFFFFFFFFFBDCFEAB5C7E2F3F3F3F3F3F3E7B33CF5
                    CE3FFFE650FFE650FFE650FFE650FFE650F5CE3FEBB740FFFFFFFFFFFFFFFFFF
                    BDD0EAB5C8E2F3F3F3F3F3F3E1C174ECBA37F5CD3DFFE650F0C035FFE650F5CD
                    3DEAB837EDCD7FFFFFFFFFFFFFFFFFFFBED0EBB6C8E3F3F3F3F3F3F3F1F1F1E8
                    D9B8EBD99DEEE6B4ECD589EEE6B4C9C294C5C4B6FFFFFFFFFFFFFFFFFFFFFFFF
                    BED1EBB6C9E3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3B5C7
                    E2BDCFE9FFFFFFFFFFFFFFFFFFFFFFFFBFD1ECB1C5E2F3F3F3E5E2DFC7BCB3CA
                    BFB6CEC2B9D1C6BCEAE7E4F3F3F3AFC3E0BDD0EAFFFFFFFFFFFFFFFFFFFFFFFF
                    E9EFF884A8DB7FA4D98BA6CDA5AAB7BBB7B8BEBAB9ABB1BD8DA7CF7DA2D781A4
                    D8E9EFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
                    F2F1F3F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btRestrNcmCopyClick
                end
                object btRestrNcmPaste: TSpeedButton
                  Left = 567
                  Top = 286
                  Width = 23
                  Height = 22
                  Hint = 'Colar da '#225'rea de transfer'#234'ncia'
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADDFF
                    F096FFF096FFF096FFF096FFF096FFF096FFF3A9FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7397CA6F90BF6F90BFB3B580FFE650FFE650FFE650FFE650FFE650FFE6
                    50FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7795C1DFDFDFDFDFDFE7DA8FFF
                    E650FFE650FFE650FFE650FFE650FFE650FFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF809CC5F3F3F3F3F3F3F1E499FFE650C7A829C5A728C5A728CDAF2DFFE6
                    50FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F9ECAF3F3F3F3F3F3F1E499FF
                    E650C7A829C5A728C5A728C5A728E3C83DFFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7B9FD1F3F3F3F3F3F3F1E499FFE650C7A92AC5A728C5A728CDB02DFFE6
                    50FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C9FD2F3F3F3F3F3F3F1E499FF
                    E650D4B733D2B431D2B431D4B632EFD545FFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7DA0D3F3F3F3F3F3F3F1E499FFE650DDC139DBBE37DBBE37DBBE37EFD5
                    45FFE650FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FA2D4F3F3F3F3F3F3F1E499FF
                    E650FFE650FFE650FFE650FFE650FFE650FFE650FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF7FA2D5F3F3F3F3F3F3EFE5A9FFE650FFE650FFE650FFE650FFE650FFE6
                    50FFE963FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80A3D7F3F3F3F3F3F3F2F2F2ED
                    EDEDEDEDEDEDEDEDEDEDEDEDEDED7C9DD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF82A5D7F3F3F3F1F1F1DFD9D5E0DBD5E3DDD7E5DFDAF2F1F1F3F3F37FA2
                    D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FA3D887A8D88BA8D2BDB3AABD
                    B7B4C1BAB7C9BEB58CA9D284A5D57DA1D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E1DEE5E2E0FFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = btRestrNcmPasteClick
                  OnMouseEnter = btRestrNcmPasteMouseEnter
                end
                object Label13: TLabel
                  Left = 44
                  Top = 97
                  Width = 116
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Indicador de Ajuste EFD'
                end
                object label14: TLabel
                  Left = 366
                  Top = 97
                  Width = 89
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'C'#243'digo Ajuste EFD'
                end
                object Label17: TLabel
                  Left = 58
                  Top = 123
                  Width = 102
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descri'#231#227'o Ajuste EFD'
                end
                object Label18: TLabel
                  Left = 18
                  Top = 150
                  Width = 142
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Inf Complementar Ajuste EFD'
                end
                object Label19: TLabel
                  Left = 10
                  Top = 178
                  Width = 150
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cod Conta Cont'#225'bil PISCOFINS'
                end
                object edDescricao: TEdit
                  Left = 166
                  Top = 40
                  Width = 395
                  Height = 21
                  CharCase = ecUpperCase
                  MaxLength = 64
                  TabOrder = 2
                  Text = 'EDDESCRICAO'
                end
                inline CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame
                  Left = 166
                  Top = 342
                  Width = 395
                  Height = 59
                  TabOrder = 13
                  TabStop = True
                  ExplicitLeft = 166
                  ExplicitTop = 342
                  ExplicitWidth = 395
                  ExplicitHeight = 59
                  inherited CheckListBoxEmpresas1: TCheckListBox
                    Width = 395
                    Height = 59
                    ExplicitWidth = 395
                    ExplicitHeight = 59
                  end
                end
                object lbxRestricoesNcm: TListBox
                  Left = 461
                  Top = 202
                  Width = 100
                  Height = 107
                  ItemHeight = 13
                  TabOrder = 10
                  OnKeyDown = lbxRestricoesNcmKeyDown
                end
                object lbxNaturezasReceita: TListBox
                  Left = 166
                  Top = 202
                  Width = 87
                  Height = 107
                  ItemHeight = 13
                  TabOrder = 9
                  OnKeyDown = lbxNaturezasReceitaKeyDown
                end
                inline edFimVigencia: TMaskEditNullableFrame
                  Left = 340
                  Top = 315
                  Width = 108
                  Height = 21
                  TabOrder = 12
                  TabStop = True
                  ExplicitLeft = 340
                  ExplicitTop = 315
                  ExplicitWidth = 108
                  inherited ckNotNull: TCheckBox
                    Left = 90
                    ExplicitLeft = 90
                  end
                  inherited edMask: TMaskEdit
                    Width = 87
                    ExplicitLeft = 0
                    ExplicitWidth = 87
                  end
                end
                object edInicioVigencia: TMaskEdit
                  Left = 166
                  Top = 315
                  Width = 87
                  Height = 21
                  EditMask = '!99/99/0000;1;_'
                  MaxLength = 10
                  TabOrder = 11
                  Text = '  /  /    '
                end
                object edCST: TMaskEdit
                  Left = 531
                  Top = 13
                  Width = 30
                  Height = 21
                  EditMask = '00;0;_'
                  MaxLength = 2
                  TabOrder = 1
                  OnExit = edCSTExit
                end
                object edSeqId: TMaskEdit
                  Left = 166
                  Top = 13
                  Width = 75
                  Height = 21
                  Enabled = False
                  TabOrder = 0
                end
                object edPercReducao: TEditHw
                  Left = 461
                  Top = 67
                  Width = 100
                  Height = 21
                  TabOrder = 3
                  Text = '0,00'
                  Formato = fNumber
                  FormatSize = '0.2'
                end
                object edIndAjusteEFD: TEditHw
                  Left = 166
                  Top = 94
                  Width = 100
                  Height = 21
                  Enabled = False
                  TabOrder = 4
                  Text = '0'
                  Formato = fInteger
                  FormatSize = '0.2'
                  Nullable = True
                end
                object edCodAjusteEFD: TEditHw
                  Left = 461
                  Top = 94
                  Width = 100
                  Height = 21
                  TabOrder = 5
                  Text = '0'
                  Formato = fInteger
                  FormatSize = '0.2'
                  Nullable = True
                end
                object edDescricaoAjusteEFD: TEdit
                  Left = 166
                  Top = 121
                  Width = 395
                  Height = 21
                  MaxLength = 64
                  TabOrder = 6
                  Text = 'EDDESCRICAO'
                end
                object edInfComplementarAjusteEFD: TEdit
                  Left = 166
                  Top = 148
                  Width = 395
                  Height = 21
                  MaxLength = 64
                  TabOrder = 7
                  Text = 'EDDESCRICAO'
                end
                object edCodContaContabil: TEdit
                  Left = 166
                  Top = 175
                  Width = 395
                  Height = 21
                  MaxLength = 64
                  TabOrder = 8
                  Text = 'EDDESCRICAO'
                end
              end
            end
            inherited Panel3: TPanel
              Top = 424
              Width = 813
              ExplicitTop = 424
              ExplicitWidth = 813
              inherited LabelSeq: TLabel
                Enabled = False
                Visible = False
              end
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [MOD035]'
              end
              inherited CheckCadSeq: TCheckBox
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 813
          ExplicitHeight = 472
          inherited GroupBox3: TGroupBox
            Width = 813
            ExplicitWidth = 813
            inherited Label1: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label2: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label3: TLabel
              Enabled = False
            end
            inherited Label4: TLabel
              Enabled = False
              Visible = False
            end
            inherited Label5: TLabel
              Enabled = False
              Visible = False
            end
            inherited imgInformation: TImage
              Left = 787
              ExplicitLeft = 787
            end
            inherited MaskEdit3: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited MaskEdit1: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited MaskEdit2: TMaskEdit
              Enabled = False
              Visible = False
            end
            inherited ComboBox1: TComboBox
              Enabled = False
              Visible = False
            end
            inherited ComboBox2: TComboBox
              Enabled = False
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [MOD032]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [MOD033]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited ComboBox3: TComboBox
              Enabled = False
              Visible = False
            end
            inline FilterFramePadrao1: TFilterFramePadrao
              Left = 3
              Top = 11
              Width = 407
              Height = 54
              TabOrder = 11
              TabStop = True
              ExplicitLeft = 3
              ExplicitTop = 11
              inherited pnCondicao: TPanel
                inherited edCondicao: TComboBox
                  ExplicitLeft = 64
                  ExplicitWidth = 127
                end
              end
              inherited pnConteudos: TPanel
                inherited pnConteudo1: TPanel
                  inherited edConteudo1: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 140
                  end
                end
                inherited pnConteudo2: TPanel
                  inherited edConteudo2: TMaskEdit
                    ExplicitLeft = 64
                    ExplicitWidth = 72
                  end
                end
                inherited pnBtns: TPanel
                  inherited lbCountFiltros: TLabel
                    Width = 27
                    Height = 21
                  end
                end
              end
            end
            object ckLixeira: TCheckBox
              Left = 416
              Top = 44
              Width = 112
              Height = 17
              Caption = 'Pesquisar na lixeira'
              TabOrder = 12
            end
          end
          inherited Panel1: TPanel
            Width = 813
            Height = 399
            ExplicitWidth = 813
            ExplicitHeight = 399
            inherited Splitter1: TSplitter
              Height = 338
              ExplicitHeight = 338
            end
            inherited DBGrid1: TDBGrid
              Width = 520
              Height = 338
            end
            inherited Panel2: TPanel
              Width = 809
              ExplicitWidth = 809
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [MOD034, MOD037]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [MOD036]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton4: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton5: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton6: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton7: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton8: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton11: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton12: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton23: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 634
                Enabled = False
                Visible = False
                ExplicitLeft = 634
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 338
              ExplicitHeight = 338
              inherited ScrollBox2: TScrollBox
                Height = 321
                ExplicitHeight = 321
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 813
          ExplicitHeight = 472
        end
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 507
    Width = 828
    ExplicitTop = 507
    ExplicitWidth = 828
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 112
    Top = 168
    object NatRecIncluir1: TMenuItem
      Caption = 'NatRec_Incluir'
    end
    object NatRecExcluir1: TMenuItem
      Caption = 'NatRec_Excluir'
    end
    object NatRecCopiarLinha1: TMenuItem
      Caption = 'NatRec_Copiar_Linha'
    end
    object NatRecCopiarTudo1: TMenuItem
      Caption = 'NatRec_Copiar_Tudo'
    end
    object NatRecColar1: TMenuItem
      Caption = 'NatRec_Colar'
    end
  end
end
