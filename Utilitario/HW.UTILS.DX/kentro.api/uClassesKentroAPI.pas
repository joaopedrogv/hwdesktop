unit uClassesKentroAPI;

interface

uses
  {$IFDEF VER180}
    UseCaseEnviarMensagem,
    UseCaseEnviarArquivo,
    hw_win_utils,
    Classes,
    DateUtils,
    Contnrs,
    StdCtrls,
    Buttons,
    HW.Servicos,
    DBClient,
    Hash,
    NetEncoding;
  {$ELSE}
    UseCaseEnviarMensagem,
    UseCaseEnviarArquivo,
    hw_win_utils,
    System.Classes,
    System.DateUtils,
    uClasseConexao,
    System.Contnrs,
    Vcl.StdCtrls,
    Vcl.Buttons,
    HW.Servicos,
    Datasnap.DBClient,
    System.Hash,
    System.NetEncoding,
    FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
    FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
    FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
    FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
    IBX.IBQuery;
  {$ENDIF}

type
  TKentroAPI = class(THwServicos)
  private
    FQrMensKentro: TIBQuery;
    FCodEmpresa: Integer;
    FDataBaseKentro: string;
    FUrl: string;
    FChave: string;
    FQueue_id: Integer;
    fTempListaProdutos: TClientDataset;
    fTempListaProdutosDtSource: TDataSource;
    fTempListaImagens: TClientDataset;
    fTempListaImagens2: TClientDataset;
    fTempListaImagens2DtSource: TDataSource;
    fTempListaArquivos:  TClientDataset;
    fTempListaArquivosDtSource: TDataSource;
    fTempListaMensKentroDtSource: TDataSource;
  public
    procedure IncluirMensagemBD(fone: string; mensagem: string; arquivo: string; ndoc: Integer; tipodoc: string);
    procedure ConsultarUltimasMensagens(fone: string);

    procedure AbrirMensagem(NumDoc: Integer; TipoDoc: string; Mensagem: string; ListaProdutos: string; ListaImagem: string; AMensagemErro: Boolean);
    function EnviarMensagem: boolean;
    procedure CarregarMensagemEnvidas(pFone: string);
    procedure _marcaDesmarcaLinha(pDataset: TDataSet);
    procedure _proximaImagem;
    procedure _anteriorImagem;
    procedure _carregarImagem;
    procedure _adicionarImagem2;
    procedure _deletarImagem2;
    procedure _proximaImagem2;
    procedure _anteriorImagem2;
    procedure _carregarImagem2;
    procedure _adicionarArquivo;
    procedure _proximaArquivo;
    procedure _anteriorArquivo;
    procedure _deletarArquivo;
    procedure datasetAfterScrollImagem(DataSet: TDataSet);
    procedure datasetAfterScrollImagem2(DataSet: TDataSet);
    procedure cdsTextGetText(Sender: TField; var Text: string; DisplayText: Boolean);

    property QrMensKentro: TIBQuery read FQrMensKentro write FQrMensKentro;
    property DataBaseKentro: string read FDataBaseKentro write FDataBaseKentro;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Url: string read FUrl write FUrl;
    property Chave: string read FChave write FChave;
    property Queue_id: Integer read FQueue_id write FQueue_id;
  var
    vDiretorioDestino: string;
    vIndexImagem: Integer;
    vCountImage: Integer;
    vFoneMensagem: string;
    vTextoMensagem: string;
    vArquivoMensagem: string;
    vNdocMensagem: Integer;
    vTipoDocMensagem: string;
  end;

implementation

uses
  {$IFDEF VER180}
    hw_utils, Forms, StrUtils, SysUtils, Math;
  {$ELSE}
    hw_utils, Vcl.Forms, System.StrUtils, System.SysUtils, System.Math,
    System.UITypes, Winapi.Windows, uMensagemKentroAPI;
  {$ENDIF}

{ TKentroAPI }

procedure TKentroAPI.CarregarMensagemEnvidas(pFone: string);
var
  vDataAtual: TDateTime;
begin
  with ClientOOP(' SELECT CURRENT_DATE DATA_ATUAL FROM RDB$DATABASE ') do
    vDataAtual := fdate('data_atual');

  if trim(pFone) = '' then
    ConsultarUltimasMensagens('000000000')
  else
    ConsultarUltimasMensagens(trim(pFone));
end;

procedure TKentroAPI.cdsTextGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.DataSet.FieldByName('arquivo').AsInteger > 0 then
    Text := 'Transferência Arq/Img'
  else if not Sender.DataSet.FieldByName('mensagem').IsNull then
    Text := Copy(trim(Sender.DataSet.FieldByName('mensagem').AsString), 1, 30);
end;

procedure TKentroAPI.ConsultarUltimasMensagens(fone: string);
var
  Z: Integer;
begin
  SqlOpen(' select * from mensagem_whatsapp mw ' +
          ' where mw.data >= (current_date - 30) ' +
          ' and mw.cod_empresa = ' + IntToStr(CodEmpresa) +
          ' and mw.fone = ' + QuotedStr('55' + trim(fone)) +
          ' order by mw.id ', QrMensKentro).FetchAll;

  for Z := 0 to frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.Fields.Count - 1 do
    frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.FieldByName(frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.Fields[Z].FieldName).Visible := false;
  frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.FieldByName('data').DisplayLabel := 'Data';
  frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.FieldByName('mensagem').DisplayLabel := 'Mensagem';
  frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.FieldByName('data').Visible := true;
  frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.FieldByName('mensagem').Visible := true;
  frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.FieldByName('mensagem').OnGetText := cdsTextGetText;
  frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.FieldByName('mensagem').DisplayWidth := 30;
  try
    frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.DisableControls;
    frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.Last;
  finally
    frmMensagemKentroApi.DBGridMensEnv.DataSource.DataSet.EnableControls;
  end
