unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, uPadrao, StdCtrls, jpeg, Menus, Buttons, AppEvnts,
  DB, IBDatabase, uEditMoeda, uDadosIniFiscal, Uimpressoras,
  uCadastrosF, uHwF, uCupom, EnterantHw, ComCtrls, ExtCtrls, Controls,
  unFuncoesTEF, uImpressoraF;

type
  TfrmPrincipalFiscal = class(TfrmPadrao)
    lMsg: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    EDcodBar: TEdit;
    ldescricao: TPanel;
    GroupBox2: TGroupBox;
    StatusBar2: TStatusBar;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    imgLogo: TImage;
    imgHw: TImage;
    MainMenu1: TMainMenu;
    Configuracoes1: TMenuItem;
    FormPagamento1: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Button1: TButton;
    ApplicationEvents1: TApplicationEvents;
    Button2: TButton;
    Button3: TButton;
    Sair1: TMenuItem;
    eSubTotal: TEditMoeda;
    Utilitrios1: TMenuItem;
    PesquisaClientes1: TMenuItem;
    PesquisaProdutos1: TMenuItem;
    PesquisaServios1: TMenuItem;
    N1: TMenuItem;
    LeituradaMemriaFiscal1: TMenuItem;
    N2: TMenuItem;
    SangriaSuprimentos1: TMenuItem;
    N3: TMenuItem;
    AtivarHorriodeVero1: TMenuItem;
    DesativarHorriodeVero1: TMenuItem;
    N4: TMenuItem;
    LeituraX1: TMenuItem;
    ReduoZ1: TMenuItem;
    N5: TMenuItem;
    AbrirGaveta1: TMenuItem;
    N6: TMenuItem;
    CancelarCupomAtual1: TMenuItem;
    CancelarltimoCupom1: TMenuItem;
    CancelarItensemqualquerposio1: TMenuItem;
    Button4: TButton;
    TimerIni: TTimer;
    Button5: TButton;
    Edit1: TEdit;
    N7: TMenuItem;
    Consulta1: TMenuItem;
    AlternarentrenotadeServioeProduto1: TMenuItem;
    eVlUnit: TEditMoeda;
    timerConsulta: TTimer;
    DescontonoItem1: TMenuItem;
    Memo1: TMemo;
    N8: TMenuItem;
    ConfirmarVenda1: TMenuItem;
    Fechamento1: TMenuItem;
    Hw1: TMenuItem;
    Evaldo1: TMenuItem;
    Evaldo21: TMenuItem;
    Edit2: TEdit;
    Button6: TButton;
    CheckBox1: TCheckBox;
    procedure ConfirmarVenda1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Evaldo21Click(Sender: TObject);
    procedure Evaldo1Click(Sender: TObject);
    procedure CancelarItensemqualquerposio1Click(Sender: TObject);
    procedure eSubTotalEnter(Sender: TObject);
    procedure eVlUnitEnter(Sender: TObject);
    procedure CancelarCupomAtual1Click(Sender: TObject);
    procedure DescontonoItem1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure timerConsultaTimer(Sender: TObject);
    procedure AlternarentrenotadeServioeProduto1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure CancelarltimoCupom1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure EDcodBarExit(Sender: TObject);
    procedure AbrirGaveta1Click(Sender: TObject);
    procedure ReduoZ1Click(Sender: TObject);
    procedure LeituraX1Click(Sender: TObject);
    procedure DesativarHorriodeVero1Click(Sender: TObject);
    procedure AtivarHorriodeVero1Click(Sender: TObject);
    procedure SangriaSuprimentos1Click(Sender: TObject);
    procedure LeituradaMemriaFiscal1Click(Sender: TObject);
    procedure PesquisaServios1Click(Sender: TObject);
    procedure PesquisaProdutos1Click(Sender: TObject);
    procedure PesquisaClientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Timer2Timer(Sender: TObject);
    procedure FormPagamento1Click(Sender: TObject);
    procedure Configuracoes1Click(Sender: TObject);
  private
    { Private declarations }
    vtpVnd: Integer; // 1 = Verdadeiro; 2 = Falso
    nItens: word;
    nBarra: string;
    enter: Boolean;
    //
    vConsulta, vProdServ, vPrecoAVista: string;
    function ConsultaItem: boolean;
    function buscarProdutoBarra: boolean;
    procedure limpaTela;
  public
    { Public declarations }
  end;
  //pkFiscal TFrmPrincipalFiscal ºC24 ºZ24
var
  frmPrincipalFiscal: TfrmPrincipalFiscal;
  vDadosIniF: TIni;
  CImpressoraF: TImpressoraF;
  obCupom: TCupom;
  obResumoD: TResumoD;
  obCliente: TCliente;
  obProd: TProduto;
  obServ: TServico;
  obSangSup: TSangSup;
  obTef : TTEF;
  hd:THandle;

  //Objeto do Tipo Impressora

implementation

uses uDtmFiscalHw, uConfiguracoes, uDtmFormPag, funcoesF, IB, uPesqClientesF,
  uPesqProdutosF, uPesqServicosF, uComandosPDV, uDtmCupom, uSangSup,
  uDadosIni, uDtmFiscalHwF, uDtmFiscal, uEscTpPrec, uDescItem, uCancelarItens,
  udtmTef, uFechamento;

{$R *.dfm}

