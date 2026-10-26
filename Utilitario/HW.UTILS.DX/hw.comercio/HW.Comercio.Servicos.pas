unit HW.Comercio.Servicos;

interface

uses
  System.Classes,
  System.DateUtils,
  HW.Servicos,
  HW.Comercio.Api.Comercio,
  HW.Comercio.Api.Lojista,
  HW.Comercio.Api.Produto,
  HW.Comercio.Api.Pedido,
  HW.Comercio.Api.Rest;

const
  COM_URL_API_PROD         = 'https://hdeskpro.com.br/webapihdesk/api';
  COM_URL_API_HW           = 'http://hwsistemas.homelinux.com/apihdesk/api';
  COM_DADOS_LOJISTA_SINC   = 'ca_sinc_lojista';// dados do lojista sincronizados
  COM_SERV_TOKEN_API       = 'ca_api_access_token';
  COM_DADOS_CONS_PEDIDO    = 'ca_last_cons';
  COM_DADOS_LAST_PED_NOT   = 'ca_last_ped_not';
//  COM_STS_CONSULTANDO      = 'Consultando';
//  COM_STS_CONCLUIDA        = 'Concluida';
//  COM_STS_SEM_CONSULTA     = 'Sem Consulta';
//  COM_STS_ERROR            = 'Erro';
//  COM_STS_ERROR_API        = 'ErroApi';
//http://hwsistemas.homelinux.com/apihdesk/api/security/token

type

  THwComercioServicos = class(THwServicos)
  private
    comercioServiceApi: TComercioServiceApi;
    procedure AfterLogin(Sender: TObject);
  protected
    function GetDadosApi: Boolean; override;
    function UrlImagensResolver(LocalList, UrlList: TStrings; PathImgs: string; var UpdateImagens: Boolean): TStrings;
    function GetLojistaDb: TLojista;
    procedure Comercio_LojistaEnviar;
    procedure Comercio_UltimoPedidoBaixar;
  public
    constructor Create(SilentMode: Boolean); override;
    destructor Destroy; override;

    procedure Comercio_ProdutoEnviar(Periodico: Boolean; grupoprod: Integer = 0; codprod: string = ''; codgrade: Integer = 0);
    procedure Comercio_Notificacoes(cod_usuario: Integer; var dadosnotificacao: string);
  end;

implementation

uses
  HW.Utils.Classes.Registros_DX,
  config_sistema_class,
  hw_utils,
  System.StrUtils,
  System.SysUtils,
  System.Math,
  HW.Comercio.Api.ImagemProduto,
  HW.KeyValue,
  IBX.IBQuery,
  System.Generics.Collections,
  REST.Json, Winapi.Windows, HW.Utils.Classes.Funcoes_DX, HW.Json;

{ THwComercioServicos }

procedure THwComercioServicos.AfterLogin(Sender: TObject);

begin
  if Sender <> nil then
      begin
        try
          TComercioTokenApi(Sender).DataLogin := SqlOpen('select current_ts as dh from sp_current_ts').FieldByName('dh').AsDateTime;
          TComercioTokenApi(Sender).DataHoraAtual := TComercioTokenApi(Sender).DataLogin;
        except
        end;
        SaveJSON(COM_SERV_TOKEN_API, TJson.ObjectToJsonString(TComercioTokenApi(Sender)));
      end;
end;

procedure THwComercioServicos.Comercio_LojistaEnviar;
var
  lojistaapi: TLojista;
  dbLojista: TLojista;
  sincLojista: TLojista;
  UrlImagem, RetornoApi: TStrings;
