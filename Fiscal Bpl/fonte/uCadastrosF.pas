unit uCadastrosF;

interface

uses
  uDataSet_OOP, IBDatabase, IBQuery, ComCtrls, Classes, Controls;

type
  TFinalizador = class;
  TProcesso = class;
  TTeclado = class;
  TAliquota = class;

  TConfImp = class(TDataSet_OOP)
	private
    necf: string;
    fverificarHwF: Boolean;
    fArquivoLocal: string;
    fArquivoServidor: string;

    function copiaArquivo(ArqLocal, ArqServidor: string): boolean;
    function AlterFileTime(const filename: string; const stamp: TDateTime): Boolean;
    function IsFileInUse(fName: string): boolean;

  public
    vListaTabPreco: TStringList;
    constructor create;
    function post: boolean; override;
		function edit: boolean; override;
		procedure alterarConfImp(var n_ecf, mod_imp, n_equip, obs_cupom, mod_bal, mod_docf, arred_trunc,
			tec_pdv, us_pdv, leit_sup, vr_unit_3d, mov_Operador, abrir_gav, us_codbarra, conf_est, leit_ser,
			ver_papel, polPrec,endHwF, impECF: string; var porta_imp, porta_leit, qtDigDav, qtViasNaoF: integer);
		function gravaConfImp(n_ecf, mod_imp, n_equip, obs_cupom, mod_bal, mod_docf, arred_trunc,
			tec_pdv, us_pdv, leit_sup, vr_unit_3d, mov_Operador, abrir_gav, us_codbarra, conf_est, leit_ser,
      ver_papel, polPrec, endHwF, impECF: string; porta_imp, porta_leit, qtDigDav, qtViasNaoF: integer): boolean;
    function existeImpressora(n_ecf: string): boolean;
    function selecionaImpressora(n_ecf: string): boolean;
    function getPortaComunicacao(n_ecf: string): string;
    function setPortaComunicacao(n_ecf, porta: string): boolean;
    function getGrandeTotal: string;
    procedure acumulaGrandeTotal(valor: Currency);
    procedure corrigeGrandeTotal(valor: Currency);
    function getTodos: boolean;
    procedure fechaDia;
    procedure abreDia(Dia: TDate);
    function getCodPropECF: string;
    procedure verificaHwF(pOrigem: string; pCopiarSemConfirmar: Boolean = False);
    procedure CopyFileWithProgressBar(pSource, pDestination: string; pProgressBar: TProgressBar);


    property verificarHwF: Boolean read fverificarHwF write fverificarHwF;
    property ArquivoServidor: string read fArquivoServidor;
    property ArquivoLocal: string read fArquivoLocal;

  end;

  TFinalizador = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    function insert: boolean; override;
    function post: boolean; override;
    function delete: boolean; override;
    function apply: boolean; override;
    function existeFinalizador(descricao: string): boolean;
    function selecionaFinalizador(codigo: Integer): boolean; overload;
    function selecionaFinalizador(descricao: string): boolean; overload;
    function getTodos: boolean;
    function cartao: boolean;
    function getTodosFiscal: boolean;
    function getNomeFinalizador: string;
    function getFinalizadorPrazo: integer;
  end;

  TProcesso = class(TDataSet_OOP)
  private
    codProc: string;
  public
    constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function edit: boolean; override;
    function insert: boolean; override;
    function delete: boolean; override;
    function apply: boolean; override;
    function existeProcesso(codigo: string): boolean;
    function selecionaProcesso(processo: string): boolean;
    function getTodos: boolean;
  end;

  TTeclado = class(TDataSet_OOP)
  private
    teclaAnt: integer;
  public
    constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function edit: boolean; override;
    function insert: boolean; override;
    function delete: boolean; override;
    function apply: boolean; override;
    function selecionaTecla(tecla: integer): boolean;
    function existeTecla(tecla: integer): boolean;
    function getTodos: boolean;
  end;

  TAliquota = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaSequencia(aliq: Real): boolean;overload;
    function selecionaSequencia(sequencia: string): boolean;overload;
    function incluiAliquota(sequencia, servico: string; aliquota: Currency; indice: integer):
      boolean;
    function apagaAliquotas: boolean;
    function getTodos: boolean;
  end;

var
  vConfImp: TConfImp;

implementation

uses DBClient, Messages, SysUtils, Dialogs, DB,
  uDtmConfigF, Forms, Windows, uDadosIni, uDtmAtivo, uCopiaHwF;

{ TConfImp }

procedure TConfImp.abreDia(Dia: TDate);
begin
  if inherited edit then
  begin
    dataSet.FieldByName('diaaberto').AsDateTime := Dia;
    inherited post;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

procedure TConfImp.alterarConfImp(var n_ecf, mod_imp, n_equip, obs_cupom, mod_bal, mod_docf,
	arred_trunc, tec_pdv, us_pdv, leit_sup, vr_unit_3d, mov_Operador, abrir_gav, us_codbarra, conf_est,
	leit_ser, ver_papel, polPrec,endHwF, impECF: string; var porta_imp, porta_leit, qtDigDav, qtViasNaoF: integer);
