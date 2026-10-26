unit uClassesRotasEntrega;

interface

uses
  Contnrs,     
  Classes,
  DB,
  IBDatabase,
  IBQuery,
  DBClient,
  uDataSet_OOP,
  rotas_entr_class,
  vw_clientes_dest_class;

type
  TRotas            = class;

  THw_regiao_class = class(TObject)
  private
    Fcod_localidade: Integer;
    Fcod_cidade    : Integer;
    Fregiao        : string;
    Fsetor         : string;
    Fsalvo         : Integer;
    Fchanged       : Integer;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    function Clone: THw_regiao_class;

    property cod_localidade: Integer read Fcod_localidade write Fcod_localidade;
    property cod_cidade    : Integer read Fcod_cidade     write Fcod_cidade;
    property regiao        : string  read Fregiao         write Fregiao;
    property setor         : string  read Fsetor          write Fsetor;
    property salvo         : Integer read Fsalvo          write Fsalvo;
    property changed       : Integer read Fchanged        write Fchanged;
  end;

  THw_regiao_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): THw_regiao_class;
    procedure SetItem(Index: Integer; const Value: THw_regiao_class);
  public
    function New: THw_regiao_class;

    property Items[Index: Integer]: THw_regiao_class read GetItem write SetItem;
  end;

  TeventoChange = procedure(const Amove: Integer) of object;

  TRotas = class(TDataSet_OOP)
  private
    Fibq          : TIBQuery;
    Fdel_regioes  : THw_regiao_classList;
    Fregioes      : THw_regiao_classList;
    FregiaoChange : TeventoChange;
    procedure regiao_iniciar;
  public
    constructor Create;
    destructor Destroy; override;

    function Insert: Boolean; override;
    function Edit: Boolean; override;
    function Delete: Boolean; override;
    function Post: Boolean; override;

    function consultaRegiao(Aregiao, Atexto, Acondicao: string): Boolean;
    function DelRegiao(Aindex: Integer): Boolean;
    function AddRegiao(Acod_cidade, Acod_localidade: Integer; Aregiao, Asetor: string): Boolean;
    function MoveRegiao(Aindex, Amove: Integer): Boolean;
    procedure show_definir_rotas;


    property regioes: THw_regiao_classList read Fregioes write Fregioes;
    property regiaoChange: TeventoChange read FregiaoChange write FregiaoChange ;
  end;

  TRotas_Clientes = class(TDataSet_OOP)
  private
    Fcod_rota: Integer;
    Frotas   : TClientDataSet;
    Fclientes: TClientDataSet;
    Frota_ent: TRotas_entr_class;

    procedure configurarDataSet(AdataSet: TClientDataSet);
  public
    constructor Create();
    destructor Destroy; override;

    function Get_rotas(Acod_rota: Integer): TClientDataSet;
    function Get_clientes(): TClientDataSet;

    function SalvarRotas: Boolean;

    property rota_ent: TRotas_entr_class read Frota_ent write Frota_ent;
  end;

var
  rotas: TRotas;

implementation

uses
  uDtmClientes, SysUtils, Forms, StrUtils, uDtmAtivo, Variants, uCadRotasEntrega_Clientes, Math;


procedure definir_rota(Acod_rota: Integer);
var
  rotas_cl: TRotas_Clientes;
begin           
  if not Assigned(DtmClientes) then
    DtmClientes := TDtmClientes.Create(Application);

  rotas_cl := TRotas_Clientes.Create;
  try
    Application.CreateForm(TfrmCadRotasEntrega_Clientes, frmCadRotasEntrega_Clientes);
    frmCadRotasEntrega_Clientes.grid_rotas.DataSource.DataSet    := rotas_cl.Get_rotas(Acod_rota);
    frmCadRotasEntrega_Clientes.grid_clientes.DataSource.DataSet := rotas_cl.Get_clientes();
    frmCadRotasEntrega_Clientes.rotas_cl         := rotas_cl;
    frmCadRotasEntrega_Clientes.edcod_rota.Text  := IntToStr(rotas_cl.rota_ent.cod_rota);
    frmCadRotasEntrega_Clientes.edrota.Text      := rotas_cl.rota_ent.rota;
    frmCadRotasEntrega_Clientes.eddescricao.Text := rotas_cl.rota_ent.descricao;

    frmCadRotasEntrega_Clientes.ShowModal;

  finally
    FreeAndNil(rotas_cl);
  end;
end;

exports
  definir_rota;

{ TRotas }

