object frmConfServicoNFC: TfrmConfServicoNFC
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o'
  ClientHeight = 399
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 399
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 347
      Width = 446
      Height = 5
      Align = alBottom
      AutoSize = False
      ExplicitTop = 237
      ExplicitWidth = 550
    end
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 446
      Height = 341
      Align = alClient
      BevelKind = bkTile
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 0
      object Label2: TLabel
        Left = 32
        Top = 48
        Width = 92
        Height = 13
        Caption = 'C'#243'digo da Empresa'
      end
      object Label3: TLabel
        Left = 280
        Top = 48
        Width = 68
        Height = 13
        Caption = 'Token Emissor'
      end
      object Label4: TLabel
        Left = 32
        Top = 94
        Width = 140
        Height = 13
        Caption = 'Endere'#231'o do Banco de Dados'
      end
      object Label5: TLabel
        Left = 243
        Top = 151
        Width = 105
        Height = 13
        Caption = 'Threads Ativas NFC-e'
      end
      object Label6: TLabel
        Left = 252
        Top = 178
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = 'Threads Ativas SAT'
        Visible = False
      end
      object Label7: TLabel
        Left = 258
        Top = 205
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sleep Serv Thread'
      end
      object Label8: TLabel
        Left = 244
        Top = 233
        Width = 104
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sleep Serv No Thread'
      end
      object Label9: TLabel
        Left = 120
        Top = 306
        Width = 226
        Height = 13
        Alignment = taRightJustify
        Caption = 'Verificar e enviar notas em conting'#234'ncia a cada'
      end
      object Label10: TLabel
        Left = 405
        Top = 306
        Width = 16
        Height = 13
        Caption = 'min'
      end
      object edCodEmpresa: TEdit
        Left = 32
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'edCodEmpresa'
      end
      object Panel4: TPanel
        Left = 6
        Top = 6
        Width = 430
        Height = 34
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Configura'#231#227'o do Servi'#231'o de Processamento da NFC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edToken: TEdit
        Left = 280
        Top = 67
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'Edit2'
      end
      object ckServerEnvioNFCe: TCheckBox
        Left = 32
        Top = 206
        Width = 174
        Height = 17
        Caption = 'Servidor de Envio de NFC-e'
        Enabled = False
        TabOrder = 4
        Visible = False
      end
      object ckServerEnvioSAT: TCheckBox
        Left = 32
        Top = 229
        Width = 153
        Height = 17
        Caption = 'Servidor de Envio de SAT'
        Enabled = False
        TabOrder = 5
        Visible = False
      end
      object ckServerImpressao: TCheckBox
        Left = 32
        Top = 252
        Width = 209
        Height = 17
        Caption = 'Servidor de Impress'#227'o da NFC'
        Enabled = False
        TabOrder = 6
        Visible = False
      end
      object edBancoDeDados: TEdit
        Left = 32
        Top = 113
        Width = 369
        Height = 21
        TabOrder = 3
        Text = 'edCodEmpresa'
      end
      object ckServerEmail: TCheckBox
        Left = 32
        Top = 275
        Width = 185
        Height = 17
        Caption = 'Servidor de Envio de email da NFC'
        Enabled = False
        TabOrder = 7
        Visible = False
      end
      object edSleepThread: TSpinEdit
        Left = 352
        Top = 202
        Width = 49
        Height = 22
        MaxValue = 2000
        MinValue = 50
        TabOrder = 12
        Value = 500
      end
      object edSleepNoThread: TSpinEdit
        Left = 352
        Top = 230
        Width = 49
        Height = 22
        MaxValue = 2000
        MinValue = 50
        TabOrder = 13
        Value = 500
      end
      object edThreadNFCe: TSpinEdit
        Left = 352
        Top = 146
        Width = 49
        Height = 22
        MaxValue = 999
        MinValue = 1
        TabOrder = 10
        Value = 10
      end
      object edThreadSAT: TSpinEdit
        Left = 352
        Top = 174
        Width = 49
        Height = 22
        MaxValue = 999
        MinValue = 1
        TabOrder = 11
        Value = 10
        Visible = False
      end
      object ckSalvarLogNFCe: TCheckBox
        Left = 32
        Top = 153
        Width = 209
        Height = 17
        Caption = 'Salvar Log NFC-e'
        TabOrder = 8
      end
      object ckSalvarLogSAT: TCheckBox
        Left = 32
        Top = 183
        Width = 140
        Height = 17
        Caption = 'Salvar Log SAT Fiscal'
        Enabled = False
        TabOrder = 9
        Visible = False
      end
      object edTimeVerConting: TSpinEdit
        Left = 350
        Top = 303
        Width = 49
        Height = 22
        MaxValue = 59
        MinValue = 1
        TabOrder = 14
        Value = 59
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 352
      Width = 446
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 183
        Top = 6
        Width = 75
        Height = 25
        Caption = '&Salvar'
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
        TabOrder = 0
        OnClick = BitBtn1Click
      end
    end
  end
end
