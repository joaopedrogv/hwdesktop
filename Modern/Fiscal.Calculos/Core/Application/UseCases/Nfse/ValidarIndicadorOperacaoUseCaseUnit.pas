unit ValidarIndicadorOperacaoUseCaseUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/service/nfse/NfseService.java#validarIndicadorOperacao

interface

uses
  IIndicadorOperacaoRepositoryUnit,
  TipoComunsUnit,
  StringNullableUnit;

type
  /// <summary>
  ///   Entrada de validarIndicadorOperacao (espelho de
  ///   NfseValidacaoIndicadorOperacaoInput.java).
  /// </summary>
  NfseValidacaoIndicadorOperacaoInput = record
  private
    FNbs: string;
    FCClassTrib: string;
    FCIndOp: string;
    FCTribNac: string;
    FDataOcorrenciaFatoGerador: TDate;
  public
    class function Create(
      const Nbs: string;
      const CClassTrib: string;
      const CIndOp: string;
      const CTribNac: string;
      DataOcorrenciaFatoGerador: TDate
    ): NfseValidacaoIndicadorOperacaoInput; static;

    property Nbs: string read FNbs;
    property CClassTrib: string read FCClassTrib;
    property CIndOp: string read FCIndOp;
    property CTribNac: string read FCTribNac;
    property DataOcorrenciaFatoGerador: TDate read FDataOcorrenciaFatoGerador;
  end;

  /// <summary>
  ///   Saida de validarIndicadorOperacao (espelho de
  ///   NfseValidacaoIndicadorOperacaoOutput.java).
  /// </summary>
  NfseValidacaoIndicadorOperacaoOutput = record
  private
    FCIndOp: string;
    FCClassTrib: string;
    FNbs: string;
    FCTribNac: string;
    FDataOcorrenciaFatoGerador: TDate;
    FValido: Boolean;
  public
    property CIndOp: string read FCIndOp;
    property CClassTrib: string read FCClassTrib;
    property Nbs: string read FNbs;
    property CTribNac: string read FCTribNac;
    property DataOcorrenciaFatoGerador: TDate read FDataOcorrenciaFatoGerador;
    property Valido: Boolean read FValido;
  end;

  IValidarIndicadorOperacaoUseCase = interface
    ['{97F1E236-FC60-4280-97F7-DDCAB0C273AD}']
    function Executar(const Input: NfseValidacaoIndicadorOperacaoInput): NfseValidacaoIndicadorOperacaoOutput;
  end;

  ValidarIndicadorOperacaoUseCase = class(TInterfacedObject, IValidarIndicadorOperacaoUseCase)
  private
    FIndicadorOperacaoRepo: IIndicadorOperacaoRepository;

    class function FormatarCTribNac(const CTribNac: string): StringNullable; static;
  public
    constructor Create(const IndicadorOperacaoRepo: IIndicadorOperacaoRepository);

    function Executar(const Input: NfseValidacaoIndicadorOperacaoInput): NfseValidacaoIndicadorOperacaoOutput;
  end;

implementation

uses
  SysUtils;

{ NfseValidacaoIndicadorOperacaoInput }

class function NfseValidacaoIndicadorOperacaoInput.Create(
  const Nbs: string;
  const CClassTrib: string;
  const CIndOp: string;
  const CTribNac: string;
  DataOcorrenciaFatoGerador: TDate
): NfseValidacaoIndicadorOperacaoInput;
begin
  Result.FNbs := Nbs;
  Result.FCClassTrib := CClassTrib;
  Result.FCIndOp := CIndOp;
  Result.FCTribNac := CTribNac;
  Result.FDataOcorrenciaFatoGerador := DataOcorrenciaFatoGerador;
end;

{ ValidarIndicadorOperacaoUseCase }

constructor ValidarIndicadorOperacaoUseCase.Create(
  const IndicadorOperacaoRepo: IIndicadorOperacaoRepository);
begin
  FIndicadorOperacaoRepo := IndicadorOperacaoRepo;
end;

class function ValidarIndicadorOperacaoUseCase.FormatarCTribNac(
  const CTribNac: string
): StringNullable;
var
  primeiroNumero: Integer;
begin
  // Espelho do Java v0042 (formatarCTribNac): nulo/vazio -> nulo;
  // 4 digitos -> "x.yy"; 6 digitos -> "x.yy.zz"; demais comprimentos -> nulo,
  // sem lancar excecao por indice fora dos limites.
  if CTribNac = '' then
    Result := StringNullable.NullInstance()
  else if Length(CTribNac) = 4 then
  begin
    primeiroNumero := StrToInt(Copy(CTribNac, 1, 2));
    Result := StringNullable.Create(
      IntToStr(primeiroNumero) + '.' + Copy(CTribNac, 3, 2)
    );
  end
  else if Length(CTribNac) = 6 then
  begin
    primeiroNumero := StrToInt(Copy(CTribNac, 1, 2));
    Result := StringNullable.Create(
      IntToStr(primeiroNumero) + '.' + Copy(CTribNac, 3, 2) + '.' +
      Copy(CTribNac, 5, 2)
    );
  end
  else
    Result := StringNullable.NullInstance();
end;

function ValidarIndicadorOperacaoUseCase.Executar(
  const Input: NfseValidacaoIndicadorOperacaoInput
): NfseValidacaoIndicadorOperacaoOutput;
var
  cTribNacFormatado: StringNullable;
  resultado: Integer;
begin
  cTribNacFormatado := FormatarCTribNac(Input.CTribNac);

  resultado := FIndicadorOperacaoRepo.ValidarCombinacaoExiste(
    Input.Nbs,
    Input.CClassTrib,
    Input.CIndOp,
    cTribNacFormatado,
    Input.DataOcorrenciaFatoGerador
  );

  Result.FCIndOp := Input.CIndOp;
  Result.FCClassTrib := Input.CClassTrib;
  Result.FNbs := Input.Nbs;
  Result.FCTribNac := Input.CTribNac;
  Result.FDataOcorrenciaFatoGerador := Input.DataOcorrenciaFatoGerador;
  Result.FValido := resultado = 1;
end;

end.
