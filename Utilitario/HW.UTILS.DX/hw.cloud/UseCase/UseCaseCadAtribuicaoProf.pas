unit UseCaseCadAtribuicaoProf;

interface

uses
   BaseUseCaseHwCloud, System.Classes, System.Generics.Collections, UseCaseUpdateMensageriaAtribuirProf;

type

  TUseCaseCadAtribuicaoProf = class(TUseCaseBaseHwCloud)
  public
    function Run(
      AParamsList: WideString;
      pCodMens: Integer;
      pUuid: WideString;
      pOrigem: WideString;
      pCodTarefa: Integer;
      pTipoTarefa: WideString): Boolean;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  System.NetEncoding,
  System.Net.Mime,
  HwCloudRepo,
  ApiHwCloud,
  HwCloudModels,
  hw_utils,
  hw_win_utils,
  config_sistema_class,
  Datasnap.DBClient,
  uAtribuicaoProf,
  Vcl.Forms,
  Winapi.Windows,
  Data.DB;

{ TUseCaseCadAtribuicaoProf }

function TUseCaseCadAtribuicaoProf.Run(
  AParamsList: WideString;
  pCodMens: Integer;
  pUuid: WideString;
  pOrigem: WideString;
  pCodTarefa: Integer;
  pTipoTarefa: WideString): Boolean;
var
  buscarTipoTarefaPessoa: TBuscarTipoTarefaPessoa;
  dadoTipoTarefaPessoa: TDadosTipoTarefaPessoa;
  vDtSetProf: TClientDataSet;
  vDataSourceProf: TDataSource;
  vNomeVendedor, vCpfVendedor: string;
  I: Integer;