function TRotas.AddRegiao(Acod_cidade, Acod_localidade: Integer; Aregiao,
  Asetor: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Fregioes.Count - 1 do
    if (Acod_cidade = Fregioes.Items[I].cod_cidade) and (Acod_localidade = Fregioes.Items[I].cod_localidade) then
      Exit;

  if not vDadosIni. PesqPros('CLI241', 'INCLUIR', Format('%s - %s', [Aregiao, Asetor]),
    'ROTAS_ENTR_REGIAO', Format('%s: %d', [IfThen(Acod_cidade > 0, 'CID', 'LOC'),
                                           IfThen(Acod_cidade > 0, Acod_cidade, Acod_localidade)]), buscas) then
    Exit;

  try
    for I := 0 to Fdel_regioes.Count - 1 do
      if (Acod_cidade = Fdel_regioes.Items[I].cod_cidade) and (Acod_localidade = Fdel_regioes.Items[I].cod_localidade) then
      begin
        Fregioes.Add(Fdel_regioes.Items[I].Clone);
        Fdel_regioes.Delete(I);
        Result := True;
        Exit;
      end;

    with Fregioes.New do
    begin
      cod_cidade     := Acod_cidade;
      cod_localidade := Acod_localidade;
      regiao         := Aregiao;
      setor          := Asetor;
      salvo          := 0;
      changed        := 1;
    end;
    Result := True;
  finally
    if Assigned(FregiaoChange) then
      FregiaoChange(0);
  end;
end;

function TRotas.consultaRegiao(Aregiao, Atexto, Acondicao: string): Boolean;
begin
Result := False;
  try
    if Trim(Atexto) = '' then
      raise Exception.Create('Informe um texto para consulta')
    else if (Acondicao = 'Começa') and (Length(Atexto) < 2) then
      raise Exception.Create('Informe pelo menos 2 caracteres para a condição "Começa"')
    else if (Acondicao = 'Está contido') and (Length(Trim(Atexto)) < 3) then
      raise Exception.Create('Informe pelo menos 3 caracteres para a condição "Está contido"');

    if Acondicao = 'Começa' then
      Atexto :=  Atexto + '%'
    else if Acondicao = 'Está contido' then
      Atexto :=  '%' + Atexto + '%';

    if Aregiao = 'Cidade' then
      SqlOpen('select cid.nome_cidade "Regiao", cib.nome_uf "Setor", cid.ibge_cod_cidade "Cod IBGE", cid.cod_cidade "Cod.Cidade", 0 "Cod.Localidade"' +
              ' from cidades cid' +
              ' left join cidades_ibge cib on cib.codigo_mun_ibge = cid.ibge_cod_cidade' +
              ' where cid.nome_cidade ' + IfThen(Acondicao = 'Igual', '= ', 'like ') + QuotedStr(Atexto) +
              ' order by cid.nome_cidade')
    else
      SqlOpen('select loc.localidade "Regiao", s.setor "Setor", loc.cod_localidade "Cod.Localidade", 0 "Cod.Cidade"' +
              ' from localidade loc' +
              ' inner join setor s on s.cod_setor = loc.cod_setor and s.cod_empresa = loc.cod_empresa' +
              ' where ' + IfThen(Aregiao = 'Setor', 's.setor', 'loc.localidade') + ' ' + IfThen(Acondicao = 'Igual', ' = ', ' like ') + QuotedStr(Atexto) +
              ' and loc.cod_empresa = ' + vDadosIni.codEmpresa +
              ' order by loc.localidade');
    Result := not buscas.IsEmpty;

  except on E: Exception do
    begin
      vDadosIni.ShowAtencao('Erro ao consultar. Erro: %s', [e.Message]);
    end;
  end;
end;

constructor TRotas.Create;
begin
  if not Assigned(DtmClientes) then
    DtmClientes := TDtmClientes.Create(Application);

  inherited;
  dataSet            := TClientDataSet(DtmClientes.cdsRota);
  transacao          := DtmClientes.IbTransRotas;
  Fibq               := TIBQuery.Create(dataSet.Owner);
  Fibq.Database      := transacao.DefaultDatabase;
  Fibq.Transaction   := transacao;
  buscas             := TIBQuery(Fibq);

  Fregioes           := THw_regiao_classList.Create;
  Fdel_regioes       := THw_regiao_classList.Create;
end;

function TRotas.Delete: Boolean;
var
  Acodrota: Integer;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CLI236', 'EXCLUIR', Format('%d - %s - %s', [f_int('cod_rota'), f_str('rota'), f_str('descricao')]),
    'ROTAS_ENTR', f_str('cod_rota'), buscas) then
    exit;

  if SqlOpen('select cod_rota, count(cod_rota) contador from ROTAS_ENTR_REGIAO' +
             ' where cod_rota = %d and cod_empresa = %d group by 1', [f_int('cod_rota'), f_int('cod_empresa')]).
    FieldByName('cod_rota').AsInteger = f_int('cod_rota') then
  begin
    vDadosIni.ShowAtencao('Rota possui regiões vinculadas. Total: %d', [buscas.FieldByName('contador').AsInteger]);
    if not vDadosIni.PesqPros('CLI243', 'EXCLUIR', Format('%d - %s - %s - TOT:%d', [f_int('cod_rota'), f_str('rota'), f_str('descricao'), buscas.FieldByName('contador').AsInteger]),
      'ROTAS_ENTR_REGIAO', f_str('cod_rota'), buscas, True, True) then
      Exit;
  end;

  if SqlOpen('select cod_rota, count(cod_rota) contador from ROTAS_ENTR_CLIENTE' +
             ' where cod_rota = %d and cod_empresa = %d group by 1', [f_int('cod_rota'), f_int('cod_empresa')]).
    FieldByName('cod_rota').AsInteger = f_int('cod_rota') then
  begin
    vDadosIni.ShowAtencao('Rota possui clientes vinculados. Total: %d', [buscas.FieldByName('contador').AsInteger]);
    if not vDadosIni.PesqPros('CLI244', 'EXCLUIR', Format('%d - %s - %s - TOT:%d', [f_int('cod_rota'), f_str('rota'), f_str('descricao'), buscas.FieldByName('contador').AsInteger]),
      'ROTAS_ENTR_CLIENTE', f_str('cod_rota'), buscas, True, True) then
      Exit;
  end;
  Acodrota := f_int('cod_rota');

  if inherited Delete then
  begin

    try
      SqlExec('delete from ROTAS_ENTR_REGIAO where cod_rota = %d and cod_empresa = %s', [Acodrota, vDadosIni.codEmpresa]);
      SqlExec('delete from ROTAS_ENTR_CLIENTE where cod_rota = %d and cod_empresa = %s', [Acodrota, vDadosIni.codEmpresa]);

      if Apply then
      begin
        CommitaTransacao;
        vDadosIni.GravaAuditoria('CLI236', 'EXCLUIR', 'SUCESSO', 'ROTAS_ENTR', '', buscas);
      end
      else
      begin
        vDadosIni.GravaAuditoria('CLI236', 'EXCLUIR', 'FALHA', 'ROTAS_ENTR', '', buscas);
      end;

    finally
      RollBackTransacao;
      dataSet.Refresh;
    end;
  end;
