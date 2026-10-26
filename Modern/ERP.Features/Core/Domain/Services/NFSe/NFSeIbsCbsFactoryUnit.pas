unit NFSeIbsCbsFactoryUnit;

interface

uses
  RegraFiscalIbsCbsEtdUnit,
  NFSeTypesUnit,
  DFeTypesUnit,
  DpsEmitirIbsCbsNacionalModelUnit,
  TipoRegraTributoDFeEnumUnit,
  TributoDFeContextEtdUnit,
  StringNullableUnit;

type
  NFSeIbsCbsFactory = class
  public
    class function Create(
      const Id: string;
      TipoRegra: TipoRegraTributoDFeEnum;
      const Ccredpres: StringNullable;
      RegraFiscal: RegraFiscalIbsCbsEtd
    ): DpsEmitirIbsCbsNacionalModel; overload;
    class function Create(
      const Id: string;
      TributoDFe: TributoDFeContextEtd
    ): DpsEmitirIbsCbsNacionalModel; overload;
  end;

implementation

uses
  StrUtils,
  IntegerNullableUnit, TipoComunsUnit, TributoDFeIbsCbsEtdUnit, DoubleNullableUnit, TributoDFeGrupoIbsCbsEtdUnit,
  CurrencyNullableUnit;

{ ClienteToDPSParticipanteConverter }

class function NFSeIbsCbsFactory.Create(
  const Id: string;
  TipoRegra: TipoRegraTributoDFeEnum;
  const Ccredpres: StringNullable;
  RegraFiscal: RegraFiscalIbsCbsEtd
): DpsEmitirIbsCbsNacionalModel;
var
  R: RegraFiscalIbsCbsEtd;
begin
  if RegraFiscal = nil then
    R := RegraFiscalIbsCbsEtd.Create()
  else
    R := RegraFiscal;
  try
    Result := DpsEmitirIbsCbsNacionalModel.Create(
      TipoRegra,
      {RegraFiscalId} StringNullable.CreateOrNull(R.Id),
      {CST} IfThen( R.CClassTrib <> '', Copy(R.CClassTrib, 1, 3)),
      R.CClassTrib,
      CCredPres ,
      {CSTReg} StringNullable.CreateOrNull(IfThen(not R.CClassTribRegular.IsNull, Copy(R.CClassTribRegular.Value, 1, 3))),
      R.CClassTribRegular,
      R.PDifIbsUF,
      R.PDifIbsMun,
      R.PDifCbs
    );
  finally
    if RegraFiscal = nil then
      R.Free();
  end;
end;

class function NFSeIbsCbsFactory.Create(const Id: string;
  TributoDFe: TributoDFeContextEtd): DpsEmitirIbsCbsNacionalModel;
var
  R: RegraFiscalIbsCbsEtd;
  TipoRegra: TipoRegraTributoDFeEnum;
  RegraFiscalId, CCredPres, CSTReg, CClassTribRegular: StringNullable;
  PDifIbsUF, PDifIbsMun, PDifCbs: DoubleNullable;
  CST, CClassTrib: string;
begin
  if TributoDFe = nil then
  begin
    Result := nil;
    Exit;
  end;

  CST := '';
  CClassTrib := '';

  TipoRegra := tctAutomatica;
  RegraFiscalId := StringNullable.NullInstance();
  CCredPres := StringNullable.NullInstance();
  CSTReg := StringNullable.NullInstance();
  CClassTribRegular := StringNullable.NullInstance();
  PDifIbsUF := DoubleNullable.NullInstance();
  PDifIbsMun := DoubleNullable.NullInstance();
  PDifCbs := DoubleNullable.NullInstance();

  if (TributoDFe <> nil) and (TributoDFe.IbsCbs <> nil) then
  begin
    TipoRegra := TributoDFe.IbsCbs.TipoRegra;
    RegraFiscalId := TributoDFe.IbsCbs.RegraFiscalId;
    CST := TributoDFe.IbsCbs.Cst;
    CClassTrib := TributoDFe.IbsCbs.CClasstrib;

    if TributoDFe.IbsCbs.CredPresOp <> nil then
      CCredPres := StringNullable.CreateOrNull(TributoDFe.IbsCbs.CredPresOp.Ccredpres);

    if (TributoDFe.IbsCbs.GIbsCbs <> nil) then
    begin
      if (TributoDFe.IbsCbs.GIbsCbs.TribRegular <> nil) then
      begin
        CClassTribRegular := StringNullable.CreateOrNull( TributoDFe.IbsCbs.GIbsCbs.TribRegular.CClasstribreg );
        CSTReg := StringNullable.CreateOrNull( TributoDFe.IbsCbs.GIbsCbs.TribRegular.Cstreg );
      end;

      PDifIbsUF := TributoDFe.IbsCbs.GIbsCbs.IbsUfPdif;
      PDifIbsMun := TributoDFe.IbsCbs.GIbsCbs.IbsMunPdif;
      PDifCbs := TributoDFe.IbsCbs.GIbsCbs.CbsPdif;
    end;
  end; 

  Result := DpsEmitirIbsCbsNacionalModel.Create(
    TipoRegra,
    RegraFiscalId,
    CST,
    CClassTrib,
    CCredPres,
    CSTReg,
    CClassTribRegular,
    CurrencyNullable.Create(PDifIbsUF.Value, PDifIbsUF.IsNull),
    CurrencyNullable.Create(PDifIbsMun.Value, PDifIbsMun.IsNull),
    CurrencyNullable.Create(PDifCbs.Value, PDifCbs.IsNull)
  );
end;

end.
