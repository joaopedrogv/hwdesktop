unit uPOSVirtualTEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uEditHw, ExtCtrls, unFuncoesTEF,
  unFuncoesTEFDedicado;

type
  TfrmPOSVirtualTEF = class(TForm)
    Panel1: TPanel;
    pnTexto: TPanel;
    pnValor: TPanel;
    Label1: TLabel;
    EditHw1: TEditHw;
    pnBotoes: TPanel;
    pnTitulo: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    pnEscolhaOperacao: TPanel;
    pnEscolhaOperacaoDados: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    ListBox2: TListBox;
    EditHw2: TEditHw;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    lbCVencimento: TLabel;
    lbVencimento: TLabel;
    pnCartaoOuCarteira: TPanel;
    ListBox1: TListBox;
    Label2: TLabel;
    btCancela2: TBitBtn;
    btChangeOperation: TSpeedButton;
    procedure btChangeOperationClick(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnEscolhaOperacaoDadosEnter(Sender: TObject);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditHw2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    timerVenda: TTimer;
    vTefPOSVirtual: TTEFDedicado;

    CarteiraDigitalId: string;
    PSPId: string;
    procedure imprimeComprovanteTEF;
    procedure timerVerndaTimer(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmPOSVirtualTEF: TfrmPOSVirtualTEF;

implementation

uses
  uDtmAtivo, uDadosIni, RDprint, Math, hw_utils;

{$R *.dfm}

procedure TfrmPOSVirtualTEF.BitBtn1Click(Sender: TObject);
begin
  vDadosIni.vPOSV.debitoCreditoOutros := vDadosIni.retornoPorCondicao(ListBox2.ItemIndex = 1, 'D', 'C');
  vDadosIni.vPOSV.diasParaCredito := EditHw2.AsInteger;
  TForm(pnEscolhaOperacaoDados.Parent).ModalResult := IDOK
end;

procedure TfrmPOSVirtualTEF.btCancelarClick(Sender: TObject);
begin
  vDadosIni.vPOSV.retorno := retFalha;
  ModalResult := IDCANCEL;
end;

procedure TfrmPOSVirtualTEF.btChangeOperationClick(Sender: TObject);
begin
  pnCartaoOuCarteira.Align := alClient;
  pnCartaoOuCarteira.Visible := True;
  pnValor.Visible := False;
  pnBotoes.Visible := False;
  btChangeOperation.Visible := True;
  if ListBox1.CanFocus then
    ListBox1.SetFocus;
end;

procedure TfrmPOSVirtualTEF.btConfirmarClick(Sender: TObject);
var
  vQtdeCaractNDocADM: Smallint;
  confirmarDias: Boolean;
  valorOperacao: Double;
begin
  try
    btConfirmar.Enabled := False;
    btCancelar.Enabled := False;
    Screen.Cursor := crHourGlass;
    EditHw1.ReadOnly := True;
    valorOperacao := RoundTo(EditHw1.AsValue, -2);

    vDadosIni.vPOSV.IdPSP := '';
    vDadosIni.vPOSV.IdCarteiraDigital := '';
    //vDadosIni.vPOSV.controleIdCartDig := 0;

    if vDadosIni.vPOSV.operacao in [posCRT, posCRTDIG] then
    begin
      if (valorOperacao <= 0) then
      begin
        Application.MessageBox(Pchar('Valor da operação deve ser maior que 0'), 'Atenção', MB_ICONERROR + MB_OK);
        if EditHw1.CanFocus then
          EditHw1.SetFocus;
        Exit;
      end;      

      case vDadosIni.vPOSV.operacao of
        posCRT:
          begin
            {$REGION 'Venda Cartao'}
            if not vTefPOSVirtual.venda(2, StrToIntDef(vDadosIni.vPOSV.numeroDocumento, 0), 0,
              'N', 'POSVIRTUAL', valorOperacao) then
            begin
              vTefPOSVirtual.cancelaBKP;
              vDadosIni.vPOSV.retorno := retFalha;
              Application.MessageBox('Operação não realizada pelo TEF', 'Atenção', 0 + 64);

              Exit;
            end;
            {$ENDREGION}
          end;

        posCRTDIG:
          begin
            {$REGION 'Venda Carteiras digitais'}
            if not vTefPOSVirtual.CarteiraDigital(vDadosIni.vPOSV.numeroDocumento, CarteiraDigitalId, PSPId, valorOperacao) then
            begin
              vTefPOSVirtual.cancelaBKP;
              vDadosIni.vPOSV.retorno := retFalha;
              Application.MessageBox('Operação não realizada pelo TEF', 'Atenção', 0 + 64);

              Exit;
            end;

            {$ENDREGION}
          end;
      end;
      {
      if not vTefPOSVirtual.venda(2, StrToIntDef(vDadosIni.vPOSV.numeroDocumento, 0), 0,
        'N', 'POSVIRTUAL', EditHw1.AsValue) then
      begin
        vTefPOSVirtual.cancelaBKP;
        vDadosIni.vPOSV.retorno := retFalha;
        Application.MessageBox('Operação não realizada pelo TEF', 'Atenção', 0 + 64);

        if not EditHw1.Enabled then
          ModalResult := IDCANCEL;

        Exit;
      end
      else
      }
      begin
        vQtdeCaractNDocADM := StrToIntDef( vDadosIni.GetIni('TEF', 'QtdeCaracteresNumDocAdm', '6') , 6);
        if vQtdeCaractNDocADM > 10 then
          vQtdeCaractNDocADM := 10;
        vDadosIni.vPOSV.valorTransacaoTEF := vTefPOSVirtual.getTEFValorTransacao;
        vDadosIni.vPOSV.valorSaque := vTefPOSVirtual.getTEFValorSaque;
        vDadosIni.vPOSV.valorDescontoCieloPremia := vTefPOSVirtual.getTEFValorDesconto;
        vDadosIni.vPOSV.parcelas := vTefPOSVirtual.getTEFQtdeParcelas;
        vDadosIni.vPOSV.parcelas := vDadosIni.retornoPorCondicao(vDadosIni.vPOSV.parcelas > 0, vDadosIni.vPOSV.parcelas, 1);
        vDadosIni.vPOSV.retornoAUT := vTefPOSVirtual.getTEFNumAutorizacao;

        if Trim(vTefPOSVirtual.IdCartDigital) <> '' then
        begin
          vDadosIni.vPOSV.retornoNSU := TrimAndPadL(vTefPOSVirtual.getTEFNSUTransacao, 10, '0');
          vDadosIni.vPOSV.retornoAUT := TrimAndPadL(vDadosIni.vPOSV.retornoAUT, 6, '0');
        end
        else
        if vQtdeCaractNDocADM > 0 then
          vDadosIni.vPOSV.retornoNSU := Trim(Copy(vDadosIni.StrZero(vTefPOSVirtual.getTEFNSUTransacao,vQtdeCaractNDocADM), 1, 10))
        else
          vDadosIni.vPOSV.retornoNSU := Trim(Copy(vTefPOSVirtual.getTEFNSUTransacao, 1, 10));

        vDadosIni.vPOSV.retornoREDE := vTefPOSVirtual.getTefNomeDARede;
        vDadosIni.vPOSV.retornoDataTransacao := vTefPOSVirtual.getTefDataTransacao;
        vDadosIni.vPOSV.retornoHoraTransacao := vTefPOSVirtual.getTefHoraTransacao;
        vDadosIni.vPOSV.debitoCreditoOutros := 'C';//default
        vDadosIni.vPOSV.diasParaCredito := 30;//default    
        vDadosIni.vPOSV.idCarteiraDigital := vTefPOSVirtual.IdCartDigital;
        vDadosIni.vPOSV.nomeCarteiraDigital := vTefPOSVirtual.NomeCartDigital;
        vDadosIni.vPOSV.IdPSP := vTefPOSVirtual.IdPSP;
        confirmarDias := True;
        
        if vDadosIni.vPOSV.idCarteiraDigital <> '' then
        begin
          vDadosIni.vPOSV.debitoCreditoOutros := 'P';
          vDadosIni.vPOSV.diasParaCredito := 0;
          confirmarDias := False;
        end
        else
        if vDadosIni.vPOSV.parcelas > 1 then
        begin
          vDadosIni.vPOSV.debitoCreditoOutros := 'C';
          vDadosIni.vPOSV.diasParaCredito := 30;
        end
        else if vDadosIni.GetIni('TEF', 'SW', '') = 'CAPPTA' then
        begin
          if vDadosIni.strEstaContidoEm(Trim(vTefPOSVirtual.TEFTipoTransac),
            [ '10', '11', '12']) then
          begin
            vDadosIni.vPOSV.debitoCreditoOutros := 'C';
            vDadosIni.vPOSV.diasParaCredito := 30;
            confirmarDias := False;
          end
          else if vDadosIni.strEstaContidoEm(Trim(vTefPOSVirtual.TEFTipoTransac),
            [ '20', '21', '22', '23', '24']) then
          begin
            vDadosIni.vPOSV.debitoCreditoOutros := 'D';
            //if Trim(vTefPOSVirtual.TEFTipoTransac) = '20' then
              vDadosIni.vPOSV.diasParaCredito := 2;
            //else
            //  vDadosIni.vPOSV.diasParaCredito := 30;    
            confirmarDias := False;
          end;
        end
        else //sitef
        begin
          confirmarDias := False;
          ///  Nesse caso do sitef as redes sao configuradas na tabela adm_cartao_redes
          ///  Lá fica as configuracoes de debito e credito, pois nas resposta temo spenas o nome da rede
          {
          if vDadosIni.strEstaContidoEm(Trim(vTefPOSVirtual.TEFTipoTransac),
            [ '48', '50', '54', '56', '63', '73', '77']) then
          begin
            vDadosIni.vPOSV.debitoCreditoOutros := 'C';
            vDadosIni.vPOSV.diasParaCredito := 30;
            confirmarDias := False;
          end
          else if vDadosIni.strEstaContidoEm(Trim(vTefPOSVirtual.TEFTipoTransac),
            [ '32', '33', '34', '36', '38', '42', '247']) then
          begin
            vDadosIni.vPOSV.debitoCreditoOutros := 'D';
            //if vDadosIni.strEstaContidoEm(Trim(vTefPOSVirtual.TEFTipoTransac),
            //  [ '32', '33', '34']) then
              vDadosIni.vPOSV.diasParaCredito := 2;
            //else
            //  vDadosIni.vPOSV.diasParaCredito := 30;
            confirmarDias := False;
          end;
          }
        end;

        vTefPOSVirtual.finalizaOperacao(nil);
        vTefPOSVirtual.limpaVariaveisNovoCartao;
        vDadosIni.vPOSV.retorno := retSucesso;

        if vDadosIni.vPOSV.parcelas > 1 then
        else if confirmarDias then
        begin
          ListBox2.ItemIndex := vDadosIni.retornoPorCondicao(vDadosIni.vPOSV.debitoCreditoOutros = 'D', 1, 0);
          EditHw2.AsValue := vDadosIni.vPOSV.diasParaCredito;
          vDadosIni.abreForm('Tipo de Operação', pnEscolhaOperacaoDados, pnEscolhaOperacao);
        end;

        if (vDadosIni.vPOSV.showImpressao) and (vDadosIni.vPOSV.vLinhasImpressao.Count > 0) then
        begin
          if vDadosIni.vModoImpressao.vLinhasImpressao = nil then
            vDadosIni.vModoImpressao.vLinhasImpressao := TStringList.Create;

          vDadosIni.vModoImpressao.TxtNaoFiscal := vDadosIni.PosVirtualGetComprovantes(vDadosIni.vPOSV.vLinhasImpressao.Text, True);
          vDadosIni.vModoImpressao.vLinhasImpressao.Text := vDadosIni.PosVirtualGetComprovantes(vDadosIni.vPOSV.vLinhasImpressao.Text);
          vDadosIni.abreFormCadastro('pkPedidoVenda', 'TfrmImpressaoNaECF');
        end;

//        imprimeComprovanteTEF;
        ModalResult := IDOK;
      end;
    end
    else if vDadosIni.vPOSV.operacao = posADM then
    begin
      vDadosIni.vPOSV.vLinhasImpressao.Clear;
      vTefPOSVirtual.operacaoAdministrativo(nil, false);

      vDadosIni.vPOSV.valorTransacaoTEF := vTefPOSVirtual.getTEFValorTransacao;
      vDadosIni.vPOSV.valorSaque := vTefPOSVirtual.getTEFValorSaque;
      vDadosIni.vPOSV.valorDescontoCieloPremia := vTefPOSVirtual.getTEFValorDesconto;
      vDadosIni.vPOSV.parcelas := vTefPOSVirtual.getTEFQtdeParcelas;
      vDadosIni.vPOSV.retornoAUT := TrimAndPadL(vTefPOSVirtual.getTEFNumAutorizacao, 6, '0');
      vDadosIni.vPOSV.retornoNSU := TrimAndPadL(vTefPOSVirtual.getTEFNSUTransacao, 10, '0');
      vDadosIni.vPOSV.retornoREDE := vTefPOSVirtual.getTefNomeDARede;
      vDadosIni.vPOSV.retornoDataTransacao := vTefPOSVirtual.getTefDataTransacao;
      vDadosIni.vPOSV.retornoHoraTransacao := vTefPOSVirtual.getTefHoraTransacao;
      vDadosIni.vPOSV.debitoCreditoOutros := 'O';
      vDadosIni.vPOSV.diasParaCredito := 0;  
      vDadosIni.vPOSV.idCarteiraDigital := vTefPOSVirtual.IdCartDigital;
      vDadosIni.vPOSV.nomeCarteiraDigital := vTefPOSVirtual.NomeCartDigital; 
      vDadosIni.vPOSV.IdPSP := vTefPOSVirtual.IdPSP;
      vDadosIni.vPOSV.retorno := retSucesso;

      if vDadosIni.vPOSV.vLinhasImpressao.Count > 0 then
      begin
        if vDadosIni.vModoImpressao.vLinhasImpressao = nil then
          vDadosIni.vModoImpressao.vLinhasImpressao := TStringList.Create;

        vDadosIni.vModoImpressao.TxtNaoFiscal := vDadosIni.PosVirtualGetComprovantes(vDadosIni.vPOSV.vLinhasImpressao.Text, True);
        vDadosIni.vModoImpressao.vLinhasImpressao.Text := vDadosIni.PosVirtualGetComprovantes(vDadosIni.vPOSV.vLinhasImpressao.Text);
        vDadosIni.abreFormCadastro('pkPedidoVenda', 'TfrmImpressaoNaECF');
      end;

//      imprimeComprovanteTEF;

      vTefPOSVirtual.limpaVariaveisNovoCartao;

      ModalResult := IDOK;
    end;
  finally
    EditHw1.ReadOnly := False;
    btConfirmar.Enabled := True;
    btCancelar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPOSVirtualTEF.EditHw1Exit(Sender: TObject);
begin
  if (vDadosIni.StrToFloatFormat(vDadosIni.vPOSV.valorMaximoFP, 2) > 0) and (vDadosIni.StrToFloatFormat(EditHw1.AsValue, 2) > vDadosIni.StrToFloatFormat(vDadosIni.vPOSV.valorMaximoFP, 2)) then
  begin
    Application.MessageBox(Pchar('Valor digitado ultrapassa o máximo permitido' + #13 +
      'Máximo permitido: ' + Format('%0.2n', [vDadosIni.vPOSV.valorMaximoFP])), 'Atenção', MB_ICONERROR + MB_OK);
    EditHw1.AsValue := 0;
    Exit;
  end;

  if (vDadosIni.StrToFloatFormat(EditHw1.AsValue, 2) <= 0) then
  begin
    Application.MessageBox(Pchar('Valor da operação deve ser maior que 0'), 'Atenção', MB_ICONERROR + MB_OK);
    Exit;
  end;

  vDadosIni.vPOSV.valorOperacao := vDadosIni.StrToFloatFormat(EditHw1.AsValue, 2);
  EditHw1.AsValue := vDadosIni.vPOSV.valorOperacao;
end;

procedure TfrmPOSVirtualTEF.EditHw2Exit(Sender: TObject);
begin
  if EditHw2.AsInteger < 0 then
  begin
    Application.MessageBox('Dias para crédito inválido. Informe de 0 a 30 dias', 'Atenção', 0 + 64);
    EditHw2.AsValue := vDadosIni.retornoPorCondicao(ListBox2.ItemIndex = 1, 2, 30);
  end
  else
    lbVencimento.Caption := FormatDateTime('DD/MM/YYYY', DATE + EditHw2.AsInteger);
end;

procedure TfrmPOSVirtualTEF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vDadosIni.enterTela.DeleteExclusion(ListBox1);
  Action := caFree;
  frmPOSVirtualTEF := nil;
end;

procedure TfrmPOSVirtualTEF.FormCreate(Sender: TObject);
begin
  vTefPOSVirtual := TTEFDedicado.create;
  vTefPOSVirtual.TEFSHouse := vDadosIni.vPOSV.TEFSHouse;
  vDadosIni.vPOSV.retornoNSU := '';
  vDadosIni.vPOSV.retornoAUT := '';
  vDadosIni.vPOSV.retornoREDE := '';
  vDadosIni.vPOSV.terminalAdm := '';
  vDadosIni.vPOSV.cnpjAdm := '';
  vDadosIni.vPOSV.tband := 0;
  if vDadosIni.vPOSV.vLinhasImpressao = nil then
    vDadosIni.vPOSV.vLinhasImpressao := TStringList.Create;
  vDadosIni.vPOSV.vLinhasImpressao.Clear;

  timerVenda := TTimer.Create(Self);
  timerVenda.Enabled := False;
  timerVenda.Interval := 100;
  timerVenda.OnTimer := timerVerndaTimer;
end;

procedure TfrmPOSVirtualTEF.FormShow(Sender: TObject);
begin

  CarteiraDigitalId := vDadosIni.vPOSV.idCarteiraDigital;
  PSPId := vDadosIni.vPOSV.IdPSP;

  try
    vDadosIni.abreStatusProcessamento('Operações TEF', 'Verificando operações pendentes', True);
    vTefPOSVirtual.existetransacaoTefPendente;
    vTefPOSVirtual.cancelaOperacoesAnteriores(nil);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

  pnCartaoOuCarteira.Visible := False;
  btChangeOperation.Visible := False;
  pnValor.Visible := True;
  pnBotoes.Visible := True;

  if vDadosIni.vPOSV.operacao = posADM then
  begin
    EditHw1.Visible := False;
    Label1.Visible := False;
  end
  else
  begin
    if vDadosIni.vPOSV.valorMaximoFP > 0 then
      EditHw1.AsValue := vDadosIni.StrToFloatFormat(vDadosIni.vPOSV.valorMaximoFP, 2)
    else
      EditHw1.AsValue := 0;
    EditHw1.Enabled := //(vDadosIni.vPOSV.operacao in [posCRT, posCRTDIG]) and
                       (vDadosIni.vPOSV.valorOperacao = 0);
    if not EditHw1.Enabled then
      EditHw1.AsValue := vDadosIni.vPOSV.valorOperacao;
  end;
  pnTexto.Caption := vDadosIni.vPOSV.textoParaUsuario;

  if vDadosIni.vPOSV.operacao = posCartaoMaisCarteiras then
  begin
    vDadosIni.enterTela.AddExclusion(ListBox1);
    pnCartaoOuCarteira.Align := alClient;
    pnCartaoOuCarteira.Visible := True;
    pnValor.Visible := False;
    pnBotoes.Visible := False;
    btChangeOperation.Visible := EditHw1.Enabled;
    ListBox1.ItemIndex := 0;
    if ListBox1.CanFocus then
      ListBox1.SetFocus;
  end
  else
    if not EditHw1.Enabled then
      timerVenda.Enabled := True;
end;

procedure TfrmPOSVirtualTEF.imprimeComprovanteTEF;
var
  vPrint: TRDprint;
  I, vLinha, vPagina: Integer;
begin
  if vDadosIni.vPOSV.vLinhasImpressao = nil then
    Exit;
  if vDadosIni.vPOSV.vLinhasImpressao.Count = 0 then
    Exit;
  vPrint := TRDprint.Create(Application);
  vPrint.OpcoesPreview.CaptionPreview := 'Comprovante de transação TEF';
  vPrint.CaptionSetup := 'Configurar impressão do comprovante de transação TEF';
  vPrint.TitulodoRelatorio := 'Comprovante TEF';
  vPrint.OpcoesPreview.Preview := true;
  vPrint.FonteTamanhoPadrao := S17cpp;
  vPrint.TamanhoQteColunas := 42;
  vPrint.TamanhoQteLinhas := 66;
  vlinha := 1;
  vPagina := 1;
  vDadosIni.ModImp(vPrint);
  if vPrint.EstaAberto then
    vPrint.Abortar;
  vPrint.Abrir;
  for I := 0 to vDadosIni.vPOSV.vLinhasImpressao.Count - 1 do
  begin
    if vLinha >= 66 then
    begin
      vPrint.Novapagina;
      vLinha:= 1;
    end;  
    vPrint.Imp(vLinha, 1, vDadosIni.vPOSV.vLinhasImpressao[I]);
    vLinha := vLinha + 1;
  end;
  vPrint.Fechar;
  vPrint.Free;
  vPrint := nil;

end;

procedure TfrmPOSVirtualTEF.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    vDadosIni.vPOSV.operacao := TPOSVirualOperacao(IfThen(ListBox1.ItemIndex = 0, Ord(posCRT), Ord(posCRTDIG)));
    pnCartaoOuCarteira.Visible := False;
    pnValor.Visible := True;
    pnBotoes.Visible := True;

    if not EditHw1.Enabled then
      timerVenda.Enabled := True
    else if EditHw1.CanFocus then
      EditHw1.SetFocus;

  end
  else if Key = VK_ESCAPE then
    btCancelar.Click;     

end;

procedure TfrmPOSVirtualTEF.ListBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if EditHw2.CanFocus then
      EditHw2.SetFocus;
end;

procedure TfrmPOSVirtualTEF.pnEscolhaOperacaoDadosEnter(Sender: TObject);
begin
  lbVencimento.Caption := FormatDateTime('DD/MM/YYYY', DATE + EditHw2.AsInteger);
end;

procedure TfrmPOSVirtualTEF.timerVerndaTimer(Sender: TObject);
begin
  timerVenda.Enabled := False;
  btConfirmar.Click;
end;

initialization
  RegisterClass(TfrmPOSVirtualTEF);
finalization
  UnRegisterClass(TfrmPOSVirtualTEF);

end.
