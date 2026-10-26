unit InicializarDpsModelUnit;

interface

uses
  NFSeTypesUnit;

type
  InicializarDpsModel = record
  private
    FDataCompetencia: TDateTime;
    FClienteId: Integer;
    FServicoId: Integer;
    FNatureza: NaturezaEmissaoNFSeEnum;
  public
    class function Create(
      DataCompetencia: TDateTime;
      Natureza: NaturezaEmissaoNFSeEnum;
      ClienteId: Integer = 0;
      ServicoId: Integer = 0
    ): InicializarDpsModel; static;

    property DataCompetencia: TDateTime read FDataCompetencia;
    property ClienteId: Integer read FClienteId;
    property ServicoId: Integer read FServicoId;
    property Natureza: NaturezaEmissaoNFSeEnum read FNatureza;
  end;

implementation

{ InicializarDpsModel }

class function InicializarDpsModel.Create(
  DataCompetencia: TDateTime;
  Natureza: NaturezaEmissaoNFSeEnum;
  ClienteId, ServicoId: Integer): InicializarDpsModel;
begin
  Result.FDataCompetencia := DataCompetencia;
  Result.FNatureza := Natureza;
  Result.FClienteId := ClienteId;
  Result.FServicoId := ServicoId;
end;

end.
