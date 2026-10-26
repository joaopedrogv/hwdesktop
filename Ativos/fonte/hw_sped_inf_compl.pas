unit hw_sped_inf_compl;

interface

uses
  uClasseConexao,
  Query_OOP,
  IBQuery,
  IBDatabase,
  sped_inf_compl;

const

  sInfCplCUPOM           = 'CUPOM';
  sInfCplNFE             = 'NFE';
  sInfCplNFCE            = 'NFCE';
  sInfCplSIMPLES         = 'SIMPLES';
  sInfCplSIMPLES_EX      = 'SIMPLES/EXCESSO';
  sInfCplDESONERACAO     = 'DESONERACAO';
  sInfCplDESONERACAOPC   = 'DESONERACAO_PISCOF';
  sInfCplDEOLHOIMPOSTO   = 'DE OLHO NO IMPOSTO';
  sInfCplRETENCAOFEDERAL = 'RETENCAO FEDERAL';
  sInfCplCOMPLEMENTOONFC = 'NFCE COMPLEMENTAR';

type

  TInfComplementarModel = class(Tsped_inf_compl);

  TSpedInfComplUtils = class(TConexao)
  strict private
    cod_empresa: Integer;
    procedure HandleCodInfMax();
  public
    constructor Create(AdataBase: TIBDatabase; empresaId: Integer);
    function Get(Atipo: string): TInfComplementarModel;
  end;

implementation

uses SysUtils, StrUtils;

{ TSpedInfComplUtils }

constructor TSpedInfComplUtils.Create(AdataBase: TIBDatabase;
  empresaId: Integer);
begin
  inherited Create(AdataBase);

  cod_empresa := empresaId;
end;

function TSpedInfComplUtils.Get(Atipo: string): TInfComplementarModel;
begin
  Result := TInfComplementarModel.Create;

  Result.CopyFrom(queryCons
    .Table('SPED_INFORMACAO_COMPLEMENTAR', '*')
    .Equals('TIPO', Atipo)
    .Equals('cod_empresa', cod_empresa));

  if Result.cod_inf = 0 then
  begin
    HandleCodInfMax;

    Result.cod_empresa := cod_empresa;
    Result.tipo        := Atipo;
    Result.txt         := IfThen(Atipo = sInfCplCUPOM          , 'Ref ECF:') +
                          IfThen(Atipo = sInfCplDESONERACAO    , '') +
                          IfThen(Atipo = sInfCplNFCE           , 'Ref NFCe:') +
                          IfThen(Atipo = sInfCplNFE            , 'Ref NFe:') +
                          IfThen(Atipo = sInfCplSIMPLES        , '"DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL";  "NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI.";') +
                          IfThen(Atipo = sInfCplSIMPLES_EX     , '"DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL";   "ESTABELECIMENTO IMPEDIDO DE RECOLHER O ICMS/ISS PELO SIMPLES NACIONAL, NOS TERMOS DO § 1º DO ART. 20 DA LC 123/2006";   "NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI".') +
                          IfThen(Atipo = sInfCplDEOLHOIMPOSTO  , '.') +
                          IfThen(Atipo = sInfCplCOMPLEMENTOONFC, '');
    Result.txt_compl   := IfThen(Atipo = sInfCplCUPOM          , '(Mod:[@COD_MOD] ECF:[@ECF_CX] Fab:[@ECF_FAB] COO:[@NUM_DOC] Data:[@DT_DOC])') +
                          IfThen(Atipo = sInfCplDESONERACAO    , 'Desconto no valor de R$[@VICMDESON] ref. ICMS desonerado conf. convenio de ICMS 100/97 e ajuste SINIEF 10/2012') +
                          IfThen(Atipo = sInfCplNFCE           , '[@chave_nfe_ref]') +
                          IfThen(Atipo = sInfCplNFE            , '[@chave_nfe_ref]') +
                          IfThen(Atipo = sInfCplRETENCAOFEDERAL, 'Retenção Federal total de R$ [@vrettot] conforme art. 64 da Lei 9.430/1996.') +
                          IfThen(Atipo = sInfCplCOMPLEMENTOONFC, 'NFC-e de complemento de imposto. Referente a NFCe [@chave_nfce]');
    if Atipo = sInfCplCOMPLEMENTOONFC then
    begin
      Result.ativo_em_nfe  := 'N';
      Result.ativo_em_nfce := 'S';
    end;

    Result.cod_inf := SqlInsertID(Result.SQLMotor('cod_inf').SQLInsertAutoInc, 'cod_inf');
    if Transacao.InTransaction then
       Transacao.Commit;
  end;
end;

procedure TSpedInfComplUtils.HandleCodInfMax;
begin
   queryCons.SQL('select max(inf.cod_inf) maximo, cod.tabela, cod.valor from sped_informacao_complementar inf' +
                 ' left join codigo cod on cod.tabela = ''SPED_INFORMACAO_COMPLEMENTAR'' and cod.cod_empresa = inf.cod_empresa' +
                 ' where inf.cod_empresa = %d' +
                 ' group by 2,3', [cod_empresa])
     .Open();

  if queryCons.fint('maximo') > queryCons.fint('valor') then
    queryCons.SQL('update or insert into codigo (tabela, cod_empresa, valor) values (%s, %d, %d) matching (tabela, cod_empresa)',
                  [QuotedStr('SPED_INFORMACAO_COMPLEMENTAR'), cod_empresa, queryCons.fint('maximo')])
      .ExecSQL()
      .query.Transaction.Commit;
end;

end.
