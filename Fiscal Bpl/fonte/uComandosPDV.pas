unit uComandosPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, Buttons, Mask, ComCtrls, Menus, ActnList,
  uEditHw ;

type
  TsintegraPAFECF = function (comveic, vendBanco: PChar; codempresa: integer; vversao: Pchar; vdtini, vdtfinal, vNomeArquivo: Pchar): string; stdcall;
  TfrmComandosPDV = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    RadioGroup1: TRadioGroup;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    TabSheet2: TTabSheet;
    TabSheet8: TTabSheet;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    GroupBox5: TGroupBox;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Label5: TLabel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup5: TRadioGroup;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    RadioGroup7: TRadioGroup;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    TabSheet5: TTabSheet;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    RadioGroup9: TRadioGroup;
    Label13: TLabel;
    Timer1: TTimer;
    ActionList1: TActionList;
    Edit1: TEditFiscal;
    tsIndTec: TTabSheet;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    RadioGroup8: TRadioGroup;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RadioGroup10: TRadioGroup;
    Label14: TLabel;
    Edit2: TEdit;
    tsVendasPeriodo: TTabSheet;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    RadioGroup12: TRadioGroup;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Label17: TLabel;
    Label18: TLabel;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    RadioGroup11: TRadioGroup;
    BitBtn19: TBitBtn;
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure RadioGroup10Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RadioGroup7Click(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure RadioGroup5Exit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure RadioGroup4Exit(Sender: TObject);
    procedure RadioGroup6Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    tipoImpOuArq, completaSimplificada: string;
    function _sintegraPAFECF(comveic, vendBanco: PChar; codempresa: integer; vversao: Pchar; vdtini, vdtfinal, vNomeArquivo: Pchar): string;
    function _gerarLFDPAFECF(pCodEmpresa, pEnderecoBanco, vDataIni, vDataFim, pNomeArquivo, pNomeShow: PChar): string;
  public
    { Public declarations }
  end;

var
  frmComandosPDV: TfrmComandosPDV;

implementation

uses
  uPrincipalF, uDtmDAVF, uClasseDAVF, UAnexoIIIDavs, UdtmAtivo , uDtmFiscal,
  uDadosIni, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmComandosPDV.BitBtn13Click(Sender: TObject);
var
  cImpArq:string;
  nowStr: string;
	vNomeArq: String;
	vNomeShow: string;
begin
	inherited;
	try
		Screen.Cursor := crHourGlass;

		vDadosIniF.GravaAuditoria('FIS039', 'RELATORIO','','','');

		nowStr := DateTimeToStr(now);
		nowStr := StringReplace(nowStr, '/', '', [rfReplaceAll, rfIgnoreCase]);
		nowStr := StringReplace(nowStr, ':', '', [rfReplaceAll, rfIgnoreCase]);
		nowStr := StringReplace(nowStr, ' ', '', [rfReplaceAll, rfIgnoreCase]);
		if RadioGroup12.Items.Count = 1 then
		begin
			vNomeShow := vDadosIniF.vPathArquivosDigitais + '\' + Trim(vDadosIniF.vNumeroLaudoPAFECF)+nowStr+'.txt';
			vNomeArq := ExtractFilePath(Application.ExeName) + 'lfd.txt';
		end
		else
			vNomeArq := vDadosIniF.vPathArquivosDigitais + '\' + Trim(vDadosIniF.vNumeroLaudoPAFECF)+nowStr+'.txt';

		if RadioGroup12.Items.Count = 1 then
		begin
			try
				_gerarLFDPAFECF(pchar(vDadosIniF.codEmpresa),pchar(vDadosIniF.vBancoHW),
					pchar(MaskEdit9.Text), pchar(MaskEdit10.Text),pchar(vNomeArq), pchar(vNomeShow))
			except
			end;
			if FileExists(vNomeArq) then
			begin
				CopyFile(PChar(vNomeArq), PChar(vNomeShow), False);
				if FileExists(vNomeShow) then
					vDadosIniF.gerarMD5ArquivoEletronico(vNomeShow);

				Application.MessageBox(pchar('Arquivo "LFD Ato COTEPE ICMS 35/2005: criado com sucesso'+ #13 +
				'O arquivo foi salvo em: ' + vNomeShow),'Atenção',0+64);
			end;

    end
    else if RadioGroup12.ItemIndex = 0 then
    begin

      if FileExists(_sintegraPAFECF('N', pchar(vDadosIniF.vBancoHW),
        StrToInt(vDadosIniF.codEmpresa),
        pchar(vDadosIniF.vVersaoFiscal), pchar(MaskEdit9.Text),
        pchar(MaskEdit10.Text),pchar(vNomeArq))) then
        vDadosIniF.gerarMD5ArquivoEletronico(vNomeArq);

    end
    else
    begin

//      if FileExists(hw_gerarEFD_ICMSIPI_PAFECF((vDadosIniF.codEmpresa),(vDadosIniF.vBancoHW),
//        (MaskEdit9.Text), (MaskEdit10.Text),(vNomeArq), (vDadosIniF.vNomeUsuario), (IntToStr((vDadosIniF.vNivel))))) then
//        vDadosIniF.gerarMD5ArquivoEletronico(vNomeArq);

    end;
  finally
    vDadosIniF.conectaBanco(dtmAtivo.bancoFiscal, vDadosIniF.vBancoFiscal, true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmComandosPDV.BitBtn17Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Label9.Visible := true;
    Self.Refresh;
    vDadosIniF.MensagemFiscal('Aguarde...');
    try
      if (trim(MaskEdit8.Text) = '  /  /    ') or (trim(MaskEdit7.Text) = '  /  /    ') then
        raise exception.create('Campos com preenchimento obrigatório');

      if (trim(MaskEdit8.Text) = '') or (trim(MaskEdit7.Text) = '') then
        raise exception.create('Campos com preenchimento obrigatório');

      vDadosIniF.MensagemFiscal('Aguarde! Espelho MFD...');
      if RadioGroup4.ItemIndex = 0 then
        vDadosIniF.espelhoMFD(MaskEdit8.Text, MaskEdit7.Text)
      else
        vDadosIniF.espelhoMFD(StrToInt(MaskEdit8.Text), StrToInt(MaskEdit7.Text));
      //Application.MessageBox('Espelho concluído!', 'Informação', MB_ICONINFORMATION + MB_OK);
      vDadosIni.GravaAuditoria('FIS028','RELATÓRIO','EMISSÃO DE ESPELHO MFD.','','');
      close;
    except on e: exception do begin
        Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + MB_OK);
        vDadosIni.GravaAuditoria('FIS028','RELATÓRIO','ERRO NA EMISSÃO DE ESPELHO MFD.','','');
        MaskEdit8.SetFocus;
      end;
    end;
  finally
    vDadosIniF.limpaMensagem;
    Screen.Cursor := crDefault;
    Label9.Visible := false;
  end;
end;

procedure TfrmComandosPDV.BitBtn19Click(Sender: TObject);
begin
  inherited;
  obTef.AbreFormTransacoes;
end;

procedure TfrmComandosPDV.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Label4.Visible := true;
    Self.Refresh;
    vDadosIniF.MensagemFiscal('Aguarde...');
    try
      if (trim(MaskEdit1.Text) = '  /  /    ') or (trim(MaskEdit2.Text) = '  /  /    ') then
        raise exception.create('Campos com preenchimento obrigatório');

      if (trim(MaskEdit1.Text) = '') or (trim(MaskEdit2.Text) = '') then
        raise exception.create('Campos com preenchimento obrigatório');

      if RadioGroup2.ItemIndex = 0 then
        completaSimplificada := 'c'
      else
        completaSimplificada := 's';

      if RadioGroup3.ItemIndex = 0 then
        tipoImpOuArq := 'IMP'
      else
        tipoImpOuArq := 'ARQ';
      vDadosIniF.MensagemFiscal('Aguarde! Leitura Memória Fiscal...');
      if RadioGroup6.ItemIndex = 0 then
        vDadosIniF.leituraMeroriaFiscal(MaskEdit1.Text, MaskEdit2.Text, tipoImpOuArq,
          completaSimplificada)
      else
        vDadosIniF.leituraMeroriaFiscal(StrToInt(MaskEdit1.Text), StrToInt(MaskEdit2.Text),
          tipoImpOuArq,
          completaSimplificada);
      vDadosIni.GravaAuditoria('FIS026','RELATÓRIO','EMISSÃO DE LEITURA DE MEMÓRIA FISCAL.','','');
      close;
    except on e: exception do begin
        Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + MB_OK);
        MaskEdit1.SetFocus;
      end;
    end;
  finally
    vDadosIniF.limpaMensagem;
    Screen.Cursor := crDefault;
    Label4.Visible := false;
  end;