begin
	if not Active then
		Open;
	if DataSet.State = dsBrowse then
	begin
		if IsEmpty then
			Insert
		else
			Edit;
	end;
	n_ecf := vDadosIni.decodifica(DataSet.FieldByName('NUM_SERIE_ECF').AsString);
	mod_imp := vDadosIni.decodifica(DataSet.FieldByName('MODELO_IMPRESSORA').AsString);
	n_equip := vDadosIni.decodifica(DataSet.FieldByName('NUM_EQUIP').AsString);
	obs_cupom := vDadosIni.decodifica(DataSet.FieldByName('OBSERVACAO_CUPOM').AsString);
	mod_bal := vDadosIni.decodifica(DataSet.FieldByName('MODELO_BALANCA').AsString);
	mod_docf := vDadosIni.decodifica(DataSet.FieldByName('MODELO_DOCF').AsString);
	impECF := vDadosIni.decodifica(DataSet.FieldByName('IMPRIMIR_DAV_ECF').AsString);
	arred_trunc := vDadosIni.decodifica(DataSet.FieldByName('ARREDONDAR_TRUNCAR').AsString);
  tec_pdv := vDadosIni.decodifica(DataSet.FieldByName('TECLADO_PDV').AsString);
  us_pdv := vDadosIni.decodifica(DataSet.FieldByName('USAR_TEF').AsString);
  leit_sup := vDadosIni.decodifica(DataSet.FieldByName('LEITURA_SUP').AsString);
  vr_unit_3d := vDadosIni.decodifica(DataSet.FieldByName('VALOR_UNIT_3DIG').AsString);
  mov_Operador := vDadosIni.decodifica(DataSet.FieldByName('USAR_MOV_OP').AsString);
  abrir_gav := vDadosIni.decodifica(DataSet.FieldByName('ABRIR_GAVETA').AsString);
  us_codbarra := vDadosIni.decodifica(DataSet.FieldByName('USAR_CODBARRA').AsString);
  conf_est := vDadosIni.decodifica(DataSet.FieldByName('CONFERIR_ESTOQUE').AsString);
  leit_ser := vDadosIni.decodifica(DataSet.FieldByName('LEITOR_SERIAL').AsString);
  ver_papel := vDadosIni.decodifica(DataSet.FieldByName('VERIFICAR_PAPEL').AsString);
  polprec := vDadosIni.decodifica(DataSet.FieldByName('USPOLPREC').AsString);
  porta_imp := DataSet.FieldByName('PORTA_IMPRESSORA').AsInteger;
  porta_leit := DataSet.FieldByName('PORTA_LEITOR').AsInteger;
  qtDigDav := DataSet.FieldByName('QTDE_DIG_DAV').AsInteger;
  qtViasNaoF := DataSet.FieldByName('QT_VIAS_NAOFISCAIS').AsInteger;
  endHwF := vDadosIni.decodifica(DataSet.FieldByName('ENDERECO_HWF').AsString);
  vListaTabPreco.Text := DataSet.FieldByName('TAB_PRECO_AD').AsString;
end;

function TConfImp.AlterFileTime(const filename: string;
  const stamp: TDateTime): Boolean;
var
  FileHandle: INTEGER;
begin
  if not fileExists(filename) then
  begin
    Result := False;
  end
  else
  begin
    try
      FileHandle := FileOpen(filename, fmOpenWrite or fmShareDenyNone);
      if FileHandle > 0 then
      begin
        FileSetDate(FileHandle, DateTimeToFileDate(stamp));
        FileClose(FileHandle);
        Result := True;
      end;
    except
      on E: Exception do
      begin
        E.Message := 'Erro ao alterar data do arquivo ' + filename + ' ' + E.Message;
//        Application.MessageBox('')
        Result := False;
      end;
    end;
  end;
end;

function TConfImp.copiaArquivo(Arqlocal, ArqServidor: string): boolean;
var
  dataAntigo, dataNovo: TDateTime;
  S, T: TFileStream;
  temp: string;
  i: Integer;
begin
  try
  i:= Pos(':',ArqLocal);
  if i <> 2 then
  begin
    temp := Copy(ArqLocal,Pos(':',ArqLocal)+1,length(ArqLocal));
    ArqLocal := temp;
  end;

  if not FileExists(ArqServidor) then
    Exit;
  if IsFileInUse(ArqServidor) then
  begin