end;

function TRotas.DelRegiao(Aindex: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  if (Aindex > -1) and (Aindex <= Fregioes.Count - 1) then
  begin                                                                                                  
    if not vDadosIni. PesqPros('CLI242', 'EXCLUIR', Format('%s - %s', [Fregioes.Items[Aindex].regiao, Fregioes.Items[Aindex].setor]),
      'ROTAS_ENTR_REGIAO', Format('%s: %d', [IfThen(Fregioes.Items[Aindex].cod_cidade > 0, 'CID', 'LOC'),
                                             IfThen(Fregioes.Items[Aindex].cod_cidade > 0, Fregioes.Items[Aindex].cod_cidade,
                                                                                           Fregioes.Items[Aindex].cod_localidade)]), buscas) then
      Exit;

    for I := Aindex to Fregioes.Count - 1 do
      Fregioes.Items[I].changed := 1;

    if Fregioes.Items[Aindex].salvo = 1 then
      Fdel_regioes.Add(Fregioes.Items[Aindex].Clone);
    Fregioes.Delete(Aindex);

    if Assigned(FregiaoChange) then
      FregiaoChange(0);
  end;
end;

destructor TRotas.Destroy;
begin
  if Assigned(Fibq) then FreeAndNil(Fibq);
  if Assigned(Fregioes) then FreeAndNil(Fregioes);
  if Assigned(Fdel_regioes) then FreeAndNil(Fdel_regioes);
  inherited;
end;

function TRotas.Edit: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CLI235', 'ALTERAR', Format('%d - %s - %s', [f_int('cod_rota'), f_str('rota'), f_str('descricao')]),
    'ROTAS_ENTR', f_str('cod_rota'), buscas) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    regiao_iniciar;
  end;
end;

function TRotas.Insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CLI234', 'INSERIR', '',
    'ROTAS_ENTR', '', buscas) then
    exit;

  if not dataSet.Active then
    montaSelect('select * from ROTAS_ENTR where cod_rota = 0 and cod_empresa = 0');
  if inherited Insert then
  begin
    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    Result := True;
    regiao_iniciar;
  end;
end;

function TRotas.MoveRegiao(Aindex, Amove: Integer): Boolean;
var
  AregiaoIndex, AregiaoDest: THw_regiao_class;
