inherited FrmCadCstMudCliente: TFrmCadCstMudCliente
  Left = 471
  Top = 67
  Caption = 'Defini'#231#245'es de Emiss'#227'o de Nota Fiscal'
  ClientWidth = 573
  OnCreate = FormCreate
  ExplicitWidth = 579
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 573
    ExplicitWidth = 573
    inherited BitBtn3: TBitBtn
      Hint = 'Salvar Registro - [CLI161]'
      OnClick = BitBtn3Click
    end
    inherited BitBtn4: TBitBtn
      Hint = 'Cancelar Registro - [CLI162]'
      ModalResult = 0
    end
    inherited CheckBox1: TCheckBox
      Enabled = False
      Visible = False
    end
    inherited BitBtn6: TBitBtn
      Caption = '&Sair'
      OnClick = BitBtn6Click
    end
  end
  inherited Panel1: TPanel
    Width = 573
    ExplicitWidth = 573
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 569
      Height = 401
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'TabSheet1'
        OnShow = TabSheet1Show
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 561
          Height = 373
          Align = alClient
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 2
            Top = 15
            Width = 557
            Height = 320
            Align = alClient
            DataSource = DtmClientes.dsCstMudCl
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnKeyDown = DBGrid1KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'COD_CLIENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_EMPRESA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CST_INTERNO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CST_EXTERNO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALIQ_INTERNA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALIQ_EXTERNA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CFOP_INTERNO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CFOP_EXTERNO'
                Visible = True
              end>
          end
          object GroupBox10: TGroupBox
            Left = 2
            Top = 335
            Width = 557
            Height = 36
            Align = alBottom
            TabOrder = 1
            object BitBtn7: TBitBtn
              Left = 4
              Top = 9
              Width = 75
              Height = 22
              Hint = 'Incluir Registro - [CLI158]'
              Caption = '&Incluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = BitBtn7Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000420B0000420B00000001000000010000B5847300AD73
                8400B5848400B58C8400B5948C00D6BDB500C6C6C600EFD6C600CECECE00D6D6
                D600DEDEDE00E7E7E700EFEFEF0042B5F7008CD6F700B5DEF700F7F7F700FF00
                FF003184FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00111111111111
                1111111111111111111111111101020202020202020202020211111111011313
                1313131313131313021111111101131313131313131313130211111111011313
                1313131313131313021111111101131313131313131313130211111111011313
                1313131313131313021111111101131313131313131313130211111111011313
                13131313131313130211111112121210101010101010101002111111120D120C
                0C0C0C0C0C0C0C0C02111212120D1212120B0B0B0B0004030211120E0F0F0F0E
                120A0A0A0600131302111212120F1212120909090600130211111111120F1208
                0808080806000211111111111212120707070707050011111111}
            end
            object BitBtn9: TBitBtn
              Left = 84
              Top = 9
              Width = 75
              Height = 22
              Hint = 'Editar Registro - [CLI159]'
              Caption = '&Alterar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = BitBtn9Click
              Glyph.Data = {
                6E030000424D6E030000000000006E0200002800000010000000100000000100
                08000000000000010000120B0000120B00008E0000008E00000000000000FFFF
                FF00FF00FF0062555D00745D65006B5D62008C6D7300A4676900A0656700925C
                5E00764C4E007D525400633B3C0081535400865151008E575700865252008753
                5300B6757500B4767600B8797900B2757500B07474008A5B5B0097666600CA8B
                8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1A100E1A1A100E6A6A600302D
                2D007E444200875958008C5E5D00DD908C00E9A4A1009E5D5800D8C2C000DCC7
                C500955F5600A0675B00A56B5F005B3D37005E3F3900A7756B00583C35005C3F
                3800DAC1BA00C1836C00BC826800CFB5AA00F8F2EF00D7C1B500FBF4F000FAF3
                EF00D1926D00F7F2EF00DA9D7500E1CEC000FEF7F200FBF4EF00E7AB7900FAEF
                E600EBDCCE00FAEFE500D1914F00F8EADC00FAF0E600FEF7F000FCF6F000EEDD
                CA00DCC1A000F6E0C6009C8F8000F7E5CF00F8EADA00FCF6EF00DCB27A00DCB5
                8100C2A07400AD926F00917B5E0086725800BFA4800099846800C4AA8900F0D8
                BA00FFF4E500E9BD7F00E7BC7E00E2B87E00D1AB7400B5976C009A815D00A78C
                6600CFAF82007D6B51007A695000FEEFDA004B474100F0E5D500FCF3E600FCF7
                F000E9BF7D00EFC48100CEAA7300FCEACE00FFFEFC00FFFBF000FFFEFB00FFFE
                F700FFFFFC008F9F9D003745460006BBF0000C98BD00068FC1001E799F002D84
                A70022576C000393DE00036292000D4663000B3B5400165E820021252700008E
                DE000263BF003E4145001031D3000320BA000318B200000F95002F45ED000C19
                B400010B9900010A95002732D000000081000202020202020202020202020202
                020207070707070707070707070707020202076D594A585662515D5C5B6B0702
                02022B654B218074575352505C6B070202022B5A4D4C7D7C7E66545F5E6A0702
                02022F6F45497A7F040B2E55616C080202022F72464E730325140F2D63600902
                020234013E416705261B151130640D02020234016E484142241E1A1310310A02
                02023A01016E47433D231F1C160E0C0202023A0101016E694337172019122283
                02023C010101016E4F6835181D06787676023C01010101017071322A27797581
                878D4001010101010101292C44777B85868A40383F3939363B3B282C33028288
                848B403A3A3A3A3A3A3A3A2C0202028C8902}
            end
            object BitBtn12: TBitBtn
              Left = 165
              Top = 9
              Width = 75
              Height = 22
              Hint = 'Excluir Registro - [CLI160]'
              Caption = '&Deletar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = BitBtn12Click
              Glyph.Data = {
                36050000424D3605000000000000360400002800000010000000100000000100
                08000000000000010000220B0000220B000000010000000100000031DE000031
                E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
                0404040404040404000004000004040404040404040404000004040000000404
                0404040404040000040404000000000404040404040000040404040402000000
                0404040400000404040404040404000000040000000404040404040404040400
                0101010004040404040404040404040401010204040404040404040404040400
                0201020304040404040404040404030201040403030404040404040404050203
                0404040405030404040404040303050404040404040303040404040303030404
                0404040404040403040403030304040404040404040404040404030304040404
                0404040404040404040404040404040404040404040404040404}
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 1
        OnShow = TabSheet2Show
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 561
          Height = 373
          Align = alClient
          ParentBackground = False
          TabOrder = 0
          object Label6: TLabel
            Left = 17
            Top = 25
            Width = 79
            Height = 13
            Caption = 'CST do Produto:'
            FocusControl = DBEdit3
          end
          object Label7: TLabel
            Left = 31
            Top = 67
            Width = 65
            Height = 13
            Caption = 'CST a utilizar:'
            FocusControl = DBEdit4
          end
          object Label8: TLabel
            Left = 174
            Top = 25
            Width = 98
            Height = 13
            Caption = 'Al'#237'quota do Produto:'
            FocusControl = DBEdit5
          end
          object Label9: TLabel
            Left = 188
            Top = 67
            Width = 84
            Height = 13
            Caption = 'Al'#237'quota a utilizar:'
            FocusControl = DBEdit6
          end
          object Label10: TLabel
            Left = 376
            Top = 67
            Width = 72
            Height = 13
            Caption = 'CFOP a utilizar:'
            FocusControl = DBEdit8
          end
          object Label11: TLabel
            Left = 362
            Top = 25
            Width = 86
            Height = 13
            Caption = 'CFOP do Produto:'
            FocusControl = DBEdit7
          end
          object DBEdit4: TDBEdit
            Left = 98
            Top = 64
            Width = 64
            Height = 21
            DataField = 'CST_EXTERNO'
            DataSource = DtmClientes.dsCstMudCl
            TabOrder = 3
            OnExit = DBEdit4Exit
          end
          object DBEdit3: TDBEdit
            Left = 98
            Top = 22
            Width = 64
            Height = 21
            DataField = 'CST_INTERNO'
            DataSource = DtmClientes.dsCstMudCl
            TabOrder = 0
            OnExit = DBEdit3Exit
          end
          object DBEdit6: TDBEdit
            Left = 274
            Top = 64
            Width = 64
            Height = 21
            DataField = 'ALIQ_EXTERNA'
            DataSource = DtmClientes.dsCstMudCl
            TabOrder = 4
          end
          object DBEdit5: TDBEdit
            Left = 274
            Top = 22
            Width = 64
            Height = 21
            DataField = 'ALIQ_INTERNA'
            DataSource = DtmClientes.dsCstMudCl
            TabOrder = 1
            OnExit = DBEdit5Exit
          end
          object DBEdit7: TDBEdit
            Left = 450
            Top = 22
            Width = 64
            Height = 21
            DataField = 'CFOP_INTERNO'
            DataSource = DtmClientes.dsCstMudCl
            TabOrder = 2
            OnExit = DBEdit7Exit
          end
          object DBEdit8: TDBEdit
            Left = 450
            Top = 64
            Width = 64
            Height = 21
            DataField = 'CFOP_EXTERNO'
            DataSource = DtmClientes.dsCstMudCl
            TabOrder = 5
          end
        end
      end
    end
  end
end
