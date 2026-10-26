inherited frmCadJornadaTrabalho: TfrmCadJornadaTrabalho
  Caption = 'Jornada de Trabalho'
  ExplicitWidth = 814
  ExplicitHeight = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelFundo: TPanel
    inherited PanelLeft: TPanel
      inherited PageControl1: TPageControl
        inherited TabSheet1: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited ScrollBox1: TScrollBox
            inherited PageControl3: TPageControl
              ActivePage = tsCadastro
              inherited TabSheet3: TTabSheet
                ExplicitLeft = 4
                ExplicitTop = 27
                ExplicitWidth = 775
                ExplicitHeight = 431
              end
              object tsCadastro: TTabSheet
                Caption = 'tsCadastro'
                ImageIndex = 1
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 775
                  Height = 431
                  Align = alClient
                  Caption = 'Jornada de Trabalho'
                  TabOrder = 0
                  object Panel4: TPanel
                    Left = 2
                    Top = 15
                    Width = 771
                    Height = 106
                    Align = alTop
                    BevelOuter = bvNone
                    TabOrder = 0
                    object Label6: TLabel
                      Left = 66
                      Top = 13
                      Width = 37
                      Height = 13
                      Caption = 'C'#243'digo:'
                      FocusControl = DBEdit1
                    end
                    object Label7: TLabel
                      Left = 53
                      Top = 44
                      Width = 50
                      Height = 13
                      Caption = 'Descri'#231#227'o:'
                      FocusControl = DBEdit2
                    end
                    object Label8: TLabel
                      Left = 64
                      Top = 77
                      Width = 39
                      Height = 13
                      Caption = 'Hor'#225'rio:'
                      FocusControl = DBEdit2
                    end
                    object Label9: TLabel
                      Left = 184
                      Top = 77
                      Width = 16
                      Height = 13
                      Caption = 'at'#233
                      FocusControl = DBEdit2
                    end
                    object DBEdit1: TDBEdit
                      Left = 111
                      Top = 10
                      Width = 67
                      Height = 21
                      DataField = 'CODIGO'
                      DataSource = dtmColaborador.dsJornadaTrabalho
                      Enabled = False
                      TabOrder = 0
                    end
                    object DBEdit2: TDBEdit
                      Left = 111
                      Top = 41
                      Width = 394
                      Height = 21
                      CharCase = ecUpperCase
                      DataField = 'DESCRICAO'
                      DataSource = dtmColaborador.dsJornadaTrabalho
                      TabOrder = 1
                    end
                    object DBEdit3: TDBEdit
                      Left = 111
                      Top = 74
                      Width = 67
                      Height = 21
                      DataField = 'HORARIO_INI_PADRAO'
                      DataSource = dtmColaborador.dsJornadaTrabalho
                      TabOrder = 2
                    end
                    object DBEdit4: TDBEdit
                      Left = 208
                      Top = 74
                      Width = 67
                      Height = 21
                      DataField = 'HORARIO_FIM_PADRAO'
                      DataSource = dtmColaborador.dsJornadaTrabalho
                      TabOrder = 3
                    end
                  end
                  object GroupBox5: TGroupBox
                    Left = 2
                    Top = 121
                    Width = 771
                    Height = 341
                    Align = alTop
                    Caption = 'Dias de Folga'
                    TabOrder = 1
                    object pnSegunda: TPanel
                      Left = 2
                      Top = 15
                      Width = 767
                      Height = 31
                      Align = alTop
                      TabOrder = 0
                      object ckSegunda: TCheckBox
                        Left = 22
                        Top = 6
                        Width = 91
                        Height = 17
                        Caption = 'Segunda-Feira'
                        TabOrder = 0
                      end
                    end
                    object pnTerca: TPanel
                      Left = 2
                      Top = 46
                      Width = 767
                      Height = 31
                      Align = alTop
                      TabOrder = 1
                      object ckTerca: TCheckBox
                        Left = 22
                        Top = 6
                        Width = 91
                        Height = 17
                        Caption = 'Ter'#231'a-Feira'
                        TabOrder = 0
                      end
                    end
                    object pnQuarta: TPanel
                      Left = 2
                      Top = 77
                      Width = 767
                      Height = 31
                      Align = alTop
                      TabOrder = 2
                      object ckQuarta: TCheckBox
                        Left = 22
                        Top = 6
                        Width = 91
                        Height = 17
                        Caption = 'Quarta-Feira'
                        TabOrder = 0
                      end
                    end
                    object pnQuinta: TPanel
                      Left = 2
                      Top = 108
                      Width = 767
                      Height = 31
                      Align = alTop
                      TabOrder = 3
                      object ckQuinta: TCheckBox
                        Left = 22
                        Top = 6
                        Width = 91
                        Height = 17
                        Caption = 'Quinta-Feira'
                        TabOrder = 0
                      end
                    end
                    object pnSexta: TPanel
                      Left = 2
                      Top = 139
                      Width = 767
                      Height = 31
                      Align = alTop
                      TabOrder = 4
                      object ckSexta: TCheckBox
                        Left = 22
                        Top = 6
                        Width = 91
                        Height = 17
                        Caption = 'Sexta-Feira'
                        TabOrder = 0
                      end
                    end
                    object pnSabado: TPanel
                      Left = 2
                      Top = 170
                      Width = 767
                      Height = 31
                      Align = alTop
                      TabOrder = 5
                      object ckSabado: TCheckBox
                        Left = 22
                        Top = 6
                        Width = 91
                        Height = 17
                        Caption = 'Sabado'
                        TabOrder = 0
                      end
                    end
                    object pnDomingo: TPanel
                      Left = 2
                      Top = 201
                      Width = 767
                      Height = 31
                      Align = alTop
                      TabOrder = 6
                      object ckDomingo: TCheckBox
                        Left = 22
                        Top = 6
                        Width = 91
                        Height = 17
                        Caption = 'Domingo'
                        TabOrder = 0
                      end
                    end
                  end
                end
              end
            end
            inherited Panel3: TPanel
              inherited BitBtn4: TBitBtn
                Hint = 'OK - [COL062]'
              end
            end
          end
        end
        inherited TabSheet2: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
          inherited GroupBox3: TGroupBox
            inherited BitBtn1: TBitBtn
              Hint = 'Clique para pesquisar - [COL058]'
            end
            inherited BitBtn3: TBitBtn
              Hint = 'Novo cadastro - [COL059]'
            end
            inherited CheckBox3: TCheckBox
              Enabled = False
              Visible = False
            end
            inherited CheckBox1: TCheckBox
              Enabled = False
              Visible = False
            end
          end
          inherited Panel1: TPanel
            inherited DBGrid1: TDBGrid
              OnKeyDown = DBGrid1KeyDown
            end
            inherited Panel2: TPanel
              inherited SpeedButton1: TSpeedButton
                Hint = 'Editar Registro - [COL060]'
              end
              inherited SpeedButton2: TSpeedButton
                Hint = 'Apagar Registro - [COL061]'
                OnClick = SpeedButton2Click
              end
              inherited SpeedButton3: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton4: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton5: TSpeedButton
                Enabled = False
                Visible = False
              end
              inherited SpeedButton25: TSpeedButton
                Enabled = False
                Visible = False
              end
            end
          end
        end
        inherited tsMemo: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 783
          ExplicitHeight = 510
        end
      end
    end
  end
  inherited pnStatusProcessamento: TPanel
    inherited lbTextoProcessamento: TLabel
      Width = 477
      Height = 21
    end
  end
end