end;

procedure TKentroAPI.datasetAfterScrollImagem(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    exit;

  if fTempListaImagens.IsEmpty then
    exit;

  fTempListaImagens.RecNo := DataSet.RecNo;
  _carregarImagem;
end;

procedure TKentroAPI.datasetAfterScrollImagem2(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    exit;

  _carregarImagem2;
end;

function TKentroAPI.EnviarMensagem: boolean;
var
  paramsList: WideString;
  vFoneContato: string;
  vListaImagens: TStringList;
  vDataAtual: TDateTime;
  id: integer;
  I: Integer;
  J: Integer;

  function HexStringToBase64(const HexStr: string): string;
  var
    md5bytes: TBytes;
  begin
    SetLength(md5Bytes, Length(HexStr) div 2);
    HexToBin(PChar(HexStr), Pointer(md5Bytes), Length(md5Bytes));
    Result := TNetEncoding.Base64.EncodeBytesToString(md5Bytes);
  end;
begin
  try
    Result := False;

    paramsList :=
      Format(';databaseName=%s;empresaid=%s;silent=true;userHw=HW;userLevel=10',
        [FCriptografia.getEnderecoBanco, IntToStr(CodEmpresa)]);

    if trim(vFoneMensagem) = '' then
    begin
      Application.MessageBox(PChar('Fone de contato não informado, favor verificar'),
        'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if (frmMensagemKentroApi.PageControl1.ActivePage = frmMensagemKentroApi.TabSheet1)
      or (frmMensagemKentroApi.PageControl1.ActivePage = frmMensagemKentroApi.TabSheet2) then
    begin
      if trim(vTextoMensagem) = '' then
      begin
        Application.MessageBox(PChar('Texto da mensagem não informado, favor verificar'),
          'Atenção', MB_ICONINFORMATION + MB_OK);
        exit;
      end;
    end;

    with ClientOOP(' SELECT CURRENT_DATE DATA_ATUAL FROM RDB$DATABASE ') do
      vDataAtual := fdate('data_atual');

    if (frmMensagemKentroApi.PageControl1.ActivePage = frmMensagemKentroApi.TabSheet1)
      or (frmMensagemKentroApi.PageControl1.ActivePage = frmMensagemKentroApi.TabSheet2) then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        var useCase := TUseCaseEnviarMensagem.Create(paramsList);
        try
          if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), trim(vTextoMensagem)) then
            exit;
        finally
          useCase.Free;
        end;

        IncluirMensagemBD(vFoneMensagem, vTextoMensagem, '', vNdocMensagem, vTipoDocMensagem);
      end;
    end
    else if frmMensagemKentroApi.PageControl1.ActivePage = frmMensagemKentroApi.TabSheet3 then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        var useCase := TUseCaseEnviarMensagem.Create(paramsList);
        try
          if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), trim(vTextoMensagem)) then
            exit;
        finally
          useCase.Free;
        end;

        IncluirMensagemBD(vFoneMensagem, vTextoMensagem, '', vNdocMensagem, vTipoDocMensagem);
      end;

      try
        vListaImagens := TStringList.Create;
        vListaImagens.Clear;

        fTempListaProdutos.DisableControls;
        fTempListaProdutos.First;
        while not fTempListaProdutos.Eof do
        begin
          fTempListaImagens.RecNo := fTempListaProdutos.RecNo;
          if fTempListaProdutos.FieldByName('SEL').AsString = 'S' then
          begin
            if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) <> 'sem imagem' then
              vListaImagens.Text := trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString);

            if vListaImagens.Count > 0 then
            begin
              var useCase := TUseCaseEnviarMensagem.Create(paramsList);
              try
                if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), '*' + trim(fTempListaProdutos.FieldByName('DESCR_PROD_PED').AsString) + '*') then
                  exit;
              finally
                useCase.Free;
              end;

              IncluirMensagemBD(vFoneMensagem, fTempListaProdutos.FieldByName('DESCR_PROD_PED').AsString, '', vNdocMensagem, vTipoDocMensagem);
            end
            else
            begin
              var useCase := TUseCaseEnviarMensagem.Create(paramsList);
              try
                if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), '*' + trim(fTempListaProdutos.FieldByName('DESCR_PROD_PED').AsString) + '*') then
                  exit;

                if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), 'sem imagem') then
                  exit;

              finally
                useCase.Free;
              end;

              IncluirMensagemBD(vFoneMensagem, fTempListaProdutos.FieldByName('DESCR_PROD_PED').AsString, '', vNdocMensagem, vTipoDocMensagem);
            end;

            if trim(vDiretorioDestino) <> '' then
              for I := 0 to vListaImagens.Count -1 do
              begin
                vListaImagens[I] := IfThen(trim(vDiretorioDestino) <> '',
                  trim(vDiretorioDestino) + trim(ExtractFileName(vListaImagens[I])),
                  trim(vListaImagens[I]));
              end;

            for I := 0 to vListaImagens.Count - 1 do
            begin
              if not FileExists(trim(vListaImagens[I])) then
              begin
                var useCase := TUseCaseEnviarMensagem.Create(paramsList);
                try
                  if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), 'Imagem ' + trim(ExtractFileName(vListaImagens[I])) + ' não encontrada') then
                    exit;

                finally
                  useCase.Free;
                end;

                IncluirMensagemBD(vFoneMensagem, ExtractFileName(vListaImagens[I]), ExtractFileName(vListaImagens[I]), vNdocMensagem, vTipoDocMensagem);
              end
              else
              begin
                var useCase := TUseCaseEnviarArquivo.Create(paramsList);
                try
                  if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), trim(vListaImagens[I])) then
                    exit;
                finally
                  useCase.Free;
                end;

                IncluirMensagemBD(vFoneMensagem, ExtractFileName(vListaImagens[I]), ExtractFileName(vListaImagens[I]), vNdocMensagem, vTipoDocMensagem);
              end;
            end;
          end;
          fTempListaProdutos.Next;
        end;
      finally
        fTempListaProdutos.First;
        fTempListaProdutos.EnableControls;
      end;
    end
    else if frmMensagemKentroApi.PageControl1.ActivePage = frmMensagemKentroApi.TabSheet4 then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        var useCase := TUseCaseEnviarMensagem.Create(paramsList);
        try
          if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), trim(vTextoMensagem)) then
            exit;
        finally
          useCase.Free;
        end;

        IncluirMensagemBD(vFoneMensagem, vTextoMensagem, '', vNdocMensagem, vTipoDocMensagem);
      end;

      try
        fTempListaImagens2.DisableControls;
        fTempListaImagens2.First;
        while not fTempListaImagens2.Eof do
        begin
          if fTempListaImagens2.FieldByName('SEL').AsString = 'S' then
          begin
            if not FileExists(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
            begin
              var useCase := TUseCaseEnviarMensagem.Create(paramsList);
              try
                if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), 'Imagem ' + trim(ExtractFileName(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))) + ' não encontrada') then
                  exit;
              finally
                useCase.Free;
              end;

              IncluirMensagemBD(vFoneMensagem, ExtractFileName(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)), ExtractFileName(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)), vNdocMensagem, vTipoDocMensagem);
            end
            else
            begin
              var useCase := TUseCaseEnviarArquivo.Create(paramsList);
              try
                if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
                  exit;
              finally
                useCase.Free;
              end;

              IncluirMensagemBD(vFoneMensagem, ExtractFileName(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)), ExtractFileName(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)), vNdocMensagem, vTipoDocMensagem);
            end;
          end;
          fTempListaImagens2.Next;
        end
      finally
        fTempListaImagens2.First;
        fTempListaImagens2.EnableControls;
      end;
    end
    else if frmMensagemKentroApi.PageControl1.ActivePage = frmMensagemKentroApi.TabSheet5 then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        var useCase := TUseCaseEnviarMensagem.Create(paramsList);
        try
          if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), trim(vTextoMensagem)) then
            exit;
        finally
          useCase.Free;
        end;

        IncluirMensagemBD(vFoneMensagem, vTextoMensagem, '', vNdocMensagem, vTipoDocMensagem);
      end;

      try
        fTempListaArquivos.DisableControls;
        fTempListaArquivos.First;
        while not fTempListaArquivos.Eof do
        begin
          if fTempListaArquivos.FieldByName('SEL').AsString = 'S' then
          begin
            if not FileExists(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString)) then
            begin
              var useCase := TUseCaseEnviarMensagem.Create(paramsList);
              try
                if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), 'Arquivo ' + trim(ExtractFileName(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString))) + ' não encontrada') then
                  exit;
              finally
                useCase.Free;
              end;

              IncluirMensagemBD(vFoneMensagem, ExtractFileName(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString)), ExtractFileName(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString)), vNdocMensagem, vTipoDocMensagem);
            end
            else
            begin
              var useCase := TUseCaseEnviarArquivo.Create(paramsList);
              try
                if not useCase.Run(CodEmpresa, '55' + trim(vFoneMensagem), trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString)) then
                  exit;
              finally
                useCase.Free;
              end;

              IncluirMensagemBD(vFoneMensagem, ExtractFileName(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString)), ExtractFileName(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString)), vNdocMensagem, vTipoDocMensagem);
            end;
          end;
          fTempListaArquivos.Next;
        end
      finally
        fTempListaArquivos.First;
        fTempListaArquivos.EnableControls;
      end;
    end;

    ConsultarUltimasMensagens(vFoneMensagem);

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao enviar email. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

