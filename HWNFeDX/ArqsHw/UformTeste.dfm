object frmTestes_DFe: TfrmTestes_DFe
  Left = 0
  Top = 81
  Caption = 'frmTestes_DFe'
  ClientHeight = 409
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 645
    Height = 409
    ActivePage = TabSheet10
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'NFe 3.10'
      object BitBtn1: TBitBtn
        Left = 8
        Top = 8
        Width = 125
        Height = 25
        Caption = 'Enviar NFe'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object Button1: TButton
        Left = 8
        Top = 39
        Width = 125
        Height = 25
        Caption = 'Modulo NFe'
        TabOrder = 1
        OnClick = Button1Click
      end
      object BitBtn4: TBitBtn
        Left = 8
        Top = 70
        Width = 125
        Height = 25
        Caption = 'Cons.NFeSite'
        TabOrder = 2
        OnClick = BitBtn4Click
      end
      object BitBtn6: TBitBtn
        Left = 8
        Top = 101
        Width = 125
        Height = 25
        Caption = 'Consulta NFe'
        TabOrder = 3
        OnClick = BitBtn6Click
      end
      object Button2: TButton
        Left = 8
        Top = 132
        Width = 125
        Height = 25
        Caption = 'Valida Chave'
        TabOrder = 4
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 163
        Width = 125
        Height = 25
        Caption = 'Enviar Evento'
        TabOrder = 5
        OnClick = Button3Click
      end
      object Button5: TButton
        Left = 8
        Top = 194
        Width = 125
        Height = 25
        Caption = 'Enviar Evento por Email'
        TabOrder = 6
        OnClick = Button5Click
      end
      object BitBtn3: TBitBtn
        Left = 152
        Top = 8
        Width = 125
        Height = 25
        Caption = 'Consultar NFe'
        TabOrder = 7
        OnClick = BitBtn3Click
      end
      object BitBtn5: TBitBtn
        Left = 152
        Top = 39
        Width = 125
        Height = 25
        Caption = 'Verifica SCAN'
        TabOrder = 8
        OnClick = BitBtn5Click
      end
      object Button4: TButton
        Left = 152
        Top = 70
        Width = 125
        Height = 25
        Caption = 'Imprimir Evento'
        TabOrder = 9
        OnClick = Button4Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'NFe 4.00'
      ImageIndex = 1
      object memoNFe400: TMemo
        Left = 0
        Top = 169
        Width = 637
        Height = 212
        Align = alClient
        Lines.Strings = (
          'memoNFe400')
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 637
        Height = 35
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 1
        object cbBancos: TComboBox
          Left = 3
          Top = 3
          Width = 581
          Height = 21
          TabOrder = 0
          Text = 'cbBancos'
          OnExit = cbBancosExit
        end
        object spedCodEmp: TSpinEdit
          Left = 590
          Top = 3
          Width = 35
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 35
        Width = 637
        Height = 134
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 2
        object Label2: TLabel
          Left = 17
          Top = 9
          Width = 49
          Height = 13
          Caption = 'C'#243'digo NF'
        end
        object Label3: TLabel
          Left = 8
          Top = 34
          Width = 58
          Height = 13
          Caption = 'Lote Evento'
        end
        object Label4: TLabel
          Left = 13
          Top = 61
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Seqid Inutil'
        end
        object btNFe4_Enviar: TBitBtn
          Left = 199
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Enviar'
          TabOrder = 0
          OnClick = btNFe4_EnviarClick
        end
        object edNumNota: TMaskEdit
          Left = 72
          Top = 4
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '0'
          OnExit = edNumNotaExit
        end
        object BitBtn19: TBitBtn
          Left = 199
          Top = 27
          Width = 75
          Height = 25
          Caption = 'Env Evento'
          TabOrder = 2
          OnClick = BitBtn19Click
        end
        object edLote: TMaskEdit
          Left = 72
          Top = 31
          Width = 121
          Height = 21
          TabOrder = 3
          Text = '0'
          OnExit = edLoteExit
        end
        object BitBtn20: TBitBtn
          Left = 322
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Print DANFE'
          TabOrder = 4
          OnClick = BitBtn20Click
        end
        object ckPrint: TCheckBox
          Left = 280
          Top = 4
          Width = 40
          Height = 17
          Caption = 'Print'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object ckPDF: TCheckBox
          Left = 280
          Top = 27
          Width = 36
          Height = 17
          Caption = 'PDF'
          TabOrder = 6
        end
        object BitBtn21: TBitBtn
          Left = 322
          Top = 27
          Width = 75
          Height = 25
          Caption = 'Print Evento'
          TabOrder = 7
          OnClick = BitBtn21Click
        end
        object BitBtn22: TBitBtn
          Left = 199
          Top = 54
          Width = 75
          Height = 25
          Caption = 'Inutilizar'
          TabOrder = 8
          OnClick = BitBtn22Click
        end
        object edSeqidInut: TMaskEdit
          Left = 72
          Top = 58
          Width = 121
          Height = 21
          TabOrder = 9
          Text = '0'
          OnExit = edSeqidInutExit
        end
        object BitBtn23: TBitBtn
          Left = 322
          Top = 54
          Width = 75
          Height = 25
          Caption = 'Print Inutil'
          TabOrder = 10
          OnClick = BitBtn23Click
        end
        object BitBtn24: TBitBtn
          Left = 403
          Top = 0
          Width = 75
          Height = 25
          Caption = 'mail NFe'
          TabOrder = 11
          OnClick = BitBtn24Click
        end
        object BitBtn25: TBitBtn
          Left = 403
          Top = 27
          Width = 75
          Height = 25
          Caption = 'mail Evento'
          TabOrder = 12
          OnClick = BitBtn25Click
        end
        object BitBtn26: TBitBtn
          Left = 403
          Top = 54
          Width = 75
          Height = 25
          Caption = 'mail Inut'
          TabOrder = 13
          OnClick = BitBtn26Click
        end
        object BitBtn27: TBitBtn
          Left = 488
          Top = 24
          Width = 75
          Height = 25
          Caption = 'BitBtn27'
          TabOrder = 14
          OnClick = BitBtn27Click
        end
        object ckBol: TCheckBox
          Left = 280
          Top = 50
          Width = 36
          Height = 17
          Caption = 'Bole'
          TabOrder = 15
        end
        object BitBtn37: TBitBtn
          Left = 322
          Top = 85
          Width = 75
          Height = 25
          Caption = 'Dados Cert 55'
          TabOrder = 16
          OnClick = BitBtn37Click
        end
        object BitBtn38: TBitBtn
          Left = 403
          Top = 85
          Width = 75
          Height = 25
          Caption = 'Dados Cert 65'
          TabOrder = 17
          OnClick = BitBtn37Click
        end
        object btnNFeConverterNFeEmContingencia: TBitBtn
          Left = 3
          Top = 85
          Width = 138
          Height = 25
          Caption = 'ConverterEmContingencia'
          TabOrder = 18
          OnClick = btnNFeConverterNFeEmContingenciaClick
        end
        object btnNFeResolverContigencia: TBitBtn
          Left = 147
          Top = 85
          Width = 138
          Height = 25
          Caption = 'ResolverContingencia'
          TabOrder = 19
          OnClick = btnNFeResolverContigenciaClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'NFSe GV'
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 342
        Height = 126
        Caption = 'Testes GV (Hw Sistemas)'
        TabOrder = 0
        object Label1: TLabel
          Left = 237
          Top = 86
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object BitBtn7: TBitBtn
          Left = 12
          Top = 24
          Width = 125
          Height = 25
          Caption = 'Visualiza NFSe'
          TabOrder = 0
          OnClick = BitBtn7Click
        end
        object BitBtn8: TBitBtn
          Left = 12
          Top = 55
          Width = 125
          Height = 25
          Caption = 'Enviar NFSEe'
          TabOrder = 1
          OnClick = BitBtn8Click
        end
        object BitBtn10: TBitBtn
          Left = 12
          Top = 86
          Width = 125
          Height = 25
          Caption = 'Enviar NFSEe=11026'
          TabOrder = 2
          OnClick = BitBtn10Click
        end
        object BitBtn18: TBitBtn
          Left = 143
          Top = 55
          Width = 125
          Height = 25
          Caption = 'Enviar NFSEe Silent'
          TabOrder = 3
          OnClick = BitBtn18Click
        end
        object ckEnvEmail: TCheckBox
          Left = 274
          Top = 44
          Width = 65
          Height = 17
          Caption = 'EnvEmail'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object ckEnvBolet: TCheckBox
          Left = 274
          Top = 60
          Width = 65
          Height = 17
          Caption = 'EnvBolet'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object ckImprimir: TCheckBox
          Left = 274
          Top = 75
          Width = 65
          Height = 17
          Caption = 'Imprimir'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object BitBtn31: TBitBtn
          Left = 143
          Top = 24
          Width = 125
          Height = 25
          Caption = 'NFS-e banco HW'
          TabOrder = 7
          OnClick = BitBtn31Click
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'NFSe BH'
      ImageIndex = 3
      object GroupBox2: TGroupBox
        Left = 3
        Top = 3
        Width = 153
        Height = 154
        Caption = 'Testes BH (Luz Servicos)'
        TabOrder = 0
        object BitBtn12: TBitBtn
          Left = 12
          Top = 24
          Width = 125
          Height = 25
          Caption = 'Visualiza NFSe'
          TabOrder = 0
          OnClick = BitBtn12Click
        end
        object BitBtn13: TBitBtn
          Left = 12
          Top = 55
          Width = 125
          Height = 25
          Caption = 'Enviar NFSEe'
          TabOrder = 1
          OnClick = BitBtn13Click
        end
        object BitBtn11: TBitBtn
          Left = 12
          Top = 86
          Width = 125
          Height = 25
          Caption = 'Enviar NFSEeBH=17173'
          TabOrder = 2
          OnClick = BitBtn11Click
        end
        object Edit1: TEdit
          Left = 16
          Top = 117
          Width = 121
          Height = 21
          TabOrder = 3
          Text = '4'
        end
      end
    end
    object tabDPSNFSE: TTabSheet
      Caption = 'DPS/NFSE'
      ImageIndex = 4
      object GroupBox3: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 631
        Height = 118
        Align = alTop
        Caption = 'DPS/NFSe - Via Config'
        TabOrder = 0
        object BitBtn14: TBitBtn
          Left = 12
          Top = 24
          Width = 125
          Height = 25
          Caption = 'Enviar Id'
          TabOrder = 0
          OnClick = BitBtn14Click
        end
        object BitBtn15: TBitBtn
          Left = 143
          Top = 90
          Width = 125
          Height = 25
          Caption = 'ListarRegimes'
          TabOrder = 1
          OnClick = BitBtn15Click
        end
        object BitBtn16: TBitBtn
          Left = 12
          Top = 86
          Width = 125
          Height = 25
          Caption = 'SetupSession'
          TabOrder = 2
          OnClick = BitBtn16Click
        end
        object BitBtn44: TBitBtn
          Left = 143
          Top = 24
          Width = 125
          Height = 25
          Caption = 'Consultar Id'
          TabOrder = 3
          OnClick = BitBtn44Click
        end
        object BitBtn45: TBitBtn
          Left = 274
          Top = 24
          Width = 125
          Height = 25
          Caption = 'Imprimir Id'
          TabOrder = 4
          OnClick = BitBtn45Click
        end
        object ckImprimirNFSeTo: TCheckBox
          Left = 12
          Top = 55
          Width = 197
          Height = 17
          Caption = 'Imprimir NFSe ao Emitir ou Consultar'
          TabOrder = 5
        end
        object BitBtn46: TBitBtn
          Left = 405
          Top = 24
          Width = 125
          Height = 25
          Caption = 'Cancelar Id'
          TabOrder = 6
          OnClick = BitBtn46Click
        end
        object ckSalvarNFSeTo: TCheckBox
          Left = 215
          Top = 55
          Width = 184
          Height = 17
          Caption = 'Salvar NFSe ao Emitir ou Consultar'
          TabOrder = 7
        end
      end
      object edLogNFSe: TMemo
        AlignWithMargins = True
        Left = 3
        Top = 127
        Width = 631
        Height = 251
        Align = alClient
        Lines.Strings = (
          'edLogNFSe')
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'NFSe Config.Ini'
      ImageIndex = 7
      object Label7: TLabel
        Left = 79
        Top = 10
        Width = 29
        Height = 13
        Caption = 'Banco'
      end
      object Label8: TLabel
        Left = 19
        Top = 10
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object GroupBox4: TGroupBox
        Left = 19
        Top = 57
        Width = 366
        Height = 128
        Caption = 'Testes NFSe do Config.ini'
        TabOrder = 0
        object BitBtn32: TBitBtn
          Left = 12
          Top = 24
          Width = 125
          Height = 25
          Caption = 'Visualiza NFSe'
          TabOrder = 0
          OnClick = BitBtn32Click
        end
        object BitBtn33: TBitBtn
          Left = 12
          Top = 55
          Width = 125
          Height = 25
          Caption = 'Enviar NFSEe'
          Enabled = False
          TabOrder = 1
          Visible = False
          OnClick = BitBtn33Click
        end
        object BitBtn34: TBitBtn
          Left = 12
          Top = 86
          Width = 125
          Height = 25
          Caption = 'Enviar 2'
          Enabled = False
          TabOrder = 2
          Visible = False
          OnClick = BitBtn34Click
        end
        object BitBtn39: TBitBtn
          Left = 143
          Top = 24
          Width = 162
          Height = 25
          Caption = 'ImprimirNFSe'
          TabOrder = 3
          OnClick = BitBtn39Click
        end
      end
      object edEmpConf: TSpinEdit
        Left = 19
        Top = 29
        Width = 54
        Height = 22
        MaxValue = 99
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object edBancoConf: TComboBox
        Left = 79
        Top = 29
        Width = 424
        Height = 21
        TabOrder = 2
        Text = 'edBancoNFSeX'
        OnChange = edBancoConfChange
        Items.Strings = (
          'joaopedro-pc:D:\Hw\bases\ang\ipa\Hwauto.fdb'
          'joaopedro-pc:D:\Hw\bases\motoka\Hwauto.fdb'
          'joaopedro-pc:D:\Hw\bases\autoderval\Hwauto.fdb'
          'joaopedro-pc:D:\Hw\bases\luz\HwLuz.fdb')
      end
      object edLogNFSeConfig: TMemo
        Left = 19
        Top = 191
        Width = 366
        Height = 187
        Lines.Strings = (
          'edLogNFSeConfig')
        ScrollBars = ssBoth
        TabOrder = 3
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'MDFe'
      ImageIndex = 5
      object Button7: TButton
        Left = 3
        Top = 3
        Width = 137
        Height = 25
        Caption = 'Enviar MDFe'
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 3
        Top = 34
        Width = 137
        Height = 25
        Caption = 'Consultar MDFe'
        TabOrder = 1
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 3
        Top = 67
        Width = 137
        Height = 25
        Caption = 'Enviar Evento MDFe'
        TabOrder = 2
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 3
        Top = 98
        Width = 137
        Height = 25
        Caption = 'Imprimir MDFe'
        TabOrder = 3
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 3
        Top = 129
        Width = 137
        Height = 25
        Caption = 'Imprimir Evento MDFe'
        TabOrder = 4
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 3
        Top = 160
        Width = 137
        Height = 25
        Caption = 'Email MDFe'
        TabOrder = 5
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 3
        Top = 191
        Width = 137
        Height = 25
        Caption = 'Email Evento MDFe'
        TabOrder = 6
        OnClick = Button13Click
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Outros'
      ImageIndex = 6
      object Label9: TLabel
        Left = 243
        Top = 32
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Secret'
      end
      object Label10: TLabel
        Left = 246
        Top = 54
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Texto'
      end
      object Label11: TLabel
        Left = 226
        Top = 81
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Resultado'
      end
      object BitBtn2: TBitBtn
        Left = 3
        Top = 96
        Width = 125
        Height = 25
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 0
        OnClick = BitBtn2Click
      end
      object Button6: TButton
        Left = 3
        Top = 34
        Width = 125
        Height = 25
        Caption = 'NF Destinadas'
        TabOrder = 1
        OnClick = Button6Click
      end
      object BitBtn9: TBitBtn
        Left = 3
        Top = 3
        Width = 125
        Height = 25
        Caption = 'Download NFe'
        TabOrder = 2
        OnClick = BitBtn9Click
      end
      object Button14: TButton
        Left = 3
        Top = 65
        Width = 125
        Height = 25
        Caption = 'DistribuicaoDFE'
        TabOrder = 3
        OnClick = Button14Click
      end
      object BitBtn17: TBitBtn
        Left = 134
        Top = 96
        Width = 75
        Height = 25
        Caption = 'BitBtn17'
        TabOrder = 4
        OnClick = BitBtn17Click
      end
      object BitBtn28: TBitBtn
        Left = 3
        Top = 127
        Width = 125
        Height = 25
        Caption = 'xml NF-e'
        TabOrder = 5
        OnClick = BitBtn28Click
      end
      object BitBtn29: TBitBtn
        Left = 3
        Top = 158
        Width = 125
        Height = 25
        Caption = 'xml NF-e Livraria'
        TabOrder = 6
        OnClick = BitBtn29Click
      end
      object BitBtn30: TBitBtn
        Left = 3
        Top = 189
        Width = 125
        Height = 25
        Caption = 'xml NF-e Predileta'
        TabOrder = 7
        OnClick = BitBtn30Click
      end
      object BitBtn42: TBitBtn
        Left = 3
        Top = 220
        Width = 125
        Height = 25
        Caption = 'XML do LogImport.txt'
        TabOrder = 8
        OnClick = BitBtn42Click
      end
      object edSecret: TEdit
        Left = 280
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 9
        Text = 'edSecret'
      end
      object edInput: TEdit
        Left = 280
        Top = 51
        Width = 121
        Height = 21
        TabOrder = 10
        Text = 'edInput'
      end
      object edOutput: TEdit
        Left = 280
        Top = 78
        Width = 121
        Height = 21
        TabOrder = 11
        Text = 'edOutput'
      end
      object BitBtn48: TBitBtn
        Left = 407
        Top = 51
        Width = 90
        Height = 25
        Caption = 'Criptografar'
        TabOrder = 12
        OnClick = BitBtn48Click
      end
      object BitBtn49: TBitBtn
        Left = 407
        Top = 78
        Width = 90
        Height = 25
        Caption = 'DesCriptografar'
        TabOrder = 13
        OnClick = BitBtn49Click
      end
    end
    object FAZNFe: TTabSheet
      Caption = 'FAZNFe'
      ImageIndex = 8
      object BitBtn35: TBitBtn
        Left = 16
        Top = 45
        Width = 609
        Height = 25
        Caption = 'Gerar PDF'
        TabOrder = 0
        OnClick = BitBtn35Click
      end
      object edFazNFEPathPdf: TMaskEdit
        Left = 16
        Top = 18
        Width = 609
        Height = 21
        TabOrder = 1
        Text = 'edFazNFEPathPdf'
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'NFSeX'
      ImageIndex = 9
      object Label5: TLabel
        Left = 11
        Top = 29
        Width = 29
        Height = 13
        Caption = 'Banco'
      end
      object Label6: TLabel
        Left = 488
        Top = 29
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object edBancoNFSeX1: TEdit
        Left = 11
        Top = 106
        Width = 471
        Height = 21
        TabOrder = 0
        Text = 'edBancoNFSeX1'
        Visible = False
      end
      object edEmpresaNFSeX: TSpinEdit
        Left = 488
        Top = 48
        Width = 121
        Height = 22
        MaxValue = 99
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object BitBtn36: TBitBtn
        Left = 11
        Top = 75
        Width = 125
        Height = 25
        Caption = 'Visualiza NFSe'
        TabOrder = 2
        OnClick = BitBtn36Click
      end
      object edBancoNFSeX: TComboBox
        Left = 11
        Top = 48
        Width = 471
        Height = 21
        TabOrder = 3
        Text = 'edBancoNFSeX'
        Items.Strings = (
          'joaopedro-pc:D:\Hw\bases\ang\ipa\Hwauto.fdb'
          'joaopedro-pc:D:\Hw\bases\motoka\Hwauto.fdb'
          'joaopedro-pc:D:\Hw\bases\autoderval\Hwauto.fdb'
          'joaopedro-pc:D:\Hw\bases\luz\HwLuz.fdb')
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'FiscalRTC'
      ImageIndex = 10
      object lbProgressDownload: TLabel
        Left = 84
        Top = 8
        Width = 97
        Height = 13
        Caption = 'lbProgressDownload'
      end
      object BitBtn40: TBitBtn
        Left = 3
        Top = 3
        Width = 75
        Height = 25
        Caption = 'SincFiscalCalc'
        TabOrder = 0
        OnClick = BitBtn40Click
      end
      object memoGrid9999: TMemo
        Left = 3
        Top = 34
        Width = 614
        Height = 344
        Lines.Strings = (
          'memoGrid9999')
        TabOrder = 1
      end
      object BitBtn41: TBitBtn
        Left = 504
        Top = 3
        Width = 75
        Height = 25
        Caption = 'BitBtn41'
        TabOrder = 2
        OnClick = BitBtn41Click
      end
      object BitBtn47: TBitBtn
        Left = 187
        Top = 3
        Width = 140
        Height = 25
        Caption = 'ResolverAtualizacao'
        TabOrder = 3
        OnClick = BitBtn47Click
      end
      object BitBtn43: TBitBtn
        Left = 333
        Top = 3
        Width = 140
        Height = 25
        Caption = 'ComandarAtualizacao'
        TabOrder = 4
        OnClick = BitBtn43Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 600
    Top = 64
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 600
    Top = 104
  end
  object NetHTTPClient1: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    HandleRedirects = True
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 600
    Top = 144
  end
end
