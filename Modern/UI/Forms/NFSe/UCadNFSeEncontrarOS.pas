unit UCadNFSeEncontrarOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, uEditHw, DBGridFrameUnit, Mask, ExtCtrls, NFSeEncontrarOSDataSet, TipoComunsUnit;

type
  TFrmCadNFSeEncontrarOSCallback = function(const NumerosOSs: TArrayInteger): Boolean of object;

  TFrmCadNFSeEncontrarOS = class(TfrmPadrao)
    pnContent: TPanel;
    pnTop: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    lbDhCancelamento: TLabel;
    edDataIni: TMaskEdit;
    pnGrid: TPanel;
    pnBottom: TPanel;
    DBGridFrame1: TDBGridFrame;
    edNumOS: TEditHw;
    Label2: TLabel;
    edNomeCliente: TMaskEdit;
    btProcurar: TBitBtn;
    edDataFim: TMaskEdit;
    Label3: TLabel;
    btLimparDatas: TSpeedButton;
    btConcluir: TBitBtn;
    btSair: TBitBtn;
    procedure btConcluirClick(Sender: TObject);
    procedure btProcurarClick(Sender: TObject);
    procedure btLimparDatasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDataSet: TNFSeEncontrarOSDataSet;
    FCallback: TFrmCadNFSeEncontrarOSCallback;
    procedure SetCallback(const Value: TFrmCadNFSeEncontrarOSCallback);
  public
    procedure Setup();

    property Callback: TFrmCadNFSeEncontrarOSCallback write SetCallback;
  end;

var
  FrmCadNFSeEncontrarOS: TFrmCadNFSeEncontrarOS;

implementation

uses
  uDataSet_OOP, hw_win_utils,
  DbGridConfigUtilsUnit, FieldsConfigUnit, IntegerNullableUnit, DateAndTimeNullableUnit, StringNullableUnit;

{$R *.dfm}

{ TFrmCadNFSeEncontrarOS }

procedure TFrmCadNFSeEncontrarOS.btConcluirClick(Sender: TObject);
begin
  if Assigned(FCallback) then
    if FCallback(FDataSet.GetSelecionados()) then
      ModalResult := mrOk;
end;

procedure TFrmCadNFSeEncontrarOS.btLimparDatasClick(Sender: TObject);
begin
  inherited;
  edDataIni.Clear();
  edDataFim.Clear();
end;

procedure TFrmCadNFSeEncontrarOS.btProcurarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    FDataSet.Executar( TNFSeEncontrarOSDataSetInput.Create(
      IntegerNullable.Create(edNumOS.AsInteger, edNumOS.IsNull),
      DateNullable.CreateOrNull(StrToDateDef(edDataIni.Text, 0)),
      DateNullable.CreateOrNull(StrToDateDef(edDataFim.Text, 0)),
      StringNullable.CreateOrNull(Trim(edNomeCliente.Text))
    ));
    if not FDataSet.IsEmpty and DBGridFrame1.DBGrid.CanFocus() and DBGridFrame1.DBGrid.Showing then
      DBGridFrame1.DBGrid.SetFocus();

    RegistroWin.Write( Self.Name, edNumOS.Name, edNumOS.AsString );
    RegistroWin.Write( Self.Name, edDataIni.Name, edDataIni.Text );
    RegistroWin.Write( Self.Name, edDataFim.Name, edDataFim.Text );
    RegistroWin.Write( Self.Name, edNomeCliente.Name, edNomeCliente.Text );

    if not FDataSet.IsEmpty and DBGridFrame1.DBGrid.CanFocus() and Self.Visible then
      DBGridFrame1.DBGrid.SetFocus();    

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSeEncontrarOS.FormCreate(Sender: TObject);
var
  builder: IFieldsConfigBuilder;
begin
  builder := FieldsConfigFactory.Create();

  FDataSet := TNFSeEncontrarOSDataSet.Create( builder, 'SEL' );

  DBGridFrame1.Setup( TDBGridFrameSetup.CreateSelection( glaTop, [ gbtSelection ], 'SEL' ));
  DBGridFrame1.DataSource := FDataSet._dataSourceOOP;

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrame1.DBGrid, builder.List );
end;

procedure TFrmCadNFSeEncontrarOS.FormDestroy(Sender: TObject);
begin
  FDataSet.Free();

  inherited;
end;

procedure TFrmCadNFSeEncontrarOS.SetCallback(const Value: TFrmCadNFSeEncontrarOSCallback);
begin
  FCallback := Value;

  btConcluir.Visible := Assigned(FCallback);  
end;

procedure TFrmCadNFSeEncontrarOS.Setup;
var
  nOs: Integer;
  S: string;
begin
  nOs := RegistroWin.Read(Self.Name, edNumOS.Name, -1);
  edNumOS.UpdateValue(nOs, nOs = -1);

  S := RegistroWin.Read(Self.Name, edDataIni.Name, '');
  if S <> '' then
    edDataIni.Text := FormatDateTime('dd/MM/yyyy', StrToDateTimeDef(S, Date))
  else
    edDataIni.Clear;
  S := RegistroWin.Read(Self.Name, edDataFim.Name, '');
  if S <> '' then
    edDataFim.Text := FormatDateTime('dd/MM/yyyy', StrToDateTimeDef(S, Date))
  else
    edDataFim.Clear;

  edNomeCliente.Text := RegistroWin.Read(Self.Name, edNomeCliente.Name, '');

  btProcurar.Click();
end;

end.
