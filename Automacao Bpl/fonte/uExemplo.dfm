inherited frmExemplo: TfrmExemplo
  Left = 242
  Top = 88
  Caption = 'frmExemplo'
  ExplicitLeft = 242
  ExplicitTop = 88
  ExplicitWidth = 800
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    ActivePage = TabSheet2
    inherited TabSheet1: TTabSheet
      inherited ScrollBox1: TScrollBox
        inherited PageControl3: TPageControl
          inherited TabSheet3: TTabSheet
            inherited ScrollBox3: TScrollBox
              inherited GroupBox1: TGroupBox
                Height = 305
                ExplicitHeight = 305
              end
            end
          end
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel1: TPanel
        inherited DBGrid1: TDBGrid
          DataSource = dtmExemplo.dsFornec
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_F'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_EMPRESA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_T_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_UF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRUPO_PROD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_PROD'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CGC_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IE_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'END_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRF'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDA_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FONE_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RAMAL_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTATO_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAX_F'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Visible = True
            end>
        end
      end
    end
  end
end