procedure TfrmPrincipalFiscal.AbrirGaveta1Click(Sender: TObject);
begin
  inherited;
  //processo
  if Application.MessageBox('Atenção !!!' + #13 + 'Deseja Abrir Gaveta', 'Confirmação', MB_YESNO)
    = mrNo then
    exit;
  vDadosIniF.abreGaveta;
end;

procedure TfrmPrincipalFiscal.AlternarentrenotadeServioeProduto1Click(
  Sender: TObject);
begin
  inherited;
  if vProdServ = 'P' then
    vProdServ := 'S'
  else
    vProdServ := 'P';
end;

procedure TfrmPrincipalFiscal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  inherited;
  if E is EIBInterBaseError then
  begin
    //  timerBancoRede.Enabled := false;
    if pos('Unable to complete network request to host', e.Message) > 0 then
    begin
      ShowMessage('Erro de rede com o banco');
    end;
  end;
end;

procedure TfrmPrincipalFiscal.AtivarHorriodeVero1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIniF.ativarHorarioVerao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmPrincipalFiscal.BuscarProdutoBarra: boolean;
var
  vcod, vgrupo: integer;
  vnb: string;
  i: integer;
  vval: currency;
  Qtdpend: real;
begin
  try
    if nItens < 1 then
    begin
      vtpVnd := 0;
      if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('uspolprec').AsString) = 'S' then
      begin
        vtpVnd := 0;
        Application.CreateForm(TfrmEscPolPreco, frmEscPolPreco);
        if frmEscPolPreco.ShowModal = mrOK then
          vtpVnd := frmEscPolPreco.ComboBox1.ItemIndex;
        //jp        eVlUnit.Valor := obProd.getValor(vtpVnd);
        FrmEscPolPreco.free;
      end;
    end;
    if trim(EDcodBar.Text) = '' then
      raise exception.create('Código não informado');

    //    DM.TBBarra.IndexName := 'CodBarra';
    (*if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('leitura_sup').AsString) = 'S' then
    begin
      try
        nbarra := vDadosIniF.StrZeroDec(strtoint64(Trim(nbarra)), 13, 0);
      except
        if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('Leitor_Serial').AsString) = 'S' then
          dtmFiscalHw.proLeitor.DonePort;
        Application.MessageBox(pchar('erro de conversao'), 'Informação', mb_OK);
        if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('Leitor_Serial').AsString) = 'S' then
        begin
          dtmFiscalHw.proLeitor.open;
          dtmFiscalHw.proLeitor.DTR := True;
          dtmFiscalHw.proLeitor.RTS := True;
        end;
        EdCodBar.Text := '';
        EDcodBar.SetFocus;
        vPassarpelocodigo := 1;
        vVoltarCodigobarra := 1;
        Exit;
      end;
      vnb := nbarra;
      if copy(vnb, 1, 1) = '2' then
      begin
        if length(vnb) < 13 then
        begin
          nbarra := strzero(strtoint(Trim(nbarra)), 13, 0);
          if not DM.TBbarra.FindKey([Trim(nbarra)]) then
            nbarra := vnb;
        end
        else
        begin
          nbarra := strzero(strtoint(copy(Trim(nbarra), 2, 4)), 13, 0);
          if not DM.TBbarra.FindKey([Trim(nbarra)]) then
            nbarra := vnb;
        end;
      end;
      if length(nbarra) < 13 then
        nbarra := strzero(strtoint64(nbarra), 13, 0);
    end;
    if not DM.TBbarra.FindKey([Trim(nbarra)]) then
    begin
      if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
        VaComm1.close;
      showmessage('Produto Inexistente');
      vflret := 2;
      if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
      begin
        VaComm1.open;
        VaComm1.SetDTR(True);
        VaComm1.SetRTS(True);
      end;
      EdCodBar.Text := '';
      EDcodBar.SetFocus;
      vPassarpelocodigo := 1;
      vVoltarCodigobarra := 1;
      Exit;
    end
    else
    begin
      if decodifica(dm.TBConfImpConsEstoqRet.value) = 'S' then
      begin
        with dm do
        begin
          QrEmpresa.OPEN;
          qtdpend := 0;
          if QrEmpresaAPRES_ESTR.value = 'S' then
          begin
            DM.QrProcBarra.close;
            if vmultl = 'S' then
            begin

              Dm.QrProcBarra.sql.text :=
                'SELECT PR.EST_F,PR.GRUPO_PROD,PR.COD_PROD FROM PRODUTOS PR,COD_BARRA CDB WHERE CDB.COD_BARRA = ' +
                ':vcod AND CDB.COD_PROD = ' +
                'PR.COD_PROD AND CDB.GRUPO_PROD = PR.GRUPO_PROD AND PR.COD_EMPRESA = ' +
                  dm.TEmpresaCOD_EMP.asstring + ' AND PR.COD_EMPRESA = CDB.COD_EMPRESA ';
              //
              QrProcBarra.params[0].value := nbarra;
              QrProcBarra.open;
              QrvndProd.close;
              QrvndProd.sql.text :=
                'Select sum(itos.quant_os_prod) from os_item_prod itos,ordem_serv os where ' +
                'itos.cod_prod = :vcod and itos.grupo_prod = :vgr ' +
                'and itos.n_os = os.n_os and (os.data_fec_os is null) and itos.COD_EMPRESA = ' +
                  dm.TEmpresaCOD_EMP.asstring + ' and itos.cod_empresa = os.cod_empresa';
              QrvndProd.params[0].asstring := QrProcBarra.Fields[2].AsString;
              QrvndProd.params[1].asinteger := QrProcBarra.Fields[1].asinteger;
              QrvndProd.open;
              qtdpend := QrvndProd.fields[0].asfloat;
              QrvndProd.close;
              QrvndProd.sql.text :=
                'Select sum(it.quant_rq_item) from reqvenda_itens it,reqvenda rq where ' +
                'it.cod_prod = :vcod and it.grupo_prod = :vgrup and ' +
                'it.nreq = rq.nreq and (rq.data_c is null) and it.cod_empresa =' +
                  dm.TEmpresaCOD_EMP.asstring + 'and it.cod_empresa = rq.cod_empresa';
              QrvndProd.params[0].asstring := QrProcBarra.Fields[2].AsString;
              QrvndProd.params[1].asinteger := QrProcBarra.Fields[1].asinteger;
              QrvndProd.open;
              qtdpend := qtdpend + QrvndProd.fields[0].asfloat;

              {              Dm.QrProcBarra.sql.text := 'SELECT (PR.EST_F-((' +
                              'Select sum(itos.quant_os_prod) from os_item_prod itos,ordem_serv os where ' +
                              'itos.cod_prod = pr.cod_prod and itos.grupo_prod = pr.grupo_prod ' +
                              'and itos.n_os = os.n_os and (os.data_fec_os is null) and pr.cod_empresa = itos.cod_empresa and itos.cod_empresa = os.cod_empresa)+ ' +
                              '(Select sum(it.quant_rq_item) from reqvenda_itens it,reqvenda rq where ' +
                              'it.cod_prod = pr.cod_prod and it.grupo_prod = pr.grupo_prod and ' +
                              'it.nreq = rq.nreq and (rq.data_c is null) and it.cod_empresa = pr.cod_empresa and it.cod_empresa = rq.cod_empresa))) ' +
                              'FROM PRODUTOS PR,COD_BARRA CDB WHERE CDB.COD_BARRA = ' +
                              ':vcod AND CDB.COD_PROD = ' +
                              'PR.COD_PROD AND CDB.GRUPO_PROD = PR.GRUPO_PROD AND PR.COD_EMPRESA = ' + dm.TEmpresaCOD_EMP.asstring + ' AND PR.COD_EMPRESA = CDB.COD_EMPRESA '}
            end
            else
            begin
              Dm.QrProcBarra.sql.text := 'SELECT PR.EST_F,PR.GRUPO_PROD,PR.COD_PROD' +
                ' FROM PRODUTOS PR,COD_BARRA CDB WHERE CDB.COD_BARRA = ' +
                ':vcod AND CDB.COD_PROD = ' +
                'PR.COD_PROD AND CDB.GRUPO_PROD = PR.GRUPO_PROD ';
              QrProcBarra.params[0].value := nbarra;
              QrProcBarra.open;
              QrvndProd.close;
              QrvndProd.sql.text :=
                'Select sum(itos.quant_os_prod) from os_item_prod itos,ordem_serv os where ' +
                'itos.cod_prod = :vcod and itos.grupo_prod = :vgr ' +
                'and itos.n_os = os.n_os and (os.data_fec_os is null) ';
              QrvndProd.params[0].asstring := QrProcBarra.Fields[2].AsString;
              QrvndProd.params[1].asinteger := QrProcBarra.Fields[1].asinteger;
              QrvndProd.open;
              qtdpend := QrvndProd.fields[0].asfloat;
              QrvndProd.close;
              QrvndProd.sql.text :=
                'Select sum(it.quant_rq_item) from reqvenda_itens it,reqvenda rq where ' +
                'it.cod_prod = :vcod and it.grupo_prod = :vgrup and ' +
                'it.nreq = rq.nreq and (rq.data_c is null) ';
              QrvndProd.params[0].asstring := QrProcBarra.Fields[2].AsString;
              QrvndProd.params[1].asinteger := QrProcBarra.Fields[1].asinteger;
              QrvndProd.open;
              qtdpend := qtdpend + QrvndProd.fields[0].asfloat;
              {Dm.QrProcBarra.sql.text := 'SELECT (PR.EST_F-((' +
                'Select sum(itos.quant_os_prod) from os_item_prod itos,ordem_serv os where ' +
                'itos.cod_prod = pr.cod_prod and itos.grupo_prod = pr.grupo_prod ' +
                'and itos.n_os = os.n_os and os.data_fec_os is null)+ ' +
                '(Select sum(it.quant_rq_item) from reqvenda_itens it,reqvenda rq where ' +
                'it.cod_prod = pr.cod_prod and it.grupo_prod = pr.grupo_prod and ' +
                'it.nreq = rq.nreq and rq.data_c is null))) ' +
                'FROM PRODUTOS PR,COD_BARRA CDB WHERE CDB.COD_BARRA = ' +
                ':vcod AND CDB.COD_PROD = ' +
                'PR.COD_PROD AND CDB.GRUPO_PROD = PR.GRUPO_PROD '}
            end;
          end
          else
          begin
            DM.QrProcBarra.close;
            if vmultl = 'S' then
            begin
              Dm.QrProcBarra.sql.text := 'SELECT PR.EST_F ' +
                'FROM PRODUTOS PR,COD_BARRA CDB WHERE CDB.COD_BARRA = ' +
                ':vcod AND CDB.COD_PROD = ' +
                'PR.COD_PROD AND CDB.GRUPO_PROD = PR.GRUPO_PROD AND PR.COD_EMPRESA = CDB.COD_EMPRESA AND PR.COD_EMPRESA = ' +
                  DM.TEmpresaCOD_EMP.ASSTRING;
            end
            else
              Dm.QrProcBarra.sql.text := 'SELECT PR.EST_F ' +
                'FROM PRODUTOS PR,COD_BARRA CDB WHERE CDB.COD_BARRA = ' +
                ':vcod AND CDB.COD_PROD = ' +
                'PR.COD_PROD AND CDB.GRUPO_PROD = PR.GRUPO_PROD ';

            Dm.QrProcBarra.params[0].value := nbarra;
            Dm.QrProcBarra.open;

          end;
        end;
        if nquant > (Dm.QrProcBarra.Fields[0].asfloat - Qtdpend) then
        begin
          showmessage('Estoque Insuficiente');
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
          begin
            VaComm1.open;
            VaComm1.SetDTR(True);
            VaComm1.SetRTS(True);
          end;
          EdCodBar.Text := '';
          EDcodBar.SetFocus;
          vPassarpelocodigo := 1;
          vVoltarCodigobarra := 1;
          dm.QrEmpresa.close;
          Dm.QrProcBarra.close;
          Exit;
        end;
        dm.QrEmpresa.close;
        Dm.QrProcBarra.close;
      end;
      // PAREI
      EDcodBar.Clear;
      vPassarpelocodigo := 2;
      vVoltarCodigobarra := 2;
      DM.TbProduto.IndexName := 'Produto4';
      DM.TBBarra.IndexName := 'CodPro';
      vcod := Dm.TBBarraCodPro.value;
      vgrupo := Dm.TBBarragrupo.value;
      if DM.TBProduto.FindKey([vcod, vgrupo]) then
        if decodifica(dm.TBConfImpSupMerc.value) <> 'S' then
          nbarra := cps.strzero(dm.TBProdutoGRUPO.value, 3, 0) +
            cps.strzero(dm.TBProdutoCODIGO.value, 6, 0);

      //         IF DM.TBProdutoRef.AsString = 'KG' then
      //            Begin
      //             if dm.TBProdutoBalanca.value = 'S' then

      if vflretp = 1 then
      begin
        if Dm.QrVndRetItpreco.value <= 0 then
        begin
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
            VaComm1.close;
          messagedlg('Valor igual a Zero', mtinformation, [mbOK], 0);
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
          begin
            VaComm1.open;
            VaComm1.SetDTR(True);
            VaComm1.SetRTS(True);
          end;
          EdCodBar.Text := '';
          EDcodBar.SetFocus;
          vPassarpelocodigo := 1;
          vVoltarCodigobarra := 1;
          Exit;
        end;
        if (Dm.QrVndRetItDescr_it.asstring = '') or (dm.QrVndRetItDescr_it.IsNull) then
        begin
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
            VaComm1.close;
          messagedlg('Descrição inválida', mtinformation, [mbOK], 0);
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
          begin
            VaComm1.open;
            VaComm1.SetDTR(True);
            VaComm1.SetRTS(True);
          end;
          EdCodBar.Text := '';
          EDcodBar.SetFocus;
          vPassarpelocodigo := 1;
          vVoltarCodigobarra := 1;
          Exit;
        end;

      end
      else
      begin
        if vtpVnd = 0 then
          vval := dm.TBProdutoPVENDA.value
        else
          vval := dm.TBProdutoPvendaPrazo.value;
        if vval <= 0 then
        begin
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
            VaComm1.close;
          messagedlg('Valor igual a Zero', mtinformation, [mbOK], 0);
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
          begin
            VaComm1.open;
            VaComm1.SetDTR(True);
            VaComm1.SetRTS(True);
          end;
          EdCodBar.Text := '';
          EDcodBar.SetFocus;
          vPassarpelocodigo := 1;
          vVoltarCodigobarra := 1;
          Exit;
        end;
        if (dm.TBProdutoDESCRICAO.AsString = '') or (dm.TBProdutoDESCRICAO.IsNull) then
        begin
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
            VaComm1.close;
          messagedlg('Descrição inválida', mtinformation, [mbOK], 0);
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
          begin
            VaComm1.open;
            VaComm1.SetDTR(True);
            VaComm1.SetRTS(True);
          end;
          EdCodBar.Text := '';
          EDcodBar.SetFocus;
          vPassarpelocodigo := 1;
          vVoltarCodigobarra := 1;
          Exit;
        end;
        if dm.TBConfImpMax_desc_Perc.value > 0 then
        begin
          if ((((vdescitemv * 100) / vval) + vdescitem) > dm.TBConfImpMax_desc_Perc.value) then
          begin
            if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
              VaComm1.close;
            messagedlg('Desconto maior que o Máximo permitido ' + format('%n',
              [dm.TBConfImpMax_desc_Perc.value]) + '%', mtinformation, [mbOK], 0);
            if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
            begin
              VaComm1.open;
              VaComm1.SetDTR(True);
              VaComm1.SetRTS(True);
            end;
            EdCodBar.Text := '';
            EDcodBar.SetFocus;
            vPassarpelocodigo := 1;
            vVoltarCodigobarra := 1;
            Exit;
          end;
        end
        else
        begin
          if (((vdescitemv * 100) / vval) + vdescitem) >= 100 then
          begin
            if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
              VaComm1.close;
            messagedlg('Desconto maior que o Máximo permitido ' + format('%n', [100.00]) + '%',
              mtinformation, [mbOK], 0);
            if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
            begin
              VaComm1.open;
              VaComm1.SetDTR(True);
              VaComm1.SetRTS(True);
            end;
            EdCodBar.Text := '';
            EDcodBar.SetFocus;
            vPassarpelocodigo := 1;
            vVoltarCodigobarra := 1;
            Exit;
          end;
        end;
      end;

      {if pos('\',dm.TBProdutoDESCRICAO.value) > 0 then
      begin
       if dm.TBConfImpLeitorSerial.value = 'S' then
        VaComm1.close;
       messagedlg('Caracter ''\'' especial, favor corrigir descricao',mtinformation,[mbOK],0);
       if dm.TBConfImpLeitorSerial.value = 'S' then
       begin
        VaComm1.open;
        VaComm1.SetDTR(True);
        VaComm1.SetRTS(True);
       end;
       EdCodBar.Text:='';
       EDcodBar.SetFocus;
       vPassarpelocodigo:=1;
       vVoltarCodigobarra:=1;
       Exit;
      end;}
      if copy(vnb, 1, 1) = '2' then
      begin
        if length(vnb) < 13 then
        else
        begin
          if vtpVnd = 0 then
            nQuant := (strtofloat(copy(Trim(vnb), 8, 3) + ',' + copy(Trim(vnb), 11, 2)) /
              DM.TBProdutoPVENDA.ascurrency)
          else
            nQuant := (strtofloat(copy(Trim(vnb), 8, 3) + ',' + copy(Trim(vnb), 11, 2)) /
              DM.TBProdutoPvendaPrazo.ascurrency);
          nquant := strtofloat(FloatToStrF(nquant, ffnumber, 12, 3));
        end;
      end;
      if nQuant = 0 then
      begin
        if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
          VaComm1.close;
        messagedlg('Quantidade igual a Zero', mtinformation, [mbOK], 0);
        if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
        begin
          VaComm1.open;
          VaComm1.SetDTR(True);
          VaComm1.SetRTS(True);
        end;
        EdCodBar.Text := '';
        EDcodBar.SetFocus;
        vPassarpelocodigo := 1;
        vVoltarCodigobarra := 1;
        Exit;
      end;
      {   vSairDoCodigo:=1;
         vPassarpelocodigo:=2;
         CBFP.Text:='TEXTO';
         vVoltarCodigobarra:=1;
         MaskEdit2.Clear;
         Panel6.Visible:=True;
         Panel6.BringToFront;
         MaskEdit2.SetFocus;}
//            End;
      if vflretp < 1 then
      begin
        if (DM.TBProdutoAltDesc.AsString = 'S') or (DM.TBProdutoAltPreco.AsString = 'S') then
        begin
          vSairDoCodigo := 1;
          vPassarpelocodigo := 2;
          CBFP.Text := 'TEXTO';
          vVoltarCodigobarra := 1;
          Panel2.Visible := True;
          Panel2.BringToFront;
          MaskEdit1.Text := DM.TbPRODUTOdescricao.AsString;
          if vflretp = 1 then
            MaskEdit3.Text := DM.QrVndRetItpreco.asstring
          else
          begin
            if vtpVnd = 0 then
              MaskEdit3.Text := DM.TbPRODUTOPvenda.AsString
            else
              MaskEdit3.Text := DM.TBProdutoPvendaPrazo.AsString;
          end;
          MaskEdit1.SetFocus;
          MaskEdit1.enabled := True;
          MaskEdit1.Color := clWindow;
          //                MaskEdit3.enabled:=True;
          //                MaskEdit3.Color:=clWindow;
          MaskEdit1.SetFocus;
          if (DM.TBProdutoAltDesc.AsString = 'N') and (DM.TBProdutoAltPreco.AsString = 'S') then
          begin
            MaskEdit1.enabled := False;
            MaskEdit1.Color := clInactiveCaptionText;
            MaskEdit3.SetFocus;
          end;
          if (DM.TBProdutoAltDesc.AsString = 'S') and (DM.TBProdutoAltPreco.AsString = 'N') then
          begin
            MaskEdit1.SetFocus;
            MaskEdit3.enabled := False;
            MaskEdit3.Color := clInactiveCaptionText;
          end;
        end;
      end;
      if DM.TBProdutoSitTributaria.AsString = 'ICMS' then
      begin
        if PesqAliq then
          vSitTributaria := Trim(DM.TBAliqSequencia.AsString)
        else
        begin
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
            VaComm1.close;
          messagedlg('Aliquota Nao programada', mtinformation, [mbOK], 0);
          if decodifica(dm.TBConfImpLeitorSerial.value) = 'S' then
          begin
            VaComm1.open;
            VaComm1.SetDTR(True);
            VaComm1.SetRTS(True);
          end;
          EdCodBar.Text := '';
          EDcodBar.SetFocus;
          vPassarpelocodigo := 1;
          vVoltarCodigobarra := 1;
          Exit;
        end;
      end;
      if DM.TBProdutoSitTributaria.AsString = 'ISENTO' then
      begin
        vSitTributaria := 'II';
      end;
      if DM.TBProdutoSitTributaria.AsString = 'SUBTRIBUTARIA' then
      begin
        vSitTributaria := 'FF';
      end;
      if DM.TBProdutoSitTributaria.AsString = 'NAOINCIDENCIA' then
      begin
        vSitTributaria := 'NN';
      end;
    end;
    *)
  except on e: exception do
    begin
      result := false;
      application.messagebox(pchar(e.message), 'Erro', mb_OK);
    end;
  end;
end;

procedure TfrmPrincipalFiscal.Button1Click(Sender: TObject);
begin
  inherited;
  //  ShowMessage(vDadosIniF.codEmpresa);
  //  portaCom.Open:=True;
//  portaCom.InitPort;
end;

procedure TfrmPrincipalFiscal.Button2Click(Sender: TObject);
begin
  inherited;
  //
//  MessageDlg('Foi', mtInformation, [mbAll, mbNo, mbCancel, mbYes, mbYesToAll], 0);
//  ShowMessage(vDadosIniF.vNomeUsuario);
//  obConfImp.Gencodigo('12CUPOM', dtmCupom.SpIncCodigo, '1');
//  DtmCupom.transacaoCupom.Commit;
//  obConfImp.CommitaTransacao;
//  ShowMessage(vDadosIniF.getN);
  ShowMessage(vDadosIniF.vCodTerminal);
  ShowMessage(vDadosIniF.vNumSerieEcf);
  ShowMessage(vDadosIniF.vUsaCodigoBarras);
  ShowMessage(vDadosIniF.vBancoHW);
end;

procedure TfrmPrincipalFiscal.Button3Click(Sender: TObject);
begin
  inherited;
  //  ShowMessage(vDadosIniF.vnomeEmpresa);
//  portaCom.DonePort;
end;

procedure TfrmPrincipalFiscal.Button4Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIniF.vCodTerminal := obConfImp.dataSet.FieldByName('cod_terminal').AsString;
    vDadosIniF.vNumSerieEcf :=
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
    vDadosIniF.vUsaCodigoBarras :=
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString);
    if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString) = 'S' then
      frmPrincipalFiscal.caption := frmPrincipalFiscal.caption + ' - Teclado PDV'
    else
      frmPrincipalFiscal.caption := frmPrincipalFiscal.caption + ' - Teclado Padrão';
  finally
    vDadosIniF.limpaMensagem;
  end;
