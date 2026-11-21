unit EventosDFeItemEditorFactory;

interface

uses
  System.Classes, Vcl.Controls, AuthorizationService, EditorCadastro,
  ValidadorItemEventoDFe211130Unit, EventoDFe211130ItemEditorFactory,
  EventoDFe211130ItemEtdUnit, NextMemoryQueryDefinition;

type
  TEventoDFe211130ItemEditorFactory = class(TInterfacedObject,
    IEventoDFe211130ItemEditorFactory)
  private
    FAuthorization: IAuthorizationService;
    FValidador: IValidadorItemEventoDFe211130;
  public
    constructor Create(const AAuthorization: IAuthorizationService;
      const AValidador: IValidadorItemEventoDFe211130);
    function Criar(AOwner: TComponent; AParent: TWinControl;
      const AHost: IEditorCadastroHost;
      const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>):
      TEventoDFe211130ItemEditor;
  end;

implementation

uses
  System.SysUtils, EventoDFe211130ItemFrame, EventoDFe211130ItemPresenter;

constructor TEventoDFe211130ItemEditorFactory.Create(
  const AAuthorization: IAuthorizationService;
  const AValidador: IValidadorItemEventoDFe211130);
begin
  inherited Create;
  if AAuthorization = nil then
    raise Exception.Create('O serviço de autorização do editor de item não foi informado.');
  if AValidador = nil then
    raise Exception.Create('O validador do item do evento 211130 não foi informado.');

  FAuthorization := AAuthorization;
  FValidador := AValidador;
end;

function TEventoDFe211130ItemEditorFactory.Criar(AOwner: TComponent;
  AParent: TWinControl; const AHost: IEditorCadastroHost;
  const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>):
  TEventoDFe211130ItemEditor;
var
  Frame: TfrmEventoDFe211130ItemFrame;
  Presenter: TEventoDFe211130ItemPresenter;
begin
  Frame := TfrmEventoDFe211130ItemFrame.Create(AOwner, AHost);
  try
    Presenter := TEventoDFe211130ItemPresenter.Create(Frame, FAuthorization,
      AColecao, FValidador);
    try
      Frame.ConfigurarPresenter(Presenter);
    except
      Presenter.Free;
      raise;
    end;

    Frame.Parent := AParent;
    Frame.Align := alClient;

    Result.Editor := Frame;
    Result.View := Frame;
  except
    Frame.Free;
    raise;
  end;
end;

end.