begin
  Result := False;

  if (Fregioes.Count <= 0) or
     ((Aindex + Amove) < 0) or
     ((Aindex + Amove) > Fregioes.Count - 1)  then
    Exit;

  AregiaoIndex         := Fregioes.Items[Aindex].Clone;
  AregiaoDest          := Fregioes.Items[Aindex + Amove].Clone;
  AregiaoIndex.changed := 1;
  AregiaoDest.changed  := 1;

  Fregioes.Items[Aindex]         := AregiaoDest;
  Fregioes.Items[Aindex + Amove] := AregiaoIndex;
  Result := True;

  if Assigned(FregiaoChange) then
    FregiaoChange(Amove);
end;

function TRotas.Post: Boolean;
var
  I: Integer;
  Achange: Boolean;
  Arota, Aacao: string;
begin
  try
    Result := false;

    Aacao := IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');
    if not vDadosIni.PesqPros('CLI237', Aacao,
      Format('%d - %s - %s', [f_int('cod_rota'), f_str('rota'), f_str('descricao')]),
      'ROTAS_ENTR', f_str('cod_rota'), buscas) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    checkFieldEmpty('rota',      'Campo rota de preenchimento obrigatorio',  'DBEdit3');
    checkFieldEmpty('descricao', 'Campo decrição da rota de preenchimento obrigatorio', 'DBEdit2');

    Arota := UpperCase(f_str('rota'));
    if (Length(Arota) <> 2) or
      ( vDadosIni.apenasLetras(Arota[1]) = '' ) or
      ( vDadosIni.apenasLetraseNumeros(Arota[2]) = '' ) then
      raiseExceptionCreate('Rota inválida. Por favor informe o primeiro caracter uma letra e o segundo um número. EX''s: A1, A2, A3, B1, C1, C2',  'DBEdit3');

    if not SqlOpen('select cod_rota, rota, descricao from ROTAS_ENTR' +
                   ' where cod_rota <> %d and cod_empresa = %s and rota = %s',
                   [f_int('cod_rota'), vDadosIni.codEmpresa, QuotedStr(f_str('rota'))]).IsEmpty then
    begin
      vDadosIni.ShowAtencao('Rota informada já existem em outro cadastro %s %d - %s - %s',
                            [sLineBreak, buscas.FieldByName('cod_rota').AsInteger,
                             buscas.FieldByName('rota').AsString,
                             buscas.FieldByName('descricao').AsString]);
      if not vDadosIni.PesqPros('CLI238', Aacao,
        Format('%d - %s - %s', [f_int('cod_rota'), f_str('rota'), f_str('descricao')]),
        'ROTAS_ENTR', f_str('cod_rota'), buscas, True, True) then
        Exit;
    end;

    if dataSet.State = dsInsert then
      dataSet.FieldByName('cod_rota').AsInteger := Gencodigo('ROTAS_ENTR', buscas, vDadosIni.codEmpresa);

    dataSet.Post;

    if (dataSet.ChangeCount > 0) then
      Result := Apply
    else
      Result := True;

    for I := 0 to Fdel_regioes.Count - 1 do
      SqlExec('delete from ROTAS_ENTR_REGIAO' +
              ' where cod_rota = %d and cod_empresa = %d and cod_cidade = %d and cod_localidade = %d',
              [f_int('cod_rota'), f_int('cod_empresa'), Fdel_regioes.Items[I].cod_cidade, Fdel_regioes.Items[I].cod_localidade]);

    for I := 0 to Fregioes.Count - 1 do
      if (Fregioes.Items[I].salvo = 0) or (Fregioes.Items[I].changed = 1) then
        SqlExec('update or insert into ROTAS_ENTR_REGIAO(cod_rota, cod_empresa, cod_cidade, cod_localidade, ordem) values (%d, %d, %d, %d, %d) matching (cod_rota, cod_empresa, cod_cidade, cod_localidade);',
                [f_int('cod_rota'), f_int('cod_empresa'), Fregioes.Items[I].cod_cidade, Fregioes.Items[I].cod_localidade, I]);

    CommitaTransacao;

    vDadosIni.GravaAuditoria('CLI237', Aacao, 'SUCESSO', 'ROTAS_ENTR', '', buscas);

    dataSet.Refresh;

  except on E: Exception do
    begin
      RollBackTransacao;
      Result := False;
      registraErro('TRotas.Post Erro: ' + e.Message);
    end;
  end;
end;