//    Application.MessageBox(pchar('O sistema tentou copiar o arquivo HwF.fdb de : '+Arqlocal+#13+
//    'O arquivo está em uso. Reinicie o sistema novamente'), 'Informação', MB_OK+MB_ICONWARNING);
    exit;
  end
  else
  begin
    dataAntigo := dataSet.FieldByName('data_hwf').AsDateTime;
    dataNovo := FileDateToDateTime(FileAge(ArqServidor));
    if dataAntigo < dataNovo then
    begin
      temp := dtmAtivo.bancoHwF.DatabaseName;
      vDadosIni.desconectaBanco(dtmAtivo.bancoHwF);
      RenameFile(ArqLocal,ArqLocal+'_OLD');
      S := TFileStream.Create(ArqServidor, fmOpenRead);
      try
        T := TFileStream.Create(Arqlocal, fmOpenWrite or fmCreate);
        try
          T.CopyFrom(S, S.Size);
        finally
          T.Free;
        end;
      finally
        S.Free;
      end;
      AlterFileTime(Arqlocal, dataNovo) ;
      vDadosIni.conectaBanco(dtmAtivo.bancoHwF,temp,true);
      if Edit then
      begin
        dataSet.FieldByName('data_hwf').AsDateTime := dataNovo;
        dataSet.Post;
        Apply;
        CommitaTransacao;
      end;
    end;
  end;
  except
    Result := false;
  end;
end;

procedure TConfImp.CopyFileWithProgressBar(pSource, pDestination: string;
  pProgressBar: TProgressBar);
var
  FromF, ToF: file of byte;
  Buffer: array[0..4096] of char;
  NumRead: integer;
  FileLength: longint;
  vTmp: string;
  vCount: Integer;
begin

  if FileExists(pDestination + '_OLD') then
    DeleteFile(pchar(pDestination + '_OLD'));

  RenameFile(pDestination, pDestination + '_OLD');

  AssignFile(FromF, pSource);
  reset(FromF);
  AssignFile(ToF, pDestination);
  rewrite(ToF);
  try
    try
      FileLength := FileSize(FromF);
      with pProgressBar do
      begin
        Min := 0;
        Max := FileLength;
        while FileLength > 0 do
        begin
          BlockRead(FromF, Buffer[0], SizeOf(Buffer), NumRead);
          FileLength := FileLength - NumRead;
          BlockWrite(ToF, Buffer[0], NumRead);
          Position := Position + NumRead;
          Application.ProcessMessages;
        end;
      end;

      if FileExists(pDestination + '_OLD') then
        DeleteFile(pchar(pDestination + '_OLD'));
    finally
      CloseFile(FromF);
      CloseFile(ToF);
    end;
  except
    RenameFile(pDestination + '_OLD', pDestination);

    if FileExists(pDestination + '_OLD') then
      DeleteFile(pchar(pDestination + '_OLD'));
  end;
end;

procedure TConfImp.corrigeGrandeTotal(valor: Currency);
var
  temp: string;
begin
  if not dataSet.IsEmpty then
  begin
    try
      temp := Format('%17.2f', [valor]);
      temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);

      temp := vDadosIni.codifica(temp);
    except
      Exit;
    end;
    if inherited edit then
    begin
      temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      dataSet.FieldByName('VALOR_GT').AsString := temp;
      if inherited Post then
      begin
        Apply;
        CommitaTransacao;
        IniciaTransacao;
      end;
    end;
  end;
end;

constructor TConfImp.create;
begin
  DataSet := TClientDataSet(DtmConfigF.cdsConfImp);
  transacao := TIBTransaction(DtmConfigF.transacaoFiscal);
  buscas := TIBQuery(DtmConfigF.qrBuscas);
  fverificarHwF := False;
  vListaTabPreco := TStringList.Create;
  vListaTabPreco.Duplicates := dupIgnore;
end;

function TConfImp.edit: boolean;
begin
  result := False;
  if inherited edit then
  begin
    necf := DataSet.FieldByName('num_serie_ecf').AsString;
    result := True;
  end;
end;

function TConfImp.existeImpressora(n_ecf: string): boolean;
var
  temp: string;