end;

procedure TfrmPrincipalFiscal.Button5Click(Sender: TObject);
begin
  inherited;
  ShowMessage('Teste');
  //ShowMessage();
end;

procedure TfrmPrincipalFiscal.Button6Click(Sender: TObject);
begin
  inherited;
  obTef.operacaoAdministrativo(CImpressoraF,CheckBox1.Checked);
end;

procedure TfrmPrincipalFiscal.CancelarCupomAtual1Click(Sender: TObject);
var
  vflagc: integer;
begin
  inherited;
  if not vDadosIniF.EnvCmdsCupom(6) then
    exit;
  if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_PDV').AsString) <> 'S' then
    Application.MessageBox(pchar('Atenção !!!' + #13 + 'será Cancelado o Cupom Atual'),
      'Atenção', mb_OK);
  vflagc := 0;
  if not CImpressoraF.CancelaCupom(vDadosIniF.vSubTotal) then
  begin
    exit;
  end
  else
  begin
    CImpressoraF.FechaPortaSerial;
    obCupom.cancelarCupom;
    lMsg.Caption := '<<<< CAIXA LIVRE >>>>';
    Memo1.Clear;
    Edit1.Text := '';
    eVlUnit.Valor := 0;
    eSubTotal.Valor := 0;
  end;

  //  if vflagc <> 1 then
  //    CImpressoraF.FechaPortaSerial;

    //    if vRedeFuncionando = 2 then // Rede Desconectada
    //    begin
  obCupom.cancelarCupom;
  lMsg.Caption := '<<<< CAIXA LIVRE >>>>';
  Memo1.Clear;
  {if decodifica(DM.TBConfImpUsarTEF.value) = 'S' then
  begin
    Utilitrios.Enabled := false;
    Sair1.enabled := false;
    ParametrosdoSistema1.Enabled := false;
    EDcodBar.ReadOnly := true;
    timer1.Enabled := false;
    if vtefdial = 'S' then
    begin
      iTEFTecban := 0;
      sTEFPath := 'C:\TEF_DIAL\';
  //    TEFVerificaGerenciadorAtivo; 10/06/2008
    end;
    //
    if vtefdisc = 'S' then
    begin
      iTEFTecban := 1;
      sTEFPath := 'C:\TEF_DISC\';
//        TEFVerificaGerenciadorAtivo; 10/06/2008
      iTEFTecban := 0;
      sTEFPath := 'C:\TEF_DIAL\';
    end;
    //   TEFVerificaGerenciadorAtivo;
    if vtefdial = 'S' then
    begin
      iTEFTecban := 0;
      sTEFPath := 'C:\TEF_DIAL\';
      TEFVerificaOperacaoPendente;
    end;
    // Verifica Tef_Disc
    if vtefdisc = 'S' then
    begin
      iTEFTecban := 1;
      sTEFPath := 'C:\TEF_DISC\';
      TEFVerificaOperacaoPendente;
      iTEFTecban := 0;
      sTEFPath := 'C:\TEF_DIAL\';
    end;
    //   TEFVerificaOperacaoPendente;
    FileListBox2.Directory := sTEFKoneKPath;
    for iimp := 0 to FileListBox2.Items.Count - 1 do
      DeleteFile(sTEFKoneKPath + FileListBox2.Items.Strings[iimp]);
    Dm.TbTransTEF.close;
    Dm.TbTransTEF.open;
    if not Dm.TbTransTEF.isempty then
      messagedlg('Existem Transações TEF Pendentes para cancelamento', mtinformation, [mbOK], 0);
    while not Dm.TbTransTEF.eof do
    begin
      sTEFValorTotal := DM.TbTransTEFValor.value;
      sTEFNSUTransacao := dm.TbTransTEFNsuTrans.value;
      sTEFDataTransacao := DM.TbTransTEFDataTrans.value;
      sTEFHoraTransacao := dm.TbTransTEFHora.value;
      sTEFNomeDaRede := dm.TbTransTEFRedeTrans.value;
      if Cancela_Ant then
        Dm.TbTransTEF.delete
      else
      begin
        if vmens = '1' then
        begin
          TEFMensagemC(sTEFMensOperador);
          vmens := '0';
        end;
      end;
    end;
    timer1.Enabled := true;
    Utilitrios.Enabled := true;
    Sair1.enabled := true;
    ParametrosdoSistema1.Enabled := true;
    EDcodBar.ReadOnly := false;
    //   Enabled:=true;
  end;}
end;

procedure TfrmPrincipalFiscal.CancelarItensemqualquerposio1Click(
  Sender: TObject);
begin
  inherited;
  if vDadosIniF.cancelarItemDoCupom then
  begin
    Memo1.Lines.Add(vDadosIniF.PadR('CANC. ITEM:' +
      vDadosIniF.StrZeroDec(trunc(obCupom.vItem.getNItem), 3, 0), 30, ' ') + ' ' +
      vDadosIniF.PadL(FormatFloat('###,###,##0.000',
      (obCupom.vItem.dataSet.FieldByName('total').AsFloat)), 12, ' '));
    eSubTotal.Valor := obCupom.getSubTotal;
  end;
end;

procedure TfrmPrincipalFiscal.CancelarltimoCupom1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Tem certeza que deseja cancelar o ultimo cupom?', 'Confirmação',
    MB_YESNO) = mrNO then
    exit;
  vDadosIniF.cancelaUltimoCupomEmitido;