begin
  Result := False;
  try
    InitUseCase;

    repo := THwCloudRepoSingleton.GetInstance();
    api := TApiHwCloudSingleton.GetInstance();

    var conf := repo.GetConfigApi(CONF_API);

    if conf.empresaId <= 0 then
      if not silent then
        raise Exception.Create('Configuração para hwcloud não encontrada no Cadastro de API');

    try
      buscarTipoTarefaPessoa := TBuscarTipoTarefaPessoa.Create;
      buscarTipoTarefaPessoa.cnpj := conf.cnpj;
      buscarTipoTarefaPessoa.tpdados := 'tipo_tarefa_pessoas';

      dadoTipoTarefaPessoa := TDadosTipoTarefaPessoa.Create;
      dadoTipoTarefaPessoa.pagina := 0;
      dadoTipoTarefaPessoa.limite := 100;
      dadoTipoTarefaPessoa.filtro_geral_analisado := 'tipo_tarefa=''' + pTipoTarefa + ''' ';

      buscarTipoTarefaPessoa.dados := buscarTipoTarefaPessoa.dados + [dadoTipoTarefaPessoa];

      var useCase := api.BuscarTipoTarefaPessoa(buscarTipoTarefaPessoa);

      if not Assigned(useCase) then
        if not silent then
          raise Exception.Create('Buscar config sem resposta da API');

      if (useCase.status.Trim() <> '') and (useCase.status.Trim() <> 'OK') then
        if not silent then
          raise Exception.Create('Falha ao atribuir profissional responsável');

      if Assigned(useCase.resposta) then
        if Assigned(useCase.resposta.tipo_tarefa_pessoas) then
          if Assigned(useCase.resposta.tipo_tarefa_pessoas.resultado) then
          begin

            if Length(useCase.resposta.tipo_tarefa_pessoas.resultado) <= 0 then
              raise Exception.Create('Nenhum profissional disponível');

            try
              vDtSetProf := TClientDataSet.Create(nil);
              vDtSetProf.Close;
              vDtSetProf.FieldDefs.Clear;
              vDtSetProf.FieldDefs.Add('COD_VENDEDOR', ftInteger, 0, false);
              vDtSetProf.FieldDefs.Add('NOME_VENDEDOR', ftString, 35, false);
              vDtSetProf.FieldDefs.Add('CPF_VENDEDOR', ftString, 9, false);
              vDtSetProf.FieldDefs.Add('PLATAFORMA', ftString, 50, false);
              vDtSetProf.FieldDefs.Add('IDENTIFICADOR', ftString, 60, false);

              if vDtSetProf.Tag = 0 then
              try
                vDtSetProf.CreateDataSet;
                vDtSetProf.Tag := 1;

                vDtSetProf.FieldByName('NOME_VENDEDOR').DisplayLabel := 'Colaborador';
                vDtSetProf.FieldByName('CPF_VENDEDOR').DisplayLabel := 'CPF';
                vDtSetProf.FieldByName('PLATAFORMA').DisplayLabel := 'Plataforma';
                vDtSetProf.FieldByName('IDENTIFICADOR').DisplayLabel := 'Identificacao';

                vDtSetProf.FieldByName('COD_VENDEDOR').Visible := false;
              except
              end;

              vDataSourceProf := TDataSource.Create(nil);
              vDataSourceProf.DataSet := vDtSetProf;

              vDtSetProf.EmptyDataSet;

              for I := 0 to Length(useCase.resposta.tipo_tarefa_pessoas.resultado) - 1 do
              begin
                if useCase.resposta.tipo_tarefa_pessoas.resultado[I].tipo_pessoa = 'CI' then
                  if trim(useCase.resposta.tipo_tarefa_pessoas.resultado[I].cdpessoa) <> '' then
                  begin
                    repo.RetornaColaborador(StrToInt(useCase.resposta.tipo_tarefa_pessoas.resultado[I].cdpessoa), vNomeVendedor, vCpfVendedor);

                    if trim(vNomeVendedor) <> '' then
                    begin
                      vDtSetProf.Insert;
                      vDtSetProf.FieldByName('COD_VENDEDOR').AsInteger := StrToInt(useCase.resposta.tipo_tarefa_pessoas.resultado[I].cdpessoa);
                      vDtSetProf.FieldByName('NOME_VENDEDOR').AsString := trim(vNomeVendedor);
                      vDtSetProf.FieldByName('CPF_VENDEDOR').AsString := trim(vCpfVendedor);
                      vDtSetProf.FieldByName('PLATAFORMA').AsString := trim(useCase.resposta.tipo_tarefa_pessoas.resultado[I].plataforma_pad_envio);
                      vDtSetProf.FieldByName('IDENTIFICADOR').AsString := trim(useCase.resposta.tipo_tarefa_pessoas.resultado[I].cod_user_plataforma);
                      vDtSetProf.Post;
                    end;
                  end;
              end;

              try
                Application.CreateForm(TfrmAtribuirProf, frmAtribuirProf);
                frmAtribuirProf.DBGrid1.DataSource := vDataSourceProf;
                if frmAtribuirProf.ShowModal = IDOK then
                begin
                  var useCaseProf := TUseCaseUpdateMensageriaAtribuirProf.Create(AParamsList);
                  Result := useCaseProf.Run(
                    pCodMens,
                    pUuid,
                    pOrigem,
                    IntToStr(frmAtribuirProf.DBGrid1.DataSource.DataSet.FieldByName('COD_VENDEDOR').AsInteger),
                    trim(frmAtribuirProf.DBGrid1.DataSource.DataSet.FieldByName('PLATAFORMA').AsString),
                    trim(frmAtribuirProf.DBGrid1.DataSource.DataSet.FieldByName('IDENTIFICADOR').AsString))
                end;
              finally
                FreeAndNil(frmAtribuirProf);
              end;
            finally
              if Assigned(vDataSourceProf) then
                FreeAndNil(vDataSourceProf);
              if Assigned(vDtSetProf) then
                FreeAndNil(vDtSetProf);
            end;
          end;
    finally
      if Assigned(buscarTipoTarefaPessoa) then
        FreeAndNil(buscarTipoTarefaPessoa);
    end;
  except on E: Exception do
    begin
      Result := False;
      LastError := E.message;
      if not silent then
        ShowAtencao('Erro ao atribuir profissional responsável' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
