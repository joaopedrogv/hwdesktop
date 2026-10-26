unit uClassesKentro;

interface

uses
  {$IFDEF VER180}
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
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;
  {$ENDIF}

type
  TKentro = class(THwServicos)
  private
    FQrAuxKentro: TFDQuery;
    FQrAuxMensKentro: TFDQuery;
    FBancoKentro: TFDConnection;
    FCommamdKentro: TFDCommand;
//    FQrAuxKentro: TFDQuery;
//    FBancoKentro: TFDConnection;
//    FFreeDatabase: Boolean;
    FCodEmpresa: Integer;
    FDataBaseKentro: string;
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
    procedure CreateKentro(AMensagemErro: Boolean);
    procedure destroyKentro;
    function conectarKentro(ADataBaseName : string; AMensagemErro: Boolean): Boolean; overload;
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

    property QrAuxKentro: TFDQuery read FQrAuxKentro write FQrAuxKentro;
    property QrAuxMensKentro: TFDQuery read FQrAuxMensKentro write FQrAuxMensKentro;
  	property BancoKentro: TFDConnection read FBancoKentro write FBancoKentro;
    property DataBaseKentro: string read FDataBaseKentro write FDataBaseKentro;
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
  uMensagemKentro, System.UITypes, Winapi.Windows;
  {$ENDIF}

{ TKentro }

procedure TKentro.CarregarMensagemEnvidas(pFone: string);
var
  vDataAtual: TDateTime;
  J: Integer;
begin
  with ClientOOP(' SELECT CURRENT_DATE DATA_ATUAL FROM RDB$DATABASE ') do
    vDataAtual := fdate('data_atual');

  if trim(pFone) = '' then
    QrAuxMensKentro.Open(' select * from autosend ' +
      ' where `number` = ' + QuotedStr(trim('00000000000')) +
      ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
  //      ' and `fk_file` is null ' +
      ' order by `id` ')
  else
   QrAuxMensKentro.Open(' select * from autosend ' +
      ' where `number` = ' + QuotedStr('55' + trim(pFone)) +
      ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
  //      ' and `fk_file` is null ' +
      ' order by `id` ');

  for J := 0 to frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields.Count - 1 do
    frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName(frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields[J].FieldName).Visible := false;
  frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').DisplayLabel := 'Data';
  frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayLabel := 'Mensagem';
  frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').Visible := true;
  frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').Visible := true;
  frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').OnGetText := cdsTextGetText;
  frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayWidth := 30;
  try
    frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.DisableControls;
    frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Last;
  finally
    frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.EnableControls;
  end;
end;

procedure TKentro.cdsTextGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not QrAuxMensKentro.FieldByName('fk_file').IsNull then
    Text := 'Transferência Arq/Img'
  else if not QrAuxMensKentro.FieldByName('text').IsNull then
    Text := Copy(trim(QrAuxMensKentro.FieldByName('text').AsString), 1, 30);
end;

function TKentro.conectarKentro(ADataBaseName: string;
  AMensagemErro: Boolean): Boolean;
var
  vdatabase: string;
  vusername: string;
  vpassword: string;
  vserver: string;
  vport: string;
begin
  try
    vdatabase := getCampoPipe(ADataBaseName, 1);
    vusername := getCampoPipe(ADataBaseName, 2);
    vpassword := getCampoPipe(ADataBaseName, 3);
    vserver := getCampoPipe(ADataBaseName, 4);
    vport := getCampoPipe(ADataBaseName, 5);

    FBancoKentro.Connected := False;

    FBancoKentro.ConnectionString :=
      'DriverID=MySQL;' +
      'Database='+vdatabase+';' +
      'User_name='+vusername+';' +
      'Password='+vpassword+';' +
      'Server='+vserver+';' +
      'Port='+vport;

