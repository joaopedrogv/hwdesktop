unit TipoServicoEtdUnit;

interface

uses
	Classes,
	SysUtils,
	Contnrs,
	EntityBaseUnit,
	CurrencyNullableUnit,
	StringNullableUnit,
	IntegerNullableUnit,
	StatusRegistroEnumUnit,
	NFSeTypesUnit;

type

  TipoServicoEtd = class(EntityBase)
  private
    FCodServico: Integer;
    FDescricao: string;
    FAliqISS: CurrencyNullable;
    FCNAE: StringNullable;
    FCodLC116: StringNullable;
    FCTribNac: StringNullable;
    FCTribMun: StringNullable;
    FCNBS: StringNullable;
    FCIndOp: StringNullable;
    FGrupoFiscalIbsCbsId: StringNullable;
		FIsentoISS: StringNullable;
		FNaoIncidenciaISS: StringNullable;
		FIssRetido: IntegerNullable;
		FCSTPisCofins: StringNullable;
    FCSTPisCofinsEntrada: StringNullable;
		FAliqRetIR: CurrencyNullable;
		FVrTetoIR: CurrencyNullable;
		FAliqRetPIS: CurrencyNullable;
		FAliqRetCOFINS: CurrencyNullable;
		FAliqRetCSLL: CurrencyNullable;
		FVrTetoRetContribuicao: CurrencyNullable;
		FAtivo: StatusRegistroEnum;
    FAliqRetCP: CurrencyNullable;
		function GetTemRentecaoISS: Boolean;
		function GetTributacao: TributacaoISSQNEnum;
	public
		constructor Create(
			ACodServico: Integer;
			const ADescricao: string;
			const AAliqISS: CurrencyNullable;
			const ACNAE: StringNullable;
			const ACodLC116: StringNullable;
			const ACTribNac: StringNullable;
			const ACTribMun: StringNullable;
			const ACNBS: StringNullable;
      const ACIndOp: StringNullable;
			const AIsentoISS: StringNullable;
			const ANaoIncidenciaISS: StringNullable;
			const AIssRetido: IntegerNullable;
			const ACSTPisCofins: StringNullable;
      const ACSTPisCofinsEntrada: StringNullable;
			const AAliqRetIR: CurrencyNullable;
			const AVrTetoIR: CurrencyNullable;
			const AAliqRetPIS: CurrencyNullable;
			const AAliqRetCOFINS: CurrencyNullable;
			const AAliqRetCSLL: CurrencyNullable;
			const AVrTetoRetContribuicao: CurrencyNullable;
      const AAliqRetCP: CurrencyNullable;
			const AGrupoFiscalIbsCbsId: StringNullable;
      AAtivo: StatusRegistroEnum
    );
    function Clone(): EntityBase; override;
    function IsEqualTo(const Other: TipoServicoEtd): Boolean;

    property CodServico: Integer read FCodServico;
		property Descricao: string read FDescricao;
		property AliqISS: CurrencyNullable read FAliqISS;
		property CNAE: StringNullable read FCNAE;
		property CodLC116: StringNullable read FCodLC116;
		property CTribNac: StringNullable read FCTribNac;
		property CTribMun: StringNullable read FCTribMun;
		property CNBS: StringNullable read FCNBS;
    property CIndOp: StringNullable read FCIndOp;
		property CSTPisCofins: StringNullable read FCSTPisCofins;
		property CSTPisCofinsEntrada: StringNullable read FCSTPisCofinsEntrada;
		property AliqRetIR: CurrencyNullable read FAliqRetIR;
		property VrTetoIR: CurrencyNullable read FVrTetoIR;
		property AliqRetPIS: CurrencyNullable read FAliqRetPIS;
		property AliqRetCOFINS: CurrencyNullable read FAliqRetCOFINS;
		property AliqRetCSLL: CurrencyNullable read FAliqRetCSLL;
		property VrTetoRetContribuicao: CurrencyNullable read FVrTetoRetContribuicao;
		property AliqRetCP: CurrencyNullable read FAliqRetCP;
		property Tributacao: TributacaoISSQNEnum read GetTributacao;
		property TemRentecaoISS: Boolean read GetTemRentecaoISS;
		property GrupoFiscalIbsCbsId: StringNullable read FGrupoFiscalIbsCbsId write FGrupoFiscalIbsCbsId;
  end;

  TipoServicoEtdList = class(TObjectList);

implementation

{ TipoServicoEtd }

function TipoServicoEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := TipoServicoEtd.Create(
      FCodServico,
      FDescricao,
      FAliqISS,
      FCNAE,
      FCodLC116,
      FCTribNac,
      FCTribMun,
			FCNBS,
      FCIndOp,
			FIsentoISS,
			FNaoIncidenciaISS,
      FIssRetido,
			FCSTPisCofins,
      FCSTPisCofinsEntrada,
			FAliqRetIR,
			FVrTetoIR,
			FAliqRetPIS,
			FAliqRetCOFINS,
			FAliqRetCSLL,
      FVrTetoRetContribuicao,
      FAliqRetCP,
      FGrupoFiscalIbsCbsId,
      FAtivo
    );
