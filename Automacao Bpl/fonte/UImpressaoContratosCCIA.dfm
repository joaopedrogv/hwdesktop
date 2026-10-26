object frmImpressaoContratosCCIA: TfrmImpressaoContratosCCIA
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Lista de Contratos para Impress'#227'o'
  ClientHeight = 251
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnListaContratos: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 251
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvSpace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Panel11: TPanel
      Left = 1
      Top = 208
      Width = 544
      Height = 38
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 357
        Height = 36
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 12
          Top = 9
          Width = 339
          Height = 13
          Caption = 'Duplo clique <ou Enter> para selecionar contrato e imprimir'
        end
      end
      object Panel12: TPanel
        Left = 358
        Top = 1
        Width = 185
        Height = 36
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn47: TBitBtn
          Left = 95
          Top = 0
          Width = 90
          Height = 36
          Align = alRight
          Caption = '&Sair'
          TabOrder = 0
          OnClick = BitBtn47Click
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
        object BitBtn31: TBitBtn
          Left = 5
          Top = 0
          Width = 90
          Height = 36
          Align = alRight
          Caption = '&Visualizar'
          TabOrder = 1
          OnClick = BitBtn31Click
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFB3B3B35B5B5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFAFAFAF4B4B4B4D4D4D4C4C4CFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADAD4F4F
            4F4D4D4D4D4D4D878787FF00FFFF00FFFF00FFFF00FFB1B1B16B6B6B64646481
            8181A8A8A8FF00FFA9A9A94B4B4B4D4D4D4B4B4B898989FF00FFFF00FFFF00FF
            FF00FF5E5E5E4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D8585854E4E4E4D4D4D4D4D
            4D8B8B8BFF00FFFF00FFFF00FF8888884D4D4D4B4B4B4E4E4EC4C4C4D9D9D99A
            9A9A5454544B4B4B4D4D4D4B4B4B8F8F8FFF00FFFF00FFFF00FFFF00FF4D4D4D
            4D4D4D6F6F6FF8F8F8FEFEFEFEFEFEFEFEFEFEFEFE4E4E4E4D4D4D767676FF00
            FFFF00FFFF00FFFF00FFB3B3B34D4D4D4F4F4FFEFEFEFFFFFFFEFEFEFFFFFFFE
            FEFEFEFEFEFFFFFF5C5C5C4D4D4D9F9F9FFF00FFFF00FFFF00FF8989894B4B4B
            7B7B7BFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEADADAD4B4B4B7575
            75FF00FFFF00FFFF00FF6868684B4B4BBEBEBEFEFEFEFEFEFEFEFEFEFEFEFEFE
            FEFEFEFEFEFEFEFEF4F4F44B4B4B555555FF00FFFF00FFFF00FF6F6F6F4D4D4D
            AAAAAAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE2E2E24D4D4D5C5C
            5CFF00FFFF00FFFF00FFAFAFAF4B4B4B4E4E4EFEFEFEFEFEFEFEFEFEFEFEFEFE
            FEFEFEFEFEFEFEFE5E5E5E4B4B4B9D9D9DFF00FFFF00FFFF00FFFF00FF4D4D4D
            4D4D4DFAFAFAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE9292924D4D4D525252FF00
            FFFF00FFFF00FFFF00FFFF00FF7C7C7C4D4D4D4B4B4B515151C0C0C0D7D7D79C
            9C9C5757574B4B4B4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            7C7C7C4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D717171FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA4A4A460606059595977
            77779F9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        end
      end
    end
    object DBGrid5: TDBGrid
      Left = 1
      Top = 1
      Width = 544
      Height = 207
      Align = alClient
      DataSource = DtmVeiculosCCIA.dsModContratos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlue
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid5DblClick
      OnKeyPress = DBGrid5KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 520
          Visible = True
        end>
    end
  end
end
