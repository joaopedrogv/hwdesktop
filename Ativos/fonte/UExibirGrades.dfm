inherited frmExibirGrades: TfrmExibirGrades
  Caption = 'Grades'
  ClientHeight = 132
  ClientWidth = 823
  Position = poScreenCenter
  ExplicitWidth = 831
  ExplicitHeight = 159
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox7: TGroupBox
    Left = 0
    Top = 0
    Width = 823
    Height = 132
    Align = alClient
    Caption = 'Grades do Produto'
    TabOrder = 0
    object DBGrid8: TDBGrid
      Left = 2
      Top = 15
      Width = 819
      Height = 115
      Align = alClient
      DataSource = dtmConsultas.dsGradeProd
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_grade'
          Title.Caption = 'C'#243'digo da grade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao1'
          Title.Caption = 'Descri'#231#227'o 2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd_item_disponivel'
          Title.Caption = 'Quantidade dispon'#237'vel'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtde'
          Title.Caption = 'Quantidade Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd_item_pedAberto'
          Title.Caption = 'Quantidade em aberto'
          Visible = True
        end>
    end
  end
end
