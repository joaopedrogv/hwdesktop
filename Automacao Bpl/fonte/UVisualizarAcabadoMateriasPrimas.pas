unit UVisualizarAcabadoMateriasPrimas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, UDtmProdutos, ExtCtrls, 
  UClassesProdutos, uClassesIndiceTecnico;

type
  TFrmVisualizarAcabadoMateriasPrimas = class(TForm)
    GroupBox6: TGroupBox;
    DBText1: TDBText;
    Label22: TLabel;
    DBText2: TDBText;
    Label24: TLabel;
    DBText5: TDBText;
    Label25: TLabel;
    DBText6: TDBText;
    Label26: TLabel;
    DBText7: TDBText;
    Label27: TLabel;
    DBText8: TDBText;
    GroupBox8: TGroupBox;
    DBGrid10: TDBGrid;
    GroupBox9: TGroupBox;
    DBGrid11: TDBGrid;
    Panel1: TPanel;
    btAlterarGradeMateriaPrima: TSpeedButton;
    BitBtn23: TBitBtn;
    Panel2: TPanel;
    btRemoverVinculoGradeProdutosAcabado: TSpeedButton;
    Panel3: TPanel;
    btRemoverVinculoGradeProdutosAcabadoMateriaPrima: TSpeedButton;
    pnGradeMateriaPrima: TPanel;
    GroupBox1: TGroupBox;
    DBText3: TDBText;
    Label1: TLabel;
    DBText4: TDBText;
    Label2: TLabel;
    DBText9: TDBText;
    Label3: TLabel;
    DBText10: TDBText;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    btOK: TBitBtn;
    btCancelar: TBitBtn;
    Label4: TLabel;
    DBText11: TDBText;
    Panel129: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btAlterarGradeMateriaPrimaClick(Sender: TObject);
    procedure btRemoverVinculoGradeProdutosAcabadoClick(Sender: TObject);
    procedure btRemoverVinculoGradeProdutosAcabadoMateriaPrimaClick(
      Sender: TObject);
    procedure DBGrid11DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid10DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btOKClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vIndTec: TIndiceTecnico;
    vConsProdutoAcabado: TConsProdutoAcabado;
  end;

var
  FrmVisualizarAcabadoMateriasPrimas: TFrmVisualizarAcabadoMateriasPrimas;

implementation

