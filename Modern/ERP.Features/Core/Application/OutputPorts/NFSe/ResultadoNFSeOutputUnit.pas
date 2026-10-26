unit ResultadoNFSeOutputUnit;

interface

uses
  ValidationEntityOutputUnit, NFSeModelUnit;

type
  ResultadoNFSeOutput = class
  private
    FValidacoes: ValidationEntityOutput;
    FRetorno: NFSeModel;
  public
    constructor Create( AValidacoes: ValidationEntityOutput; ARetorno: NFSeModel); overload;
    constructor Create( ARetorno: NFSeModel ); overload;
    constructor Create( AValidacoes: ValidationEntityOutput ); overload;
    destructor Destroy; override;

    function ExtractNFSe(): NFSeModel;

    property Retorno: NFSeModel read FRetorno;
    property Validacoes: ValidationEntityOutput read FValidacoes;
  end;

implementation

{ ResultadoNFSeOutput }

constructor ResultadoNFSeOutput.Create(ARetorno: NFSeModel);
begin
  FValidacoes := ValidationEntityOutput.Create();
  FRetorno := ARetorno;
end;

constructor ResultadoNFSeOutput.Create(AValidacoes: ValidationEntityOutput);
begin
  FValidacoes := AValidacoes;
  FRetorno := nil;
end;

constructor ResultadoNFSeOutput.Create(AValidacoes: ValidationEntityOutput; ARetorno: NFSeModel);
begin
  FValidacoes := AValidacoes;
  FRetorno := ARetorno;
end;

destructor ResultadoNFSeOutput.Destroy;
begin
  FRetorno.Free();
  inherited;
end;

function ResultadoNFSeOutput.ExtractNFSe: NFSeModel;
begin
  Result := FRetorno;
  FRetorno := nil;
end;

end.
