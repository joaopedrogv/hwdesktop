object DbGridNcmsGrupoFiscalVincularFrame: TDbGridNcmsGrupoFiscalVincularFrame
  Left = 0
  Top = 0
  Width = 800
  Height = 178
  TabOrder = 0
  TabStop = True
  object SplitterNcms: TSplitter
    Left = 297
    Top = 0
    Height = 178
    ExplicitLeft = 183
    ExplicitTop = 3
  end
  object pnNcm: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 178
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    inline gridNcm: TDBGridFrame
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 291
      Height = 172
      Align = alClient
      TabOrder = 0
      TabStop = True
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 291
      ExplicitHeight = 172
      inherited DBGrid: TDBGrid
        Width = 291
        Height = 144
      end
      inherited pnBtns: TPanel
        Width = 291
        ExplicitWidth = 291
      end
    end
  end
  object pnRaiz: TPanel
    Left = 300
    Top = 0
    Width = 500
    Height = 178
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object gridRaiz: TDBGrid
      AlignWithMargins = True
      Left = 132
      Top = 3
      Width = 365
      Height = 172
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnAnexos: TPanel
      Left = 0
      Top = 0
      Width = 129
      Height = 178
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object gridAnexos: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 123
        Height = 172
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
end