//    FBancoKentro.DriverName := 'MySQL';
//    FBancoKentro.Params.Clear;
//    FBancoKentro.Params.Add('DriverID=MySQL');
//    FBancoKentro.Params.Add('Database='+vdatabase);
//    FBancoKentro.Params.Add('User_Name='+vusername);
//    FBancoKentro.Params.Add('Password='+vpassword);
//    FBancoKentro.Params.Add('Server='+vserver);
//    FBancoKentro.Params.Add('Port='+vport);

//    FBancoKentro.LoginPrompt := false;
    FBancoKentro.Connected := True;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      if AMensagemErro then
        Application.MessageBox(PChar('Não foi possivel conectar ao banco de dados (kentro). Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

procedure TKentro.CreateKentro(AMensagemErro: Boolean);
begin
  try
    FBancoKentro := TFDConnection.Create(Application);

    FQrAuxKentro := TFDQuery.Create(Application);
    FQrAuxKentro.Connection := FBancoKentro;

    FQrAuxMensKentro := TFDQuery.Create(Application);
    FQrAuxMensKentro.Connection := FBancoKentro;

    FCommamdKentro := TFDCommand.Create(Application);
    FCommamdKentro.Connection := FBancoKentro;
  except on E: Exception do
    begin
      if AMensagemErro then
        Application.MessageBox(PChar('Erro ao criar classe kentro. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

procedure TKentro.datasetAfterScrollImagem(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    exit;

  if fTempListaImagens.IsEmpty then
    exit;

  fTempListaImagens.RecNo := DataSet.RecNo;
  _carregarImagem;
end;

procedure TKentro.datasetAfterScrollImagem2(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
    exit;

  _carregarImagem2;
end;

procedure TKentro.destroyKentro;
begin
  if Assigned(FQrAuxKentro) then
    FreeAndNil(FQrAuxKentro);
  if Assigned(FQrAuxMensKentro) then
    FreeAndNil(FQrAuxMensKentro);
  if Assigned(FCommamdKentro) then
    FreeAndNil(FCommamdKentro);
  if Assigned(FBancoKentro) then
    FreeAndNil(FBancoKentro);
end;

function TKentro.EnviarMensagem: boolean;
var
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

    if not conectarKentro(DataBaseKentro, True) then
      Exit;

    if trim(vFoneMensagem) = '' then
    begin
      Application.MessageBox(PChar('Fone de contato não informado, favor verificar'),
        'Atenção', MB_ICONINFORMATION + MB_OK);
      exit;
    end;

    if (frmMensagemKentro.PageControl1.ActivePage = frmMensagemKentro.TabSheet1)
      or (frmMensagemKentro.PageControl1.ActivePage = frmMensagemKentro.TabSheet2) then
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

    if (frmMensagemKentro.PageControl1.ActivePage = frmMensagemKentro.TabSheet1)
      or (frmMensagemKentro.PageControl1.ActivePage = frmMensagemKentro.TabSheet2) then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
          ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr(vTextoMensagem), Queue_id]));

        QrAuxMensKentro.Open(' select * from autosend ' +
          ' where `number` = ' + QuotedStr('55' + vFoneMensagem) +
          ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
//          ' and `fk_file` is null ' +
          ' order by `id` ');

        for J := 0 to frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields.Count - 1 do
          frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName(frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields[J].FieldName).Visible := false;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').DisplayLabel := 'Data';
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayLabel := 'Mensagem';
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').Visible := true;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').Visible := true;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').OnGetText := cdsTextGetText;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayWidth := 30;
        try
          frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.DisableControls;
          frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Last;
        finally
          frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.EnableControls;
        end
      end;
    end
    else if frmMensagemKentro.PageControl1.ActivePage = frmMensagemKentro.TabSheet3 then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
          ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr(vTextoMensagem), Queue_id]));
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
              QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
                ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr('*' + trim(fTempListaProdutos.FieldByName('DESCR_PROD_PED').AsString) + '*'), Queue_id]));
            end
            else
            begin
              QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
                ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr('*' + trim(fTempListaProdutos.FieldByName('DESCR_PROD_PED').AsString) + '*'), Queue_id]));

              QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
                ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr('sem imagem'), Queue_id]));
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
                QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
                  ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr('Imagem ' + trim(ExtractFileName(vListaImagens[I])) + ' não encontrada'), Queue_id]));
              end
              else
              begin
                QrAuxKentro.Close;
                QrAuxKentro.SQL.Text := 'insert into files (sha256, mimetype, data, filename) ' +
                  ' values (:sha256, :mimetype, :data, :filename)';

                var hash := THashSHA2.GetHashStringFromFile(trim(vListaImagens[I]));

                hash := HexStringToBase64(hash);

                var filename := ExtractFileName(trim(vListaImagens[I]));
                var mimetype := GetFileMimeType(trim(vListaImagens[I]));

                QrAuxKentro.ParamByName('sha256').AsString := hash;
                QrAuxKentro.ParamByName('mimetype').AsString := mimetype;
                QrAuxKentro.ParamByName('filename').AsString := filename;
                QrAuxKentro.ParamByName('data').LoadFromFile(trim(vListaImagens[I]), ftBlob);
              //  QrAuxKentro.ParamByName('id').FDDataType := dt

                QrAuxKentro.ExecSQL;

                QrAuxKentro.Open('SELECT LAST_INSERT_ID() as id;');


                id := QrAuxKentro.FieldByName('id').AsInteger;

                QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `fk_file`, `status`, `queue_id`) ' +
                  ' values (%s, %d, 0, %d)', [QuotedStr('55' + vFoneMensagem), id, Queue_id]));
              end;
            end;
          end;
          fTempListaProdutos.Next;
        end;
      finally
        fTempListaProdutos.First;
        fTempListaProdutos.EnableControls;
      end;

      QrAuxMensKentro.Open(' select * from autosend ' +
        ' where `number` = ' + QuotedStr('55' + vFoneMensagem) +
        ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
//        ' and `fk_file` is null ' +
        ' order by `id` ');

      for J := 0 to frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields.Count - 1 do
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName(frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields[J].FieldName).Visible := false;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').DisplayLabel := 'Data';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayLabel := 'Mensagem';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').OnGetText := cdsTextGetText;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayWidth := 30;
      try
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.DisableControls;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Last;
      finally
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.EnableControls;
      end
    end
    else if frmMensagemKentro.PageControl1.ActivePage = frmMensagemKentro.TabSheet4 then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
          ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr(vTextoMensagem), Queue_id]));
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
              QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
                ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr('Imagem ' + trim(ExtractFileName(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))) + ' não encontrada'), Queue_id]));
            end
            else
            begin
              QrAuxKentro.Close;
              QrAuxKentro.SQL.Text := 'insert into files (sha256, mimetype, data, filename) ' +
                ' values (:sha256, :mimetype, :data, :filename)';

              var hash := THashSHA2.GetHashStringFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString));

              hash := HexStringToBase64(hash);

              var filename := ExtractFileName(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString));
              var mimetype := GetFileMimeType(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString));

              QrAuxKentro.ParamByName('sha256').AsString := hash;
              QrAuxKentro.ParamByName('mimetype').AsString := mimetype;
              QrAuxKentro.ParamByName('filename').AsString := filename;
              QrAuxKentro.ParamByName('data').LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString), ftBlob);
            //  QrAuxKentro.ParamByName('id').FDDataType := dt

              QrAuxKentro.ExecSQL;

              QrAuxKentro.Open('SELECT LAST_INSERT_ID() as id;');


              id := QrAuxKentro.FieldByName('id').AsInteger;

              QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `fk_file`, `status`, `queue_id`) ' +
                ' values (%s, %d, 0, %d)', [QuotedStr('55' + vFoneMensagem), id, Queue_id]));
            end;
          end;
          fTempListaImagens2.Next;
        end
      finally
        fTempListaImagens2.First;
        fTempListaImagens2.EnableControls;
      end;

      QrAuxMensKentro.Open(' select * from autosend ' +
        ' where `number` = ' + QuotedStr('55' + vFoneMensagem) +
        ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
//        ' and `fk_file` is null ' +
        ' order by `id` ');

      for J := 0 to frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields.Count - 1 do
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName(frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields[J].FieldName).Visible := false;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').DisplayLabel := 'Data';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayLabel := 'Mensagem';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').OnGetText := cdsTextGetText;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayWidth := 30;
      try
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.DisableControls;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Last;
      finally
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.EnableControls;
      end
    end
    else if frmMensagemKentro.PageControl1.ActivePage = frmMensagemKentro.TabSheet5 then
    begin
      if trim(vTextoMensagem) <> '' then
      begin
        QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
          ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr(vTextoMensagem), Queue_id]));
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
              QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `text`, `status`, `queue_id`) ' +
                ' values (%s, %s, 0, %d)', [QuotedStr('55' + vFoneMensagem),  QuotedStr('Arquivo ' + trim(ExtractFileName(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString))) + ' não encontrada'), Queue_id]));
            end
            else
            begin
              QrAuxKentro.Close;
              QrAuxKentro.SQL.Text := 'insert into files (sha256, mimetype, data, filename) ' +
                ' values (:sha256, :mimetype, :data, :filename)';

              var hash := THashSHA2.GetHashStringFromFile(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString));

              hash := HexStringToBase64(hash);

              var filename := ExtractFileName(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString));
              var mimetype := GetFileMimeType(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString));

              QrAuxKentro.ParamByName('sha256').AsString := hash;
              QrAuxKentro.ParamByName('mimetype').AsString := mimetype;
              QrAuxKentro.ParamByName('filename').AsString := filename;
              QrAuxKentro.ParamByName('data').LoadFromFile(trim(fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString), ftBlob);
            //  QrAuxKentro.ParamByName('id').FDDataType := dt

              QrAuxKentro.ExecSQL;

              QrAuxKentro.Open('SELECT LAST_INSERT_ID() as id;');


              id := QrAuxKentro.FieldByName('id').AsInteger;

              QrAuxKentro.ExecSQL(Format('insert into autosend(`number`, `fk_file`, `status`, `queue_id`) ' +
                ' values (%s, %d, 0, %d)', [QuotedStr('55' + vFoneMensagem), id, Queue_id]));
            end;
          end;
          fTempListaArquivos.Next;
        end
      finally
        fTempListaArquivos.First;
        fTempListaArquivos.EnableControls;
      end;

      QrAuxMensKentro.Open(' select * from autosend ' +
        ' where `number` = ' + QuotedStr('55' + vFoneMensagem) +
        ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
//        ' and `fk_file` is null ' +
        ' order by `id` ');

      for J := 0 to frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields.Count - 1 do
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName(frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields[J].FieldName).Visible := false;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').DisplayLabel := 'Data';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayLabel := 'Mensagem';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').OnGetText := cdsTextGetText;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayWidth := 30;
      try
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.DisableControls;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Last;
      finally
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.EnableControls;
      end
    end;


    Result := True;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao enviar email. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

