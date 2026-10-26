unit ProcessosSetupUnit;

interface

uses
  IBQuery;

type
  IProcessoSetup = interface
    ['{91EBD1D9-BC3B-4858-A673-42050FBC97C5}']
    procedure Executar(Q: TIBQuery);
  end;

  ProcessoSetupFactory = class
  public
    class function Create(): IProcessoSetup; static;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  Math,
  uDtmAtivo,
  uDadosIni, hw_utils, config_sistema_class;

type   
  ProcessoItem = record
  private
    FCodigo: string;
    FDescricao: string;
    FNivel: Integer;
    FExigeGerente: Boolean;
    FGravaAuditoria: Boolean;
  public
    class function Create(
      const Codigo: string;
      Nivel: Integer;
      const Descricao: string;
      ExigeGerente: Boolean = False;
      GravaAuditoria: Boolean = True
    ): ProcessoItem; static;

    property Codigo: string read FCodigo;
    property Descricao: string read FDescricao;
    property Nivel: Integer read FNivel;
    property ExigeGerente: Boolean read FExigeGerente;
    property GravaAuditoria: Boolean read FGravaAuditoria;
  end;

  ProcessoSetup = class(TInterfacedObject, IProcessoSetup)
  const
    CDELTA = 32;
  private
    FVer, FVerBanco: Single;
    FCount, FCurrent: Integer;
    FProcessos: array of ProcessoItem;

    procedure Add(
      const Codigo: string;
      Nivel: Integer;
      const Descricao: string;
      ExigeGerente: Boolean = False;
      GravaAuditoria: Boolean = True);

    function VersaoBancoMenor(NovaVersao: Double): Boolean;
    procedure VerificarProcessos();
  public
    procedure Executar(Q: TIBQuery);
  end;

{ ProcessoSetupFactory }

class function ProcessoSetupFactory.Create: IProcessoSetup;
begin
  Result := ProcessoSetup.Create();
end;

{ ProcessoItem }

class function ProcessoItem.Create(
  const Codigo: string;
  Nivel: Integer;
  const Descricao: string;
  ExigeGerente, GravaAuditoria: Boolean): ProcessoItem;
begin
  Result.FCodigo := Codigo;
  Result.FDescricao := Descricao;
  Result.FNivel := Nivel;
  Result.FExigeGerente := ExigeGerente;
  Result.FGravaAuditoria := GravaAuditoria;
end;

{ ProcessoSetup }

function ProcessoSetup.VersaoBancoMenor(NovaVersao: Double): Boolean;
begin
  Result := RoundTo(FVerBanco, -3) < RoundTo(NovaVersao, -3);
  if Result then
    FVer := NovaVersao;
end;

procedure ProcessoSetup.Add(const Codigo: string;
  Nivel: Integer; const Descricao: string; ExigeGerente,
  GravaAuditoria: Boolean);
const
  DeltaGrow = 32;
begin
  if Length(Trim(Codigo)) > 10 then
    raise Exception.CreateFmt('Código do processo [%s - %s]  maior que o permitido. 10', [ Codigo, Descricao ]);

  if Length(Trim(Descricao)) > 50 then
    raise Exception.CreateFmt('Descrição do processo [%s - %s]  maior que o permitido. 10', [ Codigo, Descricao ]);

  if FCurrent <= FCount then
  begin
    FCurrent := FCount + DeltaGrow;
    SetLength(FProcessos, FCurrent);
  end;

  FProcessos[ FCount ] := ProcessoItem.Create( Trim(Codigo), Nivel, Trim(Descricao), ExigeGerente, GravaAuditoria );
  Inc(FCount);
end;

procedure ProcessoSetup.Executar(Q: TIBQuery);
const
  KeyConf = 'config_tab_processos';
var
  proc: ProcessoItem;
  I: Integer;
  conf: TConfig_sistema_class;
