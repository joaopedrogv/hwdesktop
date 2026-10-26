unit TributacaoCompraGovernamentalModelUnit;

interface

uses
  TipoComunsUnit,
  TipoEnteGovernamentalEnumUnit,
  CurrencyNullableUnit;

type
  /// <summary>
  ///   Detalha a composicao do IBS e da CBS em compras governamentais, incluindo
  ///   aliquotas, valores por ente e regras de calculo dos valores efetivos.
  ///   Equivale a TributacaoCompraGovernamentalDomain.java.
  /// </summary>
  TributacaoCompraGovernamentalModel = record
  private
    FInstance: RecordInstance;
    FPAliqIBSUF: Currency;
    FVTribIBSUF: Currency;
    FPAliqIBSMun: Currency;
    FVTribIBSMun: Currency;
    FPAliqCBS: Currency;
    FVTribCBS: Currency;
  public
    class function NullInstance(): TributacaoCompraGovernamentalModel; static;

    class function Create(
      PAliqIBSUF: Currency;
      VTribIBSUF: Currency;
      PAliqIBSMun: Currency;
      VTribIBSMun: Currency;
      PAliqCBS: Currency;
      VTribCBS: Currency
    ): TributacaoCompraGovernamentalModel; static;

    function IsNull(): Boolean;

    /// <summary>Zera todos os valores do grupo (espelho de zerarValores).</summary>
    procedure ZerarValores();

    procedure NormalizarSaida();

    /// <summary>
    ///   Calcula o valor que efetivamente cada ente federativo recebera em compra
    ///   governamental. Antes de 2027 retorna a propria instancia (sem rateio);
    ///   a partir de 2027 aplica o rateio conforme o ente. Espelho de getValoresEfetivos.
    /// </summary>
    function GetValoresEfetivos(
      TpEnteGov: TipoEnteGovernamental;
      PTransferenciaCBS: CurrencyNullable;
      DataFatoGerador: TDate
    ): TributacaoCompraGovernamentalModel;

    property PAliqIBSUF: Currency read FPAliqIBSUF;
    property VTribIBSUF: Currency read FVTribIBSUF;
    property PAliqIBSMun: Currency read FPAliqIBSMun;
    property VTribIBSMun: Currency read FVTribIBSMun;
    property PAliqCBS: Currency read FPAliqCBS;
    property VTribCBS: Currency read FVTribCBS;
  end;

implementation

uses
  SysUtils,
  ArredondamentoUtilsUnit, NumberServiceUnit;

{ TributacaoCompraGovernamentalModel }

class function TributacaoCompraGovernamentalModel.Create(
  PAliqIBSUF: Currency;
  VTribIBSUF: Currency;
  PAliqIBSMun: Currency;
  VTribIBSMun: Currency;
  PAliqCBS: Currency;
  VTribCBS: Currency
): TributacaoCompraGovernamentalModel;
begin
  Result.FInstance := riNotNull;
  Result.FPAliqIBSUF := PAliqIBSUF;
  Result.FVTribIBSUF := VTribIBSUF;
  Result.FPAliqIBSMun := PAliqIBSMun;
  Result.FVTribIBSMun := VTribIBSMun;
  Result.FPAliqCBS := PAliqCBS;
  Result.FVTribCBS := VTribCBS;
end;

function TributacaoCompraGovernamentalModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

procedure TributacaoCompraGovernamentalModel.NormalizarSaida;
begin
  FPAliqIBSUF := NumberService.RoundHalfUpTo4(FPAliqIBSUF);
  FVTribIBSUF := NumberService.RoundHalfUpTo2(FVTribIBSUF);
  FPAliqIBSMun := NumberService.RoundHalfUpTo4(FPAliqIBSMun);
  FVTribIBSMun := NumberService.RoundHalfUpTo2(FVTribIBSMun);
  FPAliqCBS := NumberService.RoundHalfUpTo4(FPAliqCBS);
  FVTribCBS := NumberService.RoundHalfUpTo2(FVTribCBS);