procedure TRotas.regiao_iniciar;
begin
  Fdel_regioes.Clear;
  Fregioes.Clear;
  SqlOpen('select loc.cod_localidade, cid.cod_cidade, ' +
          ' case when cid.cod_cidade is null then loc.localidade else cid.nome_cidade end regiao,' +
          ' case when cid.cod_cidade is null then s.setor else cib.nome_uf end setor,' +
          ' 1 salvo, 0 changed, rr.ordem' +
          ' from rotas_entr_regiao rr' +
          ' left join cidades cid on cid.cod_cidade = rr.cod_cidade and rr.cod_localidade = 0' +
          ' left join localidade loc on loc.cod_localidade = rr.cod_localidade and loc.cod_empresa = rr.cod_empresa and rr.cod_cidade = 0' +
          ' left join setor s on s.cod_setor = loc.cod_setor and s.cod_empresa = loc.cod_empresa' +
          ' left join cidades_ibge cib on cib.codigo_mun_ibge = cid.ibge_cod_cidade' +
          ' where rr.cod_rota = %d' +
          ' and rr.cod_empresa = %d' +
          ' order by rr.ordem',
          [dataSet.FieldByName('cod_rota').AsInteger, dataSet.FieldByName('cod_empresa').AsInteger]).First;
  while not buscas.Eof do
  begin
    Fregioes.New.SetValuesFrom(buscas);
    buscas.Next;
  end;
end;

procedure TRotas.show_definir_rotas;
begin
  definir_rota(f_int('cod_rota'));
end;

{ THw_regiao_class }

function THw_regiao_class.Clone: THw_regiao_class;
begin
  Result                := THw_regiao_class.Create;
  Result.cod_localidade := Self.cod_localidade;
  Result.cod_cidade     := Self.cod_cidade;
  Result.regiao         := Self.regiao;
  Result.setor          := Self.setor;
  Result.salvo          := Self.salvo;
  Result.changed        := Self.changed;
end;

procedure THw_regiao_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_localidade := ADataSet.FieldByName('COD_LOCALIDADE').AsInteger;
  Fcod_cidade     := ADataSet.FieldByName('COD_CIDADE').AsInteger;
  Fregiao         := Trim(ADataSet.FieldByName('REGIAO').AsString);
  Fsetor          := Trim(ADataSet.FieldByName('SETOR').AsString);
  Fsalvo          := ADataSet.FieldByName('SALVO').AsInteger;
  Fchanged        := ADataSet.FieldByName('CHANGED').AsInteger;
end;

{ THw_regiao_classList }

function THw_regiao_classList.GetItem(Index: Integer): THw_regiao_class;
begin
  Result := THw_regiao_class(inherited Items[Index]);
end;

function THw_regiao_classList.New: THw_regiao_class;
begin
  Result := THw_regiao_class.Create;
  Add(Result);
end;

procedure THw_regiao_classList.SetItem(Index: Integer; const Value: THw_regiao_class);
begin
  Put(Index, Value);
end;

{ TRotas_Clientes }

procedure TRotas_Clientes.configurarDataSet(AdataSet: TClientDataSet);
var
  I: Integer;
  Adisplay: string;
begin
  for I := 0 to AdataSet.Fields.Count - 1 do with AdataSet.Fields[I] do
  begin
    Adisplay     := Trim(StringReplace(LowerCase(FieldName), '_', ' ', [rfReplaceAll, rfIgnoreCase]));
    DisplayLabel := UpperCase(Copy(Adisplay, 1, 1)) + Copy(Adisplay, 2, Length(Adisplay));
    Visible := False;
  end;

  AdataSet.FieldByName('dest_seqid').Visible   := True;
//  AdataSet.FieldByName('rota').Visible         := True;
  AdataSet.FieldByName('setor').Visible        := True;
  AdataSet.FieldByName('localidade').Visible   := True;
  AdataSet.FieldByName('email').Visible        := True;
  AdataSet.FieldByName('telefone').Visible     := True;
  AdataSet.FieldByName('uf').Visible           := True;
  AdataSet.FieldByName('cidade').Visible       := True;
  AdataSet.FieldByName('cep').Visible          := True;
  AdataSet.FieldByName('bairro').Visible       := True;
  AdataSet.FieldByName('complemento').Visible  := True;
  AdataSet.FieldByName('numero').Visible       := True;
  AdataSet.FieldByName('logradouro').Visible   := True;
  AdataSet.FieldByName('tipo_end').Visible     := True;
  AdataSet.FieldByName('insc_est').Visible     := True;
  AdataSet.FieldByName('cpfcgc').Visible       := True;
  AdataSet.FieldByName('razao').Visible        := True;
  AdataSet.FieldByName('nome_cliente').Visible := True;
  AdataSet.FieldByName('cod_cliente').Visible  := True;

  AdataSet.FieldByName('dest_seqid').DisplayLabel   := 'Cod.End';
