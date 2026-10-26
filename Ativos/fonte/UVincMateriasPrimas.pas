unit UVincMateriasPrimas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, uDadosIni, Grids,
  DBGrids;

type
  TFrmVincMateriasPrimas = class(TForm)
    GroupBox84: TGroupBox;
    lbDescGrupoAcabado: TLabel;
    lbDescCodigoAcabado: TLabel;
    lbDescNumFabAcabado: TLabel;
    lbDescCodGradeAcabado: TLabel;
    GroupBox85: TGroupBox;
    Panel144: TPanel;
    btCadastroMateriasPrimasOK: TBitBtn;
    CadastroMateriasPrimasCancel: TBitBtn;
    DBGrid1: TDBGrid;
    lbDescGrupoMPrima: TLabel;
    lbDescCodigoMPrima: TLabel;
    lbDescNumFabMPrima: TLabel;
    lbDescQuantMPrima: TLabel;
    lbGrupoMPrima: TLabel;
    lbCodigoMPrima: TLabel;
    lbNumFabMPrima: TLabel;
    lbDescrMPrima: TLabel;
    lbQuantMPrima: TLabel;
    lbDescAcabado: TLabel;
    lbGrupoAcabado: TLabel;
    lbCodigoAcabado: TLabel;
    lbNumFabAcabado: TLabel;
    lbCodGradeAcabado: TLabel;
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure CadastroMateriasPrimasCancelClick(Sender: TObject);
    procedure btCadastroMateriasPrimasOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVincMateriasPrimas: TFrmVincMateriasPrimas;

implementation

uses
  DB, uDtmAtivo;

{$R *.dfm}

procedure TFrmVincMateriasPrimas.btCadastroMateriasPrimasOKClick(
  Sender: TObject);
var
	vQuant: Double;
begin
  vQuant := 0;

	DBGrid1.DataSource.DataSet.First;
  while not DBGrid1.DataSource.DataSet.Eof do
  begin
  	if DBGrid1.DataSource.DataSet.FieldByName('COD_GRADE').AsInteger > 0 then
	  	vQuant := vQuant + Abs(DBGrid1.DataSource.DataSet.FieldByName('QUANT').AsFloat);

    DBGrid1.DataSource.DataSet.Next;
  end;

  if  StrToFloat(lbQuantMPrima.Caption) <> vQuant then
  begin
  	Application.MessageBox(Pchar('Quantidade total das grades informadas deve ser igual a quantidade da matéria prima/insumo/embalagem.'), 'Atenção', +MB_ICONWARNING + MB_OK);
    exit;
  end;

	Self.ModalResult := mrOk;
end;

procedure TFrmVincMateriasPrimas.CadastroMateriasPrimasCancelClick(
  Sender: TObject);
var
	vtemp: string;
begin
	vtemp := 'Deseja sair sem vincular as grades do Produto Acabado e Matérias Primas/Insumos/Embalagens?' + #13 + #13 +
  	'Se a produção automática estiver habilitada não será gerada para este produto acabado.';

	if Application.MessageBox(PChar(vtemp),
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES then
    	exit;

  Self.ModalResult := mrCancel;
end;

procedure TFrmVincMateriasPrimas.DBGrid1CellClick(Column: TColumn);
begin
	if not DBGrid1.DataSource.DataSet.FieldByName('COD_GRADE').IsNull then
  begin
		if Column.Field.FieldName = 'QUANT' then
  		DBGrid1.Options := DBGrid1.Options + [dgEditing]
	  else
  		DBGrid1.Options := DBGrid1.Options - [dgEditing];
  end
  else
	  DBGrid1.Options := DBGrid1.Options - [dgEditing];
end;

procedure TFrmVincMateriasPrimas.DBGrid1ColEnter(Sender: TObject);
var
	I: Integer;
  vColQuant: Integer;
begin
	if not DBGrid1.DataSource.DataSet.FieldByName('COD_GRADE').IsNull then
  begin
  	for I := 0 to DBGrid1.Columns.Count - 1 do
    	if DBGrid1.Columns[I].Field.FieldName = 'QUANT' then
      begin
      	vColQuant := I;
        Break;
      end;

    if DBGrid1.SelectedIndex = vColQuant then
    	DBGrid1.Options := DBGrid1.Options + [dgEditing]
	  else
  		DBGrid1.Options := DBGrid1.Options - [dgEditing];
  end
  else
  	DBGrid1.Options := DBGrid1.Options - [dgEditing];
end;

procedure TFrmVincMateriasPrimas.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if key = VK_DOWN then
    if DBGrid1.DataSource.DataSet.FieldByName('COD_GRADE').IsNull then
      DBGrid1.DataSource.DataSet.Cancel;
end;

end.
