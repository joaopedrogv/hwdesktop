inherited frmEventoDFe211130CadastroFrame: TfrmEventoDFe211130CadastroFrame
  inherited pnCampos: TPanel
    Height = 400
    object pcSecoes: TPageControl
      Left = 0
      Top = 0
      Width = 736
      Height = 400
      ActivePage = tsEvento
      Align = alTop
      TabOrder = 0
      object tsEvento: TTabSheet
        Caption = 'Evento'
        object lblChaveDocumento: TLabel
          Left = 16
          Top = 12
          Width = 89
          Height = 16
          Caption = 'Chave da NF-e'
        end
        object edChaveDocumento: TEdit
          Left = 16
          Top = 30
          Width = 600
          Height = 24
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 44
          TabOrder = 0
        end
      end
      object tsItens: TTabSheet
        Caption = 'Itens'
        inline fraItens: TfrmEventoDFe211130ItensFrame
          Left = 0
          Top = 0
          Width = 728
          Height = 368
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 728
          ExplicitHeight = 368
        end
      end
    end
  end
end
