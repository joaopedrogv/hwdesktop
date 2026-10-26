unit UFech_dia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, Grids, DBGrids, ExtCtrls,uclasseslancamentos, Menus;

type
  TFrmFech_Dia = class(TfrmPadrao)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    imgInformation: TImage;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    pnCredChequeSendoRec: TPanel;
    Panel4: TPanel;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    PopupMenu1: TPopupMenu;
    DesmarcardocumentocomoRecebendo1: TMenuItem;
    MarcarTodos: TMenuItem;
    DesmarcarTodos: TMenuItem;
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DesmarcarTodosClick(Sender: TObject);
    procedure MarcarTodosClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DesmarcardocumentocomoRecebendo1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CadLancamentos: TLancamentos;
  public
    { Public declarations }
  end;

var
  FrmFech_Dia: TFrmFech_Dia;

implementation

uses uDtmLancamentos,udadosini,uDtmAtivo, uCadLancamentos;

{$R *.dfm}

procedure TFrmFech_Dia.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton4Click(Sender)
  else if key = VK_DELETE then
    SpeedButton1Click(Sender);
end;

procedure TFrmFech_Dia.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    CadLancamentos.vDocSendoRec._marcaDesmarcaLinha;
end;

procedure TFrmFech_Dia.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if CadLancamentos.vDocSendoRec.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid2.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGrid2.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmFech_Dia.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_SPACE then
    CadLancamentos.vDocSendoRec._marcaDesmarcaLinha;
end;

procedure TFrmFech_Dia.DesmarcardocumentocomoRecebendo1Click(Sender: TObject);
begin
  inherited;
  CadLancamentos.vDocSendoRec._desmarcarDocumentoComoRecebendo;
end;

procedure TFrmFech_Dia.DesmarcarTodosClick(Sender: TObject);
begin
  inherited;
	CadLancamentos.vDocSendoRec._desmarcarTodos;
end;

procedure TFrmFech_Dia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
	Action:=caFree;
end;

procedure TFrmFech_Dia.FormShow(Sender: TObject);
begin
  inherited;
  CadLancamentos:=  TLancamentos.create;
  CadLancamentos.vFechDia._abreFechamento('1');
  if not vDadosIni.validarAcessoEmpresasUnificadas(CadLancamentos.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    FrmFech_Dia.fechar := True;
    PostMessage(FrmFech_Dia.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
     'Click no nome da coluna para Ordernar'+ #13 +
     'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 + #13 +
     'Processo "LANC021" PERMITIR FECHAR FINANCEIRO COM DIFERENCA' + #13 +
     'Processo "LANC027" PERMITIR FECHAR FINANCEIRO SEM IMPORTACAO DAS FORMAS DE PAGAMENTO' + #13 +
     'Processo "LANC032" PERMITIR FECHAR FINANCEIRO SEM BAIXAR CRÉDITOS COM MERCADORIAS RETORNADAS' + #13 +
     'Processo "LANC041" PERMITIR FECHAR FINANCEIRO SEM REALIZAR A CONCILIACAO BANCARIA' +
     vDadosIni.IfThen(vDadosIni.vEmp.vModoFaturamento = 'N',
     		#13 + 'Processo "LANC047" PERMITIR FECHAR FINANCEIRO COM DOCUMENTOS SEM RECEBIMENTO', '');
end;

procedure TFrmFech_Dia.MarcarTodosClick(Sender: TObject);
begin
  inherited;
	CadLancamentos.vDocSendoRec._marcarTodos;
end;

procedure TFrmFech_Dia.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  try
  	SpeedButton6.Enabled := False;
  	SpeedButton5.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton1.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton2.Enabled := False;

    if not vDadosIni.validarAcessoCadastrosEmpresas('FECHAMENTO_DIA_FINANCEIRO', 'E', CadLancamentos.buscas) then
      Exit;
      
    if not vDadosIni.PesqPros('LANC020', 'REABRIR', '', 'FECH_DIA',
    	CadLancamentos.vFechDia.dataSet.FieldByName('DIA_FCD').AsString,
      CadLancamentos.buscas, True) then
      	Exit;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(CadLancamentos.buscas) then
    	Exit;

    // Financeiro sendo importado
    if vDadosIni.financeiroImportando(CadLancamentos.buscas) then
    	Exit;

    if not CadLancamentos.ReabirDiaCX then
      Exit;

    vDadosIni.negativarClientes(0, '');
  finally
  	SpeedButton6.Enabled := True;
  	SpeedButton5.Enabled := True;
    SpeedButton4.Enabled := True;
    SpeedButton1.Enabled := True;
    SpeedButton3.Enabled := True;
    SpeedButton2.Enabled := True;
  end;
end;

procedure TFrmFech_Dia.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  CadLancamentos.Close;
  CadLancamentos.Free;
  close;
end;

procedure TFrmFech_Dia.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('LANC019', 'TIRAR', '', 'FECH_DIA',
  	CadLancamentos.vFechDia.dataSet.FieldByName('DIA_FCD').AsString,
    CadLancamentos.buscas, True) then
    	Exit;
      
  CadLancamentos.vFechDia.retiraMarcaFech;
end;

procedure TFrmFech_Dia.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  try
  	SpeedButton6.Enabled := False;
  	SpeedButton5.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton1.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton2.Enabled := False;

    if not vDadosIni.validarAcessoCadastrosEmpresas('FECHAMENTO_DIA_FINANCEIRO', 'I', CadLancamentos.buscas) then
      Exit;

    if not vDadosIni.PesqPros('LANC018', 'FECHAR', '', 'LANCAMENTOS',
    	DateToStr(vDadosIni.diaFFinanceiro + 1),
      CadLancamentos.buscas, True) then
      	Exit;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(CadLancamentos.buscas) then
    	Exit;

    // Financeiro sendo importado
    if vDadosIni.financeiroImportando(CadLancamentos.buscas) then
    	Exit;

    if not CadLancamentos.FecharDiaCX then
      Exit;

    vDadosIni.negativarClientes(0, '');
  finally
  	SpeedButton6.Enabled := True;
  	SpeedButton5.Enabled := True;
    SpeedButton4.Enabled := True;
    SpeedButton1.Enabled := True;
    SpeedButton3.Enabled := True;
    SpeedButton2.Enabled := True;
  end;
end;

procedure TFrmFech_Dia.SpeedButton5Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('LANC051', 'TIRAR', '', 'FECH_DIA',
  	CadLancamentos.vFechDia.dataSet.FieldByName('DIA_FCD').AsString,
    CadLancamentos.buscas, True) then
    	Exit;

  CadLancamentos.vFechDia.retiraMarcaImport;
end;

procedure TFrmFech_Dia.SpeedButton6Click(Sender: TObject);
begin
  inherited;
	if not CadLancamentos.abreFormCredChqSendoRec then
    Exit;
end;

procedure TFrmFech_Dia.SpeedButton7Click(Sender: TObject);
begin
  inherited;
	TForm(pnCredChequeSendoRec.Parent).ModalResult := IDOK;
end;

end.
