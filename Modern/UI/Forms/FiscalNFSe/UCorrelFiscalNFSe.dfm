object FormCorrelFiscalNFSe: TFormCorrelFiscalNFSe
  Left = 0
  Top = 0
  Caption = 'Correla'#231#227'o C'#243'digos Fiscais NFSe'
  ClientHeight = 516
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnContent: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 786
    Height = 510
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnContent'
    TabOrder = 0
    object Splitter3: TSplitter
      Left = 0
      Top = 357
      Width = 786
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitTop = 0
      ExplicitWidth = 410
    end
    object pnGrid: TPanel
      Left = 0
      Top = 0
      Width = 786
      Height = 357
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      inline DBGridFrame1: TDBGridFrame
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 780
        Height = 326
        Align = alClient
        TabOrder = 0
        TabStop = True
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 780
        ExplicitHeight = 326
        inherited pnTop: TPanel
          Width = 780
          ExplicitWidth = 780
          inherited FilterContainerFrame1: TFilterContainerFrame
            Width = 595
            ExplicitWidth = 595
            inherited topPanel: TPanel
              Width = 595
              ExplicitLeft = 0
              ExplicitWidth = 595
            end
          end
        end
        inherited DBGrid: TDBGrid
          Width = 780
          Height = 285
        end
        inherited pnBtns: TPanel
          Width = 854
          ExplicitWidth = 854
        end
      end
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 332
        Width = 780
        Height = 22
        Margins.Top = 0
        Align = alBottom
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object linkUsarCtribNac: TLabel
          AlignWithMargins = True
          Left = 169
          Top = 3
          Width = 181
          Height = 16
          Cursor = crHandPoint
          Margins.Right = 6
          Align = alLeft
          Caption = 'Usar C Trib Nacional selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = linkUsarCtribNacClick
          ExplicitHeight = 13
        end
        object linkUsarNbs: TLabel
          AlignWithMargins = True
          Left = 359
          Top = 3
          Width = 120
          Height = 16
          Cursor = crHandPoint
          Margins.Right = 6
          Align = alLeft
          Caption = 'Usar NBS selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = linkUsarNbsClick
          ExplicitHeight = 13
        end
        object linkUsarCIndOp: TLabel
          AlignWithMargins = True
          Left = 488
          Top = 3
          Width = 199
          Height = 16
          Cursor = crHandPoint
          Margins.Right = 6
          Align = alLeft
          Caption = 'Usar Cod Ind Opera'#231#227'o selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = linkUsarCIndOpClick
          ExplicitHeight = 13
        end
        object linkUsarCLC116: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 157
          Height = 16
          Cursor = crHandPoint
          Margins.Right = 6
          Align = alLeft
          Caption = 'Usar Cod LC116 selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = linkUsarCLC116Click
          ExplicitHeight = 13
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 360
      Width = 786
      Height = 150
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel2'
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 57
        Width = 786
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = 1
        ExplicitTop = 37
        ExplicitWidth = 92
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 786
        Height = 57
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 780
          Height = 54
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 100
            Height = 48
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'C Trib Nacional'
            Layout = tlCenter
            ExplicitHeight = 21
          end
          object edDescrCtribNac: TDBMemo
            AlignWithMargins = True
            Left = 109
            Top = 0
            Width = 671
            Height = 51
            Margins.Top = 0
            Margins.Right = 0
            Align = alClient
            DataField = 'DESCRICAO_CTRIBNAC'
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 60
        Width = 786
        Height = 60
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 780
          Height = 57
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 100
            Height = 51
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'NBS'
            Layout = tlCenter
            ExplicitHeight = 21
          end
          object edDescNbs: TDBMemo
            AlignWithMargins = True
            Left = 109
            Top = 0
            Width = 671
            Height = 57
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            DataField = 'DESCRICAO_NBS'
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 120
        Width = 786
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Panel7: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 780
          Height = 27
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 100
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'C Ind Opera'#231#227'o'
            Layout = tlCenter
          end
          object edDescCIndOp: TDBEdit
            AlignWithMargins = True
            Left = 109
            Top = 3
            Width = 671
            Height = 21
            Margins.Right = 0
            Align = alClient
            DataField = 'DESCRICAO_CINDOP'
            TabOrder = 0
          end
        end
      end
    end
  end
end
