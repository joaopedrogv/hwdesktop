inherited frmProdutosEC_CA: TfrmProdutosEC_CA
  Caption = 'Produtos E-Commerce'
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
            Height = 203
            ExplicitHeight = 203
            inherited imgInformation: TImage
              Height = 186
              ExplicitHeight = 186
            end
            inherited BitBtn3: TBitBtn
              Enabled = False
              Visible = False
            end
            inherited CheckBox3: TCheckBox
              Left = 256
              ExplicitLeft = 256
            end
            object groupAdicional: TGroupBox
              Left = 131
              Top = 71
              Width = 414
              Height = 128
              Align = alCustom
              Caption = 'Pesquisa Adicional'
              TabOrder = 12
              Visible = False
              OnExit = groupAdicionalExit
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
                ItemHeight = 0
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
                Items.Strings = (
                  'Come'#231'a'
                  'Igual'
                  'Diferente'
                  'Maior'
                  'Menor'
                  'Esta contido')
              end
            end
            object RadioGroup3: TRadioGroup
              Left = 3
              Top = 71
              Width = 125
              Height = 128
              Caption = 'Alternar para '
              ItemIndex = 0
              Items.Strings = (
                'E-Commerce'
                'Com'#233'rcio Aberto')
              TabOrder = 11
              OnClick = RadioGroup3Click
            end
            object CheckBoxComGrade: TCheckBox
              Left = 455
              Top = 48
              Width = 90
              Height = 17
              Hint = 'Com Grade'
              Caption = 'Com Grade'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 13
              OnClick = CheckBoxComGradeClick
            end
          end
          inherited Panel1: TPanel
            Top = 203
            Height = 307
            ExplicitTop = 203
            ExplicitHeight = 307
            inherited Splitter1: TSplitter
              Height = 246
              ExplicitHeight = 246
            end
            inherited DBGrid1: TDBGrid
              Height = 246
              OnCellClick = DBGrid1CellClick
              OnDrawColumnCell = DBGrid1DrawColumnCell
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Left = 463
                Enabled = False
                Visible = False
                ExplicitLeft = 463
              end
              inherited SpeedButton2: TSpeedButton
                Left = 520
                Enabled = False
                Visible = False
                ExplicitLeft = 520
              end
              inherited SpeedButton3: TSpeedButton
                Left = 577
                Enabled = False
                Visible = False
                ExplicitLeft = 577
              end
              inherited SpeedButton4: TSpeedButton
                Left = 577
                Top = 6
                Enabled = False
                Visible = False
                ExplicitLeft = 577
                ExplicitTop = 6
              end
              inherited SpeedButton5: TSpeedButton
                Left = 691
                Enabled = False
                Visible = False
                ExplicitLeft = 691
              end
              inherited SpeedButton6: TSpeedButton
                Left = 3
                Hint = 'Enviar Produtos/Servi'#231'os Com'#233'rcio Aberto - [BAS436]'
                Glyph.Data = {
                  36100000424D3610000000000000360000002800000020000000200000000100
                  20000000000000100000C40E0000C40E0000000000000000000014B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FCFF14B9FBFF14B5F6FF14B3F2FF14B3
                  F2FF14B4F3FF14B7F8FF14BAFCFF14B9FBFF14B9FBFF14B3F2FF14B2F1FF14B3
                  F1FF14B2F1FF14B4F3FF14B9FBFF14B9FBFF14B9FBFF14B3F2FF14B3F1FF14B3
                  F1FF14B3F1FF14B3F1FF14B3F1FF14B3F1FF14B3F2FF14B7F9FF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14BDFFFF159FD4FF177294FF194E62FF1A3A45FF1A38
                  42FF1A4251FF185E79FF1689B5FF14B6F6FF14C1FFFF194454FF1A2D33FF1A2E
                  35FF1A2E35FF1A3742FF15B0EDFF14BAFCFF15B3F1FF1A353EFF1A2F36FF1A2E
                  35FF1A2E35FF1A2E35FF1A2E35FF1A2E36FF1A3D4AFF15A4DDFF14B9FBFF14B9
                  FBFF14B9FBFF14BAFCFF177295FF1A2A30FF1B1B1AFF1B1B1AFF1B1C1BFF1B1C
                  1BFF1B1C1BFF1B1A19FF1B2021FF1A414FFF15B2EFFF18789DFF1B1411FF1B1C
                  1CFF1B1C1CFF1B1612FF17779CFF14BEFFFF15AFEDFF1B2325FF1B1C1CFF1B1C
                  1CFF1B1C1CFF1B1C1CFF1B1C1CFF1B1C1BFF194758FF14BDFFFF14B9FBFF14B9
                  FBFF14BBFEFF17769BFF1B1512FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1B1AFF1B282CFF15A7DFFF1B292EFF1B1D
                  1DFF1B1D1DFF1B1C1BFF1B2529FF14BFFFFF15B0EEFF1B2325FF1B1C1CFF1B1D
                  1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1A17FF1691C1FF14BCFFFF14B9FBFF14BE
                  FFFF168CBBFF1C1512FF1B1D1DFF1B1D1DFF1B1D1DFF1B1A19FF1B1613FF1B1A
                  1AFF1B1715FF1B1D1DFF1B1D1DFF1B1D1DFF1B1A18FF195269FF195B75FF1B1C
                  1CFF1B1D1DFF1B1D1DFF1B1715FF1681A9FF14BCFEFF186482FF194D61FF1B1A
                  19FF1B1D1DFF1B1D1DFF1B1B1AFF1A323BFF14C1FFFF14B9FBFF14B9FBFF14BA
                  FBFF1A333CFF1B1C1CFF1B1D1DFF1B1D1DFF1B1C1BFF1A3C48FF1693C3FF159E
                  D4FF177091FF1B1E1DFF1B1D1DFF1B1D1DFF1B1D1DFF1A2A30FF186F91FF1B22
                  24FF1B1D1DFF1B1D1DFF1B1D1DFF1A3B47FF14BAFBFF14BFFFFF185E79FF1B19
                  17FF1B1D1DFF1B1D1DFF1B130FFF168AB5FF14BCFFFF14B9FBFF14BAFDFF1597
                  C9FF1B2528FF1B1D1DFF1B1D1DFF1B1D1DFF1A2D34FF15ACE8FF14BAFDFF14B9
                  FBFF14C2FFFF17769BFF1B1816FF1B1D1DFF1B1D1DFF1B1C1BFF177294FF1A2E
                  35FF1B1D1DFF1B1D1DFF1B1D1DFF1B2629FF1694C6FF14B7F6FF1C1A18FF1B1D
                  1CFF1B1D1DFF1B1C1CFF1B2D35FF14B5F4FF14B9FBFF14B9FBFF14BBFDFF1782
                  ACFF1B2022FF1B1D1DFF1B1D1DFF1B1A1AFF185D77FF14C2FFFF14B9FBFF14B9
                  FBFF14B9FBFF14C0FFFF1B2021FF1B1C1CFF1B1D1DFF1B1B1BFF194D61FF1771
                  92FF1B1614FF1B1D1DFF1B1D1DFF1B1B1AFF186A89FF186885FF1B1815FF1B1D
                  1DFF1B1D1DFF1B1B1AFF186989FF14B8F9FF14B9FBFF14B9FBFF14BBFDFF167F
                  A8FF1B2021FF1B1D1DFF1B1D1DFF1B1918FF177698FF14BEFFFF14B9FBFF14B9
                  FBFF14B9FBFF14C3FFFF1B282DFF1B1C1BFF1B1D1DFF1B1C1BFF1A3F4CFF14B3
                  F2FF1B2022FF1B1C1CFF1B1D1DFF1B1D1CFF1B2C32FF1B2428FF1B1D1CFF1B1D
                  1DFF1B1D1DFF1B272BFF1697CAFF14B9FCFF14B9FBFF14B9FBFF14BBFDFF1687
                  B4FF1B2224FF1B1D1DFF1B1D1DFF1B1B1BFF185165FF14C0FFFF14B9FBFF14B9
                  FBFF14B9FBFF14BDFFFF176682FF1B1B1AFF1B1D1DFF1B1B1BFF194A5CFF14B7
                  F8FF186A8BFF1B1816FF1B1D1DFF1B1D1DFF1B1D1CFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1D1DFF1A3E4CFF14BCFEFF14B9FBFF14B9FBFF14B9FBFF14BAFCFF15A6
                  DFFF1B2629FF1B1D1DFF1B1D1DFF1B1D1DFF1B2326FF168BB9FF14C0FFFF14C1
                  FFFF14C0FFFF14B9FBFF14BAFCFF176684FF1B1B19FF1B1B1AFF186886FF14B8
                  FAFF15A4DCFF1B2326FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1815FF1784AEFF14BEFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14C0
                  FFFF194B5EFF1B1B1AFF1B1D1DFF1B1D1DFF1B1D1DFF1B2527FF194352FF194E
                  63FF195C75FF14B9FBFF14B9FBFF14BAFCFF176683FF1B1A19FF1694C5FF14BA
                  FCFF14B5F5FF194E60FF1B1C1CFF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B1C
                  1BFF1B282DFF14BEFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14BA
                  FDFF14B2EFFF1B2326FF1B1C1BFF1B1D1DFF1B1D1DFF1B1D1DFF1B1C1CFF1B1C
                  1BFF1B1613FF19556CFF14B9FBFF14B9FCFF14BFFFFF1598CAFF14BBFDFF14B9
                  FBFF14BBFEFF167EA5FF1B1F20FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFF1B16
                  14FF17779DFF14BDFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14BCFFFF1598CCFF1A2E34FF1B1917FF1B1D1DFF1B1D1DFF1B1D1DFF1B1D
                  1DFF1B1D1DFF1B1613FF185268FF14AEECFF14B9FBFF14BCFFFF14B9FBFF14B9
                  FBFF14B9FCFF14B3F2FF1B2A30FF1B1D1CFF1B1D1DFF1B1D1DFF1B1C1CFF1B27
                  2CFF15B0EFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14BAFCFF15A8E2FF19546AFF1B130EFF1B1817FF1B1B1AFF1B1B
                  1AFF1B1A19FF1B1714FF1B2528FF159ACFFF14BAFCFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14BFFFFF186A8BFF1C120DFF1B1714FF1B1714FF1B1511FF1860
                  7BFF14B8F9FF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14BEFFFF15ABE6FF187193FF194F65FF194A
                  5CFF185B75FF1786B0FF14BCFFFF14BBFEFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14BCFFFF15BAFBFF15BBFBFF15BBFBFF15BBFBFF14BB
                  FDFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14BAFDFF14BFFFFF14C2FFFF14C3
                  FFFF14C1FFFF14BDFFFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FCFF14B9FCFF14B9FCFF14B9FCFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9
                  FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF14B9FBFF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 3
              end
              inherited SpeedButton7: TSpeedButton
                Left = 117
                Enabled = False
                Visible = False
                ExplicitLeft = 117
              end
              inherited SpeedButton8: TSpeedButton
                Left = 59
                Enabled = False
                Visible = False
                ExplicitLeft = 59
              end
              inherited SpeedButton11: TSpeedButton
                Left = 174
                Enabled = False
                Visible = False
                ExplicitLeft = 174
              end
              inherited SpeedButton12: TSpeedButton
                Left = 231
                Enabled = False
                Visible = False
                ExplicitLeft = 231
              end
              inherited SpeedButton23: TSpeedButton
                Left = 288
                Enabled = False
                Visible = False
                ExplicitLeft = 288
              end
              inherited SpeedButton24: TSpeedButton
                Left = 345
                Enabled = False
                Visible = False
                ExplicitLeft = 345
              end
              inherited SpeedButton25: TSpeedButton
                Left = 634
                Top = 3
                Enabled = False
                Visible = False
                ExplicitLeft = 634
                ExplicitTop = 3
              end
              inherited SpeedButton26: TSpeedButton
                Left = 402
                Enabled = False
                Visible = False
                ExplicitLeft = 402
              end
            end
            inherited GroupBox2: TGroupBox
              Height = 246
              ExplicitHeight = 246
              inherited ScrollBox2: TScrollBox
                Height = 229
                ExplicitHeight = 229
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
        object tsDadosComercioAberto: TTabSheet
          Caption = 'tsDadosComercioAberto'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnDadosComercioAberto: TPanel
            Left = 3
            Top = 3
            Width = 310
            Height = 118
            TabOrder = 0
            object pnButtonComercioAberto: TPanel
              Left = 1
              Top = 82
              Width = 308
              Height = 35
              Align = alBottom
              BevelKind = bkTile
              BevelOuter = bvNone
              TabOrder = 1
              object pnOKDadosComercioAberto: TBitBtn
                Left = 74
                Top = 3
                Width = 75
                Height = 25
                Hint = 'OK - [PRO377/BAS431]'
                Caption = '&OK'
                TabOrder = 0
                OnClick = pnOKDadosComercioAbertoClick
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
              object pnCancDadosComercioAberto: TBitBtn
                Left = 155
                Top = 3
                Width = 75
                Height = 25
                Hint = 'Cancelar'
                Caption = '&Cancela'
                TabOrder = 1
                OnClick = pnCancDadosComercioAbertoClick
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
            object RadioGroupOpcoesComercioAberto: TRadioGroup
              Left = 1
              Top = 1
              Width = 308
              Height = 81
              Align = alClient
              Caption = 'Op'#231#245'es'
              ItemIndex = 0
              Items.Strings = (
                'Enviar Tipo de Servi'#231'o'
                'Remover Tipo de Servi'#231'o')
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    object MarcarTodosProdutosServicos: TMenuItem
      Caption = 'Marcar Todos '
      OnClick = MarcarTodosProdutosServicosClick
    end
    object DesmarcarTodosProdutosServicos: TMenuItem
      Caption = 'Desmarcar Todos'
      OnClick = DesmarcarTodosProdutosServicosClick
    end
  end
end
