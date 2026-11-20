object frmSelecaoEventoDFe: TfrmSelecaoEventoDFe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Tipo de evento'
  ClientHeight = 220
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbTipos: TListBox
    Left = 16
    Top = 16
    Width = 328
    Height = 144
    ItemHeight = 13
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 156
    Top = 176
    Width = 90
    Height = 28
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancelar: TButton
    Left = 254
    Top = 176
    Width = 90
    Height = 28
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 2
  end
end
