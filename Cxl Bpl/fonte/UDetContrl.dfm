object FrmDetContrl: TFrmDetContrl
  Left = 218
  Top = 88
  Caption = 'Detalhe do Controle...'
  ClientHeight = 287
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 566
    Height = 246
    Align = alClient
    DataSource = DtmBalcao.DtDetalhesCtrl
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA_MOV'
        Title.Caption = 'Data Movimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPDOCS'
        Title.Caption = 'Tipo Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NREQUISICAO'
        Title.Caption = 'N. Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_REC_DEP'
        Title.Caption = 'N. Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDOC'
        Title.Caption = 'N. Seq. Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_REC_PARC'
        Title.Caption = 'N. Seq. Documento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HISTORICO'
        Title.Caption = 'Hist'#243'rico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORDOC'
        Title.Caption = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VENC'
        Title.Caption = 'Data Vencimnento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TERCEIROS'
        Title.Caption = 'Terceiros'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_CONTROLE'
        Title.Caption = 'Controle'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEQFORM'
        Title.Caption = 'Seqform'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 246
    Width = 566
    Height = 41
    Align = alBottom
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 11
      Top = 9
      Width = 23
      Height = 22
      Glyph.Data = {
        8E020000424D8E020000000000008E0100002800000010000000100000000100
        08000000000000010000120B0000120B0000560000005600000000000000FFFF
        FF00FF00FF00A5696A0095655F009D6B620098686000A36F6400FFFBFA00AD78
        6900A7746600BB7F6A00B47E6B00BF877000BA836D00BB704F00C48C7200D397
        7800CA917400C2805C00D0906B00D59A7900CE957600F4EBE600FEF4ED00FFFC
        FA00FCF4EE00FAEDE100FCF4ED00FEFCFA00EF993800E5A55F00F2D5B500F6E1
        CA00F8E7D400F7E6D400F7E7D500F8EDE100E2A35B00F0D0A900F6E1C900F4E1
        CA00FAEDDE00FAEEE000EECB9E00F4D5AD00F0D1AA00F2D7B400F2D7B500F4DD
        C000F3DCBF00F8E9D500FAEFE000EFCA9600F0CF9F00FCE7C900E3D3BB00FCEB
        D300FEEED400FBE5C000B7AD9C00FFF4E100FCF6EB00FFFBEE00FFFFFB00FFFF
        FC00006A0000016C0100016B01000A760A000D780D001C831C0023892300469F
        46004AA14A004DA34D004EA44E005FAD5F0060AD60006AB46A0078BB7800B4DA
        B400BBDDBB00EEF7EE00FAFCFA00F8F8FE000202020202424242424242424242
        424204030303034201010101010101010142063B2D3635420101010101010101
        0142053720272C4201504247544F424B0142073A31302E420101514346424F01
        01420A3D21322F420101014C424554010142093F2429324201014D424A434853
        01420C40252328420149424E0152444801420E011A1B33420101010101010101
        01420D0108182B4201010101010101010142100101191C424242424242424242
        424212010101191C2A2239383C030202020216010101011D3E34030303030202
        0202110101010101411703261E0F020202021501010101010155031F13020202
        02021414141414141414030B020202020202}
      OnClick = SpeedButton1Click
    end
    object BitBtn1: TBitBtn
      Left = 245
      Top = 8
      Width = 75
      Height = 25
      Hint = 'OK'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
  end
end