end;

procedure TfrmPrincipalFiscal.Configuracoes1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmConfiguracoes, frmConfiguracoes);
  frmConfiguracoes.ShowModal;
end;

procedure TfrmPrincipalFiscal.ConfirmarVenda1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmFechamento,frmFechamento);
  if not vDadosIniF.EnvCmdsCupom(6) then
    exit;
  if obCupom.getSubTotal = 0 then
  begin

  end;


  frmFechamento.Memo1.Lines := Memo1.Lines;
  frmFechamento.ShowModal;
end;

procedure TfrmPrincipalFiscal.Consulta1Click(Sender: TObject);
begin
  inherited;
  vConsulta := 'S';
  lMsg.Caption := 'Consulta de Itens';
end;

function TfrmPrincipalFiscal.ConsultaItem: Boolean;
begin
  Result := false;
  if vProdServ = 'S' then
  begin
    if obServ.buscarServico(nBarra) then
    begin
      Result := true;
      eVlUnit.Valor := obServ.getValor;
      ldescricao.Caption := obServ.getDescricao;
    end;
  end
  else
  begin
    if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('uspolprec').AsString) = 'S' then
    begin
      Application.CreateForm(TfrmEscPolPreco, frmEscPolPreco);
      if frmEscPolPreco.ShowModal = mrOK then
        if frmEscPolPreco.ComboBox1.ItemIndex = 1 then
          vPrecoAVista := 'N';
      FrmEscPolPreco.free;
    end;
    if obProd.buscarProduto(Edit1.Text, vPrecoAVista = 'S', vConsulta = 'S',
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('leitura_sup').AsString) = 'S',
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('MODELO_BALANCA').AsString) <> 'Nenhum')
      then
    begin
      Result := true;
      eVlUnit.Valor := obProd.getValorVendaItem;
      ldescricao.Caption := obProd.getNBarra + ' ' + obProd.getDescricao + ' ' + obProd.getUnidade;
    end;
  end;
