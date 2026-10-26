object frmListarCamposSql: TfrmListarCamposSql
  Left = 0
  Top = 0
  Caption = 'Lista Campos Consultas SQL'
  ClientHeight = 284
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid_Listar: TDBGrid
    Left = 0
    Top = 0
    Width = 828
    Height = 233
    Align = alClient
    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid_ListarDblClick
    OnKeyPress = DBGrid_ListarKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CAMPO'
        Title.Caption = 'Campo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Exibi'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 1200
        Visible = True
      end>
  end
  object Panel_Listar: TPanel
    Left = 0
    Top = 233
    Width = 828
    Height = 51
    Align = alBottom
    Caption = 'Duplo clique<ou Enter> para inserir'
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
end
