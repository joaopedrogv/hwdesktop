unit AliquotaResultadoModelUnit;

interface

uses
  SysUtils, Classes, CurrencyNullableUnit, StringNullableUnit, EntityBaseUnit;

type
  AliquotaResultadoModel = class(EntityBase)
  private
    FValorReferencia: CurrencyNullable;
    FValorPadrao: CurrencyNullable;
    FFormaAplicacao: StringNullable;
    function GetValorAplicavel: Currency;
  public
    constructor Create(const AValorReferencia, AValorPadrao: CurrencyNullable; AFormaAplicacao: StringNullable);

    function Clone(): EntityBase; override;

    property ValorReferencia: CurrencyNullable read FValorReferencia;
    property ValorPadrao: CurrencyNullable read FValorPadrao;
    property FormaAplicacao: StringNullable read FFormaAplicacao;
    property ValorAplicavel: Currency read GetValorAplicavel;
  end;

implementation

{ AliquotaResultadoModel }

function AliquotaResultadoModel.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := AliquotaResultadoModel.Create(
      FValorReferencia, FValorPadrao, FFormaAplicacao
    );
end;

constructor AliquotaResultadoModel.Create(const AValorReferencia, AValorPadrao: CurrencyNullable;
  AFormaAplicacao: StringNullable);
begin
  FValorReferencia := AValorReferencia;
  FValorPadrao := AValorPadrao;
  FFormaAplicacao := AFormaAplicacao;

  if FValorReferencia.IsNull then
    raise Exception.Create('Alíquota de referência não encontrada');

  if FValorReferencia.Value < 0 then
    raise Exception.Create('Alíquota de referência não pode ter valor negativo');

  if ValorPadrao.HasValue then
  begin
    if FValorPadrao.Value < 0 then
      raise Exception.Create('Alíquota padrão não pode ter valor negativo');

    if FFormaAplicacao.IsNull then
      raise Exception.Create('Forma de aplicação da alíquota própria não definida');

    if FFormaAplicacao.Value = 'ACRESCIMO' then
      FValorPadrao.AddValue( ValorReferencia.Value )

    else if FFormaAplicacao.Value = 'DECRESCIMO' then
      FValorPadrao.SetValue( ValorReferencia.Value - ValorPadrao.Value )

    else if FFormaAplicacao.Value = 'SUBSTITUICAO' then
    // valorPadrao permanece o mesmo
    else
      raise Exception.Create('Forma de aplicação da alíquota própria não tratada');

    if FValorPadrao.Value < 0 then
      raise Exception.Create('Alíquota aplicável resultante não pode ter valor negativo');
  end
  else
  begin
    // se aliquota padrao não está definida, formaAplicacao também não deve estar
    if FormaAplicacao.HasValue then
      raise Exception.Create('Alíquota padrão não encontrada');
  end;
end;

function AliquotaResultadoModel.GetValorAplicavel: Currency;
begin
  if FValorPadrao.HasValue then
    Result := FValorPadrao.Value
  else
    Result := FValorReferencia.Value;
end;

end.
