unit uImpPedVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, RDprint, DBCtrls, ExtCtrls, IBQuery, 
  UClassesPedVenda;

type
  TfrmImpPedVenda = class(TfrmPadrao)
    ComboBox1: TComboBox;
    rdPedido: TRDprint;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBMemo3: TDBMemo;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo4: TDBMemo;
    ComboBox2: TComboBox;
    BitBtn3: TBitBtn;
    CheckOSExterna: TCheckBox;
    ckSelecionados: TCheckBox;
    ckNomeFantasia: TCheckBox;
    ckImprimirChassi: TCheckBox;
    ckImprimirDuasVias: TCheckBox;
    ckDuasViasPorFolha: TCheckBox;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    ckImprimirItensOrdemAlf: TCheckBox;
    ckNaoImprimirItensCancelados: TCheckBox;
    imgInformation: TImage;
    SpeedButtonWhatsApp: TSpeedButton;
    SpeedButton59: TSpeedButton;
    ckExibirImgProd: TCheckBox;
    ckNaoImprimirTotal: TCheckBox;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox3: TComboBox;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ckExibirImgProdClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure montarCombobox2;
    procedure montarCombobox3;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    FAgentsAndFiles: TStrings;
    FLinhasRDprint: TStrings;
    FisOS: Boolean;

    procedure HandlePrintList;
  public
  	nped: Integer;
  	tipo: string;
    cadped: TPedVenda;
  	buscas: TIBQuery;
    property AgentsAndFiles: TStrings read FAgentsAndFiles write FAgentsAndFiles;
    property LinhasRDprint: TStrings read FLinhasRDprint write FLinhasRDprint;
    property isOS: Boolean read FisOS write FisOS;
  end;

var
  frmImpPedVenda: TfrmImpPedVenda;


implementation

uses uDtmPedVenda, uDtmAtivo, UOSHonda, StrUtils,
  config_sistema_class;

{$R *.dfm}

procedure TfrmImpPedVenda.BitBtn3Click(Sender: TObject);
begin
  inherited;
  try
    cadped.imprimirOSPadraoHonda(nped, tipo);
{    if dtm02.QRYempresaDECL_OBS_OS.value = 'S' then
    begin
      if messagedlg('Imprime Declaração no Verso da Folha?', mtconfirmation, [mbYES, mbNO], 0) = mrYES then
      begin
        if valtimp = 'S' then
        begin
          FrModImpG.showmodal;
          ModImp(RdObs, FrmodImpG.Combobox1.text);
        end
        else
          ModImp(RdObs, vimp_us);
        linha := 4;
        RdObs.abrir;
        for i := 0 to dbmemo4.lines.Count - 1 do
        begin
          RdObs.Imp(linha, 1, dbmemo4.lines[i]);
          linha := linha + 1;
          if linha >= 60 then
          begin
            linha := 1;
            RdObs.Novapagina;
          end
        end;
        RdObs.Fechar;
      end;
    end;}
//    Screen.Cursor := crHourGlass;
    //  if PesqPros('HW228') then
    //  begin

//    if FrmOsHonda = nil then
//     Application.CreateForm(TFrmOsHonda, FrmOsHonda);
//    if vDadosIni.vEmp.vUsarDAVOS = 'S' then
//      FrmOsHonda.QRLabel18.Caption := 'DOCUMENTO AUXILIAR DE VENDA - ORDEM DE SERVIÇO'
//    else
//      FrmOsHonda.QRLabel18.Caption := 'ORDEM DE SERVIÇO';
//
//    FrmOsHonda.QuickRep1.preview;

    //  showmodal;
    //  end;
  finally