//  AdataSet.FieldByName('rota').DisplayLabel         := 'Rota';
  AdataSet.FieldByName('setor').DisplayLabel        := 'Setor';
  AdataSet.FieldByName('localidade').DisplayLabel   := 'Localidade';
  AdataSet.FieldByName('email').DisplayLabel        := 'email';
  AdataSet.FieldByName('telefone').DisplayLabel     := 'Telefone';
  AdataSet.FieldByName('uf').DisplayLabel           := 'UF';
  AdataSet.FieldByName('cidade').DisplayLabel       := 'Cidade';
  AdataSet.FieldByName('cep').DisplayLabel          := 'CEP';
  AdataSet.FieldByName('bairro').DisplayLabel       := 'Bairro';
  AdataSet.FieldByName('complemento').DisplayLabel  := 'Complemento';
  AdataSet.FieldByName('numero').DisplayLabel       := 'Num';
  AdataSet.FieldByName('logradouro').DisplayLabel   := 'Logr';
  AdataSet.FieldByName('tipo_end').DisplayLabel     := 'Tp End';
  AdataSet.FieldByName('insc_est').DisplayLabel     := 'Insc.Est';
  AdataSet.FieldByName('cpfcgc').DisplayLabel       := 'CPF/CNPJ';
  AdataSet.FieldByName('razao').DisplayLabel        := 'Cliente/Razão';
  AdataSet.FieldByName('nome_cliente').DisplayLabel := 'Cliente/Nome';
  AdataSet.FieldByName('cod_cliente').DisplayLabel  := 'Cod. Cliente';
    

  AdataSet.FieldByName('dest_seqid').Index   := 0;
//  AdataSet.FieldByName('rota').Index         := 0;
  AdataSet.FieldByName('setor').Index        := 0;
  AdataSet.FieldByName('localidade').Index   := 0;
  AdataSet.FieldByName('email').Index        := 0;
  AdataSet.FieldByName('telefone').Index     := 0;
  AdataSet.FieldByName('uf').Index           := 0;
  AdataSet.FieldByName('cidade').Index       := 0;
  AdataSet.FieldByName('cep').Index          := 0;
  AdataSet.FieldByName('bairro').Index       := 0;
  AdataSet.FieldByName('complemento').Index  := 0;
  AdataSet.FieldByName('numero').Index       := 0;
  AdataSet.FieldByName('logradouro').Index   := 0;
  AdataSet.FieldByName('tipo_end').Index     := 0;
  AdataSet.FieldByName('insc_est').Index     := 0;
  AdataSet.FieldByName('cpfcgc').Index       := 0;
  AdataSet.FieldByName('razao').Index        := 0;
  AdataSet.FieldByName('nome_cliente').Index := 0;
  AdataSet.FieldByName('cod_cliente').Index  := 0;
end;

constructor TRotas_Clientes.Create();
begin
//  Ffb_t := TIBTransaction.Create(dtmAtivo.bancoHw.Owner);
//  Ffb_t.DefaultDatabase := dtmAtivo.bancoHw;
//  Ffb_t.Params.Clear;
//  Ffb_t.Params.Add('read_committed');
//  Ffb_t.Params.Add('rec_version');
//  Ffb_t.Params.Add('nowait');

//  transacao := TIBTransaction(Ffb_t);

//  Ffb_q               := TIBQuery.Create(Ffb_t.Owner);
//  Ffb_q.Database      := transacao.DefaultDatabase;
//  Ffb_q.Transaction   := transacao;

//  buscas             := TIBQuery(Ffb_q);

  transacao := Create_fb_transaction(dtmAtivo.bancoHw);
  buscas := Create_fb_query(transacao);

  Frotas  := TClientDataSet.Create(buscas.Owner);
  Fclientes := TClientDataSet.Create(buscas.Owner);  
end;

destructor TRotas_Clientes.Destroy;
begin
//  if Assigned(Ffb_q) then
//  begin
//    if Ffb_q.Active then
//      Ffb_q.Close;
//
//    FreeAndNil(Ffb_q);
//  end;
//
//  if Assigned(Ffb_t) then
//  begin
//    if Ffb_t.InTransaction then
//      Ffb_t.Rollback;
//
//    FreeAndNil(Ffb_t);
//  end;

  if Assigned(Fclientes) then
    FreeAndNil(Fclientes);

  if Assigned(Frotas) then
    FreeAndNil(Frotas);

  inherited;
end;

function TRotas_Clientes.Get_clientes(): TClientDataSet;
var
  I: Integer;
begin
  SqlOpen('select cons.ordem, cd.*' +
          ' from (select rr.cod_empresa, rr.cod_cidade, rr.ordem' +
          '       from rotas_entr r' +
          '       inner join rotas_entr_regiao rr on rr.cod_rota = r.cod_rota and rr.cod_empresa = r.cod_empresa and rr.cod_localidade = 0' +
          '       where r.cod_rota = %d and r.cod_empresa = %s' +
          '       order by rr.ordem) as cons' +
          ' join sp_clientes_dest(null, cons.cod_empresa, null, cons.cod_cidade, null) cd on 1 = 1' +
          ' where cd.ativo = 1' +
          ' union' +
          ' select cons.ordem, cd.*' +
          ' from (select rr.cod_empresa, rr.cod_localidade, rr.ordem' +
          '       from rotas_entr r' +
          '       inner join rotas_entr_regiao rr on rr.cod_rota = r.cod_rota and rr.cod_empresa = r.cod_empresa and rr.cod_cidade = 0' +
          '       where r.cod_rota = %d and r.cod_empresa = %s' +
          '       order by rr.ordem) as cons' +
          ' join sp_clientes_dest(null, cons.cod_empresa, null, null, cons.cod_localidade) cd on 1 = 1' +
          ' where cd.ativo = 1' +
          ' order by 1', [Fcod_rota, vDadosIni.codEmpresa, Fcod_rota, vDadosIni.codEmpresa]);

