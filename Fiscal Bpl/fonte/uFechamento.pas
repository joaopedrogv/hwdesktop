unit uFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, uEditMoeda, ExtCtrls, Grids, DBGrids,
  DBCtrls, Menus, Mask ;

type
  TfrmFechamento = class(TfrmPadrao)
    lMensagem: TPanel;
    Panel7: TPanel;
    grupoControle: TGroupBox;
    gridFina: TDBGrid;
    Panel2: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditMoeda1: TEditMoeda;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EditMoeda2: TEditMoeda;
    EditMoeda3: TEditMoeda;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    grupoValor: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    mValorDoc: TEditMoeda;
    mPago: TEditMoeda;
    mRestante: TEditMoeda;
    mTroco: TEditMoeda;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    CancelarCupo1: TMenuItem;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EditMoeda3Enter(Sender: TObject);
    procedure EditMoeda2Enter(Sender: TObject);
    procedure EditMoeda1Enter(Sender: TObject);
    procedure EditMoeda3Exit(Sender: TObject);
    procedure EditMoeda2Exit(Sender: TObject);
    procedure EditMoeda1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure gridFinaDblClick(Sender: TObject);
    procedure EditMoeda1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure CancelarCupo1Click(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure gridFinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Panel5Enter(Sender: TObject);
    procedure Panel5Exit(Sender: TObject);
    procedure grupoControleExit(Sender: TObject);
    procedure grupoControleEnter(Sender: TObject);
  private
    { Private declarations }
    secao, codigoClienteFaturamento: integer;
    executando, fSemMsg: boolean;
    vApenasCartao, vApenasCheque, jaVerificouFaturamento: boolean;
    procedure clearVariaveis;
  public
    { Public declarations }
  end;

var
  frmFechamento: TfrmFechamento;

implementation

uses uDtmFiscalHwF, uPrincipalF, uPesqClientesF, uDtmConfigF, uDadosAvulso,
  uCupom, uFileList, DB, uDtmAtivo, uDtmFiscal,
  uImpressoraF, unFuncoesTEF, uDadosIniFiscal, uClassesRetaguarda, uDadosIni;

function BlockInput(block: boolean): DWORD; stdcall; external 'user32.DLL';

{$R *.dfm}

procedure TfrmFechamento.BitBtn1Click(Sender: TObject);
var
  gerencial, FicarEmLoop: boolean;
  I, vNaoConfOper: Integer;
  valorCp, nCP, nReg: string;
  valorInformado, valorRestante: Currency;
  vrTemp: Currency;
  vrTempTexto: string;
  vrTempSubTotal: Currency;
  vrTroco, vrTmp1, vrTmp2: Extended;
  MultiTef: Smallint;
  Comprovante: TStrings;
begin
  inherited;
  try
    obCupom.vFinCupom.vValorSaque := 0;
    obCupom.vFinCupom.vValorDescPremia := 0;
    obCupom.vFinCupom.vQtdeParcelaCartao := 0;
    obCupom.vFinCupom.vNumAutorizacao := '';
    obCupom.vFinCupom.vNSUTransacao := '';
    Panel5.OnExit := nil;
    EditMoeda1.ReadOnly := true;
    EditMoeda2.ReadOnly := true;
    EditMoeda3.ReadOnly := true;
    Screen.Cursor := crHourGlass;
    valorCp := '';
    nCP := '';
    nReg := '';
    vNaoConfOper := 0;
    if executando then
      exit;
    executando := true;
    if EditMoeda1.Visible then
    begin
      try
        valorInformado := EditMoeda1.Valor;
        if valorInformado = 0 then
        begin
          lMensagem.Caption := 'Valor informado não pode ser igual a zero!';
          EditMoeda1.SetFocus;
          exit;
        end;

        // Testar valor diferente de dinheiro maior que o valor a restante a receber
        if (vDadosIniF.vTipoConexao <> 'off') and (vDadosIniF.bancoConectado <> 'local') then
          if obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger <> 1 then
          begin
            valorRestante := obCupom.getValorRestante;
            if vDadosIniF.StrToFloatFormat(valorInformado, 2) > vDadosIniF.StrToFloatFormat(valorRestante, 2) then
              if not vDadosIniF.PesqPros('FIS052', 'VALIDAR', '','','')then
                exit;
          end;

        //Realizando recebimento no TEF
        if ((vDadosIniF.vUsaTef = 'E') and (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1) ) or
          (vDadosIniF.vUsaTef = 'I') then
        begin
          valorRestante := obCupom.getValorRestante;

//          MultiTEF := StrToIntDef(vDadosIniF.GetIni('TEF', 'MultiTEF', '1'), 1);
//          if MultiTef <= 1 then
          if vDadosIniF.GetIni('TEF', 'SW', '') = 'CAPPTA' then
            if vDadosIniF.StrToFloatFormat(valorInformado, 2) < vDadosIniF.StrToFloatFormat(valorRestante, 2) then
            begin
              Application.MessageBox(PChar('Para operações TEF favor informar o valor total da operação!' + #13 +
                'Informar as demais formas antes do TEF'), 'Atenção', MB_OK + MB_ICONWARNING);
              lMensagem.Caption :=
                'Máximo de 2 cartões. Utilize outra forma';
              gridFina.Enabled := True;
              gridFina.SetFocus;
              exit;
            end;

          if (obTef.getQtdeCartao = 2) then
          begin
            Application.MessageBox('Máximo de 2 cartões. O valor restante deve ser pago com outra forma de pagamento.', 'Atenção', MB_OK + MB_ICONWARNING);
            lMensagem.Caption :=
              'Máximo de 2 cartões. Utilize outra forma';
            gridFina.Enabled := True;
            gridFina.SetFocus;
            exit;
          end;

          // João Paulo - fazer tratamento aqui , para não vender com cheque e cheque
          //              nem com cheque e cartão. (analisar ainda como fazer).
//
//          if (obTef.getQtdeCartao = 1) and
//            (Format('%10.2f', [valorInformado]) <>
//            Format('%10.2f', [valorRestante])) then
//          begin
//            Application.MessageBox('Máximo de 2 cartões. Último deve ter o valor restante do cupom', 'Atenção', MB_OK + MB_ICONWARNING);
//            lMensagem.Caption :=
//              'Máximo de 2 cartões. Último deve ter o valor restante do cupom';
//            gridFina.Enabled := True;
//            gridFina.SetFocus;
//            exit;
//          end;

          if (obTef.getQtdeCartao > 0) and
            (trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString) = 'S') and
            (vDadosIniF.vUsaTef <> 'E') then
          begin
            Application.MessageBox('Finalize em Cartão', 'Atenção', MB_OK + MB_ICONWARNING);
            lMensagem.Caption := 'Finalize em Cartão';
            gridFina.Enabled := True;
            gridFina.SetFocus;
            exit;
          end;

          if (trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString) = 'S') then
          begin
            if valorRestante <> valorInformado then
            begin
              Application.MessageBox('Somente é aceito no valor Total restante', 'Atenção', MB_OK
                + MB_ICONWARNING);
              lMensagem.Caption := 'Somente é aceito no valor Total restante';
              gridFina.Enabled := True;
              gridFina.SetFocus;
              exit;
            end;
          end;

          if (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1) then
          begin
            if obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger = 3 then
              obTef.iTEFTecban := 1
            else
              obTef.iTEFTecban := 0;

            if (vDadosIniF.GetIni('TEF', 'SW', '') = 'CAPPTA') then
            begin
              if (vDadosIniF.StrToFloatFormat(obCupom.getSubTotal, 2) <> vDadosIniF.StrToFloatFormat(valorInformado, 2)) and
               (valorRestante > 0) then
              begin
                vrTmp1 := obCupom.getSubTotal - valorRestante; // valor pago em outras formas diferente de TEF
                vrTmp2 := vrTmp1 + valorInformado - obCupom.getSubTotal; // valor previsto de troco
                if vDadosIniF.StrToFloatFormat(vrTmp2, 2) > vDadosIniF.StrToFloatFormat(vrTmp1, 2) then
                begin
                  Application.MessageBox(PChar('Não é permitido troco de valores em TEF' +#13 +
                    'Máximo permitido: ' + Format('%0.2n', [vrTmp1 + valorRestante - 0.00])) , 'Atenção', MB_OK
                    + MB_ICONWARNING);
                  lMensagem.Caption := 'Não é permitido troco de valores em TEF';
                  gridFina.Enabled := True;
                  gridFina.SetFocus;
                  exit;
                end;
              end;
            end
            else
            if (valorInformado > valorRestante) then
            begin
              lMensagem.Caption := 'Valor informado deve ser menor ou igual ao valor restante!';
              EditMoeda1.SetFocus;
              exit;
            end;

            if (vApenasCartao) and
              (Trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString) = 'S') then
            begin
              Application.MessageBox(pchar('Cheque não permitido'),'Atenção',0+64);
              EditMoeda1.SetFocus;
              exit;
            end;
            if (vApenasCheque) and
              (Trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString) <> 'S') then
            begin
              Application.MessageBox(pchar('Cartão não permitido'),'Atenção',0+64);
              EditMoeda1.SetFocus;
              exit;
            end;

            BitBtn1.Enabled := false;
            BitBtn2.Enabled := false;
            gridFina.Enabled := false;
            if vDadosIniF.vUsaTef = 'E' then
              if not obCupom.emSubTotal then
              begin
                if not obCupom.setSubTotal then
                  exit;
                obCupom.addMensagemMemo('Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]));
              end;

            lMensagem.Caption := 'Aguardando comunicação com o TEF!';

            if vDadosIniF.vUsaTef = 'E' then
              obTef.gravaDadosArquivoBkpFormPagamento(
                obCupom.dataSet.FieldByName('cupom').AsInteger,
                obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
                valorInformado, 0, '', 0);

            if not obTef.venda(obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger,
              StrToInt(trim(obCupom.getNCupom)),
              0, trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString),
              CImpressoraF.defAtribTef, valorInformado) then
            begin
              lMensagem.Caption := 'Operação não realizada pelo TEF';

              if obTef.vmens = '1' then
                obTef.cancelaBKP;
              clearVariaveis;
              gridFina.Enabled := True;
              gridFina.SetFocus;
              //              BitBtn2Click(Sender);
              exit;
            end;
            if Trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString) = 'S' then
              vApenasCheque := True
            else
              vApenasCartao := True;

            BlockInput(true);
            valorInformado := obTef.getTEFValorTransacao;
            obCupom.vFinCupom.vValorSaque := obTef.getTEFValorSaque;
            obCupom.vFinCupom.vValorDescPremia := obTef.getTEFValorDesconto;
            obCupom.vFinCupom.vQtdeParcelaCartao := obTef.getTEFQtdeParcelas;
            obCupom.vFinCupom.vNumAutorizacao := obTef.getTEFNumAutorizacao;
            obCupom.vFinCupom.vNSUTransacao := obTef.getTEFNSUTransacao;
            if vDadosIniF.GetIni('TEF', 'SW', 'SOFTWAREEXPRESS') = 'SOFTWAREEXPRESS' then
            begin
              obTef.AddArquivoImpressao;
              obTef.finalizaOperacao(CImpressoraF);
              obTef.limpaVariaveisNovoCartao2;
            end;
          end;
        end;
        // Fim realizando venda no tef


        //verifica se existe transtef da ultima operação pendete para confirmação onde TefNaoconfirmado = 1.
        //Joao Pedro: Comentei, estava demorando muito para fazer a forma de pagamento.
        // E parece que este teste ja é feito na chamada do metodo verificaConfirmacaoPendenteAntesNovaVenda dentro do obtef.venda.
        // Caso seja nessessário remover estes comentarios.