//    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmImpPedVenda.BitBtn4Click(Sender: TObject);
begin
	try
    inherited;
    ComboBox1.ItemIndex := ComboBox1.ItemIndex;
    ComboBox2.ItemIndex := ComboBox2.ItemIndex;
    ComboBox3.ItemIndex := ComboBox3.ItemIndex;

    cadped._setarDadosImpressao;

    ModalResult := mrOk;
  finally
    _GravaConfiguracoesBoolean(ckNomeFantasia.Name + cadped.getTipoVenda, ckNomeFantasia.Checked);
    _GravaConfiguracoesBoolean(ckImprimirChassi.Name + cadped.getTipoVenda, ckImprimirChassi.Checked);
    _GravaConfiguracoesBoolean(ckImprimirDuasVias.Name + cadped.getTipoVenda, ckImprimirDuasVias.Checked);

    _GravaConfiguracoesBoolean(ckDuasViasPorFolha.Name + cadped.getTipoVenda, ckDuasViasPorFolha.Checked);

    _GravaConfiguracoesBoolean(ckImprimirItensOrdemAlf.Name + cadped.getTipoVenda, ckImprimirItensOrdemAlf.Checked);

    if ckNaoImprimirItensCancelados.Visible then
      _GravaConfiguracoesBoolean(ckNaoImprimirItensCancelados.Name + cadped.getTipoVenda, ckNaoImprimirItensCancelados.Checked);

    if cadped.getTipoVenda = 'REQ' then
      if ckNaoImprimirTotal.Visible then
        _GravaConfiguracoesBoolean(ckNaoImprimirTotal.Name + cadped.getTipoVenda, ckNaoImprimirTotal.Checked);

    _GravaConfiguracoesString(ComboBox1.Name + cadped.getTipoVenda, trim(ComboBox1.Text));
    _GravaConfiguracoesString(ComboBox2.Name + cadped.getTipoVenda, trim(ComboBox2.Text));
    _GravaConfiguracoesString(ComboBox3.Name + cadped.getTipoVenda, trim(ComboBox3.Text));

  	_GravaConfiguracoesBoolean(ckExibirImgProd.Name + cadped.getTipoVenda, ckExibirImgProd.Checked);
  end;
end;

procedure TfrmImpPedVenda.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmImpPedVenda.ckExibirImgProdClick(Sender: TObject);
begin
  inherited;
	if (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 1')	or (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 2') then
  	_GravaConfiguracoesBoolean(ckExibirImgProd.Name + cadped.getTipoVenda, ckExibirImgProd.Checked);
end;

procedure TfrmImpPedVenda.ComboBox1Change(Sender: TObject);
begin
  inherited;
  ckImprimirDuasVias.Visible := (ComboBox1.Text <> 'AVANÇADO');
  ckDuasViasPorFolha.Visible := (ComboBox1.Text <> 'AVANÇADO');

  montarCombobox2;
  montarCombobox3;
end;