procedure TKentro.AbrirMensagem(NumDoc: Integer; TipoDoc: string; Mensagem: string; ListaProdutos: string; ListaImagem: string; AMensagemErro: Boolean);
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

      if not conectarKentro(DataBaseKentro, True) then
        Exit;

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

      FQueue_id := StrToInt(getCampoPipe(DataBaseKentro, 6));

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

      Application.CreateForm(TfrmMensagemKentro, frmMensagemKentro);
      frmMensagemKentro.PageControl1.ActivePage := frmMensagemKentro.TabSheet1;
      frmMensagemKentro.TabSheet1.Show;
      frmMensagemKentro.kentro := Self;
      frmMensagemKentro.EditNumDoc.Text := IntToStr(NumDoc);
      frmMensagemKentro.EditTipoDoc.Text := trim(TipoDoc);
      frmMensagemKentro.EditCodCliente.Text := IntToStr(vCodCliente);
      frmMensagemKentro.EditNomeCliente.Text := trim(vNomeCliente);
      frmMensagemKentro.MaskEditFoneCliente.Text := trim(vFoneCliente);
      frmMensagemKentro.MaskEditFoneCelular.Text := trim(vFoneCelular);
      frmMensagemKentro.EditCondPag.Text := IntToStr(vCodCondPag);
      frmMensagemKentro.EditNomeCondPag.Text := trim(vDescCondPag);
      frmMensagemKentro.EditCodVendedor.Text := IntToStr(vCodVendedor);
      frmMensagemKentro.EditNomeVendedor.Text := trim(vNomeVendedor);

      frmMensagemKentro.MemoMensDoc.Text    := trim(Mensagem);
      frmMensagemKentro.MemoItens.Text      := trim(Mensagem);
      frmMensagemKentro.MemoMensAvulsa.Text := '';
      frmMensagemKentro.MemoTexto.Text      := '';
      frmMensagemKentro.MemoImg1.Text       := '';
      frmMensagemKentro.MemoImg2.Text       := '';
      frmMensagemKentro.MemoArq.Text        := '';
      frmMensagemKentro.GrCabecalho.Caption := 'Mensagem WhatsApp';
      frmMensagemKentro.CheckBoxFoneCliente.Enabled := false;
      frmMensagemKentro.CheckBoxFoneCelular.Enabled := false;

      if (trim(frmMensagemKentro.MaskEditFoneCliente.Text) <> '')
        and (Copy(trim(frmMensagemKentro.MaskEditFoneCliente.Text), 3, 1) = '9') then
          frmMensagemKentro.CheckBoxFoneCliente.Checked := true
      else if (trim(frmMensagemKentro.MaskEditFoneCelular.Text) <> '')
        and (Copy(trim(frmMensagemKentro.MaskEditFoneCelular.Text), 3, 1) = '9') then
          frmMensagemKentro.CheckBoxFoneCelular.Checked := true;

      frmMensagemKentro.CheckBoxFoneCliente.Enabled := true;
      frmMensagemKentro.CheckBoxFoneCelular.Enabled := true;

      fTempListaMensKentroDtSource := TDataSource.Create(nil);
      fTempListaMensKentroDtSource.DataSet := QrAuxMensKentro;

      if trim(TipoDoc) = 'REQ' then
        frmMensagemKentro.GrCabecalho.Caption := 'Venda de Produtos'
      else if trim(TipoDoc) = 'OS' then
        frmMensagemKentro.GrCabecalho.Caption := 'Ordem de Serviço'
      else if trim(TipoDoc) = 'ORC' then
        frmMensagemKentro.GrCabecalho.Caption := 'Orçamento'
      else if trim(TipoDoc) = 'MOT' then
        frmMensagemKentro.GrCabecalho.Caption := 'Comando de Faturamento';

      if vListaImagens.Count <= 0 then
        frmMensagemKentro.lbQtdeImg.Caption := '0/0'
      else
        frmMensagemKentro.lbQtdeImg.Caption := '1/' + IntToStr(vListaImagens.Count);
      frmMensagemKentro.DBGridMensEnv.DataSource := fTempListaMensKentroDtSource;
      frmMensagemKentro.DBGridProd.DataSource    := fTempListaProdutosDtSource;
      frmMensagemKentro.DBGridArq.DataSource     := fTempListaArquivosDtSource;
      frmMensagemKentro.DBGridImg.DataSource     := fTempListaImagens2DtSource;

      fTempListaProdutos.AfterScroll := datasetAfterScrollImagem;
      fTempListaImagens2.AfterScroll := datasetAfterScrollImagem2;

      if (trim(frmMensagemKentro.MaskEditFoneCliente.Text) <> '')
        and (Copy(trim(frmMensagemKentro.MaskEditFoneCliente.Text), 3, 1) = '9') then
      begin
        QrAuxMensKentro.Open(' select * from autosend ' +
          ' where `number` = ' + QuotedStr('55' + trim(frmMensagemKentro.MaskEditFoneCliente.Text)) +
          ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
    //      ' and `fk_file` is null ' +
          ' order by `id` ');
      end
      else if (trim(frmMensagemKentro.MaskEditFoneCelular.Text) <> '')
        and (Copy(trim(frmMensagemKentro.MaskEditFoneCelular.Text), 3, 1) = '9') then
      begin
        QrAuxMensKentro.Open(' select * from autosend ' +
          ' where `number` = ' + QuotedStr('55' + trim(frmMensagemKentro.MaskEditFoneCelular.Text)) +
          ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
    //      ' and `fk_file` is null ' +
          ' order by `id` ');
      end
      else
      begin
        QrAuxMensKentro.Open(' select * from autosend ' +
          ' where `number` = ' + QuotedStr(trim('00000000000')) +
          ' and `updatedAt` >= (NOW() - INTERVAL 30 DAY) ' +
    //      ' and `fk_file` is null ' +
          ' order by `id` ');
      end;

      for J := 0 to frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields.Count - 1 do
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName(frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Fields[J].FieldName).Visible := false;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').DisplayLabel := 'Data';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayLabel := 'Mensagem';
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('updatedAt').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').Visible := true;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').OnGetText := cdsTextGetText;
      frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.FieldByName('text').DisplayWidth := 30;
      try
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.DisableControls;
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.Last;
      finally
        frmMensagemKentro.DBGridMensEnv.DataSource.DataSet.EnableControls;
      end;

      frmMensagemKentro.ShowModal;
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

