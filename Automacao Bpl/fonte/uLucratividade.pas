unit uLucratividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, ExtCtrls, uClasseMargemProduto,
  Menus, Buttons, Mask, DBCtrls, uEditHw, uEditMoeda;

type
  TfrmLucratividade = class(TfrmPadrao)
    pnFundo: TPanel;
    gbItensDaVenda: TGroupBox;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    SalvardadosnoExcel: TMenuItem;
    pnDNA: TPanel;
    gbLucratividadeUnitaria: TGroupBox;
    lbNitem: TLabel;
    lbNumFab: TLabel;
    lbDescricao: TLabel;
    lbValunit: TLabel;
    lbRateioDesconto: TLabel;
    lbRateioAcrescimo: TLabel;
    lbMarkup: TLabel;
    lbPE: TLabel;
    gbLucratividadeVenda: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    gbLucratividadeVendaDescAcresc: TGroupBox;
    Label6: TLabel;
    sbDNA: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    gbLucratividadeUnitariaCustos: TGroupBox;
    DBEdit7: TDBEdit;
    lbCMV: TLabel;
    lbCF: TLabel;
    DBEdit8: TDBEdit;
    lbCV: TLabel;
    DBEdit9: TDBEdit;
    lvCT: TLabel;
    DBEdit10: TDBEdit;
    gbLucratividadeUnitariaLucro: TGroupBox;
    DBEdit11: TDBEdit;
    lbLucroLiq: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    ehAcrescimo: TEditHw;
    btSimular: TBitBtn;
    gbLucratividadeVendaCustos: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    gbLucratividadeVendaLucro: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    edDepartamento: TEdit;
    edAnoMesApuracao: TEdit;
    edDNA: TEdit;
    rgTipoLucratividade: TRadioGroup;
    gbLucratividadeTotal: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    gbLucratividadeTotalCustos: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    gbLucratividadeTotalLucro: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    ehDesconto: TEditHw;
    SpeedButton1: TSpeedButton;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    Label59: TLabel;
    Label60: TLabel;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    imgInformation: TImage;
    Label67: TLabel;
    Label68: TLabel;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    Label69: TLabel;
    Label70: TLabel;
    DBEdit77: TDBEdit;
    DBEdit78: TDBEdit;
    Label71: TLabel;
    Label72: TLabel;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    procedure imgInformationClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgTipoLucratividadeClick(Sender: TObject);
    procedure sbDNAClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSimularClick(Sender: TObject);
    procedure SalvardadosnoExcelClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function verificaDNA: boolean;
    function obterMargemProduto(pRetornaPos: boolean = True): boolean;
    function obterMargemVenda(pRetornaPos: boolean = True): boolean;
    function getValorLiqParaMargem: Currency;
    function preencherDatasetVenda: boolean;
    function preencherDatasetItens: boolean;
    function rateioDescAcres: boolean;
    function somaProdutosParaDesconto: real;
  public
    { Public declarations }
  end;

var
  frmLucratividade: TfrmLucratividade;
  vLucrativadade: TMargemProduto;
  vTemPrecoTabela: boolean;

implementation

uses uDataSet_OOP, DB, DBClient, uDtmAtivo, uDadosIni, uDtmMargemProduto, UClassesCadastrosBasicos, 
  Math;

{$R *.dfm}

procedure TfrmLucratividade.btSimularClick(Sender: TObject);
begin
  inherited;
	if not rateioDescAcres then
  	Exit;
	if not obterMargemProduto then
  	Exit;
  obterMargemVenda;
end;

procedure TfrmLucratividade.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if (UpperCase(Column.Field.Dataset.FieldbyName('STATUS').AsString) = 'CANCELADO') then
  	if (gdFocused in State) then
    begin
    	TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
    	TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
	if Column.Field.Dataset.FieldbyName('LUCROLIQ').AsCurrency <  0 then
  	if (gdFocused in State) then
    begin
    	TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
    	TDBGrid(sender).canvas.brush.color := clRed;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
   	TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmLucratividade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	vDadosIni.vShiftClick := Key = VK_SHIFT;
  if Key = VK_TAB then
  begin
  	if (Self.Enabled) and (Self.Visible) and (ehDesconto.CanFocus) then
    	ehDesconto.SetFocus;
  end;
end;

procedure TfrmLucratividade.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
	vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmLucratividade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	FreeAndNil(vLucrativadade);
  Action := caFree;
  frmLucratividade := Nil;
end;

procedure TfrmLucratividade.FormCreate(Sender: TObject);
begin
  inherited;
	if vLucrativadade = nil then
  	vLucrativadade := TMargemProduto.create(False);
  vDadosIni.vShiftClick := False;
