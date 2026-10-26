unit UPendOficina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, Grids, DBGrids, UclassesPend, StdCtrls;

type
  TFrmPendOficina = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    imgInformation: TImage;
    Label4: TLabel;
    Panel2: TPanel;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    hrPesquisa, HrFormpag: THandle;
  public
    { Public declarations }
  end;

var
  FrmPendOficina: TFrmPendOficina;
  CadPendOS: TPendOS;
implementation

uses uClasseFP, uDtmFormPag, funcoes, UDtmBalcao, UPesqCXL, ConsultasUCxl;
{$R *.dfm}

procedure TFrmPendOficina.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if Trim(CadPendOS.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R' then
    if not TDBGrid(sender).SelectedRows.CurrentRowSelected then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen; // define uma cor de fundo //$00FFD9B3
      TDBGrid(sender).Canvas.FillRect(Rect); // pinta a célula
      TDBGrid(sender).DefaultDrawDataCell(Rect,Column.Field, state); // pinta o texto padrão
    end;
end;

procedure TFrmPendOficina.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender);
end;

procedure TFrmPendOficina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := caFree;
  FrmPendOficina := nil;
  CadPendOS.Free;
end;

procedure TFrmPendOficina.FormCreate(Sender: TObject);
begin
  inherited;
  CadPendOS := TPendOS.create;
  CadPendOS.verificaFiscalAtivo;
  CadPendOS.abrePendOs;
end;

procedure TFrmPendOficina.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if Key = VK_RETURN then
    begin
      if ActiveControl <> DBGrid1 then
      	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        	DBGrid1.SetFocus;
    end
    else if key = VK_F2 then
      SpeedButton2Click(SpeedButton2)
    else if key = VK_F3 then
      SpeedButton3Click(SpeedButton3)
    else if key = VK_F4 then
      SpeedButton4Click(SpeedButton4)
    else if key = VK_F5 then
      SpeedButton5Click(SpeedButton5)
    else if key = VK_F6 then
      SpeedButton6Click(SpeedButton6)
    else if key = VK_F7 then
      SpeedButton7Click(SpeedButton7);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.FormShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
    'Click no nome da coluna para Ordernar' + #13 +
    'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 + #13 +
    'Processo "CXL063" VERIFICAR PEND. NF OU CUPOM NO RECEBIMENTO CXL' + #13 +
    'Processo "CXL064" PERMITIR PEND. NF OU CUPOM NO RECEBIMENTO CXL' + #13 +
    'Processo "CXL079" PERMITIR RECEBER DOCUMENTOS COM DATA FECHAMENTO DIFERENTE DA DATA DO CXL' + #13 +
		'Processo "CXL084" PERMITIR NAO INFORMAR VALOR DE ENTRADA CXL' + #13 +
    'Processo "CXL085" PERMITIR REEBER DOCUMENTOS VALOR MENOR CXL';
end;

procedure TFrmPendOficina.SpeedButton1Click(Sender: TObject);
var
  obFp: TFormPag2;
  codcondpag, codcliente, codvendedor: integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendOS.ultdiaCXL then
      Exit;
    codcondpag := CadPendOS.dataSet.FieldByName('cod_cond_pag').AsInteger;
    codcliente := CadPendOS.dataSet.FieldByName('cod_cliente').AsInteger;
    codvendedor := CadPendOS.dataSet.FieldByName('cod_vendedor').AsInteger;
    if CadPendOS.recebendo then
    begin
      if CadPendOS.marcaRec(1) then
      begin
        //      if dtmFP.iniciaFormaPagamento(CadPendOS.dataSet.FieldByName('N_OS').AsInteger,
//        if dtmFP.iniciaFormaPagamento(CadPendOS.dataSet.FieldByName('NPED').AsInteger,
//          //        codcondpag, 1, codcliente, codvendedor, 'OS', CadPendOS.dataSet.FieldByName('VALOR_OS').Value) then
//          codcondpag, 1, codcliente, codvendedor, 'OS',
//            CadPendOS.dataSet.FieldByName('VALOR_TOTAL').Value) then
//        begin
//          // Fazer um teste se gravado, ok senão desfazer a operação....
//  //        CadPendOS.confirmarecebimento(CadPendOS.dataSet.FieldByName('VALOR_OS').Value);
//          CadPendOS.confirmarecebimento(CadPendOS.dataSet.FieldByName('VALOR_TOTAL').Value);
//        end
//        else
//          CadPendOS.marcaRec(2);
      end;
    end
    else
      messagedlg('Documento sendo recebido por outro usuário', mtinformation, [mbOK], 0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.SpeedButton2Click(Sender: TObject);
var
  vsmrec, vsmnrec: currency;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendOS.ultdiaCXL then
      Exit;
    vsmrec := 0.00;
    vsmnrec := 0.00;
    CadPendOS.first;
    while not CadPendOS.Eof do
    begin
      if CadPendOS.dataSet.FieldByName('VL_PAGO_CXL').IsNull or
        (CadPendOS.dataSet.FieldByName('VL_PAGO_CXL').value = 0) then
        vsmnrec := vsmnrec + CadPendOS.dataSet.FieldByName('VALOR_TOTAL').value
      else
        vsmrec := vsmrec + CadPendOS.dataSet.FieldByName('VL_PAGO_CXL').value;
      CadPendOS.next;
    end;
    messagedlg('Valores Recebidos....: ' + format('%n', [vsmrec]) + #13 +
      'Valores Não Recebidos: ' + format('%n', [vsmnrec]), mtinformation, [mbOK], 0);
    CadPendOS.First;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.SpeedButton3Click(Sender: TObject);
var
  obFp: TFormPag2;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendOS.ultdiaCXL then
      Exit;
    obFp := TFormPag2.create;
    obFp.detalhamentoVenda(CadPendOS.dataSet.FieldByName('NPED').AsInteger, 'OS');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.SpeedButton4Click(Sender: TObject);
var
  lconsultaPendReq: TConsultaPendOS;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendOS.ultdiaCXL then
      Exit;
    lconsultaPendReq := TConsultaPendOS.Create;
    Application.CreateForm(TFrmPesqCxl, FrmPesqCxl);
    FrmPesqCxl.Caption := 'Consulta de Ordem de Serviço...';
    FrmPesqCxl.Consulta := lconsultaPendReq;
    FrmPesqCxl.Consulta.CdsPesq := CadPendOS.dataSet;
    FrmPesqCxl.showmodal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  //  CadPendOS.Close;
  try
    Screen.Cursor := crHourGlass;
    if CadPendOS.ultdiaCXL then
      Exit;
    CadPendOS.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.SpeedButton6Click(Sender: TObject);
var
  obFp: TFormPag2;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendOS.ultdiaCXL then
      Exit;
    obFp := TFormPag2.create;
    if Application.MessageBox('Deseja realmente Cancelar recebimento desta venda?', 'Confirmação',
      MB_YESNO + MB_DEFBUTTON2) = mrYES then
    begin
      if obFp.cancelaVenda(CadPendOS.dataSet.FieldByName('NPED').AsInteger, 'OS') then
      begin
        CadPendOS.marcaRec(2);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendOS.ultdiaCXL then
      Exit;
    CadPendOS.enviarVendaParaCupom;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendOficina.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

