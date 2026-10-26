object frmHwUtilsDxMigracaoFormulario: TfrmHwUtilsDxMigracaoFormulario
  Left = 0
  Top = 0
  Caption = 'Migra'
  ClientHeight = 486
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 486
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 599
      Height = 71
      Align = alTop
      Caption = 'Acesso e configura'#231#245'es'
      TabOrder = 0
      object Label3: TLabel
        Left = 49
        Top = 22
        Width = 73
        Height = 13
        Caption = 'Usu'#225'rio padr'#227'o'
      end
      object lbURL: TLabel
        Left = 128
        Top = 46
        Width = 27
        Height = 13
        Caption = 'lbURL'
      end
      object lbStatus: TLabel
        Left = 50
        Top = 46
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edUsuarioPadrao: TMaskEdit
        Left = 128
        Top = 19
        Width = 372
        Height = 21
        TabOrder = 0
        Text = 'joaopedro@hwsistemas.com.br'
      end
      object btIniciar: TBitBtn
        Left = 506
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 1
        OnClick = btIniciarClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 6
      Top = 77
      Width = 599
      Height = 403
      Align = alClient
      Caption = 'Sugest'#227'o'
      TabOrder = 1
      object Label5: TLabel
        Left = 74
        Top = 75
        Width = 34
        Height = 13
        Caption = 'M'#243'dulo'
      end
      object Label4: TLabel
        Left = 69
        Top = 102
        Width = 39
        Height = 13
        Caption = 'Assunto'
      end
      object Label1: TLabel
        Left = 12
        Top = 48
        Width = 96
        Height = 13
        Caption = 'Usu'#225'rio q cadastrou'
      end
      object Label6: TLabel
        Left = 41
        Top = 129
        Width = 67
        Height = 13
        Caption = 'Proposta/Erro'
      end
      object lbDados: TLabel
        Left = 12
        Top = 26
        Width = 45
        Height = 13
        Caption = 'lbDados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btStatus: TSpeedButton
        Left = 479
        Top = 44
        Width = 102
        Height = 22
        OnClick = btStatusClick
      end
      object edModulo: TComboBox
        Left = 210
        Top = 72
        Width = 371
        Height = 21
        TabOrder = 2
        OnExit = edModuloExit
      end
      object edAssunto: TComboBox
        Left = 210
        Top = 99
        Width = 371
        Height = 21
        TabOrder = 4
        OnExit = edAssuntoExit
      end
      object edUsuario: TComboBox
        Left = 114
        Top = 45
        Width = 359
        Height = 21
        TabOrder = 0
      end
      object edPropErro: TMemo
        Left = 12
        Top = 153
        Width = 569
        Height = 183
        TabOrder = 6
      end
      object btMigrar: TBitBtn
        Left = 12
        Top = 342
        Width = 100
        Height = 43
        Caption = 'Migrar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = btMigrarClick
      end
      object btNaoMigrar: TBitBtn
        Left = 128
        Top = 342
        Width = 100
        Height = 43
        Caption = 'N'#227'o Migrar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = btNaoMigrarClick
      end
      object edTitulo: TEdit
        Left = 114
        Top = 126
        Width = 467
        Height = 21
        TabOrder = 5
      end
      object edLastMessage: TMemo
        Left = 234
        Top = 342
        Width = 347
        Height = 43
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          'edLastMessage')
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object edPesqModulo: TEdit
        Left = 114
        Top = 72
        Width = 90
        Height = 21
        TabOrder = 1
        OnKeyDown = edPesqModuloKeyDown
      end
      object edPesqAssunto: TEdit
        Left = 114
        Top = 99
        Width = 90
        Height = 21
        TabOrder = 3
        OnKeyDown = edPesqAssuntoKeyDown
      end
    end
  end
end