end;

procedure TfrmLucratividade.FormDestroy(Sender: TObject);
begin
  inherited;
	if vLucrativadade <> nil then
  begin
    vLucrativadade.Free;
    vLucrativadade := nil;
  end;
end;

procedure TfrmLucratividade.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TfrmLucratividade.FormShow(Sender: TObject);
begin
  inherited;
  gbLucratividadeUnitaria.Align := alRight;
  gbLucratividadeTotal.Align := alRight;
	if verificaDNA then
  begin
    preencherDatasetVenda;
  	preencherDatasetItens;
  	obterMargemProduto(False);
    obterMargemVenda(False);

    imgInformation.Hint :=
      'Alíquota do Imposto de Renda: ' + Format('%n', [vLucrativadade.AliqIRRF]) + #13 +
      'Alíquota do AdicionalImposto de Renda: ' + Format('%n', [vLucrativadade.AliqIRRFAdicional]) + #13 + #13 +
      'A base de cálculo do valor do Adicional do Imposto de Renda pago no perído da apuração foi de ' +
        Format('%n', [vLucrativadade.vProd.vPercBaseADIRRF]) + '% da base de cálculo do Imposto de Renda' + #13 +
      'Verifique no DNA da empresa com o registro do tipo "AIR" (Adicional do Imposto de Renda)';

  end;
end;

function TfrmLucratividade.getValorLiqParaMargem: Currency;
var
	vVlUN, vQuant, vRateioAcresc, vRateioDesc: real;
