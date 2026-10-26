unit uHistoricoEntregas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB;

type
  TfrmHistoricoEntregas = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoEntregas: TfrmHistoricoEntregas;

implementation

uses
  uClassesOrdemCarregamento, uDataSet_OOP, uDtmAtivo;

{$R *.dfm}

procedure TfrmHistoricoEntregas.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmHistoricoEntregas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_ESCAPE then
    BitBtn1.Click;
end;

procedure TfrmHistoricoEntregas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DataSource1.DataSet := nil;
end;

procedure TfrmHistoricoEntregas.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) <> 'HISTORICO_CARGA' then
    vDadosIni.vPesquisa := '';
end;

procedure TfrmHistoricoEntregas.FormShow(Sender: TObject);
var
	vHistoricoCarga: THistorico_Carga;
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
  vCodTemp: integer;
  vTipoTemp: string;
begin
  inherited;
  vCodTemp := 0;
  vTipoTemp := '0';
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) = 'HISTORICO_CARGA' then
  begin
    vCodTemp := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
    vTipoTemp := vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3);
    vDadosIni.vPesquisa := '';
  end;
  vHistoricoCarga := THistorico_Carga.create;
  vHistoricoCarga._abreHistorico(vCodTemp, vTipoTemp);
  DataSource1.DataSet := vHistoricoCarga.buscas;
end;

initialization
  RegisterClass(TfrmHistoricoEntregas);
finalization
  UnRegisterClass(TfrmHistoricoEntregas);

end.
