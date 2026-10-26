(*
  Arquivo exclusivo Delphi com ACBR
*)
unit NFSeAnexosServiceUnit;

interface

uses
  SysUtils, Classes,
  INFSeAnexosServiceUnit,
  INFSeRepositoryUnit,
  IACBrNFSeAdapterUnit,
  NFSeResumoModelUnit,
  NFSeTypesUnit,
  TipoComunsUnit, IConfiguracaoNFSeServiceUnit, IEmpresasRepositoryUnit;

type
  NFSeAnexosService = class(TInterfacedObject, INFSeAnexosService)
  private
    FNFSeRepo: INFSeRepository;
    FConfNFSe: IConfiguracaoNFSeService;
    FEmpresasRepo: IEmpresasRepository;
    FACBr: IACBrNFSeAdapter;

    function ObterAnexosDaNFSe(
      const NFSeId: string;
      AnexarPDFs, EnvioEmProducao: Boolean;
      out Anexos: NFSeAnexosResultArray;
      out Erros: NFSeErroResultArray
    ): Boolean;

    function AdicionarAnexo(
      var Anexos: NFSeAnexosResultArray;
      const NFSeId, FileName: string;
      const Content: TBytes
    ): Integer;

    function AdicionarFalhaNoAnexo(
      var Erros: NFSeErroResultArray;
      const NFSeId, Erro: string
    ): Integer;
  public
    constructor Create(
      NFSeRepo: INFSeRepository;
      EmpresasRepo: IEmpresasRepository;
      ConfNFSe: IConfiguracaoNFSeService;
      ACBr: IACBrNFSeAdapter
    );

    function CriarAnexos(
      const NFSeIds: TArrayString;
      EmpresaId: Integer;
      AnexarPDFs: Boolean
    ): NFSeAnexosServiceResult;
  end;

implementation

uses
  IOUtils, System.Generics.Collections,
  ResultadoOperacaoDFeUnit,
  NFSeModelUnit, ConfiguracaoNFSeModelUnit, EmpresaEtdUnit;

{ NFSeAnexosService }

function NFSeAnexosService.AdicionarAnexo(
  var Anexos: NFSeAnexosResultArray;
  const NFSeId, FileName: string;
  const Content: TBytes): Integer;
var
  I: Integer;
begin
  I := Length(Anexos);
  SetLength(Anexos, I + 1);
  Anexos[I].NFSeId := NFSeId;
  Anexos[I].FileName := FileName;
  Anexos[I].Content := Content;
  Result := I;
end;

function NFSeAnexosService.AdicionarFalhaNoAnexo(
  var Erros: NFSeErroResultArray;
  const NFSeId, Erro: string
): Integer;
var
  I: Integer;
begin
  I := Length(Erros);
  SetLength(Erros, I + 1);
  Erros[I] := TPair<TNFSeId,string>.Create(NFSeId, Erro);
  Result := I;
end;

constructor NFSeAnexosService.Create(
  NFSeRepo: INFSeRepository;
  EmpresasRepo: IEmpresasRepository;
  ConfNFSe: IConfiguracaoNFSeService;
  ACBr: IACBrNFSeAdapter
);
begin
  FNFSeRepo := NFSeRepo;
  FEmpresasRepo := EmpresasRepo;
  FConfNFSe := ConfNFSe;
  FACBr := ACBr;
end;

function NFSeAnexosService.CriarAnexos(
  const NFSeIds: TArrayString;
  EmpresaId: Integer;
  AnexarPDFs: Boolean): NFSeAnexosServiceResult;
var
  I: Integer;
  AnexosNFSe: NFSeAnexosResultArray;
  ErrosNFSe: NFSeErroResultArray;
  config: ConfiguracaoNFSeModel;
  empresa: EmpresaEtd;