procedure TfrmImpPedVenda.ComboBox1Exit(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesString(ComboBox1.Name + cadped.getTipoVenda, trim(ComboBox1.Text));

  montarCombobox3;
end;

procedure TfrmImpPedVenda.ComboBox2Change(Sender: TObject);
begin
  inherited;
	ComboBox2Exit(Sender);
end;

procedure TfrmImpPedVenda.ComboBox2Exit(Sender: TObject);
begin
  inherited;
  if StartsText('Nao Fiscal', ComboBox1.Text) then
    if ComboBox2.ItemIndex >= 0 then
      _GravaConfiguracoesString('AgentsAndFiles' + cadped.getTipoVenda, ComboBox2.Items[ComboBox2.ItemIndex]);

  if (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 1')
  	or (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 2') then
    	_GravaConfiguracoesString(ComboBox2.Name + cadped.getTipoVenda, trim(ComboBox2.Text));

  montarCombobox3;
end;

procedure TfrmImpPedVenda.ComboBox3Exit(Sender: TObject);
begin
  inherited;
	if (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'DETALHADO')
    or (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 1')
  	or (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 2') then
    	_GravaConfiguracoesString(ComboBox3.Name + cadped.getTipoVenda, trim(ComboBox3.Text));
end;

procedure TfrmImpPedVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(FAgentsAndFiles) then
  	FreeAndNil(FAgentsAndFiles);
  if Assigned(FLinhasRDprint) then
  	FreeAndNil(FLinhasRDprint);
  Action := caFree;
  if (frmImpPedVenda <> nil) then
  	frmImpPedVenda := nil;
end;

procedure TfrmImpPedVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	Self.fechar := True;
  inherited;
end;

procedure TfrmImpPedVenda.FormCreate(Sender: TObject);
begin
  inherited;
  FAgentsAndFiles := TStringList.Create;
  FLinhasRDprint := TStringList.Create;
end;

procedure TfrmImpPedVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ckSelecionados.Checked := not ckSelecionados.Checked
  else if key = VK_F3 then
    ckImprimirChassi.Checked := not ckImprimirChassi.Checked
  else if key = VK_F5 then
    ckNomeFantasia.Checked := not ckNomeFantasia.Checked
  else if key = VK_F6 then
    CheckOSExterna.Checked := not CheckOSExterna.Checked
  else if key = VK_F7 then
    ckImprimirDuasVias.Checked := not ckImprimirDuasVias.Checked
  else if key = VK_F8 then
    ckDuasViasPorFolha.Checked := not ckDuasViasPorFolha.Checked
  else if key = VK_F10 then
    ckImprimirItensOrdemAlf.Checked := not ckImprimirItensOrdemAlf.Checked
  else if key = VK_F11 then
    BitBtn4.Click
  else if key = VK_ESCAPE then
    BitBtn5.Click;
end;

procedure TfrmImpPedVenda.FormShow(Sender: TObject);
begin
  inherited;
  if (cadped.getTipoVenda = 'OS') or (cadped.getTipoVenda = 'ORC') then
    ckImprimirChassi.Checked := _LerConfiguracoesRegistroBoolean(ckImprimirChassi.Name + cadped.getTipoVenda);

  ckNomeFantasia.Checked          := _LerConfiguracoesRegistroBoolean(ckNomeFantasia.Name + cadped.getTipoVenda);
  ckImprimirDuasVias.Checked      := _LerConfiguracoesRegistroBoolean(ckImprimirDuasVias.Name + cadped.getTipoVenda);

  ckDuasViasPorFolha.Checked      := _LerConfiguracoesRegistroBoolean(ckDuasViasPorFolha.Name + cadped.getTipoVenda);

  ckImprimirItensOrdemAlf.Checked := _LerConfiguracoesRegistroBoolean(ckImprimirItensOrdemAlf.Name + cadped.getTipoVenda);
  CheckOSExterna.Checked := (trim(cadped.dataSet.FieldByName('TIPO_OS').AsString) = 'EXTERNA') and (cadped.getTipoVenda = 'OS');
  CheckOSExterna.Visible := (trim(cadped.dataSet.FieldByName('TIPO_OS').AsString) = 'EXTERNA') and (cadped.getTipoVenda = 'OS');

  if ckNaoImprimirItensCancelados.Visible then
    ckNaoImprimirItensCancelados.Checked := _LerConfiguracoesRegistroBoolean(ckNaoImprimirItensCancelados.Name + cadped.getTipoVenda);

  if ckNaoImprimirTotal.Visible then
  	ckNaoImprimirTotal.Checked := _LerConfiguracoesRegistroBoolean(ckNaoImprimirTotal.Name + cadped.getTipoVenda);

  LinhasRDprint.Clear;
  LinhasRDprint.Add('A5 (33 Linhas)');
  LinhasRDprint.Add('A4 (66 Linhas)');

  if ComboBox1.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox1.Name + cadped.getTipoVenda)) >= 0 then
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox1.Name + cadped.getTipoVenda))
  else
    ComboBox1.ItemIndex := 0;

  montarCombobox2;
  montarCombobox3;

  if (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 1')	or (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 2') then
	  if ComboBox2.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox2.Name + cadped.getTipoVenda)) >= 0 then
    	ComboBox2.ItemIndex := ComboBox2.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox2.Name + cadped.getTipoVenda))
    else
	    ComboBox2.ItemIndex := 0;

  if ComboBox3.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox3.Name + cadped.getTipoVenda)) >= 0 then
    ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox3.Name + cadped.getTipoVenda))
  else
    ComboBox3.ItemIndex := 0;

  if (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 1')	or (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 2') then
  	ckExibirImgProd.Checked := _LerConfiguracoesRegistroBoolean(ckExibirImgProd.Name + cadped.getTipoVenda)
  else
  	ckExibirImgProd.Checked := false;

  imgInformation.Hint := 'Configurações' + #13 + #13 +
    'Processo "VND139" IMPRIMIR ITENS CANCELADOS ' + #13 +
    'Processo "VND140" IMPRIMIR OBSERVACAO NO ORC' + #13 +
    'Processo "VND154" IMPRIMIR ITENS CONSIGNADOS E CANCELADOS' + #13 +
    'Processo "VND155" IMPRIMIR OBSERVACAO LIVRO DE REGISTRO OS/ORC' + #13 +
    'Processo "VND196" IMPRIMIR VALOR DE DESCONTO/ACRESCIMO' + #13 +
    'Processo "VND296" IMPRIMIR SEMPRE QTDE E VALOR DE PECAS E SERVICOS' + #13 +
    'Config.ini [Automacao] "MinutaEntrega" IMPRIMIR MINUTA DE ENTREGA';// + #13 +