end;

procedure TfrmPrincipalFiscal.DesativarHorriodeVero1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIniF.desativarHorarioVerao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.DescontonoItem1Click(Sender: TObject);
begin
  inherited;
  if ActiveControl = Edit1 then
  begin
    Application.CreateForm(TfrmDescItem, frmDescItem);
    if frmDescItem.ShowModal = mrOk then
    begin
      obCupom.setDescontoPercenentual(frmDescItem.EditMoeda1.Valor);
      obCupom.setDescontoValor(frmDescItem.EditMoeda2.Valor);
    end;
  end;
end;

procedure TfrmPrincipalFiscal.EDcodBarExit(Sender: TObject);
var
  vErro: Integer;
  vErroSair: Integer;
  nItemCancel: Integer;
  nQuant: Real;
  i: Integer;
  v1: string;
  j: Integer;
  vconsulta: string;
  vNotaServico: Integer;
  cDescricao: string;
begin
  inherited;
  if (trim(EDcodBar.Text) = '') or (copy(trim(EDcodBar.Text), 1, 1) = ' ') then
  begin
    if vDadosIniF.vPassarpelocodigo = 1 then
    begin
      EdCodBar.Clear;
      EDcodBar.SetFocus;
      Exit;
    end
    else
      Exit;
  end;
  vErro := 2;
  vErroSair := 0;
  nItemCancel := 0;
  v1 := trim(EDcodBar.Text);
  nQuant := 0;
  j := 0;
  for i := 1 to length(V1) do
    if (Copy(v1, I, 1) = '*') or (Copy(v1, I, 1) = 'X') then
    begin
      inc(j);
      if j >= 2 then
      begin
        Application.MessageBox('Quantidade Invalida. Dois ou mais sinais de multiplicação',
          'Erro', MB_OK);
        exit;
      end;
    end;
  for i := 1 to length(V1) do
    if (Copy(v1, I, 1) = '*') or (Copy(v1, I, 1) = 'X') then
    begin
      try
        nQuant := strtofloat(copy(V1, 1, I - 1));
      except
        messagedlg('Quantidade Invalida', mtinformation, [mbOK], 0);
        exit;
      end;
      nBarra := COPY(V1, I + 1, 20);
    end;
  if nQuant = 0 then
  begin
    nQuant := 1;
    nBarra := V1;
  end;
  if nQuant > 9999 then
  begin
    messagedlg('Quantidade acima do suportado pela Impressora', mtinformation, [mbOK], 0);
    exit;
  end;
  if nQuant <= 0 then
  begin
    messagedlg('Quantidade menor ou igual a zero', mtinformation, [mbOK], 0);
    exit;
  end;

  //*****************
  if vconsulta = 'S' then
  begin
    if vNotaServico = 1 then
    begin
      if not obServ.buscarServico(v1) then
      begin
        EDcodBar.SetFocus;
        exit;
      end;
      Ldescricao.Caption := obServ.getDescricao;
      cDescricao := obServ.getDescricao;
      eVlUnit.Valor := obServ.getValor;
      { BuscarServivoCodigo;
       if vVoltarCodigobarra = 1 then
       begin
         EDcodBar.SetFocus;
         exit;
       end;}
    end
    else
    begin
      // por enquanto      if not obProd.buscarProduto(v1, 'S',) then
      begin
        EDcodBar.SetFocus;
        exit;
      end;
      eVlUnit.Valor := obProd.getValorVendaItem;
      if nItens < 1 then
      begin
        if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('uspolprec').AsString) = 'S' then
        begin
          vtpVnd := 0;
          Application.CreateForm(TfrmEscPolPreco, frmEscPolPreco);
          if frmEscPolPreco.ShowModal = mrOK then
            vtpVnd := frmEscPolPreco.ComboBox1.ItemIndex;
          eVlUnit.Valor := obProd.getValorVendaItem;
          FrmEscPolPreco.free;
        end;
      end;
      ldescricao.Caption := nBarra + ' ' + obProd.getDescricao + ' ' + copy(obProd.getUnidade, 1,
        3);
    end;
    Application.MessageBox(pchar('Pressione ENTER'), 'Informação', mb_OK);
    eVlUnit.Valor := 0;
    Ldescricao.Caption := '';
    EDcodBar.SetFocus;
    exit;
  end; // consulta

