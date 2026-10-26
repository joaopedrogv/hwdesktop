object frmHistRetencoesPISCOFINS: TfrmHistRetencoesPISCOFINS
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico de utiliza'#231#227'o das reten'#231#245'es do PIS e da COFINS'
  ClientHeight = 435
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 435
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    object groupGrid: TGroupBox
      Left = 6
      Top = 6
      Width = 785
      Height = 249
      Align = alClient
      Caption = 'Hist'#243'rico da utiliza'#231#227'o das Retencoes'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 2
        Top = 15
        Width = 781
        Height = 232
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ANO_UTIL'
            Title.Caption = 'Ano do aproveitamento'
            Width = 136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES_UTIL'
            Title.Caption = 'Mes do aproveitamento'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_PIS_UTIL'
            Title.Caption = 'Retencao PIS aproveitado'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_COFINS_UTIL'
            Title.Caption = 'Retencao COFINS aproveitado'
            Width = 172
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 388
      Width = 785
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 1
      object btOK: TBitBtn
        Left = 351
        Top = 6
        Width = 75
        Height = 25
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
      end
    end
    object pnConsulta: TPanel
      Left = 6
      Top = 255
      Width = 785
      Height = 133
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 2
      object pnButtCons: TPanel
        Left = 675
        Top = 6
        Width = 104
        Height = 121
        Align = alRight
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object btExcluirConsulta: TBitBtn
          Left = 13
          Top = 77
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 0
          OnClick = btExcluirConsultaClick
        end
        object btNovoConsulta: TBitBtn
          Left = 13
          Top = 15
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = btNovoConsultaClick
        end
        object btAltConsulta: TBitBtn
          Left = 13
          Top = 46
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 2
          OnClick = btAltConsultaClick
        end
      end
      object pnCadCons: TPanel
        Left = 6
        Top = 6
        Width = 669
        Height = 121
        Align = alClient
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 1
        object Label5: TLabel
          Left = 88
          Top = 22
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mes/Ano'
        end
        object Label4: TLabel
          Left = 361
          Top = 49
          Width = 137
          Height = 13
          Alignment = taRightJustify
          Caption = 'Credito COFINS aproveitado'
        end
        object Label3: TLabel
          Left = 383
          Top = 22
          Width = 115
          Height = 13
          Alignment = taRightJustify
          Caption = 'Credito PIS aproveitado'
        end
        object DBEdit5: TDBEdit
          Left = 192
          Top = 19
          Width = 65
          Height = 21
          DataField = 'ANO_UTIL'
          DataSource = DataSource1
          TabOrder = 1
        end
        object DBEdit6: TDBEdit
          Left = 136
          Top = 19
          Width = 50
          Height = 21
          DataField = 'MES_UTIL'
          DataSource = DataSource1
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 504
          Top = 19
          Width = 121
          Height = 21
          DataField = 'VALOR_PIS_UTIL'
          DataSource = DataSource1
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 504
          Top = 46
          Width = 121
          Height = 21
          DataField = 'VALOR_COFINS_UTIL'
          DataSource = DataSource1
          TabOrder = 3
        end
        object btCancelConsulta: TBitBtn
          Left = 311
          Top = 82
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 4
          OnClick = btCancelConsultaClick
        end
        object btSaveConsulta: TBitBtn
          Left = 392
          Top = 82
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 5
          OnClick = btSaveConsultaClick
        end
      end
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 392
    Top = 240
  end
end
