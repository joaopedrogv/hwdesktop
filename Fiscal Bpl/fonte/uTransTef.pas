unit uTransTef;

interface
uses uDataSet_OOP, IBDatabase, IBQuery;
type
  TtransTef = class(TDataSet_OOP)
  public
    constructor Create;
    destructor destroy; override;
    function Post: boolean; override;
    function apply: boolean; override;
    function getTodos: Boolean;
    //function getTodosEntrada: boolean;
    function existeTransacao(data, nsu: string): boolean;
    function getTefNaoConfirmado: Boolean;
    function getTefNaoConfirmadoCNF: Boolean;
    function alteraStatusTranstef(vStatus: string):boolean;
  end;

  TTransacoesTEF = class(TDataSet_OOP)
  public
    constructor Create;
    procedure AbreTransacoes(DataInicial, DataFinal: string);
  end;

implementation

uses udtmTef, DBClient, SysUtils, Classes, uDtmAtivo;

{ TtransfTef }

function TtransTef.alteraStatusTranstef(vStatus: string): boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'update tef_tmp set tipoconfirmacao = '+QuotedStr(vStatus);
    buscas.ExecSQL;
    CommitaTransacao;
  except
  end;
end;

function TtransTef.apply: boolean;
begin
  if inherited Apply then
    CommitaTransacao;
end;

constructor TtransTef.Create;
begin
  if dtmtef = nil then
    dtmtef := TdtmTef.Create(dtmTef);

  DataSet := TClientDataSet(dtmtef.cdstranstef);
  transacao := TIBTransaction(dtmtef.transacaoFiscal);
  buscas := TIBQuery(dtmTef.qrBuscas);
end;

destructor TtransTef.destroy;
begin
  CommitaTransacao;
  inherited;
end;

function TtransTef.existeTransacao(data, nsu: string): boolean;
begin
  Result := ExecutaComandosSql('select * from tef_tmp where datatrans = ' + QuotedStr(data) +
    ' and nsutrans = ' + QuotedStr(nsu));
end;

function TtransTef.getTefNaoConfirmado: Boolean;
begin
  Result := montaSelect('select * from tef_tmp where TefNaoConfirmado = ''1'' ');
end;

function TtransTef.getTefNaoConfirmadoCNF: Boolean;
begin
  Result := montaSelect('select * from tef_tmp where TefNaoConfirmado = ''1''' +
                        ' and TIPOCONFIRMACAO = ''CNF''');
end;

function TtransTef.getTodos: Boolean;
begin
  Result := montaSelect('select * from tef_tmp where TefNaoConfirmado = ''0''');
end;

//function TtransTef.getTodosEntrada: boolean;
//begin
//  Result := montaSelect('select * from transtef');
//end;

function TtransTef.Post: boolean;
begin
  try
    Result := inherited post;
  except
    on e: exception do
    begin
      result := false;
    end;
  end;

end;

{ TTransacoesTEF }

procedure TTransacoesTEF.AbreTransacoes(DataInicial, DataFinal: string);
begin
  montaSelect('select * from tef_tmp_transacoes' +
    ' where data_transacao >= :DataIni and data_transacao <= :DataFim' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' order by seqid',
    StrToDateDef(DataInicial, Date), StrToDateDef(DataFinal, Date));
end;

constructor TTransacoesTEF.Create;
begin
  if dtmtef = nil then
    dtmtef := TdtmTef.Create(dtmTef);

  DataSet := TClientDataSet(dtmtef.cdsTransacoes);
  transacao := TIBTransaction(dtmtef.transacaoFiscal);
  buscas := TIBQuery(dtmTef.qrBuscas);
end;

end.