//    'Na engrenagem da venda "ped_vnd_exibir_unidade" EXIBIR UNIDADE NO ITEM' + #13 +
//    'Na engrenagem da venda "ped_vnd_exibir_form_pag" EXIBIR FORM PAG';
end;

procedure TfrmImpPedVenda.HandlePrintList;
begin
  if StartsText('Nao Fiscal', ComboBox1.Text) then
  begin
    ComboBox2.Enabled := True;
    ComboBox2.ItemIndex := -1;
    ComboBox2.Items.Text := AgentsAndFiles.Text;
    if _LerConfiguracoesRegistroString('AgentsAndFiles' + cadped.getTipoVenda) <> '' then
      if ComboBox2.Items.IndexOf(_LerConfiguracoesRegistroString('AgentsAndFiles' + cadped.getTipoVenda)) >= 0 then
        ComboBox2.ItemIndex := ComboBox2.Items.IndexOf(_LerConfiguracoesRegistroString('AgentsAndFiles' + cadped.getTipoVenda));

    if ComboBox2.ItemIndex = -1 then
      ComboBox2.ItemIndex := 0;
  end
  else
  begin
    ComboBox2.Items.Text := LinhasRDprint.Text;

    if ComboBox2.Enabled then
      if trim(vdadosini.vQtdLinhasReq) = '33' then
        ComboBox2.ItemIndex := 0
      else
        ComboBox2.ItemIndex := 1;
  end;
end;

procedure TfrmImpPedVenda.montarCombobox2;
var
	ConfigImp: TConfig_sistema_class;
  vExibirLocacaoLinhaAdc: string;
  vExibirAplicacaoLinhaAdc: string;
  I: Integer;