//  SqlOpen('select rr.ordem, cd.* from rotas_entr r' +
//          ' inner join rotas_entr_regiao rr on rr.cod_rota = r.cod_rota and rr.cod_empresa = r.cod_empresa and rr.cod_localidade = 0' +
//          ' inner join vw_clientes_dest cd on cd.cod_empresa = rr.cod_empresa and cd.cod_cidade = rr.cod_cidade' + // -- and cd.rota = r.rota
//          ' where r.cod_rota = %d and r.cod_empresa = %s' +
//          ' union' +
//          ' select rr.ordem, cd.* from rotas_entr r' +
//          ' inner join rotas_entr_regiao rr on rr.cod_rota = r.cod_rota and rr.cod_empresa = r.cod_empresa and rr.cod_cidade = 0' +
//          ' inner join vw_clientes_dest cd on cd.cod_empresa = rr.cod_empresa and cd.cod_localidade = rr.cod_localidade' + //--and cd.rota = r.rota
//          ' where r.cod_rota = %d and r.cod_empresa = %s' +
//          ' order by 1', [Fcod_rota, vDadosIni.codEmpresa, Fcod_rota, vDadosIni.codEmpresa]);

  if not Fclientes.Active then
  begin
    Result := TClientDataSet(Fclientes);

    for I := 0 to buscas.FieldCount - 1 do with buscas.Fields[I] do
      Fclientes.FieldDefs.Add(FieldName, DataType, Size, False);
//    Fclientes.FieldDefs.Add('ENDERECO_COMPLETO', ftString, 512, False);
    Fclientes.CreateDataSet;
  end
  else
    Result := Fclientes;

  configurarDataSet(Fclientes);

  Result.EmptyDataSet;
  buscas.First;
  while not buscas.Eof do
  begin
    if not Frotas.Locate('COD_CLIENTE;DEST_SEQID', VarArrayOf([buscas.FieldByName('COD_CLIENTE').AsInteger,
                                                               buscas.FieldByName('DEST_SEQID').AsInteger]), []) then
    begin
      Result.Append;
      for I := 0 to buscas.FieldCount - 1 do with buscas.Fields[I] do
        Result.FieldByName(FieldName).Value := Value;
//    with Result do
//      FieldByName('endereco_completo').AsString := FieldByName('logradouro').AsString +
//                                                   IfThen(Trim(FieldByName('numero').AsString) <> '', ', ' + FieldByName('numero').AsString) +
//                                                   IfThen(Trim(FieldByName('complemento').AsString) <> '', ' ' + FieldByName('complemento').AsString) +
//                                                   IfThen(Trim(FieldByName('bairro').AsString) <> '', ' - ' + FieldByName('bairro').AsString) +
//                                                   IfThen(Trim(FieldByName('cep').AsString) <> '', '. ' + FieldByName('cep').AsString) +
//                                                   IfThen(Trim(FieldByName('cidade').AsString) <> '', ' ' + FieldByName('cidade').AsString) +
//                                                   IfThen(Trim(FieldByName('uf').AsString) <> '', '-' + FieldByName('uf').AsString);
      Result.Post;
    end;
    buscas.Next;
  end;
  buscas.Close;
end;

function TRotas_Clientes.Get_rotas(Acod_rota: Integer): TClientDataSet;
var
  I: Integer;
begin
  Fcod_rota := Acod_rota;

  if not Assigned(Frota_ent) then
    Frota_ent := TRotas_entr_class.Create;
  Frota_ent.SetValuesFrom(SqlOpen('select ' + TRotas_entr_class.GetFieldsSql() + ' from rotas_entr' +
                                  ' where cod_rota = %d and cod_empresa = %s',
                                  [Fcod_rota, vDadosIni.codEmpresa]));

  SqlOpen('select cons.ordem, cd.*' +
          ' from (select rc.cod_cliente, rc.cod_empresa, rc.end_doc_add_seqid, rc.ordem' +
          '       from rotas_entr r' +
          '       inner join rotas_entr_cliente rc on rc.cod_rota = r.cod_rota and rc.cod_empresa = r.cod_empresa' +
          '       where r.cod_rota = %d and r.cod_empresa = %s' +
          '       order by rc.ordem) as cons' +
          ' inner join sp_clientes_dest(cons.cod_cliente, cons.cod_empresa, cons.end_doc_add_seqid, null, null) cd on 1 = 1' +
          ' where cd.ativo = 1' +
          ' order by cons.ordem', [Fcod_rota, vDadosIni.codEmpresa]);