procedure TKentro._adicionarArquivo;
var
  I: Integer;
begin
  if not frmMensagemKentro.OpenDialog2.Execute then
    exit;

  try
    fTempListaImagens2.DisableControls;
    fTempListaImagens2.First;
    for I := 0 to frmMensagemKentro.OpenDialog2.Files.Count - 1 do
    begin
      fTempListaArquivos.Insert;
      fTempListaArquivos.FieldByName('SEL').AsString := 'S';
      fTempListaArquivos.FieldByName('LISTA_ARQUIVOS').AsString := trim(frmMensagemKentro.OpenDialog2.Files[I]);
      fTempListaArquivos.Post;
    end;
  finally
    fTempListaImagens2.First;
    fTempListaImagens2.EnableControls;
  end;

  if fTempListaArquivos.IsEmpty then
    frmMensagemKentro.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentro._adicionarImagem2;
var
  I: Integer;
begin
  if not frmMensagemKentro.OpenDialog1.Execute then
    exit;

  for I := 0 to frmMensagemKentro.OpenDialog1.Files.Count - 1 do
  begin
    if (UpperCase(ExtractFileExt(trim(frmMensagemKentro.OpenDialog1.Files[I]))) <> '.JPG')
      and (UpperCase(ExtractFileExt(trim(frmMensagemKentro.OpenDialog1.Files[I]))) <> '.JPEG')
      and (UpperCase(ExtractFileExt(trim(frmMensagemKentro.OpenDialog1.Files[I]))) <> '.BMP') then
    begin
      Application.MessageBox(PChar('Imagem selecionada não esta no formato suportado: ' + #13 + #13 +
        'Formatos suportados: JPG, JPEG e BMP '+ #13 +
        'Imagem: ' + ExtractFileName(trim(frmMensagemKentro.OpenDialog1.Files[I])) + #13 +
        IntToStr(I + 1) + '/' + IntToStr(frmMensagemKentro.OpenDialog1.Files.Count)),
        'Atenção', MB_ICONERROR + MB_DEFBUTTON1);
      frmMensagemKentro.OpenDialog1.Files.Clear;
      exit;
    end;
  end;

  try
    fTempListaImagens2.DisableControls;
    fTempListaImagens2.First;
    for I := 0 to frmMensagemKentro.OpenDialog1.Files.Count - 1 do
    begin
      fTempListaImagens2.Insert;
      fTempListaImagens2.FieldByName('SEL').AsString := 'S';
      fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString := trim(frmMensagemKentro.OpenDialog1.Files[I]);
      fTempListaImagens2.Post;
    end;
  finally
    fTempListaImagens2.First;
    fTempListaImagens2.EnableControls;
  end;

  if not fTempListaImagens2.IsEmpty then
  begin
    if FileExists(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
      frmMensagemKentro.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentro.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentro.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentro.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

procedure TKentro._anteriorArquivo;
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
    frmMensagemKentro.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentro._anteriorImagem;
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
      frmMensagemKentro.Image1.Picture.LoadFromFile(vListaImagens[vIndexImagem])
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentro.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentro.Image1.Picture.Assign(nil);

  if vListaImagens.Count <= 0 then
    frmMensagemKentro.lbQtdeImg.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeImg.Caption := IntToStr(vIndexImagem + 1) + '/' + IntToStr(vListaImagens.Count);
end;

procedure TKentro._anteriorImagem2;
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
      frmMensagemKentro.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentro.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentro.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentro.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

procedure TKentro._carregarImagem;
var
  vListaImagens: TStringList;
  I: Integer;
begin
  if fTempListaImagens.IsEmpty then
  begin
    frmMensagemKentro.Image1.Picture := nil;
    frmMensagemKentro.lbQtdeImg.Caption := '0/0';
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
      frmMensagemKentro.Image1.Picture.LoadFromFile(vListaImagens[vIndexImagem])
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentro.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentro.Image1.Picture.Assign(nil);

  if vListaImagens.Count <= 0 then
    frmMensagemKentro.lbQtdeImg.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeImg.Caption := IntToStr(vIndexImagem + 1) + '/' + IntToStr(vListaImagens.Count);
end;

procedure TKentro._carregarImagem2;
begin
  if trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString) = '' then
  begin
    frmMensagemKentro.Image2.Picture := nil;
    frmMensagemKentro.lbQtdeImg2.Caption := '0/0';
    exit;
  end;

  if not fTempListaImagens2.IsEmpty then
  begin
    if FileExists(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString)) then
      frmMensagemKentro.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentro.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentro.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentro.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

