object FrmCadNFSeConfig: TFrmCadNFSeConfig
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es NFSe'
  ClientHeight = 629
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBottom: TPanel
    Left = 0
    Top = 588
    Width = 592
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 585
    object btSair: TBitBtn
      AlignWithMargins = True
      Left = 12
      Top = 8
      Width = 79
      Height = 25
      Margins.Left = 12
      Margins.Top = 8
      Margins.Right = 6
      Margins.Bottom = 8
      Align = alLeft
      Caption = ' Sair'
      ModalResult = 2
      TabOrder = 0
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
    object btSalvar: TBitBtn
      Left = 273
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Salvar Configura'#231#227'o NFSe - [NFS040]'
      Caption = 'S&alvar'
      TabOrder = 1
      OnClick = btSalvarClick
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 588
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 585
    object lbInfoTransicao: TLabel
      Left = 12
      Top = 560
      Width = 481
      Height = 14
      Caption = 
        'Voc'#234' ainda poder'#225' usar o outro m'#243'dulo antigo ou desativa-lo defi' +
        'nitivamente se preferir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16744448
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 207
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      ExplicitTop = 174
      object Label5: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'S'#233'rie NFSe'
        Layout = tlCenter
      end
      object edSerie: TMaskEdit
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 156
        Height = 21
        Align = alLeft
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 75
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitTop = 42
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Optante Simples Nacional'
        Layout = tlCenter
      end
      object edOpSimpNac: TComboBox
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 318
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 108
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitTop = 75
      object Label2: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Regime Apura'#231#227'o Simples Nacional'
        Layout = tlCenter
      end
      object edRegApTribSN: TComboBox
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 318
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 141
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      ExplicitTop = 108
      object Label3: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Regime Especial de Tributa'#231#227'o'
        Layout = tlCenter
      end
      object edRegEsTrib: TComboBox
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 318
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 174
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      ExplicitTop = 141
      object Label4: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Opera'#231#227'o Interna Padr'#227'o NFSe Avulsa'
        Layout = tlCenter
      end
      inline ComboBoxOpInternasFrame1: TComboBoxOpInternasFrame
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 318
        Height = 21
        Align = alLeft
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 246
        ExplicitTop = 3
        ExplicitWidth = 318
        ExplicitHeight = 21
        inherited pnInfo: TPanel
          Top = 5
          Width = 318
          ExplicitTop = 5
          ExplicitWidth = 318
        end
        inherited edOpInternas: TComboBox
          Width = 318
          ExplicitWidth = 318
        end
      end
    end
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 9
      Width = 586
      Height = 27
      Margins.Top = 9
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label6: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Layout NFSe'
        Layout = tlCenter
        ExplicitTop = -13
      end
      object edLayoutNFSe: TComboBox
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 318
        Height = 21
        Align = alLeft
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = edLayoutNFSeChange
      end
    end
    object Panel8: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 240
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
      ExplicitTop = 207
      object Label7: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Frase secreta (Web Service)'
        Layout = tlCenter
      end
      object edWSFraseSecreta: TMaskEdit
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 156
        Height = 21
        Align = alLeft
        PasswordChar = '*'
        TabOrder = 0
      end
    end
    object Panel9: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 306
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 9
      ExplicitTop = 273
      object Label8: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Senha (Web Service)'
        Layout = tlCenter
      end
      object edWSSenha: TMaskEdit
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 156
        Height = 21
        Align = alLeft
        PasswordChar = '*'
        TabOrder = 0
      end
    end
    object Panel10: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 273
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 8
      ExplicitTop = 240
      object Label9: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Chave de acesso (Web Service)'
        Layout = tlCenter
      end
      object edWSChaveAcesso: TMaskEdit
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 156
        Height = 21
        Align = alLeft
        PasswordChar = '*'
        TabOrder = 0
      end
    end
    object Panel11: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 339
      Width = 586
      Height = 135
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 10
      ExplicitTop = 314
      object ckEnviarInscricaoMunicipal: TCheckBox
        AlignWithMargins = True
        Left = 9
        Top = 23
        Width = 271
        Height = 17
        Caption = 'Enviar Inscri'#231#227'o Municipal (Layout Nacional apenas)'
        TabOrder = 0
      end
      object ckInibirValTrib: TCheckBox
        AlignWithMargins = True
        Left = 9
        Top = 46
        Width = 331
        Height = 17
        Caption = 'Inibir Valor aproximado dos Tributos (Layout Nacional apenas)'
        TabOrder = 1
      end
      object ckPreferirAliqSNaoIbpt: TCheckBox
        AlignWithMargins = True
        Left = 9
        Top = 69
        Width = 363
        Height = 17
        Caption = 
          'Preferir aliquota SN as aliquotas IBPT p/ Val aprx trib (Layout ' +
          'Nacional)'
        TabOrder = 2
      end
      object ckIncentivoCultural: TCheckBox
        AlignWithMargins = True
        Left = 9
        Top = 92
        Width = 219
        Height = 17
        Caption = 'Incentivador Cultural (Layout Prefeitura)'
        TabOrder = 3
      end
      object ckConvenioAtivo: TCheckBox
        AlignWithMargins = True
        Left = 9
        Top = 0
        Width = 320
        Height = 17
        Caption = 'Conv'#234'nio com Sistema Nacional Ativo(Layout Nacional apenas)'
        TabOrder = 4
      end
      object ckAgruparPorCTribNac: TCheckBox
        AlignWithMargins = True
        Left = 9
        Top = 115
        Width = 568
        Height = 17
        Caption = 
          'Usar c'#243'digo fiscal CTribNac no lugar do Cod LC 116 na cria'#231#227'o de' +
          ' NFSe das Ordens de Servi'#231'o (Layout Prefeitura)'
        TabOrder = 5
      end
    end
    object ckDiscriminacaoSimplificada: TCheckBox
      AlignWithMargins = True
      Left = 12
      Top = 476
      Width = 363
      Height = 17
      Caption = 
        'Montar Discrimina'#231#227'o dos Servi'#231'os Reduzida (Sem observa'#231#245'es da O' +
        '.S)'
      TabOrder = 11
    end
    object btDesativarModuloAntigo: TBitBtn
      Left = 12
      Top = 523
      Width = 565
      Height = 31
      Caption = 'Definir m'#243'dulo novo como Padr'#227'o para novas emiss'#245'es de NFSe'#39's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 33023
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = btDesativarModuloAntigoClick
    end
    object ckDcomptIgualDataAtual: TCheckBox
      AlignWithMargins = True
      Left = 12
      Top = 499
      Width = 565
      Height = 17
      Caption = 
        'Ao criar a NFSe a partir de O.S. preferir "Data Presta'#231#227'o" igual' +
        ' a "Data Atual" em vez de "Data Fechamento O.S."'
      TabOrder = 13
    end
    object Panel12: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 42
      Width = 586
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 30
      object Label10: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 237
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Comunica'#231#227'o do sistema'
        Layout = tlCenter
        ExplicitTop = -13
      end
      object SpeedButton1: TSpeedButton
        AlignWithMargins = True
        Left = 565
        Top = 3
        Width = 22
        Height = 21
        Margins.Left = 0
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E2E2E2FDFDFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E2
          6F6F6F747474B2B2B1EFEEECF8F7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD7C7C7C8B8B8ADBD9D6DEDCD8DCD9D5DC
          D9D5B1DDECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BBBBBAE1E0DDE4E2DFE1DFDCBED6DB43BAE202A5E850C8F2FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F5E9E7E5E6E5E2E4E2DF79D0E402
          AEE703A1E502A4E84CC6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFBFBEBEAE8C7E2E77CD3E70DC1ED00BEED02AEE703A1E502A4E84CC6F2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEED47D6F300CDF500BEED00
          BEED00BEED02AEE703A1E502A4E84CC6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8EDF700D5FE00D8FE00CDF500BEED00BEED00BEED02AEE703A1E502A4
          E84CC6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FDBFB00D5FF00D8FE00
          CDF600BEED00BEED00BEED02AEE703A1E502A4E849C5F2FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF4EDBFB00D5FF00D8FE00CDF600BEED00BEED00BEED02AE
          E703A1E533BCEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FDBFB00
          D5FF00D8FE00CDF600BEED00BEED00BEED52CAF0FEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FDBFB00D5FF00D8FE00CDF600BEED70DB
          F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF4FDAFB00D5FF00D8FE51DBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4FDBFB32D8FBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = SpeedButton1Click
        ExplicitLeft = 567
      end
      object edComunicacaoSistema: TComboBox
        AlignWithMargins = True
        Left = 246
        Top = 3
        Width = 318
        Height = 21
        Margins.Right = 1
        Align = alLeft
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
end
