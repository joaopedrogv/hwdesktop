unit UPendVeiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, Grids, DBGrids, UClassesPend, StdCtrls,
  Menus, DBClient, IBDatabase;

type
  TFrmPendVeic = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Panel10: TPanel;
    imgInformation: TImage;
    SpeedButton10: TSpeedButton;
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
    SpeedButton24: TSpeedButton;
    Label4: TLabel;
    Panel2: TPanel;
    SpeedButton25: TSpeedButton;
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    HrFormpag, hrpesquisa: THandle;
    vdif: integer;
  public
    { Public declarations }
  end;

var
  FrmPendVeic: TFrmPendVeic;
  CadPendVeic: TPendVeic;

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

uses
  funcoes, uDtmFormPag, uClasseFP, ConsultasUCXL, UPesqCXL, UDtmBalcao,
  UVendaVeiculo, uClassesNotasFiscais, uDtmAtivo, Clipbrd;

{$R *.dfm}

procedure TFrmPendVeic.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, DBGrid1, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TFrmPendVeic.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TFrmPendVeic.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TFrmPendVeic.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  SpeedButton1Click(Sender);
end;

procedure TFrmPendVeic.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TDBGrid(sender).canvas.Font.color := clWindowText;
  if not (gdFocused in State) then
    if (Trim(CadPendVeic.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R')
      and (Trim(CadPendVeic.dataSet.FieldByName('DIFCX').AsString) = 'S') then
    begin
      TDBGrid(sender).Canvas.Brush.Color := TColor($009595FF);
      TDBGrid(sender).Canvas.FillRect(Rect); // pinta a célula
    end
    else if (Trim(CadPendVeic.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R') then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
      TDBGrid(sender).Canvas.FillRect(Rect); // pinta a célula
    end;
  TDBGrid(sender).DefaultDrawDataCell(Rect,Column.Field, state); // pinta o texto padrão
{  if vdif = 1 then
  begin
   DBGrid1.Canvas.Brush.Color := clRed; // define uma cor de fundo //$00FFD9B3
   DBGrid1.Canvas.FillRect(Rect); // pinta a célula
   DBGrid1.DefaultDrawDataCell(Rect,Column.Field, state); // pinta o texto padrão
  end;}
end;

procedure TFrmPendVeic.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1Click(Sender);
  if key = VK_F11 then
  begin
    CadPendVeic.First;
    while not CadPendVeic.Eof do
    begin
      if CadPendVeic.dataSet.FieldByName('STATUS_CXL_RQ').AsString = 'R' then
      begin
         if CadPendVeic.verificardiferenca then
         begin
					 CadPendVeic.dataset.Edit;
           CadPendVeic.dataset.FieldByName('DIFCX').AsString := 'S';
        	 CadPendVeic.dataset.Post;
         end
         else
         begin
           CadPendVeic.dataset.Edit;
           CadPendVeic.dataset.FieldByName('DIFCX').AsString := 'N';
        	 CadPendVeic.dataset.Post;
         end;
      end
      else
      begin
         CadPendVeic.dataset.Edit;
         CadPendVeic.dataset.FieldByName('DIFCX').AsString := 'N';
         CadPendVeic.dataset.Post;
      end;
      CadPendVeic.Next;
      if CadPendVeic.Eof then
       vdif:=0;
    end;
  end;

end;

procedure TFrmPendVeic.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid1,Column);
end;

procedure TFrmPendVeic.FormClose(Sender: TObject; var Action: TCloseAction);
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
//  UnloadPackage(HrFormpag);
//  UnloadPackage(hrPesquisa);
  action := caFree;
  FrmPendVeic := nil;
  CadPendVeic.free;
end;

procedure TFrmPendVeic.FormCreate(Sender: TObject);
begin
  inherited;
  CadPendVeic := TPendVeic.create;
  TemColunasComPosicaoAlteradas := False;
//  CadPendReq.Open;
//  CarregaPacote('pkFormPag', HrFormpag);
//  CarregaPacote('pkativos',hrpesquisa);
//  if dtmFP = nil then
//  begin
//    dtmFP := TdtmFP.Create(Self);
//    dtmFP.criaDtm;
//  end;
end;

procedure TFrmPendVeic.FormKeyDown(Sender: TObject; var Key: Word;
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
      SpeedButton4Click(SpeedButton4)
    else if key = VK_F5 then
      SpeedButton5Click(SpeedButton5)
    else if key = VK_F6 then
      SpeedButton6Click(SpeedButton6)
    else if key = VK_F7 then
      SpeedButton7Click(SpeedButton7)
    else if key = VK_F8 then
	    SpeedButton10Click(SpeedButton10)
    else if key = VK_F9 then
    	SpeedButton25Click(SpeedButton25)
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendVeic.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TFrmPendVeic.FormShow(Sender: TObject);
begin
//  DBGrid1.DataSource := DtmBalcao.DtPendVeic;
  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet, GridCfg, DBGrid1, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
      ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);

 inherited;
 CadPendVeic.abrePendVeic;
 SpeedButton10.Visible := (vDadosIni.vEmp.vVersaoVeiculos = '4');
 SpeedButton24.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
 vDadosIni.vInibeMensPesqPros := 'S';
 CadPendVeic.vTestarDtFechcomDtCaixa := vDadosIni.PesqPros('CXL078','TESTAR','','COM_FAT', '', CadPendVeic.Buscas, True);
 imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
   'Click no nome da coluna para Ordernar'+ #13 +
   'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 + #13+
   'Processo "CXL079" PERMITIR RECEBER DOCUMENTOS COM DATA FECHAMENTO DIFERENTE DA DATA DO CXL' + #13 +
   'Processo "CXL085" PERMITIR REEBER DOCUMENTOS VALOR MENOR CXL';

 if PrimeiraPesquisa then
 begin
   PrimeiraPesquisa := False;
   vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
 end;

 vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmPendVeic.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TFrmPendVeic.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

procedure TFrmPendVeic.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmPendVeic.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmPendVeic.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmPendVeic.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('CXL074','INICIAR','','COM_FAT','',CadPendVeic.Buscas,True) then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPendVeic.AbrirComFat;
      SpeedButton5Click(Sender);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmPendVeic.SpeedButton1Click(Sender: TObject);
var
//  obFp: TFormPag;
  codcondpag, codcliente, codvendedor, codOp, codUsu: integer;
  nomeUs: string;
//  hndl: THandle;
  vFp2: TComunicacaoFormaPagamento;
  vNf: TNfCab;
  vncomando: integer;
begin
  inherited;
  if CadPendVeic.ultdiaCXL then
   exit;
  if CadPendVeic.IsEmpty then
   exit; 
  if vDadosIni.PesqPros('CXL024','INCLUIR',CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,
    'COM_FAT',CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,CadPendVeic.Buscas,True) then
  begin
    codcondpag := CadPendVeic.dataSet.FieldByName('condpag_v').AsInteger;
    codcliente := CadPendVeic.dataSet.FieldByName('clientes_v').AsInteger;
    codvendedor := CadPendVeic.dataSet.FieldByName('covend_v').AsInteger;
    codOp := 1;
    codUsu := 1;
    nomeUs := 'HERBERT';
  //if hndl1 = 0 then

  //  vDadosIniFP.iniciaPacote(Edit1.Text, Edit2.Text, nomeUs, 'S', Edit3.Text, 10, codUsu,codOp, 100,   DateTimePicker1.date, CheckBox1.Checked);
  //end;
  //  FrmVendaMoto.ComboBox1.Style:=csOwnerDrawFixed;
   if CadPendVeic.recebendo then
   begin
    if CadPendVeic.marcaRec(1) then
    begin
      vFp2 := TComunicacaoFormaPagamento.Create;
      vncomando:=CadPendVeic.dataSet.FieldByName('N_COMANDO').AsInteger;
      if vFp2.iniciaFormaPagamento(CadPendVeic.dataSet.FieldByName('N_COMANDO').AsInteger,
      codcondpag, 1, codcliente, codvendedor, 'MOT', CadPendVeic.dataSet.FieldByName('VALOR_A_REC').Value) then
      begin
        // Fazer um teste se gravado, ok senão desfazer a operação....
        CadPendVeic.confirmarecebimento(CadPendVeic.dataSet.FieldByName('VALOR_A_REC').Value);
        CadPendVeic.DadosComando(vncomando, 1);

        if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
        begin
         if CadPendVeic.abrirComFat(vncomando) then
         begin
           if CadPendVeic.verificaEnvioNFVeicCCIA then
           begin
             try
                vDadosIni.abreStatusProcessamento('', 'Iniciando Nota Fiscal');
                vNf := TNFCab.create;
                vNf.cadNfpeloComandoAbreTela(vncomando,'CXL');
                vNf.Free;
              finally
                vDadosIni.fechaStatusProcessamento;
              end;
              CadPendVeic.close;
              CadPendVeic.open;
              CadPendVeic.dataSet.Locate('N_COMANDO',vncomando,[]);
           end
           else
           begin
              CadPendVeic.BaixarVeicIntermed;
           end;
         end;
        end
        else
        begin
          Application.CreateForm(TFrmVendaMoto, FrmVendaMoto);
          FrmVendaMoto.ComboBox1.Text:=CadPendVeic.vcliente;
          FrmVendaMoto.ComboBox2.text:=CadPendVeic.vvendedor;
          FrmVendaMoto.ComboBox3.Text:=CadPendVeic.vcondpag;
          FrmVendaMoto.ComboBox4.Text:=CadPendVeic.vnatop;
          if FrmVendaMoto.ShowModal = mrOk then
          begin
            if CadPendVeic.verificaEnvioNFVeic then
            begin
             // chamar aqui a NF 4.0
              vncomando:=CadPendVeic.dataSet.FieldByName('N_COMANDO').AsInteger;
              vNf := TNFCab.create;
              vNf.cadNfpeloComandoAbreTela(CadPendVeic.dataSet.FieldByName('N_COMANDO').AsInteger,'CXL');
              vNf.Free;
              CadPendVeic.close;
              CadPendVeic.open;
              CadPendVeic.dataSet.Locate('N_COMANDO',vncomando,[]);
            end
            else
            begin
             CadPendVeic.BaixarVeicIntermed;
            end;
    //          end;
          end;
        end;
      end
      else
       CadPendVeic.marcaRec(2);
      vFp2.Free;
    end;
   end
   else
    messagedlg('Documento sendo recebido por outro usuário', mtinformation, [mbOK], 0);
   CadPendVeic.Refresh;
  end;
end;

procedure TFrmPendVeic.SpeedButton24Click(Sender: TObject);
begin
  try
  if CadPendVeic.ultdiaCXL then
     exit;
   if CadPendVeic.IsEmpty then
     exit;
   if CadPendVeic.dataSet.FieldByName('CLIENTES_V').AsInteger <= 0 then
   begin
   	 Application.MessageBox('Código do cliente não informado.', 'Informação', MB_OK + MB_DEFBUTTON1);
   	 exit;
   end;

    Screen.Cursor := crHourGlass;
    CadPendVeic.cl_abreExtrato_form(CadPendVeic.dataSet.FieldByName('CLIENTES_V').AsInteger);
//    vCadCliente.verificaFiscalAtivo;
//    vCadCliente.cadPedVenda(true);
    SpeedButton5Click(Sender);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendVeic.SpeedButton25Click(Sender: TObject);
begin
  inherited;
	try
    if CadPendVeic.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL088','INICIAR','','','',CadPendVeic.Buscas,True) then
    begin
      Screen.Cursor := crHourGlass;

      vDadosIni.abrirRecibo(1);
      SpeedButton5Click(Sender);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendVeic.SpeedButton2Click(Sender: TObject);
var
  vsmrec, vsmnrec: currency;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendVeic.ultdiaCXL then
      exit;
    if vDadosIni.PesqPros('CXL025','SOMAR','','COM_FAT','',CadPendVeic.Buscas,True) then
    begin
      vsmrec := 0.00;
      vsmnrec := 0.00;
      CadPendVeic.first;
      while not CadPendVeic.Eof do
      begin
        if CadPendVeic.dataSet.FieldByName('VL_RQ_PG_CXL').IsNull or
          (CadPendVeic.dataSet.FieldByName('VL_RQ_PG_CXL').value = 0) then
          vsmnrec := vsmnrec + CadPendVeic.dataSet.FieldByName('VALOR_A_REC').ascurrency
        else
          vsmrec := vsmrec + CadPendVeic.dataSet.FieldByName('VL_RQ_PG_CXL').ascurrency;
        CadPendVeic.next;
      end;
      messagedlg('Valores Recebidos....: ' + format('%n', [vsmrec]) + #13 +
        'Valores Não Recebidos: ' + format('%n', [vsmnrec]), mtinformation, [mbOK], 0);
      CadPendVeic.First;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendVeic.SpeedButton3Click(Sender: TObject);
var
  obFp2: TFormPag2;
begin
  inherited;
  if CadPendVeic.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL026','VERIFICAR',CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,'COM_FAT',CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,CadPendVeic.Buscas,True) then
  begin
   obFp2 := TFormPag2.create;
   obFp2.detalhamentoVenda(CadPendVeic.dataSet.FieldByName('N_COMANDO').AsInteger,'','MOT');
  end;
end;

procedure TFrmPendVeic.SpeedButton4Click(Sender: TObject);
var
  lconsultaPendReq: TConsultaPendVeic;
begin
  inherited;
  if CadPendVeic.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL027','PESQUISAR',CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,
  'COM_FAT',CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,CadPendVeic.Buscas,True) then
  begin
   lconsultaPendReq := TConsultaPendVeic.Create;
   Application.CreateForm(TFrmPesqCxl, FrmPesqCxl);
   FrmPesqCxl.Caption := 'Consulta de Veículos...';
   FrmPesqCxl.Consulta := lconsultaPendReq;
   FrmPesqCxl.Consulta.CdsPesq := CadPendVeic.dataSet;
   FrmPesqCxl.showmodal;
  end;
end;

procedure TFrmPendVeic.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendVeic.ultdiaCXL then
      exit;
    CadPendVeic.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendVeic.SpeedButton6Click(Sender: TObject);
var
  obFp: TFormPag2;
begin
  inherited;
  if CadPendVeic.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL028','CANCELAR',CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,'COM_FAT',
  CadPendVeic.dataSet.FieldByName('N_COMANDO').AsString,CadPendVeic.Buscas,True) then
  begin
    obFp := TFormPag2.create;
    if Application.MessageBox('Deseja realmente Cancelar recebimento desta venda?', 'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES then
    begin
      if obFp.cancelaVenda(CadPendVeic.dataSet.FieldByName('N_COMANDO').AsInteger, 'MOT') then
      begin
        CadPendVeic.marcaRec(2);
      end;
    end;
  end;
end;

procedure TFrmPendVeic.SpeedButton7Click(Sender: TObject);
var
  vNf : TNFCab;
begin
  inherited;
  if CadPendVeic.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL046','INICIAR','','COM_FAT','',CadPendVeic.Buscas,True) then
  begin
    try
      Screen.Cursor := crHourGlass;
      vNf := TNFCab.create;
      vNf.cadNF(1);
      vNf.Free;
      SpeedButton5Click(Sender);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmPendVeic.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

