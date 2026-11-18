unit EmpresaOptionsBuilder;

interface

uses
  EmpresaOption, ListarEmpresasUseCaseUnit, ISessionContextUnit, TipoComunsUnit;

// Cria o carregador de opcoes do seletor de empresas. A inclusao preserva a marca das permitidas; a alteracao usa os
// vinculos gravados, inclusive os de itens bloqueados, e o login e lido a cada carga.
function CriarCarregadorEmpresas(AListarEmpresas: ListarEmpresasUseCase;
  ASession: ISessionContext): TCarregarOpcoesEmpresas;

implementation

uses
  System.SysUtils, System.Classes, System.Contnrs, EmpresaEtdUnit;

// Le todas as empresas e as permitidas ao login corrente, devolvendo uma opcao por empresa na ordem da lista total. O
// login e lido a cada chamada porque o host pode trocar o usuario mantendo a janela viva.
function MontarOpcoesEmpresas(AListarEmpresas: ListarEmpresasUseCase;
  ASession: ISessionContext; out AOpcoes: TEmpresaOptions): Boolean;
var
  TodasEmpresas: EmpresasEtd;
  EmpresasPermitidas: EmpresasEtd;
  Login: string;
  I: Integer;
  J: Integer;
  Empresa: EmpresaEtd;
  Opcao: TEmpresaOption;
begin
  Result := False;
  SetLength(AOpcoes, 0);

  if (AListarEmpresas = nil) or (ASession = nil) then
    Exit;

  Login := Trim(ASession.UsuarioLogin);
  if Login = '' then
    Exit;

  TodasEmpresas := nil;
  EmpresasPermitidas := nil;
  try
    try
      TodasEmpresas := AListarEmpresas.Executar();
      EmpresasPermitidas := AListarEmpresas.Executar(Login);

      if (TodasEmpresas = nil) or (EmpresasPermitidas = nil) then
        Exit;

      // A ordem e a da lista total (COD_EMPRESA); permitidas fora dela sao ignoradas, como no legado.
      SetLength(AOpcoes, TodasEmpresas.Count);
      for I := 0 to TodasEmpresas.Count - 1 do
      begin
        Empresa := EmpresaEtd(TodasEmpresas.Items[I]);
        Opcao.Id := Empresa.Id;
        Opcao.Texto := Format('%d - %s', [Empresa.Id, Empresa.Identificacao]);
        Opcao.Habilitada := False;
        for J := 0 to EmpresasPermitidas.Count - 1 do
          if EmpresaEtd(EmpresasPermitidas.Items[J]).Id = Empresa.Id then
          begin
            Opcao.Habilitada := True;
            Break;
          end;

        // A inclusao marca toda empresa permitida; a alteracao substitui a marca pelo vinculo gravado.
        Opcao.Marcada := Opcao.Habilitada;
        AOpcoes[I] := Opcao;
      end;

      Result := True;
    except
      SetLength(AOpcoes, 0);
    end;
  finally
    EmpresasPermitidas.Free;
    TodasEmpresas.Free;
  end;
end;

// Zera as marcas recebidas e marca somente os vinculos gravados. A permissao apenas habilita a troca: um vinculo sem
// permissao continua marcado e bloqueado.
procedure MarcarEmpresasVinculadas(var AOpcoes: TEmpresaOptions; const AEmpresasVinculadas: TArrayInteger);
var
  I: Integer;
  J: Integer;
begin
  for I := 0 to High(AOpcoes) do
  begin
    AOpcoes[I].Marcada := False;
    for J := 0 to High(AEmpresasVinculadas) do
      if AOpcoes[I].Id = AEmpresasVinculadas[J] then
      begin
        AOpcoes[I].Marcada := True;
        Break;
      end;
  end;
end;

function CriarCarregadorEmpresas(AListarEmpresas: ListarEmpresasUseCase;
  ASession: ISessionContext): TCarregarOpcoesEmpresas;
begin
  Result :=
    function(APreparacao: TPreparacaoEmpresas; const AEmpresasVinculadas: TArrayInteger;
      out AOpcoes: TEmpresaOptions): Boolean
    begin
      Result := MontarOpcoesEmpresas(AListarEmpresas, ASession, AOpcoes);
      if not Result then
        Exit;
      if APreparacao = peAlteracao then
        MarcarEmpresasVinculadas(AOpcoes, AEmpresasVinculadas);
    end;
end;

end.
