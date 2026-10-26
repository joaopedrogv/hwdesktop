inherited frmCadFlwPerfil: TfrmCadFlwPerfil
  Caption = 'Perfil de Perguntas'
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
              ActivePage = tsCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Cadastro de Perfil de Perguntas'
                  TabOrder = 0
                  object Label6: TLabel
                    Left = 96
                    Top = 40
                    Width = 33
                    Height = 13
                    Caption = 'Codigo'
                    FocusControl = DBEdit1
                  end
                  object Label7: TLabel
                    Left = 41
                    Top = 67
                    Width = 88
                    Height = 13
                    Caption = 'Descri'#231#227'o do Perfil'
                    FocusControl = DBEdit2
                  end
                  object Label8: TLabel
                    Left = 109
                    Top = 94
                    Width = 20
                    Height = 13
                    Caption = 'Tipo'
                  end
                  object DBEdit1: TDBEdit
                    Left = 135
                    Top = 37
                    Width = 134
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'CODPERFIL'
                    DataSource = dtmFollowUpPosAtendimento.dsFlwPerfil
                    TabOrder = 0
                  end
                  object DBEdit2: TDBEdit
                    Left = 135
                    Top = 64
                    Width = 610
                    Height = 21
                    CharCase = ecUpperCase
                    DataField = 'DESCRICAO'
                    DataSource = dtmFollowUpPosAtendimento.dsFlwPerfil
                    TabOrder = 1
                  end
                  object DBComboBox1: TDBComboBox
                    Left = 135
                    Top = 91
                    Width = 134
                    Height = 21
                    DataField = 'TIPO'
                    DataSource = dtmFollowUpPosAtendimento.dsFlwPerfil
                    ItemHeight = 0
                    Items.Strings = (
                      'FollowUp'
                      'P'#243's Atendimento')
                    TabOrder = 2
                  end
                  object BitBtn8: TBitBtn
                    Left = 135
                    Top = 118
                    Width = 134
                    Height = 52
                    Caption = 'Perguntas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 3
                    OnClick = SpeedButton6Click
                    Glyph.Data = {
                      360C0000424D360C000000000000360000002800000020000000200000000100
                      180000000000000C0000120B0000120B00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA99C
                      979E85799B7E6F9F887CACA3A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9037EA87
                      3AFB9844FE9C46F99743E37D33A76849FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC5425FF9037FFA3
                      46FFA548FFA549FFA448FF9B3FFF802CA65839FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE05B22FF8A40FF91
                      45FF984AFF994BFF9447FF8A3FFF833AC64817FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA5742FFBD9FFFC6
                      A7FFBF9FFFBD9DFFBF9FFFC9ABFA9E7BA05F50FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD8A85D7B2
                      AAF1D1CAF5D6CFEECBC2CD9E95A98883FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFC6BEBDDAD4D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FF9E817B9A746BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFAC877DD1876CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFAC8F88FAAF889F8379FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFC5B9B5FFCAA6D97737A4928BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFC79B86FFC17BE87F30A4755BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFE7E4E2E5A77CFFB460FF9D43DC7F39A97352A4948DFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFC8BAB4EE9D60FFAD56FFA74BFFA349EF8D3DBD7443A18577FF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFB69D91F4994FFFA74DFFA44BFFA64CFFA64CFA9743C8
                      763E9F7F70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFB08268FE9F4AFFA54CFFA34BFFA44BFFA64DFF
                      A74DFB9744BD6F40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE7A40FFA74DFFA44CFFA34CFFA24BFF
                      A34BFFA44CFFA048DD7331A0887FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFF82604EA08070A57559A67457A07C687F5B49FFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA98573FE9C47FFA44CFFA14AFFA049FF
                      A048FF9E47FF9B44FF9440D66427FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFF9F867DD6783BFEA150FFA853FFA752FFA24EE5843CA28170FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08438FF9E47FF9C46FF9C46FF
                      9B45FF9844FF9441FF8E3CFF8134A36149FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFC75224FF9847FFA651FFAA56FFAB58FFAB57FFB058D67334FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE16B2CFF903EFF9140FF9241FF
                      9240FF8E3DFF893AFF8336FF7F34B9552DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFE05424FF8243FF9B5EFFA059FFA04FFFA756FFA654C36636FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE05D25FF7D32FF7D30FF8236FF
                      883EFF8A44FF8843FF7D36FF752EB6512EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFC14E30FFC6AEFFCBB9FFC7B1FFA373FF813AE86B31B29B95FFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A7E77F1571DFF7536FF8F5BFFA376FF
                      AD84FFB18CFFB491FFB38FFD7741A06454FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFA3837FF6BBACFFDCCCFFD1C1FFD1C0F073499A665BFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF8B6C5BA64C35FF9770FFB89DFFC0A7FFBFA5FF
                      BFA4FFBFA5FFC6AEFFCBB2B9573CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFA58682DFA193FFE0D2FFEADDDD9380B3AEAEFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFF8665559A6A63F7C0AFFFDBCDFFD2C2FFCFBEFFCFBEFF
                      D2C1FFDCCAFFCEBCB77668FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFF937160AF7C75E4B3A8FFE1D7BF8E86A08B89B2AAA9BCB6
                      B6BAB4B4ABA1A09A807DBE918BFFEBE3FFF5EDFFEDE4FFEFE5FFF0E5FFEADEFC
                      D0C4CE978DA98783FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF967564AC908DBB938DCC958FCA918ACB96
                      8ED4A199ECC4BDFFEEE9FFFEFAFFE9E5F6DAD5ECCBC5DAB1ACC49892AE8983C1
                      B1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD6
                      D6CDC3C2C5B9B9BFB3B2C1B5B4CBBFBFD7CECDFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Top = 10
                Hint = 'Salvar registro - [CRM048]'
                ExplicitTop = 10
              end
              inherited BitBtn5: TBitBtn
                Top = 10
                ExplicitTop = 10
              end
              inherited BitBtn6: TBitBtn
                Top = 10
                ExplicitTop = 10
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
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para consultar - [CRM045]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo registro - [CRM046]'
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
            inherited Splitter1: TSplitter
              ExplicitHeight = 365
            end
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [CRM047]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [CRM050]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Hint = 'Recuperar registro - [CRM052]'
                OnClick = SpeedButton5Click
              end
              inherited SpeedButton6: TSpeedButton
                Left = 291
                Hint = 'Perguntas do Perfil'
                Glyph.Data = {
                  360C0000424D360C000000000000360000002800000020000000200000000100
                  180000000000000C0000120B0000120B00000000000000000000FFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA99C
                  979E85799B7E6F9F887CACA3A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9037EA87
                  3AFB9844FE9C46F99743E37D33A76849FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC5425FF9037FFA3
                  46FFA548FFA549FFA448FF9B3FFF802CA65839FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE05B22FF8A40FF91
                  45FF984AFF994BFF9447FF8A3FFF833AC64817FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA5742FFBD9FFFC6
                  A7FFBF9FFFBD9DFFBF9FFFC9ABFA9E7BA05F50FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD8A85D7B2
                  AAF1D1CAF5D6CFEECBC2CD9E95A98883FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFC6BEBDDAD4D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FF9E817B9A746BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFAC877DD1876CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFAC8F88FAAF889F8379FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFC5B9B5FFCAA6D97737A4928BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFC79B86FFC17BE87F30A4755BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFE7E4E2E5A77CFFB460FF9D43DC7F39A97352A4948DFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFC8BAB4EE9D60FFAD56FFA74BFFA349EF8D3DBD7443A18577FF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFB69D91F4994FFFA74DFFA44BFFA64CFFA64CFA9743C8
                  763E9F7F70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFB08268FE9F4AFFA54CFFA34BFFA44BFFA64DFF
                  A74DFB9744BD6F40FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE7A40FFA74DFFA44CFFA34CFFA24BFF
                  A34BFFA44CFFA048DD7331A0887FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFF82604EA08070A57559A67457A07C687F5B49FFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA98573FE9C47FFA44CFFA14AFFA049FF
                  A048FF9E47FF9B44FF9440D66427FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFF9F867DD6783BFEA150FFA853FFA752FFA24EE5843CA28170FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08438FF9E47FF9C46FF9C46FF
                  9B45FF9844FF9441FF8E3CFF8134A36149FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFC75224FF9847FFA651FFAA56FFAB58FFAB57FFB058D67334FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE16B2CFF903EFF9140FF9241FF
                  9240FF8E3DFF893AFF8336FF7F34B9552DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFE05424FF8243FF9B5EFFA059FFA04FFFA756FFA654C36636FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE05D25FF7D32FF7D30FF8236FF
                  883EFF8A44FF8843FF7D36FF752EB6512EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFC14E30FFC6AEFFCBB9FFC7B1FFA373FF813AE86B31B29B95FFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A7E77F1571DFF7536FF8F5BFFA376FF
                  AD84FFB18CFFB491FFB38FFD7741A06454FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFA3837FF6BBACFFDCCCFFD1C1FFD1C0F073499A665BFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFF8B6C5BA64C35FF9770FFB89DFFC0A7FFBFA5FF
                  BFA4FFBFA5FFC6AEFFCBB2B9573CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFA58682DFA193FFE0D2FFEADDDD9380B3AEAEFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFF8665559A6A63F7C0AFFFDBCDFFD2C2FFCFBEFFCFBEFF
                  D2C1FFDCCAFFCEBCB77668FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF937160AF7C75E4B3A8FFE1D7BF8E86A08B89B2AAA9BCB6
                  B6BAB4B4ABA1A09A807DBE918BFFEBE3FFF5EDFFEDE4FFEFE5FFF0E5FFEADEFC
                  D0C4CE978DA98783FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF967564AC908DBB938DCC958FCA918ACB96
                  8ED4A199ECC4BDFFEEE9FFFEFAFFE9E5F6DAD5ECCBC5DAB1ACC49892AE8983C1
                  B1AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD6
                  D6CDC3C2C5B9B9BFB3B2C1B5B4CBBFBFD7CECDFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                OnClick = SpeedButton6Click
                ExplicitLeft = 291
              end
              inherited SpeedButton7: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton8: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton11: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton12: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton23: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton24: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Hint = 'Ver registros da lixeira - [CRM051]'
                OnClick = SpeedButton25Click
              end
              inherited SpeedButton26: TSpeedButton
                Enabled = False
                Visible = False
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
        object tsPerguntasDoPerfil: TTabSheet
          Caption = 'tsPerguntasDoPerfil'
          ImageIndex = 3
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 783
            Height = 37
            Align = alTop
            Caption = 'Perfil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label9: TLabel
              Left = 13
              Top = 16
              Width = 41
              Height = 13
              Caption = 'C'#243'digo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText1: TDBText
              Left = 60
              Top = 16
              Width = 65
              Height = 17
              DataField = 'CODPERFIL'
              DataSource = dtmFollowUpPosAtendimento.dsFlwPerfil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText2: TDBText
              Left = 227
              Top = 16
              Width = 300
              Height = 17
              DataField = 'DESCRICAO'
              DataSource = dtmFollowUpPosAtendimento.dsFlwPerfil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 131
              Top = 16
              Width = 90
              Height = 13
              Caption = 'Descri'#231#227'o Perfil:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText3: TDBText
              Left = 720
              Top = 16
              Width = 65
              Height = 17
              DataField = 'TIPO'
              DataSource = dtmFollowUpPosAtendimento.dsFlwPerfil
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 533
              Top = 16
              Width = 181
              Height = 13
              Caption = 'Tipo (F: FollowUp; P: P'#243's-Venda):'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object GroupBox6: TGroupBox
            Left = 0
            Top = 37
            Width = 783
            Height = 432
            Align = alClient
            Caption = 'Perguntas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object Panel4: TPanel
              Left = 2
              Top = 15
              Width = 779
              Height = 415
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 6
              TabOrder = 0
              object Splitter3: TSplitter
                Left = 6
                Top = 217
                Width = 767
                Height = 3
                Cursor = crVSplit
                Align = alTop
                ExplicitWidth = 221
              end
              object GroupBox7: TGroupBox
                Left = 6
                Top = 6
                Width = 767
                Height = 211
                Align = alTop
                Caption = 'Perguntas cadastradas'
                TabOrder = 0
                object SpeedButton10: TSpeedButton
                  Left = 738
                  Top = 15
                  Width = 27
                  Height = 194
                  Hint = 'Adicionar pergunta ao perfil'
                  Align = alRight
                  Flat = True
                  Glyph.Data = {
                    F6060000424DF606000000000000360000002800000018000000180000000100
                    180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF78BC9C78BB9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFB4DBCA0E8A520E874EB5D9C8FFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFE2F2EB1C96620E935D0E8F581D8E59E2F0E9FF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3AA97D0D955F0DA06C0D9C
                    670E8C543B9D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77C6A90C9864
                    0DA5710DA4710DA16D0D9A650E895178BB9CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3
                    E1D10B9D690CA8750DAB790DA8750DA5710DA26E0D97610E884FB5DAC8FFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFE1F4EE1AA8790BA9770CB2810DAF7D0DAC790DA8760DA5720DA26E0D
                    925C1D8F5AE2F0E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFF38B8900AA9780CB9890CB6850CB3810DAF7E0DAC
                    7A0DA9760DA6730DA16D0D8E573B9E70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75D1B60AAC7B0BBD8D0CBD8D0CBA89
                    0CB6860CB3820CB07E0DAD7B0DAA770DA7730D9F6B0E8B5378BC9CFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3E7D909B0800ABF900B
                    C4950CC1910CBD8E0CBA8A0CB7860CB4830CB17F0DAD7B0DAA780DA7740D9B66
                    0E8951B4DAC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1F6F117BB
                    8F09B98B0AC4950AC1920BBE8E0CC1920CBE8E0CBB8B0CB8870CB5830CB1800C
                    A8740DA4710DA16D0D90591D8F5BE2F0EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFF36C8A308B88A08B58609B28309AF7F09AC7B0BC5970CC2930CBF8F0CBC
                    8C0CB8880CB5840C97620D945E0D915B0D8E570E8B533B9E71FFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF09AF7E0BC99B
                    0BC5970CC2940CBF900CBC8C0CB9890C9965FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFF09B1820BCC9F0BC99C0BC6980BC3940CC0910CBD8D0C9C68FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF08B4850BD0A30BCDA00BCA9C0BC7990BC4950CC0910B
                    9E6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08B6880BD4A80BD1A40BCEA00BCB
                    9D0BC7990BC4960BA16EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF08B98B0AD8AC
                    0BD5A90BD1A50BCEA10BCB9E0BC89A0AA471FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFF07BB8E33E1BE25DCB61FD8B013D3A811D0A40FCDA00AA674FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFF07BE9141E6C53AE3C032DFBB2BDBB524D7AF1CD3A90A
                    A977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF07C09441E8C73AE6C432E2BE2ADE
                    B923DAB31CD6AD09AB7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF06C39732DEBB
                    2DDDB827DAB421D7AF1CD3AA17CFA509AE7DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFF06C59A06C29607BF9307BC8F08B98C08B68808B38409B081FFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                  OnClick = SpeedButton10Click
                  ExplicitLeft = 744
                  ExplicitHeight = 153
                end
                object Panel5: TPanel
                  Left = 2
                  Top = 15
                  Width = 736
                  Height = 194
                  Align = alClient
                  BevelOuter = bvNone
                  BorderWidth = 3
                  TabOrder = 0
                  object DBGrid2: TDBGrid
                    Left = 3
                    Top = 3
                    Width = 730
                    Height = 110
                    Align = alClient
                    DataSource = dtmFollowUpPosAtendimento.dsPergCons
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = DBGrid2KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DESCRICAO'
                        Title.Caption = 'Grupo'
                        Width = 103
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CATEGORIA'
                        Title.Caption = 'Categoria'
                        Width = 102
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PERGUNTA'
                        Title.Caption = 'Pergunta'
                        Width = 239
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COMPLEMENTO'
                        Title.Caption = 'Complemento'
                        Width = 200
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SIMNAONIVEL'
                        Title.Caption = 'Tipo Resp'
                        Width = 60
                        Visible = True
                      end>
                  end
                  object Panel6: TPanel
                    Left = 3
                    Top = 113
                    Width = 730
                    Height = 78
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    TabOrder = 1
                    object Edit1: TEdit
                      Left = 9
                      Top = 2
                      Width = 101
                      Height = 19
                      Ctl3D = False
                      ParentCtl3D = False
                      TabOrder = 0
                      OnChange = Edit1Change
                      OnEnter = Edit1Enter
                      OnExit = Edit1Exit
                    end
                    object Edit2: TEdit
                      Left = 116
                      Top = 2
                      Width = 95
                      Height = 19
                      Ctl3D = False
                      ParentCtl3D = False
                      TabOrder = 1
                      OnChange = Edit2Change
                      OnEnter = Edit2Enter
                      OnExit = Edit2Exit
                    end
                    object Edit3: TEdit
                      Left = 217
                      Top = 2
                      Width = 233
                      Height = 19
                      Ctl3D = False
                      ParentCtl3D = False
                      TabOrder = 2
                      OnChange = Edit3Change
                      OnEnter = Edit3Enter
                      OnExit = Edit3Exit
                    end
                    object Edit4: TEdit
                      Left = 456
                      Top = 2
                      Width = 193
                      Height = 19
                      Ctl3D = False
                      ParentCtl3D = False
                      TabOrder = 3
                      OnChange = Edit4Change
                      OnEnter = Edit4Enter
                      OnExit = Edit4Exit
                    end
                    object Edit5: TEdit
                      Left = 655
                      Top = 2
                      Width = 58
                      Height = 19
                      Ctl3D = False
                      ParentCtl3D = False
                      TabOrder = 4
                      OnChange = Edit5Change
                      OnEnter = Edit5Enter
                      OnExit = Edit5Exit
                    end
                    object Panel11: TPanel
                      Left = 0
                      Top = 21
                      Width = 726
                      Height = 53
                      Align = alBottom
                      BevelOuter = bvNone
                      Enabled = False
                      TabOrder = 5
                      object DBEdit4: TDBEdit
                        Left = 9
                        Top = 31
                        Width = 704
                        Height = 19
                        Ctl3D = False
                        DataField = 'COMPLEMENTO'
                        DataSource = dtmFollowUpPosAtendimento.dsPergCons
                        ParentCtl3D = False
                        TabOrder = 0
                      end
                      object DBEdit3: TDBEdit
                        Left = 9
                        Top = 6
                        Width = 704
                        Height = 19
                        Ctl3D = False
                        DataField = 'PERGUNTA'
                        DataSource = dtmFollowUpPosAtendimento.dsPergCons
                        ParentCtl3D = False
                        TabOrder = 1
                      end
                    end
                  end
                end
              end
              object GroupBox8: TGroupBox
                Left = 6
                Top = 220
                Width = 767
                Height = 189
                Align = alClient
                Caption = 'Perguntas deste Perfil'
                TabOrder = 1
                object Panel7: TPanel
                  Left = 2
                  Top = 15
                  Width = 736
                  Height = 172
                  Align = alClient
                  BevelOuter = bvNone
                  BorderWidth = 3
                  TabOrder = 0
                  object DBGrid3: TDBGrid
                    Left = 3
                    Top = 3
                    Width = 730
                    Height = 113
                    Align = alClient
                    Ctl3D = True
                    DataSource = dtmFollowUpPosAtendimento.dsPerfilPergMem
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    ParentCtl3D = False
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'Tahoma'
                    TitleFont.Style = []
                    OnKeyDown = DBGrid2KeyDown
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'DESCRICAO'
                        Title.Caption = 'Grupo'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'CATEGORIA'
                        Title.Caption = 'Categoria'
                        Width = 100
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'PERGUNTA'
                        Title.Caption = 'Pergunta'
                        Width = 236
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'COMPLEMENTO'
                        Title.Caption = 'Complemento'
                        Width = 200
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'SIMNAONIVEL'
                        Title.Caption = 'Tipo Resp'
                        Width = 60
                        Visible = True
                      end>
                  end
                  object Panel8: TPanel
                    Left = 3
                    Top = 116
                    Width = 730
                    Height = 53
                    Align = alBottom
                    BevelKind = bkTile
                    BevelOuter = bvNone
                    Enabled = False
                    TabOrder = 1
                    object DBEdit5: TDBEdit
                      Left = 9
                      Top = 2
                      Width = 704
                      Height = 19
                      Ctl3D = False
                      DataField = 'PERGUNTA'
                      DataSource = dtmFollowUpPosAtendimento.dsPerfilPergMem
                      ParentCtl3D = False
                      TabOrder = 0
                    end
                    object DBEdit6: TDBEdit
                      Left = 9
                      Top = 27
                      Width = 704
                      Height = 19
                      Ctl3D = False
                      DataField = 'COMPLEMENTO'
                      DataSource = dtmFollowUpPosAtendimento.dsPerfilPergMem
                      ParentCtl3D = False
                      TabOrder = 1
                    end
                  end
                end
                object Panel9: TPanel
                  Left = 738
                  Top = 15
                  Width = 27
                  Height = 172
                  Align = alRight
                  BevelOuter = bvNone
                  TabOrder = 1
                  object SpeedButton9: TSpeedButton
                    Left = 0
                    Top = 0
                    Width = 27
                    Height = 172
                    Hint = 'Remover pergunta do perfil'
                    Align = alRight
                    Flat = True
                    Glyph.Data = {
                      F6060000424DF606000000000000360000002800000018000000180000000100
                      180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF09B08108B384
                      08B68808B98C07BC8F07BF9306C29606C59AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF09AE7D17CFA51CD3AA21D7AF27DAB42DDDB832DEBB06C397FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFF09AB7A1CD6AD23DAB32ADEB932E2BE3AE6C441E8C707
                      C094FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0AA9771CD3A924D7AF2BDBB532DF
                      BB3AE3C041E6C507BE91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0AA6740FCDA0
                      11D0A413D3A81FD8B025DCB633E1BE07BB8EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF0AA4710BC89A0BCB9E0BCEA10BD1A50BD5A90AD8AC08B98BFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFF0BA16E0BC4960BC7990BCB9D0BCEA00BD1A40BD4A808
                      B688FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0B9E6B0CC0910BC4950BC7990BCA
                      9C0BCDA00BD0A308B485FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0C9C680CBD8D
                      0CC0910BC3940BC6980BC99C0BCC9F09B182FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF0C99650CB9890CBC8C0CBF900CC2940BC5970BC99B09AF7EFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B9E710E8B
                      530D8E570D915B0D945E0C97620CB5840CB8880CBC8C0CBF8F0CC2930BC59709
                      AC7B09AF7F09B28308B58608B88A36C8A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFE2F0EA1D8F5B0D90590DA16D0DA4710CA8740CB1800CB5830CB8870CBB
                      8B0CBE8E0CC1920BBE8E0AC1920AC49509B98B17BB8FE1F6F1FFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB4DAC80E89510D9B660DA7740DAA780DAD7B
                      0CB17F0CB4830CB7860CBA8A0CBD8E0CC1910BC4950ABF9009B080B3E7D9FFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF78BC9C0E8B530D
                      9F6B0DA7730DAA770DAD7B0CB07E0CB3820CB6860CBA890CBD8D0BBD8D0AAC7B
                      75D1B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFF3B9E700D8E570DA16D0DA6730DA9760DAC7A0DAF7E0CB3810CB6850C
                      B9890AA97838B890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFE2F0E91D8F5A0D925C0DA26E0DA5720DA8760DAC
                      790DAF7D0CB2810BA9771AA879E1F4EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5DAC80E884F0D9761
                      0DA26E0DA5710DA8750DAB790CA8750B9D69B3E1D1FFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFF78BB9C0E89510D9A650DA16D0DA4710DA5710C986477C6A9FFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFF3B9D6F0E8C540D9C670DA06C0D955F3AA97DFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2F0E91D8E590E8F580E93
                      5D1C9662E2F2EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      B5D9C80E874E0E8A52B4DBCAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFF78BB9B78BC9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
                    OnClick = SpeedButton9Click
                    ExplicitLeft = 142
                    ExplicitTop = 16
                    ExplicitHeight = 27
                  end
                end
              end
            end
          end
          object Panel10: TPanel
            Left = 0
            Top = 469
            Width = 783
            Height = 41
            Align = alBottom
            BevelKind = bkTile
            BevelOuter = bvNone
            TabOrder = 2
            object BitBtn7: TBitBtn
              Left = 355
              Top = 6
              Width = 75
              Height = 25
              Hint = 'Salvar registro - [CRM048]'
              Caption = '&Salvar'
              TabOrder = 0
              OnClick = BitBtn4Click
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
            object BitBtn19: TBitBtn
              Left = 704
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Voltar'
              TabOrder = 1
              OnClick = BitBtn19Click
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
end