begin
	vVlUN := vDadosIni.StrToFloatFormat(vLucrativadade.vItensVenda.FieldByName('VLUN_PED_ITEM').AsFloat, 2);

  vQuant := vDadosIni.StrToFloatFormat(vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat, 4);

  vRateioAcresc := vDadosIni.StrToFloatFormat(vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC').AsFloat, 2);

  vRateioDesc := vDadosIni.StrToFloatFormat(vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC').AsFloat, 2);

  if vQuant > 0 then
    Result := (( vVlUN * vQuant) + vRateioAcresc - vRateioDesc) / vQuant
  else
    Result := 0;
end;

procedure TfrmLucratividade.imgInformationClick(Sender: TObject);
begin
  inherited;
  Application.MessageBox(PChar(imgInformation.Hint), 'Atenção', 0 + 64);
end;

function TfrmLucratividade.obterMargemProduto(pRetornaPos: boolean = True): boolean;
var
	vValor, vCusto, vMargemLiquida, vPercMargemLiquida: Currency;
  vGrupoCodigo, vTipoVenda: string;
  vReqNo: integer;
begin
  try
    try
      vDadosIni.abreStatusProcessamento('Lucratividade', 'Calculando Lucratividade dos itens!');
      Result := True;
      btSimular.Enabled := False;
      vValor := 0;
      vCusto := 0;
      vMargemLiquida := 0;
      vPercMargemLiquida := 0;
      vGrupoCodigo := '';
      vTipoVenda := '';
      vReqNo := 1;
      if pRetornaPos then
      	vReqNo := vLucrativadade.vItensVenda.RecNo;
      vLucrativadade.vItensVenda.First;
      while not vLucrativadade.vItensVenda.Eof do
      begin
        vValor := vDadosIni.StrToFloatFormat(getValorLiqParaMargem, 2);
        vCusto := vLucrativadade.vItensVenda.FieldByName('PCUST_MC').AsFloat;
        vGrupoCodigo := 'GRUPO|CODIGO|' +
        vLucrativadade.vItensVenda.FieldByName('GRUPO_PROD').AsString + '|' +
        vLucrativadade.vItensVenda.FieldByName('COD_PROD').AsString + '|';
        vTipoVenda := vLucrativadade.vItensVenda.FieldByName('TIPV').AsString;

        vLucrativadade.obterMargemProduto(vValor, vCusto, vGrupoCodigo, vTipoVenda = 'A', vMargemLiquida, vPercMargemLiquida, 1, False);

        vLucrativadade.vItensVenda.Edit;

        vLucrativadade.vItensVenda.FieldByName('CMV').AsCurrency := vDadosIni.StrToFloatFormat(vLucrativadade.custoAquisicao, 2);
        if vLucrativadade.vItensVenda.FieldByName('VLUN_LIQUIDO').AsFloat > 0 then
          vLucrativadade.vItensVenda.FieldByName('CMVPERC').AsFloat :=
            (vLucrativadade.vItensVenda.FieldByName('CMV').AsCurrency /
            vLucrativadade.vItensVenda.FieldByName('VLUN_LIQUIDO').AsFloat) * 100
        else
          vLucrativadade.vItensVenda.FieldByName('CMVPERC').AsFloat := 0;
        vLucrativadade.vItensVenda.FieldByName('CF').AsCurrency := vLucrativadade.valorDespesasFixas;
        if getValorLiqParaMargem > 0 then
          vLucrativadade.vItensVenda.FieldByName('CFPERC').AsFloat := ((vDadosIni.StrToFloatFormat(vLucrativadade.valorDespesasFixas, 2) / vDadosIni.StrToFloatFormat(getValorLiqParaMargem, 2)) * 100)
        else
          vLucrativadade.vItensVenda.FieldByName('CFPERC').AsFloat := 0;
        vLucrativadade.vItensVenda.FieldByName('CV').AsCurrency := vDadosIni.StrToFloatFormat(vLucrativadade.CustosVariaveis, 2);
        vLucrativadade.vItensVenda.FieldByName('CVPERC').AsFloat := vDadosIni.StrToFloatFormat(vLucrativadade.vProd.VOCV, 2);
        vLucrativadade.vItensVenda.FieldByName('CT').AsCurrency := 0;
        vLucrativadade.vItensVenda.FieldByName('CT').AsCurrency :=
        vDadosIni.StrToFloatFormat(vLucrativadade.custoAquisicao, 2) + vDadosIni.StrToFloatFormat(vLucrativadade.valorDespesasFixas, 2) + vDadosIni.StrToFloatFormat(vLucrativadade.CustosVariaveis, 2);
        if getValorLiqParaMargem > 0 then
          vLucrativadade.vItensVenda.FieldByName('CTPERC').AsFloat := ((vLucrativadade.vItensVenda.FieldByName('CT').AsFloat / getValorLiqParaMargem) * 100)
        else
          vLucrativadade.vItensVenda.FieldByName('CTPERC').AsFloat := 0;
        vLucrativadade.vItensVenda.FieldByName('LUCROLIQ').AsCurrency := vLucrativadade.lucroLiquidoSobreFaturamento;
        vLucrativadade.vItensVenda.FieldByName('LUCROLIQPERC').AsFloat := vLucrativadade.lucroLiquidoSobreFaturamentoPerc;
        if vLucrativadade.custoAquisicao <> 0 then
          vLucrativadade.vItensVenda.FieldByName('MARKUP').AsCurrency :=
            vLucrativadade.precoVendaComDesconto / vLucrativadade.custoAquisicao
        else
        	vLucrativadade.vItensVenda.FieldByName('MARKUP').AsCurrency := 0;
        vLucrativadade.vItensVenda.FieldByName('PE').AsCurrency := vLucrativadade.PEProduto;
        vLucrativadade.vItensVenda.FieldByName('IRRF_ITEM').AsFloat := vLucrativadade.IRRFValor;
        vLucrativadade.vItensVenda.FieldByName('IRRF_PERC').AsFloat := vLucrativadade.IRRFPerc;
        vLucrativadade.vItensVenda.FieldByName('ADIRRF_ITEM').AsFloat := vLucrativadade.IRRFAdicionalValor;
        vLucrativadade.vItensVenda.FieldByName('ADIRRF_PERC').AsFloat := vLucrativadade.IRRFAdicionalPerc;
        vLucrativadade.vItensVenda.FieldByName('CSLL_ITEM').AsFloat := vLucrativadade.CSLLValor;
        vLucrativadade.vItensVenda.FieldByName('CSLL_PERC').AsFloat := vLucrativadade.CSLLPerc;
        vLucrativadade.vItensVenda.FieldByName('LUCRORETIDO_ITEM').AsFloat := vLucrativadade.lucroLiquidoRetidoNaEmpresa;
        vLucrativadade.vItensVenda.FieldByName('LUCRORETIDO_PERC').AsFloat := vLucrativadade.lucroLiquidoRetidoNaEmpresaPerc;
        vLucrativadade.vItensVenda.Post;
        vLucrativadade.vItensVenda.Next;
      end;
    except
      on E: Exception do
      begin
        Result := False;
        vLucrativadade.registraErro(E.Message);
        ShowMessage(E.Message);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    vLucrativadade.vItensVenda.RecNo := vReqNo;
    btSimular.Enabled := True;
  end;
end;

function TfrmLucratividade.obterMargemVenda(pRetornaPos: boolean = True): boolean;
var
	vReqNo: integer;
  vDesconto, vAcrescimo: real;
begin
	try
    try
    	Result := True;
    	vDadosIni.abreStatusProcessamento('Lucratividade', 'Calculando Lucratividade da Venda!');
      if vLucrativadade.vItensVenda.IsEmpty then
      	Exit;

      vDesconto := 0;
      vAcrescimo := 0;

      vLucrativadade.vVenda.Edit;
      vLucrativadade.vVenda.FieldByName('TOT_PROD').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('CMV').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('CMVPERC').AsFloat := 0;
      vLucrativadade.vVenda.FieldByName('CF').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('CFPERC').AsFloat := 0;
      vLucrativadade.vVenda.FieldByName('CV').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('CVPERC').AsFloat := 0;
      vLucrativadade.vVenda.FieldByName('CT').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('CTPERC').AsFloat := 0;
      vLucrativadade.vVenda.FieldByName('LUCROLIQ').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('LUCROLIQPERC').AsFloat := 0;
      vLucrativadade.vVenda.FieldByName('MARKUP').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('PE').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('IRRF').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('ADIRRF').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('CSLL').AsCurrency := 0;
      vLucrativadade.vVenda.FieldByName('LUCRORETIDO').AsCurrency := 0;
      vLucrativadade.vVenda.Post;
      
      vReqNo := 1;
      if pRetornaPos then
      	vReqNo := vLucrativadade.vItensVenda.RecNo;

      vLucrativadade.vItensVenda.First;
      
      while not vLucrativadade.vItensVenda.Eof do
      begin
        vDesconto := vDesconto + vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC').AsFloat;
        vAcrescimo := vAcrescimo + vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC').AsFloat;

        vLucrativadade.vVenda.Edit;

        vLucrativadade.vVenda.FieldByName('TOT_PROD').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('TOT_PROD').AsCurrency +
          vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsCurrency;

        vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsCurrency +
        	vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsCurrency +
          vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC').AsCurrency -
          vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC').AsCurrency;

        vLucrativadade.vVenda.FieldByName('CMV').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('CMV').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('CMV').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('CF').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('CF').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('CF').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('CV').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('CV').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('CV').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('CT').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('CT').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('CT').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('LUCROLIQ').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('LUCROLIQ').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('LUCROLIQ').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('PE').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('PE').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('PE').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('IRRF').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('IRRF').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('IRRF_ITEM').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('ADIRRF').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('ADIRRF').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('ADIRRF_ITEM').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('CSLL').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('CSLL').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('CSLL_ITEM').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.FieldByName('LUCRORETIDO').AsCurrency :=
        	vLucrativadade.vVenda.FieldByName('LUCRORETIDO').AsCurrency +
          (vLucrativadade.vItensVenda.FieldByName('LUCRORETIDO_ITEM').AsCurrency *
          vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat);

        vLucrativadade.vVenda.Post;
        vLucrativadade.vItensVenda.Next;
      end;
      vLucrativadade.vVenda.Edit;

      if vLucrativadade.vVenda.FieldByName('CMV').AsCurrency > 0 then      
        vLucrativadade.vVenda.FieldByName('MARKUP').AsCurrency :=
          (vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsCurrency /
            vLucrativadade.vVenda.FieldByName('CMV').AsCurrency)
      else
        vLucrativadade.vVenda.FieldByName('MARKUP').AsCurrency := 0;

      if vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat > 0 then
      begin
        vLucrativadade.vVenda.FieldByName('CMVPERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('CMV').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);

        vLucrativadade.vVenda.FieldByName('CFPERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('CF').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);
      end
      else
      begin
        vLucrativadade.vVenda.FieldByName('CFPERC').AsFloat := 0;
        vLucrativadade.vVenda.FieldByName('CMVPERC').AsFloat := 0;
      end;

      vLucrativadade.vVenda.FieldByName('CVPERC').AsFloat := vDadosIni.StrToFloatFormat(vLucrativadade.vProd.VOCV, 2);

      if vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat > 0 then
      begin
        vLucrativadade.vVenda.FieldByName('CTPERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('CT').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);

        vLucrativadade.vVenda.FieldByName('LUCROLIQPERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('LUCROLIQ').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);

        vLucrativadade.vVenda.FieldByName('IRRF_PERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('IRRF').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);

        vLucrativadade.vVenda.FieldByName('ADIRRF_PERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('ADIRRF').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);

        vLucrativadade.vVenda.FieldByName('CSLL_PERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('CSLL').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);

        vLucrativadade.vVenda.FieldByName('LUCRORETIDO_PERC').AsFloat :=
          ((vLucrativadade.vVenda.FieldByName('LUCRORETIDO').AsFloat /
          vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsFloat) * 100);
      end
      else
      begin
        vLucrativadade.vVenda.FieldByName('CTPERC').AsFloat := 0;
        vLucrativadade.vVenda.FieldByName('LUCROLIQPERC').AsFloat := 0;
        vLucrativadade.vVenda.FieldByName('IRRF_PERC').AsFloat := 0;
        vLucrativadade.vVenda.FieldByName('ADIRRF_PERC').AsFloat := 0;
        vLucrativadade.vVenda.FieldByName('CSLL_PERC').AsFloat := 0;
        vLucrativadade.vVenda.FieldByName('LUCRORETIDO_PERC').AsFloat := 0;
      end;

        
      vLucrativadade.vVenda.Post;
      ehDesconto.AsValue := vDesconto;
      ehAcrescimo.AsValue := vAcrescimo;
    except
    	on E: Exception do
      begin
        Result := False;
        vLucrativadade.registraErro(E.Message);
        ShowMessage(E.Message);
      end;
    end;
  finally
  	vLucrativadade.vItensVenda.RecNo := vReqNo;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TfrmLucratividade.preencherDatasetItens: boolean;
begin
	try
    try
      vDadosIni.abreStatusProcessamento('Lucratividade', 'Obtendo Itens da Venda');
      Result := True;

      if vDadosIni.vDtSetTmp <> nil then
      begin
        if vDadosIni.vDtSetTmp.IsEmpty then
          Exit;

      	if vLucrativadade.buscas.IsEmpty then
      		Exit;

        Caption := 'Lucratividade Venda ' + vLucrativadade.vVenda.FieldByName('TIPO').AsString +
        ': ' + vLucrativadade.vVenda.FieldByName('NPED').AsString;

        vLucrativadade.vItensVenda.EmptyDataSet;

        vDadosIni.vDtSetTmp.First;

        while not vDadosIni.vDtSetTmp.Eof do
        begin
        	if Trim(vDadosIni.vDtSetTmp.FieldByName('STATUS').AsString) <> 'CANCELADO' then
          begin
          	vLucrativadade.buscas.Close;
      			vLucrativadade.buscas.SQL.Text := 'select permitir_desconto, em_promocao from produtos where grupo_prod = ' +
      			vDadosIni.vDtSetTmp.FieldByName('GRUPO_PROD').AsString + ' and cod_prod = ' +
      			QuotedStr(vDadosIni.vDtSetTmp.FieldByName('COD_PROD').AsString);
      			vLucrativadade.buscas.Open;
            
            vLucrativadade.vItensVenda.Insert;

            vLucrativadade.vItensVenda.FieldByName('NITEM').AsInteger :=
              vDadosIni.vDtSetTmp.FieldByName('NITEM').AsInteger;
            vLucrativadade.vItensVenda.FieldByName('GRUPO_PROD').AsInteger :=
              vDadosIni.vDtSetTmp.FieldByName('GRUPO_PROD').AsInteger;
            vLucrativadade.vItensVenda.FieldByName('COD_PROD').AsString :=
              vDadosIni.vDtSetTmp.FieldByName('COD_PROD').AsString;
            vLucrativadade.vItensVenda.FieldByName('COD_GRADE').AsInteger :=
              vDadosIni.vDtSetTmp.FieldByName('COD_GRADE').AsInteger;
            vLucrativadade.vItensVenda.FieldByName('NUM_FAB_PROD').AsString :=
              vDadosIni.vDtSetTmp.FieldByName('NUM_FAB_PROD').AsString;
            vLucrativadade.vItensVenda.FieldByName('DESCR_PROD_PED').AsString :=
              vDadosIni.vDtSetTmp.FieldByName('DESCR_PROD_PED').AsString;

            vLucrativadade.vItensVenda.FieldByName('UNIDADE').AsString :=
            	vDadosIni.vDtSetTmp.FieldByName('UNIDADE').AsString;
            vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('QUANT_PED_ITEM').AsFloat;
            vLucrativadade.vItensVenda.FieldByName('VLUN_PED_ITEM').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('VLUN_PED_ITEM').AsFloat;
            vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('VLTOT_PED_ITEM').AsFloat;

            vLucrativadade.vItensVenda.FieldByName('UNIDADE_CONV').AsString :=
            	vDadosIni.vDtSetTmp.FieldByName('UNIDADE_CONV').AsString;
            vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM_CONV').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;
            vLucrativadade.vItensVenda.FieldByName('VLUN_PED_ITEM_CONV').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('VLUN_PED_ITEM_CONV').AsFloat;
            vLucrativadade.vItensVenda.FieldByName('OPERACAO_CONV').AsString :=
            	vDadosIni.vDtSetTmp.FieldByName('OPERACAO_CONV').AsString;
            vLucrativadade.vItensVenda.FieldByName('FATOR_CONV').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('FATOR_CONV').AsFloat;

            if (trim(vLucrativadade.vItensVenda.FieldByName('UNIDADE_CONV').AsString) = '')
    					or (trim(vLucrativadade.vItensVenda.FieldByName('UNIDADE').AsString) = trim(vLucrativadade.vItensVenda.FieldByName('UNIDADE_CONV').AsString)) then
            begin
            	vLucrativadade.vItensVenda.FieldByName('FATOR_CONV_TEMP').AsString := '';
            end
            else
            begin
              if (vLucrativadade.vItensVenda.FieldByName('OPERACAO_CONV').AsString = 'M') and (vLucrativadade.vItensVenda.FieldByName('FATOR_CONV').AsFloat > 0) then
              begin
              	vLucrativadade.vItensVenda.FieldByName('FATOR_CONV_TEMP').AsString :=
                  FloatToStr(RoundTo(1, -4)) + ' ' +
                  trim(vLucrativadade.vItensVenda.FieldByName('UNIDADE').AsString) + ' = ' +
                  FloatToStr(RoundTo(vLucrativadade.vItensVenda.FieldByName('FATOR_CONV').AsFloat, -4)) + ' ' +
                  trim(vLucrativadade.vItensVenda.FieldByName('UNIDADE_CONV').AsString);
              end
              else if (vLucrativadade.vItensVenda.FieldByName('OPERACAO_CONV').AsString = 'D') and (vLucrativadade.vItensVenda.FieldByName('FATOR_CONV').AsFloat > 0) then
              begin
              	vLucrativadade.vItensVenda.FieldByName('FATOR_CONV_TEMP').AsString :=
                  FloatToStr(RoundTo(1, -4)) + ' ' +
                  trim(vLucrativadade.vItensVenda.FieldByName('UNIDADE_CONV').AsString) + ' = ' +
                  FloatToStr(RoundTo(vLucrativadade.vItensVenda.FieldByName('FATOR_CONV').AsFloat, -4)) + ' ' +
                  trim(vLucrativadade.vItensVenda.FieldByName('UNIDADE').AsString);
              end
              else
              begin
              	vLucrativadade.vItensVenda.FieldByName('FATOR_CONV_TEMP').AsString := '';
              end;
            end;


            vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('RATEIO_ACRESC').AsFloat;

            if vDadosIni.vDtSetTmp.FieldByName('QUANT_PED_ITEM').AsFloat > 0 then
              vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC_UNITARIO').AsFloat :=
                (vDadosIni.vDtSetTmp.FieldByName('RATEIO_ACRESC').AsFloat /
                vDadosIni.vDtSetTmp.FieldByName('QUANT_PED_ITEM').AsFloat)
            else
              vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC_UNITARIO').AsFloat := 0;
            vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('RATEIO_DESC').AsFloat;
            vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC_UNITARIO').AsFloat :=
              (vDadosIni.vDtSetTmp.FieldByName('RATEIO_DESC').AsFloat /
              vDadosIni.vDtSetTmp.FieldByName('QUANT_PED_ITEM').AsFloat);
            vLucrativadade.vItensVenda.FieldByName('PCUST_MC').AsFloat :=
              vDadosIni.vDtSetTmp.FieldByName('PCUST_MC').AsFloat;
            vLucrativadade.vItensVenda.FieldByName('STATUS').AsString :=
              vDadosIni.vDtSetTmp.FieldByName('STATUS').AsString;
						vLucrativadade.vItensVenda.FieldByName('PERMITIR_DESCONTO').AsString :=
              vLucrativadade.buscas.FieldByName('PERMITIR_DESCONTO').AsString;
						vLucrativadade.vItensVenda.FieldByName('EM_PROMOCAO').AsString :=
              vLucrativadade.buscas.FieldByName('EM_PROMOCAO').AsString;
						vLucrativadade.vItensVenda.FieldByName('TABPRATICADA').AsString :=
              vDadosIni.vDtSetTmp.FieldByName('TABPRATICADA').AsString;
            vLucrativadade.vItensVenda.FieldByName('TIPV').AsString :=
              vLucrativadade.vVenda.FieldByName('TIPV').AsString;
            vLucrativadade.vItensVenda.FieldByName('VLUN_LIQUIDO').AsCurrency :=
            	getValorLiqParaMargem;

            vLucrativadade.vItensVenda.Post;
          end;

          vDadosIni.vDtSetTmp.Next;
        end;
      end;
    except
      on E: Exception do
      begin
        Result := False;
        vLucrativadade.registraErro(E.Message);
        ShowMessage(E.Message);
      end;
    end;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

function TfrmLucratividade.preencherDatasetVenda: boolean;
begin
	try
    try
      vDadosIni.abreStatusProcessamento('Lucratividade', 'Obtendo Venda');
      Result := True;
      vLucrativadade.buscas.Close;
      vLucrativadade.buscas.SQL.Text := 'select p.nped, p.tipo, c.nome_cliente, '+
      'co.nome_vendedor, p.data_ped, p.data_fech, p.valor_total, p.tipv, '+
      'p.tot_prod from pedvenda p '+
      'inner join clientes c on c.cod_cliente = p.cod_cliente '+
      'inner join colaborador co on co.cod_vendedor = p.cod_vendedor '+
      'where nped = ' +
      vDadosIni.vDtSetTmp.FieldByName('NPED').AsString +
      ' and p.tipo = ' +
      QuotedStr(vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString) +
      ' and p.cod_empresa = ' +
      vDadosIni.vDtSetTmp.FieldByName('COD_EMPRESA').AsString;
      vLucrativadade.buscas.Open;

      vLucrativadade.vVenda.EmptyDataSet;

      vLucrativadade.buscas.First;

      while not vLucrativadade.buscas.Eof do
      begin
        vLucrativadade.vVenda.Insert;

        vLucrativadade.vVenda.FieldByName('NPED').AsInteger :=
          vLucrativadade.buscas.FieldByName('NPED').AsInteger;
        vLucrativadade.vVenda.FieldByName('TIPO').AsString :=
          vLucrativadade.buscas.FieldByName('TIPO').AsString;
        vLucrativadade.vVenda.FieldByName('NOME_CLIENTE').AsString :=
          vLucrativadade.buscas.FieldByName('NOME_CLIENTE').AsString;
        vLucrativadade.vVenda.FieldByName('NOME_VENDEDOR').AsString :=
          vLucrativadade.buscas.FieldByName('NOME_VENDEDOR').AsString;
        vLucrativadade.vVenda.FieldByName('DATA_PED').AsDateTime :=
          vLucrativadade.buscas.FieldByName('DATA_PED').AsDateTime;
        vLucrativadade.vVenda.FieldByName('DATA_FECH').AsDateTime :=
          vLucrativadade.buscas.FieldByName('DATA_FECH').AsDateTime;
        vLucrativadade.vVenda.FieldByName('VALOR_TOTAL').AsCurrency :=
          vLucrativadade.buscas.FieldByName('VALOR_TOTAL').AsCurrency;
        vLucrativadade.vVenda.FieldByName('TIPV').AsString :=
          vLucrativadade.buscas.FieldByName('TIPV').AsString;
        vLucrativadade.vVenda.FieldByName('TOT_PROD').AsCurrency :=
          vLucrativadade.buscas.FieldByName('TOT_PROD').AsCurrency;

        vLucrativadade.vVenda.Post;
        vLucrativadade.buscas.Next;
      end;
    except
      on E: Exception do
      begin
        Result := False;
        vLucrativadade.registraErro(E.Message);
        ShowMessage(E.Message);
      end;
    end;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmLucratividade.rgTipoLucratividadeClick(Sender: TObject);
begin
  gbLucratividadeUnitaria.Visible := rgTipoLucratividade.ItemIndex = 1;
  gbLucratividadeTotal.Visible := rgTipoLucratividade.ItemIndex = 0;
end;

function TfrmLucratividade.rateioDescAcres: boolean;
var
	vReqNo: integer;
  vSomaProdutoDesconto: real;
begin
	try
    try
    	Result := True;
    	vDadosIni.abreStatusProcessamento('Lucratividade', 'Efetuando Rateio nos itens da Venda!');
      if vLucrativadade.vItensVenda.IsEmpty then
      	Exit;
      vReqNo := vLucrativadade.vItensVenda.RecNo;
      
      vSomaProdutoDesconto := somaProdutosParaDesconto;

      vLucrativadade.vItensVenda.First;
      while not vLucrativadade.vItensVenda.Eof do
      begin
      	if (vLucrativadade.vItensVenda.FieldByName('PERMITIR_DESCONTO').AsString <> 'N') and
        (vLucrativadade.vItensVenda.FieldByName('EM_PROMOCAO').AsString <> 'S') and
        (vLucrativadade.vItensVenda.FieldByName('TABPRATICADA').AsString <> 'P') then
        begin
          vLucrativadade.vItensVenda.Edit;

          if (vSomaProdutoDesconto * vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsCurrency) > 0 then
            vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC').AsCurrency :=
              (ehDesconto.AsValue / vSomaProdutoDesconto *
              vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsCurrency)
          else
            vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC').AsCurrency := 0;

          if (vSomaProdutoDesconto > 0) and (vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsCurrency > 0) then
            vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC_UNITARIO').AsCurrency :=
              (ehDesconto.AsValue / vSomaProdutoDesconto *
              (vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsCurrency /
              vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsCurrency))
          else
            vLucrativadade.vItensVenda.FieldByName('RATEIO_DESC_UNITARIO').AsCurrency := 0;

          vLucrativadade.vItensVenda.Post;
        end;

        vLucrativadade.vItensVenda.Edit;

        vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC').AsCurrency :=
            (ehAcrescimo.AsValue / vLucrativadade.vVenda.FieldByName('TOT_PROD').AsFloat *
            vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsCurrency);

          vLucrativadade.vItensVenda.FieldByName('RATEIO_ACRESC_UNITARIO').AsCurrency :=
            (ehAcrescimo.AsValue / vLucrativadade.vVenda.FieldByName('TOT_PROD').AsFloat *
            (vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsCurrency /
            vLucrativadade.vItensVenda.FieldByName('QUANT_PED_ITEM').AsCurrency));

          vLucrativadade.vItensVenda.FieldByName('VLUN_LIQUIDO').AsCurrency :=
            getValorLiqParaMargem;

          vLucrativadade.vItensVenda.Post;

        vLucrativadade.vItensVenda.Next;
      end;
    except
    	on E: Exception do
      begin
        Result := False;
        vLucrativadade.registraErro(E.Message);
        ShowMessage(E.Message);
      end;
    end;
  finally
  	vLucrativadade.vItensVenda.RecNo := vReqNo;
    if (vSomaProdutoDesconto = 0) and (ehDesconto.AsValue <> 0) then
      ShowMessage('Nenhum produto permite desconto');
    if (vTemPrecoTabela) and (ehDesconto.AsValue <> 0) then
    	ShowMessage('Há Produtos com preço de Tabela, favor observar o desconto máximo permitido!');
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmLucratividade.SalvardadosnoExcelClick(Sender: TObject);
begin
  inherited;
	vDadosIni.montarExcel(DBGrid1, 'Lucratividade');
end;

function TfrmLucratividade.somaProdutosParaDesconto: real;
begin
	try
    try
      vDadosIni.abreStatusProcessamento('Lucratividade', 'Somando Produtos para Desconto!');
      Result := 0;
      vTemPrecoTabela := False;
      vLucrativadade.vItensVenda.First;
      while not vLucrativadade.vItensVenda.Eof do
      begin
         if (vLucrativadade.vItensVenda.FieldByName('PERMITIR_DESCONTO').AsString <> 'N') and
        (vLucrativadade.vItensVenda.FieldByName('EM_PROMOCAO').AsString <> 'S') and
        (vLucrativadade.vItensVenda.FieldByName('TABPRATICADA').AsString <> 'P') then
        	Result := Result + vLucrativadade.vItensVenda.FieldByName('VLTOT_PED_ITEM').AsFloat;

        if vLucrativadade.vItensVenda.FieldByName('TABPRATICADA').AsString = 'T' then
        	vTemPrecoTabela := True;

        vLucrativadade.vItensVenda.Next;
      end;
    except
      on E: Exception do
      begin
        Result := 0;
        vLucrativadade.registraErro(E.Message);
        ShowMessage(E.Message);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmLucratividade.SpeedButton1Click(Sender: TObject);
begin
  inherited;
	Close;
end;

procedure TfrmLucratividade.sbDNAClick(Sender: TObject);
var
  dna: TBasicosFormularios;
begin
  if not vDadosIni.PesqPros('BAS083', 'ABRIR', '', 'APURACAO_DEPTO', '', vLucrativadade.buscas, True)
    then
    Exit;
  inherited;
  dna.cadDNDEmpresa;
end;

function TfrmLucratividade.verificaDNA: boolean;
begin
 	Result := True;
	if not vLucrativadade.vProd.verificarDNA(vLucrativadade.vProd.vEmp.dataSet.FieldByName('CODDEPPRODUTOS').AsInteger) then
  begin
  	Application.MessageBox('Não Encontrado a fórmula do DNA do DEPTO/EMPRESA','Atenção',MB_OK+MB_ICONINFORMATION);
    Result := False;
  end
  else
  begin
  	edDNA.Text := StringReplace(vLucrativadade.vProd.vDNA, ' ', '', [rfReplaceAll]);
    edDepartamento.Text := vLucrativadade.vProd.VDepto;
    edAnoMesApuracao.Text := vDadosIni.StrZero(vLucrativadade.vProd.vmesap,2)+'/'+
    IntToStr(vLucrativadade.vProd.vanoap);
  end;
end;

initialization
  RegisterClass(TfrmLucratividade);
finalization
  UnRegisterClass(TfrmLucratividade);

end.