//        if vDadosIniF.vUsaTef = 'E' then
//        begin
//          Try
//            obTef.SalvaVariaveisVendaCorrente(1);
//            Try
//               obTef.verificaOperacaoPendenteTransTef();
//            Except
//            end;
//          finally
//            obTef.SalvaVariaveisVendaCorrente(0);
//          end;
//        end;

        //Enviando venda para tabelas do fiscal
        if not obCupom.recebeFormaPag(obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
          obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger, valorInformado) then
        begin
          clearVariaveis;
          if ( (vDadosIniF.vUsaTef = 'E') or (vDadosIniF.vUsaTef = 'I') ) and (obCupom.cancelarTEF = 'S') then
          begin
            if (obTef.existeTransacaotransTef) AND (vDadosIniF.vUsaTef = 'I') then
            begin
              Application.MessageBox('O cupom fiscal vai ser cancelado. Existe transações TEF pendentes', 'Atenção', MB_OK + MB_ICONWARNING);
              ModalResult := mrAbort;
              exit;
            end;
            if vDadosIniF.vUsaTef = 'E' then
            begin
              Screen.Cursor := crHourGlass;
              if obCupom.cancelarCupom = 'S' then
              begin
                obTef.cancelaOperacoesAnteriores(CImpressoraF);
                fSemMsg:= True;
                Application.MessageBox('O cupom fiscal vai ser cancelado', 'Atenção', MB_OK + MB_ICONWARNING);
                while True do
                begin
                  if not vDadosIniF.semComunicacaoComECF('N') then
                    Break;
                  Application.MessageBox('Impressora não responde. Sera feita uma nova tentativa', 'Atenção', 0 + 64);
                end;

                ModalResult := mrAbort;
                exit;
              end;
              vNaoConfOper := 1;
              lMensagem.Caption := 'Selecione a Forma de Pagamento e aperte "Enter"';
            end
            else
            if vDadosIniF.vUsaTef = 'I' then
               obTef.verificaOperacaoPendente(CImpressoraF);
          end;
          exit;
        end;
        //Fim enviando vendas para tabela do fiscal


        valorRestante := obCupom.getValorRestante;
        //Forma de Pagamento