begin                                                                     
	if (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 1') or (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 2') then
  begin
  	ckSelecionados.Enabled     := false;
    ckImprimirDuasVias.Enabled := true;
    ckDuasViasPorFolha.Enabled := true;
    ckExibirImgProd.Enabled    := true;
    ComboBox2.Enabled          := true;

    vExibirLocacaoLinhaAdc     := 'N';
    vExibirAplicacaoLinhaAdc   := 'N';
    ConfigImp := TConfig_sistema_class.getConf('ped_vnd_impressao', buscas, vDadosIni.cod_empresa);

    if (UpperCase(ConfigImp.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')) = 'S') or (UpperCase(ConfigImp.ReadString('IMPRESSAO', 'ExibirLocacaoLinhaAdc')) = 'SIM') then
    	vExibirLocacaoLinhaAdc   := 'S';

    if (UpperCase(ConfigImp.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')) = 'S') or (UpperCase(ConfigImp.ReadString('IMPRESSAO', 'ExibirAplicacaoLinhaAdc')) = 'SIM') then
    	vExibirAplicacaoLinhaAdc := 'S';

    ComboBox2.Clear;

    // Uma opção
    ComboBox2.Items.Add('REDUZIDO');

    ComboBox2.Items.Add('DETALHADO');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO APLICACAO');

    if (vDadosIni.vImpDavAvancado1Avancado2.ExibirDescAcresItem <> 'N')
    	and (vDadosIni.vImpDavAvancado1Avancado2.ExibirDescAcresItem <> 'NENHUM') then
    		ComboBox2.Items.Add('DETALHADO DESCONTO E ACRESCIMO');

    if (vDadosIni.vImpDavAvancado1Avancado2.ExibirDescAcresItem <> 'N')
    	and (vDadosIni.vImpDavAvancado1Avancado2.ExibirDescAcresItem <> 'NENHUM') then
    		ComboBox2.Items.Add('DETALHADO DESCONTO OU ACRESCIMO');

    if vExibirLocacaoLinhaAdc <> 'S' then
	  	ComboBox2.Items.Add('DETALHADO LOCACAO 1');

		if vExibirLocacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO LOCACAO 2');

    if vExibirLocacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO LOCACAO DEP');

    ComboBox2.Items.Add('DETALHADO MARCA');

    ComboBox2.Items.Add('DETALHADO NCM');

    ComboBox2.Items.Add('DETALHADO PESO');

    ComboBox2.Items.Add('DETALHADO UNIDADE');

    // Duas opções
    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO APLICACAO E NCM');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO APLICACAO E PESO');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO APLICACAO E UNIDADE');

    if vExibirLocacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO LOCACAO 1 E LOCACAO 2');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO MARCA E APLICACAO');

    ComboBox2.Items.Add('DETALHADO MARCA E NCM');

    ComboBox2.Items.Add('DETALHADO MARCA E PESO');

    ComboBox2.Items.Add('DETALHADO MARCA E UNIDADE');

  	ComboBox2.Items.Add('DETALHADO NCM E UNIDADE');

    ComboBox2.Items.Add('DETALHADO PESO E NCM');

    ComboBox2.Items.Add('DETALHADO PESO E UNIDADE');

    // Três opções
    if (vExibirAplicacaoLinhaAdc <> 'S') and (vExibirLocacaoLinhaAdc <> 'S') then
	    ComboBox2.Items.Add('DETALHADO APLICACAO, LOCACAO 1 E LOCACAO 2');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO APLICACAO, NCM E PESO');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO APLICACAO, NCM E UNIDADE');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO APLICACAO, PESO E UNIDADE');

    if vExibirLocacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO LOCACAO 1, LOCACAO 2 E LOCACAO DEP');

    if vExibirLocacaoLinhaAdc <> 'S' then
  	  ComboBox2.Items.Add('DETALHADO LOCACAO 1, LOCACAO 2 E PESO');

    if vExibirLocacaoLinhaAdc <> 'S' then
  	  ComboBox2.Items.Add('DETALHADO LOCACAO 1, LOCACAO 2 E UNIDADE');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO MARCA, APLICACAO E PESO');

    if vExibirAplicacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO MARCA, APLICACAO E UNIDADE');

    if vExibirLocacaoLinhaAdc <> 'S' then
	    ComboBox2.Items.Add('DETALHADO MARCA, LOCACAO 1 E LOCACAO 2');

    ComboBox2.Items.Add('DETALHADO MARCA, NCM E PESO');

    ComboBox2.Items.Add('DETALHADO MARCA, NCM E UNIDADE');

    ComboBox2.Items.Add('DETALHADO NCM, PESO E UNIDADE');

    ComboBox2.Items.Add('DETALHADO IMAGEM');

    ComboBox2.Items.Add('DETALHADO IMAGEM E APLICACAO');

    ComboBox2.Items.Add('DETALHADO IMAGEM E LOCACAO 1');

    ComboBox2.Items.Add('DETALHADO IMAGEM E LOCACAO 2');

    ComboBox2.Items.Add('DETALHADO IMAGEM E LOCACAO DEP');

    ComboBox2.Items.Add('DETALHADO IMAGEM E MARCA');

    ComboBox2.Items.Add('DETALHADO IMAGEM E NCM');

    ComboBox2.Items.Add('DETALHADO IMAGEM E PESO');

    ComboBox2.Items.Add('DETALHADO IMAGEM E UNIDADE');

    if ComboBox2.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox2.Name + cadped.getTipoVenda)) >= 0 then
      ComboBox2.ItemIndex := ComboBox2.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox2.Name + cadped.getTipoVenda))
    else
      ComboBox2.ItemIndex := 0;

    ckExibirImgProd.Checked := _LerConfiguracoesRegistroBoolean(ckExibirImgProd.Name + cadped.getTipoVenda);
  end
  else
  begin
  	ckSelecionados.Enabled := true;
    ckImprimirDuasVias.Enabled := (trim(ComboBox1.Items[ComboBox1.ItemIndex]) <> 'RECIBO LOCAÇÃO');
    ckDuasViasPorFolha.Enabled := (trim(ComboBox1.Items[ComboBox1.ItemIndex]) <> 'RECIBO LOCAÇÃO');
    ckExibirImgProd.Enabled    := false;
    ComboBox2.ItemIndex        := -1;
    ComboBox2.Enabled          := not isOS;
    ComboBox2.Clear;
    ComboBox2.Items.Add('A5 (33 Linhas)');
		ComboBox2.Items.Add('A4 (66 Linhas)');

    ckExibirImgProd.Checked    := false;

    HandlePrintList;
  end;