//  SqlOpen('select rc.ordem, cd.* from rotas_entr r' +
//          ' inner join rotas_entr_cliente rc on rc.cod_rota = r.cod_rota and rc.cod_empresa = r.cod_empresa' +
//          ' inner join vw_clientes_dest cd on cd.cod_cliente = rc.cod_cliente and cd.cod_empresa = rc.cod_empresa and cd.dest_seqid = rc.end_doc_add_seqid' +
//          ' where r.cod_rota = %d and r.cod_empresa = %s ' +
//          ' order by rc.ordem',
//          [Fcod_rota, vDadosIni.codEmpresa]);

  if not Frotas.Active then
  begin
    Result  := TClientDataSet(Frotas);
    dataSet := TClientDataSet(Frotas);

    for I := 0 to buscas.FieldCount - 1 do with buscas.Fields[I] do
      Frotas.FieldDefs.Add(FieldName, DataType, Size, False);
//    Frotas.FieldDefs.Add('ENDERECO_COMPLETO', ftString, 512, False);
    Frotas.CreateDataSet;

    configurarDataSet(Frotas);
  end
  else
    Result := dataSet;

  Result.EmptyDataSet;
  buscas.First;
  while not buscas.Eof do
  begin
    Result.Append;
    for I := 0 to buscas.FieldCount - 1 do with buscas.Fields[I] do
      Result.FieldByName(FieldName).Value := Value;
//    with Result do
//      FieldByName('endereco_completo').AsString := FieldByName('logradouro').AsString +
//                                                   IfThen(Trim(FieldByName('numero').AsString) <> '', ', ' + FieldByName('numero').AsString) +
//                                                   IfThen(Trim(FieldByName('complemento').AsString) <> '', ' ' + FieldByName('complemento').AsString) +
//                                                   IfThen(Trim(FieldByName('bairro').AsString) <> '', ' - ' + FieldByName('bairro').AsString) +
//                                                   IfThen(Trim(FieldByName('cep').AsString) <> '', '. ' + FieldByName('cep').AsString) +
//                                                   IfThen(Trim(FieldByName('cidade').AsString) <> '', ' ' + FieldByName('cidade').AsString) +
//                                                   IfThen(Trim(FieldByName('uf').AsString) <> '', '-' + FieldByName('uf').AsString);
    Result.Post;
    buscas.Next;
  end;
  buscas.Close;
end;

function TRotas_Clientes.SalvarRotas: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CLI240', 'SALVAR', Format('%d - %s - %s', [Frota_ent.cod_rota, Frota_ent.rota, Frota_ent.descricao]),
    'ROTAS_ENTR_CLIENTE', '', buscas, False) then
    Exit;

  Result := True;
  try

    Fclientes.DisableControls;
    Frotas.DisableControls;
    try

      Fclientes.First;
      while not Fclientes.Eof do
      begin
        SqlExec('delete from ROTAS_ENTR_CLIENTE' +
                ' where cod_rota = %d and cod_empresa = %s and cod_cliente = %d and end_doc_add_seqid = %d',
                [Fcod_rota, vDadosIni.codEmpresa, Fclientes.FieldByName('cod_cliente').AsInteger, Fclientes.FieldByName('dest_seqid').AsInteger]);
        Fclientes.Next;
      end;

      Frotas.First;
      while not Frotas.Eof do
      begin
        SqlExec('update or insert into ROTAS_ENTR_CLIENTE(cod_rota, cod_empresa, cod_cliente, end_doc_add_seqid, ordem) values (%d, %s, %d, %d, %d) matching (cod_rota, cod_empresa, cod_cliente, end_doc_add_seqid);',
                [Fcod_rota, vDadosIni.codEmpresa, f_int('cod_cliente'), f_int('dest_seqid'), Frotas.RecNo]);
        Frotas.Next;
      end;

      CommitaTransacao;

      vDadosIni.GravaAuditoria('CLI240', 'SALVAR', Format('%s - Definidas: %d  - Não definidas: %d', ['SUCESSO', Frotas.RecordCount, Fclientes.RecordCount]),
        'ROTAS_ENTR_CLIENTE', '', buscas);

    finally
      Fclientes.EnableControls;
      Frotas.EnableControls;
    end;

  except on E: Exception do
    begin
      Result := False;
      vDadosIni.registraErro('TRotas_Clientes.SalvarRotas ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar rotas: ' + e.Message);
    end;
  end;
end;

end.