begin
  temp := retornaValor('select count(num_serie_ecf) as valor from confimp where num_serie_ecf = '
    + QuotedStr(n_ecf) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if DataSet.State = dsInsert then
    Result := (StrToInt(temp) >= 1)
  else if (DataSet.State = dsEdit) then
  begin
    if DataSet.FieldByName('num_serie_ecf').AsString <> necf then
      Result := (StrToInt(temp) >= 1)
    else
      result := false;
  end;
end;

procedure TConfImp.fechaDia;
begin
  if inherited edit then
  begin
    dataSet.FieldByName('diafechado').AsDateTime := dataSet.FieldByName('diaaberto').AsDateTime;
    inherited post;
    Apply;
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

function TConfImp.getCodPropECF: string;
begin
  Result := retornaValor('select ti.cod_proprietario as valor from terminal_impressoras ti' +
    ' where ti.cod_terminal = ' + vDadosIni.vCodTerminal +
    ' and ti.num_serie_ecf = ' + vDadosIni.codifica(vDadosIni.vNumSerieEcf) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa + ' and ti.atual = ''S''');
end;

function TConfImp.getGrandeTotal: string;
var
  temp: string;
begin
  temp :=
    vDadosIni.StrZero(vDadosIni.decodifica(dataSet.FieldByName('valor_gt').AsString),
    20);
  temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
  temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  Result := temp;
end;

function TConfImp.getPortaComunicacao(n_ecf: string): string;
begin
  selecionaImpressora(vDadosIni.codifica(n_ecf));
  if not dataSet.IsEmpty then
  begin
    Result := dataSet.FieldByName('porta_impressora').AsString;
  end;
end;

function TConfImp.getTodos: boolean;
begin
  Result := montaSelect('select * from confimp where cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TConfImp.gravaConfImp(n_ecf, mod_imp, n_equip, obs_cupom, mod_bal, mod_docf, arred_trunc,
  tec_pdv, us_pdv, leit_sup, vr_unit_3d, mov_Operador, abrir_gav, us_codbarra, conf_est, leit_ser,
	ver_papel, polPrec, endHwF, impECF: string; porta_imp, porta_leit, qtDigDav, qtViasNaoF: integer): boolean;
begin
	try
		if existeImpressora(n_ecf) then
			raise exception.create('Número de série da impressora fiscal já cadastrado no sistema');

		if DataSet.State in [dsInsert, dsEdit] then
		begin
			DataSet.FieldByName('NUM_SERIE_ECF').AsString := vDadosIni.codifica(n_ecf);
			DataSet.FieldByName('MODELO_IMPRESSORA').AsString := vDadosIni.codifica(mod_imp);
			DataSet.FieldByName('NUM_EQUIP').AsString := vDadosIni.codifica(n_equip);
			DataSet.FieldByName('OBSERVACAO_CUPOM').AsString := vDadosIni.codifica(obs_cupom);
			DataSet.FieldByName('MODELO_BALANCA').AsString := vDadosIni.codifica(mod_bal);
			DataSet.FieldByName('MODELO_DOCF').AsString := vDadosIni.codifica(mod_docf);
			DataSet.FieldByName('IMPRIMIR_DAV_ECF').AsString := vDadosIni.codifica(impECF);
			DataSet.FieldByName('ARREDONDAR_TRUNCAR').AsString := vDadosIni.codifica(arred_trunc);
			DataSet.FieldByName('TECLADO_PDV').AsString := vDadosIni.codifica(tec_pdv);
			DataSet.FieldByName('USAR_TEF').AsString := vDadosIni.codifica(us_pdv);
			DataSet.FieldByName('LEITURA_SUP').AsString := vDadosIni.codifica(leit_sup);
			DataSet.FieldByName('VALOR_UNIT_3DIG').AsString := vDadosIni.codifica(vr_unit_3d);
			DataSet.FieldByName('USAR_MOV_OP').AsString := vDadosIni.codifica(mov_Operador);
			DataSet.FieldByName('ABRIR_GAVETA').AsString := vDadosIni.codifica(abrir_gav);
			DataSet.FieldByName('USAR_CODBARRA').AsString := vDadosIni.codifica(us_codbarra);
			DataSet.FieldByName('CONFERIR_ESTOQUE').AsString := vDadosIni.codifica(conf_est);
			DataSet.FieldByName('LEITOR_SERIAL').AsString := vDadosIni.codifica(leit_ser);
			DataSet.FieldByName('VERIFICAR_PAPEL').AsString := vDadosIni.codifica(ver_papel);
			DataSet.FieldByName('PORTA_IMPRESSORA').AsInteger := porta_imp;
			DataSet.FieldByName('PORTA_LEITOR').AsInteger := porta_leit;
			DataSet.FieldByName('QTDE_DIG_DAV').AsInteger := qtDigDav;
			DataSet.FieldByName('QT_VIAS_NAOFISCAIS').AsInteger := qtViasNaoF;
			DataSet.FieldByName('USPOLPREC').AsString := polPrec;
			dataSet.FieldByName('ENDERECO_HWF').AsString := vDadosIni.codifica(endHwF);
      DataSet.FieldByName('TAB_PRECO_AD').AsString := Copy(vListaTabPreco.Text, 1, 32);

      if Post then
      begin
        Apply;
        CommitaTransacao;
        result := true;
        IniciaTransacao;
      end
      else
        result := false;
    end;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EF0016 ' + E.Message, mtInformation, [mbOK], 0);
      registraErro('EF0016 ' + E.Message);
    end;
  end;
end;

function TConfImp.IsFileInUse(fName: string): boolean;
var
  HFileRes: HFILE;
begin
  Result := false;
  if not FileExists(fName) then
    exit;
  HFileRes := CreateFile(pchar(fName), GENERIC_READ or GENERIC_WRITE, 0 {this is the trick!}, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;

function TConfImp.post: boolean;
begin
  try
    result := true;
    if trim(DataSet.FieldByName('NUM_SERIE_ECF').AsString) = '' then
      raise exception.create('Preencha o Número de série do ECF');
    if (DataSet.FieldByName('MODELO_IMPRESSORA').AsString) = '' then
      raise exception.create('Selecione o modelo da Impressora');
    if trim(DataSet.FieldByName('MODELO_DOCF').AsString) = '' then
      raise exception.create('Informe o modelo de documento fiscal');
    if trim(DataSet.FieldByName('PORTA_IMPRESSORA').AsString) = '' then
      raise exception.create('Informe a porta da Impressora');
    if (DataSet.FieldByName('QTDE_DIG_DAV').AsInteger < 10) or
      (DataSet.FieldByName('QTDE_DIG_DAV').AsInteger > 13) then
      raise exception.create('Informe a quantidade de dígitos para o uso do DAV entre 10 e 13');
    if vDadosIni.decodifica(DataSet.FieldByName('LEITOR_SERIAL').AsString) = '@' then
      if DataSet.FieldByName('PORTA_LEITOR').AsInteger = 0 then
        raise exception.create('Informe a porta do leitor serial');
    if DataSet.State = dsInsert then
      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;

    result := inherited post;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EF0015 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0015 ' + e.Message);
    end;
  end;
end;

function TConfImp.selecionaImpressora(n_ecf: string): boolean;
begin
  Result := montaSelect('select * from confimp where num_serie_ecf = '
    + QuotedStr(n_ecf) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TConfImp.setPortaComunicacao(n_ecf, porta: string): boolean;
begin
  Result := False;
  selecionaImpressora(vDadosIni.codifica(n_ecf));
  if not dataSet.IsEmpty then
  begin
    try
      StrToInt(porta);
    except
      application.messageBox(pchar('Porta porta informada inválida'), 'Atenção',
        MB_ICONWARNING + MB_OK);
      Exit;
    end;
    if inherited edit then
    begin
      dataSet.FieldByName('porta_impressora').AsString := porta;
      if inherited Post then
      begin
        Apply;
        CommitaTransacao;
        IniciaTransacao;
        Result := TRUE;
      end;
    end;
  end;
end;

procedure TConfImp.verificaHwF(pOrigem: string;
  pCopiarSemConfirmar: Boolean = False);
var
  I: Integer;
  vDataAntigo, vDataNovo: TDateTime;
begin
//  if not dataSet.Active then
		selecionaImpressora(vDadosIni.codifica(vDadosIni.vNumSerieEcf));
	if dataSet.IsEmpty then
		Exit;

  if Trim(fArquivoServidor) = '' then
    if Trim(pOrigem) = '' then
      fArquivoServidor := vDadosIni.vEmp.vDirCopiaHwFTerminais + '\HwF.fdb'
    else
      fArquivoServidor := Trim(pOrigem);

  I:= Pos(':',vDadosIni.vBancoHwF);
  if I <> 2 then
    fArquivoLocal := Copy(vDadosIni.vBancoHwF,Pos(':',vDadosIni.vBancoHwF)+1,length(vDadosIni.vBancoHwF))
  else
    fArquivoLocal := vDadosIni.vBancoHwF;

  try
    try
      if not FileExists(fArquivoServidor) then
        if vDadosIni.vTipoConexao = 'off' then
          raiseExceptionCreate('Arquivo de Origem não existe', '')
        else
          Exit;

      if not FileExists(fArquivoLocal) then
        if vDadosIni.vTipoConexao = 'off' then
          raiseExceptionCreate('Arquivo de Destino não existe','');

//      if IsFileInUse(fArquivoServidor) then
//        if vDadosIni.vTipoConexao = 'off' then
//          raiseExceptionCreate('Arquivo de Origem em uso','');

      vDataAntigo := dataSet.FieldByName('data_hwf').AsDateTime;
      vDataNovo := FileDateToDateTime(FileAge(fArquivoServidor));

      if vDataAntigo < vDataNovo then
      begin
        dtmAtivo.bancoHwF.Connected := False;
        dtmAtivo.bancoHw.Connected := False;

        if IsFileInUse(fArquivoLocal) then
          if vDadosIni.vTipoConexao = 'off' then
            raiseExceptionCreate('Arquivo de Destino em uso','');

        try
          Application.CreateForm(TfrmCopiaDadosServidor, frmCopiaDadosServidor);
          frmCopiaDadosServidor.BorderIcons := [];
          frmCopiaDadosServidor.Memo1.Lines.Clear;
          frmCopiaDadosServidor.Memo1.Lines.Add('Novos dados de consulta disponibilizados pelo servidor. Clique no botão Copiar para efetuar a cópia');
//          frmCopiaDadosServidor.Memo1.Lines.Add('Origem: ' +  fArquivoServidor);
          frmCopiaDadosServidor.Memo1.Lines.Add('Destino: ' +  fArquivoLocal);

          if pCopiarSemConfirmar then
          begin
            frmCopiaDadosServidor.BitBtn1.Enabled := False;
            frmCopiaDadosServidor.BitBtn2.Enabled := False;
            frmCopiaDadosServidor.Show;

            vConfImp.CopyFileWithProgressBar(fArquivoServidor, fArquivoLocal, frmCopiaDadosServidor.ProgressBar1);

            frmCopiaDadosServidor.Close;

            AlterFileTime(fArquivoLocal, vDataNovo) ;
            if Edit then
            begin
              dataSet.FieldByName('data_hwf').AsDateTime := vDataNovo;
              dataSet.Post;
              Apply;
              CommitaTransacao;
            end;
          end
          else if frmCopiaDadosServidor.ShowModal =  IDOK then
          begin
            AlterFileTime(fArquivoLocal, vDataNovo) ;
            if Edit then
            begin
              dataSet.FieldByName('data_hwf').AsDateTime := vDataNovo;
              dataSet.Post;
              Apply;
              CommitaTransacao;
            end;
          end;
        finally
          dtmAtivo.bancoHwF.Connected := True;
          dtmAtivo.bancoHw.Connected := True;
        end;
      end;
    except
      on e: exception do begin
        if vDadosIni.vTipoConexao = 'off' then
        begin
          registraErro('Erro ao copiar HwF.fdb. Origem: ' + fArquivoServidor + ' Destino: ' +fArquivoLocal + ' Erro: ' + e.Message);
          Application.MessageBox(pchar('Erro ao copiar HwF.fdb. Origem: ' + fArquivoServidor + ' Destino: ' +fArquivoLocal + ' Erro: ' + e.Message),
            'Atenção', 0 + 64);
        end;
      end;
    end;
  finally
    fverificarHwF := False;
  end;
end;

procedure TConfImp.acumulaGrandeTotal(valor: Currency);
var
  valorArmazenado: Currency;
  temp: string;
begin
  if not dataSet.IsEmpty then
  begin
    try
      temp := trim(vDadosIni.decodifica(dataSet.FieldByName('valor_gt').AsString));
      temp := vDadosIni.StrZero(temp, 20);
      temp := Copy(temp, 1, 18) + ',' + Copy(temp, 19, 2);

      valorArmazenado := StrToCurr(temp);
      temp := trim(format('%18.2f', [(valorArmazenado + valor)]));
      temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
      temp := vDadosIni.codifica(temp);
    except
      Exit;
    end;
    if inherited edit then
    begin
      dataSet.FieldByName('VALOR_GT').AsString := temp;
      if inherited Post then
        Apply;
      CommitaTransacao;
      IniciaTransacao;
    end;
  end;
end;

{ TFinalizador }

function TFinalizador.apply: boolean;
begin
  if inherited Apply then
  begin
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

function TFinalizador.cartao: boolean;
begin
  Result := False;
  First;
  while not dataSet.Eof do
  begin
    if  pos(UpperCase(dataSet.FieldByName('descricao').AsString),
    'CARTAOCARTÃOCARTãO')>0 then
    BEGIN
      Result := True;
      Break;
    end;
  end;
end;

constructor TFinalizador.create;
begin
  DataSet := TClientDataSet(DtmConfigF.cdsFinaliz);
  transacao := TIBTransaction(DtmConfigF.transacaoFiscal);
  buscas := TIBQuery(DtmConfigF.qrBuscas);
end;

function TFinalizador.delete: boolean;
begin
  CancelUpdates;
  if Application.MessageBox(pchar('Deseja mesmo excluir o registro?'), 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) = mrYes then
    if inherited Delete then
    begin
      Apply;
      CommitaTransacao;
      IniciaTransacao;
    end;
end;

destructor TFinalizador.destroy;
begin
  CommitaTransacao;
  inherited;
end;

function TFinalizador.existeFinalizador(descricao: string): boolean;
begin
  result := ExecutaComandosSql('select cod_finalizador from finalizadores where descricao = ' +
    QuotedStr(descricao) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TFinalizador.getFinalizadorPrazo: integer;
begin
  Result := 0;
  getTodos;
  while not dataSet.Eof do
  begin
    if pos('PRAZO', UpperCase(dataSet.FieldByName('descricao').AsString)) > 0 then
    begin
      Result := dataSet.FieldByName('cod_finalizador').AsInteger;
      break;
    end;
    dataSet.Next;
  end;
end;

function TFinalizador.getNomeFinalizador: string;
begin
  Result := dataSet.FieldByName('descricao').AsString;
  while length(Result) < 10 do
    Result := Result + ' ';
end;

function TFinalizador.getTodos: boolean;
begin
  result := montaSelect('select * from finalizadores where cod_empresa = ' +
    vDadosIni.codEmpresa+' and nserieecf = '+QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf))+
    ' and cod_terminal = ' + vDadosIni.vCodTerminal+
    ' order by cod_finalizador');
end;

function TFinalizador.getTodosFiscal: boolean;
begin
  result := montaSelect('select * from finalizadores where cod_empresa = ' +
    vDadosIni.codEmpresa+'  and cod_terminal = '+vDadosIni.vCodTerminal+
    ' and nserieecf = '+QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf))+
    ' order by cod_finalizador');
