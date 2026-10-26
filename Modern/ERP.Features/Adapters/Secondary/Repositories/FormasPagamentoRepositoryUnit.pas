unit FormasPagamentoRepositoryUnit;

interface

uses
  IFormasPagamentoRepositoryUnit, FormaPagamentoEtdUnit, QueryResultUnit, UpdateFormaPagamentoVincularNFCommandsUnit;

type
  FormasPagamentoRepository = class(IFormasPagamentoRepository)
  public
    function ListarPorNumeroVenda(NumRequisicao: Integer; const Tipo: string): FormaPagamentoEtdList; override;
    procedure VincularNotaFiscal(const Input: UpdateFormaPagamentoVincularNFCommand); override;
    procedure DesvincularNotaFiscal(const Input: UpdateFormaPagamentoDesvincularNFCommand); override;
  end;

implementation

uses
  SysUtils, ParameterValueUnit, StatusRegistroEnumUnit;

{ FormasPagamentoRepository }

procedure FormasPagamentoRepository.VincularNotaFiscal(const Input: UpdateFormaPagamentoVincularNFCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE FORMPAGAMENTO SET ' +
    'NUM_NOTA = :NUM_NOTA, SUB_SERIE = :SUB_SERIE, NDOC = :NDOC, TIP_CNT = ''C'' ' +
    'WHERE SEQFORM = :SEQFORM AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(5)
      .ByName('NUM_NOTA', Input.NumeroNF )
      .ByName('SUB_SERIE', Input.SubSerie )
      .ByName('NDOC', Input.NumDocumeto )
      .ByName('SEQFORM', Input.FormaPgtoId )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .Build()
  );
end;

procedure FormasPagamentoRepository.DesvincularNotaFiscal(const Input: UpdateFormaPagamentoDesvincularNFCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE FORMPAGAMENTO SET ' +
    'NUM_NOTA = NULL, SUB_SERIE = NULL, NDOC = :NDOC ' +
    'WHERE SEQFORM = :SEQFORM AND COD_EMPRESA = :COD_EMPRESA ',
    ParametersBuilder.Create(3)
      .ByName('NDOC', Input.NumDocumeto )
      .ByName('SEQFORM', Input.FormaPgtoId )
      .ByName('COD_EMPRESA', Input.EmpresaId )
      .Build()
  );
end;

function FormasPagamentoRepository.ListarPorNumeroVenda(
  NumRequisicao: Integer; const Tipo: string
): FormaPagamentoEtdList;
var
  Q: QueryResult;
  sNumeros: string;
begin
  Q := FConnection.CreateQuery( 'select * from ( ' +
    'select SEQFORM, COD_EMPRESA, NREQUISICAO, NDOC, TIPDOC, COD_CONTROLE, CLIENTE, COD_CLIENTE, HISTORICO, DATA_MOV, ' +
    'VALORDOC, TPDOCS, N_CONTA_PLC, DATA_VENC, PRCSS, OPERADOR, TIP_CNT, OP_CXL, ATIVO, NUM_NOTA, SUB_SERIE, ' +
    'REC_TIPVEND, REC_NUMVEND, N_PROCESSAMENTO, VALOR_CONTABIL, COD_UNIFICADA ' +
    'from FORMPAGAMENTO ' +
    'where NREQUISICAO = :NREQUISICAO and TPDOCS = :TPDOCS and COD_EMPRESA = :COD_EMPRESA ' +
    'union ' +
    'select SEQFORM, COD_EMPRESA, NREQUISICAO, NDOC, TIPDOC, COD_CONTROLE, CLIENTE, COD_CLIENTE, HISTORICO, DATA_MOV, ' +
    'VALORDOC, TPDOCS, N_CONTA_PLC, DATA_VENC, PRCSS, OPERADOR, TIP_CNT, OP_CXL, ATIVO, NUM_NOTA, SUB_SERIE, ' +
    'REC_TIPVEND, REC_NUMVEND, N_PROCESSAMENTO, VALOR_CONTABIL, COD_UNIFICADA ' +
    'from FORMPAGAMENTO ' +
    'where TPDOCS <> ''LCS'' and REC_NUMVEND = :NREQUISICAO and REC_TIPVEND = :TPDOCS and COD_EMPRESA = :COD_EMPRESA ' +
    ') order by SEQFORM'
    ,
    ParametersBuilder.Create(3)
      .ByName('NREQUISICAO', NumRequisicao)
      .ByName('TPDOCS', Tipo)
      .ByName('COD_EMPRESA', FSession.EmpresaId)
      .Build()
  );
  try
    Result := FormaPagamentoEtdList.Create();

    while not Q.Eof do
    begin
      Result.Add( FormaPagamentoEtd.Create(
        Q.FieldAsInteger('SEQFORM'),
        Q.FieldAsInteger('COD_EMPRESA'),
        Q.FieldAsIntNullable('NREQUISICAO'),
        Q.FieldAsStringNullable('NDOC'),
        Q.FieldAsStringNullable('TIPDOC'),
        Q.FieldAsIntNullable('COD_CONTROLE'),
        Q.FieldAsStringNullable('CLIENTE'),
        Q.FieldAsIntNullable('COD_CLIENTE'),
        Q.FieldAsStringNullable('HISTORICO'),
        Q.FieldAsDateTimeNullable('DATA_MOV'),
        Q.FieldAsDoubleNullable('VALORDOC'),
        Q.FieldAsStringNullable('TPDOCS'),
        Q.FieldAsDoubleNullable('N_CONTA_PLC'),
        Q.FieldAsDateTimeNullable('DATA_VENC'),
        Q.FieldAsStringNullable('PRCSS'),
        Q.FieldAsIntNullable('OPERADOR'),
        Q.FieldAsStringNullable('TIP_CNT'),
        Q.FieldAsIntNullable('OP_CXL'),
        StatusRegistroEnum(Q.FieldAsInteger('ATIVO')),
        Q.FieldAsIntNullable('NUM_NOTA'),
        Q.FieldAsIntNullable('SUB_SERIE'),
        Q.FieldAsStringNullable('REC_TIPVEND'),
        Q.FieldAsIntNullable('REC_NUMVEND'),
        Q.FieldAsIntNullable('N_PROCESSAMENTO'),
        Q.FieldAsDoubleNullable('VALOR_CONTABIL'),
        Q.FieldAsIntNullable('COD_UNIFICADA')
      ));
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

end.
