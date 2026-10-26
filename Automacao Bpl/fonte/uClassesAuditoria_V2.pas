unit uClassesAuditoria_V2;

interface

uses
  uDataSet_OOP, IBQuery, SysUtils;

type
  TAuditoriaV2 = class;

  TAuditoriaV2 = class(TDataSet_OOP)
  public
    constructor create;
    destructor Destroy; override;
    function abrirAuditoria: boolean;
    procedure cadAuditoria(pBuscas: TIBQuery);
    procedure verificarconexao;
  end;

implementation

uses 
  FieldsConfigUnit,
  uDtmAtivo, uBuscaAuditoria_V2, Forms, Windows;

{ TAuditoriaV2 }

function TAuditoriaV2.abrirAuditoria: boolean;
begin
  result := montaSelect('select * from auditoria where codigo = 0');
end;

procedure TAuditoriaV2.cadAuditoria(pBuscas: TIBQuery);
begin
 try
    vDadosIni.abreStatusProcessamento('','Abrindo Auditória');

    vDadosIni.vTipoForm := 0;

    if not vDadosIni.conectaBanco(dtmAtivo.BancoAuditoria, vDadosIni.vBancoAuditoria, True) then
    begin
      Application.MessageBox('Falha ao conectar no banco auditória, favor verificar', 'Atenção', MB_OK + MB_ICONINFORMATION);
      vDadosIni.fechaStatusProcessamento;
      exit;
    end;

    if not vDadosIni.PesqPros('AUD001', 'ABRIR', '', 'AUDITORIA', '', pBuscas, False) then
      Exit;

    if frmBuscaAudtioria_V2 = nil then
      Application.CreateForm(TfrmBuscaAudtioria_V2, frmBuscaAudtioria_V2);
  	frmBuscaAudtioria_V2.Show;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TAuditoriaV2.create;
begin
  inherited Create(dtmAtivo.BancoAuditoria, nil, True, 'cds_auditoria_v2');
  TableName := 'AU-DITORIA';
  TabelaCampoCaseSentitive.Add('AUDITORIA.NOMECOMPUTADOR');
  TabelaCampoCaseSentitive.Add('AUDITORIA.MENSAGEM');

  ConfigFields( FieldsConfigFactory.Create()
    .Add('cod_empresa', fvInvisivel)
  );
end;

destructor TAuditoriaV2.Destroy;
begin
  FreeDbComponents(True);
  inherited;
end;

procedure TAuditoriaV2.verificarconexao;
begin
 try
   buscas.Close;
   buscas.SQL.Text := 'select codigo from auditoria where codigo = 0 and cod_empresa = 0';
   buscas.Open;
 except
    on e: exception do
    begin
       if (Pos('Dataset open', e.Message) > 0)
      	or (Pos('Unable to complete network', e.Message) > 0)
        or (Pos('shutdown', e.Message) > 0) then
	        if not vDadosIni.conectaBanco(dtmAtivo.BancoAuditoria, vDadosIni.vBancoAuditoria, True) then
            Application.MessageBox('O sistema não recuperou a conexão. Favor entre novamente nesta tela!', 'Atenção', 0 + 64);

    end;
 end;
end;

end.
