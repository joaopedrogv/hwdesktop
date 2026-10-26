unit ComboBoxGruposFiscaisFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, GrupoFiscalEtdUnit;

type
  TComboBoxGruposFiscaisFrameChange = procedure(Sender: TObject; GrupoFiscal: GrupoFiscalEtd) of object;

  TSetupTipoConsultaGruposFiscais = ( tcgfTodosEAtual, tcgfComAnexo );

  TSetupComboBoxGruposFiscaisFrame = record
  private
    GrupoFiscalId: string;
    AddFirstNull: Boolean;
    TipoConsulta: TSetupTipoConsultaGruposFiscais;
  public
    class function Create(
      const GrupoFiscalId: string;
      AddFirstNull: Boolean;
      TipoConsulta: TSetupTipoConsultaGruposFiscais
    ): TSetupComboBoxGruposFiscaisFrame; static;
  end;

  TComboBoxGruposFiscaisFrame = class(TFrame)
    edGruposFiscais: TComboBox;
    procedure edGruposFiscaisChange(Sender: TObject);
  private   
    FGruposFiscais: GruposFiscaisEtd;
    FOnGrupoFiscalChange: TComboBoxGruposFiscaisFrameChange;
  public 
    destructor Destroy; override;
    procedure Setup(const Input: TSetupComboBoxGruposFiscaisFrame);

    function GetGrupoFiscalId(): string;
    function GetGrupoFiscal: GrupoFiscalEtd;

    property OnGrupoFiscalChange: TComboBoxGruposFiscaisFrameChange read FOnGrupoFiscalChange write FOnGrupoFiscalChange;
  end;

implementation

uses
  ContainerUnit;

{$R *.dfm}

destructor TComboBoxGruposFiscaisFrame.Destroy;
begin
  FGruposFiscais.Free();
  inherited;
end;

procedure TComboBoxGruposFiscaisFrame.edGruposFiscaisChange(Sender: TObject);
var
  M: GrupoFiscalEtd;
begin
  M := nil;
  if (edGruposFiscais.ItemIndex >= 0) and
    (edGruposFiscais.ItemIndex < edGruposFiscais.Items.Count) then
  begin
    M := GrupoFiscalEtd(edGruposFiscais.Items.Objects[edGruposFiscais.ItemIndex]);

    if Assigned(FOnGrupoFiscalChange) then
      FOnGrupoFiscalChange(Self, M);
  end;

end;

function TComboBoxGruposFiscaisFrame.GetGrupoFiscal: GrupoFiscalEtd;
var
  G: GrupoFiscalEtd;
begin
  Result := nil;

  if (edGruposFiscais.ItemIndex >= 0) and
    (edGruposFiscais.ItemIndex < edGruposFiscais.Items.Count) then
  begin
    G := GrupoFiscalEtd(edGruposFiscais.Items.Objects[edGruposFiscais.ItemIndex]);

    Result := GrupoFiscalEtd(G.Clone());
  end;
end;

function TComboBoxGruposFiscaisFrame.GetGrupoFiscalId: string;
var
  G: GrupoFiscalEtd;
begin
  Result := '';
  G := nil;

  if (edGruposFiscais.ItemIndex >= 0) and
    (edGruposFiscais.ItemIndex < edGruposFiscais.Items.Count) then
  begin
    G := GrupoFiscalEtd(edGruposFiscais.Items.Objects[edGruposFiscais.ItemIndex]);

    if G <> nil then
      Result := G.Id;
  end;
end;

procedure TComboBoxGruposFiscaisFrame.Setup(
  const Input: TSetupComboBoxGruposFiscaisFrame);
var
  GrupoFiscal, current: GrupoFiscalEtd;
  I: Integer;
begin
  FreeAndNil(FGruposFiscais);
  edGruposFiscais.Items.Clear();

  case Input.TipoConsulta of
    tcgfTodosEAtual:
      with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodosGruposFiscaisUseCase() do
      try
        FGruposFiscais := Executar( Input.GrupoFiscalId );
      finally
        FreeSafe();
      end;

    tcgfComAnexo:
      with Container.GetInstance().ErpFeaturesFactory.CreateListarGruposFiscaisComAnexoVinculadoUseCase() do
      try
        FGruposFiscais := Executar( );
      finally
        FreeSafe();
      end;
  end;

  current := nil;
  for I := 0 to FGruposFiscais.Count - 1 do
  begin
    GrupoFiscal := GrupoFiscalEtd(FGruposFiscais.Items[I]);

    edGruposFiscais.AddItem(
      Format('%s [ %d ]', [ GrupoFiscal.Descricao, GrupoFiscal.SeqId ]),
      GrupoFiscal
    );
    if GrupoFiscal.Id = Input.GrupoFiscalId then
    begin
      current := GrupoFiscalEtd(FGruposFiscais.Items[I]);
      edGruposFiscais.ItemIndex := I;
    end;
  end;

  if Input.AddFirstNull then
    edGruposFiscais.Items.InsertObject(0, '', nil);
end;

{ TSetupComboBoxGruposFiscaisFrame }

class function TSetupComboBoxGruposFiscaisFrame.Create(
  const GrupoFiscalId: string; AddFirstNull: Boolean;
  TipoConsulta: TSetupTipoConsultaGruposFiscais): TSetupComboBoxGruposFiscaisFrame;
begin
  Result.GrupoFiscalId := GrupoFiscalId;
  Result.AddFirstNull := AddFirstNull;
  Result.TipoConsulta := TipoConsulta;
end;

end.