end;

procedure TfrmPrincipalFiscal.Edit1Exit(Sender: TObject);
var
  v1: string;
  nQuant: Real;
  j: Integer;
  i: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not enter then
    begin
      Edit1.SetFocus;
      exit;
    end;
    if (trim(Edit1.Text) = '') or (copy(trim(Edit1.Text), 1, 1) = ' ') then
      exit;
    vPrecoAVista := 'S';
    nBarra := Edit1.Text;
    if vConsulta = 'S' then
    begin
      ConsultaItem;
      vConsulta := 'N';
      Application.MessageBox(pchar('Aperte OK para voltar'), 'Informação', MB_OK);
      Edit1.SetFocus;
      Exit;
    end;

    if not ConsultaItem then
      exit;

    if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('conferir_estoque').AsString) = 'S') and
      (vProdServ <> 'S') then
      if obProd.validaQuantidadeEmEstoque(obProd.getQuantidade,
        vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('conferir_estoque').AsString) = 'S')
        then
      begin
        Edit1.SetFocus;
        exit;
      end;
    if not obCupom.validaDesconto(obConfImp.dataSet.FieldByName('max_desc_item').AsFloat,
      obProd.getValorVendaItem) then
    begin
      Edit1.SetFocus;
      exit;
    end;

    if not vDadosIniF.EnvCmdsCupom(3) then
      exit;

    obCupom.abreCupom(vDadosIniF.vCodUsuario);
    // Definindo máscara da quantidade de acordo com a impressora...
    vDadosIniF.EnvCmdsCupom(4);
    //
    {ncodBarra := StrToCurr(nBarra);
    cBarra := cps.strzero(nCodbarra, 13, 0);
    cTotal := cps.strzero((nquant * npreco), 10, 2);
    delete(cTotal, 8, 1);       }

    //verificando o numero de serie da impressora
    if not vDadosIniF.EnvCmdsCupom(6) then
    begin
      //obCupom.somaTotal((-1) * (obCupom.getUltimoValor));
      {nTotal := nTotal - vultvl;
      Ltotal.Caption := FormatFloat('###,###,##0.00', nTotal);}
      exit;
    end;
    //envia venda do item para impressora
    if vDadosIniF.EnvCmdsCupom(5) then
    begin
      obCupom.vendeItem(obProd.dataSet.FieldByName('grupo_prod').AsInteger,
        obProd.dataSet.FieldByName('cod_prod').AsString, obProd.getNBarra,
        obProd.getSitTributaria, obProd.getDescricao, obProd.getQuantidade,
        obProd.getValorVendaItem);
      eSubTotal.Valor := obCupom.getSubTotal;
    end;

    //    if (obCupom.getDescontoPercenentual > 0) or (obCupom.getDescontoValor > 0) then
    //      Memo1.Lines.Add(lDescricao.caption + ' -(' + Format(' %5.2f', [obCupom.getDescontoValor
    //        + ((obCupom.getDescontoPercenentual * 100) / obProd.getValorVendaItem)]) + '%)')
    //    else
    Memo1.Lines.Add(lDescricao.caption);
    Memo1.Lines.Add(format('%6.3f', [obProd.getQuantidade]) + ' X ' + Format(' %10.3f',
      [obProd.getValorVendaItem]) + Format(' %10.2f', [obProd.getValorVendaItem *
      obProd.getQuantidade]));
    if (obCupom.getDescontoPercenentual > 0) or (obCupom.getDescontoValor > 0) then
      Memo1.Lines.Add('desconto ' + Format(' %5.2f',
        [obCupom.getDescontoPercentualImpressao(obProd.getValorVendaItem)]) + '%    '
        + Format(' %10.2f', [StrToFloat(CImpressoraF.vFeu)]));
    //      Memo1.Lines.Add('desconto ' + Format(' %5.2f', [obCupom.getDescontoValor
    //        + ((obCupom.getDescontoPercenentual * 100) / obProd.getValorVendaItem)]) + '%    '
    //        + Format(' %10.2f', [StrToFloat(CImpressoraF.vFeu)]));
    Edit1.SetFocus;
    Edit1.SelectAll;
  finally
    enter := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  hdlFormPag: THandle;
  codCliente: integer;
