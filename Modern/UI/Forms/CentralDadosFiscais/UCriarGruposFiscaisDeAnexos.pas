unit UCriarGruposFiscaisDeAnexos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  TipoComunsUnit, GrupoFiscalEtdUnit, AnexoEtdUnit, MultiSelectAnexosFrameUnit,
  TipoTributoFiscalEnumUnit;

type
  TFrmCriarGruposFiscaisDeAnexosSetup = record
  private
    FAnexosJaCriados: TArrayString;
    FTipoTributo: TipoTributoFiscalEnum;
    FDataReferencia: TDate;
    FAnexosCompativeis: TArrayString;
  public
    class function Create(
      const AnexosJaCriados: TArrayString;
      const AnexosCompativeis: TArrayString;
      DataReferencia: TDate;
      TipoTributo: TipoTributoFiscalEnum
    ): TFrmCriarGruposFiscaisDeAnexosSetup; static;

    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property AnexosJaCriados: TArrayString read FAnexosJaCriados;
    property AnexosCompativeis: TArrayString read FAnexosCompativeis;
    property DataReferencia: TDate read FDataReferencia;
  end;

  TFrmCriarGruposFiscaisDeAnexos = class(TfrmPadrao)
    ScrollBox1: TScrollBox;
    pnTop: TPanel;
    Label1: TLabel;
    pnLog: TPanel;
    Panel3: TPanel;
    btSair: TBitBtn;
    MultiSelectAnexosFrame1: TMultiSelectAnexosFrame;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FAnexosJaCriados: TArrayString;
    FAnexosCompativeis: TArrayString;
    FTipoTributo: TipoTributoFiscalEnum;
    FData: TDate;
    procedure MultiSelectAnexosFrameModoChange(AModoSelecionado: TMultiSelectAnexosFrameModoEnum);
    procedure MultiSelectAnexosFramePopulateItem(const Anexo: AnexoEtd; var TextPrint: string; var Checked: Boolean);
  public
    procedure Setup(const Input: TFrmCriarGruposFiscaisDeAnexosSetup);
  end;

var
  FrmCriarGruposFiscaisDeAnexos: TFrmCriarGruposFiscaisDeAnexos;

implementation

uses ContainerUnit, CriarGruposFiscaisDeAnexosTypes, AnexosServiceUnit;

{$R *.dfm}      

{ TFrmCriarGruposFiscaisDeAnexosSetup }

class function TFrmCriarGruposFiscaisDeAnexosSetup.Create(
  const AnexosJaCriados: TArrayString;
  const AnexosCompativeis: TArrayString;
  DataReferencia: TDate;
  TipoTributo: TipoTributoFiscalEnum
): TFrmCriarGruposFiscaisDeAnexosSetup;
begin
  Result.FAnexosJaCriados := AnexosJaCriados;
  Result.FAnexosCompativeis := AnexosCompativeis;
  Result.FDataReferencia := DataReferencia;
  Result.FTipoTributo := TipoTributo;
end;

{ TFrmCriarGruposFiscaisDeAnexos }

procedure TFrmCriarGruposFiscaisDeAnexos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crDefault;
  try
    Container.GetInstance().ErpFeaturesFactory.CreateCriarGruposFiscaisDeAnexosUseCase()
      .Executar( CriarGruposFiscaisDeAnexosInput.Create(
        AnexosSerice.Agrupar( MultiSelectAnexosFrame1.GetSelecionados() ),
        FTipoTributo,
        FData
      ));
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCriarGruposFiscaisDeAnexos.FormCreate(Sender: TObject);
begin
  inherited;
  MultiSelectAnexosFrame1.OnModoChange := MultiSelectAnexosFrameModoChange;
  MultiSelectAnexosFrame1.OnDrawItem := MultiSelectAnexosFramePopulateItem;
end;

procedure TFrmCriarGruposFiscaisDeAnexos.MultiSelectAnexosFramePopulateItem(
  const Anexo: AnexoEtd;
  var TextPrint: string;
  var Checked: Boolean
);
var
  I, J: Integer;
begin
  for I := Low(FAnexosJaCriados) to High(FAnexosJaCriados) do
    if FAnexosJaCriados[I] = Anexo.Numero then
      TextPrint := '*' + TextPrint;

  Checked := False;
  for I := Low(FAnexosCompativeis) to High(FAnexosCompativeis) do
    if FAnexosCompativeis[I] = Anexo.Numero then
    begin
      for J := Low(FAnexosJaCriados) to High(FAnexosJaCriados) do
        if FAnexosJaCriados[J] = Anexo.Numero then
          Exit;

      Checked := True;
      Exit;
    end;
end;

procedure TFrmCriarGruposFiscaisDeAnexos.MultiSelectAnexosFrameModoChange(
  AModoSelecionado: TMultiSelectAnexosFrameModoEnum);
begin

end;

procedure TFrmCriarGruposFiscaisDeAnexos.Setup(
  const Input: TFrmCriarGruposFiscaisDeAnexosSetup
);
begin
  FAnexosJaCriados := Input.AnexosJaCriados;
  FAnexosCompativeis := Input.AnexosCompativeis;
  FTipoTributo := Input.TipoTributo;
  FData := Input.DataReferencia;

  MultiSelectAnexosFrame1.Setup(TMultiSelectAnexosFrameSetup.Create(
    Input.DataReferencia, Input.TipoTributo, msaResumido
  ));
end;

end.
