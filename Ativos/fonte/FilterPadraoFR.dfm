inherited FilterFramePadrao: TFilterFramePadrao
  Width = 407
  Height = 54
  ExplicitWidth = 407
  ExplicitHeight = 54
  inherited SplitterCampo: TSplitter
    Left = 207
    Height = 27
    ExplicitLeft = 207
    ExplicitHeight = 27
  end
  inherited spliterMeio: TSplitter
    Left = 404
    Height = 27
    Align = alRight
    Visible = False
    ExplicitLeft = 404
    ExplicitHeight = 27
  end
  inherited pnCampo: TPanel
    Width = 207
    Height = 27
    ExplicitWidth = 207
    ExplicitHeight = 27
    inherited lbCampo: TLabel
      Width = 55
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Layout = tlCenter
      ExplicitWidth = 55
      ExplicitHeight = 21
    end
    inherited edCampos: TComboBox
      Left = 64
      Top = 3
      Width = 140
      Align = alClient
      ExplicitLeft = 42
      ExplicitTop = 3
      ExplicitWidth = 162
    end
  end
  inherited pnCondicao: TPanel
    Left = 210
    Width = 194
    Height = 27
    Align = alClient
    ExplicitLeft = 210
    ExplicitWidth = 194
    ExplicitHeight = 27
    inherited lbCondicao: TLabel
      Width = 55
      Height = 21
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Layout = tlCenter
      ExplicitWidth = 55
      ExplicitHeight = 21
    end
    inherited edCondicao: TComboBox
      Left = 64
      Top = 3
      Width = 127
      Align = alClient
      ExplicitLeft = 53
      ExplicitTop = 3
      ExplicitWidth = 138
    end
  end
  inherited pnConteudos: TPanel
    Left = 0
    Top = 27
    Width = 407
    Height = 27
    Align = alBottom
    ExplicitLeft = 0
    ExplicitTop = 27
    ExplicitWidth = 407
    ExplicitHeight = 27
    inherited SplitterConteudo: TSplitter
      Left = 207
      Height = 27
      Align = alLeft
      ExplicitLeft = 207
      ExplicitHeight = 27
    end
    inherited spliterBtn: TSplitter
      Left = 349
      Height = 27
      ExplicitLeft = 349
      ExplicitHeight = 27
    end
    inherited pnConteudo1: TPanel
      Width = 207
      Height = 27
      Align = alLeft
      ExplicitWidth = 207
      ExplicitHeight = 27
      inherited lbConteudo1: TLabel
        Width = 55
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Layout = tlCenter
        ExplicitWidth = 55
        ExplicitHeight = 21
      end
      inherited edConteudo1: TMaskEdit
        Left = 64
        Top = 3
        Width = 140
        Align = alClient
        ExplicitLeft = 56
        ExplicitTop = 3
        ExplicitWidth = 148
      end
    end
    inherited pnConteudo2: TPanel
      Left = 210
      Width = 139
      Height = 27
      Align = alClient
      ExplicitLeft = 210
      ExplicitWidth = 139
      ExplicitHeight = 27
      inherited lbConteudo2: TLabel
        Width = 55
        Height = 21
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Layout = tlCenter
        ExplicitWidth = 55
        ExplicitHeight = 21
      end
      inherited edConteudo2: TMaskEdit
        Left = 64
        Top = 3
        Width = 72
        Align = alClient
        ExplicitLeft = 57
        ExplicitTop = 3
        ExplicitWidth = 79
      end
    end
    inherited pnBtns: TPanel
      Left = 352
      Width = 55
      Height = 27
      ExplicitLeft = 352
      ExplicitWidth = 55
      ExplicitHeight = 27
      inherited lbCountFiltros: TLabel
        Width = 27
        Height = 21
        Align = alClient
        Layout = tlCenter
        ExplicitLeft = 27
      end
      inherited btnAddFilter: TSpeedButton
        Left = 29
        Top = 3
        Margins.Top = 3
        Margins.Right = 3
        Margins.Bottom = 2
        Align = alRight
        ExplicitLeft = 2
        ExplicitTop = 1
        ExplicitWidth = 23
        ExplicitHeight = 26
      end
    end
  end
end
