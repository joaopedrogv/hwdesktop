unit UCorrelacaoNcmProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, Buttons, DBGridFrameUnit,
  NCMsCDFDataSet, ProdutosCDFDataSet, TipoComunsUnit;

type
  TSetupFrmCorrelacaoNcmProdutos = record

  end;

  TFrmCorrelacaoNcmProdutos = class(TfrmPadrao)
    pnTop: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    pnNcms: TPanel;
    DBGridFrameNcms: TDBGridFrame;
    pnBottom: TPanel;
    btSair: TBitBtn;
    Splitter1: TSplitter;
    pnProdutos: TPanel;
    DBGridFrameProdutos: TDBGridFrame;
    pnLinksNCM: TPanel;
    linkVincularUsandoNCM: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    procedure linkVincularUsandoNCMClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FData: TDate;
    FTimerNcmChange: TTimer;
    FNcmsDataSet: TNCMsCDFDataSet;
    FProdutosDataSet: TProdutosCDFDataSet;
    procedure TimerNcmChangeTimer(Sender: TObject);
    procedure NcmChange(const NCM: string);
  public
    procedure Setup(Data: TDate);
  end;

var
  FrmCorrelacaoNcmProdutos: TFrmCorrelacaoNcmProdutos;

implementation

uses 
  FieldsConfigUnit,
  DB, DbGridConfigUtilsUnit, DataSetGrid, uDataSet_OOP, USubstituirNCMs;

{$R *.dfm}

procedure TFrmCorrelacaoNcmProdutos.btSairClick(Sender: TObject);
begin
//  if FResultOK then
    ModalResult := mrOk
//  else
//    Close();
end;

procedure TFrmCorrelacaoNcmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FTimerNcmChange := TTimer.Create(Self);
  FTimerNcmChange.Enabled := False;
  FTimerNcmChange.Interval := 200;
  FTimerNcmChange.OnTimer := TimerNcmChangeTimer;


  FNcmsDataSet := TNCMsCDFDataSet.Create('CDS_NCM_' + Self.ClassName );
  FProdutosDataSet := TProdutosCDFDataSet.Create('CDS_PROD_' + Self.ClassName );

  FNcmsDataSet.OnChange := NcmChange;
end;

procedure TFrmCorrelacaoNcmProdutos.FormDestroy(Sender: TObject);
begin
  FNcmsDataSet.Free();
  FProdutosDataSet.Free();

  inherited;
end;

procedure TFrmCorrelacaoNcmProdutos.linkVincularUsandoNCMClick(Sender: TObject);
var
  list: TArrayString;
  resultList: TNcmsSubstitutos;
  ncm: string;
begin
  inherited;

  if FNcmsDataSet.IsEmpty then
    Exit;

  ncm := FNcmsDataSet.fstr('ncm');
  list := FNcmsDataSet.GetCodigosNCMsSelecionados();
  if Length(list) = 0 then
  begin
    SetLength(list, 1);
    list[0] := ncm;
  end;

  Application.CreateForm(TFrmSubstituirNCMs, FrmSubstituirNCMs);
  try
    FrmSubstituirNCMs.Setup( TFrmSubstituirNCMsSetup.Create(list, FData ));

    if FrmSubstituirNCMs.ShowModal <> mrOk  then
      Exit;

    resultList := FrmSubstituirNCMs.GetListaSubstituida();

    //Criar o caso de uso para correcao e chamar aqui

  finally
    FreeAndNil(FrmSubstituirNCMs);
  end;
end;

procedure TFrmCorrelacaoNcmProdutos.NcmChange(const NCM: string);
begin
  FTimerNcmChange.Enabled := False;
  FTimerNcmChange.Enabled := True;
end;

procedure TFrmCorrelacaoNcmProdutos.Setup(Data: TDate);
var
  builder: IFieldsConfigBuilder;
  gridInput: TDBGridFrameSetup;
begin
  FData := Data;
  gridInput := TDBGridFrameSetup.CreateSelection();

  FNcmsDataSet.Setup( TNCMsCDFDataSetSetup.Create( ncmQryIrregulares, gridInput.SelectionField ) );
  FProdutosDataSet.Setup( TProdutosCDFDataSetSetup.Create( prdQryPorNCM, gridInput.SelectionField ) );

  DBGridFrameNcms.Setup( gridInput );
  DBGridFrameNcms.DataSource := FNcmsDataSet._dataSourceOOP;

  DBGridFrameProdutos.Setup( gridInput );
  DBGridFrameProdutos.DataSource := FProdutosDataSet._dataSourceOOP;

  builder := FieldsConfigFactory.Create();
  builder.Add('sel', '', fvSempreVisivel )
      .Add('ncm', 'NCM' )
      .Add('qtde_prod', 'Qtde Produtos')
      .Add('situacao', 'Situacao', fvSempreVisivel);

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrameNcms.DBGrid, builder.List );

  builder := FieldsConfigFactory.Create();
  builder.Add('cod_empresa', fvInvisivel)
      .Add('sel', '', fvSempreVisivel )
      .Add('grupo_prod', 'Cod Grupo' )
      .Add('cod_prod', 'Cod Produtos')
      .Add('num_fab_prod', 'Num Fab')
      .Add('nbm', 'NCM', fvSempreVisivel)
      .Add('descr_prod', 'Descricao', fvSempreVisivel);

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrameProdutos.DBGrid, builder.List );

  FNcmsDataSet.ListarIrregulares();
end;

procedure TFrmCorrelacaoNcmProdutos.TimerNcmChangeTimer(Sender: TObject);
var
  Ncm: string;
begin
  FTimerNcmChange.Enabled := False;

  Ncm := FNcmsDataSet.fstr('ncm');

  FProdutosDataSet.ListarPorNCM( Ncm );
end;

end.

    Essa tela vai listar
    | NCM    | Qtde Produtos | Situação    |
    ----------------------------------------
    |01019900|            99 | Inexistente |
    |78190920|            99 | Regular     |

    Listar os produtos

    Alteracao em lote

    Quando extintos Tela listar os ncms criados no mesmo ato, possivel ncm