begin
  SetLength(Result.Anexos, 0);
  SetLength(Result.Erros, 0);

  empresa := FEmpresasRepo.GetByKey(EmpresaId);
  try
    config := FConfNFSe.Executar(EmpresaId);
    FACBr.Configurar(config, empresa);

    for I := Low(NFSeIds) to High(NFSeIds) do
    begin
      if ObterAnexosDaNFSe(NFSeIds[I], AnexarPDFs, config.WebService.EnvioEmProducao, AnexosNFSe, ErrosNFSe) then
      begin
        // Concatena os anexos desta NFSe ao resultado total
        Result.Anexos := Result.Anexos + AnexosNFSe;
        Result.Erros := Result.Erros + ErrosNFSe;
      end;
    end;
  finally
    empresa.Free();
  end;
end;

function NFSeAnexosService.ObterAnexosDaNFSe(
  const NFSeId: string;
  AnexarPDFs, EnvioEmProducao: Boolean;
  out Anexos: NFSeAnexosResultArray;
  out Erros: NFSeErroResultArray
): Boolean;
var
  resumoNFSe: NFSeResumoModel;
  ChaveNFSe: string;
  pdfOut: string;
  pdfBytes: TBytes;
  xmlAutBytes: TBytes;
  xmlCancBytes: TBytes;
begin
  SetLength(Anexos, 0);
  SetLength(Erros, 0);
  Result := True;

  // 1. Carrega resumo da NFSe com os documentos necessários
  resumoNFSe := FNFSeRepo.GetResumoNFSe(NFSeId, [tdocXmlAutorizacao, tdocXmlCancAutorizacao]);

  // 2. Validações básicas
  if resumoNFSe.Id.IsEmpty then
  begin
    AdicionarFalhaNoAnexo(Erros, resumoNFSe.Id, 'NFSe não encontrada');
    Exit;
  end;

  if not (resumoNFSe.Situacao in [sdpsAutorizada, sdpsCancelada, sdpsSubstituida]) then
  begin
    AdicionarFalhaNoAnexo(Erros, resumoNFSe.Id,
      Format('Situação não permite criar anexos: Situação %d', [Ord(resumoNFSe.Situacao)])
    );
    Exit;
  end;

  if resumoNFSe.Documento[tdocXmlAutorizacao].IsNullOrWhiteSpace then
  begin
    AdicionarFalhaNoAnexo(Erros, resumoNFSe.Id, 'XML de autorização não encontrado');
    Exit;
  end;

  // 3. Define a chave para nomeação dos arquivos
  if resumoNFSe.Chave.HasValue then
    ChaveNFSe := resumoNFSe.Chave.Value
  else
    ChaveNFSe := Format('%d-%s', [resumoNFSe.NNFSe.Value, resumoNFSe.Serie.Value]);

  // 4. Gera PDF do DANFSe (se solicitado)
  if AnexarPDFs then
  begin
    SetLength(pdfBytes, 0);
    try
      FACBr.SalvarPDF(
        resumoNFSe.Documento[tdocXmlAutorizacao].Value,
        resumoNFSe.Situacao in [sdpsCancelada, sdpsSubstituida],
        EnvioEmProducao,
        pdfOut
      );

      if not string.IsNullOrWhiteSpace(pdfOut) and TFile.Exists(pdfOut) then
      begin
        pdfBytes := TFile.ReadAllBytes(pdfOut);
        AdicionarAnexo(Anexos, NFSeId, Format('%s-nfse.pdf', [ChaveNFSe]), pdfBytes);
      end;
    finally
      // Limpa arquivo temporário
      if (Length(pdfBytes) > 0) and TFile.Exists(pdfOut) then
        DeleteFile(pdfOut);
    end;
  end;

  // 5. XML de Autorização
  xmlAutBytes := TEncoding.ANSI.GetBytes(resumoNFSe.Documento[tdocXmlAutorizacao].Value);
  AdicionarAnexo(Anexos, NFSeId, Format('%s-nfse.xml', [ChaveNFSe]), xmlAutBytes);

  // 6. XML de Cancelamento (se existir)
  if resumoNFSe.Documento[tdocXmlCancAutorizacao].HasValue then
  begin
    xmlCancBytes := TEncoding.ANSI.GetBytes(resumoNFSe.Documento[tdocXmlCancAutorizacao].Value);
    AdicionarAnexo(Anexos, NFSeId, Format('%s-nfse-canc.xml', [ChaveNFSe]), xmlCancBytes);
  end;

  Result := True;
end;

end.
