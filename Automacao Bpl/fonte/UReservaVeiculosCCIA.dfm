inherited FrmReservaVeiculosCCIA: TFrmReservaVeiculosCCIA
  Caption = 'Reserva de Ve'#237'culos'
  ShowHint = True
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    Height = 564
    BevelOuter = bvNone
    ExplicitHeight = 564
    inherited Splitter2: TSplitter
      Left = 0
      Top = 0
      Height = 564
      ExplicitLeft = 664
      ExplicitTop = 0
      ExplicitHeight = 268
    end
    inherited PanelLeft: TPanel
      Left = 3
      Top = 0
      Width = 795
      Height = 564
      BevelOuter = bvNone
      ExplicitLeft = 3
      ExplicitTop = 0
      ExplicitWidth = 795
      ExplicitHeight = 564
      inherited PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 795
        Height = 564
        ActivePage = TabSheet4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 795
        ExplicitHeight = 564
        inherited TabSheet1: TTabSheet
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 533
          inherited ScrollBox1: TScrollBox
            Width = 787
            Height = 533
            ExplicitWidth = 787
            ExplicitHeight = 533
            inherited PageControl3: TPageControl
              Width = 787
              Height = 485
              ExplicitWidth = 787
              ExplicitHeight = 485
              inherited TabSheet3: TTabSheet
                ExplicitTop = 27
                ExplicitWidth = 779
                ExplicitHeight = 454
                inherited ScrollBox3: TScrollBox
                  Width = 779
                  Height = 454
                  ExplicitWidth = 779
                  ExplicitHeight = 454
                  inherited GroupBox1: TGroupBox
                    Width = 775
                    Height = 450
                    Caption = ''
                    ExplicitWidth = 775
                    ExplicitHeight = 450
                  end
                end
              end
            end
            inherited Panel3: TPanel
              Top = 485
              Width = 787
              ExplicitTop = 485
              ExplicitWidth = 787
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 787
          ExplicitHeight = 533
          inherited GroupBox3: TGroupBox
            Width = 787
            ExplicitWidth = 787
            inherited imgInformation: TImage
              Left = 761
              ExplicitLeft = 630
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            Width = 787
            Height = 460
            ExplicitWidth = 787
            ExplicitHeight = 460
            inherited Splitter1: TSplitter
              Height = 399
              ExplicitHeight = 104
            end
            inherited DBGrid1: TDBGrid
              Width = 494
              Height = 399
            end
            inherited Panel2: TPanel
              Width = 783
              ExplicitWidth = 783
              inherited SpeedButton3: TSpeedButton
                Left = 441
                Top = 6
                Visible = False
                ExplicitLeft = 441
                ExplicitTop = 6
              end
              inherited SpeedButton4: TSpeedButton
                Left = 498
                Top = 6
                Visible = False
                ExplicitLeft = 498
                ExplicitTop = 6
              end
              inherited SpeedButton5: TSpeedButton
                Left = 555
                Top = 6
                Visible = False
                ExplicitLeft = 555
                ExplicitTop = 6
              end
              inherited SpeedButton6: TSpeedButton
                Left = 180
                Top = 6
                Visible = False
                ExplicitLeft = 180
                ExplicitTop = 6
              end
              inherited SpeedButton7: TSpeedButton
                Left = 237
                Visible = False
                ExplicitLeft = 237
              end
              inherited SpeedButton8: TSpeedButton
                Left = 577
                Top = 6
                Visible = False
                ExplicitLeft = 577
                ExplicitTop = 6
              end
              inherited SpeedButton11: TSpeedButton
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Left = 123
                ExplicitLeft = 123
              end
              inherited SpeedButton23: TSpeedButton
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Left = 349
                Top = 6
                Visible = False
                ExplicitLeft = 349
                ExplicitTop = 6
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
          ExplicitWidth = 787
          ExplicitHeight = 533
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 0
            Width = 787
            Height = 533
            Align = alClient
            TabOrder = 0
            object Panel7: TPanel
              Left = 0
              Top = 481
              Width = 783
              Height = 48
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 0
              object BitBtn19: TBitBtn
                Left = 18
                Top = 13
                Width = 111
                Height = 25
                Hint = 'Retirar Reserva - [VEI064/VEI131/VEI133]'
                Caption = '&Retirar Reserva'
                TabOrder = 2
                OnClick = BitBtn19Click
                Glyph.Data = {
                  9E030000424D9E030000000000009E0200002800000010000000100000000100
                  08000000000000010000120B0000120B00009A0000009A00000000000000FFFF
                  FF00FF00FF000146030001450300014303000142030001340200013302000130
                  020002510400024C0400029E0A00029D0A00014D0400014A04000141030003A0
                  0B00039E0B00039D0A00039C0B00026A06000269060003960A00038C0A00037B
                  080003780800025205000357060003A70C0003A60C0003A50C0003A10C0003A0
                  0C00039F0C00039E0C00039D0C00027E090004A30D00049F0D00036B0A000365
                  090005A00F00059F0E0006A00F0008A0120006780E00044F090006680D0010A6
                  1B0013A91E0034B73E0095DC9A0006A71600034F09000AA3180006620F000874
                  12001BAF2A003FBC4900A6E2AB00AFE5B400EEFAEF0007A5180009AF1C00066B
                  110013992300DAF3DD000AAB1F000A991F000BA42000BCEAC2000DAB280016AB
                  2E0021A3360070D080000FB02D000D822300138C2A001DA4350026B441000EA9
                  2D0010AC300011A3300038BB5200B1E6BC0011AB340012AA340017AF39002DB8
                  4E0038B454004BBF670017B641001B9D3D002BA649004CBD690056C57300C4ED
                  CE00D0F0D800DDF4E3001FB2480023BC4F0042B8630046BC660081D8990017A3
                  41006ACC880016AF480018B54A0019B14C001BB14C001CB24E001EB7510020B5
                  4F0020B5520021B151002FBC5D00E9F8EE0020B4520021B5530022B6550022B5
                  54002ABA5C002BB85C002CBA5D002EBB5E0030BB600038BD67003EBD690050C7
                  7A0054C57A0098E0B10036BD670044C6740049C7790057CA810066CF8C0068D0
                  8E0089DAA70097E0B200D1F2DD0078D99F0083DDA70092DEB00098E1B5009AE1
                  B600C2EDD30090E0B100AAE7C500C5F0D800E5F7ED00A7E7C400BDEED400D0F4
                  E300020202020209100A0A0508020202020202020204041A14222224250E0E02
                  020202023629261E110C22211F1E16070202022F41443A2D0D13232323211D15
                  0B02022F52484B37232323232323221D0B021C4D5C514732231212232323231F
                  19061C696C563E3B27232A332B23232017063073707175625958493D342C2321
                  220F39807A778B01968F6843013C3121221B2E82856F7D92010101010101553F
                  24032E5F8E786F7C8A8C0101016354351803024A94896B6E797B870161504640
                  2802024A609588766D72848364574C4528020202426A9991817F7C7E74655338
                  02020202025B5B909897938D865D5D02020202020202024F5A67665E4E020202
                  0202}
              end
              object BitBtn7: TBitBtn
                Left = 132
                Top = 13
                Width = 111
                Height = 25
                Hint = 'Alterar Reserva - [VEI130/VEI132/VEI134]'
                Caption = '&Alterar Reserva'
                TabOrder = 3
                OnClick = BitBtn7Click
                Glyph.Data = {
                  6E030000424D6E030000000000006E0200002800000010000000100000000100
                  08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                  FF00FF00FF007C7078008D787F0085787C00A3878C00B7818300B47F8100A877
                  79008F676900956D6F007D555600996E6F009D6C6C00A47272009D6D6D009E6E
                  6E00C68E8E00C8929200C48F8F00C38E8E00C18D8D00A1767600AC808000D6A2
                  A200DAA6A600D9A5A500D8A4A400E9B5B500E8B5B500ECB9B900965F5D009E74
                  7300A3797800EEB7B500F3BCBB00E5A6A300B2787300E1D0CE00E4D4D200B481
                  7600B8857A00AA7A71007959530076575100BA8E850073564F0077595200E3CF
                  C90049464500CF9B8600FAF5F300DAC5BC00CB9A8200F9F5F300DCA88700E0CF
                  C500FCF7F400FBF6F300E3B18E00E8D9CE00FEF9F500FDF8F400FCF7F300EDBD
                  9200F0E4D900FBF3EC00FAEFE400FBF3EB00FEF9F400FDF8F300FFFEFD00FAEF
                  E300DCA76A00F8E7D300B0A59800F9EBDA00F2E5D600FBF4EC00BFA889009D8B
                  7300D1BCA000E4CFB400F4E1C900F4EBDF00FDF9F400E4C39300E4C59900D0B4
                  8D00AF997800DAC09A00A794790093836B00CDB79800AE9C8200FEF3E300FFF7
                  EB00FDF6EC00F3D19900EECC9700EDCB9600E9C89600DCBD8D00D9BC8C00C5AC
                  8600BAA3800095856C00FDEFD900EECD950066625B00FFFEFC00FFFCF400FFFE
                  F900FFFFFD00A5B3B1005160610019ADCC000FCAF40010A5CF003392B300469C
                  BA003872860000A4E60004A8E600097CA8001B617D0029799A00373C3E001855
                  6F00077DCD00585C60000936C900204ADD00092CC300021EAA004860F1000318
                  AE000416AA00192DC4003E4BDB00000099000202020202020202020202020202
                  020207070707070707070707070707020202076C5453525E5B58666564630702
                  020229604B3280745F50595765630702020229614D4C7E7D816E5C69676D0702
                  02022E70444E7A7F040B2C516A68080202022E724F49730325130F2D6B5A0902
                  020236013E435505231A15112F5D0D0202023601483F4342221D1B1410300A02
                  02023801014846453D211E1C160E0C0202023801010148564539171F19122083
                  02023C0101010148476235182406787575023C01010101016F71312B2679767B
                  878D4101010101010101282A4A777C848689413A403B3B343737272A33028288
                  858A4138383838383838382A0202028C8B02}
              end
              object BitBtn17: TBitBtn
                Left = 247
                Top = 13
                Width = 111
                Height = 25
                Hint = 'Salvar Registro -  [VEI063]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = BitBtn17Click
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
              object BitBtn18: TBitBtn
                Left = 360
                Top = 13
                Width = 111
                Height = 25
                Hint = 'Cancelar Registro'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = BitBtn18Click
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
              object BitBtn16: TBitBtn
                Left = 477
                Top = 13
                Width = 116
                Height = 25
                Hint = 'Renovar Data de Vencimento - [VEI149/VEI150/VEI151]'
                Caption = '&Renovar Venc'
                TabOrder = 4
                OnClick = BitBtn16Click
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000120B0000120B00000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
                  FDFDFDFDFDFDFDFDFDFD9B9B9B9B9B9B9B9B9B9B9B9B9B9B9BFD9BFFFFFFFFFF
                  FFFFFFFFFFFFFFFF9BFD9BFF07F7F707F7F7F707F7F707FF9BFD9BFFF7FFFFF7
                  FFFFFFF7FFFFF7FF9BFD9BFFF7FFFFF7FF09FFF7FFFFF7FF9BFD9BFF07F7F7E3
                  E3E3E3E3F7F7E3FF9BFD9BFFF7FFFFE309FFFFE3FFFFF7FF9BFD9BFF07F7F7E3
                  E3E3E3E3F7F707FF9BFD9BFFFFFFFFF7FFFFFFF7FFFFF7FF9BFD9BFFFFFFFFF7
                  FFFFFFF7FFFFF7FF9BFD9BFFFFFFFF07F7F7F707F7F707FF9BFD9BFFFFFFFFFF
                  FFFFFFFFFFFFFFFF9BFDE2E2E2E2E2E2E2E2E2E2E2E2E2E2E2FDE2E2E2FDFDE2
                  E2E2E2E2FDFDE2E2E2FDE2E2E2FD9BE2E2E2E2E2FD9BE2E2E2FD}
              end
            end
            object GroupBox4: TGroupBox
              Left = 0
              Top = 0
              Width = 783
              Height = 481
              Align = alTop
              TabOrder = 1
              object pnReserva: TPanel
                Left = 2
                Top = 15
                Width = 779
                Height = 464
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                OnEnter = pnReservaEnter
                object Label15: TLabel
                  Left = 623
                  Top = 11
                  Width = 95
                  Height = 13
                  Caption = 'Dados do Ve'#237'culo'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 55
                  Top = 35
                  Width = 44
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cliente:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label18: TLabel
                  Left = 40
                  Top = 86
                  Width = 59
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Vendedor:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label20: TLabel
                  Left = 14
                  Top = 112
                  Width = 85
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cond Reserva:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label22: TLabel
                  Left = 26
                  Top = 137
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Observa'#231#227'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label23: TLabel
                  Left = 23
                  Top = 61
                  Width = 76
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fone Cliente:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label24: TLabel
                  Left = 274
                  Top = 61
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label26: TLabel
                  Left = 450
                  Top = 61
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Hora:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label31: TLabel
                  Left = 398
                  Top = 110
                  Width = 55
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Situa'#231#227'o:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label48: TLabel
                  Left = 34
                  Top = 221
                  Width = 65
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Data Venc:'
                  Color = clBtnFace
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object Label56: TLabel
                  Left = 240
                  Top = 221
                  Width = 65
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Hora Venc:'
                  Color = clBtnFace
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object Image1: TImage
                  Left = 755
                  Top = 0
                  Width = 24
                  Height = 26
                  Cursor = crHelp
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
                end
                object Label6: TLabel
                  Left = 221
                  Top = 197
                  Width = 85
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Dt Assembleia:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label8: TLabel
                  Left = 4
                  Top = 197
                  Width = 95
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Grupo/Cota/RD:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Memo1: TMemo
                  Left = 571
                  Top = 32
                  Width = 200
                  Height = 97
                  Enabled = False
                  Lines.Strings = (
                    '')
                  TabOrder = 0
                end
                object DBEdit3: TDBEdit
                  Left = 105
                  Top = 32
                  Width = 43
                  Height = 21
                  Hint = 'Cliente'
                  CharCase = ecUpperCase
                  DataField = 'COD_CLIENTE'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  TabOrder = 1
                  OnExit = DBEdit3Exit
                  OnKeyDown = DBEdit3KeyDown
                end
                object DBEdit6: TDBEdit
                  Left = 150
                  Top = 32
                  Width = 415
                  Height = 21
                  Hint = 'Cliente'
                  CharCase = ecUpperCase
                  DataField = 'NOME_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  TabOrder = 2
                end
                object DBLookupComboBox10: TDBLookupComboBox
                  Left = 150
                  Top = 83
                  Width = 415
                  Height = 21
                  Hint = 'Vendedor'
                  DataField = 'VENDEDOR_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  KeyField = 'COD_VENDEDOR'
                  ListField = 'NOME_VENDEDOR'
                  ListSource = DtmVeiculosCCIA.dsColaboradorEstMotosReserva
                  TabOrder = 6
                end
                object DBComboBox4: TDBComboBox
                  Left = 105
                  Top = 108
                  Width = 272
                  Height = 21
                  Hint = 'Tipo de Reserva'
                  Style = csDropDownList
                  CharCase = ecUpperCase
                  DataField = 'TIPO_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  ItemHeight = 13
                  TabOrder = 7
                  OnExit = DBComboBox4Exit
                end
                object DBMemo1: TDBMemo
                  Left = 105
                  Top = 134
                  Width = 666
                  Height = 53
                  DataField = 'OBS_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  TabOrder = 9
                end
                object DBEdit7: TDBEdit
                  Left = 105
                  Top = 58
                  Width = 107
                  Height = 21
                  Hint = 'N'#250'mero de telefone do cliente'
                  CharCase = ecUpperCase
                  DataField = 'FONE_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  TabOrder = 3
                end
                object DBEdit9: TDBEdit
                  Left = 311
                  Top = 58
                  Width = 77
                  Height = 21
                  Hint = 'Data da Reserva'
                  CharCase = ecUpperCase
                  DataField = 'DATA_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  Enabled = False
                  TabOrder = 4
                end
                object DBEdit16: TDBEdit
                  Left = 488
                  Top = 58
                  Width = 77
                  Height = 21
                  Hint = 'Hora Reserva'
                  CharCase = ecUpperCase
                  DataField = 'HORA_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  Enabled = False
                  TabOrder = 14
                end
                object DBComboBox8: TDBComboBox
                  Left = 458
                  Top = 108
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'SIT_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  ItemHeight = 13
                  Items.Strings = (
                    'V - VENDIDO'
                    'N - N'#195'O VENDIDO')
                  TabOrder = 8
                end
                object DBEdit1: TDBEdit
                  Left = 105
                  Top = 83
                  Width = 43
                  Height = 21
                  Hint = 'Vendedor'
                  CharCase = ecUpperCase
                  DataField = 'VENDEDOR_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  TabOrder = 5
                  OnExit = DBEdit1Exit
                  OnKeyDown = DBEdit1KeyDown
                end
                object DBEdit2: TDBEdit
                  Left = 105
                  Top = 218
                  Width = 107
                  Height = 21
                  Hint = 'Data da Reserva'
                  CharCase = ecUpperCase
                  DataField = 'DATA_VENC_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  Enabled = False
                  TabOrder = 12
                end
                object DBEdit4: TDBEdit
                  Left = 311
                  Top = 218
                  Width = 107
                  Height = 21
                  Hint = 'Hora Reserva'
                  CharCase = ecUpperCase
                  DataField = 'HORA_VENC_RES'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  Enabled = False
                  TabOrder = 13
                end
                object DBEdit8: TDBEdit
                  Left = 105
                  Top = 192
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'GRUPO_COTA_RD'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  TabOrder = 10
                end
                object DBEdit5: TDBEdit
                  Left = 311
                  Top = 192
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'DATA_ASSEMBLEIA'
                  DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                  Enabled = False
                  TabOrder = 11
                  OnEnter = DBEdit5Enter
                  OnExit = DBEdit5Exit
                  OnKeyDown = DBEdit5KeyDown
                end
                object GroupBox5: TGroupBox
                  Left = 0
                  Top = 320
                  Width = 779
                  Height = 144
                  Align = alBottom
                  Caption = 'Reserva Original'
                  TabOrder = 15
                  object Label7: TLabel
                    Left = 39
                    Top = 27
                    Width = 60
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Cond Res:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label11: TLabel
                    Left = 221
                    Top = 81
                    Width = 85
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Dt Assembleia:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label12: TLabel
                    Left = 4
                    Top = 81
                    Width = 95
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Grupo/Cota/RD:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label9: TLabel
                    Left = 67
                    Top = 54
                    Width = 32
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label10: TLabel
                    Left = 274
                    Top = 54
                    Width = 32
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Hora:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label13: TLabel
                    Left = 34
                    Top = 110
                    Width = 65
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Data Venc:'
                    Color = clBtnFace
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                  end
                  object Label14: TLabel
                    Left = 241
                    Top = 110
                    Width = 65
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Hora Venc:'
                    Color = clBtnFace
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentColor = False
                    ParentFont = False
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 105
                    Top = 24
                    Width = 272
                    Height = 21
                    Hint = 'Tipo de Reserva'
                    Style = csDropDownList
                    CharCase = ecUpperCase
                    DataField = 'TIPO_RES_OLD'
                    DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                    Enabled = False
                    ItemHeight = 13
                    TabOrder = 0
                  end
                  object DBEdit12: TDBEdit
                    Left = 105
                    Top = 78
                    Width = 107
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'GRUPO_COTA_RD_OLD'
                    DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                    Enabled = False
                    TabOrder = 3
                  end
                  object DBEdit13: TDBEdit
                    Left = 311
                    Top = 78
                    Width = 107
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'DATA_ASSEMBLEIA_OLD'
                    DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                    Enabled = False
                    TabOrder = 4
                  end
                  object DBEdit10: TDBEdit
                    Left = 105
                    Top = 51
                    Width = 107
                    Height = 21
                    Hint = 'Data da Reserva'
                    CharCase = ecUpperCase
                    DataField = 'DATA_RES_OLD'
                    DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                    Enabled = False
                    TabOrder = 1
                  end
                  object DBEdit11: TDBEdit
                    Left = 311
                    Top = 51
                    Width = 107
                    Height = 21
                    Hint = 'Hora Reserva'
                    CharCase = ecUpperCase
                    DataField = 'HORA_RES_OLD'
                    DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                    Enabled = False
                    TabOrder = 2
                  end
                  object DBEdit14: TDBEdit
                    Left = 105
                    Top = 107
                    Width = 107
                    Height = 21
                    Hint = 'Data da Reserva'
                    CharCase = ecUpperCase
                    DataField = 'DATA_VENC_RES_OLD'
                    DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                    Enabled = False
                    TabOrder = 5
                  end
                  object DBEdit15: TDBEdit
                    Left = 312
                    Top = 107
                    Width = 107
                    Height = 21
                    Hint = 'Hora Reserva'
                    CharCase = ecUpperCase
                    DataField = 'HORA_VENC_RES_OLD'
                    DataSource = DtmVeiculosCCIA.dsEstMotosReserva
                    Enabled = False
                    TabOrder = 6
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited PanelFlash: TPanel
      Left = 667
      Top = 8
      Width = 1
      Height = 296
      ExplicitLeft = 667
      ExplicitTop = 8
      ExplicitWidth = 1
      ExplicitHeight = 296
      inherited bMarketingHW: TBitBtn
        Top = 274
        Width = 0
        ExplicitTop = 274
        ExplicitWidth = 0
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Left = 648
    Top = 24
    Width = 13
    Align = alNone
    Visible = False
    ExplicitLeft = 648
    ExplicitTop = 24
    ExplicitWidth = 13
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 734
    Top = 91
  end
  inherited Timer1: TTimer
    Left = 694
    Top = 91
  end
  inherited ApplicationEventsPadrao: TApplicationEvents
    Left = 662
    Top = 91
  end
  object PopupMenu3: TPopupMenu
    Left = 48
    Top = 104
    object Configurarcolunas2: TMenuItem
      Caption = 'Configurar colunas'
    end
  end
end