procedure TKentro._deletarArquivo;
begin
  if fTempListaArquivos.IsEmpty then
  begin
    frmMensagemKentro.lbQtdeArq.Caption := '0/0';
    exit;
  end;

  fTempListaArquivos.Delete;

  if fTempListaArquivos.IsEmpty then
    frmMensagemKentro.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentro._deletarImagem2;
begin
  if fTempListaImagens2.IsEmpty then
    exit;

  fTempListaImagens2.Delete;
end;

procedure TKentro._marcaDesmarcaLinha(pDataset: TDataSet);
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

procedure TKentro._proximaArquivo;
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
    frmMensagemKentro.lbQtdeArq.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeArq.Caption := IntToStr(fTempListaArquivos.RecNo) + '/' + IntToStr(fTempListaArquivos.RecordCount);
end;

procedure TKentro._proximaImagem;
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
      frmMensagemKentro.Image1.Picture.LoadFromFile(vListaImagens[vIndexImagem])
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentro.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentro.Image1.Picture.Assign(nil);


  if vListaImagens.Count <= 0 then
    frmMensagemKentro.lbQtdeImg.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeImg.Caption := IntToStr(vIndexImagem + 1) + '/' + IntToStr(vListaImagens.Count);
end;

procedure TKentro._proximaImagem2;
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
      frmMensagemKentro.Image2.Picture.LoadFromFile(trim(fTempListaImagens2.FieldByName('LISTA_IMAGENS').AsString))
    else if FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
      frmMensagemKentro.Image2.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg');
  end
  else
    frmMensagemKentro.Image2.Picture.Assign(nil);

  if fTempListaImagens2.IsEmpty then
    frmMensagemKentro.lbQtdeImg2.Caption := '0/0'
  else
    frmMensagemKentro.lbQtdeImg2.Caption := IntToStr(fTempListaImagens2.RecNo) + '/' + IntToStr(fTempListaImagens2.RecordCount);
end;

end.