begin
  inherited;
  if Key = VK_RETURN then
  begin
    enter := true;
    Edit1Exit(Sender);
  end
  else
    enter := false;
  if (Key = VK_F3) and (vProdServ = 'P') then
    PesquisaProdutos1Click(Sender)
  else if (Key = VK_F4) and (vProdServ = 'S') then
    PesquisaServios1Click(Sender)
  else if key = VK_F10 then
  begin

    if not vDadosIniF.EnvCmdsCupom(6) then
      exit;
    if obCupom.getSubTotal <= 0 then
    begin
      Application.MessageBox(pchar('Nenhum valor para fechar'), 'Informação', MB_OK);
      exit;
    end;

    lMsg.Caption := 'Selecione o Cliente';
    if (not obCliente.Active) or (obCliente.IsEmpty) then
    begin
      try
        vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
        vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
        obCliente.getTodos;
      finally
        vDadosIniF.limpaMensagem;
      end;
    end;
    codCliente := 0;
    if obCliente.Active then
      if frmPesqClientes.ShowModal = mrOK then
        codCliente := obCliente.dataSet.FieldByName('cod_cliente').AsInteger;

    try
      CarregaPacote('pkFormPag', hdlFormPag);
      dtmFP := TdtmFP.Create(dtmFP);
      vDadosIniF.setDadosConfig(vDadosIniFP);
      dtmFP.criaDtm;
      if dtmFP.iniciaFormaPagamento(StrToInt(trim(obCupom.getNCupom)), 1, 0, codCliente,
        vDadosIniF.vCodUsuario, 'CP', obCupom.getSubTotal) then
        ShowMessage('DEU');
    finally
      unLoadPackage(hdlFormPag);
    end;
  end;
end;

procedure TfrmPrincipalFiscal.eSubTotalEnter(Sender: TObject);
begin
  inherited;
  Edit1.SetFocus;
end;

procedure TfrmPrincipalFiscal.Evaldo1Click(Sender: TObject);
var
  hdpk : THandle;
  formulario: TForm;
begin
  inherited;
  try
    CarregaPacote('pkTef',hdpk);
    try
