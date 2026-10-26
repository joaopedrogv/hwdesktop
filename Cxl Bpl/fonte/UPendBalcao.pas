unit UPendBalcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, Grids, uclassespend, StdCtrls, DBGrids, 
  DBClient, IBDatabase, Menus;

type
  TFrmPendBalcao = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Panel10: TPanel;
    imgInformation: TImage;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    pnCarga: TPanel;
    SpeedButton11: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton21: TSpeedButton;
    Label2: TLabel;
    Image1: TImage;
    Panel3: TPanel;
    SpeedButton16: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Label3: TLabel;
    SpeedButton22: TSpeedButton;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel4: TPanel;
    SpeedButton25: TSpeedButton;
    pnEmitirDoc: TPanel;
    GroupBox73: TGroupBox;
    Label260: TLabel;
    GroupBox74: TGroupBox;
    btEmitirNFe: TBitBtn;
    btEmitirCupomNFCe: TBitBtn;
    btEmitirNFSe: TBitBtn;
    btEmitirFechar: TBitBtn;
    procedure pnEmitirDocEnter(Sender: TObject);
    procedure btEmitirNFeClick(Sender: TObject);
    procedure btEmitirNFSeClick(Sender: TObject);
    procedure btEmitirCupomNFCeClick(Sender: TObject);
    procedure btEmitirFecharClick(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    hrPesquisa, HrFormpag: THandle;
    vdif: integer;
  public
    { Public declarations }
   CadPendReq: Tpendreq;
   function montarExcel:boolean;
  end;

var
  FrmPendBalcao: TFrmPendBalcao;

  PrimeiraPesquisa: Boolean;
  TemColunasComPosicaoAlteradas: Boolean;
  vConfigColuna : boolean;
  campoPesquisa: string;
  cdsColunas: TClientDataSet;

  cdsGrid: TClientDataSet;
  GridCfg: TDBGrid;
  ListGridsAndDataSets: TStrings;
  ListPositions: TStrings;

  trans: TIBTransaction;
  vTabela, vCampoPadrao: string;
  fReset, vCtrlClick, vShiftClick: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt,vAlterarNomeDtSet, usuario: string;
  vCamposPadraoRegistro: Boolean;

implementation

uses uClasseFP, uDtmFormPag, funcoes, UDtmBalcao, UPesqCXL, ConsultasUCxl,
  uDtmAtivo, uClassesNotasFiscais, UClassesPedVenda, uDataSet_OOP, DB, CheckLst, IniFiles,
  ContainerUnit, Math,
  uColunasExcel, Clipbrd, uDadosIni, hw_utils;

{$R *.dfm}

procedure TFrmPendBalcao.btEmitirCupomNFCeClick(Sender: TObject);
var
	vCodProcesso: string;
begin
  inherited;
  vCodProcesso := 'CXL034';
  if trim(CadPendReq.dataSet.fieldbyname('TIPO').AsString) = 'OS'  then
  	vCodProcesso := 'CXL089';

  if not vDadosIni.PesqPros(vCodProcesso, 'EMITIR',
    CadPendReq.dataSet.fieldbyname('TIPO').AsString + ' ' + CadPendReq.dataSet.FieldByName('NPED').AsString,
    'PEDVENDA',
    CadPendReq.dataSet.FieldByName('NPED').AsString,
    CadPendReq.Buscas,
    True) then
      Exit;

  try
    Screen.Cursor := crHourGlass;
    if (vDadosIni.vFiscalAtivo = 'S') then
      CadPendReq.enviarVendaParaCupom
    else if vDadosIni.vNFConsumidor.CodEmissor > 0 then
      CadPendReq.enviarVendaParaNFCe;
        
    CadPendReq.Refresh;
  finally
    Screen.Cursor := crDefault;
    TForm(pnEmitirDoc.Parent).ModalResult := IDOK;
  end;
end;

procedure TFrmPendBalcao.btEmitirFecharClick(Sender: TObject);
begin
  inherited;
	TForm(pnEmitirDoc.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmPendBalcao.btEmitirNFeClick(Sender: TObject);
var
	vCodProcesso: string;
begin
  inherited;
  vCodProcesso := 'CXL090';
  if trim(CadPendReq.dataSet.fieldbyname('TIPO').AsString) = 'OS'  then
  	vCodProcesso := 'CXL091';

	if not vDadosIni.PesqPros(vCodProcesso, 'EMITIR',
    CadPendReq.dataSet.fieldbyname('TIPO').AsString + ' ' + CadPendReq.dataSet.FieldByName('NPED').AsString,
    'PEDVENDA',
    CadPendReq.dataSet.FieldByName('NPED').AsString,
    CadPendReq.Buscas,
    True) then
      Exit;

  try
    Screen.Cursor := crHourGlass;

  	CadPendReq.emitirNotaDoPedido(False);

    CadPendReq.Refresh;
  finally
    Screen.Cursor := crDefault;
    TForm(pnEmitirDoc.Parent).ModalResult := IDOK;
  end;
end;

procedure TFrmPendBalcao.btEmitirNFSeClick(Sender: TObject);
var
	vCodProcesso: string;
begin
  inherited;
  vCodProcesso := 'CXL092';
  if not vDadosIni.PesqPros(vCodProcesso, 'EMITIR',
    CadPendReq.dataSet.fieldbyname('TIPO').AsString + ' ' + CadPendReq.dataSet.FieldByName('NPED').AsString,
    'PEDVENDA',
    CadPendReq.dataSet.FieldByName('NPED').AsString,
    CadPendReq.Buscas,
    True) then
      Exit;

  try
    Screen.Cursor := crHourGlass;

  	CadPendReq.verificaOSNFSe(True, False);

    CadPendReq.Refresh;
  finally
    Screen.Cursor := crDefault;
    TForm(pnEmitirDoc.Parent).ModalResult := IDOK;
  end;
end;

procedure TFrmPendBalcao.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, DBGrid1, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TFrmPendBalcao.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TFrmPendBalcao.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TFrmPendBalcao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
//  if pnCarga.Visible then
  TDBGrid(sender).canvas.Font.color := clWindowText;
	if not (gdFocused in State) then
    if (Trim(CadPendReq.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R')
      and (Trim(CadPendReq.dataSet.FieldByName('DIFCX').AsString) = 'S') then
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($009595FF);
      TDBGrid(sender).Canvas.FillRect(Rect);
    end
    else if (Trim(CadPendReq.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R') then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
      TDBGrid(sender).Canvas.FillRect(Rect);
    end;
  TDBGrid(sender).DefaultDrawDataCell(Rect,Column.Field, state);
{  if vdif = 1 then
  begin
   DBGrid1.Canvas.Brush.Color := clRed; // define uma cor de fundo //$00FFD9B3
   DBGrid1.Canvas.FillRect(Rect); // pinta a célula
   DBGrid1.DefaultDrawDataCell(Rect,Column.Field, state); // pinta o texto padrão
  end;
 } 
end;

procedure TFrmPendBalcao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 itx: integer;
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender);
end;

procedure TFrmPendBalcao.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid1,Column);
end;

procedure TFrmPendBalcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not Assigned(DBGrid1.DataSource) then
    Exit;
  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
      cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);

  if TemColunasComPosicaoAlteradas then
  	vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid1, GridCfg, true, ListPositions, cdsGrid);

//  restoreDataSetDefault(DBGrid1, True);// aqui limpa o ListPositions pois o formulario vai ser fechado

  Action := caFree;
  FrmPendBalcao := nil;
  CadPendReq.Free;
end;

procedure TFrmPendBalcao.FormCreate(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPendReq := TPendReq.create;
    CadPendReq.verificaFiscalAtivo;
    CadPendReq.verificaNFCeAutomatica;
//    if Sender.ClassName = '' then
    CadPendReq.vtipdoc:=vDadosIni.vformosreq;
    CadPendReq.vecommerce:=vDadosIni.vformosecommerce;
    TemColunasComPosicaoAlteradas := False;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vShiftClick := Key = VK_SHIFT;
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
    begin
      if not pnCarga.Visible then
        SpeedButton4Click(SpeedButton4)
      else
        SpeedButton21.Click;
    end
    else if key = VK_F5 then
      SpeedButton5Click(SpeedButton5)
    else if key = VK_F6 then
      SpeedButton6Click(SpeedButton6)
    else if key = VK_F7 then
    begin
      if not pnCarga.Visible then
        SpeedButton7.Click
      else
        SpeedButton16.Click;
    end
    else if key = VK_F8 then
    begin
      if not pnCarga.Visible then
        SpeedButton9.Click
      else
        SpeedButton20.Click;
    end
    else if key = VK_F9 then
    begin
    	if not pnCarga.Visible then
      	SpeedButton25.Click;
    end
    else if key = VK_F11 then
    begin
    	if Classes.ssAlt in Shift then
      begin
      	CadPendReq.prepare_loop();
        try
          while not CadPendReq.Eof do
          begin
            if CadPendReq.dataSet.FieldByName('STATUS_CXL_RQ').AsString = 'R' then
            begin
               if CadPendReq.verificadiferenca then
               begin
                 CadPendReq.dataset.Edit;
                 CadPendReq.dataset.FieldByName('DIFCX').AsString := 'S';
                 CadPendReq.dataset.Post;
               end
               else
               begin
                 CadPendReq.dataset.Edit;
                 CadPendReq.dataset.FieldByName('DIFCX').AsString := 'N';
                 CadPendReq.dataset.Post;
               end;
            end
            else
            begin
              CadPendReq.dataset.Edit;
              CadPendReq.dataset.FieldByName('DIFCX').AsString := 'N';
              CadPendReq.dataset.Post;
            end;
            CadPendReq.Next;
            if CadPendReq.Eof then
             vdif:=0;
          end;
        finally
          CadPendReq.prepare_loop_done();
        end;
      end
      else if not pnCarga.Visible then
        SpeedButton10.Click;
    end
    else if key = VK_F12 then
    begin
      if Classes.ssAlt in Shift then
        SpeedButton15.Click
      else
        SpeedButton12.Click;
    end
    else if key = VK_ESCAPE then
    begin
      if pnCarga.Visible then
        SpeedButton19.Click;
    end;
         
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TFrmPendBalcao.FormShow(Sender: TObject);
begin
//  if vShow <> 1 then
//  begin
//    DBGrid1.DataSource := DtmBalcao.DtPendReq;
    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet, GridCfg, DBGrid1, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
      ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);
//  end;
  inherited;

  SpeedButton10.Visible := vDadosIni.vEmp.vUsarFechCargaCxl = 'S';
  SpeedButton23.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  SpeedButton24.Visible := vDadosIni.vProgFid.vHabilitarProgFid;

  if not SpeedButton23.Visible then
    SpeedButton8.Left := SpeedButton23.Left;

  if not SpeedButton24.Visible then
    SpeedButton19.Left := SpeedButton24.Left;

  if Panel1.Visible then
    CadPendReq.abrePendReq
  else
    CadPendReq._carga_abrePendReq;

  vDadosIni.vInibeMensPesqPros := 'S';
  CadPendReq.vTestarDtFechcomDtCaixa := vDadosIni.PesqPros('CXL078','TESTAR','','PEDVENDA', '', CadPendReq.Buscas, True);
  vdif:=0;
  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
    'Click no nome da coluna para Ordernar'+ #13 +
    'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 + #13 +
    'Processo "CXL063" VERIFICAR PENDENCIA NF OU CUPOM NO RECEBIMENTO CXL' + #13 +
    'Processo "CXL064" PERMITIR PENDENCIA NF OU CUPOM NO RECEBIMENTO CXL' + #13 +
    'Processo "CXL079" PERMITIR RECEBER DOCUMENTOS COM DATA FECHAMENTO DIFERENTE DA DATA DO CXL' + #13 +
    'Processo "CXL084" PERMITIR NAO INFORMAR VALOR DE ENTRADA CXL' + #13 +
    'Processo "CXL085" PERMITIR REEBER DOCUMENTOS VALOR MENOR CXL';

  Image1.Hint := imgInformation.Hint + #13 +
                    'Processo "CXL070" CONCEDER DESC A VISTA MAIOR QUE PERMITIDO CXL';

  if (vDadosIni.vFiscalAtivo = 'S') then
  begin
//    SpeedButton12.Caption := 'F12 - Cupom Fiscal';
    SpeedButton12.Hint    := 'Cupom Fiscal - [CXL034]';
    SpeedButton15.Caption := 'Alt+F12 - PAF-ECF';
    SpeedButton15.Hint    := 'Alt + F12 - PAF- ECF - [CXL035]';
  end
  else if vDadosIni.vNFConsumidor.CodEmissor > 0 then
  begin
//    SpeedButton12.Caption := 'F12 - NFC-e';
    SpeedButton12.Hint    := 'NFC-e - [CXL034]';
    SpeedButton15.Caption := 'Alt+F12 - NFCe';
    SpeedButton15.Hint    := 'Alt + F12 - NFCe - [CXL035]';
  end;

  if PrimeiraPesquisa then
  begin
    PrimeiraPesquisa := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  end;
end;

function TFrmPendBalcao.montarExcel: boolean;
var
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I: Integer;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
  vListaErrosExcel: TStringList;
begin

  Application.CreateForm(TfrmColunasExcel, frmColunasExcel);
  frmColunasExcel.vDataSetTabela := TClientDataSet(DBGrid1.DataSource.DataSet);
  frmColunasExcel.vNomeUsuario := usuario;
  frmColunasExcel.vTitulo := Self.Caption;
  frmColunasExcel.vTransacao := trans;
  frmColunasExcel.ShowModal;
end;

procedure TFrmPendBalcao.pnEmitirDocEnter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (btEmitirCupomNFCe.CanFocus) then
    btEmitirCupomNFCe.SetFocus;
end;

procedure TFrmPendBalcao.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TFrmPendBalcao.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

procedure TFrmPendBalcao.SalvardadosnoExcel1Click(Sender: TObject);
begin
   vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmPendBalcao.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmPendBalcao.Somarvaloresdacoluna1Click(Sender: TObject);
begin
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmPendBalcao.SpeedButton10Click(Sender: TObject);
var
  vTexto: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendReq.ultdiaCXL then
      Exit;
    if not vDadosIni.PesqPros('CXL065','INICIAR', CadPendReq.dataSet.fieldbyname('TIPO').AsString + ' ' +
      CadPendReq.dataSet.FieldByName('NPED').AsString, 'PEDVENDA',
      CadPendReq.dataSet.FieldByName('NPED').AsString, CadPendReq.Buscas, True) then
      Exit;

    vTexto := CadPendReq.dataSet.FieldByName('cod_carga').AsString;
    if not InputQuery('Fechamento de Carga', 'Informe o número da carga:', vTexto) then
      Exit;

    try
      StrToInt(vTexto);
    except
      Application.MessageBox(pchar('Numero da carga informado inválido'), 'Atenção', 0 + 64);
    end;

    if not CadPendReq._carga_fechada(StrToInt(vTexto)) then
      Exit;

    if not CadPendReq._carga_abrePendReq then
      Exit;

    if CadPendReq._carga_fin_fechada then
      Label3.Caption := 'Carga Fechada N° ' + vTexto
    else
      Label3.Caption := 'Carga Aberta N° ' + vTexto;

    pnCarga.Visible := True;
    Panel1.Visible := False;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if CadPendReq.ultdiaCXL then
    Exit;

  btEmitirNFSe.Enabled :=
    (trim(CadPendReq.dataSet.FieldByName('TIPO').AsString) = 'OS')
    and (vDadosIni.vEmp.vNfe.modeloNFServico = '55')
    and (CadPendReq.verificarNFSe(CadPendReq.dataSet.FieldByName('NPED').AsInteger,
                                   CadPendReq.dataSet.FieldByName('TIPO').AsString,
                                   True,
                                   False));
  if not vDadosIni.abreForm('Atenção', pnEmitirDoc, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
    exit;
end;

procedure TFrmPendBalcao.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  // Cupom / NFCe
  if vDadosIni.vNFConsumidor.CodEmissor > 0 then
  begin
    try
      if CadPendReq.ultdiaCXL then
        Exit;

      if not vDadosIni.PesqPros('CXL035','INICIAR',CadPendReq.dataSet.fieldbyname('TIPO').AsString,'','',CadPendReq.Buscas) then
        Exit;

      vDadosIni.nfc_abreFormNFConsumidor('nfc_abreformNFCe', 1);

    finally
      Screen.Cursor := crDefault;
    end;
    Exit;
  end;

  try
   if CadPendReq.ultdiaCXL then
     Exit;
   if vDadosIni.PesqPros('CXL035','INICIAR',CadPendReq.dataSet.fieldbyname('TIPO').AsString,'','',CadPendReq.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    CadPendReq.showFiscal;
    CadPendReq.Refresh;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendReq.ultdiaCXL then
      Exit;
    if not vDadosIni.PesqPros('CXL067','FECHAR', 'CARGA ' +
      CadPendReq.dataSet.FieldByName('COD_CARGA').AsString, 'CARGA',
      CadPendReq.dataSet.FieldByName('COD_CARGA').AsString, CadPendReq.Buscas, True) then
      Exit;

    if not CadPendReq._carga_fin_fechada then
      CadPendReq._carga_fin_fechar
    else
      Application.MessageBox('Carga já fechada', 'Atenção', 0 + 64);

    if CadPendReq._carga_fin_fechada then
      Label3.Caption := 'Carga Fechada N° ' + IntToStr(CadPendReq._carga_fin_getCarga)
    else
      Label3.Caption := 'Carga Aberta N° ' + IntToStr(CadPendReq._carga_fin_getCarga);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  CadPendReq._carga_fechada(0);
  CadPendReq.abrePendReq;
  Panel1.Visible := True;
  pnCarga.Visible := False;
end;

procedure TFrmPendBalcao.SpeedButton1Click(Sender: TObject);
var
  codcondpag, codcliente, codvendedoR: integer;
  vFp2: TComunicacaoFormaPagamento;
  obFp: TFormPag2;
  vZerarCarga: Boolean;
  existeProdutos, existeRetencaoProdutos, existeRetencaoServicos: boolean;
begin
  inherited;
  try
   if CadPendReq.ultdiaCXL then
     exit;
   if CadPendReq.IsEmpty then
     exit;
   if (CadPendReq.dataSet.FieldByName('cod_carga').AsInteger > 0) and (vDadosIni.vEmp.vUsarFechCargaCxl = 'S') then
      try
        vZerarCarga := CadPendReq._carga_fin_getCarga = 0;
        if not CadPendReq._carga_fechada(CadPendReq.dataSet.FieldByName('cod_carga').AsInteger) then
          Exit;
      finally
        if vZerarCarga then
          CadPendReq._carga_fechada(0);
      end;

   if vDadosIni.PesqPros('CXL029','INICIAR',CadPendReq.dataSet.fieldbyname('TIPO').AsString+' '+CadPendReq.dataSet.FieldByName('NPED').AsString,'PEDVENDA',CadPendReq.dataSet.FieldByName('NPED').AsString,CadPendReq.Buscas,True) then
//   if vDadosIni.PesqPros('CXL029', CadPendReq.dataSet.fieldbyname('TIPO').AsString+' '+CadPendReq.dataSet.FieldByName('NPED').AsString,CadPendReq.Buscas, True) then
   begin
    Screen.Cursor := crHourGlass;
    codcondpag := CadPendReq.dataSet.FieldByName('cod_cond_pag').AsInteger;
    codcliente := CadPendReq.dataSet.FieldByName('cod_cliente').AsInteger;
    codvendedor := CadPendReq.dataSet.FieldByName('cod_vendedor').AsInteger;
    if CadPendReq.recebendo then
    begin

      if CadPendReq.existeDevInternaPendenteNF then
        Exit;

      existeProdutos := vDadosIni.existeProdutoDoc(
        CadPendReq.buscas, CadPendReq.fint('nped'), CadPendReq.fstr('tipo')
      );

      existeRetencaoProdutos := CadPendReq.fdif('TIPO', 'ORC')
        and CadPendReq.fequals('nf_ac_calctrib', 'S')
        and existeProdutos
        and vDadosIni.RetencaoClienteNFe(
          CadPendReq.buscas,
          IfThen(CadPendReq.fint('cod_cli_fat') > 0, CadPendReq.fint('cod_cli_fat'), CadPendReq.fint('cod_cliente'))
        );

      existeRetencaoServicos := CadPendReq.fequals('TIPO', 'OS')
        and Container.GetInstance().ErpFeaturesFactory.CreateChecarPossivelRetencaoNFSeUseCase()
          .Executar(CadPendReq.fint('nped'));
      {
      vExisteServicoOS           := False;
      vRetencaoFedClienteNF      := False;
      vRetencaoFedClienteNFS     := False;
      vRetencaoFedTpServNFS      := False;
      vIssRetidoClienteNFS       := False;
      vIssRetidoTpServNFS        := False;

      vExisteProduto             := vDadosIni.existeProdutoDoc(
                                      CadPendReq.buscas,
                                      CadPendReq.fint('nped'),
                                      CadPendReq.fstr('tipo'));

      if (trim(CadPendReq.dataSet.FieldByName('tipo').AsString) <> 'ORC') then
      begin
      	if CadPendReq.fstr('nf_ac_calctrib') = 'N' then
          vRetencaoFedClienteNF  := False
        else
          vRetencaoFedClienteNF  := vDadosIni.RetencaoClienteNFe(
                                      CadPendReq.buscas,
                                      vDadosIni.IfThen(CadPendReq.fint('cod_cli_fat') > 0, CadPendReq.fint('cod_cli_fat'), CadPendReq.fint('cod_cliente')));
      end;

      if (trim(CadPendReq.dataSet.FieldByName('tipo').AsString) = 'OS') then
      begin
      	vExisteServicoOS         := vDadosIni.existeServicoDoc(
                                      CadPendReq.buscas,
                                      CadPendReq.fint('nped'),
                                      CadPendReq.fstr('tipo'));

        vIssRetidoClienteNFS     := vDadosIni.IssRetidoClienteNFSe(
                                      CadPendReq.buscas,
                                      CadPendReq.fint('cod_cliente'));

        vIssRetidoTpServNFS      := vDadosIni.IssRetidoTpServicoNFSe(
                                      CadPendReq.buscas,
                                      CadPendReq.fint('nped'),
                                      CadPendReq.fstr('tipo'));

        vRetencaoFedClienteNFS   := vDadosIni.RetencaoClienteNFSe(
                                      CadPendReq.buscas,
                                      CadPendReq.fint('cod_cliente'));

        vRetencaoFedTpServNFS    := vDadosIni.RetencaoTpServicoNFSe(
                                      CadPendReq.buscas,
                                      CadPendReq.fint('nped'),
                                      CadPendReq.fstr('tipo'));
      end;

      if ((vExisteProduto) and (vRetencaoFedClienteNF)) or ((vExisteServicoOS) and ((vRetencaoFedClienteNFS) or (vRetencaoFedTpServNFS))) then
        ShowAtencao('Possível retenção de tributos federais. Emita as notas fiscais antes do recebimento')
      else if (vExisteServicoOS) and ((vIssRetidoClienteNFS) or (vIssRetidoTpServNFS)) then
      	ShowAtencao('Possível ISS Retido. Emite a NFSe dos Serviços antes do recebimento');

      if (vExisteProduto) and (vRetencaoFedClienteNF) then
      	CadPendReq.emitirNotaDoPedido;

      if (vExisteServicoOS) and ((vRetencaoFedClienteNFS) or (vRetencaoFedTpServNFS) or (vIssRetidoClienteNFS) or (vIssRetidoTpServNFS)) then
        CadPendReq.verificaOSNFSe;
      }
      if existeRetencaoProdutos and existeRetencaoServicos then
        ShowAtencao('Possível retenção nas notas fiscais de Produtos e Serviços. Emita as notas antes do recebimento')
      else if existeRetencaoProdutos then
        ShowAtencao('Possível retenção na nota fiscal de Produtos. Emita as notas antes do recebimento')
      else if existeRetencaoServicos then
        ShowAtencao('Possível retenção na nota fiscal de Serviços. Emita as notas antes do recebimento');

      if existeRetencaoProdutos or existeRetencaoServicos then
      begin
        if existeProdutos then
          CadPendReq.emitirNotaDoPedido();

        CadPendReq.verificaOSNFSe;
      end;

      if CadPendReq.marcaRec(1) then
      begin
        //      if dtmFP.iniciaFormaPagamento(CadPendReq.dataSet.FieldByName('NREQ').AsInteger,
        vFp2 := TComunicacaoFormaPagamento.Create;
        if vFp2.iniciaFormaPagamento(CadPendReq.dataSet.FieldByName('nped').AsInteger,
        codcondpag,0,codcliente,codvendedor,CadPendReq.vtipdoc,
        CadPendReq.dataSet.FieldByName('VALOR_TOTAL').Value) then
        //dtmFP.iniciaFormaPagamento(CadPendReq.dataSet.FieldByName('nped').AsInteger,
//          codcondpag, 1, codcliente, codvendedor, 'REQ',
//          CadPendReq.dataSet.FieldByName('VALOR_TOTAL').Value) then
        begin
          // Fazer um teste se gravado, ok senão desfazer a operação....
          if CadPendReq.verificanentrada then
          begin
            CadPendReq.confirmarecebimento(CadPendReq.dataSet.FieldByName('VALOR_TOTAL').Value);
          end
          else
          begin
           obFp := TFormPag2.create;
           if obFp.cancelaVenda(CadPendReq.dataSet.FieldByName('NPED').AsInteger, CadPendReq.vtipdoc) then
            CadPendReq.marcaRec(2);
           obFp.Free;
          end;
        end
        else
          CadPendReq.marcaRec(2);
        vFp2.Free;
      end;
      CadPendReq.Refresh;
    end
    else
      messagedlg('Documento sendo recebido por outro usuário', mtinformation, [mbOK], 0);
   end;
  finally
    if pnCarga.Visible then
      if CadPendReq._carga_fin_fechada then
        Label3.Caption := 'Carga Fechada N° ' + IntToStr(CadPendReq._carga_fin_getCarga)
      else
        Label3.Caption := 'Carga Aberta N° ' + IntToStr(CadPendReq._carga_fin_getCarga);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendReq.ultdiaCXL then
      Exit;
    if not vDadosIni.PesqPros('CXL068','FECHAR', 'CARGA ' +
      CadPendReq.dataSet.FieldByName('COD_CARGA').AsString, 'CARGA',
      CadPendReq.dataSet.FieldByName('COD_CARGA').AsString, CadPendReq.Buscas, True) then
      Exit;

    if CadPendReq._carga_fin_fechada then
      CadPendReq._carga_fin_reabrir
    else
      Application.MessageBox('Carga ainda não fechada', 'Atenção', 0 + 64);

    if CadPendReq._carga_fin_fechada then
      Label3.Caption := 'Carga Fechada N° ' + IntToStr(CadPendReq._carga_fin_getCarga)
    else
      Label3.Caption := 'Carga Aberta N° ' + IntToStr(CadPendReq._carga_fin_getCarga);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendReq.ultdiaCXL then
      Exit;
    if not vDadosIni.PesqPros('CXL066','RELATORIO', 'CARGA ' +
      CadPendReq.dataSet.FieldByName('COD_CARGA').AsString, 'CARGA',
      CadPendReq.dataSet.FieldByName('COD_CARGA').AsString, CadPendReq.Buscas, True) then
      Exit;

    CadPendReq._carga_fin_relatorio;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendReq.ultdiaCXL then
      Exit;
    CadPendReq._carga_fin_concederDesconto;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  try
  if CadPendReq.ultdiaCXL then
     exit;
   if CadPendReq.IsEmpty then
     exit;
   if CadPendReq.dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0 then
   begin
   	 Application.MessageBox('Código do cliente não informado.', 'Informação', MB_OK + MB_DEFBUTTON1);
   	 exit;
   end;

    Screen.Cursor := crHourGlass;
    CadPendReq.cl_abreExtrato_form(CadPendReq.dataSet.FieldByName('COD_CLIENTE').AsInteger);
//    vCadCliente.verificaFiscalAtivo;
//    vCadCliente.cadPedVenda(true);
    SpeedButton5Click(Sender);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  try
    if CadPendReq.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL088','INICIAR','','','',CadPendReq.Buscas,True) then
    begin
      Screen.Cursor := crHourGlass;

      vDadosIni.abrirRecibo(1);
      SpeedButton5Click(Sender);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton2Click(Sender: TObject);
var
  vsmrec, vsmnrec: currency;
begin
  inherited;
  try
   if CadPendReq.ultdiaCXL then
     Exit;
   if vDadosIni.PesqPros('CXL030','SOMAR',CadPendReq.dataSet.fieldbyname('TIPO').AsString,'','',CadPendReq.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    vsmrec := 0.00;
    vsmnrec := 0.00;
    CadPendReq.first;
    while not CadPendReq.Eof do
    begin
      if CadPendReq.dataSet.FieldByName('VL_PAGO_CXL').IsNull or
        (CadPendReq.dataSet.FieldByName('VL_PAGO_CXL').value = 0) then
        vsmnrec := vsmnrec + CadPendReq.dataSet.FieldByName('VALOR_TOTAL').value
      else
        vsmrec := vsmrec + CadPendReq.dataSet.FieldByName('VL_PAGO_CXL').value;
      CadPendReq.next;
    end;
    messagedlg('Valores Recebidos....: ' + format('%n', [vsmrec]) + #13 +
      'Valores Não Recebidos: ' + format('%n', [vsmnrec]), mtinformation, [mbOK], 0);
    CadPendReq.First;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton3Click(Sender: TObject);
var
  obFp2: TFormPag2;
begin
  inherited;
  try
   if CadPendReq.ultdiaCXL then
     Exit;
   if vDadosIni.PesqPros('CXL031','DETALHAR',CadPendReq.dataSet.fieldbyname('TIPO').AsString+' '+
   CadPendReq.dataSet.FieldByName('NPED').AsString,'FORMPAGAMENTO',CadPendReq.dataSet.FieldByName('NPED').AsString,CadPendReq.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    obFp2 := TFormPag2.create;
    obFp2.detalhamentoVenda(CadPendReq.dataSet.FieldByName('NPED').AsInteger,'',CadPendReq.vtipdoc);
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton4Click(Sender: TObject);
var
  lconsultaPendReq: TConsultaPendreq;
begin
  inherited;
  try
   if CadPendReq.ultdiaCXL then
     Exit;
   if vDadosIni.PesqPros('CXL032','PESQUISAR',CadPendReq.dataSet.fieldbyname('TIPO').AsString,'','',CadPendReq.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    lconsultaPendReq := TConsultaPendreq.Create;
    Application.CreateForm(TFrmPesqCxl, FrmPesqCxl);
    FrmPesqCxl.Caption := 'Consulta de Requisições/O.Ss...';
    FrmPesqCxl.Consulta := lconsultaPendReq;
    FrmPesqCxl.Consulta.CdsPesq := CadPendReq.dataSet;
    FrmPesqCxl.showmodal;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    if CadPendReq.ultdiaCXL then
     Exit;
    Screen.Cursor := crHourGlass;
    CadPendReq.Refresh;

    if CadPendReq._carga_fin_fechada then
      Label3.Caption := 'Carga Fechada N° ' + IntToStr(CadPendReq._carga_fin_getCarga)
    else
      Label3.Caption := 'Carga Aberta N° ' + IntToStr(CadPendReq._carga_fin_getCarga);
      
  finally    
    if pnCarga.Visible then
      if CadPendReq._carga_fin_fechada then
        Label3.Caption := 'Carga Fechada N° ' + IntToStr(CadPendReq._carga_fin_getCarga)
      else
        Label3.Caption := 'Carga Aberta N° ' + IntToStr(CadPendReq._carga_fin_getCarga);
    Screen.Cursor := crDefault;
  end;
  //  CadPendReq.open;
end;

procedure TFrmPendBalcao.SpeedButton6Click(Sender: TObject);
var
  obFp: TFormPag2;
begin
  inherited;
  try
   if CadPendReq.ultdiaCXL then
     Exit;

    if vDadosIni.vEmp.vUsarFechCargaCxl = 'S' then
      if Trim(CadPendReq.dataSet.FieldByName('tipo').AsString) = 'REQ' then
        if CadPendReq.dataSet.FieldByName('cod_carga').AsInteger > 0 then
          if CadPendReq._carga_fin_fechada(CadPendReq.dataSet.FieldByName('cod_carga').AsInteger) then
          begin
            Application.MessageBox('Carga já fechada', 'Atenção', 0 + 64);
            exit;
          end;

   if vDadosIni.PesqPros('CXL033','CANCELAR',CadPendReq.dataSet.fieldbyname('TIPO').AsString+' '+CadPendReq.dataSet.FieldByName('NPED').AsString,'FORMPAGAMENTO',CadPendReq.dataSet.FieldByName('NPED').AsString,CadPendReq.Buscas,True) then
//   if vDadosIni.PesqPros('CXL033', CadPendReq.dataSet.fieldbyname('TIPO').AsString+' '+CadPendReq.dataSet.FieldByName('NPED').AsString,CadPendReq.Buscas, True) then
   begin
    Screen.Cursor := crHourGlass;
    obFp := TFormPag2.create;
    if Application.MessageBox('Deseja realmente Cancelar recebimento desta venda?', 'Confirmação',
      MB_YESNO + MB_DEFBUTTON2) = mrYES then
    begin
      if vDadosIni.vEmp.vUsarFechCargaCxl = 'S' then
        if Trim(CadPendReq.dataSet.FieldByName('tipo').AsString) = 'REQ' then
          if CadPendReq.dataSet.FieldByName('cod_carga').AsInteger > 0 then
            if CadPendReq._carga_fin_fechada(CadPendReq.dataSet.FieldByName('cod_carga').AsInteger) then
            begin
              Application.MessageBox('Carga já fechada', 'Atenção', 0 + 64);
              exit;
            end;
      //    if obFp.cancelaVenda(CadPendReq.dataSet.FieldByName('NREQ').AsInteger,'REQ') then
      if obFp.cancelaVenda(CadPendReq.dataSet.FieldByName('NPED').AsInteger, CadPendReq.vtipdoc) then
      begin
        CadPendReq.marcaRec(2);
      end;
    end;
   end;
  finally  
    if pnCarga.Visible then
      if CadPendReq._carga_fin_fechada then
        Label3.Caption := 'Carga Fechada N° ' + IntToStr(CadPendReq._carga_fin_getCarga)
      else
        Label3.Caption := 'Carga Aberta N° ' + IntToStr(CadPendReq._carga_fin_getCarga);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton7Click(Sender: TObject);
var
  vNf : TNFCab;
begin
  inherited;
  try
   if CadPendReq.ultdiaCXL then
     Exit;

   if vDadosIni.PesqPros('CXL046','INICIAR',
   	 CadPendReq.dataSet.fieldbyname('TIPO').AsString + ' ' + CadPendReq.dataSet.FieldByName('NPED').AsString,
     'PEDVENDA',
     CadPendReq.dataSet.FieldByName('NPED').AsString,
     CadPendReq.Buscas,
     True) then
   begin
    Screen.Cursor := crHourGlass;
    vNf := TNFCab.create;
    vNf.cadNF(1);
    vNf.Free;
    SpeedButton5Click(Sender);
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendBalcao.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmPendBalcao.SpeedButton9Click(Sender: TObject);
var
//  vVenda : TPedVenda;
  ATerminaFiscalTemp: string;
begin
  inherited;
//  vDadosIni.abreCadPedVenda(true);
  try
    ATerminaFiscalTemp := vDadosIni.vFiscalAtivo;
   if CadPendReq.ultdiaCXL then
     Exit;
   if vDadosIni.PesqPros('CXL061','INICIAR','','','',CadPendReq.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    if vDadosIni.vformosreq = 'REQ' then
	    vDadosIni.vtpVenda := 'REQ'
    else
  	  vDadosIni.vtpVenda := 'OS';

    CadPendReq.abrirPedVenda;
//    vVenda := TPedVenda.create(vDadosIni.vtpVenda);
//    vVenda.verificaFiscalAtivo;
//    vVenda.cadPedVenda(true);
//    vVenda.Free;
    SpeedButton5Click(Sender);
   end;
  finally
    vDadosIni.vFiscalAtivo := ATerminaFiscalTemp;
    Screen.Cursor := crDefault;
  end;
end;

end.

