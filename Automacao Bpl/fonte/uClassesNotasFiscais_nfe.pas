unit uClassesNotasFiscais_nfe;

interface

uses
  uDataSet_OOP,
  notafiscal_inut_class,
  empresa_nfe_class,
  DFeHwLibUnit,
  DB, Classes;

type

  EnumEventoMD = (mdNenhum, mdOpConfirmada, mdDesconhecimento, mdOpNaoRealizada, mdCiencia);

  TNF_CCe = class(TDataSet_OOP)
  private
    FOwner: TDataSet_OOP;
    fCOD_NF: Integer;
    FNFeEmEPEC: Boolean;
  public
    constructor create(AOwner: TDataSet_OOP);
    function selecionaCC_e(pCOD_NF: integer): boolean;
    function EnviarEPEC(ACodNF: Integer; var Aprint, AsendMail, AcomBol: Boolean; var tipoDANFe: string): Boolean;
    function post: Boolean; override;
    function insert: Boolean; override;
    function delete: Boolean; override;
    function edit: Boolean; override;
    function _enviarCC_e: Boolean;
    function _enviarCancelamento: Boolean;
    function _CC_eAutorizada: Boolean;
    function _NF_e_Cancelada: Boolean;
    function _imprimirEvento: Boolean;
    function _enviarEmailEvento: Boolean;
  end;

  TNF_Inut = class(TDataSet_OOP)
  private                  
    FOwner: TDataSet_OOP;
    FAno  : Integer;
    FanoStr: string;
    FarraySeqID: array of Integer;

    function GetInut(AseqID: Integer): TNotafiscal_inut_class;
    procedure SetarraySeqID;
    procedure VerificarNumerosNF(AseqID: Integer);
  public
    constructor create(AOwner: TDataSet_OOP);
    function Salvar(Ainut: TNotafiscal_inut_class): Integer;
    procedure abrir(AvariacaoAno: Integer);
    function delete: Boolean;
    function nfe_inutilizacao_email(AonlySel: Boolean; Aemail, Aanexos: string): boolean;
    function nfe_inutilizacao_enviar(Aseqid: Integer): Boolean;

    property Ano: string read FanoStr;
  end;

  TNFeDLL = class
  private   
    FOwner                    : TDataSet_OOP;
    Fnfe_imprimir             : Tnfe_imprimir;
    Fnfe_print                : Tnfe_print;
    Fnfe_email                : Tnfe_email;
    Fnfe_consultar            : Tnfe_consultar;
    Fnfe_status_servico       : Tnfe_status_servico;
    Fnfe_inutilizacao_enviar  : Tnfe_inutilizacao_enviar;
    Fnfe_inutilizacao_imprimir: Tnfe_inutilizacao_imprimir;
    Fnfe_inutilizacao_email   : Tnfe_inutilizacao_email;
    Fnfe_evento_enviar        : Tnfe_evento_enviar;
    Fnfe_evento_imprimir      : Tnfe_evento_imprimir;
    Fnfe_evento_email         : Tnfe_evento_email;
    Ffile_open_dialog         : Tfile_open_dialog;
    Fdfe_dados_certificado    : Tdfe_dados_certificado;
    FstrWide                  : WideString;
    FretornoStr               : TStrings;
    FempNFe: TEmpresa_nfe_class;
    function GetempNFe: TEmpresa_nfe_class;
    function LoadDLL: Boolean;
    procedure FreeDLL;
    function existePendencias: Boolean;
  public
    constructor Create(AOwner: TDataSet_OOP);
    destructor Destroy; override;

    function AutorizarNFe(Acod_nf: array of Integer): Boolean;

    function nfe_imprimir(Acod_nf: array of Integer; Aprint, AsavePDF: Boolean; ApathPDF: string; tipoDANFe: string): Boolean;
    function nfe_email(Acod_nf: array of Integer; AemailUnico, AcomEventos, AcomPDF, AcomBol: Boolean; Aemail, Aanexos: string): Boolean;
    function nfe_consultar(Acod_nf: array of Integer): Boolean;
    function nfe_status_servico(AtpEmiss: string): Boolean;

    function nfe_inutilizacao_enviar(Aseqid: Integer): Boolean;
    function nfe_inutilizacao_imprimir(Aseqid: Integer; Aprint, AsavePDF: Boolean; ApathPDF: string): Boolean;
    function nfe_inutilizacao_email(Aseqid: array of Integer; Aemail, Aanexos: string): Boolean;

    function nfe_evento_enviar(Acod_nf, Alote: Integer): Boolean;
    function nfe_evento_imprimir(Acod_nf, Alote: Integer; Aprint, AsavePDF: Boolean; ApathPDF: string): Boolean;
    function nfe_evento_email(Acod_nf, Alote: Integer; Aemail, Aanexos: string): Boolean;

    function file_open_dialog(var Afolter: WideString): Boolean;

    function dfe_dados_certificado(): string;

    property retornoStr: TStrings read FretornoStr write FretornoStr;
    property empNFe: TEmpresa_nfe_class read GetempNFe write FempNFe;
  end;

  TManifestacaoDestinatarioNFe = class(TDataSet_OOP)
  //Falta colocar trava na empresa para 1 usuário por vez fazer  a consulta
  private
    function eventoJaRegistrado(csitconfEvento: Integer): Boolean;
  public
    _cpfCnpj, _dtIni, _dtFim, _entSa: string;
    _numNf: Integer;
    _autorizadas, _canceladas, _ciencia, _desconhecimento,
      _naoRealizada, _confirmacao: Boolean;
    vXML: string;
    constructor create;
    function pesquisar: Boolean;
    function pesquisarUltimos15Dias: Boolean;
    function consulta(pEmissor, pConsuta, pNotas: Integer): Boolean;
    function download: Boolean;
    function entrarComNF: Boolean;
    function cienciaDaOperacao: Boolean;
    function desconhecimentodaOperacao: Boolean;
    function operacaoNaoRealizada: Boolean;
    function confirmacaoDaOperacao: Boolean;

    function _limparNSU: Boolean;
    function _atualizarSatusNF: Boolean;
    function _limparStatusUsuario: Boolean;
    function _ativarDFe: Boolean;
  end;

implementation

uses
  SysUtils, DBClient, IBDatabase, IBQuery, uDtmAtivo, uDtmNF,
  Forms, Windows, StrUtils, uClassesNotasFiscais, DateUtils, SituacaoNFeEnumUnit,
  uClassesNotasFiscais_consts, Dialogs;

{ TNF_CCe }

constructor TNF_CCe.create(AOwner: TDataSet_OOP);
begin
  FOwner := AOwner;
  dataSet := TClientDataSet(DtmNF.cdsCCe);
  transacao := TIBTransaction(DtmNF.transacaoNf);
  buscas := TIBQuery(DtmNF.qrBuscasNF);
end;

function TNF_CCe.delete: Boolean;
var
	vLote: string;
begin
  Result := False;
