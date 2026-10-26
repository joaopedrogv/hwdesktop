object frmDemostrativoCredRetPISCOFINS: TfrmDemostrativoCredRetPISCOFINS
  Left = 0
  Top = 0
  Caption = 'Demonstrativo de Cr'#233'dito e Reten'#231#245'es de PIS/COFINS'
  ClientHeight = 378
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 378
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 6
    TabOrder = 0
    ExplicitLeft = 328
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel1: TPanel
      Left = 6
      Top = 331
      Width = 729
      Height = 41
      Align = alBottom
      BevelKind = bkTile
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 334
      object btOK: TBitBtn
        Left = 325
        Top = 6
        Width = 75
        Height = 25
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 6
      Top = 6
      Width = 729
      Height = 41
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 
        'Cr'#233'ditos de PIS/COFINS de per'#237'odos anteriores e aproveitamento n' +
        'este per'#237'odo da apura'#231#227'o'
      TabOrder = 1
      ExplicitTop = -23
    end
    object Panel4: TPanel
      Left = 6
      Top = 167
      Width = 729
      Height = 41
      Align = alTop
      Caption = 
        'Reten'#231#245'es de PIS/COFINS de per'#237'odos anteriores e ou atual para a' +
        'proveitamento neste per'#237'odo da apura'#231#227'o'
      TabOrder = 2
      ExplicitLeft = 184
      ExplicitTop = 200
      ExplicitWidth = 185
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 47
      Width = 729
      Height = 120
      Align = alTop
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ANO'
          Title.Caption = 'Ano'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES'
          Title.Caption = 'Mes'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PIS'
          Title.Caption = 'Credito PIS'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_COFINS'
          Title.Caption = 'Credito COFINS'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PIS_UTIL'
          Title.Caption = 'Credito PIS ja util. per. ant'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_COFINS_UTIL'
          Title.Caption = 'Credito COFINS ja util. per. ant'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PIS_AT_UTIL'
          Title.Caption = 'Credito PIS util. apur atual'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COFINS_AT_UTIL'
          Title.Caption = 'Credito COFINS util. apur atual'
          Width = 139
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 6
      Top = 208
      Width = 729
      Height = 120
      Align = alTop
      DataSource = DataSource2
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ANO'
          Title.Caption = 'Ano'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MES'
          Title.Caption = 'Mes'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PIS'
          Title.Caption = 'Retencao PIS'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_COFINS'
          Title.Caption = 'Retencao COFINS'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_PIS_UTIL'
          Title.Caption = 'Retencao PIS ja util. per. ant'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_COFINS_UTIL'
          Title.Caption = 'Retencao COFINS ja util. per. ant'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PIS_AT_UTIL'
          Title.Caption = 'Retencao PIS util. apur atual'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COFINS_AT_UTIL'
          Title.Caption = 'Retencao COFINS util. apur atual'
          Width = 139
          Visible = True
        end>
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    Left = 328
    Top = 104
  end
  object DataSource2: TDataSource
    AutoEdit = False
    Left = 368
    Top = 192
  end
end
