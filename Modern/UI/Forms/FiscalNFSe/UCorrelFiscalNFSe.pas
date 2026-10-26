unit UCorrelFiscalNFSe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBGridFrameUnit, ExtCtrls, CorrelacaoCodigosFiscaisDataSet, DBCtrls;

type
  TFormCorrelFiscalCampo = (cfLC116, cfCTribNac, cfNBS, cfCIndOp);
  TFormCorrelFiscalNFSeSelect = procedure(Campo: TFormCorrelFiscalCampo; const Value: string) of object;
  TFormCorrelFiscalNFSe = class(TForm)
    pnGrid: TPanel;
    DBGridFrame1: TDBGridFrame;
    pnContent: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    edDescrCtribNac: TDBMemo;
    edDescNbs: TDBMemo;
    edDescCIndOp: TDBEdit;
    Splitter3: TSplitter;
    Panel8: TPanel;
    linkUsarCtribNac: TLabel;
    linkUsarNbs: TLabel;
    linkUsarCIndOp: TLabel;
    linkUsarCLC116: TLabel;
    procedure linkUsarCLC116Click(Sender: TObject);
    procedure linkUsarCIndOpClick(Sender: TObject);
    procedure linkUsarNbsClick(Sender: TObject);
    procedure linkUsarCtribNacClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    DataSet: TCorrelacaoCodigosFiscaisDataSet;
    FOnSelectCampo: TFormCorrelFiscalNFSeSelect;
  public
    procedure Setup(const CLC116, CTribNac, CNBS, CIndOp: string);

    property OnSelectCampo: TFormCorrelFiscalNFSeSelect write FOnSelectCampo;
  end;

var
  FormCorrelFiscalNFSe: TFormCorrelFiscalNFSe;

implementation

uses
  FilterConditionFrameUnit, DB, uDataSet_OOP, FieldsConfigUnit, DbGridConfigUtilsUnit, StringServiceUnit;

{$R *.dfm}

procedure TFormCorrelFiscalNFSe.FormCreate(Sender: TObject);
begin
  DataSet := TCorrelacaoCodigosFiscaisDataSet.Create();
end;

procedure TFormCorrelFiscalNFSe.FormDestroy(Sender: TObject);
begin
  DataSet.Free();
end;

procedure TFormCorrelFiscalNFSe.linkUsarCIndOpClick(Sender: TObject);
begin
  if Assigned(FOnSelectCampo) then
    FOnSelectCampo(cfCIndOp, DataSet.fstr('cindop'));
end;

procedure TFormCorrelFiscalNFSe.linkUsarCLC116Click(Sender: TObject);
begin
  if Assigned(FOnSelectCampo) then
    FOnSelectCampo(cfLC116, DataSet.fstr('clc116'));
end;

procedure TFormCorrelFiscalNFSe.linkUsarCtribNacClick(Sender: TObject);
begin
  if Assigned(FOnSelectCampo) then
    FOnSelectCampo(cfCTribNac, DataSet.fstr('ctribnac'));
end;

procedure TFormCorrelFiscalNFSe.linkUsarNbsClick(Sender: TObject);
begin
  if Assigned(FOnSelectCampo) then
    FOnSelectCampo(cfNBS, DataSet.fstr('cnbs'));
end;

procedure TFormCorrelFiscalNFSe.Setup(const CLC116, CTribNac, CNBS, CIndOp: string);
var
  builder: IFieldsConfigBuilder;
  sCLC116: string;
begin
  builder := FieldsConfigFactory.Create();

  DataSet.Setup(builder);

  DBGridFrame1.Setup( TDBGridFrameSetup.CreateClean() );
  DBGridFrame1.DataSource := DataSet._dataSourceOOP;
  edDescrCtribNac.DataSource := DBGridFrame1.DataSource;
  edDescCIndOp.DataSource := DBGridFrame1.DataSource;
  edDescNbs.DataSource := DBGridFrame1.DataSource;

  DbGridConfigUtils.ApplyToDBGrid(DBGridFrame1.DBGrid, builder.List);

  if Trim(CLC116) <> '' then
    DBGridFrame1.FilterContainerFrame1.CriarFiltro( TFilterConditionFrameInput.Create(
      'CLC116', builder.List.Field['CLC116'].DisplayLabel, StringService.PadLeft(CLC116, 5, '0'), ftString
    ), fcEquals, False);

  if Trim(CTribNac) <> '' then
    DBGridFrame1.FilterContainerFrame1.CriarFiltro( TFilterConditionFrameInput.Create(
      'CTRIBNAC', builder.List.Field['CTRIBNAC'].DisplayLabel, CTribNac, ftString
    ), fcEquals, False);

  if Trim(CNBS) <> '' then
    DBGridFrame1.FilterContainerFrame1.CriarFiltro( TFilterConditionFrameInput.Create(
      'CNBS', builder.List.Field['CNBS'].DisplayLabel, CNBS, ftString
    ), fcEquals, False);

  if Trim(CIndOp) <> '' then
    DBGridFrame1.FilterContainerFrame1.CriarFiltro( TFilterConditionFrameInput.Create(
      'CINDOP', builder.List.Field['CINDOP'].DisplayLabel, CIndOp, ftString
    ), fcEquals, False);
end;

end.