//  dataSet.Last;
  if not dataSet.IsEmpty then
    if Trim(dataSet.FieldByName('situacao').AsString) = sitAutorizada then
      raiseExceptionCreate('Último Evento está autorizado, não pode ser excluído','');

  if Application.MessageBox('Deseja mesmo excluir o Evento?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  vLote := dataSet.FieldByName('IDLOTE').AsString;
  dataSet.Delete;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('NF0148', 'EXCLUIR', 'SUCESSO', 'NOTAFISCAL_CARTA_CORRECAO', vLote, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('NF0148', 'EXCLUIR', 'FALHA', 'NOTAFISCAL_CARTA_CORRECAO', vLote, buscas);
  end;
end;

function TNF_CCe.edit: Boolean;
begin
  Result := False;

  if FNFeEmEPEC then
    raiseExceptionCreate('NFe ainda não Autorizada com Evento EPEC Autorizado. É necessário Autorizar a NFe para novos eventos', '');

//  dataSet.Last;
  if not dataSet.IsEmpty then
    if Trim(dataSet.FieldByName('situacao').AsString) = sitAutorizada then
      raiseExceptionCreate('Último Evento está autorizado, cadastre um novo Evento','');

  if inherited Edit then
    Result := True;

end;

function TNF_CCe.EnviarEPEC(ACodNF: Integer; var Aprint, AsendMail, AcomBol: Boolean;
  var tipoDANFe: string): Boolean;
var
  ALote: Integer;
  AenvNFe: Boolean;
begin
  Result := False;
  fCOD_NF := ACodNF;
  montaSelect('select * from notafiscal_carta_correcao' +
    ' where cod_nf = ' + IntToStr(ACodNF) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' order by idlote');

  if not dataSet.IsEmpty then
  begin
    if dataSet.FieldByName('NSEQEVENTO').AsInteger > 1 then
    begin
      vDadosIni.ShowErro('Já existe eventos com sequencia maior que 1');
      Exit;
    end;
    if dataSet.FieldByName('TIPO_EVENTO').AsString <> 'EPE' then
    begin
      vDadosIni.ShowErro('Já existe outros tipos de enventos. Para enviar o evento EPEC é necessário que não exista outro tipo de envento');
      Exit;
    end;
    ALote := dataSet.FieldByName('IDLOTE').AsInteger;
  end
  else
  begin
    if inherited insert then
    begin
      Result := True;
      dataSet.FieldByName('COD_NF').AsInteger := ACodNF;
      dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('NSEQEVENTO').AsInteger := 1;
      dataSet.FieldByName('IDLOTE').AsInteger := Gencodigo('NOTAFISCAL_CARTA_CORRECAO', dtmNF.SpIncCodNF,vDadosIni.codEmpresa);
      dataSet.FieldByName('TIPO_EVENTO').AsString := 'EPE';
      ALote := dataSet.FieldByName('IDLOTE').AsInteger;
      dataSet.Post;
      if Apply then
      begin
        CommitaTransacao;
      end
      else
      begin
        RollBackTransacao;
        vDadosIni.ShowErro('Erro ao salvar dados');
        Exit;
      end;
    end;
  end;

  if (FOwner as TNFCab).versaoNFe = vnf400 then
  begin
    AenvNFe := True;
    if Assigned((FOwner as TNFCab).confNFeForm) then
      AenvNFe := (FOwner as TNFCab).confNFeForm(Aprint, AsendMail, AcomBol, tipoDANFe);
    if AenvNFe then    
      if not (FOwner as TNFCab).dllNFe.AutorizarNFe([(FOwner as TNFCab).campo_cod_nf]) then
      begin
        if Trim((FOwner as TNFCab).dllNFe.retornoStr.Text) <> '' then
          vDadosIni.ShowErro((FOwner as TNFCab).dllNFe.retornoStr.Text);
      end
      else if _CC_eAutorizada then
      begin
//        if (FOwner as TNFCab).dataSet.FieldByName('natureza_nf').AsString = 'S' then
//          (FOwner as TNFCab).verificarImpressaoBoleto;
//        if AsendMail then
//          (FOwner as TNFCab).emailNFe(AcomBol);
      end;
  end
  else
    EnviarEvento((vDadosIni.vBancoHW), StrToInt(vDadosIni.codEmpresa), ALote, (vDadosIni.vNomeUsuario), '1');

  montaSelect('select * from notafiscal_carta_correcao' +
    ' where cod_nf = ' + IntToStr(ACodNF) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' order by idlote');

  if not ((FOwner as TNFCab).versaoNFe in [vnf400]) then
    if _CC_eAutorizada then
    begin
      _imprimirEvento;
      _enviarEmailEvento;
    end;

  Result := _CC_eAutorizada;
end;

function TNF_CCe.insert: Boolean;
begin
  Result := False;

  if FNFeEmEPEC then
    raiseExceptionCreate('NFe ainda não Autorizada com Evento EPEC Autorizado. É necessário Autorizar a NFe para novos eventos', '');

  dataSet.Last;
  if not dataSet.IsEmpty then
    if Trim(dataSet.FieldByName('situacao').AsString) <> sitAutorizada then
      raiseExceptionCreate('Último Evento da NFe não está "Autorizado", um novo Evento somente poderá ser criado quando não existir nenhuma Evento ou o último ja ter sido Autorizado' + sLineBreak +
        'Altere o Evento que ainda não está Autorizado e tente fazer o Envio','');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_NF').AsInteger := fCOD_NF;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
//    dataSet.FieldByName('NSEQEVENTO').AsInteger := dataSet.RecordCount + 1;
  end;
end;

function TNF_CCe.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('NF0146', 'SALVAR', '', 'NOTAFISCAL_CARTA_CORRECAO', dataSet.FieldByName('IDLOTE').AsString, buscas, True) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('XCORRECAO').AsString) = '' then
      raiseExceptionCreate('Informe um texto para o Evento da NFe', 'DBMemo16');

    if Trim(dataSet.FieldByName('TIPO_EVENTO').AsString) = '' then
      raiseExceptionCreate('Selecione o tipo de Evento da NFe', 'DBComboBox22')
    else if (Trim(dataSet.FieldByName('TIPO_EVENTO').AsString) <> 'CAN') and
      (Trim(dataSet.FieldByName('TIPO_EVENTO').AsString) <> 'CCE') then
      raiseExceptionCreate('Selecione corretamente o tipo de Evento da NFe', 'DBComboBox22');

    if (Length(Trim(dataSet.FieldByName('XCORRECAO').AsString)) < 15) or
      (Length(Trim(dataSet.FieldByName('XCORRECAO').AsString)) > 1001) then
      raiseExceptionCreate('Texto para o Evento da NFe deve ter no mínimo 15 caracteres e máximo de 1000', 'DBMemo16');

    dataSet.FieldByName('XCORRECAO').AsString := Trim(dataSet.FieldByName('XCORRECAO').AsString);

    if dataSet.State = dsInsert then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select count(idlote) contador from NOTAFISCAL_CARTA_CORRECAO' +
        ' where cod_nf = ' + IntToStr(fCOD_NF) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tipo_evento = ' + QuotedStr(Trim(dataSet.FieldByName('TIPO_EVENTO').AsString));
      buscas.Open;
      dataSet.FieldByName('NSEQEVENTO').AsInteger := buscas.FieldByName('contador').AsInteger + 1;
      dataSet.FieldByName('IDLOTE').AsInteger := Gencodigo('NOTAFISCAL_CARTA_CORRECAO', dtmNF.SpIncCodNF,vDadosIni.codEmpresa);
    end;

    Result := inherited Post;
    if dataSet.ChangeCount > 0 then
      Result := Apply
    else
      Result := True;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('NF0146', acao, 'SUCESSO', 'NOTAFISCAL_CARTA_CORRECAO', dataSet.FieldByName('IDLOTE').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('NF0146', acao, 'FALHA', 'NOTAFISCAL_CARTA_CORRECAO', dataSet.FieldByName('IDLOTE').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TNF_CCe.selecionaCC_e(pCOD_NF: integer): boolean;
begin
  Result := False;
  FNFeEmEPEC := False;
  if pCOD_NF = 0 then
  begin
    Application.MessageBox('Nenhuma nota fiscal selecionada', 'Atenção', 64);
    Exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select emissao_propria, situacao_nfe, nfe_dpec_nregdpec from notafiscal' +
    ' where cod_nf = ' + IntToStr(pCOD_NF) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if buscas.IsEmpty then
  begin
    Application.MessageBox('Nota fiscal não encontada', 'Atenção', 64);
    Exit;
  end;

  if buscas.FieldByName('emissao_propria').AsString <> 'S' then
  begin
    Application.MessageBox('Nota fiscal não é de emissão própria', 'Atenção', 64);
    Exit;
  end;

  if (Trim(buscas.FieldByName('situacao_nfe').AsString) <> sitAutorizada) and
    (Trim(buscas.FieldByName('situacao_nfe').AsString) <> sitCancelada) then
  begin
    FNFeEmEPEC := Trim(buscas.FieldByName('nfe_dpec_nregdpec').AsString) <> '';
    if not FNFeEmEPEC then
    begin
      Application.MessageBox('Nota fiscal não Autorizada', 'Atenção', 64);
      Exit;
    end;
  end;

  fCOD_NF:= pCOD_NF;
  Result := montaSelect('select * from notafiscal_carta_correcao' +
    ' where cod_nf = ' + IntToStr(fCOD_NF) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' order by idlote');
  IndexFieldNames := 'IDLOTE';
  dataSet.Last;
end;

function TNF_CCe._CC_eAutorizada: Boolean;
begin
//  dataSet.Last;

  buscas.Close;
  buscas.SQL.Text := 'select ncc.*, nf.chave_nfe, nf.num_nf, nf.serie from notafiscal_carta_correcao ncc' +
    ' inner join notafiscal nf on nf.cod_nf = ncc.cod_nf and nf.cod_empresa = ncc.cod_empresa' +
    ' where ncc.cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
    ' and ncc.idlote = ' + IntToStr(dataSet.FieldByName('idlote').AsInteger) +
    ' and ncc.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := Trim(buscas.FieldByName('situacao').AsString) = sitAutorizada;
end;

function TNF_CCe._enviarCancelamento: Boolean;
var
  idLote: Integer;
begin

  if FNFeEmEPEC then
    raiseExceptionCreate('NFe ainda não Autorizada com Evento EPEC Autorizado. É necessário Autorizar a NFe para novos eventos', '');

//  dataSet.Last;

//  if Date() then

  if (FOwner as TNFCab).versaoNFe = vnf400 then
  begin
    if not (FOwner as TNFCab).dllNFe.nfe_evento_enviar((FOwner as TNFCab).campo_cod_nf, dataSet.FieldByName('idlote').AsInteger) then
      if Trim((FOwner as TNFCab).dllNFe.retornoStr.Text) <> '' then
        vDadosIni.ShowErro((FOwner as TNFCab).dllNFe.retornoStr.Text);
  end
  else
    EnviarEvento(pchar(vDadosIni.vBancoHW), StrToInt(vDadosIni.codEmpresa), dataSet.FieldByName('idlote').AsInteger, pchar(vDadosIni.vNomeUsuario), '1');

  idLote := dataSet.FieldByName('idlote').AsInteger;

  montaSelect(dataSet.CommandText);

  dataSet.FindNearest([idLote]);

  Result := idLote = dataSet.FieldByName('idlote').AsInteger;
end;

function TNF_CCe._enviarCC_e: Boolean;
var
  idLote: Integer;
begin

  if FNFeEmEPEC then
    raiseExceptionCreate('NFe ainda não Autorizada com Evento EPEC Autorizado. É necessário Autorizar a NFe para novos eventos', '');

  if not vDadosIni.PesqPros('NF0147', 'ENVIAR', '', 'NOTAFISCAL_CARTA_CORRECAO', dataSet.FieldByName('IDLOTE').AsString, buscas, True) then
    Exit;

//  dataSet.Last;

  if (FOwner as TNFCab).versaoNFe = vnf400 then
  begin
    if not (FOwner as TNFCab).dllNFe.nfe_evento_enviar((FOwner as TNFCab).campo_cod_nf, dataSet.FieldByName('idlote').AsInteger) then
      if Trim((FOwner as TNFCab).dllNFe.retornoStr.Text) <> '' then
        vDadosIni.ShowErro((FOwner as TNFCab).dllNFe.retornoStr.Text);
  end
  else
    EnviarEvento(pchar(vDadosIni.vBancoHW), StrToInt(vDadosIni.codEmpresa), dataSet.FieldByName('idlote').AsInteger, pchar(vDadosIni.vNomeUsuario), '1');

  idLote := dataSet.FieldByName('idlote').AsInteger;

  montaSelect(dataSet.CommandText);
//  dataSet.Last;
  dataSet.FindNearest([idLote]);

  Result := idLote = dataSet.FieldByName('idlote').AsInteger;
end;

function TNF_CCe._enviarEmailEvento: Boolean;
var
  Aemail: string;
begin
  if _CC_eAutorizada then
    if (FOwner as TNFCab).versaoNFe = vnf400 then
    begin
      Aemail := (FOwner as TNFCab).dataSet.FieldByName('dest_email').AsString;
      if not InputQuery('Email', 'Enviar evento para o email', Aemail) then
        Exit
      else if Trim(Aemail) <> '' then
        (FOwner as TNFCab).dllNFe.nfe_evento_email((FOwner as TNFCab).campo_cod_nf, dataSet.FieldByName('idlote').AsInteger, Aemail, '');
    end
    else
      EnviarEvento(pchar(vDadosIni.vBancoHW), StrToInt(vDadosIni.codEmpresa), dataSet.FieldByName('idlote').AsInteger, pchar(vDadosIni.vNomeUsuario), '3');
end;

function TNF_CCe._imprimirEvento: Boolean;
begin
  if _CC_eAutorizada then
    if (FOwner as TNFCab).versaoNFe = vnf400 then
      (FOwner as TNFCab).dllNFe.nfe_evento_imprimir((FOwner as TNFCab).campo_cod_nf, dataSet.FieldByName('idlote').AsInteger, True, False, '')
    else
      EnviarEvento(pchar(vDadosIni.vBancoHW), StrToInt(vDadosIni.codEmpresa), dataSet.FieldByName('idlote').AsInteger, pchar(vDadosIni.vNomeUsuario), '2');
end;

function TNF_CCe._NF_e_Cancelada: Boolean;
begin
//  dataSet.Last;

  buscas.Close;
  buscas.SQL.Text := 'select nf.situacao_nfe from notafiscal nf' +
    ' where nf.cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
    ' and nf.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := Trim(buscas.FieldByName('situacao_nfe').AsString) = sitCancelada;
end;

{ TNF_Inut }

procedure TNF_Inut.abrir(AvariacaoAno: Integer);
var
  Aano: Integer;
begin
  FAno := FAno + AvariacaoAno;
  Aano := StrToInt(Copy(IntToStr(FAno), 3, 2));
  FanoStr := IntToStr(FAno);

  montaSelect('select * from NOTAFISCAL_INUT' +
              ' where ano = ' + IntToStr(Aano) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' and cnpj = ' + QuotedStr(vDadosIni.vEmp.vCNPJ) +
              ' and tpamb = ' + QuotedStr(IfThen(vDadosIni.vEmp.vNfe.webServiceAmbiente <> 'Produção', '2', '1')) +
              ' order by seqid');
end;

constructor TNF_Inut.create(AOwner: TDataSet_OOP);
begin
  FOwner := AOwner;

  dataSet     := TClientDataSet(DtmNF.cdsNFeInut);
  transacao   := TIBTransaction(FOwner.transacao);
  buscas      := TIBQuery(DtmNF.qrBuscasNF);

  FAno := YearOf(Date);
  FanoStr := IntToStr(FAno)
end;

function TNF_Inut.delete: Boolean;
var
  cstat: Integer;
begin
  try
    cstat := SqlOpen('select cstat from notafiscal_inut' +
            ' where seqid = ' + IntToStr(dataSet.FieldByName('seqid').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa).FieldByName('cstat').AsInteger;
    if (cstat = 102) or (cstat = 563) then
      raiseExceptionCreate('Inutilização não pode ser excluída, pois está homologada', '');

    SqlExec('delete from notafiscal_inut' +
            ' where seqid = ' + IntToStr(dataSet.FieldByName('seqid').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa);
    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    dataSet.Refresh;

  except on E: Exception do
    begin                                                 
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
      registraErro('TNF_Inut.delete Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao excluir dados' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

function TNF_Inut.GetInut(AseqID: Integer): TNotafiscal_inut_class;
begin
  SqlOpen('select * from notafiscal_inut' +
          ' where seqid = ' + IntToStr(AseqID) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa);

  Result := TNotafiscal_inut_class.Create;
  Result.SetValuesFrom(buscas);
end;

function TNF_Inut.nfe_inutilizacao_email(AonlySel: Boolean; Aemail,
  Aanexos: string): boolean;
var
  AstrMail: string;
begin
  AstrMail  := '';

  if not AonlySel then
  begin
    SetLength(FarraySeqID, 1);
    FarraySeqID[High(FarraySeqID)] := dataSet.FieldByName('seqid').AsInteger;
  end
  else
    SetarraySeqID;

  if not (FOwner as TNFCab).dllNFe.nfe_inutilizacao_email(FarraySeqID, Aemail, Aanexos) then
    AstrMail := (FOwner as TNFCab).dllNFe.retornoStr.Text;

  if AstrMail <> '' then
    vDadosIni.ShowErro(AstrMail);
end;

function TNF_Inut.nfe_inutilizacao_enviar(Aseqid: Integer): Boolean;
var
  AlastNumNF: Integer;
  Ainut: TNotafiscal_inut_class;
begin
  try
    Ainut := GetInut(Aseqid);
    try
      if Assigned(Ainut) then
        if (Ainut.cstat = 102) or (Ainut.cstat = 563) then
        begin
          VerificarNumerosNF(Aseqid);
          vDadosIni.ShowErro('Inutilização já homologada');
          Exit;
        end;

      if not (FOwner as TNFCab).dllNFe.nfe_inutilizacao_enviar(Aseqid) then
      begin
        vDadosIni.GravaAuditoria('NFE006', 'HOMOLOGACAO', Format('Inutilização NAO homologada %s', [(FOwner as TNFCab).dllNFe.retornoStr.Text]), 'NOTAFISCAL_INUT', '', buscas);
        vDadosIni.ShowErro((FOwner as TNFCab).dllNFe.retornoStr.Text);
      end
      else
      begin
        Result := True;
        Ainut := GetInut(Aseqid);
        if Assigned(Ainut) then
          if (Ainut.cstat = 102) or (Ainut.cstat = 563) then
          begin
            vDadosIni.GravaAuditoria('NFE006', 'HOMOLOGACAO', Format('Inutilização homologada cstat %d', [Ainut.cstat]), 'NOTAFISCAL_INUT', '', buscas);
            VerificarNumerosNF(Aseqid);
          end;
      end;
    finally
      FreeAndNil(Ainut);
    end;
  except on E: Exception do    
    begin
      registraErro('TNF_Inut.nfe_inutilizacao_enviar Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao inutilizar dados' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

function TNF_Inut.Salvar(Ainut: TNotafiscal_inut_class): Integer;
begin
  Result := 0;
  try
    if Ainut.serie < 0  then
      raiseExceptionCreate('Série deve ser informada', '');

    if Ainut.nnfini <= 0  then
      raiseExceptionCreate('Número da faixa inicial deve ser informado', '');

    if Ainut.nnffin <= 0  then
      raiseExceptionCreate('Número da faixa final deve ser informado', '');

    if (Length(Trim(Ainut.xjust)) < 15 ) or (Length(Trim(Ainut.xjust)) > 255 ) then
      raiseExceptionCreate('Justificativa deve conter de 15 a 255 caracteres', '');

    if Ainut.nnffin < Ainut.nnfini then
      raiseExceptionCreate('Número da faixa final deve ser maior ou igual a faixa inicial', '');

    if not SqlOpen('select seqid from notafiscal_inut' +
                   ' where cod_empresa = ' + vDadosIni.codEmpresa +
                   ' and tpamb = ' + QuotedStr(Ainut.tpamb) +
                   ' and cnpj = ' + QuotedStr(Ainut.cnpj) +
                   ' and modelo = ' + QuotedStr(Ainut.modelo) +
                   ' and serie = ' + IntToStr(Ainut.seqid) +
                   ' and nnfini >= ' + IntToStr(Ainut.nnfini) +
                   ' and nnffin <= ' + IntToStr(Ainut.nnfini)).IsEmpty then
      raiseExceptionCreate('Já existe inutilização homologada para notas fiscais informadas nesta fáixa', '');
      
    if not SqlOpen('select seqid from notafiscal_inut' +
                   ' where cod_empresa = ' + vDadosIni.codEmpresa +
                   ' and tpamb = ' + QuotedStr(Ainut.tpamb) +
                   ' and cnpj = ' + QuotedStr(Ainut.cnpj) +
                   ' and modelo = ' + QuotedStr(Ainut.modelo) +
                   ' and serie = ' + IntToStr(Ainut.seqid) +
                   ' and nnfini >= ' + IntToStr(Ainut.nnffin) +
                   ' and nnffin <= ' + IntToStr(Ainut.nnffin)).IsEmpty then
      raiseExceptionCreate('Já existe inutilização homologada para notas fiscais informadas nesta fáixa', '');

    Ainut.seqid := Gencodigo('NOTAFISCAL_INUT', buscas, vDadosIni.codEmpresa);

    buscas.Close;
    buscas.SQL.Text := 'insert into NOTAFISCAL_INUT' +
                       ' (seqid, cod_empresa, tpamb, ano, cnpj, modelo, serie, nnfini, nnffin, xjust)' +
                       ' values' +
                       ' (:seqid, :cod_empresa, :tpamb, :ano, :cnpj, :modelo, :serie, :nnfini, :nnffin, :xjust)';
    buscas.ParamByName('seqid').AsInteger       := Ainut.seqid;
    buscas.ParamByName('cod_empresa').AsInteger := Ainut.cod_empresa;
    buscas.ParamByName('tpamb').AsString        := Ainut.tpamb;
    buscas.ParamByName('ano').AsInteger         := StrToInt(CopY(vDadosIni.StrZero(Ainut.ano, 4), 3, 2));
    buscas.ParamByName('cnpj').AsString         := Ainut.cnpj;
    buscas.ParamByName('modelo').AsString       := Ainut.modelo;
    buscas.ParamByName('serie').AsInteger       := Ainut.serie;
    buscas.ParamByName('nnfini').AsInteger      := Ainut.nnfini;
    buscas.ParamByName('nnffin').AsInteger      := Ainut.nnffin;
    buscas.ParamByName('xjust').AsString        := Trim(Ainut.xjust);
    buscas.ExecSQL;
    
    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

     Result := Ainut.seqid;

    dataSet.Refresh;

    vDadosIni.GravaAuditoria('NFE006', 'INSERIR', Format('FAIXA DE %d A %d', [Ainut.nnfini, Ainut.nnffin]),
                             'NOTAFISCAL_INUT', '', FOwner.buscas);

  except on E: Exception do
    begin                                        
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
      registraErro('TNF_Inut.Salvar Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

procedure TNF_Inut.SetarraySeqID;
begin
  SetLength(FarraySeqID, 0);
  try
    dataSet.DisableControls;
    storeRecNo;
    storeFilter;

    dataSet.Filter := 'SEL = ''S''';
    dataSet.Filtered := True;
    dataSet.First;
    while not dataSet.Eof do
    begin
      SetLength(FarraySeqID, Length(FarraySeqID) + 1);
      FarraySeqID[High(FarraySeqID)] := dataSet.FieldByName('seqid').AsInteger;
      dataSet.Next;
    end;
  finally
    restoreFilter;
    restoreRecNo;
    dataSet.EnableControls;
  end;
end;

procedure TNF_Inut.VerificarNumerosNF(AseqID: Integer);
var
  Ainut: TNotafiscal_inut_class;
  Anum_nf, AtabCodigo, AtabCodigo_New: Integer;
  sqlComand: string;
  restoreComand: Boolean;
begin

  Ainut := GetInut(AseqID);
  try
    if (Ainut.cstat <> 102) and (Ainut.cstat <> 563) then
      Exit;

    AtabCodigo := SqlOpen('select valor from codigo' +
                          ' where tabela = ' + QuotedStr('NF_VENDA' + IfThen(Ainut.tpamb <> '1', '_HOM')) +
                          ' and cod_empresa = ' + vDadosIni.codEmpresa).FieldByName('valor').AsInteger;
    AtabCodigo_New := 0;

    for Anum_nf := Ainut.nnfini to Ainut.nnffin do
    begin
      //verificando tabela codigo;
      if vDadosIni.vEmp.vSubSerieNotaFiscal = Ainut.serie then
        if (AtabCodigo + 1) = Anum_nf then
          AtabCodigo_New := Anum_nf
        else if (AtabCodigo_New + 1) = Anum_nf then
          AtabCodigo_New := Anum_nf;

      //saidas
      SqlExec('update notafiscal set situacao_nfe = ' + QuotedStr(sitInutilizada) +
              ' where num_nf = ' + IntToStr(Anum_nf) +
              ' and nfe_tpamb = ' + QuotedStr(Ainut.tpamb) +
              ' and serie = ' + QuotedStr(IntToStr(Ainut.serie)) +
              ' and modelo_nf = ''55''' +
              ' and emissao_propria = ''S''' +
              ' and natureza_nf = ''S''' +
              ' and nfe_versao = ' + QuotedStr(strVer400) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa);
      //entradas emissao propria                                              
      SqlExec('update notafiscal set situacao_nfe = ' + QuotedStr(sitInutilizada) +
              ' where num_nf = ' + IntToStr(Anum_nf) +
              ' and nfe_tpamb = ' + QuotedStr(Ainut.tpamb) +
              ' and serie = ' + QuotedStr(IntToStr(Ainut.serie)) +
              ' and modelo_nf = ''55''' +
              ' and emissao_propria = ''S''' +
              ' and natureza_nf = ''E''' +
              ' and num_gerado = ''S''' +
              ' and nfe_versao = ' + QuotedStr(strVer400) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa);
    end;
    if (AtabCodigo_New > 0) and (vDadosIni.vEmp.vSubSerieNotaFiscal = Ainut.serie) then
      SqlExec('update codigo set valor = ' + IntToStr(AtabCodigo_New) +
              ' where tabela = ' + QuotedStr('NF_VENDA' + IfThen(Ainut.tpamb <> '1', '_HOM')) +
              ' and valor < ' + IntToStr(AtabCodigo_New) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa);

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

    restoreComand := False;
    sqlComand := '';
    if FOwner.dataSet.Active then
      sqlComand := FOwner.dataSet.CommandText;
    try

      for Anum_nf := Ainut.nnfini to Ainut.nnffin do
      //if Ainut.nnfini = Ainut.nnffin then
      begin


        AtabCodigo := SqlOpen('select cod_nf from notafiscal' +
                              ' where num_nf = ' + IntToStr(Anum_nf) +
                              ' and nfe_tpamb = ' + QuotedStr(Ainut.tpamb) +
                              ' and serie = ' + QuotedStr(IntToStr(Ainut.serie)) +
                              ' and modelo_nf = ''55''' +
                              ' and emissao_propria = ''S''' +
                              ' and nfe_versao = ' + QuotedStr(strVer400) +
                              ' and situacao_nfe = ' + QuotedStr(sitInutilizada) +
                              ' and status <> ' + QuotedStr(stsCancelada) +
                              ' and cod_empresa = ' + vDadosIni.codEmpresa)
                              .FieldByName('cod_nf').AsInteger;
        if AtabCodigo > 0 then
        begin
          if sqlComand <> '' then          
            restoreComand := True;

          (FOwner as TNFCab).selecionaNotaFiscal(AtabCodigo);
          (FOwner as TNFCab).vItem.selecionaItens(AtabCodigo);//remover isso pois é desnecessário
          (FOwner as TNFCab).cancelarNotaFiscal(ocEventoInut);
        end;
      end;
    finally
      if restoreComand then
        FOwner.ClientOpen(sqlComand);
    end;

  finally
    FreeAndNil(Ainut);
  end;
end;

{ TNFeDLL }

constructor TNFeDLL.Create(AOwner: TDataSet_OOP);
begin
  FOwner := AOwner;
  FretornoStr := TStringList.Create;
end;

destructor TNFeDLL.Destroy;
begin
  if Assigned(FretornoStr) then
    FreeAndNil(FretornoStr);
  if Assigned(FempNFe) then
    FreeAndNil(FempNFe);
  inherited;
end;

function TNFeDLL.dfe_dados_certificado: string;
var
  resposta, erros: WideString;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fdfe_dados_certificado) then
        @Fdfe_dados_certificado := GetProcAddress(hdNFE, PChar('dfe_dados_certificado'));
      resposta := Fdfe_dados_certificado(vDadosIni.cod_empresa, vDadosIni.vBancoHW, '55', erros);
      Result := resposta;
    end
    else
      Result := '';
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.existePendencias: Boolean;
var
  AqtdePendente, AdatasPendente: Integer;
  AListMessage: TStrings;
begin
  Result         := False;
  AqtdePendente  := 0;
  AdatasPendente := 0;
  AListMessage  := TStringList.Create;
  GetempNFe;
  if not Assigned(FempNFe) then
    Exit;

  if (FempNFe.nfe_qtdelimitenfpend <= 0) and (FempNFe.nfependemdias <= 0) then
    Exit;

  try
    if (FempNFe.nfe_qtdelimitenfpend > 0) then
    begin
      FOwner.SqlOpen('select coalesce(nf.situacao_nfe, '''') situacao_nfe, count(nf.cod_nf) qtde from notafiscal nf' +
                     ' where nf.cod_empresa = ' + vDadosIni.codEmpresa +
                     ' and nf.modelo_nf = ''55''' +
                     ' and nf.emissao_propria = ''S''' +
                     ' and nf.ativo = 1' +
                     ' and not coalesce(nf.situacao_nfe, '''') in (' + QuotedStr(sitEnviando) +
                     ', ' + QuotedStr(sitEmProcessamento) + ', ' + QuotedStr(sitAutorizada) +
                     ', ' + QuotedStr(sitDenegada) + ', ' + QuotedStr(sitCancelada) +
                     ', ' + QuotedStr(sitInutilizada) + ', ' + QuotedStr(sitEmEPEC) + ')' +
                     ' group by 1');
      while not FOwner.buscas.Eof do
      begin
        if AqtdePendente = 0 then
          AListMessage.Add(Format('Quantidade de NFe pendentes acima do configurado %d' + sLineBreak, [FempNFe.nfe_qtdelimitenfpend]));
        AqtdePendente := AqtdePendente + FOwner.buscas.FieldByName('qtde').AsInteger;
        AListMessage.Add('Quantidade pendente: ' + IntToStr(FOwner.buscas.FieldByName('qtde').AsInteger) + ' - Situação: ' + FOwner.buscas.FieldByName('situacao_nfe').AsString );
        FOwner.buscas.Next;
      end;
      if (AqtdePendente <= FempNFe.nfe_qtdelimitenfpend ) then
        AListMessage.Clear;
    end;

    if (FempNFe.nfependemdias > 0) then
    begin
      FOwner.SqlOpen('select coalesce(nf.situacao_nfe, '''') situacao_nfe, count(nf.cod_nf) qtde from notafiscal nf' +
                     ' where nf.cod_empresa = ' + vDadosIni.codEmpresa +
                     ' and nf.modelo_nf = ''55''' +
                     ' and nf.emissao_propria = ''S''' +
                     ' and nf.ativo = 1' +
                     ' and not coalesce(nf.situacao_nfe, '''') in (' + QuotedStr(sitEnviando) +
                     ', ' + QuotedStr(sitEmProcessamento) + ', ' + QuotedStr(sitAutorizada) +
                     ', ' + QuotedStr(sitDenegada) + ', ' + QuotedStr(sitCancelada) +
                     ', ' + QuotedStr(sitInutilizada) + ', ' + QuotedStr(sitEmEPEC) + ')' +
                     ' and nf.data_contabil < ' + vDadosIni.FusoSqlDate + ' - ' + IntToStr(FempNFe.nfependemdias) +
                     ' group by 1');
      while not FOwner.buscas.Eof do
      begin
        if AdatasPendente = 0 then
          AListMessage.Add( sLineBreak + sLineBreak +
                            Format('Quantidade de NFe pendentes com data de emissão acima de %d dias como configurado' + sLineBreak, [FempNFe.nfependemdias]));
        AdatasPendente := AdatasPendente + FOwner.buscas.FieldByName('qtde').AsInteger;
        AListMessage.Add('Quantidade pendente: ' + IntToStr(FOwner.buscas.FieldByName('qtde').AsInteger) + ' - Situação: ' + FOwner.buscas.FieldByName('situacao_nfe').AsString );
        FOwner.buscas.Next;
      end;
    end;

    if AListMessage.Count > 0 then
    begin
      vDadosIni.ShowAtencao(AListMessage.Text);
      if not vDadosIni.PesqPros('NFE001', 'VALIDAR',
                                Format('QTDE CFG/PEND: %d/%d / DIAS CGG/PEND: %d/%d', [FempNFe.nfe_qtdelimitenfpend,
                                                                                       AqtdePendente,
                                                                                       FempNFe.nfependemdias,
                                                                                       AdatasPendente]), 'NFE', '', FOwner.buscas) then
        Result := True;
    end;

  finally
    FreeAndNil(AListMessage);
  end;
end;

function TNFeDLL.file_open_dialog(var Afolter: WideString): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Ffile_open_dialog) then
        @Ffile_open_dialog := GetProcAddress(hdNFE, PChar('file_open_dialog'));
      Result := Ffile_open_dialog(Afolter);
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

procedure TNFeDLL.FreeDLL;
begin
//  if hdNFE <> 0 then
//  begin
//    FreeLibrary(hdNFE);
//    hdNFE := 0;
//  end;
end;

function TNFeDLL.GetempNFe: TEmpresa_nfe_class;
begin
  try
    with FOwner do
    begin
      if SqlOpen('select ' + TEmpresa_nfe_class.GetFieldsSql() + ' from empresa' +
               ' where cod_empresa = ' + vDadosIni.codEmpresa).IsEmpty then
      Exit;

      FempNFe := TEmpresa_nfe_class.Create;
      FempNFe.SetValuesFrom(buscas);
    end;
  finally
    Result := FempNFe;
  end;
end;

function TNFeDLL.LoadDLL: Boolean;
begin
  try    
    if hdNFE > 0 then
      Exit;

    if hdNFE = 0 then
      carregaDLLNfe;//hdNFE := LoadLibrary(Pchar('hw.nfe.v400.dx.dll'));//hdNFE := LoadLibrary(Pchar('HWNFC.dll'));

    if hdNFE = 0 then
      Exit;

    Result := True;
  finally
    Result := hdNFE > 0;
  end;
end;

function TNFeDLL.AutorizarNFe(Acod_nf: array of Integer): Boolean;
var
  I: Integer;
begin
  try
    if existePendencias then
    begin
      Result := False;
      FretornoStr.Text := 'Pendencias de NFe sem finalização';
      Exit;
    end;

    Result := DFeHwLib.Autorizar(Acod_nf, FstrWide);
    FretornoStr.Text := FstrWide;

  finally
    for I := Low(Acod_nf) to High(Acod_nf) do
      (FOwner as TNFCab).dupNFe.gerarBoletosPendentes(Acod_nf[I]);
  end;
end;

function TNFeDLL.nfe_consultar(Acod_nf: array of Integer): Boolean;
var
  I: Integer;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_consultar) then
        @Fnfe_consultar := GetProcAddress(hdNFE, PChar('nfe_consultar'));
      Result := Fnfe_consultar(Acod_nf, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;

    for I := Low(Acod_nf) to High(Acod_nf) do
      (FOwner as TNFCab).dupNFe.gerarBoletosPendentes(Acod_nf[I]);
  end;
end;

function TNFeDLL.nfe_email(Acod_nf: array of Integer; AemailUnico, AcomEventos,
  AcomPDF, AcomBol: Boolean; Aemail, Aanexos: string): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_email) then
        @Fnfe_email := GetProcAddress(hdNFE, PChar('nfe_email'));
      Result := Fnfe_email(Acod_nf, AemailUnico, AcomEventos, AcomPDF, AcomBol, Aemail, Aanexos,
                           StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, vDadosIni.vNomeUsuario, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_evento_email(Acod_nf, Alote: Integer; Aemail,
  Aanexos: string): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_evento_email) then
        @Fnfe_evento_email := GetProcAddress(hdNFE, PChar('nfe_evento_email'));
      Result := Fnfe_evento_email(Acod_nf, Alote, Aemail, Aanexos, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_evento_enviar(Acod_nf, Alote: Integer): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_evento_enviar) then
        @Fnfe_evento_enviar := GetProcAddress(hdNFE, PChar('nfe_evento_enviar'));
      Result := Fnfe_evento_enviar(Acod_nf, Alote, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_evento_imprimir(Acod_nf, Alote: Integer; Aprint,
  AsavePDF: Boolean; ApathPDF: string): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_evento_imprimir) then
        @Fnfe_evento_imprimir := GetProcAddress(hdNFE, PChar('nfe_evento_imprimir'));
      Result := Fnfe_evento_imprimir(Acod_nf, Alote, Aprint, AsavePDF, ApathPDF, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_imprimir(Acod_nf: array of Integer; Aprint,
  AsavePDF: Boolean; ApathPDF, tipoDANFe: string): Boolean;
begin

  try
    if LoadDLL then
    begin
      {
      if not Assigned(@Fnfe_imprimir) then
        @Fnfe_imprimir := GetProcAddress(hdNFE, PChar('nfe_imprimir'));
      Result := Fnfe_imprimir(Acod_nf, Aprint, AsavePDF, ApathPDF, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      }
      if not Assigned(@Fnfe_print) then
        @Fnfe_print := GetProcAddress(hdNFE, PChar('nfe_print'));
      Result := Fnfe_print(Acod_nf,
        WideString(Format('empresaId=%d;databaseName=%s;print=%s;savePDF=%s;pathPDF=%s;tipoDANFe=%s',
                          [vDadosIni.cod_empresa, vDadosIni.vBancoHW, BoolToStr(Aprint), BoolToStr(AsavePDF),
                           ApathPDF, tipoDANFe])), FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_inutilizacao_email(Aseqid: array of Integer; Aemail,
  Aanexos: string): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_inutilizacao_email) then
        @Fnfe_inutilizacao_email := GetProcAddress(hdNFE, PChar('nfe_inutilizacao_email'));
      Result := Fnfe_inutilizacao_email(Aseqid, Aemail, Aanexos, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_inutilizacao_enviar(Aseqid: Integer): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_inutilizacao_enviar) then
        @Fnfe_inutilizacao_enviar := GetProcAddress(hdNFE, PChar('nfe_inutilizacao_enviar'));
      Result := Fnfe_inutilizacao_enviar(Aseqid, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_inutilizacao_imprimir(Aseqid: Integer; Aprint,
  AsavePDF: Boolean; ApathPDF: string): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_inutilizacao_imprimir) then
        @Fnfe_inutilizacao_imprimir := GetProcAddress(hdNFE, PChar('nfe_inutilizacao_imprimir'));
      Result := Fnfe_inutilizacao_imprimir(Aseqid, Aprint, AsavePDF, ApathPDF, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;

function TNFeDLL.nfe_status_servico(AtpEmiss: string): Boolean;
begin
  try
    if LoadDLL then
    begin
      if not Assigned(@Fnfe_status_servico) then
        @Fnfe_status_servico := GetProcAddress(hdNFE, PChar('nfe_status_servico'));
      Result := Fnfe_status_servico(AtpEmiss, StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, FstrWide);
      FretornoStr.Text := FstrWide;
    end
    else
      Result := False;
  finally
    FreeDLL;
  end;
end;    

{ TManifestacaoDestinatarioNFe }

function TManifestacaoDestinatarioNFe.cienciaDaOperacao: Boolean;
var
  vChave: string;
begin
  try
    Result := False;

    vChave :=  Trim(dataSet.FieldByName('CHAVE_NFE').AsString);
    dataSet.RefreshRecord;

    if Trim(vChave) <> Trim(dataSet.FieldByName('CHAVE_NFE').AsString) then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' não se encontra mais disponível. Efetue uma nova consulta', 'DBGrid49');

    if Application.MessageBox('Tem certeza que deseja manifestar "Ciência da operação"?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    if (Trim(dataSet.FieldByName('DATA_OPNAOREAL').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 3) then
      raiseExceptionCreate('NFe com "Operação não Realizada". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_CONFIRM').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 1) then
      raiseExceptionCreate('NFe com "Confirmação da operação". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_DESCONH').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 2) then
      raiseExceptionCreate('NFe já com "Desconhecimento da operação". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_CIENCIA').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 4) then
      raiseExceptionCreate('NFe já esta com "Ciência da operação". Não é possível realizar esta operação', 'DBGrid49');

    dataSet.Edit;
    dataSet.FieldByName('CSITCONFPEDIDO').AsInteger := 4;
    dataSet.FieldByName('IDLOTE').AsInteger := Gencodigo('NOTAFISCAL_CARTA_CORRECAO', dtmNF.SpIncCodNF,vDadosIni.codEmpresa);
    dataSet.Post;

    Result := Apply;

    if Result then
      Result := CommitaTransacao;

    if Result then
      Result := EnviarEvento(pchar(vDadosIni.vBancoHW),
                             StrToInt(vDadosIni.codEmpresa),
                             dataSet.FieldByName('IDLOTE').AsInteger,
                             pchar(vDadosIni.vNomeUsuario),'4');

    dataSet.RefreshRecord;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe.confirmacaoDaOperacao: Boolean;
var
  vChave: string;
begin
  try
    Result := False;

    vChave :=  Trim(dataSet.FieldByName('CHAVE_NFE').AsString);
    dataSet.RefreshRecord;

    if Trim(vChave) <> Trim(dataSet.FieldByName('CHAVE_NFE').AsString) then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' não se encontra mais disponível. Efetue uma nova consulta', 'DBGrid49');

    if Application.MessageBox('Tem certeza que deseja manifestar "Confirmação da operação"?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    if eventoJaRegistrado(ord(mdOpConfirmada)) then
      raiseExceptionCreate('Já foi enviado esse evento antes. Não é possível enviar o mesmo evento novamente');
    {
    if (Trim(dataSet.FieldByName('DATA_OPNAOREAL').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 3) then
      raiseExceptionCreate('NFe com "Operação não Realizada". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_DESCONH').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 2) then
      raiseExceptionCreate('NFe com "Desconhecimento da operação". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_CONFIRM').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 1) then
      raiseExceptionCreate('NFe já esta com "Confirmação da operação". Não é possível realizar esta operação', 'DBGrid49');
    }
    dataSet.Edit;
    dataSet.FieldByName('CSITCONFPEDIDO').AsInteger := 1;
    dataSet.FieldByName('IDLOTE').AsInteger := Gencodigo('NOTAFISCAL_CARTA_CORRECAO', dtmNF.SpIncCodNF,vDadosIni.codEmpresa);
    dataSet.Post;

    Result := Apply;

    if Result then
      Result := CommitaTransacao;

    if Result then
      Result := EnviarEvento(pchar(vDadosIni.vBancoHW),
                             StrToInt(vDadosIni.codEmpresa),
                             dataSet.FieldByName('IDLOTE').AsInteger,
                             pchar(vDadosIni.vNomeUsuario),'4');

    dataSet.RefreshRecord;
    
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe.consulta(pEmissor, pConsuta,
  pNotas: Integer): Boolean;
var
  vEmissor, vConsulta: string;
  vTestarUS: Boolean;
  vDataHoraBanc: string;
begin
  try
    vTestarUS := True;
    if _LerConfiguracoesRegistroString('DaraHoraConsultaManifestacao', '') <> '' then
      if _LerConfiguracoesRegistroString('UsuarioConsultaManifestacao', '') = vDadosIni.vNomeUsuario then
      begin
        vDataHoraBanc := DateTimeToStr(vDadosIni.getDataHoraBanco(buscas));
        if (StrToDateTime(vDataHoraBanc) -
        StrToDateTime(_LerConfiguracoesRegistroString('DaraHoraConsultaManifestacao', vDataHoraBanc))) >
        StrToTime('00:10:00') then
        vTestarUS := False
      end;
    if vTestarUS then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select US_CONSNFDEST from empresa where cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.FieldByName('US_CONSNFDEST').AsInteger > 0 then
        raiseExceptionCreate('O usuário de código: ' + buscas.FieldByName('US_CONSNFDEST').AsString +
          ' já iniciou o processo de consulta no WebService', '');
    end;

    try
      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;

      vDataHoraBanc := DateTimeToStr(vDadosIni.getDataHoraBanco(buscas));
      _GravaConfiguracoesString('DaraHoraConsultaManifestacao', vDataHoraBanc);
      _GravaConfiguracoesString('UsuarioConsultaManifestacao', vDadosIni.vNomeUsuario);

      buscas.Close;
      buscas.SQL.Text := 'update empresa set US_CONSNFDEST = ' + IntToStr(vDadosIni.vCodUsuario) + ' where cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;


      if vDadosIni.PesqPros('NFE003', 'HABILITAR', '', 'NFDESTINADAS', '', buscas, True) then
        Result :=  NFDestinadas(pchar(vDadosIni.vBancoHW),
                     StrToInt(vDadosIni.codEmpresa),
                     pchar(vDadosIni.vNomeUsuario),
                     pchar(IntToStr(pConsuta)),
                     pchar(IntToStr(pEmissor)),
                     pNotas, 2, '0')
      else
        Result :=  NFDestinadas(pchar(vDadosIni.vBancoHW),
                     StrToInt(vDadosIni.codEmpresa),
                     pchar(vDadosIni.vNomeUsuario),
                     pchar(IntToStr(pConsuta)),
                     pchar(IntToStr(pEmissor)),
                     pNotas, 1, '0');
    finally
      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;

      buscas.Close;
      buscas.SQL.Text := 'update empresa set US_CONSNFDEST = null where cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      _GravaConfiguracoesString('DaraHoraConsultaManifestacao', '');
      _GravaConfiguracoesString('UsuarioConsultaManifestacao', '');
    end;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao tentar efetuar consulta. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TManifestacaoDestinatarioNFe.consulta. Erro: ' + e.Message);
    end;
  end;
end;

constructor TManifestacaoDestinatarioNFe.create;
begin
  dataSet := TClientDataSet(dtmNF.cdsManDest);
  transacao := TIBTransaction(dtmNF.transacaoNF);
  buscas := TIBQuery(dtmNF.qrBuscas);

  _cpfCnpj := '';
  _dtIni := '  /  /    ';
  _dtFim := '  /  /    ';
  _entSa := '';
  _numNf := 0;
  _autorizadas := False;
  _canceladas := False;
  _ciencia := False;
  _desconhecimento := False;
  _naoRealizada := False;
  _confirmacao := False;

end;

function TManifestacaoDestinatarioNFe.desconhecimentodaOperacao: Boolean;
var
  vChave: string;
begin
  try
    Result := False;

    vChave :=  Trim(dataSet.FieldByName('CHAVE_NFE').AsString);
    dataSet.RefreshRecord;

    if Trim(vChave) <> Trim(dataSet.FieldByName('CHAVE_NFE').AsString) then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' não se encontra mais disponível. Efetue uma nova consulta', 'DBGrid49');

    if Application.MessageBox('Tem certeza que deseja manifestar "Desconhecimento da operação"?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    if eventoJaRegistrado(ord(mdDesconhecimento)) then
      raiseExceptionCreate('Já foi enviado esse evento antes. Não é possível enviar o mesmo evento novamente');
    {
    if (Trim(dataSet.FieldByName('DATA_OPNAOREAL').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 3) then
      raiseExceptionCreate('NFe com "Operação não Realizada". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_CONFIRM').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 1) then
      raiseExceptionCreate('NFe com "Confirmação da operação". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_CIENCIA').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 4) then
      raiseExceptionCreate('NFe com "Ciência da operação". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_DESCONH').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 2) then
      raiseExceptionCreate('NFe já esta com "Desconhecimento da operação". Não é possível realizar esta operação', 'DBGrid49');
    }

    dataSet.Edit;
    dataSet.FieldByName('CSITCONFPEDIDO').AsInteger := 2;
    dataSet.FieldByName('IDLOTE').AsInteger := Gencodigo('NOTAFISCAL_CARTA_CORRECAO', dtmNF.SpIncCodNF,vDadosIni.codEmpresa);
    dataSet.Post;

    Result := Apply;

    if Result then
      Result := CommitaTransacao;

    if Result then
      Result := EnviarEvento(pchar(vDadosIni.vBancoHW),
                             StrToInt(vDadosIni.codEmpresa),
                             dataSet.FieldByName('IDLOTE').AsInteger,
                             pchar(vDadosIni.vNomeUsuario),'4');

    dataSet.RefreshRecord;
    
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe.download: Boolean;
var
  vChave, vXMLentradas: string;
  vTentarViaDownload: Boolean;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('NF0162', 'DOWNLOAD', 'NUM NF' + dataSet.FieldByName('NUM_NF').AsString + ' CHAVE ' + dataSet.FieldByName('CHAVE_NFE').AsString,
      'NF_DESTINADAS', '', buscas, True) then
      Exit;

    vChave :=  Trim(dataSet.FieldByName('CHAVE_NFE').AsString);
    dataSet.RefreshRecord;

    if Trim(vChave) <> Trim(dataSet.FieldByName('CHAVE_NFE').AsString) then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' não se encontra mais disponível. Efetue uma nova consulta', 'DBGrid49');

    vXML := vDadosIni.vEmp.vNfe.pathArquivos + '\NFepend\' + Trim(vChave) + '-nfe.xml';

    if FileExists(vXML) then
      raiseExceptionCreate('Arquivo XML desta NFe já se encontra na pasta de XML: ' + ExtractFilePath(vXML), 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_CIENCIA').AsString) = '') and
      (dataSet.FieldByName('CSITCONF').AsInteger <> 4) and
      (dataSet.FieldByName('CSITCONF').AsInteger <> 1) then
      raiseExceptionCreate('NFe sem "Ciência da operação" ou "Confirmação da operação". Não é possível efetuar o download', 'DBGrid49');

    vXMLentradas := vDadosIni.vEmp.vNfe.pathArquivos + '\entradas\' + Trim(vChave) + '-nfe.xml';

    if FileExists(vXMLentradas) then
      raiseExceptionCreate('Arquivo XML desta NFe já se encontra na pasta de entradas de XML: ' + ExtractFilePath(vXMLentradas) , 'DBGrid49');

    if Application.MessageBox('Tem certeza que deseja efetuar o Download do XML desta Nfe?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    vTentarViaDownload := not vDadosIni.PesqPros('NFE004', 'HABILITAR', '', 'NFDESTINADAS', '', buscas, True);
    if (not vTentarViaDownload) and (dataSet.FieldByName('NSUDFE').AsInteger = 0) then
    begin
      vTentarViaDownload := Application.MessageBox('NFe sem NSU. Deseja tentar o download alternativo?',
        'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
      if not vTentarViaDownload then
        Exit;
    end;

    if not vTentarViaDownload then
      Result :=  NFDestinadas(pchar(vDadosIni.vBancoHW),
                     StrToInt(vDadosIni.codEmpresa),
                     pchar(vDadosIni.vNomeUsuario),
                     '0',
                     '0',
                     1, 2, IntToStr(dataSet.FieldByName('NSUDFE').AsInteger))
    else
      Result := NFDownload(
                  pchar(vDadosIni.vBancoHW),
                  StrToInt(vDadosIni.codEmpresa),
                  pchar(vDadosIni.vNomeUsuario),
                  pchar(Trim(dataSet.FieldByName('CHAVE_NFE').AsString)));

    if not Result then
    begin
      vDadosIni.GravaAuditoria('NF0162', 'DOWNLOAD', 'FALHA',
        'NF_DESTINADAS', dataSet.FieldByName('NUM_NF').AsString, buscas);
      Application.MessageBox('Erro ao efetuar o download!', 'Atenção', 0 + 64);
    end
    else
    begin
      vDadosIni.GravaAuditoria('NF0162', 'DOWNLOAD', 'SUCESSO',
        'NF_DESTINADAS', dataSet.FieldByName('NUM_NF').AsString, buscas);
      Application.MessageBox('Download efetuado com sucesso!', 'Atenção', 0 + 64);
    end;

    dataSet.RefreshRecord;
    
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe.entrarComNF: Boolean;
var
  vChave, vXMLentradas: string;
begin
  try
    Result := False;

    vXML := '';

    vChave :=  Trim(dataSet.FieldByName('CHAVE_NFE').AsString);
    dataSet.RefreshRecord;

    if Trim(vChave) <> Trim(dataSet.FieldByName('CHAVE_NFE').AsString) then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' não se encontra mais disponível. Efetue uma nova consulta', 'DBGrid49');

    if Trim(dataSet.FieldByName('status').AsString) = stsAberta then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' já se encontra "Aberta" em processo de entrada no banco de dados', 'DBGrid49');

    if Trim(dataSet.FieldByName('status').AsString) = 'Fechada' then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' já se encontra "Fechada" no banco de dados', 'DBGrid49');
//    if Trim(dataSet.FieldByName('DATA_CIENCIA').AsString) = '' then
//      raiseExceptionCreate('NFe sem "Ciência da operação". Não é possível efetuar a entrada', 'DBGrid49');

    if Trim(dataSet.FieldByName('status').AsString) <> '' then
      raiseExceptionCreate('NFe já iniciou o processo de entrada. Consulte nas notas fiscais pela Chave' + sLineBreak +
        'Se não encontrar nesta tela clique com o botão direito do mouse sobre a NFe e escolha a opção "Limpar Status"', 'DBGrid49');

    vXML := vDadosIni.vEmp.vNfe.pathArquivos + '\NFepend\' + Trim(vChave) + '-nfe.xml';

    vXMLentradas := vDadosIni.vEmp.vNfe.pathArquivos + '\entradas\' + Trim(vChave) + '-nfe.xml';

    if not FileExists(Trim(vXML)) then
      if not FileExists(Trim(vXMLentradas)) then
        raiseExceptionCreate('Arquivo não encontrado no diretório das NFe:' + ExtractFilePath(vXML) + sLineBreak +
                             'ou' + sLineBreak +
                             ExtractFilePath(vXMLentradas), 'DBGrid49')
      else
        vXML := vXMLentradas;

    if Application.MessageBox('Tem certeza que deseja Entrar com esta nota fiscal?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    Result := True;

  except on E: Exception do
    begin
      vXML := '';
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe.eventoJaRegistrado(
  csitconfEvento: Integer): Boolean;
begin
  Result := SqlScalar('select first 1 1 from nf_destinadas_hist where chave_nfe = ''%s'' and cod_empresa = %d and csitconf = %d',
                      [fstr('chave_nfe'), vDadosIni.cod_empresa, csitconfEvento])
                      .AsInteger = 1;
end;

function TManifestacaoDestinatarioNFe.operacaoNaoRealizada: Boolean;
var
  vChave, xJust: string;
begin
  try
    Result := False;

    vChave :=  Trim(dataSet.FieldByName('CHAVE_NFE').AsString);
    dataSet.RefreshRecord;

    if Trim(vChave) <> Trim(dataSet.FieldByName('CHAVE_NFE').AsString) then
      raiseExceptionCreate('NFe  de chave ' + vChave + ' não se encontra mais disponível. Efetue uma nova consulta', 'DBGrid49');

    if Application.MessageBox('Tem certeza que deseja manifestar "Operação não Realizada"?',
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    if eventoJaRegistrado(ord(mdOpNaoRealizada)) then
      raiseExceptionCreate('Já foi enviado esse evento antes. Não é possível enviar o mesmo evento novamente');

    xJust := fstr('xjust');
    if not InputQuery('Justificativa Operação Não Realizada', 'Informe a justificativa da operação não realizada', xJust) then
      Exit;

    xJust := Trim(AnsiUpperCase(xJust));

    if (Length(xJust) < 15) or (Length(xJust) > 255) then
      raiseExceptionCreate('Justificativa deve ser ter entre 15 e 255 caracteres');

    {
    if (Trim(dataSet.FieldByName('DATA_CONFIRM').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 1) then
      raiseExceptionCreate('NFe com "Confirmação da operação". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_DESCONH').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 2) then
      raiseExceptionCreate('NFe com "Desconhecimento da operação". Não é possível realizar esta operação', 'DBGrid49');

    if (Trim(dataSet.FieldByName('DATA_OPNAOREAL').AsString) <> '') or
      (dataSet.FieldByName('CSITCONF').AsInteger = 3) then
      raiseExceptionCreate('NFe já esta com "Operação não Realizada". Não é possível realizar esta operação', 'DBGrid49');
    }
    dataSet.Edit;
    dataSet.FieldByName('CSITCONFPEDIDO').AsInteger := 3;
    dataSet.FieldByName('IDLOTE').AsInteger := Gencodigo('NOTAFISCAL_CARTA_CORRECAO', dtmNF.SpIncCodNF,vDadosIni.codEmpresa);
    dataSet.FieldByName('XJUST').AsString := xJust;
    dataSet.Post;

    Result := Apply;

    if Result then
      Result := CommitaTransacao;

    if Result then
      Result := EnviarEvento(pchar(vDadosIni.vBancoHW),
                             StrToInt(vDadosIni.codEmpresa),
                             dataSet.FieldByName('IDLOTE').AsInteger,
                             pchar(vDadosIni.vNomeUsuario),'4');

    dataSet.RefreshRecord;
    
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe.pesquisar: Boolean;
var
  vSqlTmp: string;
begin

  if Trim(_cpfCnpj) <> '' then
    vSqlTmp := vSqlTmp + ' and nfd.CNPJCPF LIKE ''%' + Trim(_cpfCnpj) + '%''';

  if (_dtIni <> '  /  /    ') and (_dtFim <> '  /  /    ') then
    vSqlTmp := vSqlTmp + ' and nfd.DATA_EMISSAO >= :dataIni and nfd.DATA_EMISSAO <= :dataFim';

  if (_dtIni <> '  /  /    ') and (_dtFim = '  /  /    ') then
    vSqlTmp := vSqlTmp + ' and nfd.DATA_EMISSAO >= :dataIni';

  if (_dtIni = '  /  /    ') and (_dtFim <> '  /  /    ') then
    vSqlTmp := vSqlTmp + ' and nfd.DATA_EMISSAO <= :dataFim';

  if (Trim(_entSa) = 'S') then
    vSqlTmp := vSqlTmp + ' and nfd.TPNF = ''Saída''';

  if (Trim(_entSa) = 'E') then
    vSqlTmp := vSqlTmp + ' and nfd.TPNF = ''Entrada''';

  if (_numNf > 0) then
    vSqlTmp := vSqlTmp + ' and nfd.NUM_NF = ' + IntToStr(_numNf);

  if (_autorizadas) and (_canceladas) then
    vSqlTmp := vSqlTmp + ' and ((nfd.STATUS_NFE = ' + QuotedStr(stsCancelada) + ') or (nfd.STATUS_NFE = '''') or (nfd.STATUS_NFE is null))';

  if (_canceladas) then
    vSqlTmp := vSqlTmp + ' and (nfd.STATUS_NFE = ' + QuotedStr(stsCancelada) + ')';

  if (_autorizadas) then
    vSqlTmp := vSqlTmp + ' and ((nfd.STATUS_NFE = '''') or (nfd.STATUS_NFE is null))';

  if (_ciencia) then
    vSqlTmp := vSqlTmp + ' and ((not nfd.DATA_CIENCIA is null) or (nfd.CSITCONF = 4))';

  if (_desconhecimento) then
    vSqlTmp := vSqlTmp + ' and ((not nfd.DATA_DESCONH is null) or (nfd.CSITCONF = 2))';

  if (_naoRealizada) then
    vSqlTmp := vSqlTmp + ' and ((not nfd.DATA_OPNAOREAL is null) or (nfd.CSITCONF = 3))';

  if (_confirmacao) then
    vSqlTmp := vSqlTmp + ' and ((not nfd.DATA_CONFIRM is null) or (nfd.CSITCONF = 1))';

  dataSet.Close;
  dataSet.CommandText := ' select nfd.*, nf.STATUS as STATUS_NF from NF_DESTINADAS nfd ' +
  	' left join notafiscal nf on ' +
    '   nf.num_nf = nfd.num_nf ' +
    '   and nf.serie = nfd.serie_nf ' +
    '   and nf.cod_empresa = nfd.cod_empresa ' +
    '   and nf.chave_nfe = nfd.chave_nfe ' +
    ' where nfd.COD_EMPRESA = ' + vDadosIni.codEmpresa + vSqlTmp;

  if (_dtIni <> '  /  /    ') and (_dtFim <> '  /  /    ') then
  begin
    dataSet.Params[0].AsDate := StrToDate(_dtIni);
    dataSet.Params[1].AsDate := StrToDate(_dtFim);
  end;

  if (_dtIni <> '  /  /    ') and (_dtFim = '  /  /    ') then
    dataSet.Params[0].AsDate := StrToDate(_dtIni);

  if (_dtIni = '  /  /    ') and (_dtFim <> '  /  /    ') then
    dataSet.Params[0].AsDate := StrToDate(_dtFim);

  dataSet.Open;

  _cpfCnpj := '';
  _dtIni := '  /  /    ';
  _dtFim := '  /  /    ';
  _entSa := '';
  _numNf := 0;
  _autorizadas := False;
  _canceladas := False;
  _ciencia := False;
  _desconhecimento := False;
  _naoRealizada := False;
  _confirmacao := False;

end;

function TManifestacaoDestinatarioNFe.pesquisarUltimos15Dias: Boolean;
var
  vSqlTmp: string;
begin

  _cpfCnpj := '';
  _dtIni := DateToStr(vDadosIni.getDataBanco(buscas) - 15);
  _dtFim := '  /  /    ';
  _entSa := '';
  _numNf := 0;
  _autorizadas := False;
  _canceladas := False;
  _ciencia := False;
  _desconhecimento := False;
  _naoRealizada := False;
  _confirmacao := False;

  Result := pesquisar;

end;

function TManifestacaoDestinatarioNFe._ativarDFe: Boolean;
var
  vNSUEmp, vTempAudit: string;
  vAltNSU: Boolean;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('NF0182', 'ATIVAR', '',
      'EMPRESA', '', buscas, True) then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'select ULTIMONSUNFDEST from empresa where cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    vNSUEmp := '';
    vTempAudit := '';

    if Trim(buscas.FieldByName('ULTIMONSUNFDEST').AsString) = '' then
      if not InputQuery('NSU NFe DFe', 'Por favor informe o NSU para inicio das consultas', vNSUEmp) then
        Exit;

    vAltNSU:= False;
    if Trim(buscas.FieldByName('ULTIMONSUNFDEST').AsString) = '' then
      if Trim(vNSUEmp) = '' then
      begin
        Application.MessageBox(pchar('NSU não informado! Por favor informe o NSU para prosseguir'), 'Atenção', 0 + 64);
        Exit;
      end
      else
        vAltNSU := True;

    IniciaTransacao;

    if not buscas.Transaction.InTransaction then
      buscas.Transaction.StartTransaction;


    buscas.Close;
    buscas.SQL.Text := 'update TABELA_PROCESSOS set NIVEL_PROCESSO = 1 where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and COD_PROCESSO = ''NFE003''';
    buscas.ExecSQL;
    vTempAudit := vTempAudit + 'NFE003 NIVEL 1 ';

    if Application.MessageBox(pchar('Deseja também ativar o download do XML via DF-e?'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      vTempAudit := vTempAudit + 'NFE004 NIVEL 1 ';
      buscas.Close;
      buscas.SQL.Text := 'update TABELA_PROCESSOS set NIVEL_PROCESSO = 1 where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and COD_PROCESSO = ''NFE004''';
      buscas.ExecSQL;
    end;

    if vAltNSU then
    begin
      buscas.Close;
      buscas.SQL.Text := 'update empresa set ULTIMONSUNFDEST = ' + QuotedStr(Trim(vNSUEmp)) +
        ' where cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      vTempAudit := vTempAudit + 'NOVO NSU ' + Trim(vNSUEmp);
    end;

    if buscas.Transaction.InTransaction then
    begin
      buscas.Transaction.Commit;
      Result := True;
    end;

    if Result then
      vDadosIni.GravaAuditoria('NF0182', 'ATIVAR', 'SUCESSO ' + vTempAudit, 'EMPRESA', '', buscas)
    else
      vDadosIni.GravaAuditoria('NF0182', 'ATIVAR', 'FALHA', 'EMPRESA', '', buscas);
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('NF0164', 'LIMPAR', 'FALHA', 'EMPRESA', '', buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe._atualizarSatusNF: Boolean;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('NF0165', 'LIMPAR', '',
      'NF_DESTINADAS', '', buscas, True) then
      Exit;

    if Trim(dataSet.FieldByName('chave_nfe').AsString) = '' then
      raiseExceptionCreate('Nenhuma NFe selecionada', '');

    if not buscas.Transaction.InTransaction then
      buscas.Transaction.StartTransaction;

    buscas.Close;
    buscas.SQL.Text := 'update NF_DESTINADAS set STATUS = (coalesce(' +
                       ' (select status from notafiscal where chave_nfe = ' + QuotedStr(Trim(dataSet.FieldByName('chave_nfe').AsString)) +
                       ' and cod_empresa = ' + vDadosIni.codEmpresa + '),''''))' +
                       ' where chave_nfe = ' + QuotedStr(Trim(dataSet.FieldByName('chave_nfe').AsString)) +
                       ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
    begin
      buscas.Transaction.Commit;
      Result := True;
      dataSet.RefreshRecord;
    end;

    if Result then
      vDadosIni.GravaAuditoria('NF0165', 'LIMPAR', 'SUCESSO', 'NF_DESTINADAS', '', buscas)
    else
      vDadosIni.GravaAuditoria('NF0165', 'LIMPAR', 'FALHA', 'NF_DESTINADAS', '', buscas);
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('NF0165', 'LIMPAR', 'FALHA', 'NF_DESTINADAS', '', buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe._limparNSU: Boolean;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('NF0164', 'LIMPAR', '',
      'EMPRESA', '', buscas, True) then
      Exit;

    IniciaTransacao;

    if not buscas.Transaction.InTransaction then
      buscas.Transaction.StartTransaction;

    buscas.Close;
    buscas.SQL.Text := 'update empresa set ULTIMONSUNFDEST = null where cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
    begin
      buscas.Transaction.Commit;
      Result := True;
    end;

    if Result then
      vDadosIni.GravaAuditoria('NF0164', 'LIMPAR', 'SUCESSO', 'EMPRESA', '', buscas)
    else
      vDadosIni.GravaAuditoria('NF0164', 'LIMPAR', 'FALHA', 'EMPRESA', '', buscas);
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('NF0164', 'LIMPAR', 'FALHA', 'EMPRESA', '', buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TManifestacaoDestinatarioNFe._limparStatusUsuario: Boolean;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('NF0166', 'LIMPAR', '',
      'EMPRESA', '', buscas, True) then
      Exit;

    if not buscas.Transaction.InTransaction then
      buscas.Transaction.StartTransaction;

    buscas.Close;
    buscas.SQL.Text := 'update empresa set US_CONSNFDEST = null where cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
    begin
      buscas.Transaction.Commit;
      Result := True;
    end;

    if Result then
      vDadosIni.GravaAuditoria('NF0166', 'LIMPAR', 'SUCESSO', 'EMPRESA', '', buscas)
    else
      vDadosIni.GravaAuditoria('NF0166', 'LIMPAR', 'FALHA', 'EMPRESA', '', buscas);
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('NF0166', 'LIMPAR', 'FALHA', 'EMPRESA', '', buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

end.