end;

class function TributacaoCompraGovernamentalModel.NullInstance: TributacaoCompraGovernamentalModel;
begin
  Result := TributacaoCompraGovernamentalModel.Create( 0, 0, 0, 0, 0, 0 );
  Result.FInstance := riNull;
end;

procedure TributacaoCompraGovernamentalModel.ZerarValores;
begin
  FPAliqIBSUF := 0;
  FVTribIBSUF := 0;
  FPAliqIBSMun := 0;
  FVTribIBSMun := 0;
  FPAliqCBS := 0;
  FVTribCBS := 0;
end;

function TributacaoCompraGovernamentalModel.GetValoresEfetivos(
  TpEnteGov: TipoEnteGovernamental;
  PTransferenciaCBS: CurrencyNullable;
  DataFatoGerador: TDate
): TributacaoCompraGovernamentalModel;
var
  pTransferenciaCBSEmDecimal: Double;
  pAliqCBSTransferir: Double;
  vTribCBSTransferir: Double;
  pAliqCBSFinal: Double;
  vTribCBSFinal: Double;
  pcAliquotaFinal: Double;
  valorFinal: Double;
begin
  if TpEnteGov = tegUnassigned then
  begin
    Result := TributacaoCompraGovernamentalModel.NullInstance();
    Exit;
  end;

  if DataFatoGerador <= 0 then
    raise Exception.Create('Data do fato gerador obrigatória');

  if PTransferenciaCBS.IsNull then
    raise Exception.Create('Percentual de transferência da CBS obrigatória');

  if DataFatoGerador < EncodeDate(2027, 1, 1) then
  begin
    // antes de 2027, cada um fica com os seus proprios valores
    Result := Self;
    Exit;
  end;

  if TipoEnteGovernamentalIsUniao(TpEnteGov) then
  begin
    // se uniao compra, fica com tudo - estados e municipios ficam com zero
    Result := TributacaoCompraGovernamentalModel.Create(
      0, 0, 0, 0,
      FPAliqCBS + FPAliqIBSUF + FPAliqIBSMun,
      FVTribCBS + FVTribIBSUF + FVTribIBSMun
    );
  end
  else
  begin
    pTransferenciaCBSEmDecimal := ArredondamentoUtils.DividirPorCem( PTransferenciaCBS.Value ); // dividido por 100
    pAliqCBSTransferir := FPAliqCBS * pTransferenciaCBSEmDecimal; // percentual CBS a transferir
    vTribCBSTransferir := FVTribCBS * pTransferenciaCBSEmDecimal; // valor CBS a transferir

    pAliqCBSFinal := FPAliqCBS - pAliqCBSTransferir;
    vTribCBSFinal := FVTribCBS - vTribCBSTransferir;

    pcAliquotaFinal := pAliqCBSTransferir + FPAliqIBSUF + FPAliqIBSMun;
    valorFinal := vTribCBSTransferir + FVTribIBSUF + FVTribIBSMun;

    if TipoEnteGovernamentalIsEstado(TpEnteGov) then
    begin
      // Estado (inclui o Distrito Federal) compra: fica com o valor do municipio e
      // (possivelmente) parte da CBS; IBS Municipal fica zero.
      Result := TributacaoCompraGovernamentalModel.Create(
        pcAliquotaFinal,
        valorFinal,
        0, 0,
        pAliqCBSFinal,
        vTribCBSFinal
      );
    end
    else if TipoEnteGovernamentalIsMunicipio(TpEnteGov) then
    begin
      // Municipio (inclui Consorcio Publico e Comite Gestor do IBS) compra: fica com
      // o valor da UF e (possivelmente) parte da CBS; IBS UF fica zero.
      Result := TributacaoCompraGovernamentalModel.Create(
        0, 0,
        pcAliquotaFinal,
        valorFinal,
        pAliqCBSFinal,
        vTribCBSFinal
      );
    end;
  end;
end;

end.
