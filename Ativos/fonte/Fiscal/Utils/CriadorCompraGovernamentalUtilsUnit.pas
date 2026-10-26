unit CriadorCompraGovernamentalUtilsUnit;

interface

uses
  DFeTypesUnit, CompraGovernamentalInputUnit;

type
  CriadorCompraGovernamentalUtils = class
  public
    class function CriarCompraGovernamentalInput(
      ATpEnteGov: TipoEnteGovEnum;
      ATpOperGov: TipoOperEnteGovNFeEnum
    ): CompraGovernamentalInput;
  end;

implementation

uses
  Sysutils, TipoEnteGovernamentalEnumUnit, TipoOperacaoGovernamentalEnumUnit;

{ CriadorCompraGovernamentalUtils }

class function CriadorCompraGovernamentalUtils.CriarCompraGovernamentalInput(ATpEnteGov: TipoEnteGovEnum;
  ATpOperGov: TipoOperEnteGovNFeEnum): CompraGovernamentalInput;
var
  TpEnteGov: TipoEnteGovernamental;
  TpOperGov: TipoOperacaoGovernamental;
begin
  // TipoEnteGovEnum e TipoEnteGovernamental tem os mesmos valores
  case ATpEnteGov of
    tgvNenhum          : TpEnteGov := tegUnassigned;
    tgvUniao           : TpEnteGov := tegUniao;
    tgvEstados         : TpEnteGov := tegEstado;
    tgvDistritoFederal : TpEnteGov := tegDistritoFederal;
    tgvMunicipios      : TpEnteGov := tegMunicipio;
    tgvConsorcioPublico: TpEnteGov := tegConsorcioPublico;
    tgvComiteGestorIbs : TpEnteGov := tegComiteGestorIbs;
    else
      raise Exception.Create('TipoEnteGovernamental do sistema incompativel com TipoEnteGovernamental do SERPRO');
  end;

  case ATpOperGov of
    togNenhum:
      TpOperGov := togUnassigned;
    togFornecimentoPgtoPosterior, togFornComPgtoJaRealizado:
      TpOperGov := togFornecimento;
    togRecebDoPgtoComFornJaRealizado, togRecebDoPgtoComFornPosterior:
      TpOperGov := togRecebimentoPagamento;
    else
      raise Exception.Create('TipoOperacaoGovernamental do sistema não mapeada com TipoOperacaoGovernamental do SERPRO');
  end;

  Result := CompraGovernamentalInput.Create(TpEnteGov, TpOperGov);
end;

end.
