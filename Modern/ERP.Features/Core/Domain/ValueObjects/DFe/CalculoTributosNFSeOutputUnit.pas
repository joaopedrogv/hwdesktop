unit CalculoTributosNFSeOutputUnit;

interface

uses
	SysUtils, Classes,
	TributoNFSeIssQnOutputUnit,
	TributoNFSePisCofinsOutputUnit,
	TributoNFSeRetenFederalOutputUnit,
  TributoNFSeAproximadosOutputUnit,
  TributoDFeContextEtdUnit,
  CalculoTotaisNFSeTypes,
	CurrencyNullableUnit,
  ValidacaoOutputUnit;

type
	CalculoTributosNFSeOutput = class
  private
    FTotaisNFSe: CalculoTotaisNFSeResult;
    FISSQN: TributoNFSeIssQnOutput;
    FPISCOFINS: TributoNFSePisCofinsOutput;
		FRetenFederal: TributoNFSeRetenFederalOutput;
    FTribAprox: TributoNFSeAproximadosOutput;
    FTributoDFe: TributoDFeContextEtd;
    FValidacoes: ValidacaoOutput;
	public
		constructor Create(
      const ATotaisNFSe: CalculoTotaisNFSeResult;
			AISSQN: TributoNFSeIssQnOutput;
			APISCOFINS: TributoNFSePisCofinsOutput;
			ARetenFederal: TributoNFSeRetenFederalOutput;
      ATribAprox: TributoNFSeAproximadosOutput;
      ATributoDFe: TributoDFeContextEtd;
      AValidacoes: ValidacaoOutput
		);
		destructor Destroy; override;

    property TotaisNFSe: CalculoTotaisNFSeResult read FTotaisNFSe;
		property ISSQN: TributoNFSeIssQnOutput read FISSQN;
		property PISCOFINS: TributoNFSePisCofinsOutput read FPISCOFINS;
		property RetenFederal: TributoNFSeRetenFederalOutput read FRetenFederal;
    property TribAprox: TributoNFSeAproximadosOutput read FTribAprox;
    property TributoDFe: TributoDFeContextEtd read FTributoDFe;
    property Validacoes: ValidacaoOutput read FValidacoes;
  end;

implementation

{ CalculoTributosNFSeOutput }

constructor CalculoTributosNFSeOutput.Create(
  const ATotaisNFSe: CalculoTotaisNFSeResult;
	AISSQN: TributoNFSeIssQnOutput;
	APISCOFINS: TributoNFSePisCofinsOutput;
	ARetenFederal: TributoNFSeRetenFederalOutput;
  ATribAprox: TributoNFSeAproximadosOutput;
  ATributoDFe: TributoDFeContextEtd;
  AValidacoes: ValidacaoOutput
);
begin
  FTotaisNFSe := ATotaisNFSe;
	FISSQN := AISSQN;
	FPISCOFINS := APISCOFINS;
	FRetenFederal := ARetenFederal;
  FTribAprox := ATribAprox;
  FTributoDFe := ATributoDFe;
  FValidacoes := AValidacoes;
end;

destructor CalculoTributosNFSeOutput.Destroy;
begin
	FISSQN.Free();
	FPISCOFINS.Free();
	FRetenFederal.Free();
  FTributoDFe.Free();

  inherited;
end;

end.
