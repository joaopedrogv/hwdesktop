unit TratamentoTributarioEtdUnit;

interface

uses
  TipoComunsUnit, DateAndTimeNullableUnit, StringNullableUnit;

type
  TratamentoTributarioEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FDescricao: string;
    FExpressaoAliquota: StringNullable;
    FExpressaoAliquotaEfetiva: StringNullable;
    FExpressaoBaseCalculo: string;
    FExpressaoTributoCalculado: string;
    FExpressaoTributoDevido: string;
    FExpressaoPercentualDiferimento: StringNullable;
    FExpressaoValorDiferimento: StringNullable;
    FInIncompativelComSuspensao: Boolean;
    FInExigeGrupoDesoneracao: Boolean;
    FInPossuiPercentualReducao: Boolean;
    FInPossuiAjuste: Boolean;
    FInPossuiRedutor: Boolean;
    FInPossuiMonofasia: Boolean;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): TratamentoTributarioEtd; static;

    class function Create(
      Id: Integer;
      const Descricao: string;
      const ExpressaoAliquota: StringNullable;
      const ExpressaoAliquotaEfetiva: StringNullable;
      const ExpressaoBaseCalculo: string;
      const ExpressaoTributoCalculado: string;
      const ExpressaoTributoDevido: string;
      const ExpressaoPercentualDiferimento: StringNullable;
      const ExpressaoValorDiferimento: StringNullable;
      InIncompativelComSuspensao: Boolean;
      InExigeGrupoDesoneracao: Boolean;
      InPossuiPercentualReducao: Boolean;
      InPossuiAjuste: Boolean;
      InPossuiRedutor: Boolean;
      InPossuiMonofasia: Boolean;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): TratamentoTributarioEtd; static;

    function Clone(): TratamentoTributarioEtd;
    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Descricao: string read FDescricao;
    property ExpressaoAliquota: StringNullable read FExpressaoAliquota;
    property ExpressaoAliquotaEfetiva: StringNullable read FExpressaoAliquotaEfetiva;
    property ExpressaoBaseCalculo: string read FExpressaoBaseCalculo;
    property ExpressaoTributoCalculado: string read FExpressaoTributoCalculado;
    property ExpressaoTributoDevido: string read FExpressaoTributoDevido;
    property ExpressaoPercentualDiferimento: StringNullable read FExpressaoPercentualDiferimento;
    property ExpressaoValorDiferimento: StringNullable read FExpressaoValorDiferimento;
    property InIncompativelComSuspensao: Boolean read FInIncompativelComSuspensao;
    property InExigeGrupoDesoneracao: Boolean read FInExigeGrupoDesoneracao;
    property InPossuiPercentualReducao: Boolean read FInPossuiPercentualReducao;
    property InPossuiAjuste: Boolean read FInPossuiAjuste;
    property InPossuiRedutor: Boolean read FInPossuiRedutor;
    property InPossuiMonofasia: Boolean read FInPossuiMonofasia;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  TratamentosTributariosEtd = array of TratamentoTributarioEtd;

implementation

{ TratamentoTributarioEtd }

function TratamentoTributarioEtd.Clone: TratamentoTributarioEtd;
begin
  Result.FInstance := FInstance;

  Result.FId := FId;
  Result.FDescricao := FDescricao;
  Result.FExpressaoAliquota := FExpressaoAliquota;
  Result.FExpressaoAliquotaEfetiva := FExpressaoAliquotaEfetiva;
  Result.FExpressaoBaseCalculo := FExpressaoBaseCalculo;
  Result.FExpressaoTributoCalculado := FExpressaoTributoCalculado;
  Result.FExpressaoTributoDevido := FExpressaoTributoDevido;
  Result.FExpressaoPercentualDiferimento := FExpressaoPercentualDiferimento;
  Result.FExpressaoValorDiferimento := FExpressaoValorDiferimento;
  Result.FInIncompativelComSuspensao := FInIncompativelComSuspensao;
  Result.FInExigeGrupoDesoneracao := FInExigeGrupoDesoneracao;
  Result.FInPossuiPercentualReducao := FInPossuiPercentualReducao;
  Result.FInPossuiAjuste := FInPossuiAjuste;
  Result.FInPossuiRedutor := FInPossuiRedutor;
  Result.FInPossuiMonofasia := FInPossuiMonofasia;
  Result.FInicioVigencia := FInicioVigencia;
  Result.FFimVigencia := FFimVigencia;
end;

class function TratamentoTributarioEtd.Create(
  Id: Integer;
  const Descricao: string;
  const ExpressaoAliquota: StringNullable;
  const ExpressaoAliquotaEfetiva: StringNullable;
  const ExpressaoBaseCalculo: string;
  const ExpressaoTributoCalculado: string;
  const ExpressaoTributoDevido: string;
  const ExpressaoPercentualDiferimento: StringNullable;
  const ExpressaoValorDiferimento: StringNullable;
  InIncompativelComSuspensao: Boolean;
  InExigeGrupoDesoneracao: Boolean;
  InPossuiPercentualReducao: Boolean;
  InPossuiAjuste: Boolean;
  InPossuiRedutor: Boolean;
  InPossuiMonofasia: Boolean;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): TratamentoTributarioEtd;
begin
  Result.FInstance := riNotNull;

  Result.FId := Id;
  Result.FDescricao := Descricao;
  Result.FExpressaoAliquota := ExpressaoAliquota;
  Result.FExpressaoAliquotaEfetiva := ExpressaoAliquotaEfetiva;
  Result.FExpressaoBaseCalculo := ExpressaoBaseCalculo;
  Result.FExpressaoTributoCalculado := ExpressaoTributoCalculado;
  Result.FExpressaoTributoDevido := ExpressaoTributoDevido;
  Result.FExpressaoPercentualDiferimento := ExpressaoPercentualDiferimento;
  Result.FExpressaoValorDiferimento := ExpressaoValorDiferimento;
  Result.FInIncompativelComSuspensao := InIncompativelComSuspensao;
  Result.FInExigeGrupoDesoneracao := InExigeGrupoDesoneracao;
  Result.FInPossuiPercentualReducao := InPossuiPercentualReducao;
  Result.FInPossuiAjuste := InPossuiAjuste;
  Result.FInPossuiRedutor := InPossuiRedutor;
  Result.FInPossuiMonofasia := InPossuiMonofasia;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

function TratamentoTributarioEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TratamentoTributarioEtd.NullInstance: TratamentoTributarioEtd;
var
  SN: StringNullable;
begin
  SN := StringNullable.NullInstance();
  Result := TratamentoTributarioEtd.Create(
    0, '', SN, SN, '', '', '', SN, SN, False, False, False, False, False, False, 0, DateNullable.NullInstance()
  );
  Result.FInstance := riNull;
end;

end.