end;

function TFinalizador.insert: boolean;
begin
  if inherited insert then
  begin
    result := true;
    dataSet.FieldByName('descricao').AsString := '';
    dataSet.FieldByName('nserieecf').AsString := vDadosIni.codifica(vDadosIni.vNumSerieEcf);
    dataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end;
end;

function TFinalizador.post: boolean;
begin
  try
    if trim(DataSet.FieldByName('cod_finalizador').AsString) = '' then
      raise exception.create('O codigo do finalizador precisa ser informado');
    if trim(DataSet.FieldByName('descricao').AsString) = '' then
      raise exception.create('O campo da descrição do finalizador não pode ficar vazio');
    if trim(DataSet.FieldByName('tipo_finalizador').AsString) = '' then
      raise exception.create('O tipo de finalizador deve ser informado');
    if Pos('PRAZO', UpperCase(Trim(dataSet.FieldByName('DESCRICAO').AsString))) > 0 then
      dataSet.FieldByName('PRAZO').AsString := 'N';

    if DataSet.State = dsInsert then
    begin
      //DataSet.FieldByName('cod_finalizador').AsInteger := Gencodigo('FINALIZADORES',
      //DtmConfigF.SpIncCodigo, vDadosIni.codEmpresa);
      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    end;

    result := inherited post;
    if Result  then
      Result := inherited Apply;
    if not Result then
    begin
      Application.MessageBox('Erro ao salvar cadastro'+#13+
      'Verifique os dados informados. Pode haver duplicidade!','Erro',MB_ICONEXCLAMATION+MB_OK );
    end;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EF0018 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0018 ' + e.Message);
    end;
  end;