end;

constructor TipoServicoEtd.Create(
  ACodServico: Integer;
  const ADescricao: string;
  const AAliqISS: CurrencyNullable;
  const ACNAE: StringNullable;
  const ACodLC116: StringNullable;
  const ACTribNac: StringNullable;
  const ACTribMun: StringNullable;
	const ACNBS: StringNullable;
  const ACIndOp: StringNullable;
	const AIsentoISS: StringNullable;
	const ANaoIncidenciaISS: StringNullable;
	const AIssRetido: IntegerNullable;
	const ACSTPisCofins: StringNullable;
  const ACSTPisCofinsEntrada: StringNullable;
	const AAliqRetIR: CurrencyNullable;
	const AVrTetoIR: CurrencyNullable;
	const AAliqRetPIS: CurrencyNullable;
	const AAliqRetCOFINS: CurrencyNullable;
	const AAliqRetCSLL: CurrencyNullable;
	const AVrTetoRetContribuicao: CurrencyNullable;
  const AAliqRetCP: CurrencyNullable;
	const AGrupoFiscalIbsCbsId: StringNullable;
	AAtivo: StatusRegistroEnum
);
begin
	FCodServico := ACodServico;
	FDescricao := ADescricao;
	FAliqISS := AAliqISS;
	FCNAE := ACNAE;
	FCodLC116 := ACodLC116;
	FCTribNac := ACTribNac;
	FCTribMun := ACTribMun;
	FCNBS := ACNBS;
  FCIndOp := ACIndOp;
	FIsentoISS := AIsentoISS;
	FNaoIncidenciaISS := ANaoIncidenciaISS;
  FIssRetido := AIssRetido;
	FCSTPisCofins := ACSTPisCofins;
  FCSTPisCofinsEntrada := ACSTPisCofinsEntrada;
	FAliqRetIR := AAliqRetIR;
	FVrTetoIR := AVrTetoIR;
	FAliqRetPIS := AAliqRetPIS;
	FAliqRetCOFINS := AAliqRetCOFINS;
	FAliqRetCSLL := AAliqRetCSLL;
  FAliqRetCP := AAliqRetCP;
	FVrTetoRetContribuicao := AVrTetoRetContribuicao;
	FGrupoFiscalIbsCbsId := AGrupoFiscalIbsCbsId;
  FAtivo := AAtivo;
end;

function TipoServicoEtd.GetTemRentecaoISS: Boolean;
begin
	Result := not FIssRetido.IsNull and (FIssRetido.Value = 1);
end;

function TipoServicoEtd.GetTributacao: TributacaoISSQNEnum;
begin
	if FAliqISS.Value > 0 then
		Result := tiOperacaoTributavel

	else if FIsentoISS.Value = 'S' then
		Result := tiImunidade

	else if FNaoIncidenciaISS.Value = 'S' then
		Result := tiNaoIncidencia

	else
//	if FAliqISS.Value > 0 then
		Result := tiOperacaoTributavel;

//	else if FIsentoISS.Value = 'S' then
//		Result := tiImunidade
//
//	else if FNaoIncidenciaISS.Value = 'S' then
//		Result := tiNaoIncidencia
//
//	else
//		Result := tiExportacao;
end;

function TipoServicoEtd.IsEqualTo(const Other: TipoServicoEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.CodServico = Other.CodServico)
      and (Self.Descricao = Other.Descricao)
      and Self.AliqISS.IsEqualTo(Other.AliqISS)
      and Self.CNAE.IsEqualTo(Other.CNAE)
      and Self.CodLC116.IsEqualTo(Other.CodLC116)
      and Self.CTribNac.IsEqualTo(Other.CTribNac)
      and Self.CTribMun.IsEqualTo(Other.CTribMun)
      and Self.CNBS.IsEqualTo(Other.CNBS)
      and Self.CIndOp.IsEqualTo(Other.CIndOp)
      and Self.CSTPisCofins.IsEqualTo(Other.CSTPisCofins)
      and Self.CSTPisCofinsEntrada.IsEqualTo(Other.CSTPisCofinsEntrada)
      and Self.AliqRetIR.IsEqualTo(Other.AliqRetIR)
      and Self.VrTetoIR.IsEqualTo(Other.VrTetoIR)
      and Self.AliqRetPIS.IsEqualTo(Other.AliqRetPIS)
      and Self.AliqRetCOFINS.IsEqualTo(Other.AliqRetCOFINS)
      and Self.AliqRetCSLL.IsEqualTo(Other.AliqRetCSLL)
      and Self.VrTetoRetContribuicao.IsEqualTo(Other.VrTetoRetContribuicao)
      and Self.AliqRetCP.IsEqualTo(Other.AliqRetCP)
      and (Self.Tributacao = Other.Tributacao)
      and (Self.TemRentecaoISS = Other.TemRentecaoISS)
      and Self.GrupoFiscalIbsCbsId.IsEqualTo(Other.GrupoFiscalIbsCbsId);
end;

end.
