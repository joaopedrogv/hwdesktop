inherited frmVisualizarWs: TfrmVisualizarWs
  Caption = 'Visualizar wsReplica'#231#227'o'
  ExplicitWidth = 806
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            Height = 177
            ExplicitHeight = 177
            inherited imgInformation: TImage
              Height = 160
              ExplicitHeight = 160
            end
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [CWS032]'
            end
            inherited BitBtn3: TBitBtn
              Visible = False
            end
            object groupAdicional: TGroupBox
              Left = 1
              Top = 90
              Width = 782
              Height = 85
              Align = alCustom
              Caption = 'Pesquisa Adicional'
              TabOrder = 11
              Visible = False
              object Label109: TLabel
                Left = 6
                Top = 54
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Conte'#250'do'
              end
              object Label110: TLabel
                Left = 16
                Top = 28
                Width = 37
                Height = 13
                Caption = 'Campo:'
              end
              object Label111: TLabel
                Left = 143
                Top = 54
                Width = 20
                Height = 13
                Caption = 'at'#233':'
              end
              object Label112: TLabel
                Left = 210
                Top = 27
                Width = 48
                Height = 13
                Caption = 'Condi'#231#227'o:'
              end
              object ComboBox11: TComboBox
                Left = 59
                Top = 20
                Width = 145
                Height = 21
                Hint = 'Campo filtro da pesquisa adicional. Informe o campo desejado'
                ItemHeight = 13
                TabOrder = 0
                Text = 'ComboBox11'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox11Exit
              end
              object MaskEdit7: TMaskEdit
                Left = 59
                Top = 46
                Width = 187
                Height = 21
                CharCase = ecUpperCase
                TabOrder = 1
              end
              object MaskEdit8: TMaskEdit
                Left = 173
                Top = 46
                Width = 75
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
                Visible = False
              end
              object MaskEdit9: TMaskEdit
                Left = 59
                Top = 46
                Width = 69
                Height = 21
                EditMask = '!99/99/0000;1;_'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
                Visible = False
              end
              object ComboBox12: TComboBox
                Left = 264
                Top = 21
                Width = 133
                Height = 21
                ItemHeight = 13
                TabOrder = 4
                Text = 'Come'#231'a'
                OnEnter = ComboBox1Enter
                OnExit = ComboBox12Exit
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
          end
          inherited Panel1: TPanel
            Top = 177
            Height = 333
            ExplicitTop = 177
            ExplicitHeight = 333
            inherited Splitter1: TSplitter
              Height = 272
              ExplicitHeight = 376
            end
            inherited DBGrid1: TDBGrid
              Height = 272
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Left = 225
                Enabled = False
                Visible = False
                ExplicitLeft = 225
              end
              inherited SpeedButton2: TSpeedButton
                Left = 279
                Enabled = False
                Visible = False
                ExplicitLeft = 279
              end
              inherited SpeedButton3: TSpeedButton
                Left = 333
                Enabled = False
                Visible = False
                ExplicitLeft = 333
              end
              inherited SpeedButton4: TSpeedButton
                Left = 173
                Width = 49
                Enabled = False
                Visible = False
                ExplicitLeft = 173
                ExplicitWidth = 49
              end
              inherited SpeedButton5: TSpeedButton
                Left = 443
                Enabled = False
                Visible = False
                ExplicitLeft = 443
              end
              inherited SpeedButton6: TSpeedButton
                Left = 7
                Hint = 'Visualizar andamento da replica'#231#227'o - [CWS033]'
                Glyph.Data = {
                  F6060000424DF606000000000000360000002800000018000000180000000100
                  180000000000C006000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFC08060C08060C08060C08060C08060C08060C08060C0
                  8060C08060C06060C06060806060806060806060806060806060FF00FF000000
                  000000000000000000000000FF00FFFF00FFC08060FFFFFFFFFFFFF0FBFFF0FB
                  FFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA680
                  6060FF00FF000000FF00FF0020E00020E0000000FF00FFFF00FFC08060FFFFFF
                  FFFFFFF0FBFFF0FBFFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CA
                  A6F0CAA6F0CAA6806060FF00FF0000000020E00020E00020E0000000FF00FFFF
                  00FFC08060FFFFFFFFFFFFF0FBFFF0FBFFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6
                  F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6806060FF00FF000000FF00FFFF00FFFF00
                  FF0020C0FF00FFFF00FFC08060C08060C08060C08060C08060C08060C08060C0
                  8060C08060C06060C06060806060806060806060806060806060FF00FF000000
                  0000000000000000000020C00020E0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0020E00020E0FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFC08060C08060C08060C08060C08060C08060C08060C08060C08060C06060
                  C06060806060806060806060806060806060FF00FF0000000000000000000000
                  00000000FF00FFFF00FFC08060FFFFFFFFFFFFF0FBFFF0FBFFF0CAA6F0CAA6F0
                  CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6806060FF00FF000000
                  FF00FF0020E00020E0000000FF00FFFF00FFC08060FFFFFFFFFFFFF0FBFFF0FB
                  FFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA680
                  6060FF00FF0000000020E00020E00020E0000000FF00FFFF00FFC08060FFFFFF
                  FFFFFFF0FBFFF0FBFFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CA
                  A6F0CAA6F0CAA6806060FF00FF000000FF00FFFF00FFFF00FF0020C0FF00FFFF
                  00FFC08060C08060C08060C08060C08060C08060C08060C08060C08060C06060
                  C06060806060806060806060806060806060FF00FF0000000000000000000000
                  000020C00020E0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FF0020E00020E0FF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC08060C08060
                  C08060C08060C08060C08060C08060C08060C08060C06060C060608060608060
                  60806060806060806060FF00FF000000000000000000000000000000FF00FFFF
                  00FFC08060FFFFFFFFFFFFF0FBFFF0FBFFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6
                  F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6806060FF00FF000000FF00FF0020E00020
                  E0000000FF00FFFF00FFC08060FFFFFFFFFFFFF0FBFFF0FBFFF0CAA6F0CAA6F0
                  CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6806060FF00FF000000
                  0020E00020E00020E0000000FF00FFFF00FFC08060FFFFFFFFFFFFF0FBFFF0FB
                  FFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA680
                  6060FF00FF000000FF00FFFF00FFFF00FF0020C0FF00FFFF00FFC08060C08060
                  C08060C08060C08060C08060C08060C08060C08060C06060C060608060608060
                  60806060806060806060FF00FF0000000000000000000000000020C00020E0FF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FF0020E00020E0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 7
              end
              inherited SpeedButton7: TSpeedButton
                Left = 118
                Enabled = False
                Visible = False
                ExplicitLeft = 118
              end
              inherited SpeedButton8: TSpeedButton
                Left = 62
                Enabled = False
                Visible = False
                ExplicitLeft = 62
              end
              inherited SpeedButton11: TSpeedButton
                Left = 497
                Enabled = False
                Visible = False
                ExplicitLeft = 497
              end
              inherited SpeedButton12: TSpeedButton
                Left = 552
                Enabled = False
                Visible = False
                ExplicitLeft = 552
              end
              inherited SpeedButton23: TSpeedButton
                Left = 610
                Enabled = False
                Visible = False
                ExplicitLeft = 610
              end
              inherited SpeedButton24: TSpeedButton
                Left = 388
                Enabled = False
                Visible = False
                ExplicitLeft = 388
              end
              inherited SpeedButton25: TSpeedButton
                Left = 665
                Enabled = False
                Visible = False
                ExplicitLeft = 665
              end
              inherited SpeedButton26: TSpeedButton
                Left = 719
                Enabled = False
                Visible = False
                ExplicitLeft = 719
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 272
              ExplicitHeight = 272
              inherited ScrollBox2: TScrollBox
                Height = 255
                ExplicitHeight = 255
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
        end
        object TabSheet4: TTabSheet
          Caption = 'TabSheet4'
          ImageIndex = 3
          object PageControl2: TPageControl
            Left = 0
            Top = 0
            Width = 783
            Height = 510
            ActivePage = TabSheet6
            Align = alClient
            TabOrder = 0
            OnChange = PageControl2Change
            object TabSheet5: TTabSheet
              Caption = '<<          LOG          >>'
              object Panel4: TPanel
                Left = 0
                Top = 441
                Width = 775
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 0
                object BitBtn7: TBitBtn
                  Left = 433
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Voltar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnClick = BitBtn7Click
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
                object btnIniciar: TBitBtn
                  Left = 352
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Iniciar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnClick = btnIniciarClick
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF882503882503FF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503FF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503882503882503FF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503882503882503FF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503FF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF882503882503FF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object BitBtn9: TBitBtn
                  Left = 271
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Limpar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = BitBtn9Click
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FF0080E00080E0FF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0080E000
                    80E00060E00060E00060C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF0080C04080E04080E04080E00060C00060C00060C00060
                    C00060A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4080E040A0E040
                    C0E04080E040A0E00080E00060C00060A00060A00060A00060A0FF00FFFF00FF
                    FF00FFFF00FF00600040A0E040A0E00060C040C0E04080E040A0E040A0E00080
                    E00080C00060A00060A0FF00FFFF00FFFF00FF0060400060600060000060E040
                    80C00060C04080E040A0E040A0E040A0E040A0E040A0E0FF00FFFF00FFFF00FF
                    00600040A04000C02000C02000C0200060000060000060A04080E04080E040A0
                    E040A0E0FF00FFFF00FFFF00FF00602000A04040E08040E06000C02000A02000
                    806000C02000C020006000006000FF00FFFF00FFFF00FFFF00FFFF00FF00A020
                    00A02040E06040C04000A02000800000800000800000A06040A0A0FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FF00600000A02000A02000800000800000
                    8000006000006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    00802040E040008000006000006000006000FF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FF00802040E040008000006000FF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00600040C040
                    00A000006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FF00802000A020006000FF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008020006000
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object btnParar: TBitBtn
                  Left = 352
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Parar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = btnPararClick
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
              end
              object PageControl4: TPageControl
                Left = 0
                Top = 0
                Width = 775
                Height = 441
                ActivePage = GeralTab
                Align = alClient
                TabOrder = 1
                OnChange = PageControl4Change
                object GeralTab: TTabSheet
                  Caption = '<< GERAL >>'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object GeralTxt: TMemo
                    Left = 0
                    Top = 0
                    Width = 767
                    Height = 413
                    Align = alClient
                    ReadOnly = True
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
              end
            end
            object TabSheet6: TTabSheet
              Caption = '<<          ERROS          >>'
              ImageIndex = 1
              object PageControl5: TPageControl
                Left = 0
                Top = 0
                Width = 775
                Height = 441
                ActivePage = GeralErrosTab
                Align = alClient
                TabOrder = 0
                OnChange = PageControl5Change
                object GeralErrosTab: TTabSheet
                  Caption = '<< GERAL >>'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object GeralErrosTxt: TMemo
                    Left = 0
                    Top = 0
                    Width = 767
                    Height = 413
                    Align = alClient
                    ReadOnly = True
                    ScrollBars = ssBoth
                    TabOrder = 0
                  end
                end
              end
              object Panel5: TPanel
                Left = 0
                Top = 441
                Width = 775
                Height = 41
                Align = alBottom
                BevelKind = bkTile
                BevelOuter = bvNone
                TabOrder = 1
                object BitBtn11: TBitBtn
                  Left = 433
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Voltar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnClick = BitBtn7Click
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
                object BitBtn13: TBitBtn
                  Left = 271
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Limpar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnClick = BitBtn13Click
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FF0080E00080E0FF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0080E000
                    80E00060E00060E00060C0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF0080C04080E04080E04080E00060C00060C00060C00060
                    C00060A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4080E040A0E040
                    C0E04080E040A0E00080E00060C00060A00060A00060A00060A0FF00FFFF00FF
                    FF00FFFF00FF00600040A0E040A0E00060C040C0E04080E040A0E040A0E00080
                    E00080C00060A00060A0FF00FFFF00FFFF00FF0060400060600060000060E040
                    80C00060C04080E040A0E040A0E040A0E040A0E040A0E0FF00FFFF00FFFF00FF
                    00600040A04000C02000C02000C0200060000060000060A04080E04080E040A0
                    E040A0E0FF00FFFF00FFFF00FF00602000A04040E08040E06000C02000A02000
                    806000C02000C020006000006000FF00FFFF00FFFF00FFFF00FFFF00FF00A020
                    00A02040E06040C04000A02000800000800000800000A06040A0A0FF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FF00600000A02000A02000800000800000
                    8000006000006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    00802040E040008000006000006000006000FF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FF00802040E040008000006000FF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00600040C040
                    00A000006000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FF00802000A020006000FF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008020006000
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object btnIniciarE: TBitBtn
                  Left = 352
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Iniciar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = btnIniciarClick
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF882503882503FF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503FF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503882503882503FF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503882503882503FF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388
                    2503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503882503882503FF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF882503882503FF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FF882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
                object btnPararE: TBitBtn
                  Left = 352
                  Top = 6
                  Width = 75
                  Height = 25
                  Caption = '&Parar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = btnPararClick
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    1800000000000003000000000000000000000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FF882503882503882503882503882503882503882503882503FF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF88250388250388250388
                    2503882503882503882503882503FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                end
              end
            end
          end
        end
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer2Timer
    Left = 488
    Top = 32
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = Timer3Timer
    Left = 536
    Top = 32
  end
end