end;

procedure TfrmComandosPDV.BitBtn23Click(Sender: TObject);
var
  vTipo: string;
begin
  inherited;
  try
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Self.Refresh;
    vDadosIniF.MensagemFiscal('Aguarde...');
    try
      if (trim(MaskEdit4.Text) = '  /  /    ') or (trim(MaskEdit3.Text) = '  /  /    ') then
        raise exception.create('Campos com preenchimento obrigatório');

      if (trim(MaskEdit4.Text) = '') or (trim(MaskEdit3.Text) = '') then
        raise exception.create('Campos com preenchimento obrigatório');

      if RadioGroup11.ItemIndex = 0 then
        vTipo := 'MFD'
      else
        vTipo := 'MF';

      vDadosIniF.MensagemFiscal('Aguarde! Arquivo COTEPE 1704...');
      if RadioGroup5.ItemIndex = 0 then
        vDadosIniF.gerarArquivoCotepe1704(MaskEdit4.Text, MaskEdit3.Text, vTipo)
      else
        vDadosIniF.gerarArquivoCotepe1704(StrToInt(MaskEdit4.Text), StrToInt(MaskEdit3.Text), vTipo);
      //Application.MessageBox('Arquivo MFD concluído!', 'Informação', MB_ICONINFORMATION + MB_OK);
      vDadosIni.GravaAuditoria('FIS029','RELATÓRIO','ARQUIVO ' + vTipo + ' GERADO','','');
      close;

    except on e: exception do begin
        Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + MB_OK);
         vDadosIni.GravaAuditoria('FIS029','RELATÓRIO','ERRO AO GERAR ARQUIVO MFD','','');
        MaskEdit4.SetFocus;
      end;
    end;
  finally
    vDadosIniF.limpaMensagem;
    Screen.Cursor := crDefault;
    Label3.Visible := false;
  end;