//        if valorRestante < 0 then
//          dtmFP.iniciaFormaPagamentoFiscal(StrToInt(obCupom.getNCupom), StrToInt(Edit1.Text),
//            obCupom.CodVendedor,
//            obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
//            StrToInt(obCupom.getNCupom), secao, strtoint(obCupom.getNRegistro), EditMoeda1.Valor +
//            valorRestante)
//        else
        {if vDadosIniF.vFormPagamentoAtivado = 'S' then
          dtmFP.iniciaFormaPagamentoFiscal(StrToInt(obCupom.getNCupom), StrToInt(Edit1.Text),
            obCupom.CodVendedor,
            obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
            StrToInt(obCupom.getNCupom), secao, strtoint(obCupom.getNRegistro), valorInformado);}
        inc(secao);
        //Fim forma de pagamento

        if obCupom.getValorRestanteComSaque < 0 then
        begin
          obCupom.buscas.Close;
          obCupom.buscas.SQL.Text :=
            'select sum(fc.valor_desconto) valor_desconto from fincupom fc' +
            ' inner join finalizadores f on f.cod_terminal = fc.cod_terminal and' +
            ' f.nserieecf = fc.nserieecf and f.cod_empresa = fc.cod_empresa and' +
            ' f.cod_finalizador = fc.finalizador' +
            ' where fc.cod_empresa = ' + vDadosIniF.codEmpresa +
            ' and fc.ordem = ' + IntToStr(obCupom.dataSet.FieldByName('registro').AsInteger) +
            ' and fc.cupom = ' + IntToStr(obCupom.dataSet.FieldByName('cupom').AsInteger) +
            ' and fc.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf))+
            ' and fc.valor > 0 ';
          obCupom.buscas.Open;

          vrTroco := ( (-1) * obCupom.buscas.FieldByName('valor_desconto').AsFloat) + obCupom.getValorRestanteComSaque;
          obCupom.addMensagemMemo('Troco    R$ ' + Format(' %10.2f', [abs(vrTroco)]));
          lMensagem.Caption := 'Troco: R$ ' + Format(' %10.2f', [abs(vrTroco)]);
          mTroco.Valor := abs(vrTroco);
          mPago.Valor := obCupom.getSubTotal + abs(vrTroco);
