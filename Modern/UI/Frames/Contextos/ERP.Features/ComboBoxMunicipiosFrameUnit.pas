unit ComboBoxMunicipiosFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, MunicipioEtdUnit;

type
  TComboBoxMunicipiosFrameChange = procedure(Sender: TObject; Municipio: MunicipioEtd) of object;

  TSetupComboBoxMunicipiosFrame = record
  private
    MunicipioId: Integer;
    ShowAddInfo, AddFirstNull: Boolean;
  public
    class function Create(
      MunicipioId: Integer; 
      ShowAddInfo, AddFirstNull: Boolean
    ): TSetupComboBoxMunicipiosFrame; static;
  end;

  TComboBoxMunicipiosFrame = class(TFrame)
    edMunicipios: TComboBox;
    pnInfo: TPanel;
    lbInfo: TLabel;
    procedure edMunicipiosChange(Sender: TObject);
  private
    FMunicipios: MunicipiosEtd;
    FOnMunicipioChange: TComboBoxMunicipiosFrameChange;

    procedure SetLabelInfo(Municipio: MunicipioEtd);
  public
    destructor Destroy; override;
    procedure Setup(const Input: TSetupComboBoxMunicipiosFrame);

    function GetCodigoIBGE(): Integer;
    function GetMunicipio: MunicipioEtd;
    procedure SetCodigoIBGE(Value: Integer);

    property OnMunicipioChange: TComboBoxMunicipiosFrameChange read FOnMunicipioChange write FOnMunicipioChange;
  end;

implementation

uses ContainerUnit, ErpFeaturesFactoryUnit;

{$R *.dfm}

{ TComboBoxMunicipiosFrame }

destructor TComboBoxMunicipiosFrame.Destroy;
begin
  FMunicipios.Free();

  inherited;
end;

procedure TComboBoxMunicipiosFrame.edMunicipiosChange(Sender: TObject);
var
  M: MunicipioEtd;
begin
  M := nil;
  if (edMunicipios.ItemIndex >= 0) and
    (edMunicipios.ItemIndex < edMunicipios.Items.Count) then
  begin
    M := MunicipioEtd(edMunicipios.Items.Objects[edMunicipios.ItemIndex]);

    if Assigned(FOnMunicipioChange) then
      FOnMunicipioChange(Self, M);
  end;

  SetLabelInfo( M );
end;

function TComboBoxMunicipiosFrame.GetCodigoIBGE: Integer;
var
  M: MunicipioEtd;
begin
  Result := 0;
  M := nil;

  if (edMunicipios.ItemIndex >= 0) and
    (edMunicipios.ItemIndex < edMunicipios.Items.Count) then
  begin
    M := MunicipioEtd(edMunicipios.Items.Objects[edMunicipios.ItemIndex]);

    if M <> nil then
      Result := M.Codigo;
  end;
end;

function TComboBoxMunicipiosFrame.GetMunicipio: MunicipioEtd;
var
  M: MunicipioEtd;
begin
  Result := nil;

  if (edMunicipios.ItemIndex >= 0) and
    (edMunicipios.ItemIndex < edMunicipios.Items.Count) then
  begin
    M := MunicipioEtd(edMunicipios.Items.Objects[edMunicipios.ItemIndex]);

    Result := MunicipioEtd(M.Clone());
  end;
end;

procedure TComboBoxMunicipiosFrame.SetCodigoIBGE(Value: Integer);
var
  municipio, current: MunicipioEtd;
  I, Idx: Integer;
begin
  current := nil;
  Idx := -1;
  for I := 0 to FMunicipios.Count - 1 do
  begin
    municipio := MunicipioEtd(FMunicipios.Items[I]);

    if municipio.Codigo = Value then
    begin
      Idx := I;
      current := MunicipioEtd(FMunicipios.Items[I]);
      Break;
    end;
  end;

  edMunicipios.ItemIndex := Idx;

  SetLabelInfo( current );
end;

procedure TComboBoxMunicipiosFrame.SetLabelInfo(
  Municipio: MunicipioEtd);
begin
  if Municipio = nil then
    lbInfo.Caption := ''

  else
    lbInfo.Caption := Format('Código: %d - Estado: %s', [ Municipio.Codigo, Municipio.Estado.Nome ]);
end;

procedure TComboBoxMunicipiosFrame.Setup(
  const Input: TSetupComboBoxMunicipiosFrame
);
var
  municipio, current: MunicipioEtd;
  I: Integer;
begin
  FreeAndNil(FMunicipios);
  edMunicipios.Items.Clear();

  with Container.GetInstance().ErpFeaturesFactory.CreateListarTodosMunicipiosUseCase() do
  try
    FMunicipios := Executar();
  finally
    FreeSafe();
  end;

  current := nil;
  for I := 0 to FMunicipios.Count - 1 do
  begin
    municipio := MunicipioEtd(FMunicipios.Items[I]);

    edMunicipios.AddItem(
      Format('%s [ %d ]', [ municipio.Nome, municipio.Codigo ]),
      municipio
    );
    if municipio.Codigo = Input.MunicipioId then
    begin
      current := MunicipioEtd(FMunicipios.Items[I]);
      edMunicipios.ItemIndex := I;
    end;
  end;

  SetLabelInfo( current );

  pnInfo.Visible := Input.ShowAddInfo;

  if Input.AddFirstNull then
    edMunicipios.Items.InsertObject(0, '', nil);
end;

{ TSetupComboBoxMunicipiosFrame }

class function TSetupComboBoxMunicipiosFrame.Create(MunicipioId: Integer;
  ShowAddInfo, AddFirstNull: Boolean): TSetupComboBoxMunicipiosFrame;
begin
  Result.MunicipioId := MunicipioId;
  Result.ShowAddInfo := ShowAddInfo;
  Result.AddFirstNull := AddFirstNull;
end;

end.
