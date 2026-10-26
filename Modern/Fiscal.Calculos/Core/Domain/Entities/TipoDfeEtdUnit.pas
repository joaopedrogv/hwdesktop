unit TipoDfeEtdUnit;

interface

uses
  SysUtils,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit;

type
  TipoDfeEtd = record
  private
    //FInstance: RecordInstance;
    FId: Integer;
    FTipo: IntegerNullable;
    FSigla: string;
    FDescricao: string;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    //class function NullInstance(): TipoDfeEtd; static;

    class function CreateEtd(
      AId: Integer;
      const ATipo: IntegerNullable;
      const ASigla: string;
      const ADescricao: string;
      AInicioVigencia: TDate;
      const AFimVigencia: DateNullable
    ): TipoDfeEtd; static;

    property Id: Integer read FId;
    property Tipo: IntegerNullable read FTipo;
    property Sigla: string read FSigla;
    property Descricao: string read FDescricao;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  TiposDfeEtd = array of TipoDfeEtd;

implementation

{ TipoDfeEtd }

class function TipoDfeEtd.CreateEtd(
  AId: Integer;
  const ATipo: IntegerNullable;
  const ASigla: string;
  const ADescricao: string;
  AInicioVigencia: TDate;
  const AFimVigencia: DateNullable
): TipoDfeEtd;
begin
  //FInstance := riNotNull;
  Result.FId := AId;
  Result.FTipo := ATipo;
  Result.FSigla := ASigla;
  Result.FDescricao := ADescricao;
  Result.FInicioVigencia := AInicioVigencia;
  Result.FFimVigencia := AFimVigencia;
end;

end.