uses DB, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmVisualizarAcabadoMateriasPrimas.BitBtn1Click(Sender: TObject);
begin
	TForm(pnGradeMateriaPrima.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.BitBtn23Click(Sender: TObject);
begin
	Self.ModalResult := mrCancel;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.btAlterarGradeMateriaPrimaClick(
  Sender: TObject);
begin
  if vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.DataSet.FieldByName('COD_GRADE').AsInteger <= 0 then
  begin
    Application.MessageBox('Selecione um produto com grade para alterar.', 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if Application.MessageBox(PChar('Deseja alterar a grade ' +
    IntToStr(vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.DataSet.FieldByName('COD_GRADE').AsInteger) +
    ' da Matéria Prima/Insumo/Embalagem?' + #13 + #13 +
    'PRODUTO' + #13 +
    'Grupo Prod: ' + IntToStr(vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.DataSet.FieldByName('GRUPO_PROD').AsInteger) + #13 +
    'Cod Prod: ' +  trim(vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.DataSet.FieldByName('COD_PROD').AsString) + #13 +
    'Num Fabr: ' + trim(vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.DataSet.FieldByName('NUM_FAB_PROD').AsString) + #13 +
    'Descrição: ' + trim(vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.DataSet.FieldByName('DESCR_PROD').AsString)),
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES then
    exit;

  vIndTec.vProdutosAcabado.vMateriasPrima.vGradeMatPrima.abreMateriasPrimaGrade(
    vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('grupo_prod').AsInteger,
    vConsProdutoAcabado.vConsMateriaPrimaProdutoAcabado.dataSet.FieldByName('cod_prod').AsString);

  if not vDadosIni.abreForm('Grades da Matéria Prima / Insumo / Embalagem', pnGradeMateriaPrima, [ofAutoSize, ofEscapeExit]) then
    exit;

  if not vIndTec.alterarGradeMateriaPrima(vConsProdutoAcabado) then
    exit;

  vConsProdutoAcabado._abreConsProdutoAcabado(vDadosIni.vPesquisaGrupo_prod, vDadosIni.vPesquisaCod_prod);
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.btCancelarClick(
  Sender: TObject);
begin
	TForm(pnGradeMateriaPrima.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.btOKClick(Sender: TObject);
begin
	if DBGrid1.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(PChar('Nenhuma grade selecionada.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
  	TForm(pnGradeMateriaPrima.Parent).ModalResult := IDCANCEL;
  end
  else
  begin
  	if DBText11.DataSource.DataSet.FieldByName('COD_GRADE').AsInteger = DBGrid1.DataSource.DataSet.FieldByName('COD_GRADE').AsInteger then
    begin
    	Application.MessageBox(PChar('Grade selecionada e a grade que deseja alterar é a mesma, informe outra.' + #13 + #13 +
      	'GRADE' + #13 +
        'Cod Grade: ' + IntToStr(DBGrid1.DataSource.DataSet.FieldByName('COD_GRADE').AsInteger) + #13 +
        'Descrição 1: ' + trim(DBGrid1.DataSource.DataSet.FieldByName('DESCRICAO').AsString) + #13 +
        'Descrição 2: ' + trim(DBGrid1.DataSource.DataSet.FieldByName('DESCRICAO1').AsString)), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

		TForm(pnGradeMateriaPrima.Parent).ModalResult := IDOK;
  end;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.btRemoverVinculoGradeProdutosAcabadoClick(
  Sender: TObject);
begin
	if DBGrid10.DataSource.dataSet.IsEmpty then
  begin
  	Application.MessageBox('Nenhuma grade do produto acabado selecionada.', 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
  	exit;
  end;

	if not vDadosIni.deletarVinculosGradeAcabadoMateriaPrima(
  	vIndTec.buscas,
  	DBGrid10.DataSource.dataSet.FieldByName('grupo_prod').AsInteger,
    DBGrid10.DataSource.dataSet.FieldByName('cod_prod').AsString,
    DBGrid10.DataSource.dataSet.FieldByName('cod_grade').AsInteger) then
    	exit;

	if (vDadosIni.vEmp.vUsarProducao = 'S') then
    begin
     if vDadosIni.produtoAcabadoPrimaTemGrade(
       vIndTec.buscas,
       DBGrid10.DataSource.dataSet.FieldByName('grupo_prod').AsInteger,
       DBGrid10.DataSource.dataSet.FieldByName('cod_prod').AsString,
       0,
       '') then
     begin
       if vDadosIni.existeGradeProducao(
        vIndTec.buscas,
        DBGrid10.DataSource.dataSet.FieldByName('grupo_prod').AsInteger,
        DBGrid10.DataSource.dataSet.FieldByName('cod_prod').AsString,
        0,
        '') then
       begin
         if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
           vIndTec.buscas, 
           DBGrid10.DataSource.dataSet.FieldByName('grupo_prod').AsInteger,
           DBGrid10.DataSource.dataSet.FieldByName('cod_prod').AsString,
           0,
           0,
           '',
           0,
         	 true) then
             exit;
       end;
     end;
  end;

	if (vDadosIni.vEmp.vUsarProducao = 'S') then
	  vConsProdutoAcabado._abreConsProdutoAcabado(DBGrid10.DataSource.dataSet.FieldByName('grupo_prod').AsString, DBGrid10.DataSource.dataSet.FieldByName('cod_prod').AsString);
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.btRemoverVinculoGradeProdutosAcabadoMateriaPrimaClick(
  Sender: TObject);
begin
 	if not vDadosIni.deletarVinculosGradeAcabadoMateriaPrima(
  	vIndTec.buscas,
  	StrToInt(vDadosIni.vPesquisaGrupo_prod),
    vDadosIni.vPesquisaCod_prod) then
    	exit;

	if (vDadosIni.vEmp.vUsarProducao = 'S') then
    begin
     if vDadosIni.produtoAcabadoPrimaTemGrade(
       vIndTec.buscas,
       StrToInt(vDadosIni.vPesquisaGrupo_prod),
       vDadosIni.vPesquisaCod_prod,
       0,
       '') then
     begin
       if vDadosIni.existeGradeProducao(          
        vIndTec.buscas,
        StrToInt(vDadosIni.vPesquisaGrupo_prod),
        vDadosIni.vPesquisaCod_prod,
        0,
        '') then
       begin
         if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
           vIndTec.buscas,	
           StrToInt(vDadosIni.vPesquisaGrupo_prod),
           vDadosIni.vPesquisaCod_prod,
           0,
           0,
           '',
           0,
         	 true) then
             exit;
       end;
     end;
  end;

  if (vDadosIni.vEmp.vUsarProducao = 'S') then
	  vConsProdutoAcabado._abreConsProdutoAcabado(vDadosIni.vPesquisaGrupo_prod, vDadosIni.vPesquisaCod_prod);
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.DBGrid10DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
	if ((Column.Field.Dataset.FieldbyName('GRUPO_PROD').AsInteger > 0) or (trim(Column.Field.Dataset.FieldbyName('COD_PROD').AsString) <> ''))
  	and (Column.Field.Dataset.FieldbyName('ID_IND').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.DBGrid11DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
	if ((Column.Field.Dataset.FieldbyName('GRUPO_PROD').AsInteger > 0) or (trim(Column.Field.Dataset.FieldbyName('COD_PROD').AsString) <> ''))
  	and (Column.Field.Dataset.FieldbyName('ID_IND_IT').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if (vConsProdutoAcabado <> nil) then
    vConsProdutoAcabado.Cancel;

  vConsProdutoAcabado.free;
  vConsProdutoAcabado := nil;

  Action := caFree;
  if (FrmVisualizarAcabadoMateriasPrimas <> nil) then
    FrmVisualizarAcabadoMateriasPrimas := nil;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.FormCreate(Sender: TObject);
begin
  vConsProdutoAcabado := TConsProdutoAcabado.create;
end;

procedure TFrmVisualizarAcabadoMateriasPrimas.FormShow(Sender: TObject);
begin
	vConsProdutoAcabado._abreConsProdutoAcabado(vDadosIni.vPesquisaGrupo_prod, vDadosIni.vPesquisaCod_prod);
end;

end.
