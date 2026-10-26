object frmSpedPISCOFINS: TfrmSpedPISCOFINS
  Left = 0
  Top = 0
  Caption = 'SPED PIS/COFINS'
  ClientHeight = 332
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 599
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    ExplicitHeight = 312
    object GroupBox2: TGroupBox
      Left = 6
      Top = 175
      Width = 587
      Height = 110
      Align = alBottom
      Caption = 'Status da Montagem'
      TabOrder = 1
      ExplicitTop = 155
      object lbBloco: TLabel
        Left = 16
        Top = 40
        Width = 59
        Height = 13
        Caption = 'N'#227'o Iniciada'
      end
      object lbTempo: TLabel
        Left = 537
        Top = 40
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tempo'
      end
      object lbCupons: TLabel
        Left = 242
        Top = 40
        Width = 44
        Height = 13
        Caption = 'lbCupons'
      end
      object lbStatus: TLabel
        Left = 89
        Top = 40
        Width = 99
        Height = 13
        Caption = 'Aguardando Inicio...'
      end
      object lbEmpresa: TLabel
        Left = 16
        Top = 21
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object ProgressBar1: TProgressBar
        Left = 16
        Top = 59
        Width = 553
        Height = 17
        TabOrder = 0
      end
      object ProgressBar2: TProgressBar
        Left = 16
        Top = 82
        Width = 553
        Height = 17
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 285
      Width = 587
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 265
      object btIniciar: TBitBtn
        Left = 213
        Top = 6
        Width = 75
        Height = 25
        Hint = 'Iniciar montagem do Arquivo SPED'
        Caption = 'Iniciar'
        TabOrder = 0
        OnClick = btIniciarClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000130B0000130B00000001000000010000004A00000052
          000000630000089C2100109C210010A5290010AD390039AD390010B5390018B5
          4A004ABD520052BD52005ABD52005AC65A0063C663006BC663006BC66B007BD6
          7B008CD68C00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00131313131313
          1313131313131313131313131313131313131313131313131313131313131300
          0200131313131313131313131313130203020013131313131313131313131302
          0403020013131313131313131313130205050302001313131313131313131302
          0805030302001313131313131313130209060606050201131313131313131302
          0B0C0A0A0A02011313131313131313020D100F0A020013131313131313131302
          101111020013131313131313131313020E120200131313131313131313131302
          0702001313131313131313131313130002001313131313131313131313131313
          1313131313131313131313131313131313131313131313131313}
      end
      object btSair: TBitBtn
        Left = 294
        Top = 6
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 1
        OnClick = btSairClick
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
    object Panel2: TPanel
      Left = 8
      Top = 71
      Width = 585
      Height = 153
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      OnExit = Panel2Exit
      object GroupBox5: TGroupBox
        Left = 14
        Top = 30
        Width = 553
        Height = 57
        Caption = 'N'#250'mero do Recibo da Escritura'#231#227'o anterior a ser retificada'
        TabOrder = 0
        object Edit1: TEdit
          Left = 57
          Top = 24
          Width = 467
          Height = 21
          TabOrder = 0
        end
      end
      object BitBtn1: TBitBtn
        Left = 253
        Top = 103
        Width = 75
        Height = 25
        Caption = 'Continuar'
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00A211149525FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF21B93620B3350FB224449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42C95637D04F37CB4D31C34518
          B52FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          54CD6548E46247E06040D05640D75837D44F56A561FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF4BD46055F16F52EE6D50D965FFF4FF4ADF6149
          DD6033DE4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF70D6804BED66
          4EF06A59D96DFFF3FFFFFFFFFFFFFF44EB6051E86A3EBC51FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF5BD36D89D193FFFCFFFFFFFFFFFFFFFFFFFF6A
          E47C55EC6F51F86C79A37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41E75D5BEF7443E45D449E50FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF43E35E43E35E56F0714AB85BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51CE643ED45644EA6077A0
          7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF37C14B40C95628CD4228CD42FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37C14B36BC4A4FC8
          6138B44A449E50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF72C57C36B44844C257449E50FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40B2
          4E29A83C1AAE2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF449E50FFFFFFFFFFFF}
      end
    end
    object GroupBox3: TGroupBox
      Left = 6
      Top = 6
      Width = 587
      Height = 148
      Align = alTop
      Caption = 'Dados para Montagem do Arquivo'
      TabOrder = 0
      object Label3: TLabel
        Left = 16
        Top = 21
        Width = 59
        Height = 13
        Caption = 'Per'#237'odo  De:'
      end
      object Label4: TLabel
        Left = 160
        Top = 21
        Width = 16
        Height = 13
        Caption = 'at'#233
      end
      object Label1: TLabel
        Left = 16
        Top = 115
        Width = 51
        Height = 13
        Caption = 'Salvar em:'
      end
      object SpeedButton1: TSpeedButton
        Left = 546
        Top = 106
        Width = 23
        Height = 22
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 446
        Top = 21
        Width = 44
        Height = 13
        Caption = 'Tipo Arq:'
      end
      object dtIni: TMaskEdit
        Left = 81
        Top = 16
        Width = 73
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = dtIniExit
      end
      object dtFim: TMaskEdit
        Left = 182
        Top = 16
        Width = 73
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnExit = dtFimExit
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 64
        Width = 553
        Height = 37
        Caption = 'Blocos'
        TabOrder = 3
        object ckBloco0: TCheckBox
          Left = 21
          Top = 16
          Width = 32
          Height = 17
          Caption = '0'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 0
        end
        object ckBlocoA: TCheckBox
          Left = 89
          Top = 16
          Width = 32
          Height = 17
          Caption = 'A'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object ckBlocoC: TCheckBox
          Left = 158
          Top = 16
          Width = 32
          Height = 17
          Caption = 'C'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object ckBlocoM: TCheckBox
          Left = 363
          Top = 17
          Width = 32
          Height = 17
          Caption = 'M'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object ckBlocoD: TCheckBox
          Left = 226
          Top = 16
          Width = 32
          Height = 17
          Caption = 'D'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object ckBloco1: TCheckBox
          Left = 432
          Top = 16
          Width = 32
          Height = 17
          Caption = '1'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object ckBlocoF: TCheckBox
          Left = 295
          Top = 16
          Width = 32
          Height = 17
          Caption = 'F'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object ckBloco9: TCheckBox
          Left = 501
          Top = 16
          Width = 32
          Height = 17
          Caption = '9'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 7
        end
      end
      object edDestino: TEdit
        Left = 73
        Top = 107
        Width = 467
        Height = 21
        TabOrder = 4
        Text = 'C:\SpedPISCOFINS.txt'
        OnExit = edDestinoExit
      end
      object ComboBox1: TComboBox
        Left = 496
        Top = 16
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = 'Original'
        Items.Strings = (
          'Original'
          'Substituto')
      end
      object ckRefazerCalculoPISCOFINS: TCheckBox
        Left = 261
        Top = 17
        Width = 164
        Height = 17
        Caption = 'Refazer c'#225'lculos PIS e COFINS'
        TabOrder = 5
        OnClick = ckRefazerCalculoPISCOFINSClick
      end
      object ckAltCST4998: TCheckBox
        Left = 261
        Top = 40
        Width = 308
        Height = 17
        Caption = 'Alterar CST para 49 e 98 nas opera'#231#245'es de transferencias'
        TabOrder = 6
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 464
    Top = 232
    object SalvarLogSpedFiscal1: TMenuItem
      Caption = 'Salvar Log SpedFiscal'
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Texto(*.txt)|*.txt'
    Title = 'Salvar como'
    Left = 528
    Top = 232
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 496
    Top = 232
  end
  object XPManifest1: TXPManifest
    Left = 552
    Top = 232
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 208
    object CreditosAnteriores1: TMenuItem
      Caption = 'Creditos Anteriores'
      OnClick = CreditosAnteriores1Click
    end
    object RetencoesAnteriores1: TMenuItem
      Caption = 'Retencoes Anteriores'
      OnClick = RetencoesAnteriores1Click
    end
  end
end
