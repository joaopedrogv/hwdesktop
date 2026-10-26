unit ShowDocumentsPessoaUseCase;

interface

uses
  BaseUseCaseAO;

type
  TShowDocumentsPessoaUseCase = class(TUseCaseBaseAssineOn)
  private
    function ValidateMe: Boolean;
  public
    procedure Run();
  end;

implementation

{ TShowDocumentsPessoaUseCase }

uses
  System.SysUtils,
  System.StrUtils,
  Vcl.Forms,
  Winapi.Windows,
  frmTermosPessoa,
  hw_utils,
  AssineonRepo,
  frmConfAssineOn,
  ApiAssineOn, BaseConsts;

procedure TShowDocumentsPessoaUseCase.Run;
begin
  try
    InitUseCase();

    if not ValidateMe then
      Exit;

//    TAssineOnRepoSingleton.GetInstance().GetAccount

    Application.CreateForm(TformTermosPessoa, formTermosPessoa);

    formTermosPessoa.clienteId := StrToIntDef(ParamsUC['clienteId'], 0);
    formTermosPessoa.colaboradorId := StrToIntDef(ParamsUC['colaboradorId'], 0);
    //VALIDAR SE OS ID CORRESPONDEM A MESMA PESSOA NO BANCO DE DADOS
    // TALVEZ UM METODO NO REPO QUE RETORNA TODOS OS CLIENTES E COLABORADORES PELO ID , E AQUI VALIDAR SE OS CPFS BATEM

    formTermosPessoa.ShowModal;

  except on E: Exception do
    begin
      LastError := E.message;
      ShowAtencao(StrConcat(['Erro ao apresentar documentos', _LB, _LB, E.Message]));
    end;
  end;
end;

function TShowDocumentsPessoaUseCase.ValidateMe: Boolean;
begin

  var repo := TAssineOnRepoSingleton.GetInstance();
  var accountDb := repo.GetAccount();

  var api := TApiAssineOnSingleton.GetInstance();

  if accountDb.bearerToken = '' then
    ShowAtencao('Sua conta AssineOn ainda não está configurada. Por favor configure para continuar');

  while accountDb.bearerToken = '' do
  begin
    Application.CreateForm(TformConfAssineOn, formConfAssineOn);
    formConfAssineOn.ShowModal;

    accountDb := repo.GetAccount();
    if accountDb.bearerToken <> '' then
      Break
    else if ShowConfirmacao('Configuração não foi concluída. Deseja deixar para depois?') = ID_YES then
      Break;
  end;

  if accountDb.bearerToken = '' then
    Exit(False);

  api.bearerToken := accountDb.bearerToken;
  var me := api.GetMe();

  if not Assigned(me) then
  begin
    ShowAtencao(Format('AssineOn não retornou dados de usuário. %s', [MSG_SUPORTE]));
    Exit(False);
  end
  else if not me.email.ToLower().Equals(accountDb.email.ToLower()) then
  begin
    ShowAtencao('Cadastro do AssineOn não corresponde ao cadastro da empresa');
    Exit(False);
  end
  else
    Result := True;
end;

end.