end;

procedure TfrmImpPedVenda.montarCombobox3;
begin
	inherited;
	if (trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'DETALHADO')
  	or ((trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 1') and (trim(ComboBox2.Items[ComboBox2.ItemIndex]) <> 'REDUZIDO'))
    or ((trim(ComboBox1.Items[ComboBox1.ItemIndex]) = 'AVANÇADO 2') and (trim(ComboBox2.Items[ComboBox2.ItemIndex]) <> 'REDUZIDO')) then
  begin
  	Label3.Font.Color := clWindowText;
    Label3.Enabled    := true;
  	ComboBox3.Enabled := true;
    ComboBox3.Clear;

    ComboBox3.Items.Add('GRUPO E CODIGO');

    ComboBox3.Items.Add('CODIGO');

    ComboBox3.Items.Add('NUMERO DE FABRICANTE');

    ComboBox3.Items.Add('VALOR INFORMADO');

    if ComboBox3.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox3.Name + cadped.getTipoVenda)) >= 0 then
      ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(_LerConfiguracoesRegistroString(ComboBox3.Name + cadped.getTipoVenda))
    else
      ComboBox3.ItemIndex := 0;
  end
  else
  begin
    Label3.Font.Color := cl3DLight;
  	Label3.Enabled    := false;
    ComboBox3.Enabled := false;
    ComboBox3.Clear;
  end;
end;

procedure TfrmImpPedVenda.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('ped_vnd_impressao_recibo_locacao', buscas);
  montarCombobox2;
  montarCombobox3;
end;

procedure TfrmImpPedVenda.SpeedButton2Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('ped_vnd_imp_dav', buscas);
  montarCombobox2;
  montarCombobox3;
end;

procedure TfrmImpPedVenda.SpeedButton59Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('ped_vnd_impressao_dav_v7', buscas);
  montarCombobox2;
  montarCombobox3;
end;

end.