//          obCupom.addMensagemMemo('Troco    R$ ' + Format(' %10.2f', [
//            (obCupom.getValorRestanteComSaque)]));
//          lMensagem.Caption := 'Troco: R$ ' + Format(' %10.2f', [(-1) *
//            (obCupom.getValorRestanteComSaque)]);
//          mTroco.Valor := (-1) * (obCupom.getValorRestanteComSaque);
//          mPago.Valor := obCupom.getSubTotal - obCupom.getValorRestanteComSaque;
          try
          obCupom.vFinCupom.insereFimCupom(obCupom.dataSet.FieldByName('registro').AsInteger,
            obCupom.dataSet.FieldByName('cupom').AsInteger, 1, 0, 0,
            StrToInt(Trim(CImpressoraF.numeroCCF)), (-1) * Abs(obCupom.getValorRestanteComSaque),
            (-1)* Abs(obCupom.getValorRestanteComSaque), 'CUP');
          except
          end;
        end
        else
        begin
          mValorDoc.Valor := obCupom.getSubTotal;
          mPago.Valor := obCupom.getSubTotal - obCupom.getValorRestante;
          mRestante.Valor := obCupom.getValorRestante;
          lMensagem.Caption := 'Resta: R$ ' + Format(' %10.2f', [obCupom.getValorRestante]);
        end;

        if valorRestante <= 0 then
        begin
          valorCp := trim(FloatToStr(obCupom.getSubTotal));
          nCP := trim(obCupom.getNCupom);
          nReg := Trim(obCupom.getNRegistro);
          if not obCupom.fechaCupomFiscal(Edit1.Text) then
          begin
            if vDadosIniF.vUsaTef = 'E' then
            begin
              Screen.Cursor := crHourGlass;
              obTef.cancelaOperacoesAnteriores(CImpressoraF);
              if obCupom.cancelarCupom = 'S' then
              begin
                Application.MessageBox('O cupom fiscal vai ser cancelado', 'Atenção', MB_OK + MB_ICONWARNING);
                ModalResult := mrAbort;
                exit;
              end;
            end;
            EditMoeda1.Visible := False;
            BitBtn2Click(Sender);
            exit;
          end;
          if vDadosIniF.vUsaTef = 'S' then
          begin
            mValorDoc.Valor := obCupom.dataSet.FieldByName('VALORCUPOm').AsFloat;
            mPago.Valor := obCupom.dataSet.FieldByName('VALORCUPOm').AsFloat;
            mRestante.Valor := 0;
          end;
          if ((vDadosIniF.GetIni('TEF', 'SW', 'SOFTWAREEXPRESS') = 'SOFTWAREEXPRESS') and
            (obTef.ArquivosImp.Count > 0)) then
          begin
            gerencial := false;
            vNaoConfOper := 0;
            FicarEmLoop := True;
            while FicarEmLoop do
            begin

              for I := 0 to obTef.ArquivosImp.Count - 1 do
              begin
                try
                  Comprovante := TStringList(obTef.ArquivosImp[I]);
                  Comprovante.SaveToFile(ExtractFilePath(Application.ExeName) + 'Tef.Imp');
                  obTef.setContadorImpressao(i + 1);
                  obTef.SetDocumentoVinculado(nCP);
                  if not obTef.gerenciamentoImpressaoTEF(CImpressoraF, gerencial, ExtractFilePath(Application.ExeName) + 'Tef.Imp') then
                  begin
                    Application.MessageBox('Transação TEF foi efetuada. Favor reimprimir o Cupom', 'Atenção', 0 + 64);
                    //obTef.cancelaOperacoesAnteriores(CImpressoraF);
                    //ver se precisa de mensagem aqui
                    //ver se este vNaoConfOper precisa dele
                    vNaoConfOper := 1;
                    FicarEmLoop := False;
                    Break;
                  end;
                  if obTef.voltarParaPrimeiroArquivo then
                    gerencial := true;

                finally
                  vDadosIniF.limpaMensagem;
                end;
              end;
              if vNaoConfOper = 1 then
              begin
                FicarEmLoop := False;
                vNaoConfOper := 0;//isso para continuar o processamento la embaixo
              end
              else if not obTef.voltarParaPrimeiroArquivo then
                FicarEmLoop := False;
            end;

            if obTef.reimpressao = 'S' then
              CImpressoraF.FechaRelatorioGerencialTEF;
            obTef.limpaVariaveisNovoCartao;
          end
          else
          begin
            if (obTef.getQtdeCartao > 0) and
              ( (vDadosIniF.vUsaTef = 'E') or (vDadosIniF.vUsaTef = 'I') ) then
            begin
              lMensagem.Caption := 'Aguarde! Imprimindo comprovante ...';
              Application.CreateForm(TfrmFileList, frmFileList);
              Application.CreateForm(tfrmFileList, frmFileList);
              frmFileList.FileListBox1.Mask := '*.Imp';
              frmFileList.FileListBox1.Directory := 'C:\KoneKTEF\';
              frmFileList.FileListBox1.Refresh;
              gerencial := false;
              i := 0;
              vNaoConfOper := 0;

              while i <= frmFileList.FileListBox1.Items.Count - 1 do
              begin
                obTef.setContadorImpressao(i + 1);
                try
                  vDadosIniF.limpaMensagem;
                  //                vDadosIniF.MensagemFiscal('Aguarde! Imprimindo...');
                  if not obTef.gerenciamentoImpressaoTEF(CImpressoraF, gerencial, 'C:\KoneKTEF\' +
                    frmFileList.FileListBox1.Items.Strings[i]) then
                  begin
                    obTef.cancelaOperacoesAnteriores(CImpressoraF);
                    vNaoConfOper := 1;
                    Break;
                  end;
                finally
                  vDadosIniF.limpaMensagem;
                end;
                if obTef.voltarParaPrimeiroArquivo then
                begin
                  I := -1;
                  gerencial := true;
                end;
                inc(i);
              end;

              if obTef.reimpressao = 'S' then
                CImpressoraF.FechaRelatorioGerencialTEF;

              if vNaoConfOper = 0 then
                obTef.finalizaOperacao(CImpressoraF);

              obTef.limpaVariaveisNovoCartao;
            end;
          end;

          if vNaoConfOper = 1 then
          begin
            ModalResult := mrOk;
            Exit;
          end;

          if obCupom.existePrazo(obFinalizador.getFinalizadorPrazo) then
            if obCupom.verificaPrazo(nCP, nReg) then
            begin
              try
                vDadosIniF.MensagemFiscal('Aguarde. Imprimindo Prazo');
                CImpressoraF.vFvvalpr :=FloatToStr(obCupom.getValorPrazo); //valorCp;
                CImpressoraF.vFvnc := StrToInt(nCP);
                CImpressoraF.PrazoECF;
              finally
                vDadosIniF.limpaMensagem;
              end;

            end;
          obCupom.verificaOutrosPrazo(nCP, nReg);
          
          obCupom.vFPg.Create;
          obCupom.setDadosAvulso('', '', '', '', '', '', '', '', '', True);