end;

function TFinalizador.selecionaFinalizador(codigo: Integer): boolean;
begin
  result := montaSelect('select * from finalizadores where cod_finalizador = ' +
    IntToStr(codigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TFinalizador.selecionaFinalizador(descricao: string): boolean;
begin
  result := montaSelect('select * from finalizadores where descricao = ' +
    QuotedStr(descricao) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TProcesso }

function TProcesso.apply: boolean;
begin
  if inherited Apply then
  begin
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

constructor TProcesso.create;
begin
  DataSet := TClientDataSet(DtmConfigF.cdsProcessos);
  transacao := TIBTransaction(DtmConfigF.transacaoFiscal);
  buscas := TIBQuery(DtmConfigF.qrBuscas);
end;

function TProcesso.delete: boolean;
begin
  CancelUpdates;
  if Application.MessageBox(pchar('Deseja mesmo excluir o registro?'), 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) = mrYes then
    if inherited Delete then
    begin
      Apply;
      CommitaTransacao;
      IniciaTransacao;
    end;
end;

destructor TProcesso.destroy;
begin
  CommitaTransacao;
  inherited;
end;

function TProcesso.edit: boolean;
begin
  if inherited edit then
    codProc := DataSet.FieldByName('cod_processo').AsString
  else
    Result := false;
end;

function TProcesso.existeProcesso(codigo: string): boolean;
var
  temp: string;
begin
  temp :=
    retornaValor('select count(cod_processo) as valor from tabela_processos where cod_processo = '
    + QuotedStr(codigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if DataSet.State = dsInsert then
    Result := (StrToInt(temp) >= 1)
  else if (DataSet.State = dsEdit) then
  begin
    if DataSet.FieldByName('cod_processo').AsString <> codProc then
      Result := (StrToInt(temp) >= 1)
    else
      result := false;
  end;
end;

function TProcesso.getTodos: boolean;
begin
  Result := montaSelect('select * from tabela_processos where cod_empresa = ' +
    vDadosIni.codEmpresa);
end;

function TProcesso.insert: boolean;
begin
  Result := inherited Insert;
  DataSet.FieldByName('cod_processo').AsString := '';
end;

function TProcesso.post: boolean;
begin
  try
    if DataSet.FieldByName('cod_processo').AsString = '' then
      raise exception.create('Processo precisa ser informado');
    if trim(DataSet.FieldByName('nome_processo').AsString) = '' then
      raise exception.create('Descrição do processo deve ser informada');
    if trim(DataSet.FieldByName('nivel_processo').AsString) = '' then
      raise exception.Create('Nível do processo deve ser informado');
    if existeProcesso(DataSet.FieldByName('cod_processo').AsString) then
      raise exception.create('Processo informado já existe');
    if DataSet.State = dsInsert then
      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;

    Result := inherited post;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EF0020' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0020 ' + e.Message);
    end;
  end;
end;

function TProcesso.selecionaProcesso(processo: string): boolean;
begin
  Result := montaSelect('select * from tabela_processos where cod_processo = ' + QuotedStr(processo)
    + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TTeclado }

function TTeclado.apply: boolean;
begin
  if inherited Apply then
  begin
    CommitaTransacao;
    IniciaTransacao;
  end;
end;

constructor TTeclado.create;
begin
  DataSet := TClientDataSet(DtmConfigF.cdsTeclado);
  transacao := TIBTransaction(DtmConfigF.transacaoFiscal);
  buscas := TIBQuery(DtmConfigF.qrBuscas);
end;

function TTeclado.delete: boolean;
begin
  CancelUpdates;
  if Application.MessageBox(pchar('Deseja mesmo excluir o registro?'), 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) = mrYes then
    if inherited Delete then
    begin
      Apply;
      CommitaTransacao;
      IniciaTransacao;
    end;
end;

destructor TTeclado.destroy;
begin
  CommitaTransacao;
  inherited;
end;

function TTeclado.edit: boolean;
begin
  if inherited edit then
    teclaAnt := DataSet.FieldByName('tecla').AsInteger;
end;

function TTeclado.existeTecla(tecla: integer): boolean;
var
  temp: string;
begin
  temp :=
    retornaValor('select count(tecla) as valor from teclado where tecla = '
    + IntToStr(tecla));
  if DataSet.State = dsInsert then
    Result := (StrToInt(temp) >= 1)
  else if (DataSet.State = dsEdit) then
  begin
    if DataSet.FieldByName('tecla').AsInteger <> teclaAnt then
      Result := (StrToInt(temp) >= 1)
    else
      result := false;
  end;
end;

function TTeclado.getTodos: boolean;
begin
  Result := montaSelect('select * from teclado');
end;

function TTeclado.insert: boolean;
begin
  Result := inherited Insert;
  DataSet.FieldByName('processo').AsString := '';
end;

function TTeclado.post: boolean;
begin
  try
    if existeTecla(DataSet.FieldByName('tecla').AsInteger) then
      raise exception.create('Tecla informada já existe');
    if trim(DataSet.FieldByName('processo').AsString) = '' then
      raise exception.create('Processo deve ser informado');
    if trim(DataSet.FieldByName('descricao').AsString) = '' then
      raise exception.Create('Descrição da função da tecla deve ser informada');

    Result := inherited post;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('EF0021 ' + e.Message, mtInformation, [mbOK], 0);
      registraErro('EF0021 ' + e.Message);
    end;
  end;
end;

function TTeclado.selecionaTecla(tecla: integer): boolean;
begin
  Result := montaSelect('select * from teclado where tecla = ' + IntToStr(tecla));
end;

{ TAliquota }

function TAliquota.apagaAliquotas: boolean;
begin
  Result := ExecutaComandosSqlExec('delete from aliq where cod_empresa = ' +
    vDadosIni.codEmpresa +
    ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
    QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf)));
  CommitaTransacao;
  IniciaTransacao;
end;

constructor TAliquota.create;
begin
  dataSet := TClientDataSet(DtmConfigF.cdsAliquota);
  transacao := TIBTransaction(DtmConfigF.transacaoFiscal);
  buscas := TIBQuery(DtmConfigF.qrBuscas);
end;

function TAliquota.getTodos: boolean;
begin
  Result := montaSelect('select * from aliq where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
    QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf)));
