unit IInicializarDpsServiceUnit;

interface       

uses
  NFSeModelUnit, NFSeTypesUnit;

type
  InicializarDpsCommand = record
  private
    FEmpresaId: Integer;
    FDataCompetencia: TDateTime;
    FClienteId: Integer;
    FServicoId: Integer;
    FNatureza: NaturezaEmissaoNFSeEnum;
  public
    class function Create(
      EmpresaId: Integer;
      DataCompetencia: TDateTime;
      Natureza: NaturezaEmissaoNFSeEnum;
      ClienteId: Integer = 0;
      ServicoId: Integer = 0
    ): InicializarDpsCommand; static;

    property EmpresaId: Integer read FEmpresaId;
    property DataCompetencia: TDateTime read FDataCompetencia;
    property ClienteId: Integer read FClienteId;
    property ServicoId: Integer read FServicoId;
    property Natureza: NaturezaEmissaoNFSeEnum read FNatureza;
  end;

  IInicializarDpsService = interface
    ['{021199AD-E236-4BCF-8E52-EC095728EEB5}']
    function Executar(const Input: InicializarDpsCommand): NFSeModel;
  end;

implementation

{ InicializarDpsCommand }

class function InicializarDpsCommand.Create(
   EmpresaId: Integer;
   DataCompetencia: TDateTime;
   Natureza: NaturezaEmissaoNFSeEnum;
  ClienteId, ServicoId: Integer): InicializarDpsCommand;
begin
  Result.FEmpresaId := EmpresaId;
  Result.FDataCompetencia := DataCompetencia;
  Result.FNatureza := Natureza;
  Result.FClienteId := ClienteId;
  Result.FServicoId := ServicoId;
end;

end.
