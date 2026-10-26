unit UCadNFSeCriarAPartirDeOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, Mask, uPadrao,
  uEditHw, ExtCtrls,
  TipoComunsUnit, ConfiguracaoNFSeModelUnit, DBGridFrameUnit, NFSeCriarAPartirDeOSDataSet;

type
  TFrmCadNFSeCriarAPartirDeOSInput = record
  private
    ConfigNFSe: ConfiguracaoNFSeModel;
    NumerosOSs: TArrayInteger;
  public
    class function Create(
      const ConfigNFSe: ConfiguracaoNFSeModel;
      const NumerosOSs: TArrayInteger
    ): TFrmCadNFSeCriarAPartirDeOSInput; static;
  end;

  TFrmCadNFSeCriarAPartirDeOSCallback = procedure(
    const NumerosOSs: TArrayInteger; CriarEmitir: Boolean; out CloseFormulario: Boolean
  ) of object;

  TFrmCadNFSeCriarAPartirDeOS = class(TfrmPadrao)
    pnContent: TPanel;
    pnGrid: TPanel;
    DBGridFrame1: TDBGridFrame;
    pnBottom: TPanel;
    btCriareEmitir: TBitBtn;
    btSair: TBitBtn;
    pnResultProblems: TPanel;
    btCriarEditar: TBitBtn;
    procedure btCriareEmitirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDataSet: TNFSeCriarAPartirDeOSDataSet;
    FCallback: TFrmCadNFSeCriarAPartirDeOSCallBack;
    procedure SetCallBack(const Value: TFrmCadNFSeCriarAPartirDeOSCallBack);
  public
    procedure Setup(const Input: TFrmCadNFSeCriarAPartirDeOSInput);

    property CallBack: TFrmCadNFSeCriarAPartirDeOSCallBack read FCallback write SetCallBack;
  end;

var
  FrmCadNFSeCriarAPartirDeOS: TFrmCadNFSeCriarAPartirDeOS;

implementation

uses
  FieldsConfigUnit, DbGridConfigUtilsUnit;

{$R *.dfm}

{ TFrmCadNFSeCriarAPartirDeOSInput }

class function TFrmCadNFSeCriarAPartirDeOSInput.Create(const ConfigNFSe: ConfiguracaoNFSeModel;
  const NumerosOSs: TArrayInteger): TFrmCadNFSeCriarAPartirDeOSInput;
begin
  Result.ConfigNFSe := ConfigNFSe;
  Result.NumerosOSs := NumerosOSs;
end;

{ TFrmCadNFSeCriarAPartirDeOS }

procedure TFrmCadNFSeCriarAPartirDeOS.btCriareEmitirClick(Sender: TObject);
var
  fecharForm: Boolean;
begin
  if Assigned(FCallback) then
  begin
    FCallback( FDataSet.GetSelecionados(), (Sender = btCriareEmitir), fecharForm );

    if fecharForm then
    begin
      ModalResult := mrOk;
      Exit;
    end;
  end;
end;

procedure TFrmCadNFSeCriarAPartirDeOS.FormCreate(Sender: TObject);
begin
  inherited;
  FDataSet := TNFSeCriarAPartirDeOSDataSet.Create();
end;

procedure TFrmCadNFSeCriarAPartirDeOS.SetCallBack(const Value: TFrmCadNFSeCriarAPartirDeOSCallBack);
begin
  FCallback := Value;
end;

procedure TFrmCadNFSeCriarAPartirDeOS.Setup(const Input: TFrmCadNFSeCriarAPartirDeOSInput);
var
  builder: IFieldsConfigBuilder;
begin
  builder := FieldsConfigFactory.Create();

  FDataSet.Setup( builder, TNFSeCriarAPartirDeOSDataSetSetup.Create(
    Input.ConfigNFSe.AgruparPorCTribNac, 'SEL'
  ));
  DBGridFrame1.Setup( TDBGridFrameSetup.CreateSelection( glaTop, [ gbtSelection ], 'SEL' ));
  DBGridFrame1.DataSource := FDataSet._dataSourceOOP;

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrame1.DBGrid, builder.List );

  FDataSet.Executar( Input.NumerosOSs );

  DBGridFrame1.btnSelectAll.Click();
end;

end.
