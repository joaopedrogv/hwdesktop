object DownloadArquivosFiscaisForm: TDownloadArquivosFiscaisForm
  Left = 0
  Top = 0
  Caption = 'Download Dados Fiscais'
  ClientHeight = 564
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline ProgressWithLogFrame1: TProgressWithLogFrame
    Left = 0
    Top = 0
    Width = 528
    Height = 564
    Align = alClient
    TabOrder = 0
    TabStop = True
    ExplicitWidth = 528
    ExplicitHeight = 545
    inherited pnCentral: TPanel
      Width = 522
      Height = 487
      ExplicitWidth = 522
      ExplicitHeight = 487
      inherited Gauge1: TGauge
        Top = 436
        Width = 516
        ExplicitTop = 436
        ExplicitWidth = 516
      end
      inherited edLog: TMemo
        Width = 516
        Height = 427
        ExplicitWidth = 516
        ExplicitHeight = 427
      end
      inherited ProgressBar1: TProgressBar
        Top = 467
        Width = 516
        ExplicitTop = 467
        ExplicitWidth = 516
      end
    end
    inherited pnBotoes: TPanel
      Top = 524
      Width = 522
      ExplicitTop = 524
      ExplicitWidth = 522
    end
    inherited pnTitle: TPanel
      Width = 522
      ExplicitWidth = 522
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 480
    Top = 288
  end
end