begin
  FVer := 0;
  FCount := 0;
  FCurrent := 0;

  conf := TConfig_sistema_class.getConf(KeyConf, Q, vDadosIni.cod_empresa);
  try
    try
      FVerBanco := conf.value1_f;

      VerificarProcessos();

      SetLength(FProcessos, FCount);

      if Length(FProcessos) = 0 then
        Exit;

      Q.Close;
      Q.SQL.Text := 'INSERT INTO TABELA_PROCESSOS' +
                    '   (COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA, FORM, ATIVO, DATA_MOD_CAD)' +
                    ' SELECT COALESCE(T.COD_PROCESSO, :COD_PROCESSO) COD_PROCESSO,' +
                    '        COALESCE(T.COD_EMPRESA, :COD_EMPRESA) COD_EMPRESA,' +
                    '        COALESCE(T.NOME_PROCESSO, :NOME_PROCESSO) NOME_PROCESSO,' +
                    '        COALESCE(T.NIVEL_PROCESSO, :NIVEL_PROCESSO) NIVEL_PROCESSO,' +
                    '        COALESCE(T.SENHA_GERENTE, :SENHA_GERENTE) SENHA_GERENTE,' +
                    '        COALESCE(T.GRAVAR_AUDITORIA, :GRAVAR_AUDITORIA) GRAVAR_AUDITORIA,' +
                    '        ''.'' FORM, 1 ATIVO, CURRENT_DATE DATA_MOD_CAD' +
                    ' FROM RDB$DATABASE' +
                    ' LEFT JOIN TABELA_PROCESSOS T ON T.COD_PROCESSO = :COD_PROCESSO AND' +
                    '   T.COD_EMPRESA = :COD_EMPRESA' +
                    ' WHERE T.COD_PROCESSO IS NULL';                               
      Q.Prepare();

      for I := Low(FProcessos) to High(FProcessos) do
      begin
        Q.ParamByName('COD_PROCESSO').AsString := FProcessos[I].Codigo;                          
        Q.ParamByName('COD_EMPRESA').AsInteger := vDadosIni.cod_empresa;
        Q.ParamByName('NOME_PROCESSO').AsString := FProcessos[I].Descricao;
        Q.ParamByName('NIVEL_PROCESSO').AsInteger := FProcessos[I].Nivel;
        Q.ParamByName('SENHA_GERENTE').AsString := IfThen( FProcessos[I].ExigeGerente, 'S', 'N');
        Q.ParamByName('GRAVAR_AUDITORIA').AsString := IfThen( FProcessos[I].GravaAuditoria, 'S', 'N');
        Q.ExecSQL();

        if (I mod 50 = 0) and Q.Transaction.InTransaction then
          Q.Transaction.Commit();
      end;

      if FVer > FVerBanco then
      begin
        if conf.chave <> KeyConf then
        begin
          conf.chave := KeyConf;
          conf.cod_empresa := vDadosIni.cod_empresa;
          conf.display_ := 'Versao da tabela de processos';
          conf.tag := 'processos';
          conf.type1_ := typeFloat;
          conf.ativo := 1;
        end;

        conf.value1_f := FVer;
        conf.SaveConfDB(Q);
      end;

      if Q.Transaction.InTransaction then
        Q.Transaction.Commit();

    except on E: Exception do
      begin
        ShowErro('Erro criar processos na inicialização. Erro: ' + e.Message);
        vDadosIni.registraErro('ProcessoSetup.Executar. Erro: ' + e.Message);
      end;
    end;
  finally
    conf.Free();
  end;
end;

