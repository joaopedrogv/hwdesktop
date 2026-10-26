unit TipoDfeClassificacaoEtdUnit;

interface

uses
  SysUtils,
  Contnrs,
  TipoComunsUnit,
  TipoDfeEtdUnit,
  DateAndTimeNullableUnit;

type
  TipoDfeClassificacaoEtd = class
  private
    FId: Integer;
    FClassificacaoTributariaId: Integer;
    FTipoDfeId: Integer;
    FTipoDfe: TipoDfeEtd;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    constructor CreateEtd(
      AId: Integer;
      AClassificacaoTributariaId: Integer;
      ATipoDfeId: Integer;
      AInicioVigencia: TDate;
      const AFimVigencia: DateNullable
    );

    property Id: Integer read FId;
    property ClassificacaoTributariaId: Integer read FClassificacaoTributariaId;
    property TipoDfeId: Integer read FTipoDfeId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property TipoDfe: TipoDfeEtd read FTipoDfe;
  end;

  TipoDfeClassificacaoEtdList = class(TObjectList);

implementation

{ TipoDfeClassificacaoEtd }

constructor TipoDfeClassificacaoEtd.CreateEtd(
  AId: Integer;
  AClassificacaoTributariaId: Integer;
  ATipoDfeId: Integer;
  AInicioVigencia: TDate;
  const AFimVigencia: DateNullable
);
begin
  FId := AId;
  FClassificacaoTributariaId := AClassificacaoTributariaId;
  FTipoDfeId := ATipoDfeId;
  FInicioVigencia := AInicioVigencia;
  FFimVigencia := AFimVigencia;
end;

end.
