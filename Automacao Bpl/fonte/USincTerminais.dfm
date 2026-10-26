inherited FrmSincTerminais: TFrmSincTerminais
  Caption = 'Op'#231#245'es para Sincroniza'#231#227'o...'
  ClientHeight = 375
  ClientWidth = 589
  Position = poScreenCenter
  ExplicitWidth = 597
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 589
    Height = 375
    ActivePage = TabSheet2
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Sinc. Arq. Movimentos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 104
        Top = 240
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
      end
      object Label2: TLabel
        Left = 285
        Top = 240
        Width = 52
        Height = 13
        Caption = 'Data Final:'
      end
      object Label3: TLabel
        Left = 131
        Top = 267
        Width = 59
        Height = 13
        Caption = 'Opera'#231#227'o...'
      end
      object Label4: TLabel
        Left = 10
        Top = 266
        Width = 115
        Height = 13
        Caption = 'Terminal -> Retaguarda'
      end
      object GroupBox1: TGroupBox
        Left = 288
        Top = 30
        Width = 287
        Height = 185
        Caption = 'Terminais ->Retaguarda'
        TabOrder = 0
        object CheckBox1: TCheckBox
          Left = 16
          Top = 21
          Width = 113
          Height = 17
          Caption = 'Aliquota Terminal'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 16
          Top = 39
          Width = 97
          Height = 17
          Caption = 'Cupons'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 16
          Top = 58
          Width = 97
          Height = 17
          Caption = 'Itens Cupons'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 2
        end
        object CheckBox4: TCheckBox
          Left = 16
          Top = 75
          Width = 97
          Height = 17
          Caption = 'Doc.N'#227'o Fiscais'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 3
        end
        object CheckBox5: TCheckBox
          Left = 16
          Top = 91
          Width = 97
          Height = 17
          Caption = 'Finalizadores'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 4
        end
        object CheckBox6: TCheckBox
          Left = 16
          Top = 108
          Width = 113
          Height = 17
          Caption = 'Formas Pag. Cupom'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 5
        end
        object CheckBox7: TCheckBox
          Left = 16
          Top = 124
          Width = 97
          Height = 17
          Caption = 'Resumo Di'#225'rio'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 6
        end
        object CheckBox8: TCheckBox
          Left = 16
          Top = 141
          Width = 153
          Height = 17
          Caption = 'Detalhes Mapa Resumo'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 7
        end
        object CheckBox9: TCheckBox
          Left = 16
          Top = 157
          Width = 137
          Height = 17
          Caption = 'Sangrias e Suprimentos'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 8
        end
      end
      object MaskEdit1: TMaskEdit
        Left = 167
        Top = 231
        Width = 71
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
      end
      object MaskEdit2: TMaskEdit
        Left = 343
        Top = 231
        Width = 79
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
      end
      object BitBtn1: TBitBtn
        Left = 208
        Top = 310
        Width = 75
        Height = 25
        Caption = '&OK'
        Default = True
        TabOrder = 3
        OnClick = BitBtn1Click
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
      object BitBtn2: TBitBtn
        Left = 314
        Top = 310
        Width = 75
        Height = 25
        Caption = '&Sair'
        TabOrder = 4
        Kind = bkCancel
      end
      object ProgressBar1: TProgressBar
        Left = 8
        Top = 281
        Width = 569
        Height = 17
        TabOrder = 5
      end
      object BitBtn3: TBitBtn
        Left = 506
        Top = 316
        Width = 75
        Height = 19
        Caption = '&Parar >>'
        TabOrder = 6
        OnClick = BitBtn3Click
      end
      object CheckBox10: TCheckBox
        Left = 288
        Top = 8
        Width = 241
        Height = 17
        Caption = 'Sincroniza'#231#227'o Terminal -> Retaguarda'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 30
        Width = 274
        Height = 185
        Caption = 'Retaguarda -> Terminais'
        TabOrder = 8
        object CheckBox11: TCheckBox
          Left = 10
          Top = 21
          Width = 125
          Height = 17
          Caption = 'Impressoras CNIEE'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object CheckBox12: TCheckBox
          Left = 10
          Top = 39
          Width = 167
          Height = 17
          Caption = 'Empresas Desenvolvedoras'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
        end
        object CheckBox13: TCheckBox
          Left = 10
          Top = 58
          Width = 159
          Height = 17
          Caption = 'Softwares Fiscais'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 2
        end
        object CheckBox14: TCheckBox
          Left = 10
          Top = 75
          Width = 151
          Height = 17
          Caption = 'Dados Terminal'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 3
        end
        object CheckBox16: TCheckBox
          Left = 10
          Top = 92
          Width = 151
          Height = 17
          Caption = 'Arquivos Usados Pelo Fiscal'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 4
        end
      end
      object CheckBox15: TCheckBox
        Left = 8
        Top = 8
        Width = 217
        Height = 17
        Caption = 'Sincroniza'#231#227'o Retaguarda -> Terminal'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'HwF.FDB'
      ImageIndex = 1
      object Label5: TLabel
        Left = 26
        Top = 16
        Width = 123
        Height = 13
        Caption = 'Endere'#231'o HwF.FDB Local:'
      end
      object Label6: TLabel
        Left = 13
        Top = 258
        Width = 3
        Height = 13
      end
      object SpeedButton1: TSpeedButton
        Left = 544
        Top = 7
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton1Click
      end
      object Label7: TLabel
        Left = 12
        Top = 48
        Width = 141
        Height = 13
        Alignment = taRightJustify
        Caption = 'Deixar arquivo dispon'#237'vel em:'
      end
      object SpeedButton2: TSpeedButton
        Left = 544
        Top = 39
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = SpeedButton2Click
      end
      object BitBtn4: TBitBtn
        Left = 245
        Top = 192
        Width = 321
        Height = 58
        Caption = 'Preparar e Enviar arquivo para terminais >>'
        TabOrder = 0
        OnClick = BitBtn4Click
      end
      object MaskEdit3: TMaskEdit
        Left = 154
        Top = 8
        Width = 391
        Height = 21
        TabOrder = 1
        OnExit = MaskEdit3Exit
      end
      object ProgressBar2: TProgressBar
        Left = 13
        Top = 279
        Width = 553
        Height = 17
        TabOrder = 2
      end
      object BitBtn5: TBitBtn
        Left = 245
        Top = 302
        Width = 92
        Height = 40
        Caption = 'Parar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = BitBtn5Click
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000130B0000130B000000010000000100000829A5000018
          AD000021AD000829AD001029AD000831AD001031AD001831AD001039AD001839
          AD002139AD000021B5000029B5000829B5001031B5001831B5002139B5000029
          C6001839CE00214ACE000031D6000831D6001031D6001842D6002142D600214A
          D600294AD6000029DE000031DE000831DE000839DE001039DE001839DE001042
          DE001842DE002142DE00184ADE00214ADE00294ADE002952DE003152DE00425A
          DE000031E7000842E700104AE700184AE700214AE700294AE7002152E7002952
          E7003152E7003952E700215AE700295AE700315AE700395AE700425AE7002963
          E7003163E7003963E7004263E7004A63E7004A6BE700526BE7005A6BE7005273
          E7005A73E7006373E700637BE7006B7BE7006B84E7000839EF000842EF001042
          EF00104AEF00184AEF00214AEF001852EF002152EF002952EF00315AEF00395A
          EF00425AEF003963EF004263EF004A63EF00526BEF005273EF00637BEF006B7B
          EF006B84EF007384EF00738CEF007B8CEF008494EF00849CEF008C9CEF0094A5
          EF009CADEF0094A5F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00646464646464
          6464646464646464646464646464646464646464646464646464646464646464
          6464646464646464646464646464646464646464646464646464646464646464
          646464645A0F00040606040606050C0D030D0B02055A64646464646412161718
          18181918181722211F1E1C141104646464646464152331323232323227314E4B
          4A49472A1B016464646464641F26285151525151503535304D4A2B471C026464
          64646464202837543D3D3C3B3B3A3534304D4A481D026464646464642337543D
          3D3D3D3C3B3A3935302D2C491E0D64646464646425533F3F3F3E3E3E3B3A3631
          302D2D4A210D64646464646426553F3F3F3F3E3D3B373631302D2C4B220E6464
          6464646432563F403F3F3D3D3B363131302D4B4C240664646464646452414242
          403E3D3D37364F4F4C4C2E2E25076464646464643C434242413E3D3D5136312F
          2E2E242625076464646464643D454444423F3D52383231272E2E2E3126086464
          646464643D5A5B58433F3D5538373228272F4F311A096464646464643F5D5C5A
          44423F3D3C37373232272728260A64646464646442605F5C5A5843423F3E3D3C
          542937321A076464646464644462625E5C5B5945444443423F3E543326066464
          646464645A61635E5C46464444444357413E533618106464646464645A5A443F
          3E3D383C3852372832322523135A646464646464646464646464646464646464
          6464646464646464646464646464646464646464646464646464646464646464
          6464646464646464646464646464646464646464646464646464}
      end
      object MaskEdit4: TMaskEdit
        Left = 154
        Top = 40
        Width = 391
        Height = 21
        TabOrder = 4
      end
      object RadioGroup1: TRadioGroup
        Left = 13
        Top = 67
        Width = 553
        Height = 33
        Caption = 'Mercadorias'
        Columns = 3
        Items.Strings = (
          'Todas'
          'Mercadorias alteradas'
          'Apenas com pre'#231'os alterados')
        TabOrder = 5
      end
      object RadioGroup2: TRadioGroup
        Left = 13
        Top = 106
        Width = 553
        Height = 33
        Caption = 'Clientes'
        Columns = 3
        Items.Strings = (
          'Todos'
          'Clientes alterados')
        TabOrder = 6
      end
      object RadioGroup3: TRadioGroup
        Left = 13
        Top = 145
        Width = 553
        Height = 33
        Caption = 'Demais registros'
        Columns = 3
        Items.Strings = (
          'Todos'
          'Apenas alterados')
        TabOrder = 7
      end
      object GroupBox3: TGroupBox
        Left = 13
        Top = 181
        Width = 185
        Height = 69
        Caption = 'Data Base'
        TabOrder = 8
        object MaskEdit5: TMaskEdit
          Left = 56
          Top = 24
          Width = 73
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
          OnExit = MaskEdit5Exit
        end
      end
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
  object OpenDialog1: TOpenDialog
    DefaultExt = '.fdb'
    FileName = 'HwF.fdb'
    Filter = 'FireBird/Interbase (*.fdb;*.gdb)|*.fdb;*.gdb'
    InitialDir = 'C:\Basesauto'
    Title = 'Selecionar HwF.fbd'
    Left = 8
    Top = 336
  end
end
