object frmHwNextValidationSecond: TfrmHwNextValidationSecond
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Eventos DFe - Next'
  ClientHeight = 420
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 16
  object lblNome: TLabel
    Left = 20
    Top = 24
    Width = 42
    Height = 16
    Caption = 'Nome:'
  end
  object edtNome: TEdit
    Left = 20
    Top = 44
    Width = 600
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnChange = edtNomeChange
  end
  object lblObservacoes: TLabel
    Left = 20
    Top = 84
    Width = 78
    Height = 16
    Caption = 'Observa'#231#245'es:'
  end
  object memObservacoes: TMemo
    Left = 20
    Top = 104
    Width = 600
    Height = 200
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 1
    OnChange = memObservacoesChange
  end
  object chkEstado: TCheckBox
    Left = 20
    Top = 318
    Width = 200
    Height = 21
    Anchors = [akLeft, akBottom]
    Caption = 'Estado marcado'
    TabOrder = 2
    OnClick = chkEstadoClick
  end
  object lblInstancia: TLabel
    Left = 20
    Top = 350
    Width = 600
    Height = 16
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    Caption = 'Inst'#226'ncia'
  end
  object btnFechar: TButton
    Left = 20
    Top = 374
    Width = 140
    Height = 30
    Anchors = [akLeft, akBottom]
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btnFecharClick
  end
end
