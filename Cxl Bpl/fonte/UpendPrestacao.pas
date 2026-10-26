unit UpendPrestacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, Buttons, ExtCtrls, UClassesPrestacao,
  StdCtrls, Menus, DBClient, IBDatabase, uEditHw, ComCtrls;

type
  TFrmPendPrestacao = class(TfrmPadrao)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton8: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Panel2: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Panel10: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    imgInformation: TImage;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton24: TSpeedButton;
    Label4: TLabel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pn_recibo: TPanel;
    pn_recibo_impressora: TPanel;
    lbx_impressora: TListBox;
    Panel5: TPanel;
    pn_recibo_lote: TPanel;
    lbx_lote: TListBox;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnDesconto: TPanel;
    Label59: TLabel;
    Label62: TLabel;
    pnValorDaOperacao: TPanel;
    Panel45: TPanel;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    edDescPerc: TEditHw;
    edDescValor: TEditHw;
    RadioGroupDescontoAcrescimo: TRadioGroup;
    pnQuitarOpcao: TPanel;
    Panel51: TPanel;
    btQuitarOpcaoOK: TBitBtn;
    btQuitarOpcaoCancelar: TBitBtn;
    pnUsarValorCorrigido: TPanel;
    CheckBox4: TCheckBox;
    imgInformation1: TImage;
    SpeedButton25: TSpeedButton;
    procedure SpeedButton25Click(Sender: TObject);
    procedure pnQuitarOpcaoEnter(Sender: TObject);
    procedure btQuitarOpcaoCancelarClick(Sender: TObject);
    procedure btQuitarOpcaoOKClick(Sender: TObject);
    procedure lbx_impressoraDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton24Click(Sender: TObject);
    procedure edDescValorExit(Sender: TObject);
    procedure edDescPercExit(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure RadioGroupDescontoAcrescimoClick(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton15Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure HabilitaBotoes(vTipo: integer);
  private
    { Private declarations }
    vdif: integer;
    procedure recibo_prestacao_lote_chose(Sender: TObject);
    procedure recibo_prestacao_print_chose(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmPendPrestacao: TFrmPendPrestacao;
  CadPendPrest: TpendPrest;
  vDtDia: TDate;

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

uses uClasseFP, uDtmFormPag, Funcoes, UDtmPrestacao, DB, uDataSet_OOP, UPesPros, ConsultasUCXL,
UPesqCXL, UBaixaParcial, UDescPrestacao, uDtmAtivo, uDadosIni, DateUtils, Math, Clipbrd;
{$R *.dfm}

procedure TFrmPendPrestacao.BitBtn36Click(Sender: TObject);
begin
  inherited;
  CadPendPrest.DescontoPercentual := edDescPerc.AsValue;
  CadPendPrest.DescontoValor := edDescValor.AsValue;
  CadPendPrest.DescontoAcrescimo := vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'D', 'A');
  TForm(pnDesconto.Parent).ModalResult := IDOK;
end;

procedure TFrmPendPrestacao.BitBtn37Click(Sender: TObject);
begin
  inherited;
  TForm(pnDesconto.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmPendPrestacao.btQuitarOpcaoCancelarClick(Sender: TObject);
begin
  TForm(pnQuitarOpcao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmPendPrestacao.btQuitarOpcaoOKClick(Sender: TObject);
begin
  TForm(pnQuitarOpcao.Parent).ModalResult := IDOK;
end;

procedure TFrmPendPrestacao.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, DBGrid1, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TFrmPendPrestacao.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TFrmPendPrestacao.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SELEC' then
		CadPendPrest.selecPrestacao(true);
end;

procedure TFrmPendPrestacao.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TFrmPendPrestacao.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
	CadPendPrest.selecPrestacao(true);
end;

procedure TFrmPendPrestacao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  TDBGrid(sender).canvas.Font.color := clWindowText;
  if not (gdFocused in State) then
    if Trim(CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').AsString) = 'R' then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect,Column.Field, state);
    end;

  if (Column.Field.Dataset.FieldbyName('STATUS_CXL_RQ').AsString = 'R') and (CadPendPrest.dataSet.FieldByName('DIF').AsString='S')  then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if ((Column.FieldName = 'DATA_VENC_C') and
    ((Column.Field.dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia) and
    (Column.Field.dataSet.FieldByName('STATUS_CXL_RQ').AsString <> 'R')) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SELEC' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmPendPrestacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 vdias: Extended;
begin
  inherited;
  if key = VK_RETURN then
  begin
    //    if (CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').IsNull) or (CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').value = '') then
    SpeedButton1Click(Sender);
  end;

  if key = vk_f12 then
  begin
    vdias:=date-CadPendPrest.dataSet.FieldByName('DATA_VENC_C').AsDateTime;
    messagedlg('Dias de Atraso: ' + format('%n', [vdias]), mtinformation, [mbOK], 0);
  end;
end;

procedure TFrmPendPrestacao.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGrid1,Column);
end;

procedure TFrmPendPrestacao.edDescPercExit(Sender: TObject);
begin
  inherited;
  if edDescPerc.AsValue > 0 then
  begin
    edDescValor.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
      pnValorDaOperacao.Caption := Format('%0.2n', [CadPendPrest.ValorOperacao -
        (CadPendPrest.ValorOperacao * edDescPerc.AsValue / 100)])
    else
      pnValorDaOperacao.Caption := Format('%0.2n', [CadPendPrest.ValorOperacao +
        (CadPendPrest.ValorOperacao * edDescPerc.AsValue / 100)]);
  end
  else if (edDescPerc.AsValue <= 0) and (edDescValor.AsValue <= 0) then
    pnValorDaOperacao.Caption := Format('%0.2n', [CadPendPrest.ValorOperacao]);
end;

procedure TFrmPendPrestacao.edDescValorExit(Sender: TObject);
begin
  inherited;
  if edDescValor.AsValue > 0 then
  begin
    edDescPerc.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
    	pnValorDaOperacao.Caption := Format('%0.2n', [(CadPendPrest.ValorOperacao - edDescValor.AsValue)])
    else
	    pnValorDaOperacao.Caption := Format('%0.2n', [(CadPendPrest.ValorOperacao + edDescValor.AsValue)]);
  end
  else if (edDescPerc.AsValue <= 0) and (edDescValor.AsValue <= 0) then
    pnValorDaOperacao.Caption := Format('%0.2n', [CadPendPrest.ValorOperacao]);
end;

procedure TFrmPendPrestacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
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
  
  CadPendPrest.Close;
  CadPendPrest.Free;
  CadPendPrest := nil;
  Action := caFree;
  FrmPendPrestacao := nil;
end;

procedure TFrmPendPrestacao.FormCreate(Sender: TObject);
begin
  inherited;
  CadPendPrest := TPendPrest.create;
//  CadPendPrest.dataSet.Open;
  CadPendPrest.statusbotoes := true;
//  dtmFP := TDtmFP.create(dtmFP);
//  obFormPag := TFormPag.create;
  vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True);
  CadPendPrest.verificaFiscalAtivo;
  TemColunasComPosicaoAlteradas := False;
end;

procedure TFrmPendPrestacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vShiftClick := Key = VK_SHIFT;
    if key = VK_F4 then
    begin
      SpeedButton4Click(Sender);
    end;
    if key = VK_F2 then
    begin
      SpeedButton2Click(Sender);
    end;
    if key = VK_F3 then
    begin
      SpeedButton3Click(Sender);
    end;
    if key = VK_F5 then
      SpeedButton5Click(Sender);
    if key = VK_SPACE then
      DBGrid1DblClick(Sender);
    if key = VK_F6 then
      SpeedButton6Click(Sender);
    if key = VK_F7 then
      SpeedButton7Click(Sender);
    if key = VK_F8 then
      SpeedButton16Click(Sender);
    if key = VK_F9 then
      SpeedButton9Click(Sender);
    if key = VK_F10 then
      SpeedButton25Click(Sender);
    if key = VK_F11 then
      SpeedButton11Click(Sender);
    if key = vk_f12 then
    begin
      if Classes.ssAlt in Shift then
        SpeedButton15.Click;
//      else
//        SpeedButton12.Click;
      //    Application.MessageBox('Dias de Atraso: ' + str, 'Informação', MB_OK + MB_DEFBUTTON1);
//      messagedlg(Format('%n', [date - CadPendPrest.dataSet.FieldByName('DATA_VENC_C').AsDateTime]) +
//        ' Dia(s) de Atraso.', mtinformation, [mbOK], 0);
    end;
    if key = 66 then
      SpeedButton13Click(Sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TFrmPendPrestacao.FormShow(Sender: TObject);
begin
//  DBGrid1.DataSource := DtmPrestacao.DtPendPrestacao;
  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet, GridCfg, DBGrid1, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
      ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);

 inherited;
 pnQuitarOpcao.Visible := false;
 CadPendPrest.abrePendPrestacao;
 CadPendPrest.PegaInfEmpresa;
 pnDesconto.Visible := false;
 SpeedButton24.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
 
 vDtDia := vDadosIni.getDataBanco(CadPendPrest.buscas);
 imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
	 'Click no nome da coluna para Ordernar'+ #13 +
	 'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 +
	 'Processo "CXL075" RECEBER PREST COM OUTRAS MAIS ANTIGAS EM ABERTO' + #13 +
	 'Processo "CXL082" PERMITIR DESCONTO NO FINANCEIRO SEM DEFINICAO DA EMPRESA' + #13 +
   'Processo "CXL085" PERMITIR REEBER DOCUMENTOS VALOR MENOR CXL' + #13 +
   'Processo "CXL087" HABILITAR RECEBIMENTO COM JUROS E SEM JUROS DAS PRESTAÇÃO CXL';

 imgInformation1.Hint := 'Informações Adicionais' + #13 + #13 +
	 'Click no nome da coluna para Ordernar'+ #13 +
	 'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 +
   'Processo "CXL087" HABILITAR RECEBIMENTO COM JUROS E SEM JUROS DAS PRESTAÇÃO CXL';
 if PrimeiraPesquisa then
 begin
   PrimeiraPesquisa := False;
   vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
 end;
end;

procedure TFrmPendPrestacao.SpeedButton1Click(Sender: TObject);
var
  //  obFormPag: TFormPag;
  codcondpag, codcliente, codvendedor, flagPrestacao, codCliOld, codVendOld,codcontroleold: integer;
  valortotal: currency;
  vFp2: TComunicacaoFormaPagamento;
  vGerouLote:boolean;
  vPrestacoesMarcadas: string;
  ADataVenda: TDate;
  AUsarDataBaseVND: Boolean;
begin
  if not SpeedButton1.Enabled then
   Exit;
  inherited;
  CadPendPrest.OnChosePrintLote := recibo_prestacao_lote_chose;
  try
    if CadPendPrest.ultdiaCXL then
      Exit;
    if CadPendPrest.IsEmpty then
      exit;
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('CXL001','INICIAR','','CONTROLE_CREDITOS','',CadPendPrest.Buscas,True) then
    begin
      CadPendPrest.dataSet.Filter := 'SELEC = ''S'' ';
      CadPendPrest.dataSet.Filtered := true;
      if CadPendPrest.IsEmpty then
      begin
        Application.MessageBox('Nenhuma prestação selecionada.', 'Informação', MB_OK +MB_DEFBUTTON1);
        exit;
      end;
      CadPendPrest.vCancela := false;
      HabilitaBotoes(0);
      codcondpag := 1;
      codcliente := CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger;
      codvendedor := CadPendPrest.dataSet.FieldByName('CODIGO_VEND').AsInteger;
      codCliOld := 0;
      codVendOld := 0;
      codcontroleold:=0;
      flagPrestacao := 1;
      valortotal := 0;
      vGerouLote:=false;
//      if Application.MessageBox('Confirmar o Recebimento da(s) Parcela(s) Selecionada(s)?',
//        'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
    	vDadosIni.vInibeMensPesqPros := 'S';
		  CheckBox4.Enabled := vDadosIni.PesqPros('CXL087', 'HABILITAR', '', 'CONTROLE_CREDITOS', '', CadPendPrest.buscas, False);
      
    	if not CheckBox4.Enabled then
      	CheckBox4.Checked := true
      else
	    	CheckBox4.Checked := _LerConfiguracoesRegistroBoolean(CheckBox4.Name, True);
      if not vDadosIni.abreForm('Confirmar o Recebimento da(s) Parcela(s) Selecionada(s)?',
      	pnQuitarOpcao, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      begin
      	exit
      end
      else
      begin
      	_GravaConfiguracoesBoolean(CheckBox4.Name, CheckBox4.Checked);
        vPrestacoesMarcadas := '';
        CadPendPrest.dataSet.First;
        while not CadPendPrest.dataSet.Eof do
        begin
          Application.ProcessMessages;
          if CadPendPrest.dataSet.FieldByName('SELEC').AsString = 'S' then
          begin
            if flagPrestacao = 1 then
            begin
              codCliOld := CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger;
              codVendOld := CadPendPrest.dataSet.FieldByName('CODIGO_VEND').AsInteger;
              codcontroleold:=CadPendPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
              flagPrestacao := flagPrestacao + 1;
            end;
             if (codCliOld = CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger)
              	and (codcontroleold = CadPendPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger) then
             begin
               if not CadPendPrest.recebendo then
                 vPrestacoesMarcadas := vPrestacoesMarcadas + '|' + IntToStr(CadPendPrest.dataSet.FieldByName('cod_cred').AsInteger) + '|';
             end;
          end;
          CadPendPrest.dataSet.Next;
        end;

        ADataVenda := 0;
        AUsarDataBaseVND := vDadosIni.getConfSisBool('form_pag_prest_data_base_vnd', CadPendPrest.buscas);
        flagPrestacao := 1;
        CadPendPrest.dataSet.First;
        while not CadPendPrest.dataSet.Eof do
        begin
          Application.ProcessMessages;
          if CadPendPrest.dataSet.FieldByName('SELEC').AsString = 'S' then
          begin
            if flagPrestacao = 1 then
            begin
              codCliOld := CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger;
              codVendOld := CadPendPrest.dataSet.FieldByName('CODIGO_VEND').AsInteger;
              codcontroleold:=CadPendPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
              flagPrestacao := flagPrestacao + 1;
            end;

            if ((CadPendPrest.ChecaMesmoCli(codCliOld,
              CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger)) and
              (CadPendPrest.ChecaMesmoVendedor(codVendOld,
              CadPendPrest.dataSet.FieldByName('CODIGO_VEND').AsInteger)) and
              (CadPendPrest.ChecaMesmocontrole(codcontroleold,
              CadPendPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger))) and
              (CadPendPrest.validaRecebimentoPrestacao(vPrestacoesMarcadas)) then
            begin
              if not CadPendPrest.recebendo then
              begin
                if not vGerouLote then
                begin
                  CadPendPrest.GravaLoteCxl;
                  vGerouLote := true;
                end;
                if CadPendPrest.marcaRec(1) then
                begin
                  vDadosIni.GravaAuditoria('CXL002', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                  CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
                  if ((CadPendPrest.dataset.FieldByName('VALOR_DESC').value = 0)
                  		or (CadPendPrest.dataset.FieldByName('VALOR_DESC').isnull))
                    and ((CadPendPrest.dataset.FieldByName('VALOR_ACRESC').value = 0)
                    	or (CadPendPrest.dataset.FieldByName('VALOR_ACRESC').isnull)) then
                  begin
                  	if CheckBox4.Checked then
	                    CadPendPrest.corrigeValor
                    else
                    	CadPendPrest.atualizarValorCorr
                  end;

                  if AUsarDataBaseVND then
                    if DateOf(CadPendPrest.dataSet.FieldByName('DATA_VENDA').AsDateTime) > DateOf(ADataVenda) then
                      ADataVenda := DateOf(CadPendPrest.dataSet.FieldByName('DATA_VENDA').AsDateTime);
                end;
                if CheckBox4.Checked then
	                Valortotal := Valortotal + CadPendPrest.dataSet.FieldByName('VALOR_CORR').AsCurrency
                else
                	Valortotal := Valortotal + CadPendPrest.dataSet.FieldByName('VALOR_C').AsCurrency;
                Codcliente := CadPendPrest.dataSet.FieldByName('COD_CLIENTE').asinteger;
              end
              else
              begin
                CadPendPrest.retornaMensagemRecebimento;
                CadPendPrest.dataSet.next;
                if CadPendPrest.dataSet.Eof then
                begin
                  CadPendPrest.selecPrestacao;
                  break;
                end
                else
                begin
                  CadPendPrest.dataSet.Prior;
                  CadPendPrest.selecPrestacao;
                  continue;
                end;
              end;
            end
            else
            begin
              CadPendPrest.dataSet.next;
              if CadPendPrest.dataSet.Eof then
              begin
                CadPendPrest.selecPrestacao;
                break;
              end
              else
              begin
                CadPendPrest.dataSet.Prior;
                CadPendPrest.selecPrestacao;
                continue;
              end;
            end;
          end;
          CadPendPrest.dataSet.Next;
          if CadPendPrest.CancelaProcesso then
          begin
            HabilitaBotoes(1);
            exit;
          end;
        end;
      end;
      ValorTotal := strtofloat(formatfloat('0.00', ValorTotal));
      if ValorTotal > 0 then
      begin
//        CadPendPrest.GravaLoteCxl;
        vFp2 := TComunicacaoFormaPagamento.Create;
        if vFp2.iniciaFormaPagamento(CadPendPrest.vLoteCxlAtual, IfThen(AUsarDataBaseVND, Trunc(ADataVenda), codcondpag), 0, codcliente,
          codvendedor, 'PRE', ValorTotal) then
        begin
          {
          if Application.MessageBox('Responda Sim para recibo em EPL e Não para Impressora comum',
            'Confirmar Tipo de Impressão:', MB_YESNO + MB_DEFBUTTON1) = mrYES then
            CadPendPrest.vFlagImpRecibo := 1
          else
            CadPendPrest.vFlagImpRecibo := 2;
          }
          recibo_prestacao_print_chose(CadPendPrest);
          CadPendPrest.confirmarecebimento('T',vFp2.valorpago, ValorTotal);
        end
        else
        begin
          CadPendPrest.Naoconfirmarecebimento('T');
          CadPendPrest.refreshDataset;
        end;
        vFp2.Free;
      end
      else
        Application.MessageBox('Nenhuma prestação selecionada.', 'Informação', MB_OK +MB_DEFBUTTON1);

    end;
  finally
    CadPendPrest.OnChosePrintLote := nil;
    HabilitaBotoes(1);
    Screen.Cursor := crDefault;
    CadPendPrest.dataSet.Filtered := false;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  try
  if CadPendPrest.ultdiaCXL then
     exit;
   if CadPendPrest.IsEmpty then
     exit;
   if CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0 then
   begin
   	 Application.MessageBox('Cliente avulso informado nesta prestação.', 'Informação', MB_OK + MB_DEFBUTTON1);
   	 exit;
   end;

    Screen.Cursor := crHourGlass;
    CadPendPrest.cl_abreExtrato_form(CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger);
//    vCadCliente.verificaFiscalAtivo;
//    vCadCliente.cadPedVenda(true);
    SpeedButton5Click(Sender);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton25Click(Sender: TObject);
begin
  inherited;
	try
    if CadPendPrest.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL088','INICIAR','','','',CadPendPrest.Buscas,True) then
    begin
      Screen.Cursor := crHourGlass;

      vDadosIni.abrirRecibo(1);
      SpeedButton5Click(Sender);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton2Click(Sender: TObject);
var
  vsmnrecr: currency; //Valores Recebidos
  vsmrec: currency; //Valores Não Recebidos sem Reajuste
  vsmnrec: currency; //Valores Não Recebidos Marcados com Reajuste
  vsmnsrec: currency;
  flagCancelar: boolean;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendPrest.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL005','SOMAR','','CONTROLE_CREDITOS','',CadPendPrest.Buscas,True) then
//    if vDadosIni.PesqPros('CXL005', 'F2-Somar', CadPendPrest.Buscas, True) then
    begin
      vsmrec := 0.00;
      vsmnrec := 0.00;
      vsmnrecr := 0.00;
      vsmnsrec:=0.00;
      flagCancelar := false;
      CadPendPrest.dataSet.first;
      CadPendPrest.vCancela := false;
      HabilitaBotoes(0);
      while not CadPendPrest.dataSet.eof do
      begin
        Application.ProcessMessages;
        if CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').value <> 'R' then
          if CadPendPrest.dataSet.FieldByName('SELEC').value = 'S' then
          begin
            CadPendPrest.corrigeValor;
            if not CadPendPrest.dataSet.FieldByName('VALOR_CORR').IsNull then
              vsmnrecr := vsmnrecr + CadPendPrest.dataSet.FieldByName('VALOR_CORR').value;
            vsmnsrec:=vsmnsrec+CadPendPrest.dataSet.FieldByName('VALOR_C').value;
            vsmnrec := vsmnrec + CadPendPrest.dataSet.FieldByName('VALOR_C').value;
          end
          else
            vsmnrec := vsmnrec + CadPendPrest.dataSet.FieldByName('VALOR_C').value;
        if not CadPendPrest.dataSet.FieldByName('VL_RQ_PG_CXL').IsNull then
          vsmrec := vsmrec + CadPendPrest.dataSet.FieldByName('VL_RQ_PG_CXL').value;
        CadPendPrest.dataSet.next;
        if CadPendPrest.CancelaProcessoImediato then
        begin
          HabilitaBotoes(1);
          flagCancelar := true;
          break;
        end
        else
        begin
          HabilitaBotoes(0);
        end;
      end;
      if not flagCancelar then
        messagedlg('Valores Recebidos: ' + format('%n', [vsmrec]) + #13 +
          'Valores Não Recebidos sem Reajuste: ' + format('%n', [vsmnrec]) + #13 +
          'Valores Não Recebidos Marcados com Reajuste: ' + format('%n', [vsmnrecr])+#13+
          'Valores Não Recebidos Marcados sem Reajuste: ' + format('%n', [vsmnsrec]),
          mtinformation, [mbOK], 0);
      CadPendPrest.dataSet.first;
      HabilitaBotoes(1);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton3Click(Sender: TObject);
var
  obFp2: TFormPag2;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendPrest.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL006','DETALHAR',CadPendPrest.dataSet.FieldByName('LOTE_CXL').asstring,'CONTROLE_CREDITOS',CadPendPrest.dataSet.FieldByName('LOTE_CXL').asstring,CadPendPrest.Buscas,True) then
    begin
     obFp2 := TFormPag2.create;
     obFp2.detalhamentoVenda(CadPendPrest.dataSet.FieldByName('LOTE_CXL').AsInteger,'','PRE');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton4Click(Sender: TObject);
var
  lconsultaPendPrest: TConsultaPendPrest;
begin
  inherited;
  try
    if CadPendPrest.ultdiaCXL then
      Exit;
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('CXL007','PESQUISAR','','CONTROLE_CREDITOS','',CadPendPrest.Buscas,True) then
//    if vDadosIni.PesqPros('CXL007', 'F4-Pesquisar', CadPendPrest.Buscas, True) then
    begin
      lconsultaPendPrest := TConsultaPendPrest.Create;
      Application.CreateForm(TFrmPesqCxl, FrmPesqCxl);
      FrmPesqCxl.Caption := 'Consulta de Prestações...';
      FrmPesqCxl.Consulta := lconsultaPendPrest;
      FrmPesqCxl.Consulta.CdsPesq := CadPendPrest.dataSet;
      FrmPesqCxl.RadioButton1.Enabled := false;
      FrmPesqCxl.RadioButton2.Enabled := true;
      FrmPesqCxl.RadioButton2.Checked := true;
      FrmPesqCxl.showmodal;
      CadPendPrest.PesquisaPendPrestacao(lconsultaPendPrest.vFimSql);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    CadPendPrest.CheckDif:=true;
    if CadPendPrest.ultdiaCXL then
      Exit;
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('CXL008','ATUALIZAR','','CONTROLE_CREDITOS','',CadPendPrest.Buscas,True) then
    begin
      if RadioButton1.Checked then
        CadPendPrest.atualizaPendPrestacao(0)
      else
      begin
        CadPendPrest.atualizaPendPrestacao(1);
      end;
    end;
  finally
//    CadPendPrest.CheckDif:=false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton6Click(Sender: TObject);
var
  i, j,vLote: integer;
  obFp: TFormPag2;
begin
  inherited;
  try
    if CadPendPrest.dataSet.IsEmpty then
      Exit;
    if CadPendPrest.ultdiaCXL then
      Exit;
    Screen.Cursor := crHourGlass;
    CadPendPrest.dataSet.RefreshRecord;
    if CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').AsString <> 'R' then
    begin
       if CadPendPrest.dataSet.FieldByName('LOTE_CXL').asinteger <> 0 then
       begin
         if not CadPendPrest.ExecutaComandosSql('SELECT * FROM FORMPAGAMENTO WHERE NREQUISICAO = ' + CadPendPrest.dataSet.FieldByName('LOTE_CXL').asstring +
         ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND TPDOCS = ''PRE'' AND ATIVO = 1') then
         begin
           Application.MessageBox('Prestação ainda não recebida.', 'Informação', MB_OK + MB_DEFBUTTON1);
           exit;
         end;
       end else begin
         Application.MessageBox('Prestação ainda não recebida.', 'Informação', MB_OK + MB_DEFBUTTON1);
         exit;
       end;
    end
    else if (CadPendPrest.dataSet.FieldByName('LOTE_CXL').asinteger = 0) and
    (CadPendPrest.dataSet.FieldByName('op_cxl').AsInteger = vDadosIni.vcodopcxl) then
    begin
      Application.MessageBox('Esta prestação ainda não possui número de lote de quitação/Forma de pagamento, gravados.'+chr(13)+
      'Possivelmente está sendo recebida pelo mesmo operador em outra máquina.'+CHR(13)+
      'Favor verificar antes de prosseguir com o cancelamento.', 'Atenção', MB_OK +MB_ICONWARNING);
      if not vDadosIni.PesqPros('CXL073','CANCELAR',
       CadPendPrest.dataSet.FieldByName('COD_CRED').AsString+' OPERADOR CXL: '+inttostr(vDadosIni.vcodopcxl),'CONTROLE_CREDITOS',
       CadPendPrest.dataSet.FieldByName('COD_CRED').AsString,CadPendPrest.buscas, true) then
         exit;
    end;
    if Application.MessageBox('Favor após esta devolução Cancelar a NF. Confirma o cancelamento '+
    'do Recebimento desta Prestação?', 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
    begin
      if vDadosIni.PesqPros('CXL009','CANCELAR',CadPendPrest.dataSet.FieldByName('LOTE_CXL').asstring+' N.DOC: '+
      CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,CadPendPrest.Buscas,True) then
      begin
        if not (CadPendPrest.dataSet.FieldByName('LOTE_CXL').asinteger = 0) then
        begin
          if Application.MessageBox(Pchar('Deseja realmente cancelar o recebimento da(s) parcela(s) referente(s) '+
          'ao Lote de Quitação número '+CadPendPrest.dataSet.FieldByName('LOTE_CXL').asstring+'?'), 'Confirmação',
            MB_YESNO + MB_DEFBUTTON1) = mrYES then
          begin
            CadPendPrest.PegaInfDiaFec;
            CadPendPrest.CorrigeSaldoECxl(CadPendPrest.vSaldoCxl, CadPendPrest.vTotalECxl);
            CadPendPrest.Buscas.Close;
            obFp := TFormPag2.create;
            obFp.cancelaVenda(CadPendPrest.dataSet.FieldByName('LOTE_CXL').AsInteger, 'PRE');
            CadPendPrest.CancelaRecPrestacao;
            CadPendPrest.corrigeValor;
          end;
        end
        else
        begin
          if Application.MessageBox(Pchar('Deseja realmente cancelar o recebimento da parcela selecionada? '+chr(13)+
          'Documento :'+CadPendPrest.dataSet.FieldByName('N_DOC_C').asstring), 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
          begin
            //para recebimento sem número de lote
            CadPendPrest.CancelaRecPrestacao;
            CadPendPrest.corrigeValor;
          end;
        end;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
    CadPendPrest.CancelUpdates;
    CadPendPrest.Refresh;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    try
      if CadPendPrest.ultdiaCXL then
      begin
        CadPendPrest.CancelUpdates;
        Exit;
      end;
      CadPendPrest.dataSet.Filter := 'SELEC = ''S'' ';
      CadPendPrest.dataSet.Filtered := true;
      Screen.Cursor := crHourGlass;
      if vDadosIni.PesqPros('CXL011','CORRIGIR VALOR',' N.DOC: '+
      CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',
      CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,CadPendPrest.Buscas,True) then
      begin
        HabilitaBotoes(0);
        CadPendPrest.dataSet.RecordCount;
        CadPendPrest.dataSet.First;
        while not CadPendPrest.dataSet.Eof do
        begin
          Application.ProcessMessages;
          if not CadPendPrest.Active then
            exit;
          if CadPendPrest.dataSet.FieldByName('SELEC').Value = 'S' then
          begin
            vDadosIni.GravaAuditoria('CXL011', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                    CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
            CadPendPrest.corrigeValor;
    //          CadPendPrest.selecPrestacao;
          end;
          CadPendPrest.dataSet.Next;
          if CadPendPrest.CancelaProcessoImediato then
          begin
            HabilitaBotoes(1);
            exit;
          end
          else
            SpeedButton14.enabled := true;
        end;
        HabilitaBotoes(1);
      end;
    finally
      Screen.Cursor := crDefault;
      CadPendPrest.Refresh;
      CadPendPrest.dataSet.Filtered := false;
    end;
  except
    //em caso de clicar no botão sair direto
  end;
end;

procedure TFrmPendPrestacao.SpeedButton8Click(Sender: TObject);
var
  FrmDescPrestacao: TFrmDescPrestacao;
  str: string;
  creditosSelec:boolean;
begin
  inherited;
  try
    exit;
    creditosSelec:=false;
    Screen.Cursor := crHourGlass;
    if CadPendPrest.ultdiaCXL then
      Exit;
//    if CadPendPrest.recebendo then//and (CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').value = 'R')
//    begin
//      if CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').AsString = 'R' then
//      try
//      CadPendPrest.dataSet.RefreshRecord;
//      except
//      end;
//      Application.MessageBox('Documento já recebido ou sendo recebido por outro usuário.' + #13 +
//        'É necessário cancelar o recebimento para conceder desconto.', 'Informação', MB_OK +
//        MB_DEFBUTTON1);
//      exit;
//    end;
    if vDadosIni.PesqPros('CXL012','DESCONTO',' N.DOC: '+
      CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,CadPendPrest.Buscas,True) then
    begin
      CadPendPrest.first;
      CadPendPrest.vValorCorrSemDesc:=0;
      while not CadPendPrest.eof do
      begin
        if CadPendPrest.dataSet.FieldByName('SELEC').AsString = 'S' then
        begin
          if CadPendPrest.recebendo then
          begin
            try
//              CadPendPrest.dataSet.RefreshRecord;
              CadPendPrest.dataSet.CancelUpdates;
              CadPendPrest.dataSet.Refresh;
            except
            end;
            CadPendPrest.retornaMensagemRecebimento;
            exit;
          end
          else
          begin
            creditosSelec:=true;
            CadPendPrest.corrigeValor;
            CadPendPrest.vValorCorrSemDesc := CadPendPrest.vValorCorrSemDesc+CadPendPrest.dataSet.FieldByName('VALOR_CORR').Value;
          end;
        end;
        CadPendPrest.next;
      end;
      if not creditosSelec then
      begin
        Application.MessageBox('Nenhum crédito foi selecionado para concedimento de desconto.', 'Informação', MB_OK +MB_DEFBUTTON1);
        exit;
      end;
      if CadPendPrest.vValorCorrSemDesc = 0 then
      begin
        Application.MessageBox('O valor corrigido do(s) crédito(s) seleciondo(s) é zero.' + #13 +
         'Desconto não permitido.', 'Informação', MB_OK +MB_DEFBUTTON1);
        exit;
      end;
      Application.CreateForm(TFrmDescPrestacao, FrmDescPrestacao);
      FrmDescPrestacao.ShowModal;

      if FrmDescPrestacao.ModalResult = mrOk then
      begin
       CadPendPrest.First;
       str := 'Percentual máxido de desconto permitido = ' +
              floattostr(CadPendPrest.vPercDescEmp) + '%' + #13 +
              'Percentual apurado de desconto = ' + format('%0.2f', [CadPendPrest.vPercDescontoCalc])
                + '%' + #13 +
              'Valor da Prestação = ' + format('%m', [CadPendPrest.vValorCorrSemDesc]) + #13
                +
              'Valor do desconto = ' + format('%m', [CadPendPrest.vValorCorrSemDesc -
                CadPendPrest.vValorCorrComDesc]) + #13 +
              'Valor da Prestação com desconto = ' + format('%m',
                [CadPendPrest.vValorCorrComDesc]) + #13 + #13 +
              'Deseja permitir este desconto?';
       if Application.MessageBox(pchar(str), 'Confirmar Desconto?', MB_YESNO + MB_DEFBUTTON1) =
       mrYES then
       begin
         while not CadPendPrest.eof do
         begin
          if CadPendPrest.dataSet.FieldByName('SELEC').AsString = 'S' then
          begin
            if CadPendPrest.DescontoPermitido then
            begin
              if CadPendPrest.GravaDesconto then
                vDadosIni.GravaAuditoria('CXL023', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                      CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas)
              else
                vDadosIni.GravaAuditoria('CXL024', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                      CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
            end
            {else if vDadosIni.PesqPros('CXL013','PERMITIR','N.DOC: '+
            CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,CadPendPrest.Buscas,True) then
            begin
              if Application.MessageBox('Permitir o desconto assim mesmo?', 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYES then
              begin
                if CadPendPrest.GravaDesconto then
                 vDadosIni.GravaAuditoria('CXL023', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                      CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas)
                else
                 vDadosIni.GravaAuditoria('CXL024', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                      CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
              end
              else vDadosIni.GravaAuditoria('CXL024', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                      CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
            end}
            else
              vDadosIni.GravaAuditoria('CXL024', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                      CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
          end;
          CadPendPrest.next;
         end;
       end;
      end
      else
       vDadosIni.GravaAuditoria('CXL024', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                  CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
    end
    else
     vDadosIni.GravaAuditoria('CXL024', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                  CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton9Click(Sender: TObject);
var
  codcondpag, codcliente, codvendedor: integer;
  valortotal: currency;
  vFp2: TComunicacaoFormaPagamento;
  valorParcial: Currency;
begin
  inherited;
  CadPendPrest.OnChosePrintLote := recibo_prestacao_lote_chose;
  try
    if CadPendPrest.ultdiaCXL then
      Exit;
    Screen.Cursor := crHourGlass;
    if not (CadPendPrest.dataSet.FieldByName('SELEC').value = 'S') then
    begin
      Application.MessageBox('Nenhuma prestação selecionada.', 'Informação', MB_OK +  MB_DEFBUTTON1);
      exit;
    end else
    begin
      CadPendPrest.CancelUpdates;
      CadPendPrest.selecPrestacao(false);
      if vDadosIni.PesqPros('CXL014','QUITAR PARCIAL','N.DOC: '+
      CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',
      CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,CadPendPrest.Buscas,True) then
      begin
        CadPendPrest.vCancela := false;
        codcondpag := 0;
        codcliente := CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger;
        codvendedor := CadPendPrest.dataSet.FieldByName('CODIGO_VEND').AsInteger;
        valortotal := 0;
        if not CadPendPrest.recebendo then
        begin
          CadPendPrest.GravaLoteCxl;
          CadPendPrest.PegaInfDiaFec;
          if CadPendPrest.marcaRec(1) then
            CadPendPrest.corrigeValor;
          Valortotal := Valortotal + CadPendPrest.dataSet.FieldByName('VALOR_CORR').ascurrency;
          Valortotal := strtofloat(formatfloat('0.00', ValorTotal));
          Codcliente := CadPendPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger;
        end
        else
        begin
          CadPendPrest.selecPrestacao;
          CadPendPrest.retornaMensagemRecebimento;
          CadPendPrest.Refresh;
          exit;
        end;
        Application.CreateForm(TFrmBaixaParcial, FrmBaixaParcial);
        try
          if FrmBaixaParcial.ShowModal <> mrOk then
          begin
            CadPendPrest.Naoconfirmarecebimento('P');
            Exit;
          end;
          valorParcial := vDadosIni.StrToFloatFormat(FrmBaixaParcial.EditMoeda1.Valor, 2);
          ValorTotal := vDadosIni.StrToFloatFormat(ValorTotal, 2);
        finally
          FreeAndNil(FrmBaixaParcial);
        end;

        begin
          if valorParcial >= ValorTotal then
          begin
            Application.MessageBox('Valor para Baixa maior que o valor da Parcela, módulo de baixa ' +
              'Total será chamado', 'Informação',MB_OK+MB_ICONINFORMATION);
            ValorTotal := strtofloat(formatfloat('0.00', ValorTotal));
            if ValorTotal > 0 then
            begin
              vFp2 := TComunicacaoFormaPagamento.Create;
              if vFp2.iniciaFormaPagamento(CadPendPrest.vLoteCxlAtual, codcondpag, 0, codcliente,
                codvendedor, 'PRE', ValorTotal) then
              begin
                recibo_prestacao_print_chose(CadPendPrest);
//                if Application.MessageBox('Responda Sim para recibo em EPL e Não para Impressora comum',
//                  'Confirmar Tipo de Impressão:', MB_YESNO + MB_DEFBUTTON1) = mrYES then
//                  CadPendPrest.vFlagImpRecibo := 1
//                else
//                  CadPendPrest.vFlagImpRecibo := 2;
                CadPendPrest.confirmarecebimento('T',vFp2.valorpago, ValorTotal);
              end
              else
              begin
                CadPendPrest.Naoconfirmarecebimento('T');
                CadPendPrest.refreshDataset;
              end;
              vFp2.Free;
            end
            else
              Application.MessageBox('Nenhuma prestação selecionada.', 'Informação', MB_OK +MB_DEFBUTTON1);
          end
          else
          begin
            Valortotal := valorParcial;
            if ValorTotal > 0 then
            begin
//              CadPendPrest.GravaLoteCxl;
              vFp2 := TComunicacaoFormaPagamento.Create;
              if vFp2.iniciaFormaPagamento(CadPendPrest.vLoteCxlAtual, codcondpag, 1, codcliente,
                codvendedor, 'PRE', ValorTotal) then
              begin
                recibo_prestacao_print_chose(CadPendPrest);
//                if
//                  Application.MessageBox('Responda Sim para recibo em EPL e Não para Impressora comum', 'Confirmar Tipo de Impressão:', MB_YESNO + MB_DEFBUTTON1) = mrYES then
//                  CadPendPrest.vFlagImpRecibo := 1
//                else
//                  CadPendPrest.vFlagImpRecibo := 2;
                if CadPendPrest.confirmarecebimento('P',vFp2.valorpago, Valortotal) then
                  vDadosIni.GravaAuditoria('CXL015', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                   CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
              end
              else
              begin
              //  obFormPag.cancelaVenda(CadPendPrest.vLoteCxlAtual, 'PRE');
                CadPendPrest.Naoconfirmarecebimento('P');
              end;
            end
            else
            begin
              Application.MessageBox('Valor a quitar deve ser maior que zero.', 'Informação', MB_OK
                + MB_DEFBUTTON1);
              CadPendPrest.Naoconfirmarecebimento('P');
            end;
          end;
//        end
//        else begin
////          CadPendPrest.dataSet.RefreshRecord;
//          CadPendPrest.Naoconfirmarecebimento('P');
        end;
      end;
    end;
  finally
    CadPendPrest.OnChosePrintLote := nil;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmPendPrestacao.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmPendPrestacao.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmPendPrestacao.SpeedButton10Click(Sender: TObject);
var
  vImpLote: Boolean;
  vLotetmp: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendPrest.ultdiaCXL then
      Exit;
    if CadPendPrest.dataSet.FieldByName('STATUS_CXL_RQ').value <> 'R' then
    begin
      Application.MessageBox('Prestação ainda não recebida.', 'Informação', MB_OK +
        MB_DEFBUTTON1);
      exit;
    end;
    if vDadosIni.PesqPros('CXL016','EMITIR','N.DOC: '+
    CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',
    CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,CadPendPrest.Buscas,True) then
//    if vDadosIni.PesqPros('CXL016', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString,
//      CadPendPrest.Buscas, True) then
    begin

//        lbx_impressora.ItemIndex := CadPendPrest._LerConfiguracoesRegistroInteger('TipoImpressoraRecibo', Ord(tirComum));
//        pn_recibo_impressora.Visible := True;
//        pn_recibo_lote.Visible := False;
//
//        if not vDadosIni.abreForm('Selecione o tipo de impressora', pn_recibo, opFormsDefCadEsc) then
//          Exit;
//
//        CadPendPrest._GravaConfiguracoesInteger('TipoImpressoraRecibo', lbx_impressora.ItemIndex);
//
//        printtype := TipoImpressoraRecibo(lbx_impressora.ItemIndex);

      recibo_prestacao_print_chose(CadPendPrest);

      if CadPendPrest.printtype = tirNenhuma then
        Exit;

      vLotetmp := 0;
      if CadPendPrest.printtype in [tirComum, tirNaoFiscal] then
      begin
        CadPendPrest.buscas.Close;
        CadPendPrest.buscas.SQL.Text := 'select count(cc.lote_cxl) contador from controle_creditos cc' +
          ' where cc.lote_cxl = ' +IntToStr(CadPendPrest.dataSet.FieldByName('lote_cxl').AsInteger) +
          ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;
        CadPendPrest.buscas.Open;

        vImpLote := False;

        if CadPendPrest.buscas.FieldByName('contador').AsInteger > 1 then
        begin
          recibo_prestacao_lote_chose(CadPendPrest);

          if CadPendPrest.printtype = tirNenhuma then
            Exit;

          vImpLote := CadPendPrest.printlote;
          (*
          lbx_lote.ItemIndex := CadPendPrest._LerConfiguracoesRegistroInteger('TipoImpressoraRecibo_lote', 0);
//          vImpLote := Application.MessageBox('Imprimir Recibo no valor do Lote?', 'Confirmação',
//              MB_ICONQUESTION + MB_YESNO) = IDYES;
          pn_recibo_lote.Visible := True;
          pn_recibo_impressora.Visible := False;
          if not vDadosIni.abreForm('Impressão em lote?', pn_recibo, opFormsDefCadEsc) then
            Exit;

          CadPendPrest._GravaConfiguracoesInteger('TipoImpressoraRecibo_lote', lbx_lote.ItemIndex);
          *)
        end;
        //vImpLote := lbx_lote.ItemIndex = 0;
        if vImpLote then
          vLotetmp := CadPendPrest.dataSet.FieldByName('lote_cxl').AsInteger;
      end;

//      if Application.MessageBox('Responda Sim para recibo em EPL e Não para Impressora comum',
//        'Confirmar Tipo de Impressão:', MB_YESNO + MB_DEFBUTTON1) = mrYES then
      if CadPendPrest.printtype = tirEPL then
      begin
        if CadPendPrest.dataSet.FieldByName('TP_REC_CXL').value = 'T' then
        begin
          vDadosIni.GravaAuditoria('CXL017', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                  CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
//          vDadosIni.GravaAuditoria('CXL017', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString,
 //           CadPendPrest.buscas);
          CadPendPrest.ImprimeREcG(1, 1);
        end
        else
        begin
          vDadosIni.GravaAuditoria('CXL018', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                  CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
  //        vDadosIni.GravaAuditoria('CXL018', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString,
//            CadPendPrest.buscas);
          CadPendPrest.ImprimeREcG(1, 2);
        end;
      end
      else
      begin
        if CadPendPrest.dataSet.FieldByName('TP_REC_CXL').value = 'T' then
        begin
          vDadosIni.GravaAuditoria('CXL019', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                  CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
//          vDadosIni.GravaAuditoria('CXL019', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString,
//            CadPendPrest.buscas);
          if CadPendPrest.printtype = tirComum then
            CadPendPrest.ImprimeREcG(2, 1, vLotetmp)
          else if CadPendPrest.printtype = tirNaoFiscal then
            CadPendPrest.Recibo_PrintNaoFiscal(vLotetmp)
        end
        else
        begin
          vDadosIni.GravaAuditoria('CXL020', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                  CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
//          vDadosIni.GravaAuditoria('CXL020', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString,
 //           CadPendPrest.buscas);
          if CadPendPrest.printtype = tirComum then
            CadPendPrest.ImprimeREcG(2, 2, vLotetmp)
          else if CadPendPrest.printtype = tirNaoFiscal then
            CadPendPrest.Recibo_PrintNaoFiscal(vLotetmp)
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton11Click(Sender: TObject);
var
  vit: integer;
  vbols: integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPendPrest.ultdiaCXL then
      Exit;
    if vDadosIni.PesqPros('CXL021','REIMPRIMIR REC.','N.DOC: '+
    CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,'CONTROLE_CREDITOS',
    CadPendPrest.dataSet.fieldbyname('N_DOC_C').AsString,CadPendPrest.Buscas,True) then
//    if vDadosIni.PesqPros('CXL021', 'F11-Reimprimir', CadPendPrest.Buscas, True) then
    begin
      //  CadPendPrest.PegaInfEmpresa;
      CadPendPrest.dataSet.First;
      vit := 0;
      vbols := 0;
      HabilitaBotoes(0);
      CadPendPrest.First;
      while not CadPendPrest.dataSet.eof do
      begin
        Application.ProcessMessages;
        if DBGrid1.SelectedRows.CurrentRowSelected then
          vbols := vbols + 1;
        if CadPendPrest.vCancela then
        begin
          if Application.MessageBox('Quer realmente cancelar esta operação?', 'Confirmação',
            MB_YESNO + MB_DEFBUTTON1) = mrYES then
          begin
            CadPendPrest.vCancela := False;
            HabilitaBotoes(1);
            CadPendPrest.dataSet.First;
            exit;
          end
          else
          begin
            CadPendPrest.vCancela := False;
            HabilitaBotoes(0);
          end;
        end;
        CadPendPrest.dataSet.next;
      end;
      CadPendPrest.dataSet.first;
      if not CadPendPrest.vCancela then
      begin
        try
          while not CadPendPrest.dataSet.eof do
          begin
            Application.ProcessMessages;
            if DBGrid1.SelectedRows.CurrentRowSelected then
            begin
              vit := vit + 1;
              vDadosIni.GravaAuditoria('CXL022', '', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
                    CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString, CadPendPrest.buscas);
  //            vDadosIni.GravaAuditoria('CXL022', CadPendPrest.dataSet.FieldByName('N_DOC_C').AsString,
   //             CadPendPrest.buscas);
              CadPendPrest.GeraBoleta(vit, vbols);
            end;
            CadPendPrest.dataSet.next;
            if CadPendPrest.vCancela then
            begin
              if Application.MessageBox('Quer realmente cancelar esta operação?', 'Confirmação',
                MB_YESNO + MB_DEFBUTTON1) = mrYES then
              begin
                CadPendPrest.vCancela := False;
                CadPendPrest.dataSet.First;
                break;
              end
              else
              begin
                CadPendPrest.vCancela := False;
                HabilitaBotoes(0);
              end;
            end;
          end;
        except
         on e: exception do
         begin
          Application.MessageBox(pchar('Erro na impressao: '+
          e.Message), pchar('Erro'), MB_ICONERROR + MB_OK);
//          registraErro('Erro CXL: ' + e.Message);
         end;
        end;
      end;
      HabilitaBotoes(1);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  try
    if CadPendPrest.ultdiaCXL then
      Exit;
    Application.ProcessMessages;
    if Trim(CadPendPrest.dataSet.FieldByName('TIP_CNT').AsString) <> 'C' then
      if Application.MessageBox('Documento marcado como NC. Deseja enviar mesmo assim?','Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDNO then
      Exit;
    Screen.Cursor := crHourGlass;
    CadPendPrest.enviarPrestacaoParaCupom;
    CadPendPrest.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPendPrestacao.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if not CadPendPrest.statusbotoes then
  begin
    CadPendPrest.vCancela := true;
    SpeedButton14.enabled := false;
  end;

end;

procedure TFrmPendPrestacao.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  try
    if CadPendPrest.ultdiaCXL then
      Exit;
    Screen.Cursor := crHourGlass;
    CadPendPrest.showFiscal;
    CadPendPrest.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  try
    CadPendPrest.dataSet.Filter := 'SELEC = ''S'' ';
    CadPendPrest.dataSet.Filtered := true;
    if CadPendPrest.IsEmpty then
      exit;
    HabilitaBotoes(0);
    if CadPendPrest.ultdiaCXL then
    begin
      CadPendPrest.CancelUpdates;
      Exit;
    end;
    Screen.Cursor := crHourGlass;
    CadPendPrest._concederAcrescimoDesconto;
  finally
    HabilitaBotoes(1);
    Screen.Cursor := crDefault;
    CadPendPrest.dataSet.Filtered := false;
  end;
end;

procedure TFrmPendPrestacao.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  try
    if CadPendPrest.IsEmpty then
      exit;
    HabilitaBotoes(0);
    if CadPendPrest.ultdiaCXL then
    begin
      CadPendPrest.CancelUpdates;
      Exit;
    end;
    Screen.Cursor := crHourGlass;
    CadPendPrest._altervalorcorrigido;
  finally
    HabilitaBotoes(1);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPendPrestacao.HabilitaBotoes(vTipo: integer);
begin
  //
  if vTipo = 1 then
  begin
    SpeedButton1.enabled := true;
    SpeedButton2.enabled := true;
    SpeedButton3.enabled := true;
    SpeedButton4.enabled := true;
    SpeedButton5.enabled := true;
    SpeedButton6.enabled := true;
    SpeedButton7.enabled := true;
    SpeedButton8.enabled := true;
    SpeedButton9.enabled := true;
    SpeedButton10.enabled := true;
    SpeedButton11.enabled := true;
    SpeedButton12.enabled := true;
    SpeedButton14.enabled := false;
    SpeedButton15.enabled := true;
    SpeedButton16.enabled := true;
    SpeedButton17.enabled := true;
    CadPendPrest.statusbotoes := true;
  end
  else
  begin
    CadPendPrest.statusbotoes := false;
    SpeedButton1.enabled := false;
    SpeedButton2.enabled := false;
    SpeedButton3.enabled := false;
    SpeedButton4.enabled := false;
    SpeedButton5.enabled := false;
    SpeedButton6.enabled := false;
    SpeedButton7.enabled := false;
    SpeedButton8.enabled := false;
    SpeedButton9.enabled := false;
    SpeedButton10.enabled := false;
    SpeedButton11.enabled := false;
    SpeedButton12.enabled := false;
    SpeedButton14.enabled := true;
    SpeedButton15.enabled := false;
    SpeedButton16.enabled := false;
    SpeedButton17.enabled := false;
  end;

end;

procedure TFrmPendPrestacao.lbx_impressoraDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  with (Control as TListBox).Canvas do
  begin
    //if (pos(ListBox1.Items[Index] + '|', vPerfTribAd.dataSet.FieldByName('sigla_uf').AsString) > 0) then
    if TListBox(Control).ItemIndex = Index then
    begin
      Brush.Color := clHotLight;
      Font.Color := clWhite;
    end;

    Brush.Style := bsSolid;
    FillRect(Rect);
    Brush.Style := bsClear;
    TextOut(Rect.Left, Rect.Top,(Control as TListBox).Items[Index]);
  end;
end;

procedure TFrmPendPrestacao.pnQuitarOpcaoEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (btQuitarOpcaoOK.CanFocus) then
  	btQuitarOpcaoOK.SetFocus;
end;

procedure TFrmPendPrestacao.RadioButton1Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmPendPrestacao.RadioButton2Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmPendPrestacao.RadioGroupDescontoAcrescimoClick(Sender: TObject);
begin
  inherited;
  Label59.Caption := 'Percentual do ' + vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'Desconto:', 'Acréscimo:');
  Label62.Caption := vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'Desconto', 'Acréscimo') + ' sobre o Valor Corrigido:';
  BitBtn36.Hint := 'OK - [' + vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'CXL012', 'CXL081') + ']';
  if edDescPerc.AsValue > 0 then
  begin
    edDescValor.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
      pnValorDaOperacao.Caption := Format('%0.2n', [CadPendPrest.ValorOperacao -
        (CadPendPrest.ValorOperacao * edDescPerc.AsValue / 100)])
    else
      pnValorDaOperacao.Caption := Format('%0.2n', [CadPendPrest.ValorOperacao +
        (CadPendPrest.ValorOperacao * edDescPerc.AsValue / 100)]);
  end
  else if edDescValor.AsValue > 0 then
  begin
    edDescPerc.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
    	pnValorDaOperacao.Caption := Format('%0.2n', [(CadPendPrest.ValorOperacao - edDescValor.AsValue)])
    else
	    pnValorDaOperacao.Caption := Format('%0.2n', [(CadPendPrest.ValorOperacao + edDescValor.AsValue)]);
  end
  else if (edDescPerc.AsValue <= 0) and (edDescValor.AsValue <= 0) then
    pnValorDaOperacao.Caption := Format('%0.2n', [CadPendPrest.ValorOperacao]);
end;

procedure TFrmPendPrestacao.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TFrmPendPrestacao.recibo_prestacao_lote_chose(Sender: TObject);
begin
  lbx_lote.ItemIndex := CadPendPrest._LerConfiguracoesRegistroInteger('TipoImpressoraRecibo_lote', 0);

  pn_recibo_lote.Visible := True;
  pn_recibo_impressora.Visible := False;
  if not vDadosIni.abreForm('Impressão em lote?', pn_recibo, opFormsDefCadEsc) then
  begin
    CadPendPrest.printtype := tirNenhuma;
    Exit;
  end
  else
    CadPendPrest.printlote := lbx_lote.ItemIndex = 0;

  CadPendPrest._GravaConfiguracoesInteger('TipoImpressoraRecibo_lote', lbx_lote.ItemIndex);
end;

procedure TFrmPendPrestacao.recibo_prestacao_print_chose(Sender: TObject);
begin
  lbx_impressora.ItemIndex := CadPendPrest._LerConfiguracoesRegistroInteger('TipoImpressoraRecibo', Ord(tirComum));
  pn_recibo_impressora.Visible := True;
  pn_recibo_lote.Visible := False;

  if not vDadosIni.abreForm('Selecione o tipo de impressora', pn_recibo, opFormsDefCadEsc) then
    Exit;

  CadPendPrest._GravaConfiguracoesInteger('TipoImpressoraRecibo', lbx_impressora.ItemIndex);

  CadPendPrest.printtype := TipoImpressoraRecibo(lbx_impressora.ItemIndex);
end;

procedure TFrmPendPrestacao.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

end.