procedure ProcessoSetup.VerificarProcessos;
begin
  if VersaoBancoMenor(1.00) then
  begin
    Add('MOD001', 10, 'CONSULTA OPERACAO INTERNA');
    Add('MOD002', 10, 'INCLUIR OPERACAO INTERNA');
    Add('MOD003', 10, 'ALTERAR OPERACAO INTERNA');
    Add('MOD004', 10, 'SALVAR OPERACAO INTERNA');
    Add('MOD005', 10, 'EXCLUIR OPERACAO INTERNA');
    Add('MOD006', 10, 'RESTAURAR OPERACAO INTERNA');
    Add('MOD007', 10, 'VISUALIZAR VINCULO OP INTERNA TP VENDAS');
    Add('MOD008', 10, 'CONSULTA GRUPO FISCAL');
    Add('MOD009', 10, 'INCLUIR GRUPO FISCAL');
    Add('MOD010', 10, 'ALTERAR GRUPO FISCAL');
    Add('MOD011', 10, 'SALVAR GRUPO FISCAL');
    Add('MOD012', 10, 'EXCLUIR GRUPO FISCAL');
    Add('MOD013', 10, 'RESTAURAR GRUPO FISCAL');
    Add('MOD014', 10, 'CONSULTA REGRAS FISCAIS IBS CBS');
    Add('MOD015', 10, 'INCLUIR REGRAS FISCAIS IBS CBS');
    Add('MOD016', 10, 'ALTERAR REGRAS FISCAIS IBS CBS');
    Add('MOD017', 10, 'SALVAR REGRAS FISCAIS IBS CBS');
    Add('MOD018', 10, 'EXCLUIR REGRAS FISCAIS IBS CBS');
    Add('MOD019', 10, 'RESTAURAR REGRAS FISCAIS IBS CBS');
    Add('MOD020', 10, 'CONSULTA OPERACOES FISCAIS IBS CBS');
    Add('MOD021', 10, 'INCLUIR OPERACOES FISCAIS IBS CBS');
    Add('MOD022', 10, 'ALTERAR OPERACOES FISCAIS IBS CBS');
    Add('MOD023', 10, 'SALVAR OPERACOES FISCAIS IBS CBS');
    Add('MOD024', 10, 'EXCLUIR OPERACOES FISCAIS IBS CBS');
    Add('MOD025', 10, 'RESTAURAR OPERACOES FISCAIS IBS CBS');
  end;

  if VersaoBancoMenor(1.01) then
  begin
    Add('MOD026', 10, 'VINCULAR TIPOSVENDAS A OPERACAO INTERNA');
    Add('MOD027', 10, 'VINCULAR OPERACOES INTERNAS A TIPOVENDA');
    Add('MOD028', 10, 'VISUALIZAR VINCULO TP VENDA OP INTERNAS');
  end;

  if VersaoBancoMenor(1.02) then
    Add('NFS008', 100, 'RESETAR OS RPS E NFSE', True);

  if VersaoBancoMenor(1.10) then
  begin
    Add('NFS009', 10, 'SALVAR DISCRIMINACAO PERSONALIZADA NFSE');
    Add('NFS010', 10, 'EXCLUIR DISCRIMINACAO PERSONALIZADA NFSE', True);
    Add('MOD029', 10, 'HAB TRIB REGULAR REGRAS FISCAIS IBS CBS');
    Add('MOD030', 10, 'HAB TRIB REGULAR INCOMPATIVEL REGRAS FISCS IBSCBS');
    Add('NF0257', 100, 'IGNORAR TRIBUTOS RTC NFE');
  end;

  if VersaoBancoMenor(1.11) then
  begin
    Add('MOD031', 10, 'DEFINIR OPERACAO INTERNA PADRAO NFCE', True);
    Add('NFC046', 100, 'IGNORAR TRIBUTOS RTC NFCE');
  end;

  if VersaoBancoMenor(2) then
  begin
    Add('NFS011', 05, 'PESQUISAR NFSE/DPS');
    Add('NFS012', 05, 'NOVA NFSE SERV PREST EMISSAO SISTEMA');
    Add('NFS013', 05, 'NOVA NFSE SERV PREST EMITIDA PORTAL', True);
    Add('NFS014', 05, 'NOVA NFSE SERV TOMADO TERCEIROS');
    Add('NFS015', 05, 'SALVAR NFSE SERV PREST');
    Add('NFS016', 05, 'SALVAR NFSE SERV TOMADO');
    Add('NFS017', 05, 'EMITIR NFSE SERV PREST');
    Add('NFS018', 05, 'CONCLUIR NFSE SERV PREST');
    Add('NFS019', 05, 'CONCLUIR NFSE SERV TOMADO');
    Add('NFS020', 05, 'CONCLUIR NFSE SEM CHAVE', True);
    Add('NFS021', 10, 'REVERTER AUTORIZACAO NFSE PORTAL', True);
    Add('NFS022', 05, 'EXCLUIR RASCUNHO NFSE', True);
    Add('BAS551', 05, 'ALTERA DADOS FISCAIS TIPO SERVICO LOTE', True);
    Add('NFS023', 05, 'EXCLUIR VINCULO COM OS', True);
    Add('NFS024', 05, 'CONSULTAR NFSE SERV PREST');
    Add('NFS025', 05, 'ALTERNAR NATUREZA NFSE WS E PORTAL');
    Add('NFS026', 05, 'ALTERAR NFSE EMISSAO PROPRIA');
    Add('NFS027', 05, 'ALTERAR NFSE EMISSAO TERCEIRO');
    Add('NFS028', 05, 'IMPRIMIR NFSE');
    Add('NFS029', 05, 'ENVIAR EMAIL NFSE');
    Add('NFS030', 05, 'CRIAR/VISUALIZAR CANCELAMENTO NFSE');
    Add('NFS031', 05, 'SALVAR CANCELAMENTO NFSE EMISSAO SISTEMA');
    Add('NFS032', 05, 'SALVAR CANCELAMENTO NFSE EMITIDA PORTAL');
    Add('NFS033', 10, 'REVERTER CANCELAMENTO NFSE PORTAL', True);
    Add('NFS034', 05, 'EXCLUIR RASCUNHO CANCELAMENTO NFSE', True);
    Add('NFS035', 05, 'VISUALIZAR HISTORICO NFSE');
    Add('NFS036', 05, 'VISUALIZAR TELA EMISSAO VIA O.S.');
    Add('NFS037', 05, 'VISUALIZAR VINCULOS COM O.S.');
    Add('NFS038', 05, 'CRIAR/EMITIR LOTE NFSE VIA O.S.');
    Add('NFS039', 05, 'VISUALIZAR CONFIGURACOES NFSE');
    Add('NFS040', 10, 'SALVAR CONFIGURACOES NFSE', True);
    Add('NFS041', 05, 'VISUALIZAR MODULO NFSE ANTIGO');
  end;

  if VersaoBancoMenor(2.01) then
  begin
    Add('NFS042', 10, 'ALTERAR TOMADOR NFSE COM O.S. VNCULADA', True);
    Add('NFS043', 10, 'ALTERAR SERVICO NFSE COM O.S. VNCULADA', True);
    Add('NFS044', 10, 'ALTERAR TRIBUTOS NFSE', True);
  end;

  if VersaoBancoMenor(2.02) then
    Add('EFD023', 100, 'GERAR EFD PISCOFINS COM PENDENCIAS EM NFSE', True);

  if VersaoBancoMenor(2.03) then
  begin
    Add('MOD032', 05, 'CONSULTA REGRAS RED BENEF PC');
    Add('MOD033', 05, 'INCLUIR REGRA RED BENEF PC');
    Add('MOD034', 05, 'ALTERAR REGRA RED BENEF PC');
    Add('MOD035', 05, 'SALVAR REGRA RED BENEF PC');
    Add('MOD036', 10, 'EXCLUIR REGRA RED BENEF PC', True);
    Add('MOD037', 10, 'RESTAURAR REGRA RED BENEF PC', True);

    Add('MOD038', 05, 'CONSULTA AJUSTES RED BENEF PC');
    Add('MOD039', 05, 'INCLUIR AJUSTE RED BENEF PC');
    Add('MOD040', 05, 'ALTERAR AJUSTE RED BENEF PC');
    Add('MOD041', 05, 'SALVAR AJUSTE RED BENEF PC');
    Add('MOD042', 10, 'EXCLUIR AJUSTE RED BENEF PC', True);
    Add('MOD043', 10, 'REMOVER CRIADO SISTEMA AJUSTE RED BENEF PC', True);
  end;

  if VersaoBancoMenor(2.03) then
  begin
    Add('NF0261', 100, 'RESOLVER PENDENCIA SEFAZ MANUAL', True);
    Add('NF0262', 5,   'RESOLVER PENDENCIA SEFAZ AUTOMATICAMENTE');
  end;

end;

end.
