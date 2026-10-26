unit UCadNFSeHistorico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, DBGridFrameUnit,
  NFSeHistoricoDataSet, StdCtrls, Buttons, DBCtrls;

type
  TFrmCadNFSeHistorico = class(TfrmPadrao)
    DBGridFrame1: TDBGridFrame;
    pnBottom: TPanel;
    btSair: TBitBtn;
    pnContent: TPanel;
    DBMemo1: TDBMemo;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDataSet: TNFSeHistoricoDataSet;
  public
    procedure Setup(NFSeId: string);
  end;

var
  FrmCadNFSeHistorico: TFrmCadNFSeHistorico;

implementation

uses
  uDataSet_OOP, DbGridConfigUtilsUnit, FieldsConfigUnit;

{$R *.dfm}

{ TFrmCadNFSeHistorico }

procedure TFrmCadNFSeHistorico.FormCreate(Sender: TObject);
var
  builder: IFieldsConfigBuilder;
begin                                                                  
  FDataSet := TNFSeHistoricoDataSet.Create();

  builder := FieldsConfigFactory.Create();
  FDataSet.Setup( builder );

  DBGridFrame1.Setup( TDBGridFrameSetup.CreateClean() );
  DBGridFrame1.DataSource := FDataSet._dataSourceOOP;
  DBMemo1.DataField := 'DESCRICAO';
  DBMemo1.DataSource := FDataSet._dataSourceOOP;

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrame1.DBGrid, builder.List );
end;

procedure TFrmCadNFSeHistorico.FormDestroy(Sender: TObject);
begin
  FDataSet.Free();
end;

procedure TFrmCadNFSeHistorico.Setup(NFSeId: string);
begin
  FDataSet.SQLMaker.FilterMk.FreeFilters().Add('NFSE_ID', NFSeId);
  FDataSet.RunSQLMaker();
end;

end.
