unit ComboBoxOpInternasFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OperacaoInternaEtdUnit, StdCtrls, ExtCtrls;

type
  TComboBoxOpInternasFrameChange = procedure(Sender: TObject; OpInterna: OperacaoInternaEtd) of object;

  TSetupComboBoxOpInternasFrame = record
  private
    OpInternaId: string;
    ShowAddInfo, AddFirstNull: Boolean;
  public
    class function Create(
      OpInternaId: string; 
      ShowAddInfo, AddFirstNull: Boolean
    ): TSetupComboBoxOpInternasFrame; static;
  end;

  TComboBoxOpInternasFrame = class(TFrame)
    pnInfo: TPanel;
    lbInfo: TLabel;
    edOpInternas: TComboBox;
    procedure edOpInternasChange(Sender: TObject);
  private
    FOpInternas: OperacoesInternasEtd;
    FOnOpInternaChange: TComboBoxOpInternasFrameChange;

    procedure SetLabelInfo(OpInterna: OperacaoInternaEtd);
  public
    destructor Destroy; override;
    procedure Setup(const Input: TSetupComboBoxOpInternasFrame);

    function GetOperacaoInternaId(): string;
    function GetOpInterna: OperacaoInternaEtd;

    property OnOpInternaChange: TComboBoxOpInternasFrameChange read FOnOpInternaChange write FOnOpInternaChange;
  end;

implementation

uses ContainerUnit, ErpFeaturesFactoryUnit, ArrayServiceUnit, StringServiceUnit;

{$R *.dfm}

{ TComboBoxOpInternasFrame }

destructor TComboBoxOpInternasFrame.Destroy;
begin
  FOpInternas.Free();

  inherited;
end;

procedure TComboBoxOpInternasFrame.edOpInternasChange(Sender: TObject);
var
  M: OperacaoInternaEtd;
begin
  M := nil;
  if (edOpInternas.ItemIndex >= 0) and
    (edOpInternas.ItemIndex < edOpInternas.Items.Count) then
  begin
    M := OperacaoInternaEtd(edOpInternas.Items.Objects[edOpInternas.ItemIndex]);

    if Assigned(FOnOpInternaChange) then
      FOnOpInternaChange(Self, M);
  end;

  SetLabelInfo( M );
end;

function TComboBoxOpInternasFrame.GetOperacaoInternaId: string;
var
  OP: OperacaoInternaEtd;
begin
  Result := '';
  OP := nil;

  if (edOpInternas.ItemIndex >= 0) and
    (edOpInternas.ItemIndex < edOpInternas.Items.Count) then
  begin
    OP := OperacaoInternaEtd(edOpInternas.Items.Objects[edOpInternas.ItemIndex]);

    if OP <> nil then
      Result := OP.Id;
  end;
end;

function TComboBoxOpInternasFrame.GetOpInterna: OperacaoInternaEtd;
var
  M: OperacaoInternaEtd;
begin
  Result := nil;

  if (edOpInternas.ItemIndex >= 0) and
    (edOpInternas.ItemIndex < edOpInternas.Items.Count) then
  begin
    M := OperacaoInternaEtd(edOpInternas.Items.Objects[edOpInternas.ItemIndex]);

    Result := OperacaoInternaEtd(M.Clone());
  end;
end;

procedure TComboBoxOpInternasFrame.SetLabelInfo(
  OpInterna: OperacaoInternaEtd);
begin
  if OpInterna = nil then
    lbInfo.Caption := ''

  else
    lbInfo.Caption := Format('Código: %d - Empresas: [ %s ]',
      [ OpInterna.SeqId, StringService.Join(',', ArrayService.IntArrayToStringArray(OpInterna.EmpresasId)) ]
    );
end;

procedure TComboBoxOpInternasFrame.Setup(
  const Input: TSetupComboBoxOpInternasFrame
);
var
  OpInterna, current: OperacaoInternaEtd;
  I: Integer;
begin
  FreeAndNil(FOpInternas);
  edOpInternas.Items.Clear();

  with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodasOperacoesInternasUseCase() do
  try
    FOpInternas := Executar( Input.OpInternaId );
  finally
    FreeSafe();
  end;

  current := nil;
  for I := 0 to FOpInternas.Count - 1 do
  begin
    OpInterna := OperacaoInternaEtd(FOpInternas.Items[I]);

    edOpInternas.AddItem(
      Format('%s [ %d ]', [ OpInterna.Descricao, OpInterna.SeqId ]),
      OpInterna
    );
    if OpInterna.Id = Input.OpInternaId then
    begin
      current := OperacaoInternaEtd(FOpInternas.Items[I]);
      edOpInternas.ItemIndex := I;
    end;
  end;

  SetLabelInfo( current );

  pnInfo.Visible := Input.ShowAddInfo;

  if Input.AddFirstNull then
    edOpInternas.Items.InsertObject(0, '', nil);
end;

{ TSetupComboBoxOpInternasFrame }

class function TSetupComboBoxOpInternasFrame.Create(OpInternaId: string;
  ShowAddInfo, AddFirstNull: Boolean): TSetupComboBoxOpInternasFrame;
begin
  Result.OpInternaId := OpInternaId;
  Result.ShowAddInfo := ShowAddInfo;
  Result.AddFirstNull := AddFirstNull;
end;

end.
