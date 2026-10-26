unit NcmSicomexModelUnit;

interface

uses
  SysUtils, Classes, NcmEtdUnit;

type
  NcmSicomexModel = class
  private
    FCodigo: string;
    FDescricao: string;
    FData_Inicio: string;
    FData_Fim: string;
    FNumero_Ato_Ini: string;
    FNumero_Ato_Fim: string;
    FAno_Ato_Ini: string;
    FAno_Ato_Fim: string;
    FState: NcmState;
  public
    function ToNcmEtd: NcmEtd;
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property Data_Inicio: string read FData_Inicio write FData_Inicio;
    property Data_Fim: string read FData_Fim write FData_Fim;
    property Numero_Ato_Ini: string read FNumero_Ato_Ini write FNumero_Ato_Ini;
    property Numero_Ato_Fim: string read FNumero_Ato_Fim write FNumero_Ato_Fim;
    property Ano_Ato_Ini: string read FAno_Ato_Ini write FAno_Ato_Ini;
    property Ano_Ato_Fim: string read FAno_Ato_Fim write FAno_Ato_Fim;
    property State: NcmState read FState write FState;
  end;

  RootNcmSicomexModel = class
  private
    FData_Ultima_Atualizacao_NCM: string;
    FAto: string;
    FNomenclaturas: TArray<NcmSicomexModel>;
  public
    destructor Destroy; override;

    property Data_Ultima_Atualizacao_NCM: string read FData_Ultima_Atualizacao_NCM write FData_Ultima_Atualizacao_NCM;
    property Ato: string read FAto write FAto;
    property Nomenclaturas: TArray<NcmSicomexModel> read FNomenclaturas write FNomenclaturas;
  end;

implementation

{ RootNcmSicomexModel }

uses DateAndTimeNullableUnit, DateTimeServiceUnit, StringNullableUnit;

destructor RootNcmSicomexModel.Destroy;
var
  Item: NcmSicomexModel;
begin
  for Item in FNomenclaturas do
    Item.Free();

  SetLength(FNomenclaturas, 0);
  inherited;
end;


{ NcmSicomexModel }

function NcmSicomexModel.ToNcmEtd: NcmEtd;
var
  dDataFim: DateNullable;
begin
  if (FData_Fim = '') or (FData_Fim = '31/12/9999') then
    dDataFim := DateNullable.NullInstance()
  else
    dDataFim := DateNullable.CreateOrNull( DateService.FromLocalToDate( FData_Fim ) );

  Result := NcmEtd.Create(
    StringReplace(FCodigo, '.', '', [rfReplaceAll]),
    FDescricao,
    DateService.FromLocalToDate( FData_Inicio ),
    dDataFim,
    FNumero_Ato_Ini,
    StringNullable.CreateOrNull( Numero_Ato_Fim ),
    FAno_Ato_Ini,
    StringNullable.CreateOrNull( FAno_Ato_Fim ),
    FState
  );
end;

end.