end;

procedure TfrmComandosPDV.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmComandosPDV.BitBtn4Click(Sender: TObject);
begin
  inherited;
  try
    BitBtn4.Enabled := false;
    Edit1.Enabled := false;
    Screen.Cursor := crHourGlass;
    Label13.Visible := true;
    Label13.Refresh;

    if RadioGroup7.ItemIndex = 0 then
    begin
     if not vDadosIni.PesqPros('FIS018', 'CANCELAR','CANCELAR TRANSAÇAO TEF','','')then
     exit;
       if vDadosIniF.vUsaTef = 'E' then
          obTef.operacaoAdministrativo(CImpressoraF, false)
        else
          obTef.operacaoCancelamentoTransacao(CImpressoraF)
      {application.messagebox(pchar('Operação não disponível'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK)}
    end
    else if (RadioGroup7.ItemIndex = 1) and (vDadosIniF.vUsaTef <> 'E') then
    Begin
     if not vDadosIni.PesqPros('FIS019','OPERAÇÃO TEF','OPERAÇÃO TEF ADMINISTRATIVO (AMEX-REDCARD-VISA)','','')then
     exit;
      obTef.operacaoAdministrativo(CImpressoraF, false);
    end
    else if (RadioGroup7.ItemIndex = 2) and (vDadosIniF.vUsaTef <> 'E') then
    begin
      if not vDadosIni.PesqPros('FIS020','OPERAÇÃO TEF','OPERAÇÃO TEF ADMINISTRATIVO TECBAN','','')then
     exit;
      obTef.operacaoAdministrativo(CImpressoraF, true);
    end;
    if obTef.vmens = '1' then
      obTef.cancelaBKP;
  finally
    Edit1.Enabled := true;
    BitBtn4.Enabled := true;
    Label13.Visible := false;
    Screen.Cursor := crDefault;
    obTef.forcaFocoNoSistema(Application.Handle);
    Timer1.Enabled := true;
  end;
end;

procedure TfrmComandosPDV.BitBtn5Click(Sender: TObject);
var
  ms: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Label12.Visible := true;
    Self.Refresh;
    vDadosIniF.MensagemFiscal('Aguarde...');
    if RadioGroup9.ItemIndex = 0 then
    begin
      if obVenda = nil then
        obVenda := TDAVF.create;
      if (MaskEdit5.Text = '  /  /    ') or
        (MaskEdit6.Text = '  /  /    ') then
      begin
        application.messagebox(pchar('Período informado inválido'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      Try
      obVenda.selecionaVendasDAVEmitidos(StrToDate(MaskEdit5.Text),
        StrToDate(MaskEdit6.Text));
      if not obVenda.dataSet.IsEmpty then
      begin
        vDadosIniF.MensagemFiscal('Aguarde! DAV''s Emitidos...');
        vDadosIniF.ImpDAVEmitidos;
        Application.MessageBox('Relatório de DAV''s Emitidos efetuado!', 'Informação', MB_ICONINFORMATION + MB_OK);
        vDadosIni.GravaAuditoria('FIS033','RELATÓRIO','RELATÓRIO DE DAV''s EMITIDOS GERADO','','');
        close;
      end
      else
      begin
        application.messagebox(pchar('Nenhum DAV encontrado no período informado'), 'Atenção',
          MB_ICONEXCLAMATION + mb_OK);
        exit;
      end;
      except on e: exception do
      begin
         vDadosIni.GravaAuditoria('FIS033','RELATÓRIO','ERRO AO EMITIR RELATÓRIO DE DAV''s EMITIDOS','','');
         application.messagebox(pchar('ERRO AO EMITIR RELATÓRIO: '+e.Message), 'Atenção',
         MB_ICONEXCLAMATION + mb_OK);
         exit;
      end;
      end;
    end
    else
    begin
      Application.CreateForm(TFrmAnexoIII, FrmAnexoIII);
      FrmAnexoIII.MaskEdit1.Text := MaskEdit5.Text;
      FrmAnexoIII.MaskEdit2.Text := MaskEdit6.Text;
      FrmAnexoIII.Show;
      FrmAnexoIII.Refresh;
      Sleep(500);
      FrmAnexoIII.Refresh;
      FrmAnexoIII.Show;
      FrmAnexoIII.BitBtn1Click(sender);
      FrmAnexoIII.Free;
      FrmAnexoIII := nil;
      close;
    end;
  finally
    vDadosIniF.limpaMensagem;
    Label12.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmComandosPDV.BitBtn7Click(Sender: TObject);
var
  cImpArq:string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Label16.Visible := true;
    Self.Refresh;
    vDadosIniF.MensagemFiscal('Aguarde...');

    if RadioGroup8.ItemIndex = 0 then
      cImpArq := 'I'
    else
      cImpArq := 'A';
    obCupom.indiceTecnicoDeProducao(cImpArq, Edit2.Text);
    Close;
  finally
    vDadosIniF.limpaMensagem;
    Label16.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmComandosPDV.Edit1Change(Sender: TObject);
begin
  inherited;
  try
    if Edit1.Text <> ' ' then
    begin
      try
        if (StrToInt(Edit1.Text) > 3) or (StrToInt(Edit1.Text) < 1) then
          Application.MessageBox(pchar('Opção Inválida'), 'Atenção', MB_ICONEXCLAMATION + MB_OK)
        else
          RadioGroup7.ItemIndex := StrToInt(Edit1.Text) - 1;
      except
        Application.MessageBox(pchar('Opção Inválida'), 'Atenção', MB_ICONEXCLAMATION + MB_OK)
      end;
    end;
  finally
    Edit1.SelectAll;
  end;
end;

procedure TfrmComandosPDV.Edit1Exit(Sender: TObject);
begin
  inherited;
  //  Edit1.SetFocus;
end;

procedure TfrmComandosPDV.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_return then
  begin
    if not BitBtn4.Enabled then
      Exit;
    try
      BitBtn4.Enabled := false;
      Screen.Cursor := crHourGlass;
      Label13.Visible := true;
      Label13.Refresh;

      if RadioGroup7.ItemIndex = 0 then
      begin
        if vDadosIniF.vUsaTef = 'E' then
          obTef.operacaoAdministrativo(CImpressoraF, false)
        else
          obTef.operacaoCancelamentoTransacao(CImpressoraF)
      end
        //application.messagebox(pchar('Operação não disponível'), 'Atenção', MB_ICONEXCLAMATION
        //  + mb_OK)

      else if (RadioGroup7.ItemIndex = 1) and (vDadosIniF.vUsaTef <> 'E') then
        obTef.operacaoAdministrativo(CImpressoraF, false)
      else if (RadioGroup7.ItemIndex = 2) and (vDadosIniF.vUsaTef <> 'E') then
        obTef.operacaoAdministrativo(CImpressoraF, true);
      if obTef.vmens = '1' then
        obTef.cancelaBKP;
    finally
      BitBtn4.Enabled := true;
      Label13.Visible := false;
      Screen.Cursor := crDefault;
      obTef.forcaFocoNoSistema(Application.Handle);
    end;
  end
  else if Key = VK_ESCAPE then
    close;
end;

procedure TfrmComandosPDV.Edit2Exit(Sender: TObject);
begin
  inherited;
  if Trim(Edit2.Text) = '' then
    Edit2.Text := vDadosIni.pesquisaRapida('PRODUTOS', ' and PRODUTOS.tipo_item = ''04'' ',
      'Pesquisa de produtos - Indice Técnico');
end;

procedure TfrmComandosPDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmComandosPDV := nil;
end;

procedure TfrmComandosPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close
  ELSE if Key =  VK_F3 then
  begin
    if PageControl1.ActivePage =  TabSheet1 then
      BitBtn1Click(sender)
    else if PageControl1.ActivePage =  TabSheet2 then
      BitBtn17Click(sender)
    else if PageControl1.ActivePage =  TabSheet3 then
      BitBtn4Click(sender)
    else if PageControl1.ActivePage =  TabSheet8 then
      BitBtn23Click(sender)
    else if PageControl1.ActivePage =  TabSheet5 then
      BitBtn5Click(sender)
    else if PageControl1.ActivePage =  tsIndTec then
      BitBtn7.Click;
  end;
end;

procedure TfrmComandosPDV.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  TabSheet1.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet5.TabVisible := false;
  tsIndTec.TabVisible := False;
  tsVendasPeriodo.TabVisible := False;
  Edit1.Text := '2';
  TabSheet8.TabVisible := false;
  if PageControl1.Tag = 1 then
  begin
    PageControl1.ActivePage := TabSheet1;
    MaskEdit1.SetFocus;
  end
  else if PageControl1.Tag = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    MaskEdit8.SetFocus;
  end
  else if PageControl1.Tag = 3 then
  begin

    PageControl1.ActivePage := TabSheet3;
    TabSheet3.Show;
    Edit1.SetFocus;

    if vDadosIniF.vUsaTef = 'E' then  // E = TEF Dedicado.
    begin
       RadioGroup7.Items.Clear;
//       RadioGroup7.Items.Add('1 - Cancelar Transação TEF');
       RadioGroup7.Items.Add('1 - Administrativo (Amex-RedeCard-Visa)');
       RadioGroup7.itemindex := 0;
       Edit1.Text := '1';
       Edit1.SetFocus;
    end;

  end
  else if PageControl1.Tag = 4 then
  begin
    PageControl1.ActivePage := TabSheet4;
  end
  else if PageControl1.Tag = 5 then
  begin
    PageControl1.ActivePage := TabSheet5;
    MaskEdit5.SetFocus;
  end
  else if PageControl1.Tag = 8 then
  begin
    PageControl1.ActivePage := TabSheet8;
    MaskEdit4.SetFocus;
  end
  else if PageControl1.Tag = 9 then
  begin
    PageControl1.ActivePage := tsIndTec;
    if BitBtn7.CanFocus then
      BitBtn7.SetFocus;
  end
  else if PageControl1.Tag = 10 then
  begin
    PageControl1.ActivePage := tsVendasPeriodo;
    if BitBtn13.CanFocus then
      BitBtn13.SetFocus;
  end;
  Top := Top - 200;
  for I := 0 to ComponentCount - 1 do
    if (Components[i] is TMaskEdit) then
      if (pos('  /  /    ', TMaskEdit(Components[i]).Text) > 0) or
        (pos('  -  -    ', TMaskEdit(Components[i]).Text) > 0) or
        (pos('  .  .    ', TMaskEdit(Components[i]).Text) > 0) then
          TMaskEdit(Components[i]).Text := datetostr(date);

  if vDadosIniF.GetIni('TEF', 'SW', '') = 'CAPPTA' then
    BitBtn19.Visible := True
  else
    BitBtn19.Visible := False;
end;

procedure TfrmComandosPDV.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmComandosPDV.MaskEdit5Exit(Sender: TObject);
begin
  inherited;
  Edit1.SetFocus;
end;

procedure TfrmComandosPDV.RadioGroup10Click(Sender: TObject);
begin
  inherited;
  if RadioGroup10.ItemIndex = 0 then
  begin
    Edit2.Enabled := False;
    Edit2.Text := 'TODOS';
  end
  else
  begin
    Edit2.Enabled := True;
    Edit2.Text := 'TODOS';
  end;
end;

procedure TfrmComandosPDV.RadioGroup4Exit(Sender: TObject);
begin
  inherited;
  if RadioGroup4.ItemIndex = 1 then
  begin
    MaskEdit8.EditMask := '';
    MaskEdit7.EditMask := '';
    Label6.Caption := 'COO Inicial:';
    Label5.Caption := 'COO Final:';
  end
  else
  begin
    MaskEdit8.EditMask := '!99/99/0000;1;_';
    MaskEdit7.EditMask := '!99/99/0000;1;_';
    Label6.Caption := 'Data Inicial:';
    Label5.Caption := 'Data Final:';
  end;
end;

procedure TfrmComandosPDV.RadioGroup5Exit(Sender: TObject);
begin
  inherited;
  if RadioGroup5.ItemIndex = 1 then
  begin
    MaskEdit4.EditMask := '';
    MaskEdit3.EditMask := '';
    Label2.Caption := 'COO Inicial:';
    Label1.Caption := 'COO Final:';
  end
  else
  begin
    MaskEdit4.EditMask := '!99/99/0000;1;_';
    MaskEdit3.EditMask := '!99/99/0000;1;_';
    Label2.Caption := 'Data Inicial:';
    Label1.Caption := 'Data Final:';
  end;
end;

procedure TfrmComandosPDV.RadioGroup6Exit(Sender: TObject);
begin
  inherited;
  if RadioGroup6.ItemIndex = 1 then
  begin
    MaskEdit1.EditMask := '';
    MaskEdit2.EditMask := '';
    Label7.Caption := 'Redução Inicial:';
    Label8.Caption := 'Redução Final:';
  end
  else
  begin
    MaskEdit1.EditMask := '!99/99/0000;1;_';
    MaskEdit2.EditMask := '!99/99/0000;1;_';
    Label7.Caption := '      Data Inicial:';
    Label8.Caption := '      Data Final:';
  end;
end;

procedure TfrmComandosPDV.RadioGroup7Click(Sender: TObject);
begin
  inherited;
  Edit1.Text := IntToStr(RadioGroup7.ItemIndex + 1);
  Edit1.SetFocus;
end;

procedure TfrmComandosPDV.Timer1Timer(Sender: TObject);
begin
  inherited;
  if Timer1.Enabled then
  begin
    try
      obTef.forcaFocoNoSistema(Application.Handle);
      if Edit1.Enabled then      
        Edit1.SetFocus;
    finally
      Timer1.Enabled := false;
    end;
  end;
end;

function TfrmComandosPDV._gerarLFDPAFECF(pCodEmpresa, pEnderecoBanco, vDataIni,
	vDataFim, pNomeArquivo, pNomeShow: PChar): string;
begin
//	Result := gerarLFDPAFECF(PChar(pCodEmpresa), PChar(pEnderecoBanco), PChar(vDataIni), PChar(vDataFim), PChar(pNomeArquivo), PChar(pNomeShow));
	Sleep(2000);
end;

function TfrmComandosPDV._sintegraPAFECF(comveic, vendBanco: PChar;
  codempresa: integer; vversao, vdtini, vdtfinal, vNomeArquivo: Pchar): string;
var
  hdDll: THandle;
  sintegraPAFECF: TsintegraPAFECF;
begin
  hdDll := 0;
  hdDll := LoadLibrary(Pchar('CompativelHW.dll'));
  if hdDll <> 0 then
  begin
    @sintegraPAFECF := GetProcAddress(hdDll, PChar('sintegraPAFECF'));
    Result := sintegraPAFECF(PChar(comveic), PChar(vendBanco), codempresa, PChar(vversao), PChar(vdtini), PChar(vdtfinal), PChar(vNomeArquivo));
    FreeLibrary(hdDll);
  end;
end;

end.

