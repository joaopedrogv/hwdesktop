unit TradutorErrosRtcUnit;

interface

uses
  ITradutorErrosRtcUnit, ValidacaoItemOutputUnit, TipoComunsUnit;

type
  TradutorErrosRtc = class(TInterfacedObject, ITradutorErrosRTC)
  public
    function Traduzir(Codigo: Integer; const Detalhe: string): string; overload;
    function Traduzir(const Validacao: ValidacaoItemOutput): string; overload;
    function Traduzir(const Validacoes: ValidacaoItensOutput): TArrayString; overload;
  end;

implementation

uses
  SysUtils,
  CodigosErroValidacao;

{ TradutorErrosRtc }

function TradutorErrosRtc.Traduzir(Codigo: Integer; const Detalhe: string): string;
begin
  case Codigo of
    ECOD_UF_INVALIDA                      : Result := 'UF inválida';
    ECOD_MUNICIPIO_COD_INVALIDO           : Result := 'Código do município inválido';
    ECOD_MUNICIPIO_NAO_EXISTE             : Result := 'Muncipio não existe';
    ECOD_MUNICIPIO_NAO_PERTENCE_UF        : Result := 'Muncipio não UF informada';
    ECOD_SITUACAO_TRI_NAO_EXISTE          : Result := 'Situação tributária não existe';
    ECOD_TRIB_REGULAR_NAO_IFNFO_EM_DESON  : Result := 'Tributação regular não informada para Desoneração';
    ECOD_CLASSTRIB_NAO_ENCONTRADA         : Result := 'Classificação tributária não encontrada';
    ECOD_CLASSTRIB_NAO_SE_APLICA          : Result := 'Classificação tributária não se aplica';
    ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST  : Result := 'Classificação tributária não vinculada com CST informado';
    ECOD_CLASSTRIB_INCOMPATIVEL_SUSPENSAO : Result := 'Classificação tributária incompativel com suspensão';
    ECOD_CLASSTRIB_INCORRETA              : Result := 'Classificação tributária incorreta';
    ECOD_NCM_E_NBS_SIMULTANEOS            : Result := 'Informado NCM e NBS simultaneos';
    ECOD_NCM_NAO_ENCONTRADO               : Result := 'NCM não encontrado';
    ECOD_NCM_COMPLETO_NECESSARIO          : Result := 'NCM completo é necessário';
    ECOD_NCM_NAO_VINC_CLASSIFICACAO       : Result := 'NCM não vinculado a Classificação tributária';
    ECOD_NBS_NAO_ENCONTRADO               : Result := 'NBS não encontrado';
    ECOD_NBS_COMPLETO_NECESSARIO          : Result := 'NBS completo é necessário';
    ECOD_NBS_NAO_VINC_CLASSIFICACAO       : Result := 'NBS não vinculado a Classificação tributária';
    ECOD_IMPOSTO_IS_NAO_INFORMADO         : Result := 'Imposto Seletivo não informado';
    ECOD_TRAT_TRIB_NAO_ENCONTRADO         : Result := 'Tratamento tributário não encontrado';
    else
      Result := 'Erro fiscal não identificado: ' + IntToStr(Codigo);
  end;

  Result := '[RTC] ' + Result;
  if Trim(Detalhe) <> '' then
    Result := Result + ' [' + Detalhe + ']';
end;

function TradutorErrosRtc.Traduzir(const Validacao: ValidacaoItemOutput): string;
begin
  Result := Self.Traduzir( Validacao.Codigo, Validacao.Detalhe );
end;

function TradutorErrosRtc.Traduzir(const Validacoes: ValidacaoItensOutput): TArrayString;
var
  I: Integer;
begin
  SetLength(Result, Length(Validacoes));
  for I := Low(Validacoes) to High(Validacoes) do
    Result[I] := Self.Traduzir(Validacoes[I]);
end;

end.