//    if Form1 = nil then
//      Application.CreateForm(TForm1,form1);
//    form1.ShowModal;

    except
      ShowMessage('formulario nao foi aberto')
    end;
  finally
    UnloadPackage(hdpk);
  end;
end;

procedure TfrmPrincipalFiscal.Evaldo21Click(Sender: TObject);
var
  hdpk : THandle;
  formulario: TForm;
begin
  inherited;
  try
    CarregaPacote('pkfpgtofiscal',hdpk);
    try
//    if frmpftofiscal = nil then
//      Application.CreateForm(Tfrmpftofiscal,frmpftofiscal);
//    frmpftofiscal.ShowModal;

    except
      ShowMessage('formulario nao foi aberto')
    end;
  finally
    UnloadPackage(hdpk);
  end;
end;

procedure TfrmPrincipalFiscal.eVlUnitEnter(Sender: TObject);
begin
  inherited;
  Edit1.SetFocus;
end;

procedure TfrmPrincipalFiscal.FormPagamento1Click(Sender: TObject);
var
  hdlFormPag: THandle;
begin
  inherited;
  try
    CarregaPacote('pkFormPag', hdlFormPag);
    dtmFP := TdtmFP.Create(dtmFP);
    vDadosIniF.setDadosConfig(vDadosIniFP);
    dtmFP.criaDtm;
    if dtmFP.iniciaFormaPagamento(100, 25, 1, 12, 12, 'OS', 234) then
      ShowMessage('DEU');
  finally
    unLoadPackage(hdlFormPag);
  end;
end;

procedure TfrmPrincipalFiscal.FormShow(Sender: TObject);
begin
  inherited;
  try
    TSingleton(vDadosIniF) := TIni.GetInstance;
    vDadosIniF.vSistema := 'Fiscal';
    dtmFiscalHw := TdtmFiscalHw.Create(dtmFiscalHw);
    DtmCupom := TDtmCupom.Create(DtmCupom);
    DtmFiscal := TDtmFiscal.Create(DtmFiscal);
    DtmFiscalHwF := TDtmFiscalHwF.Create(DtmFiscalHwF);

    if not vDadosIniF.conectaBancos then
    begin
      exit;
      Abort;
    end;
    if not vDadosIniF.verificaEntrada then
    begin
      exit;
      Abort;
    end;
  except
  end;
  Left := 0;
  Top := 0;
  imgLogo.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
  imgHw.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
  imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
  imgHw.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'hw.jpg');
  if not vDadosIniF.inicializaFiscal then
  begin
    Application.Terminate;
    Abort;
  end;
  try
    vDadosIniF.MensagemFiscal('Aguarde... Iniciando variaveis');
    vDadosIniF.MensagemFiscal('Aguarde... Iniciando variáveis');
    Application.CreateForm(TfrmPesqClientes, frmPesqClientes);
    Application.CreateForm(TfrmPesqProdutos, frmPesqProdutos);
    Application.CreateForm(TfrmPesqServicos, frmPesqServicos);
    vDadosIniF.vCodTerminal := obConfImp.dataSet.FieldByName('cod_terminal').AsString;
    vDadosIniF.vNumSerieEcf :=
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
    vDadosIniF.vUsaCodigoBarras :=
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString);
    if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString) = 'S' then
      frmPrincipalFiscal.caption := frmPrincipalFiscal.caption + ' - Teclado PDV'
    else
      frmPrincipalFiscal.caption := frmPrincipalFiscal.caption + ' - Teclado Padrão';
    vProdServ := 'P';
  finally
    vDadosIniF.limpaMensagem;
  end;


  CarregaPacote('pkTef',hd);
  dtmTef := TdtmTef.Create(dtmTef);
  obtef := TTEF.create;
  obTef.verificaOperacaoPendente;
end;

procedure TfrmPrincipalFiscal.LeituradaMemriaFiscal1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
  frmComandosPDV.ShowModal;
end;

procedure TfrmPrincipalFiscal.LeituraX1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Atenção !!!' + #13 + 'Deseja Emitir a Leitura X ?', 'Confirmação',
    MB_YESNO) = mrNo then
    exit;
  vDadosIniF.leituraX;
end;

procedure TfrmPrincipalFiscal.limpaTela;
begin
  lMsg.Caption := '<<<CAIXA ABERTO>>>';
  ldescricao.Caption := '';
  eVlUnit.Valor := 0;
  Memo1.Clear;
  EDcodBar.Clear;
end;

procedure TfrmPrincipalFiscal.PesquisaClientes1Click(Sender: TObject);
begin
  inherited;
  if (not obCliente.Active) or (obCliente.IsEmpty) then
  begin
    try
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
      obCliente.getTodos;
    finally
      vDadosIniF.limpaMensagem;
    end;
  end;
  if obCliente.Active then
    frmPesqClientes.ShowModal;
end;

procedure TfrmPrincipalFiscal.PesquisaProdutos1Click(Sender: TObject);
begin
  inherited;
  if (not obProd.Active) or (obProd.IsEmpty) then
  begin
    try
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
      obProd.getTodos;
    finally
      vDadosIniF.limpaMensagem;
    end;
  end;
  if obProd.Active then
    if frmPesqProdutos.ShowModal = mrOK then
      Edit1.Text := trim(obProd.dataSet.FieldByName('num_fab_prod').AsString);
end;

procedure TfrmPrincipalFiscal.PesquisaServios1Click(Sender: TObject);
begin
  inherited;
  if (not obServ.Active) or (obServ.IsEmpty) then
  begin
    try
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Serviços..');
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Serviços..');
      obServ.getTodos;
    finally
      vDadosIniF.limpaMensagem;
    end;
  end;
  if obServ.Active then
    frmPesqServicos.ShowModal;
end;

procedure TfrmPrincipalFiscal.ReduoZ1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.reducaoZ;
end;

procedure TfrmPrincipalFiscal.Sair1Click(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmPrincipalFiscal.SangriaSuprimentos1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmSangSup, frmSangSup);
  obSangSup := tSangSup.Create;
  frmSangSup.ShowModal;
  obSangSup.Free;
  obSangSup := nil;
end;

procedure TfrmPrincipalFiscal.Timer2Timer(Sender: TObject);
begin
  inherited;
  //  Application.BringToFront;
   // frmMensagem.BringToFront;
  //  frmMensagem.Repaint;
  //  frmMensagem.SetFocus;
  //  Timer2.Enabled:=false;
end;

procedure TfrmPrincipalFiscal.timerConsultaTimer(Sender: TObject);
begin
  inherited;
  //
end;

initialization
  RegisterClass(TfrmPrincipalFiscal);
finalization
  UnRegisterClass(TfrmPrincipalFiscal);

end.

