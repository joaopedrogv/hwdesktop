unit StubConfiguracaoNFSeServiceUnit;

interface

uses
  IConfiguracaoNFSeServiceUnit,
  ConfiguracaoNFSeModelUnit;

type
  TStubConfiguracaoNFSeService = class(TInterfacedObject, IConfiguracaoNFSeService)
  private
    FConfiguracao: ConfiguracaoNFSeModel;
  public
    constructor Create(const AConfiguracao: ConfiguracaoNFSeModel);
    function Executar(EmpresaId: Integer): ConfiguracaoNFSeModel;
    function ObterSerieDPS(EmpresaId: Integer): string;
  end;

implementation

uses
  SysUtils;

constructor TStubConfiguracaoNFSeService.Create(const AConfiguracao: ConfiguracaoNFSeModel);
begin
  inherited Create;
  FConfiguracao := AConfiguracao;
end;

function TStubConfiguracaoNFSeService.Executar(EmpresaId: Integer): ConfiguracaoNFSeModel;
begin
  Result := FConfiguracao;
end;

function TStubConfiguracaoNFSeService.ObterSerieDPS(EmpresaId: Integer): string;
begin
  raise Exception.Create('Unexpected call to TStubConfiguracaoNFSeService.ObterSerieDPS');
end;

end.