end;

function TAliquota.incluiAliquota(sequencia, servico: string;
  aliquota: Currency; indice: integer): boolean;
var
  serv: string;
begin
  if not Active then
    getTodos;
  serv := servico;
  IndexFieldNames := 'SEQUENCIA';
  FindNearest([sequencia]);
  if (sequencia = dataSet.FieldByName('SEQUENCIA').AsString) then
  begin
    Result := True;
    Exit;
  end;
  if aliquota <> 0 then
    if inherited insert then
    begin
      dataSet.FieldByName('sequencia').AsString := sequencia;
      dataSet.FieldByName('aliq').AsFloat := aliquota;
      dataSet.FieldByName('servico').AsString := serv;
      dataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('nserieecf').AsString :=
        vDadosIni.codifica(vDadosIni.vNumSerieEcf);
      dataSet.FieldByName('indice').AsInteger := indice;

      if inherited post then
      begin
        Apply;
        CommitaTransacao;
        Result := true;
        IniciaTransacao;
      end;
    end;
end;

function TAliquota.selecionaSequencia(sequencia: string): boolean;
begin
  Result := montaSelect('select * from aliq where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
    QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf)) +
    ' and sequencia = ' + QuotedStr(sequencia));
end;

function TAliquota.selecionaSequencia(aliq: Real): boolean;
begin
  Result := montaSelect('select * from aliq where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
    QuotedStr(vDadosIni.codifica(vDadosIni.vNumSerieEcf)) +
    ' and aliq = ' +
    vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(FloatToStr(aliq), 2)));
end;

end.