procedure TKentroAPI.AbrirMensagem(NumDoc: Integer; TipoDoc: string; Mensagem: string; ListaProdutos: string; ListaImagem: string; AMensagemErro: Boolean);
var
  vCodCliente, vCodVendedor, vCodCondPag: Integer;
  vNomeCliente, vFoneCliente, vFoneCelular, vFoneContato, vNomeVendedor, vDescCondPag: string;
  vListaProdutos: TStringList;
  vListaImagens: TStringList;
  vDataAtual: TDateTime;
  I: Integer;
  J: Integer;
begin
  try
    try
      if not conectar(DataBasePath, True)  then
        Exit;

      QrMensKentro := TIBQuery.Create(Application);
      QrMensKentro.Database := Client.QueryOOP.Database;
      QrMensKentro.Transaction := Client.QueryOOP.Transaction;

      vDiretorioDestino := '';
      with ClientOOP(Format(
        ' SELECT COALESCE(VALUE1_VC, '''') VALUE1_VC FROM CONFIG_SISTEMA ' +
        ' WHERE CHAVE = %s AND COD_EMPRESA = %d ',
        ['prod_cad_diretorio_padrao_imagens'.QuotedString, CodEmpresa])) do
      while not DataSet.Eof do
      begin
        vDiretorioDestino := trim(fstr('value1_vc'));

        DataSet.Next;
      end;

      if (trim(vDiretorioDestino) <> '') then
        if Pos('\', vDiretorioDestino) > 0 then
          if Copy(vDiretorioDestino, Length(vDiretorioDestino), 1) <> '\' then
            vDiretorioDestino := vDiretorioDestino + '\';

      FUrl := getCampoPipe(DataBaseKentro, 1);
      FChave := getCampoPipe(DataBaseKentro, 2);
      FQueue_id := StrToInt(getCampoPipe(DataBaseKentro, 3));

      fTempListaProdutos := TClientDataSet.Create(nil);
      fTempListaProdutos.Close;
      fTempListaProdutos.FieldDefs.Clear;
      fTempListaProdutos.FieldDefs.Add('SEL', ftString, 1, false);
      fTempListaProdutos.FieldDefs.Add('DESCR_PROD_PED', ftString, 75, false);
      if fTempListaProdutos.Tag = 0 then
      try
        fTempListaProdutos.CreateDataSet;
        fTempListaProdutos.Tag := 1;

        fTempListaProdutos.FieldByName('SEL').DisplayLabel := 'Sel';
        fTempListaProdutos.FieldByName('DESCR_PROD_PED').DisplayLabel := 'Produto';

        fTempListaProdutosDtSource  := TDataSource.Create(nil);
        fTempListaProdutosDtSource.DataSet := fTempListaProdutos;
      except
      end;

      fTempListaImagens := TClientDataSet.Create(nil);
      fTempListaImagens.Close;
      fTempListaImagens.FieldDefs.Clear;
      fTempListaImagens.FieldDefs.Add('LISTA_IMAGENS', ftMemo, 8, false);
      if fTempListaImagens.Tag = 0 then
      try
        fTempListaImagens.CreateDataSet;
        fTempListaImagens.Tag := 1;
      except
      end;

      fTempListaImagens2 := TClientDataSet.Create(nil);
      fTempListaImagens2.Close;
      fTempListaImagens2.FieldDefs.Clear;
      fTempListaImagens2.FieldDefs.Add('SEL', ftString, 1, false);
      fTempListaImagens2.FieldDefs.Add('LISTA_IMAGENS', ftString, 400, false);
      if fTempListaImagens2.Tag = 0 then
      try
        fTempListaImagens2.CreateDataSet;
        fTempListaImagens2.Tag := 1;

        fTempListaImagens2.FieldByName('SEL').DisplayLabel := 'Sel';
        fTempListaImagens2.FieldByName('LISTA_IMAGENS').DisplayLabel := 'Imagens';

        fTempListaImagens2DtSource := TDataSource.Create(nil);
        fTempListaImagens2DtSource.DataSet := fTempListaImagens2;
      except
      end;

      fTempListaArquivos := TClientDataSet.Create(nil);
      fTempListaArquivos.Close;
      fTempListaArquivos.FieldDefs.Clear;
      fTempListaArquivos.FieldDefs.Add('SEL', ftString, 1, false);
      fTempListaArquivos.FieldDefs.Add('LISTA_ARQUIVOS', ftString, 400, false);
      if fTempListaArquivos.Tag = 0 then
      try
        fTempListaArquivos.CreateDataSet;
        fTempListaArquivos.Tag := 1;

        fTempListaArquivos.FieldByName('SEL').DisplayLabel := 'Sel';
        fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').DisplayLabel := 'Arquivos';

        fTempListaArquivosDtSource := TDataSource.Create(nil);
        fTempListaArquivosDtSource.DataSet := fTempListaArquivos;
      except
      end;

      vCodCliente   := 0;
      vNomeCliente  := '';
      vFoneCliente  := '';
      vFoneCelular  := '';
      vFoneContato  := '';
      vCodVendedor  := 0;
      vNomeVendedor := '';
      vCodCondPag   := 0;
      vDescCondPag  := '';

      // Cabeçalho
      with ClientOOP(Format(
        ' SELECT PEDVENDA.NPED, ' +
        ' PEDVENDA.TIPO, ' +
        ' PEDVENDA.COD_EMPRESA, ' +
        ' PEDVENDA.COD_COND_PAG, ' +
        ' COND_PAG.DESC_COND_PAG, ' +
        ' PEDVENDA.COD_CLIENTE, ' +
        ' CLIENTES.NOME_CLIENTE, ' +
        ' CLIENTES.RAZAO, ' +
        ' CLIENTES.FONE_CLIENTE, ' +
        ' CLIENTES.FONE_CELULAR, ' +
        ' PEDVENDA.COD_VENDEDOR, ' +
        ' COLABORADOR.NOME_VENDEDOR, ' +
        ' PEDVENDA.VALOR_TOTAL, ' +
        ' PEDVENDA.ACRESCIMO, ' +
        ' PEDVENDA.DESCONTO, ' +
        ' CURRENT_DATE DATA_ATUAL ' +
        ' FROM PEDVENDA ' +
        ' INNER JOIN CLIENTES ON CLIENTES.COD_CLIENTE = PEDVENDA.COD_CLIENTE AND CLIENTES.COD_EMPRESA = PEDVENDA.COD_EMPRESA ' +
        ' INNER JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = PEDVENDA.COD_VENDEDOR AND COLABORADOR.COD_EMPRESA = PEDVENDA.COD_EMPRESA ' +
        ' LEFT JOIN COND_PAG ON COND_PAG.COD_COND_PAG = PEDVENDA.COD_COND_PAG ' +
        ' WHERE PEDVENDA.NPED = %d AND PEDVENDA.TIPO = %s AND PEDVENDA.COD_EMPRESA = %d ',
        [NumDoc,  QuotedStr(TipoDoc), CodEmpresa])) do
      while not DataSet.Eof do
      begin
        vCodCondPag   := fint('cod_cond_pag');
        vDescCondPag  := trim(fstr('desc_cond_pag'));
        vCodCliente   := fint('cod_cliente');
        vNomeCliente  := trim(fstr('nome_cliente'));
        vFoneCliente  := fstr('fone_cliente');
        vFoneCelular  := fstr('fone_celular');
        vCodVendedor  := fint('cod_vendedor');
        vNomeVendedor := trim(fstr('nome_vendedor'));
        vDataAtual    := fdate('data_atual');

        DataSet.Next;
      end;

      vListaProdutos := TStringList.Create;
      vListaProdutos.Clear;
      vListaProdutos := Split(trim(ListaProdutos), '¶');

      for I := 0 to vListaProdutos.Count - 1 do
      begin
        fTempListaProdutos.Insert;
        fTempListaProdutos.FieldByName('SEL').AsString := 'S';
        fTempListaProdutos.FieldByName('DESCR_PROD_PED').AsString := Copy(trim(vListaProdutos[I]), 1, 75);
        fTempListaProdutos.Post;
      end;
      fTempListaProdutos.First;

      vListaImagens := TStringList.Create;
      vListaImagens.Clear;
      vListaImagens := Split(trim(ListaImagem), '¶');

      for I := 0 to vListaImagens.Count - 1 do
      begin
        fTempListaImagens.Insert;
        fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString := trim(vListaImagens[I]);
        fTempListaImagens.Post;
      end;
      fTempListaImagens.First;
      if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) <> 'sem imagem' then
        vListaImagens.Text := trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString);

      if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) = 'sem imagem' then
        vListaImagens.Clear
      else if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) = '' then
        vListaImagens.Clear
      else
      begin
        if Length(vListaImagens[0]) > 0 then
          vListaImagens.Text := trim(vListaImagens[0]);
        if Length(vListaImagens[0]) <= 0 then
          vListaImagens.Clear;
      end;

      vIndexImagem := 0;
      vCountImage := vListaImagens.Count;

      Application.CreateForm(TfrmMensagemKentroApi, frmMensagemKentroApi);
      frmMensagemKentroApi.PageControl1.ActivePage := frmMensagemKentroApi.TabSheet1;
      frmMensagemKentroApi.TabSheet1.Show;
      frmMensagemKentroApi.kentroAPI := Self;
      frmMensagemKentroApi.EditNumDoc.Text := IntToStr(NumDoc);
      frmMensagemKentroApi.EditTipoDoc.Text := trim(TipoDoc);
      frmMensagemKentroApi.EditCodCliente.Text := IntToStr(vCodCliente);
      frmMensagemKentroApi.EditNomeCliente.Text := trim(vNomeCliente);
      frmMensagemKentroApi.MaskEditFoneCliente.Text := trim(vFoneCliente);
      frmMensagemKentroApi.MaskEditFoneCelular.Text := trim(vFoneCelular);
      frmMensagemKentroApi.EditCondPag.Text := IntToStr(vCodCondPag);
      frmMensagemKentroApi.EditNomeCondPag.Text := trim(vDescCondPag);
      frmMensagemKentroApi.EditCodVendedor.Text := IntToStr(vCodVendedor);
      frmMensagemKentroApi.EditNomeVendedor.Text := trim(vNomeVendedor);

      frmMensagemKentroApi.MemoMensDoc.Text    := trim(Mensagem);
      frmMensagemKentroApi.MemoItens.Text      := trim(Mensagem);
      frmMensagemKentroApi.MemoMensAvulsa.Text := '';
      frmMensagemKentroApi.MemoTexto.Text      := '';
      frmMensagemKentroApi.MemoImg1.Text       := '';
      frmMensagemKentroApi.MemoImg2.Text       := '';
      frmMensagemKentroApi.MemoArq.Text        := '';
      frmMensagemKentroApi.GrCabecalho.Caption := 'Mensagem WhatsApp';
      frmMensagemKentroApi.CheckBoxFoneCliente.Enabled := false;
      frmMensagemKentroApi.CheckBoxFoneCelular.Enabled := false;

      if (trim(frmMensagemKentroApi.MaskEditFoneCliente.Text) <> '')
        and (Copy(trim(frmMensagemKentroApi.MaskEditFoneCliente.Text), 3, 1) = '9') then
          frmMensagemKentroApi.CheckBoxFoneCliente.Checked := true
      else if (trim(frmMensagemKentroApi.MaskEditFoneCelular.Text) <> '')
        and (Copy(trim(frmMensagemKentroApi.MaskEditFoneCelular.Text), 3, 1) = '9') then
          frmMensagemKentroApi.CheckBoxFoneCelular.Checked := true;

      frmMensagemKentroApi.CheckBoxFoneCliente.Enabled := true;
      frmMensagemKentroApi.CheckBoxFoneCelular.Enabled := true;

      fTempListaMensKentroDtSource := TDataSource.Create(nil);
      fTempListaMensKentroDtSource.DataSet := QrMensKentro;

      if trim(TipoDoc) = 'REQ' then
        frmMensagemKentroApi.GrCabecalho.Caption := 'Venda de Produtos'
      else if trim(TipoDoc) = 'OS' then
        frmMensagemKentroApi.GrCabecalho.Caption := 'Ordem de Serviço'
      else if trim(TipoDoc) = 'ORC' then
        frmMensagemKentroApi.GrCabecalho.Caption := 'Orçamento'
      else if trim(TipoDoc) = 'MOT' then
        frmMensagemKentroApi.GrCabecalho.Caption := 'Comando de Faturamento';

      if vListaImagens.Count <= 0 then
        frmMensagemKentroApi.lbQtdeImg.Caption := '0/0'
      else
        frmMensagemKentroApi.lbQtdeImg.Caption := '1/' + IntToStr(vListaImagens.Count);
      frmMensagemKentroApi.DBGridMensEnv.DataSource := fTempListaMensKentroDtSource;
      frmMensagemKentroApi.DBGridProd.DataSource    := fTempListaProdutosDtSource;
      frmMensagemKentroApi.DBGridArq.DataSource     := fTempListaArquivosDtSource;
      frmMensagemKentroApi.DBGridImg.DataSource     := fTempListaImagens2DtSource;

      fTempListaProdutos.AfterScroll := datasetAfterScrollImagem;
      fTempListaImagens2.AfterScroll := datasetAfterScrollImagem2;

      if (trim(frmMensagemKentroApi.MaskEditFoneCliente.Text) <> '') and (frmMensagemKentroApi.CheckBoxFoneCliente.Checked) then
          ConsultarUltimasMensagens(trim(frmMensagemKentroApi.MaskEditFoneCliente.Text))
      else if (trim(frmMensagemKentroApi.MaskEditFoneCelular.Text) <> '') and(frmMensagemKentroApi.CheckBoxFoneCelular.Checked) then
          ConsultarUltimasMensagens(trim(frmMensagemKentroApi.MaskEditFoneCelular.Text))
      else
        ConsultarUltimasMensagens('000000000');

      frmMensagemKentroApi.ShowModal;
    except on E: Exception do
      begin
        if AMensagemErro then
          Application.MessageBox(PChar('Erro ao abrir mensagem kentro. Erro: ' + e.Message),'Atenção' , 0 + 64);
      end;
    end;
  finally
    if Assigned(fTempListaProdutos) then
      FreeAndNil(fTempListaProdutos);

    if Assigned(fTempListaProdutosDtSource) then
      FreeAndNil(fTempListaProdutosDtSource);

    if Assigned(fTempListaImagens) then
      FreeAndNil(fTempListaImagens);

    if Assigned(fTempListaImagens2) then
      FreeAndNil(fTempListaImagens2);

    if Assigned(fTempListaImagens2DtSource) then
      FreeAndNil(fTempListaImagens2DtSource);

    if Assigned(fTempListaArquivos) then
      FreeAndNil(fTempListaArquivos);

    if Assigned(fTempListaArquivosDtSource) then
      FreeAndNil(fTempListaArquivosDtSource);
  end;
end;

procedure TKentroAPI.IncluirMensagemBD(fone: string; mensagem: string; arquivo: string; ndoc: Integer; tipodoc: string);
begin
  if not conectar(DataBasePath, True)  then
    Exit;

  Client.QueryOOP.Close;
  Client.QueryOOP.SQL.Text := ' insert into mensagem_whatsapp ' +
    ' (id, cod_empresa, fone, data, mensagem, arquivo, ndoc, tipodoc) ' +
    ' values ' +
    ' ((select cod from incrementa_codigo (:cod_empresa, ''MENSAGEM_WHATSAPP'')), ' +
    '  :cod_empresa, :fone, current_timestamp, :mensagem, :arquivo, :ndoc, :tipodoc); ';
  Client.QueryOOP.ParamByName('cod_empresa').AsInteger := CodEmpresa;
  Client.QueryOOP.ParamByName('fone').AsString := '55' + trim(fone);
  Client.QueryOOP.ParamByName('mensagem').AsString := trim(mensagem);
  Client.QueryOOP.ParamByName('arquivo').AsInteger := IfThen(trim(arquivo) <> '', 1, 0);
  Client.QueryOOP.ParamByName('ndoc').AsInteger := ndoc;
  Client.QueryOOP.ParamByName('tipodoc').AsString := trim(tipodoc);
  Client.QueryOOP.ExecSQL;

  if Client.QueryOOP.Transaction.InTransaction then
    Client.QueryOOP.Transaction.Commit;
end;

procedure TKentroAPI._adicionarArquivo;
var
  I: Integer;
begin
  if not frmMensagemKentroAPI.OpenDialog2.Execute then
    exit;

  try
    fTempListaImagens2.DisableControls;
    fTempListaImagens2.First;
    for I := 0 to frmMensagemKentroApi.OpenDialog2.Files.Count - 1 do
    begin
      fTempListaArquivos.Insert;
      fTempListaArquivos.FieldByName('SEL').AsString := 'S';
      fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString := trim(frmMensagemKentroApi.OpenDialog2.Files[I]);
      fTempListaArquivos.Post;
    end;
  finally
    fTempListaImagens2.First;
    fTempListaImagens2.EnableControls;
  end;

  if fTempListaArquivos.IsEmpty then
    frmMensagemKentroAPI.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentroAPI._adicionarImagem2;
var
  I: Integer;
begin
  if not frmMensagemKentroApi.OpenDialog1.Execute then
    exit;

  for I := 0 to frmMensagemKentroApi.OpenDialog1.Files.Count - 1 do
  begin
    if (UpperCase(ExtractFileExt(trim(frmMensagemKentroApi.OpenDialog1.Files[I]))) <> '.JPG')
      and (UpperCase(ExtractFileExt(trim(frmMensagemKentroApi.OpenDialog1.Files[I]))) <> '.JPEG')
      and (UpperCase(ExtractFileExt(trim(frmMensagemKentroApi.OpenDialog1.Files[I]))) <> '.BMP') then
    begin
      Application.MessageBox(PChar('Imagem selecionada não esta no formato suportado: ' + #13 + #13 +
        'Formatos suportados: JPG, JPEG e BMP '+ #13 +
        'Imagem: ' + ExtractFileName(trim(frmMensagemKentroApi.OpenDialog1.Files[I])) + #13 +
        IntToStr(I + 1) + '/' + IntToStr(frmMensagemKentroApi.OpenDialog1.Files.Count)),
        'Atenção', MB_ICONERROR + MB_DEFBUTTON1);
      frmMensagemKentroApi.OpenDialog1.Files.Clear;
      exit;
    end;
  end;

  try
    fTempListaImagens2.DisableControls;
    fTempListaImagens2.First;
    for I := 0 to frmMensagemKentroApi.OpenDialog1.Files.Count - 1 do
    begin
      fTempListaImagens2.Insert;
      fTempListaImagens2.FieldByName('SEL').AsString := 'S';
      fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString := trim(frmMensagemKentroApi.OpenDialog1.Files[I]);
      fTempListaImagens2.Post;
    end;
  finally
    fTempListaImagens2.First;
    fTempListaImagens2.EnableControls;
  end;

  if not fTempListaImagens2.IsEmpty then
  begin
    if FileExists(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
      frmMensagemKentroApi.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentroApi.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentroApi.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentroApi.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentroApi.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

procedure TKentroAPI._anteriorArquivo;
begin
  if fTempListaArquivos.IsEmpty then
  begin
    Application.MessageBox(PChar('Lista de arquivos vazia!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaArquivos.RecNo <= 1) then
  begin
    Application.MessageBox(PChar('Início da lista de arquivos!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaArquivos.RecNo > 1) then
    fTempListaArquivos.Prior;

  if fTempListaArquivos.IsEmpty then
    frmMensagemKentroAPI.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentroAPI._anteriorImagem;
var
  vListaImagens: TStringList;
  I: Integer;
begin
  if (fTempListaProdutos.RecNo = 1)
    and (vIndexImagem + 1 <= 1) then
  begin
    Application.MessageBox(PChar('Início da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (vIndexImagem + 1 <= 1) then
  begin
    if (fTempListaProdutos.RecNo > 1) then
      fTempListaProdutos.Prior;

    vListaImagens := TStringList.Create;
    vListaImagens.Clear;
    if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) <> 'sem imagem' then
      vListaImagens.Text := trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString);

    if trim(vDiretorioDestino) <> '' then
      for I := 0 to vListaImagens.Count -1 do
      begin
        vListaImagens[I] := IfThen(trim(vDiretorioDestino) <> '',
          trim(vDiretorioDestino) + trim(ExtractFileName(vListaImagens[I])),
          trim(vListaImagens[I]));
      end;

    vIndexImagem := vListaImagens.Count - 1;
    vCountImage := vListaImagens.Count;
  end
  else
  begin
    vListaImagens := TStringList.Create;
    vListaImagens.Clear;
    if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) <> 'sem imagem' then
      vListaImagens.Text := trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString);

    if trim(vDiretorioDestino) <> '' then  
      for I := 0 to vListaImagens.Count -1 do
      begin    
        vListaImagens[I] := IfThen(trim(vDiretorioDestino) <> '',
          trim(vDiretorioDestino) + trim(ExtractFileName(vListaImagens[I])),
          trim(vListaImagens[I]));
      end;
    
    vIndexImagem := vIndexImagem - 1;
    vCountImage := vListaImagens.Count;
  end;

  if vListaImagens.Count > 0 then
  begin
    if FileExists(vListaImagens[vIndexImagem]) then
      frmMensagemKentroAPI.Image1.Picture.LoadFromFile(vListaImagens[vIndexImagem])
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentroAPI.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentroAPI.Image1.Picture.Assign(nil);

  if vListaImagens.Count <= 0 then
    frmMensagemKentroAPI.lbQtdeImg.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeImg.Caption := IntToStr(vIndexImagem + 1) + '/' + IntToStr(vListaImagens.Count);
end;

procedure TKentroAPI._anteriorImagem2;
begin
  if fTempListaImagens2.IsEmpty then
  begin
    Application.MessageBox(PChar('Lista de imagens vazia!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaImagens2.RecNo <= 1) then
  begin
    Application.MessageBox(PChar('Início da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaImagens2.RecNo > 1) then
    fTempListaImagens2.Prior;

  if not fTempListaImagens2.IsEmpty then
  begin
    if FileExists(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
      frmMensagemKentroAPI.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentroAPI.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentroAPI.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentroAPI.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

procedure TKentroAPI._carregarImagem;
var
  vListaImagens: TStringList;
  I: Integer;
begin
  if fTempListaImagens.IsEmpty then
  begin
    frmMensagemKentroAPI.Image1.Picture := nil;
    frmMensagemKentroAPI.lbQtdeImg.Caption := '0/0';
    exit;
  end;

  vListaImagens := TStringList.Create;
  vListaImagens.Clear;
  if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) <> 'sem imagem' then
    vListaImagens.Text := trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString);

  if trim(vDiretorioDestino) <> '' then  
    for I := 0 to vListaImagens.Count -1 do
    begin    
      vListaImagens[I] := IfThen(trim(vDiretorioDestino) <> '',
        trim(vDiretorioDestino) + trim(ExtractFileName(vListaImagens[I])),
        trim(vListaImagens[I]));
    end;

  vIndexImagem := 0;
  vCountImage := vListaImagens.Count;

  if vListaImagens.Count > 0 then
  begin
    if FileExists(vListaImagens[vIndexImagem]) then
      frmMensagemKentroAPI.Image1.Picture.LoadFromFile(vListaImagens[vIndexImagem])
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentroAPI.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentroAPI.Image1.Picture.Assign(nil);

  if vListaImagens.Count <= 0 then
    frmMensagemKentroAPI.lbQtdeImg.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeImg.Caption := IntToStr(vIndexImagem + 1) + '/' + IntToStr(vListaImagens.Count);
end;

procedure TKentroAPI._carregarImagem2;
begin
  if trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString) = '' then
  begin
    frmMensagemKentroAPI.Image2.Picture := nil;
    frmMensagemKentroAPI.lbQtdeImg2.Caption := '0/0';
    exit;
  end;

  if not fTempListaImagens2.IsEmpty then
  begin
    if FileExists(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
      frmMensagemKentroAPI.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentroAPI.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentroAPI.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentroAPI.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

procedure TKentroAPI._deletarArquivo;
begin
  if fTempListaArquivos.IsEmpty then
  begin
    frmMensagemKentroAPI.lbQtdeArq.Caption := '0/0';
    exit;
  end;

  fTempListaArquivos.Delete;

  if fTempListaArquivos.IsEmpty then
    frmMensagemKentroAPI.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentroAPI._deletarImagem2;
begin
  if fTempListaImagens2.IsEmpty then
    exit;

  fTempListaImagens2.Delete;
end;

procedure TKentroAPI._marcaDesmarcaLinha(pDataset: TDataSet);
begin
  if pDataset.IsEmpty then
    exit;

  pDataset.Edit;
  if pDataset.FieldByName('SEL').AsString = 'S' then
    pDataset.FieldByName('SEL').AsString := ''
  else
    pDataset.FieldByName('SEL').AsString := 'S';
  pDataset.Post;
end;

procedure TKentroAPI._proximaArquivo;
begin
  if fTempListaArquivos.IsEmpty then
  begin
    Application.MessageBox(PChar('Lista de arquivos vazia!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaArquivos.RecNo >= fTempListaArquivos.RecordCount) then
  begin
    Application.MessageBox(PChar('Fim da lista de arquivos!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaArquivos.RecNo < fTempListaArquivos.RecordCount) then
    fTempListaArquivos.Next;

  if fTempListaArquivos.IsEmpty then
    frmMensagemKentroAPI.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentroAPI._proximaImagem;
var
  vListaImagens: TStringList;
  I: Integer;
begin
  if (fTempListaProdutos.RecNo = fTempListaProdutos.RecordCount)
    and (vIndexImagem + 1 >= vCountImage) then
  begin
    Application.MessageBox(PChar('Fim da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (vIndexImagem + 1 >= vCountImage) then
  begin
    if (fTempListaProdutos.RecNo < fTempListaProdutos.RecordCount) then
      fTempListaProdutos.Next;

    vListaImagens := TStringList.Create;
    vListaImagens.Clear;
    if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) <> 'sem imagem' then
      vListaImagens.Text := trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString);

    if trim(vDiretorioDestino) <> '' then
      for I := 0 to vListaImagens.Count -1 do
      begin    
        vListaImagens[I] := IfThen(trim(vDiretorioDestino) <> '',
          trim(vDiretorioDestino) + trim(ExtractFileName(vListaImagens[I])),
          trim(vListaImagens[I]));
      end;
      
    vIndexImagem := 0;
    vCountImage := vListaImagens.Count;
  end
  else
  begin
    vListaImagens := TStringList.Create;
    vListaImagens.Clear;
    if trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString) <> 'sem imagem' then
      vListaImagens.Text := trim(fTempListaImagens.FieldByName('LISTA_IMAGENS').AsString);

    if trim(vDiretorioDestino) <> '' then  
      for I := 0 to vListaImagens.Count -1 do
      begin    
        vListaImagens[I] := IfThen(trim(vDiretorioDestino) <> '',
          trim(vDiretorioDestino) + trim(ExtractFileName(vListaImagens[I])),
          trim(vListaImagens[I]));
      end;

    vIndexImagem := vIndexImagem + 1;
    vCountImage := vListaImagens.Count;
  end;

  if vListaImagens.Count > 0 then
  begin
    if FileExists(vListaImagens[vIndexImagem]) then
      frmMensagemKentroAPI.Image1.Picture.LoadFromFile(vListaImagens[vIndexImagem])
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentroAPI.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentroAPI.Image1.Picture.Assign(nil);


  if vListaImagens.Count <= 0 then
    frmMensagemKentroAPI.lbQtdeImg.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeImg.Caption := IntToStr(vIndexImagem + 1) + '/' + IntToStr(vListaImagens.Count);
end;

procedure TKentroAPI._proximaImagem2;
begin
  if fTempListaImagens2.IsEmpty then
  begin
    Application.MessageBox(PChar('Lista de imagens vazia!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaImagens2.RecNo >= fTempListaImagens2.RecordCount) then
  begin
    Application.MessageBox(PChar('Fim da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  if (fTempListaImagens2.RecNo < fTempListaImagens2.RecordCount) then
    fTempListaImagens2.Next;

  if not fTempListaImagens2.IsEmpty then
  begin
    if FileExists(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
      frmMensagemKentroAPI.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentroAPI.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentroAPI.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentroAPI.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentroAPI.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

end.