//          if mTroco.Valor > 0 then
//            Application.MessageBox(pchar('Troco: ' + mTroco.Text), 'Atenção', MB_ICONINFORMATION +
//              MB_OK);
          ModalResult := mrOk;
          exit;
        end;
        gridFina.Enabled := True;
        gridFina.SetFocus;
        Label1.Visible := False;
        Label2.Visible := False;
        Label3.Visible := False;
        EditMoeda1.Visible := False;
        EditMoeda2.Visible := False;
        EditMoeda3.Visible := False;
        GroupBox1.Enabled := False;
      finally
        if vDadosIniF.vUsaTef = 'E' then
          obTef.gravaDadosArquivoBkpFormPagamento( 0, 0, 0, 0, '', 0);
        try
          Screen.Cursor := crHourGlass;
          if modalresult = mrok then
          begin
            if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
              try
                vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
                vHwSinc._sincronizarDados;
              finally
                vDadosIniF.fechaStatusProcessamento;
              end;
            if FileExists(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe') then
              WinExec(Pchar(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe'), SW_SHOWNOACTIVATE);
          end;
          //continuar colocando a sincronizacao
        finally
          Screen.Cursor := crDefault;
          if ModalResult = mrOK then
            vDadosIniF.limpaMensagem;
        end;
      end;
    end
    else if (EditMoeda2.Visible) and (EditMoeda2.Valor > 0) then
    begin
      if vDadosIniF.vUsaTef <> 'E' then
        if (obCupom.emSubTotal) then
        begin
          clearVariaveis;
          lMensagem.Caption := 'Cupom já foi totalizado';
          exit;
        end;
      try
        //        vrTemp:=StrToCurr(EditMoeda2.caText);
        vrTempTexto := CurrToStr(EditMoeda2.Valor);
        vrTemp := StrToCurr(vrTempTexto);
      except
        Application.MessageBox('Valor inválido', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        EditMoeda2.Valor := 0;
        gridFina.Enabled := True;
        gridFina.SetFocus;
        exit;
      end;
      if vrTemp >= obCupom.getSubTotal then
      begin
        Application.MessageBox('Valor do desconto maior ou igual ao valor do cupom', 'Atenção',
          MB_ICONEXCLAMATION + MB_OK);
        EditMoeda2.Valor := 0;
        gridFina.Enabled := True;
        gridFina.SetFocus;
        exit;
      end;
      if vrTemp <= 0 then
      begin
        Application.MessageBox('Valor do desconto não pode ser menor ou igual a zero', 'Atenção',
          MB_ICONEXCLAMATION + MB_OK);
        lMensagem.Caption := 'Valor do desconto não pode ser menor ou igual a zero';
        EditMoeda2.Valor := 0;
        gridFina.Enabled := True;
        gridFina.SetFocus;
        exit;
      end;
      vrTempSubTotal:=obCupom.getSubTotal;
      obCupom.setDescontoFechamento(vrTemp);
      if obCupom.setSubTotal then
      begin
        obCupom.addMensagemMemo('Sub Total R$   ' + Format(' %10.2f', [vrTempSubTotal]));
        obCupom.addMensagemMemo('Desconto  R$   ' + Format(' %10.2f', [vrTemp]));
      end;
      mValorDoc.Valor := obCupom.getSubTotal;
      mPago.Valor := obCupom.getSubTotal - obCupom.getValorRestante;
      mRestante.Valor := obCupom.getValorRestante;

      clearVariaveis;
      lMensagem.Caption := 'Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]);
      gridFina.Enabled := True;
      gridFina.SetFocus;
    end
    else if (EditMoeda3.Visible) and (EditMoeda3.Valor > 0) then
    begin
      if (obCupom.emSubTotal) then
      begin
        clearVariaveis;
        lMensagem.Caption := 'Cupom já foi totalizado';
        exit;
      end;
      try
        vrTempTexto := CurrToStr(EditMoeda3.Valor);
        vrTemp := StrToCurr(vrTempTexto);
      except
        Application.MessageBox('Valor inválido', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        EditMoeda3.Valor := 0;
        gridFina.Enabled := True;
        gridFina.SetFocus;
        exit;
      end;
//      if vrTemp >= obCupom.getSubTotal then
//      begin
//        Application.MessageBox('Valor do acrescimo maior ou igual ao valor do cupom', 'Atenção',
//          MB_ICONEXCLAMATION + MB_OK);
//        EditMoeda3.Valor := 0;
//        gridFina.Enabled := True;
//        gridFina.SetFocus;
//        exit;
//      end;
      if vrTemp <= 0 then
      begin
        Application.MessageBox('Valor do acrescimo não pode ser menor ou igual a zero',
          'Atenção', MB_ICONEXCLAMATION + MB_OK);
        lMensagem.Caption := 'Valor do acrescimo não pode ser menor ou igual a zero';
        EditMoeda3.Valor := 0;
        gridFina.Enabled := True;
        gridFina.SetFocus;
        exit;
      end;
      vrTempSubTotal:=obCupom.getSubTotal;
      obCupom.setAcrescimoFechamento(vrTemp);
      if obCupom.setSubTotal then
      begin
        obCupom.addMensagemMemo('Sub Total  R$   ' + Format(' %10.2f', [vrTempSubTotal]));
        obCupom.addMensagemMemo('Acréscimo  R$   ' + Format(' %10.2f', [vrTemp]));
      end;
      mValorDoc.Valor := obCupom.getSubTotal;
      mPago.Valor := obCupom.getSubTotal - obCupom.getValorRestante;
      mRestante.Valor := obCupom.getValorRestante;
      clearVariaveis;
      lMensagem.Caption := 'Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]);
      gridFina.Enabled := True;
      gridFina.SetFocus;
    end;
  finally
    BlockInput(False);
    obTef.reimpressao := '';
    obTef.relAberto := '';
    EditMoeda1.ReadOnly := false;
    EditMoeda2.ReadOnly := false;
    EditMoeda3.ReadOnly := false;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    gridFina.Enabled := true;
    Panel5.OnExit := Panel5Exit;
    Screen.Cursor := crDefault;
    obTef.forcaFocoNoSistema(Application.Handle);

    if vNaoConfOper <> 1 then
        Timer1.Enabled := true;
        
    executando := False;
  end;
end;

procedure TfrmFechamento.BitBtn2Click(Sender: TObject);
begin
  inherited;

  if (EditMoeda1.Visible) or (EditMoeda2.Visible) or (EditMoeda3.Visible) then
  begin
    if gridFina.CanFocus then
       gridFina.SetFocus
    else if Edit1.CanFocus then
       Edit1.SetFocus;
  end
  else
    Close;

     
  //ModalResult := mrAbort;

  {if (obCupom.emSubTotal) and (not EditMoeda1.Visible) then
  begin
    if Application.MessageBox(pchar('Ao sair desta tela o cupom será cancelado!' + #13 +
      'Deseja mesmo cancelar o cupom?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
    begin
      ModalResult := mrAbort;
      exit;
    end;
  end;
  if (not obCupom.emSubTotal) and (not EditMoeda1.Visible) then
  begin
    ModalResult := mrCancel;
  end;
  clearVariaveis;
  gridFina.SetFocus;}
end;

procedure TfrmFechamento.CancelarCupo1Click(Sender: TObject);
begin
  inherited;
//  obCupom.cancelarCupomFiscal;
//  ModalResult := mrOk;
//  Close;
end;

procedure TfrmFechamento.clearVariaveis;
begin
  Label1.Visible := False;
  Label2.Visible := False;
  Label3.Visible := False;
  EditMoeda1.Visible := False;
  EditMoeda2.Visible := False;
  EditMoeda3.Visible := False;
  EditMoeda1.Valor := 0;
end;

procedure TfrmFechamento.DBLookupComboBox1Enter(Sender: TObject);
begin
  inherited;
  obCliente.IndexFieldNames := 'NOME_CLIENTE';
end;

procedure TfrmFechamento.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  Edit1.Text := obCliente.getCodigoCliente;
end;

procedure TfrmFechamento.Edit1Change(Sender: TObject);
begin
  inherited;
  obCliente.FindNearest([Edit1.Text]);
end;

procedure TfrmFechamento.Edit1Enter(Sender: TObject);
begin
  inherited;
  if Edit1.Text = '00000' then
    Edit1.Text := '';
end;

procedure TfrmFechamento.Edit1Exit(Sender: TObject);
begin
  inherited;
  if trim(Edit1.Text) = '' then
  begin
    Edit1.Text := '00000';
    jaVerificouFaturamento := False;
    codigoClienteFaturamento := 0;
  end
  else if StrToInt(Edit1.Text) = 0 then
  begin
    Edit1.Text := '00000';
    jaVerificouFaturamento := False;
    codigoClienteFaturamento := 0;
  end
  else
  begin
    if vDadosIniF.vModoConsulta <> 'A' then
    begin
      obCliente.selecionaCliente(StrToInt(Edit1.text));
    end;
    if StrToInt(Edit1.text) <> obCliente.dataSet.FieldByName('cod_cliente').AsInteger then
    begin
      lMensagem.Caption := 'Cliente não encontrado';
      if Edit1.CanFocus then
        Edit1.SetFocus;
    end
    else
    begin
      if codigoClienteFaturamento = 0 then
        jaVerificouFaturamento := False
      else if codigoClienteFaturamento <>
        obCliente.dataSet.FieldByName('cod_cliente').AsInteger then
        jaVerificouFaturamento := False;

      if (obCupom.vNumDAV > 0) or (obCupom.vNumPVenda > 0) then
        jaVerificouFaturamento := true;

      if not jaVerificouFaturamento then
      begin
        if not obCliente.faturamentoBarrado then
        begin
          if not obCliente.limiteDeCreditoEstouradoFechamento( obCupom.getSubTotal ) then
          begin
            jaVerificouFaturamento := true;
            codigoClienteFaturamento :=
              obCliente.dataSet.FieldByName('cod_cliente').AsInteger;
          end
          else
          begin
            if Edit1.CanFocus then
              Edit1.SetFocus;
            exit;
          end;
        end
        else
        begin
          if Edit1.CanFocus then
            Edit1.SetFocus;
          exit;
        end;
      end;
      DBLookupComboBox1.KeyValue := Edit1.Text;
      obCupom.setDadosAvulso( Edit1.Text + ' ' + obCliente.dataSet.FieldByName('nome_cliente').AsString,
        obCliente.dataSet.FieldByName('endereco').AsString + ', ' +
        obCliente.dataSet.FieldByName('num_end_cliente').AsString,
        obCliente.dataSet.FieldByName('bairro').AsString,
        obCliente.dataSet.FieldByName('cidade').AsString,
        obCliente.dataSet.FieldByName('sigla_uf').AsString,
        obCliente.dataSet.FieldByName('cpfcgc').AsString, '', '',
        obCliente.dataSet.FieldByName('nome_cliente').AsString);
    end;
  end;
end;

procedure TfrmFechamento.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', #13, #8] then
  else
    key := #0;
  if Key = #13 then
    gridFina.SetFocus;
end;

procedure TfrmFechamento.EditMoeda1Enter(Sender: TObject);
begin
  inherited;
  Label1.Visible := true;
  Label1.Refresh;
  frmFechamento.Refresh;
end;

procedure TfrmFechamento.EditMoeda1Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda1.Valor < 0 then
  begin
    Application.MessageBox('Valor menor ou igual a zero não é permitido', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    EditMoeda1.Valor := 0;
    EditMoeda1.SetFocus;
    exit;
  end;
end;

procedure TfrmFechamento.EditMoeda1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn1Click(Sender);
end;

procedure TfrmFechamento.EditMoeda2Enter(Sender: TObject);
begin
  inherited;
  Label2.Visible := true;
  Label2.Refresh;
  frmFechamento.Refresh;
end;

procedure TfrmFechamento.EditMoeda2Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda2.Valor < 0 then
  begin
    Application.MessageBox('Valor menor ou igual a zero não é permitido', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    EditMoeda2.Valor := 0;
    EditMoeda2.SetFocus;
    exit;
  end;
end;

procedure TfrmFechamento.EditMoeda3Enter(Sender: TObject);
begin
  inherited;
  Label3.Visible := true;
  Label3.Refresh;
  frmFechamento.Refresh;
end;

procedure TfrmFechamento.EditMoeda3Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda3.Valor < 0 then
  begin
    Application.MessageBox('Valor menor ou igual a zero não é permitido', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    EditMoeda3.Valor := 0;
    EditMoeda3.SetFocus;
    exit;
  end;
end;

procedure TfrmFechamento.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  vOK: Boolean;
begin
  inherited;
  //
  if (obCupom.emSubTotal) then
  begin
    vok := not fSemMsg;
    if vok then
    begin
      vOK := Application.MessageBox(pchar('Ao sair desta tela o cupom será cancelado!' + #13 +
      'Deseja mesmo cancelar o cupom?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes;
      if not vok then
      begin
        CanClose := False;
        clearVariaveis;
        gridFina.SetFocus;
        exit;
      end;
    end;
    if vOK then
    begin
      if (vDadosIniF.vUsaTef = 'E') and (obTef.getQtdeCartao > 0) then
      begin
        Screen.Cursor := crHourGlass;
        obTef.cancelaOperacoesAnteriores(CImpressoraF);
      end;
      while True do
      begin
        if not vDadosIniF.semComunicacaoComECF('N') then
          Break;
        Application.MessageBox('Impressora não responde. Sera feita uma nova tentativa', 'Atenção', 0 + 64);
      end;
      obCupom.cancelarCupom := 'S';
      ModalResult := mrAbort;
      exit;
    end
    else
    begin
      ModalResult := mrAbort;
      exit;
    end;
    CanClose := False;
  end;

//  if (not obCupom.emSubTotal)  then
//  begin
//    ModalResult := mrCancel;
//  end;
  if (CanClose) and (obTef.ArquivosImp.Count > 0) then
    obTef.ArquivosImp.Clear;
  clearVariaveis;
  gridFina.SetFocus;
end;

procedure TfrmFechamento.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vModoConsulta <> 'A' then
    Edit1.OnChange := nil;
end;

procedure TfrmFechamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    if Key = 78 then
    else if Key = VK_F2 then
    begin
      if Edit1.CanFocus then
        Edit1.SetFocus;
      if ((not obCliente.Active) or (obCliente.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
      begin
        try
          vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
          obCliente.getTodos;
        finally
          vDadosIniF.limpaMensagem;
        end;
      end;
      if (vDadosIniF.vModoConsulta <> 'A') then
        frmPesqClientes.ShowModal
      else if obCliente.Active then
        frmPesqClientes.ShowModal;
      Edit1.Text := obCliente.getCodigoCliente;
      obCliente.IndexFieldNames := 'COD_CLIENTE';
      obCliente.FindNearest([Edit1.Text]);
      Edit1Exit(Edit1);
    end
    else if key = 13 then
    begin
      //if (ActiveControl = BitBtn1) or (ActiveControl = EditMoeda1) or
      //  (ActiveControl = EditMoeda2) or (ActiveControl = EditMoeda3) then
      //  BitBtn1Click(Sender);
    end
    else if key = VK_ESCAPE then
    begin
      if (ActiveControl = gridFina) then
        BitBtn2Click(Sender)
      else
      begin
        gridFina.SetFocus;
        EditMoeda1.Valor := 0;
        EditMoeda2.Valor := 0;
        EditMoeda3.Valor := 0;
      end;
    end
    else if key = 74 then
    begin
      Label1.Visible := False;
      Label2.Visible := True;
      Label3.Visible := False;
      EditMoeda1.Visible := False;
      EditMoeda2.Visible := True;
      EditMoeda3.Visible := False;
      Self.Refresh;
      EditMoeda2.SetFocus;
      Label1.Refresh;
      Label2.Refresh;
      Label3.Refresh;
    end
    else if key = 75 then
    begin
      Label1.Visible := False;
      Label2.Visible := False;
      Label3.Visible := True;
      EditMoeda1.Visible := False;
      EditMoeda2.Visible := False;
      EditMoeda3.Visible := True;
      Self.Refresh;
      EditMoeda3.SetFocus;
      Label1.Refresh;
      Label2.Refresh;
      Label3.Refresh;
    end
    else if (key = 193) and (obCupom.getValorRestante > 0) and (not obCupom.somenteEmDinheiro) then
    begin
      obFinalizador.First;
      gridFinaDblClick(Sender);
      BitBtn1Click(Sender);
    end
    else if (key = 123) and (obCupom.getValorRestante > 0) and (not obCupom.somenteEmDinheiro) then
    begin
      if obFinalizador.cartao then
      begin
        gridFinaDblClick(Sender);
        BitBtn1Click(Sender);
      end;
    end;
  end
  else if Key = VK_F2 then
  begin
    if Edit1.CanFocus then
      Edit1.SetFocus;
    if ((not obCliente.Active) or (obCliente.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
    begin
      try
        vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
        obCliente.getTodos;
      finally
        vDadosIniF.limpaMensagem;
      end;
    end;
    if (vDadosIniF.vModoConsulta <> 'A') then
      frmPesqClientes.ShowModal
    else if obCliente.Active then
      frmPesqClientes.ShowModal;
    Edit1.Text := obCliente.getCodigoCliente;
    obCliente.IndexFieldNames := 'COD_CLIENTE';
    obCliente.FindNearest([Edit1.Text]);
    Edit1Exit(Edit1);
  end
  else if key = VK_F3 then
    BitBtn1Click(Sender)
  else if key = VK_ESCAPE then
    BitBtn2Click(Sender)
  else if key = VK_F5 then
  begin
    //PERMITIR DESCONTO NO TOTAL
    if not vDadosIniF.PesqPros('FIS054', 'HABILITAR', '', '', '')then
      Exit;

    Label1.Visible := False;
    Label2.Visible := True;
    Label3.Visible := False;
    EditMoeda1.Visible := False;
    EditMoeda2.Visible := True;
    EditMoeda3.Visible := False;
    Self.Refresh;
    EditMoeda2.SetFocus;
    Label1.Refresh;
    Label2.Refresh;
    Label3.Refresh;
  end
  else if key = VK_F6 then
  begin         
    //PERMITIR ACRESCIMO NO TOTAL
    if not vDadosIniF.PesqPros('FIS055', 'HABILITAR', '', '', '')then
      Exit;
    Label1.Visible := False;
    Label2.Visible := False;
    Label3.Visible := True;
    EditMoeda1.Visible := False;
    EditMoeda2.Visible := False;
    EditMoeda3.Visible := True;
    Self.Refresh;
    EditMoeda3.SetFocus;
    Label1.Refresh;
    Label2.Refresh;
    Label3.Refresh;
  end
  else if key = VK_F7 then
  begin
    gridFina.SetFocus;
    EditMoeda1.Valor := 0;
    EditMoeda2.Valor := 0;
    EditMoeda3.Valor := 0;
  end
  else if key = VK_F8 then
  begin
    if not obCupom.emSubTotal then
    begin
      Application.CreateForm(tfrmDadosAvulso, frmDadosAvulso);
      frmDadosAvulso.Edit1.Text := obCupom.getNomeAvulso;
      frmDadosAvulso.Edit2.Text := obCupom.getEnderecoAvulso;
      frmDadosAvulso.Edit3.Text := obCupom.getBairroAvulso;
      frmDadosAvulso.Edit4.Text := obCupom.getCidadeAvulso;
      frmDadosAvulso.Edit5.Text := obCupom.getEstadoAvulso;
      frmDadosAvulso.Edit6.Text := obCupom.getCpfCnpjAvulso;
      frmDadosAvulso.Edit7.Text := obCupom.getPlacaAvulso;
      frmDadosAvulso.Edit11.Text := obCupom.getKmAvulso;
      frmDadosAvulso.Tag := 1;
      frmDadosAvulso.PageControl1.ActivePage := frmDadosAvulso.TabSheet1;
      frmDadosAvulso.TabSheet1.Show;
      if frmDadosAvulso.ShowModal = mrOk then
        obCupom.setDadosAvulso(frmDadosAvulso.Edit1.Text, frmDadosAvulso.Edit2.Text,
          frmDadosAvulso.Edit3.Text,
          frmDadosAvulso.Edit4.Text, frmDadosAvulso.Edit5.Text, frmDadosAvulso.Edit6.Text,
          frmDadosAvulso.Edit7.Text,
          frmDadosAvulso.Edit11.Text);
      frmDadosAvulso.Free;
      frmDadosAvulso := nil;
    end;
    gridFina.SetFocus;
    EditMoeda1.Valor := 0;
    EditMoeda2.Valor := 0;
    EditMoeda3.Valor := 0;
  end
  else if (key = VK_F11) and (obCupom.getValorRestante > 0) and (not obCupom.somenteEmDinheiro) then
  begin
    if ActiveControl = Edit1 then
    begin
      Perform(WM_NEXTDLGCTL,0,0);
      if ActiveControl = Edit1 then
        exit;
    end;
    
    obFinalizador.First;
    gridFinaDblClick(Sender);
    BitBtn1Click(Sender);
  end;
end;

procedure TfrmFechamento.FormShow(Sender: TObject);
begin
  fSemMsg:= false;
  jaVerificouFaturamento := False;
  codigoClienteFaturamento := 0;
  inherited;
  Caption := 'Fechamento do Cupom '+CImpressoraF.NumeroCupom;
  obCliente.IndexFieldNames := 'COD_CLIENTE';
  Edit1.Text := IntToStr(obCupom.dataSet.FieldByName('cliente').AsInteger);
  if obCupom.CodCliente > 0 then
  begin
    obCliente.selecionaCliente(obCupom.dataSet.FieldByName('cliente').AsInteger);
    DBLookupComboBox1.KeyValue := obCupom.dataSet.FieldByName('cliente').AsInteger;
    Edit1.Enabled := False;
    DBLookupComboBox1.Enabled := False;
    Perform(WM_NEXTDLGCTL,0,0);
  end
  else
  begin
    Edit1.Enabled := True;
    DBLookupComboBox1.Enabled := True;
    if Edit1.CanFocus then
      Edit1.SetFocus;
  end;
  grupoValor.Enabled := false;
  clearVariaveis;
  executando := false;
  mTroco.Valor := 0;
  vApenasCheque := False;
  vApenasCartao := False;
  mValorDoc.Valor := obCupom.getSubTotal;
  mPago.Valor := obCupom.getSubTotal - obCupom.getValorRestante;
  mRestante.Valor := obCupom.getValorRestante;
  secao := 1;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    GroupBox1.Caption := 'Cliente do Cadastro';
    grupoControle.Caption := 'Forma de Pagamento';
    BitBtn1.Caption := 'OK (Enter)';
    Panel3.Caption := 'Desconto';
    Panel4.Caption := 'Acréscimo';
  end;
  if vDadosIniF.vUsaTef = 'E' then
    lMensagem.Caption := 'Informe o desconto ou acréscimo antes da forma de pagamento'
  else
    lMensagem.Caption := 'Selecione a Forma de Pagamento e aperte "Enter"';
  BringToFront;
  obTef.forcaFocoNoSistema(Application.Handle);
  Edit1.SelectAll;
end;

procedure TfrmFechamento.gridFinaDblClick(Sender: TObject);
begin
  inherited;
  if Pos('PRAZO',UpperCase(obFinalizador.getNomeFinalizador)) > 0 then
    if (StrToIntDef(Trim(Edit1.Text), 0) = 0) or
      (StrToIntDef(Trim(Edit1.Text), 0) = StrToIntDef(vDadosIniF.vCliente.vCodClientePadrao, 0)) then
      if vDadosIniF.PesqPros('FIS053', 'VENDA A PRAZO', '', '', '')then
      begin
        if (StrToIntDef(Trim(Edit1.Text), 0) = 0) then
          vDadosIniF.ShowErro('Cliente não informado. Venda a prazo não permitida')
        else if (StrToIntDef(Trim(Edit1.Text), 0) = StrToIntDef(vDadosIniF.vCliente.vCodClientePadrao, 0)) then
          vDadosIniF.ShowErro('Cliente padrão selecionado. Venda a prazo não permitida');
        Exit;
      end;
  Label1.Visible := True;
  Label2.Visible := False;
  Label3.Visible := False;
  EditMoeda1.Visible := True;
  EditMoeda2.Visible := False;
  EditMoeda3.Visible := False;
  EditMoeda1.Valor := obCupom.getValorRestante;
  EditMoeda1.SetFocus;
  if Pos('PRAZO',UpperCase(obFinalizador.getNomeFinalizador)) > 0 then
  begin
    if not vDadosIniF.PesqPros('FIS005', 'VENDA A PRAZO','VERIFICANDO PERMISSÃO PARA VENDA A PRAZO.','','')then
    exit;

    if FileExists(ExtractFilePath(Application.Exename) + 'ImpComp.exe') then
      WinExec(Pchar(ExtractFilePath(Application.Exename) + 'ImpComp.exe'), SW_SHOWNOACTIVATE);
  end;
end;

procedure TfrmFechamento.gridFinaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if KEY = VK_RETURN then
  begin
    gridFinaDblClick(Sender);
  end;
end;

procedure TfrmFechamento.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  GroupBox1.Font.Color := clNavy;
end;

procedure TfrmFechamento.GroupBox1Exit(Sender: TObject);
begin
  inherited;
  GroupBox1.Font.Color := clWindowText;
end;

procedure TfrmFechamento.grupoControleEnter(Sender: TObject);
begin
  inherited;
  grupoControle.Font.Color := clNavy;
end;

procedure TfrmFechamento.grupoControleExit(Sender: TObject);
begin
  inherited;
  grupoControle.Font.Color := clWindowText;
end;

procedure TfrmFechamento.Panel5Enter(Sender: TObject);
begin
  inherited;
  Panel5.Font.Color := clNavy;
end;

procedure TfrmFechamento.Panel5Exit(Sender: TObject);
begin
  inherited;
  Panel5.Font.Color := clWindowText;
  clearVariaveis;
end;

procedure TfrmFechamento.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(tfrmDadosAvulso, frmDadosAvulso);
  frmDadosAvulso.Edit1.Text := obCupom.getNomeAvulso;
  frmDadosAvulso.Edit2.Text := obCupom.getEnderecoAvulso;
  frmDadosAvulso.Edit3.Text := obCupom.getBairroAvulso;
  frmDadosAvulso.Edit4.Text := obCupom.getCidadeAvulso;
  frmDadosAvulso.Edit5.Text := obCupom.getEstadoAvulso;
  frmDadosAvulso.Edit6.Text := obCupom.getCpfCnpjAvulso;
  frmDadosAvulso.Edit7.Text := obCupom.getPlacaAvulso;
  frmDadosAvulso.Edit11.Text := obCupom.getKmAvulso;
  frmDadosAvulso.Tag := 1;
  frmDadosAvulso.PageControl1.ActivePage := frmDadosAvulso.TabSheet1;
  frmDadosAvulso.TabSheet1.Show;
  if frmDadosAvulso.ShowModal = mrOk then
    obCupom.setDadosAvulso(frmDadosAvulso.Edit1.Text, frmDadosAvulso.Edit2.Text,
      frmDadosAvulso.Edit3.Text,
      frmDadosAvulso.Edit4.Text, frmDadosAvulso.Edit5.Text, frmDadosAvulso.Edit6.Text,
      frmDadosAvulso.Edit7.Text,
      frmDadosAvulso.Edit11.Text);
  frmDadosAvulso.Free;
  frmDadosAvulso := nil;
end;

procedure TfrmFechamento.Timer1Timer(Sender: TObject);
begin
  inherited;
  if Timer1.Enabled then
  begin
    Timer1.Enabled := false;
    try
      obTef.forcaFocoNoSistema(Application.Handle);
      if gridFina.Enabled then
      try
         gridFina.SetFocus;
      Except
      end;
    finally
      Timer1.Enabled := false;
    end;
  end;
end;

initialization
  RegisterClass(TfrmFechamento);
finalization
  UnRegisterClass(TfrmFechamento);

end.