begin
  try

    dbLojista   := GetLojistaDb;
    sincLojista := THwClassRegistros.FromJsonString<TLojista>(GetJson(COM_DADOS_LOJISTA_SINC));

    if sincLojista <> nil then
      if dbLojista.NomeFantasia.Equals(sincLojista.NomeFantasia) and
         dbLojista.CpfCnpj.Equals(sincLojista.CpfCnpj) and
         dbLojista.Email.Equals(sincLojista.Email) and
         dbLojista.Celular.Equals(sincLojista.Celular) and
         //dbLojista.Senha.Equals(sincLojista.Senha) and
         dbLojista.CidadeId.ToString.Equals(sincLojista.CidadeId.ToString) and
         //dbLojista.LinkLogo.Equals(sincLojista.LinkLogo) and
         dbLojista.WebSite.Equals(sincLojista.WebSite) then
        Exit;

    if (not dbLojista.LinkLogo.StartsWith('http')) and (not dbLojista.LinkLogo.IsEmpty) then
    begin
      if FileExists(dbLojista.LinkLogo) then
      begin
        UrlImagem := NewStringList(dbLojista.LinkLogo);

        RetornoApi := comercioServiceApi.ImagensUpload(UrlImagem);

        if (UrlImagem.Count = RetornoApi.Count) and (RetornoApi.Count > 0) then
          dbLojista.LinkLogo := RetornoApi[0]
        else
          dbLojista.LinkLogo := EmptyStr;

        with SqlExec('update config_api set linklogo = %s' +
                     ' where api = ''COMERCIOABERTO'' and cod_empresa = %d',
                     [dbLojista.LinkLogo.QuotedString, CodEmpresa]) do
          if Transaction.InTransaction then
            Transaction.Commit;
      end
      else
        dbLojista.LinkLogo := '';
    end;

    dbLojista.LinkLogo := dbLojista.LinkLogo.Replace(UrlApi, '');
    if (dbLojista.LinkLogo.Length > 0) and (StrIn(dbLojista.LinkLogo[1], ['/', '\'])) then
      dbLojista.LinkLogo := dbLojista.LinkLogo.Substring(1, dbLojista.LinkLogo.Length - 1);

    if sincLojista <> nil then
      lojistaapi := comercioServiceApi.LojistaAlterar(dbLojista)
    else
      lojistaapi := comercioServiceApi.LojistaInserir(dbLojista);

    if lojistaapi = nil then
    begin
      if comercioServiceApi.LastError.Msg.Equals('Lojista já cadastrado') then
        lojistaapi := comercioServiceApi.LojistaAlterar(dbLojista)
      else if comercioServiceApi.LastError.Msg.Equals('Lojista não encontrado') then
        lojistaapi := comercioServiceApi.LojistaInserir(dbLojista);

      if lojistaapi = nil then
        if comercioServiceApi.LastError.Msg <> '' then
          raise Exception.Create(Format('%s %s', [comercioServiceApi.LastError.Msg, comercioServiceApi.LastError.Exception]));
    end;

    if lojistaapi <> nil then
      SaveJSON(COM_DADOS_LOJISTA_SINC, TJson.ObjectToJsonString(dbLojista));

  except on E: Exception do
    begin
      LogError('THwComercioServicos.Comercio_LojistaInserir %s', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao enviar Lojista para Api' + sLineBreak + e.Message);
    end;
  end;
end;

procedure THwComercioServicos.Comercio_Notificacoes(cod_usuario: Integer; var dadosnotificacao: string);
var
  conf: TConfig_sistema_class;
  I: Integer;
  consulta: TComercioConsulta;
  pedidos: TArray<TPedido>;
  ped, lastPedNot: TPedido;
  mensagem: string;
  qtde: Integer;
begin
  dadosnotificacao := '';
  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try
      if not GetCNPJ then
        raise Exception.Create('CNPJ não localizado para empresa ' + IntToStr(CodEmpresa));

      consulta := TJsonHw.ToObject<TComercioConsulta>(GetJson(COM_DADOS_CONS_PEDIDO));

      if consulta = nil then
        Exit;

      pedidos := TJsonHw.ToArrayObject<TPedido>(consulta.rows);

      if Length(pedidos) = 0 then
        Exit;

      lastPedNot := TJsonHw.ToObject<TPedido>(GetJson(cod_usuario.ToString + COM_DADOS_LAST_PED_NOT));

      ped := pedidos[Low(pedidos)];

      conf := TConfig_sistema_class.Create;

      if (lastPedNot = nil) or (ped.Id > lastPedNot.Id) then
        conf.WriteString('Notificacao', 'Titulo', Format('Novo Pedido %d %s Comércio Aberto(%d)', [ped.Id, DateTimeToStr(ped.DataPedido), consulta.total]))
      else
        conf.WriteString('Notificacao', 'Titulo', Format('Pedido %d %s Comércio Aberto(%d)', [ped.Id, DateTimeToStr(ped.DataPedido), consulta.total]));

      qtde := 0;
      for I := Low(ped.Itens) to High(ped.Itens) do
        qtde := Trunc(ped.Itens[I].Quantidade) + qtde;

      if ped.Cliente <> nil then
      begin
        mensagem := Format('%s Fone:%s aguarda contato', [ped.Cliente.Nome,  ped.Cliente.Telefone]);
        mensagem := mensagem + IfThen(not ped.Cliente.Observacao.Trim.IsEmpty, ' ' + ped.Cliente.Observacao.Trim);
      end
      else
        mensagem := Format('Pedido aguardando contato', [ped.Cliente.Nome,  ped.Cliente.Telefone]);

      if Length(ped.Itens) > 0 then
        mensagem := mensagem + Format(' %d item(s)', [qtde]);

      conf.WriteString('Notificacao', 'Mensagem', mensagem);

      dadosnotificacao := conf.value1_b.Text;

      conf.Free;

      SaveJSON(cod_usuario.ToString + COM_DADOS_LAST_PED_NOT, TJsonHw.ToJsonString(ped));

    except on E: Exception do
      begin
        LogError('THwComercioServicos.Comercio_Notificacoes %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao obter Notificações ' + sLineBreak + e.Message);
      end;
    end;

  finally
    desconectar;
  end;
end;

procedure THwComercioServicos.Comercio_ProdutoEnviar(Periodico: Boolean;
  grupoprod: Integer; codprod: string; codgrade: Integer);
var
  Confs: TConfig_sistema_classList;
//  comercioServiceApi: TComercioServiceApi;
  produto, produtoApi: TProduto;
  imagens: TArray<TImagemProduto>;
  img: TImagemProduto;
  UrlResolvidas, FileList, ListUrlsResolver: TStrings;
  vsql, pathImagens: string;
  I, J, Z, Y, lastSeqId: Integer;
  UpdateListUrl: Boolean;
  keys: TObjectList<TKeyValue>;
  key: TKeyValue;
  arraygrade: array[1..2] of Integer;

  listaImagem, listaUrl, listaCodImg: TStringList;
  listaImagemTmp, listaURLTmp, listaCodImgTmp: TStringList;
begin
  listaImagem := TStringList.Create;
  listaUrl := TStringList.Create;
  listaCodImg := TStringList.Create;

  listaImagemTmp := TStringList.Create;
  listaURLTmp := TStringList.Create;
  listaCodImgTmp := TStringList.Create;

  listaImagem.Clear;
  listaUrl.Clear;
  listaCodImg.Clear;

  listaImagemTmp.Clear;
  listaURLTmp.Clear;
  listaCodImgTmp.Clear;

  if not conectar(DataBasePath, True)  then
    Exit;

  try
    try
      if not GetCNPJ then
        raise Exception.Create('CNPJ não localizado para empresa ' + IntToStr(CodEmpresa));

      //LoadToken é chamado no metotodo GetDadosApi
      if (not GetDadosApi) then// obtem hora do servidor no metodo GetCNPJ
        Exit;

      Comercio_LojistaEnviar;

      if Periodico then
        Comercio_UltimoPedidoBaixar;

      Confs := TConfig_sistema_classList.Create;
      Confs.AddKey('comercio_aberto_controle_est_manual')
           .AddKey('prod_cad_diretorio_padrao_imagens')
           .AddKey('comercio_aberto_ultimo_produto_seqid')
           .MakeAll(QrAux, CodEmpresa);

      pathImagens    := Confs.GetConf('prod_cad_diretorio_padrao_imagens').value1_vc;
      lastSeqId      := Confs.GetConf('comercio_aberto_ultimo_produto_seqid').AsInteger;

      with ClientOOP(IfThen(Periodico,
                           (Format('SELECT FIRST %d PEC.SEQID_CA ORD1, PEC.*' +
                                   ' FROM VW_PRODUTOS_EC PEC WHERE API = %s' +
                                   ' AND COALESCE(PEC.SEQID_CA, 0 ) > %d AND PEC.COM_GRADE = 0',
                                   [10, 'COMERCIOABERTO'.QuotedString, lastSeqId]) +
                            Format(' UNION' +
                                   ' SELECT FIRST %d PEC.SEQID_CA ORD1, PEC.*' +
                                   ' FROM VW_PRODUTOS_EC PEC WHERE API = %s' +
                                   ' AND COALESCE(PEC.SEQID_CA, 0 ) > %d AND PEC.COM_GRADE = 1',
                                   [10, 'COMERCIOABERTO'.QuotedString, lastSeqId]) +
                                   ' ORDER BY 1'),
                           (Format('SELECT FIRST %d * FROM VW_PRODUTOS_EC PEC WHERE API = %s' +
                                   ' AND PEC.GRUPO_PROD = %d AND PEC.COD_PROD = %s AND PEC.COD_EMPRESA = %d' +
                                   ' AND PEC.COD_GRADE = %d',
                                   [10, 'COMERCIOABERTO'.QuotedString,  grupoprod, codprod.QuotedString, CodEmpresa, codgrade]))
                          )
                   ) do
        while not DataSet.Eof do
        begin

          {$REGION 'alimentando produto e enviando dados'}
          produto                    := TProduto.Create();
          produto.Id                 := fint('id_comercio_aberto');
          produto.Ativo              := fequals('env_comercio_aberto', 'S') and fequals('ativo', '1') ;

          if produto.Ativo then
          begin


            produto.Codigo             := fstr('reference');
            produto.Descricao          := fstr('descr_prod_res') + IfThen(not fempty('grade1'), ' ' + fstr('grade1')) +
                                                                   IfThen((not fempty('grade2')) and (fempty('grade1') <> fempty('grade2')), ' ' + fstr('grade2'));            ;
            produto.DescricaoCompleta  := SqlOpen('select descr_prod_compl from produtos_ec' +
                                                  ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d',
                                                  [fint('grupo_prod'), fstrq('cod_prod'), CodEmpresa]).FieldByName('descr_prod_compl').AsString;
            if Confs.GetConf('comercio_aberto_controle_est_manual').AsBoolean then
              produto.Estoque          := ffloat(IfThen(fequals('com_grade', '1'), 'manual_est_disp_grade', 'manual_est_disp'))
            else
              produto.Estoque          := ffloat(IfThen(fequals('com_grade', '1'), 'est_disp_grade'       , 'est_disp'));

            produto.Tipo               := fint('tipo');

            if fequals('preco_a_combinar_ca', 'S') then
            begin
              produto.Valor            := 0;
              produto.ValorPromocao    := 0;
            end
            else
            begin
              produto.Valor            := ffloat(IfThen(ffloat('api_preco_tabela') > 0, 'api_preco_tabela', 'preco_tabela'), -2);
              produto.ValorPromocao    := ffloat('valorpromocao', -2);
              if not fnull('datainiciopromocao') then
                produto.DataInicioPromocao := fdatet('datainiciopromocao') + StrToTimeDef(fstr('horainiciopromocao'), 0);//TTimeZone.Local.ToUniversalTime(fdatet('datainiciopromocao') + StrToTimeDef(fstr('horainiciopromocao'), 0));
              if not fnull('datafimpromocao') then
                produto.DataFimPromocao    := fdatet('datafimpromocao') + StrToTimeDef(fstr('horafimpromocao'), 0);//TTimeZone.Local.ToUniversalTime(fdatet('datafimpromocao') + StrToTimeDef(fstr('horafimpromocao'), 0));
            end;

            I := 0;
//            keys := TObjectList<TKeyValue>.Create;
            with SqlOpen(Format(' select first 1 cod_grade, lista_imagens, url_imagens, cod_imagens from retorna_img_prod(%d, %s, %d, %d)',
                                [fint('grupo_prod'), fstrq('cod_prod'), 0, CodEmpresa]) +
                         Format(' union' +
                                ' select first 1 cod_grade, lista_imagens, url_imagens, cod_imagens from retorna_img_prod(%d, %s, %d, %d)',
                                [fint('grupo_prod'), fstrq('cod_prod'), fint('cod_grade'), CodEmpresa]), QrAux) do
            while not QrAux.eof do
            begin
              listaImagem.Add(QrAux.FieldByName('lista_imagens').AsWideString);
              listaUrl.Add(QrAux.FieldByName('lista_imagens').AsWideString);
              if trim(QrAux.FieldByName('cod_imagens').AsString) <> '' then
                listaImagem.Add(QrAux.FieldByName('cod_imagens').AsString);

//              key := TKeyValue.Create;
//              key.Key := QrAux.FieldByName('lista_imagens').AsWideString;
//              key.Value := QrAux.FieldByName('url_imagens').AsWideString;
//
//              keys.Add(key);

              arraygrade[I] := QrAux.FieldByName('cod_grade').AsInteger;

              if I = 0 then
               I := 1;

              QrAux.Next;
            end;
            QrAux.Close;

            J := 0;
            SetLength(imagens, 0);
            FileList := NewStringList();
            ListUrlsResolver := NewStringList();
            for Z := 0 to listaImagem.Count - 1 do //for key in keys do
            begin
              if listaCodImg.Count <= 0 then
              begin
                FileList.Text := listaImagem[Z]; //key.Key;
                ListUrlsResolver.Text := listaUrl[Z]; //key.Value;

                                            //6LfwACkTAAAAANgr2YY8hduMMNSftVwTJIOA59IW
                UrlResolvidas    := UrlImagensResolver(FileList, ListUrlsResolver, pathImagens, UpdateListUrl);

                if UpdateListUrl then
                begin
                  QrAux.Close;
                  QrAux.SQL.Text := Format(' update PRODUTOS_IMAGENS set url_imagens = :url_imagens ' +
                                           ' where grupo_prod = %d ' +
                                           ' and cod_prod = %s ' +
                                           ' and cod_empresa = %d ' +
                                           ' and cod_grade = %d',
                                           [grupoprod, codprod.QuotedString, CodEmpresa, arraygrade[J]]);
                  QrAux.ParamByName('url_imagens').AsString := UrlResolvidas.Text;
                  QrAux.ExecSQL;
                  if QrAux.Transaction.InTransaction then
                    QrAux.Transaction.Commit;
                end;
                if J = 0 then
                 J := 1;

                for I := 0 to UrlResolvidas.Count - 1 do
                  if Length(imagens) < 5 then
                  begin
                    SetLength(imagens, Length(imagens) + 1);

                    img := TImagemProduto.Create;
                    img.ProdutoId := produto.Id;
                    img.Link := UrlResolvidas[I];

                    img.Link := img.Link.Replace(UrlApi, '');
                    if (img.Link.Length > 0) and (StrIn(img.Link[1], ['/', '\'])) then
                      img.Link := img.Link.Substring(1, img.Link.Length - 1);

                    imagens[High(imagens)] := img;
                  end;
              end
              else
              begin
                listaImagemTmp.Text := listaImagem[Z];
                listaURLTmp.Text := listaURLTmp[Z];
                listaCodImgTmp.Text := listaCodImg[Z];

                for Y := 0 to listaImagemTmp.Count do
                begin
                  FileList.Text := listaImagemTmp[Y];
                  ListUrlsResolver.Text := listaURLTmp[Y];

                  UrlResolvidas    := UrlImagensResolver(FileList, ListUrlsResolver, pathImagens, UpdateListUrl);

                  if UpdateListUrl then
                  begin
                    QrAux.Close;
                    QrAux.SQL.Text := Format(' update PRODUTOS__GRADE_IMAGENS set url_imagens = :url_imagens ' +
                                             ' where grupo_prod = %d ' +
                                             ' and cod_prod = %s ' +
                                             ' and cod_empresa = %d ' +
                                             ' and cod_grade = %d ' +
                                             ' and cod_img = %d ',
                                             [grupoprod,
                                              codprod.QuotedString,
                                              CodEmpresa,
                                              arraygrade[J],
                                              StrToInt(listaCodImgTmp[Y])]);
                    QrAux.ParamByName('url_imagens').AsString := UrlResolvidas.Text;
                    QrAux.ExecSQL;
                    if QrAux.Transaction.InTransaction then
                      QrAux.Transaction.Commit;
                  end;
                  if J = 0 then
                   J := 1;

                  for I := 0 to UrlResolvidas.Count - 1 do
                    if Length(imagens) < 5 then
                    begin
                      SetLength(imagens, Length(imagens) + 1);

                      img := TImagemProduto.Create;
                      img.ProdutoId := produto.Id;
                      img.Link := UrlResolvidas[I];

                      img.Link := img.Link.Replace(UrlApi, '');
                      if (img.Link.Length > 0) and (StrIn(img.Link[1], ['/', '\'])) then
                        img.Link := img.Link.Substring(1, img.Link.Length - 1);

                      imagens[High(imagens)] := img;
                    end;
                end;
              end;

              produto.Imagens := imagens;
            end;

          end;

          {$ENDREGION}

          {$REGION 'enviando para api'}
          produtoApi := nil;
          if (produto.Id > 0) and (not produto.Ativo) then
          begin
            if comercioServiceApi.ProdutosExcluir(produto.Id) = 1 then
              produtoApi := produto;
          end
          else if produto.Id > 0 then
            produtoApi := comercioServiceApi.ProdutosAlterar(produto)
          else if (produto.Id = 0) and (produto.Ativo) then
            produtoApi := comercioServiceApi.ProdutosInserir(produto);

          if produtoApi = nil then
          begin

            if comercioServiceApi.LastError.Msg <> '' then
              raise Exception.Create(Format('%s %s', [comercioServiceApi.LastError.Msg, comercioServiceApi.LastError.Exception]));

          end
          else
          begin

            if fint('id_comercio_aberto') = 0 then
              if fint('tipo') = 1 then
                SqlExec('update tipo_servico set id_comercio_aberto = %d' +
                        ' where cod_servico = %d',
                        [produtoapi.Id, fint('grupo_prod')])
              else if fint('tipo') = 0 then
                SqlExec('update %s set id_comercio_aberto = %d ' +
                        ' where grupo_prod = %d and cod_prod = %s and cod_empresa = %d %s',
                        [IfThen(fint('cod_grade') > 0, 'produtos_ec_grade', 'produtos_ec'),
                         produtoapi.Id, fint('grupo_prod'), fstrq('cod_prod'), CodEmpresa,
                         IfThen(fint('cod_grade') > 0, 'and cod_grade = ' + fstr('cod_grade'))]);

            if Periodico then
            begin
              with Confs.GetConf('comercio_aberto_ultimo_produto_seqid') do
              begin
                chave := 'comercio_aberto_ultimo_produto_seqid';
                cod_empresa := CodEmpresa;
                display_ := 'Id de sincronização de produtos para o Comércio Aberto';
                tag      := ';comercioaberto;';
                type1_   := typeInt;
                value1_f := fint('seqid_ca');
                ativo    := 1;
                SaveConfDB(QrAux);
              end;
            end;

            if QrAux.Transaction.InTransaction then
              QrAux.Transaction.Commit;

          end;
          {$ENDREGION}

          DataSet.Next;
        end;

    except on E: Exception do
      begin
        LogError('THwComercioServicos.Comercio_ProdutoEnviar %s', [e.Message]);
        if not SilentMod then
          ShowErro('Erro ao cadastrar Lojista na Api' + sLineBreak + e.Message);
      end;
    end;

  finally
    desconectar;
  end;
end;

procedure THwComercioServicos.Comercio_UltimoPedidoBaixar;
var
  consulta: TComercioConsulta;
begin
  try

    consulta := comercioServiceApi.PedidosGet();

    if consulta = nil then
      Exit;

    SaveJSON(COM_DADOS_CONS_PEDIDO, TJsonHw.ToJsonString(consulta));

  except on E: Exception do
    begin
      LogError('THwComercioServicos.Comercio_UltimoPedidoBaixar %s', [e.Message]);
      if not SilentMod then
        ShowErro('Erro ao obter ultimo pedido na Api' + sLineBreak + e.Message);
    end;
  end;
end;

constructor THwComercioServicos.Create(SilentMode: Boolean);
begin
  inherited;
  comercioServiceApi            := TComercioServiceApi.Create(UrlApi, FCnpj);
  comercioServiceApi.OnLog      := Self.OnLog;
  comercioServiceApi.AfterLogin := AfterLogin;
end;

destructor THwComercioServicos.Destroy;
begin
  comercioServiceApi.Free;
  inherited;
end;

function THwComercioServicos.GetDadosApi: Boolean;
begin
  Result := False;

  try
    try
      UrlApi := SqlOpen('select url_api from config_api where cod_empresa = %d and api = ''COMERCIOABERTO''', [CodEmpresa])
        .FieldByName('url_api').AsString.Trim;
    except
    end;

    UrlApi := THwUtilsClass.GetIni('MD', 'URLAPICOMERCIO', '').Trim;

    if UrlApi.Trim.IsEmpty then
      UrlApi := IfThen(DevelopmentMode, COM_URL_API_HW, COM_URL_API_PROD);

    Result := not UrlApi.Trim.IsEmpty;
    if Result then
    begin
      comercioServiceApi.CNPJ   := FCnpj;
      comercioServiceApi.URLApi := UrlApi;
      comercioServiceApi.Token := THwClassRegistros.FromJsonString<TComercioTokenApi>(GetJson(COM_SERV_TOKEN_API));
      if comercioServiceApi.Token <> nil then
        comercioServiceApi.Token.DataHoraAtual := DataHoraAtual;//DataHoraAtual obtida na consulta do cnpj da empresa
    end
    else if not Result then
      if not SilentMod then
        ShowErro('Não foi possivel obter a Url da API no banco de dados')
      else
        LogError('Url não encontrada no banco empresa %d "hw_integra_api"', [CodEmpresa]);

  except on E: Exception do
    begin
      LogError('THwIntegraServicos.GetUrl ', [e.Message]);
    end;
  end;
end;

function THwComercioServicos.GetLojistaDb: TLojista;
begin
  with ClientOOP('select ca.nomefantasia, e.cgc_emp, e.email_emp, ca.telefone, ca.celular,' +
                 ' e.ibge_cod_cidade, ca.linklogo, ca.website, ca.emailcontato, ca.arquivologo,' +
                 ' ca.token_api' +
                 ' from config_api ca' +
                 ' inner join empresa e on e.cod_empresa = ca.cod_empresa' +
                 ' where ca.api = ''COMERCIOABERTO'' and ca.cod_empresa = %d', [CodEmpresa]) do
  begin
    Result := TLojista.Create;
    Result.NomeFantasia := fstr('nomefantasia');
    Result.CpfCnpj := fstr('cgc_emp');
    Result.Email := fstr('emailcontato');
    Result.Telefone := fstr('telefone');
    Result.Celular := fstr('celular');
    Result.Senha := IfThen(fempty('token_api'), fcopy('cgc_emp', 1, 6), fcopy('token_api', 1, 60));
    Result.CidadeId := fint('ibge_cod_cidade');
    if fempty('arquivologo') then
      Result.LinkLogo := ''
    else
      Result.LinkLogo := IfThen(fempty('linklogo'), fstr('arquivologo'),  fstr('linklogo'));
    Result.WebSite := fstr('website');
    //Result.EmailContato := fstr('emailcontato');
  end;
end;

function THwComercioServicos.UrlImagensResolver(LocalList, UrlList: TStrings; PathImgs: string;
  var UpdateImagens: Boolean): TStrings;
var
  I: Integer;
  imagens: TObjectList<TKeyValue>;
  imagem: TKeyValue;
  UploadList: TStrings;
  RetornoApi: TStrings;
begin
  UpdateImagens := False;
  Result := NewStringList(False);

  imagens := TObjectList<TKeyValue>.Create();

  for I := 0 to LocalList.Count - 1 do
  begin
    imagem := TKeyValue.Create;
    imagem.Key := LocalList[I];
    if I <= UrlList.Count - 1 then
      if (not UrlList[I].Trim.IsEmpty) and (not UrlList[I].Trim.Equals('sem url')) then
        imagem.Value := UrlList[I];
    imagens.Add(imagem);
  end;

  UploadList := NewStringList();
  for imagem in imagens do
    if imagem.Value.IsEmpty then
      if (not imagem.Key.StartsWith('/')) and (not imagem.Key.StartsWith('\'))
        and (not((imagem.Key.Length >= 2) and (imagem.Key[2] = ':'))) then
      UploadList.Add(IfThen(not PathImgs.Trim.IsEmpty, IncludeTrailingPathDelimiter(PathImgs)) + imagem.Key)
    else
      UploadList.Add(imagem.Key);

  if UploadList.Count > 0 then
  begin

    RetornoApi := comercioServiceApi.ImagensUpload(UploadList);

    if UploadList.Count <> RetornoApi.Count then
      Exit;

    I := 0;
    for imagem in imagens do
      if not imagem.Value.IsEmpty then
        Result.Add(imagem.Value)
      else
      begin
        Result.Add(RetornoApi[I]);
        I := I + 1;
      end;

    UpdateImagens := True;
  end
  else
    for imagem in imagens do
      if not imagem.Value.IsEmpty then
        Result.Add(imagem.Value);
end;

end.
