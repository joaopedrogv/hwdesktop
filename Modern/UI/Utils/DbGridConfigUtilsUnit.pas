unit DbGridConfigUtilsUnit;

interface

uses
  FieldsConfigUnit,
  DBGrids;

type
  DbGridConfigUtils = class
  public
    class procedure ApplyToDBGrid( AGrid: TDBGrid; AFieldConfigs: FieldsConfigModel );
  end;

implementation

uses
  DB;

{ DbGridConfigUtils }

class procedure DbGridConfigUtils.ApplyToDBGrid(AGrid: TDBGrid;
  AFieldConfigs: FieldsConfigModel);
var
  i: Integer;
  FieldConfig: FieldConfigModel;
  Column: TColumn;
  Field: TField;
  AVisible: Boolean;
begin
  if not Assigned(AGrid) or not Assigned(AFieldConfigs) or not Assigned(AGrid.DataSource) or
     not Assigned(AGrid.DataSource.DataSet) then
    Exit;

  with AGrid do
  begin
    // Garante que as colunas sejam personalizadas
    //Options := Options + [dgEditing, dgTitles] - [dgIndicator]; // ajuste conforme necessário
    //AutoFillColumns := False; // evita que o grid crie colunas automaticamente

    // Remove todas as colunas existentes
    Columns.Clear;

    // Percorre a lista de configurações na ordem fornecida
    for i := 0 to AFieldConfigs.Count - 1 do
    begin
      FieldConfig := AFieldConfigs.Items[i];

      // Verifica se o campo existe no dataset
      //Field := AGrid.DataSource.DataSet.FindField(FieldConfig.FieldName);
      //if not Assigned(Field) then
        //Continue; // pula campos inexistentes

      // Decide visibilidade com base na regra
      //AVisible := FieldConfig.Visivel;

//      case FieldConfig.Visibilidade of
//        fvInvisivel,
//        fvInvisivelConfiguravel:
//          Visible := False;
//        fvSempreVisivel,
//        fvConfiguravel:
//          Visible := True;
//      else
//        Visible := True;
//      end;

      // Cria a coluna
      Column := Columns.Add;
      Column.FieldName := FieldConfig.FieldName;
      Column.Title.Caption := FieldConfig.DisplayLabel;
      Column.Visible := FieldConfig.Visivel;

      // Define largura se especificada
      if FieldConfig.Width > 0 then
        Column.Width := FieldConfig.Width;
    end;
  end;

end;

end.
