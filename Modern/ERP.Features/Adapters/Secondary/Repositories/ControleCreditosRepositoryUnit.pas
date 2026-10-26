unit ControleCreditosRepositoryUnit;

interface

uses
  IControleCreditosRepositoryUnit, ControleCreditoEtdUnit, UpdateControleCreditoNumDocumentoCommandUnit;

type
  ControleCreditosRepository = class(IControleCreditosRepository)
  private
    function GetCampoEmpresa(): string;
  public
    function GetByKey(ControleCreditoId: Integer): ControleCreditoEtd; override;
    procedure AtualizarNumeroDocumento(const Input: UpdateControleCreditoNumDocumentoCommand); override;
  end;

implementation

uses
  SysUtils, ParameterValueUnit, StatusRegistroEnumUnit, QueryResultUnit;

{ ControleCreditosRepository }

procedure ControleCreditosRepository.AtualizarNumeroDocumento(const Input: UpdateControleCreditoNumDocumentoCommand);
begin
  FConnection.ExecuteCommand(
    'UPDATE CONTROLE_CREDITOS SET ' +
    'N_DOC_C = :N_DOC_C ' +
    'WHERE COD_CRED = :COD_CRED AND CODIGO_EMP = :CODIGO_EMP ',
    ParametersBuilder.Create(5)
      .ByName('N_DOC_C', Input.NumDocumeto )
      .ByName('COD_CRED', Input.ControleCreditoId )
      .ByName('CODIGO_EMP', Input.EmpresaId )
      .Build()
  );
end;

function ControleCreditosRepository.GetByKey(ControleCreditoId: Integer): ControleCreditoEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    Format(
      'select COD_CRED, CODIGO_EMP, N_CONTA_PLC, CODIGO_CTRL, COD_CLIENTE, NOME_C, DATA_REC_C, TIPO_DOC_C, ' +
      'HISTORICO_C, DATA_VENC_C, VALOR_C, STATUS_C, DATQ_C, TP_DOC_V, N_DOC_V, N_DOC_C, TIP_CNT ' +
      'from CONTROLE_CREDITOS ' +
      'where COD_CRED = :COD_CRED and %s = :COD_EMPRESA ',
      [ GetCampoEmpresa() ]
    ),
    ParametersBuilder.Create(3)
      .ByName('COD_CRED', ControleCreditoId)
      .ByName('COD_EMPRESA', FSession.EmpresaId)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := ControleCreditoEtd.Create(
        Q.FieldAsInteger('COD_CRED'),
        Q.FieldAsInteger('CODIGO_EMP'),
        Q.FieldAsDouble('N_CONTA_PLC'),
        Q.FieldAsInteger('CODIGO_CTRL'),
        Q.FieldAsIntNullable('COD_CLIENTE'),
        Q.FieldAsStringNullable('NOME_C'),
        Q.FieldAsDateTimeNullable('DATA_REC_C'),
        Q.FieldAsStringNullable('TIPO_DOC_C'),
        Q.FieldAsStringNullable('HISTORICO_C'),
        Q.FieldAsDateTimeNullable('DATA_VENC_C'),
        Q.FieldAsDoubleNullable('VALOR_C'),
        Q.FieldAsStringNullable('STATUS_C'),
        Q.FieldAsDateTimeNullable('DATQ_C'),
        Q.FieldAsStringNullable('TP_DOC_V'),
        Q.FieldAsIntNullable('N_DOC_V'),
        Q.FieldAsStringNullable('N_DOC_C'),
        Q.FieldAsStringNullable('TIP_CNT')
      );
  finally
    Q.Free();
  end;
end;

function ControleCreditosRepository.GetCampoEmpresa: string;
begin
  if FSession.CaixaUnificado then
    Result := 'COD_EMP_MULT'
  else
    Result := 'CODIGO_EMP';
end;

end.
