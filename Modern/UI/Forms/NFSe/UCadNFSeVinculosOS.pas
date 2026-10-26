unit UCadNFSeVinculosOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, uPadrao, StdCtrls, Buttons,
  DBGridFrameUnit, ExtCtrls, NFSeVinculosOSDataSet;

type
  TFrmCadNFSeVinculosOS = class(TfrmPadrao)
    pnContent: TPanel;
    DBGridFrame1: TDBGridFrame;
    pnBottom: TPanel;
    btSair: TBitBtn;
    btExcluir: TBitBtn;
    procedure btExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDataSet: TNFSeVinculosOSDataSet;
  public
    procedure Setup(const NFSeId: string); overload;
    procedure Setup(NumeroOS, EmpresaId: Integer); overload;
  end;

var
  FrmCadNFSeVinculosOS: TFrmCadNFSeVinculosOS;

implementation        

uses
  uDataSet_OOP, DbGridConfigUtilsUnit, FieldsConfigUnit, ContainerUnit, UIUtilsUnit;

{$R *.dfm}

procedure TFrmCadNFSeVinculosOS.btExcluirClick(Sender: TObject);
begin
  if FDataSet.IsEmpty() then
    Exit;

  if not FDataSet.Auditor.Processo('NFS023', 'NUM OS ' + FDataSet.fstr('nped'), FDataSet.fstr('nfse_id'))
    .Excluir.Permitido then
    Exit;

  try
    Container.GetInstance().ErpFeaturesFactory.CreateRemoverNFSeOSUseCase()
      .Executar( FDataSet.fstr('nfse_id'), FDataSet.fint('nped'), FDataSet.fint('cod_empresa') );

    UIUtils.ShowInfo('Vinculo removido com sucesso. NFSe Atualizada');

    FDataSet.Refresh();

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadNFSeVinculosOS.FormCreate(Sender: TObject);
var
  builder: IFieldsConfigBuilder;
begin                                                                  
  FDataSet := TNFSeVinculosOSDataSet.Create();

  builder := FieldsConfigFactory.Create();
  FDataSet.Setup( builder );

  DBGridFrame1.Setup( TDBGridFrameSetup.CreateClean() );
  DBGridFrame1.DataSource := FDataSet._dataSourceOOP;

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrame1.DBGrid, builder.List );
end;

procedure TFrmCadNFSeVinculosOS.Setup(const NFSeId: string);
begin
  FDataSet.SQLMaker.FilterMk.FreeFilters().Add('NFSE_ID', NFSeId);
  FDataSet.RunSQLMaker();
end;

procedure TFrmCadNFSeVinculosOS.Setup(NumeroOS, EmpresaId: Integer);
begin
  FDataSet.SQLMaker.FilterMk.FreeFilters()
    .Add('NPED', NumeroOS)
    .Add('COD_EMPRESA', EmpresaId);
  FDataSet.RunSQLMaker();
end;

end.
