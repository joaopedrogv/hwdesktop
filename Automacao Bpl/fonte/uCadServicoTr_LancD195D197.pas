unit uCadServicoTr_LancD195D197;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, uPadrao,
  Forms, Dialogs, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, uDataSet_OOP, uClassesNotasFiscais_ServTransporte;

type
  TfrmCadServicoTr_LancD195D197 = class(TfrmPadrao)
    PageControl1: TPageControl;
    tsGrid: TTabSheet;
    tsCad: TTabSheet;
    Panel96: TPanel;
    BitBtn103: TBitBtn;
    BitBtn104: TBitBtn;
    BitBtn105: TBitBtn;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    pnCadastroC195197: TPanel;
    Panel93: TPanel;
    Label424: TLabel;
    Label425: TLabel;
    Label426: TLabel;
    Label427: TLabel;
    Label428: TLabel;
    Label429: TLabel;
    Label430: TLabel;
    edDescrAj: TDBEdit;
    edBC: TDBEdit;
    edAliq: TDBEdit;
    edValor: TDBEdit;
    edOutros: TDBEdit;
    edCodAj: TDBComboBox;
    Panel94: TPanel;
    BitBtn101: TBitBtn;
    BitBtn102: TBitBtn;
    edCodObs: TDBLookupComboBox;
    Label2: TLabel;
    edTxtCompl: TDBEdit;
    SpeedButton35: TSpeedButton;
    procedure BitBtn105Click(Sender: TObject);
    procedure BitBtn104Click(Sender: TObject);
    procedure BitBtn103Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure BitBtn101Click(Sender: TObject);
    procedure BitBtn102Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FServT: TServTransporte;
    obsLancFiscalList: TDadosLookUp_OOP;
    function GetAjuste: TServTransporte_D195D197;
  private
    procedure buildCadastro(inEdit: Boolean);
  private
    property Ajuste: TServTransporte_D195D197 read GetAjuste;
  public
    procedure Init(ServicoTransporte: TServTransporte);
  end;

var
  frmCadServicoTr_LancD195D197: TfrmCadServicoTr_LancD195D197;

implementation

uses
  uDtmAtivo, hw_utils, Query_OOP;


{$R *.dfm}

{ TfrmCadServicoTr_LancD195D197 }

procedure TfrmCadServicoTr_LancD195D197.BitBtn101Click(Sender: TObject);
begin
  inherited;

  if not Ajuste.Post then
    Exit;

  PageControl1.ActivePage := tsGrid;
end;

procedure TfrmCadServicoTr_LancD195D197.BitBtn102Click(Sender: TObject);
begin
  inherited;
  Ajuste.Cancel;
  PageControl1.ActivePage := tsGrid;
end;

procedure TfrmCadServicoTr_LancD195D197.BitBtn103Click(Sender: TObject);
begin
  inherited;

  buildCadastro(False);
//  if not Ajuste.Insert then
//    Exit;
//
//  PageControl1.ActivePage := tsCad;
//
//  edCodObs.SetFocus;b
end;

procedure TfrmCadServicoTr_LancD195D197.BitBtn104Click(Sender: TObject);
begin
  inherited;
  buildCadastro(True);
//  if not Ajuste.Edit then
//    Exit;
//
//  PageControl1.ActivePage := tsCad;
//
//  edCodObs.SetFocus;
end;

procedure TfrmCadServicoTr_LancD195D197.BitBtn105Click(Sender: TObject);
begin
  inherited;

  if ShowConfirmacao('Deseja mesmo excluir o registro?') <> IDYES then
    Exit;
  
  Ajuste.Delete;
end;

procedure TfrmCadServicoTr_LancD195D197.buildCadastro(inEdit: Boolean);
begin

  if inEdit and not Ajuste.Edit() then
    Exit;

  if not inEdit and not Ajuste.Insert() then
    Exit;

  if not Assigned(obsLancFiscalList) then
    obsLancFiscalList:= TDadosLookUp_OOP.create;

  obsLancFiscalList.setDadosDataSet('cod_obs', 'txt;cod_obs;cod_padrao_ajuste',
    Ajuste.queryCons
      .Table('SPED_LANCAMENTO_FISCAL', 'cod_obs, txt, cod_padrao_ajuste')
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .OrderBy('txt')
      .Open().query, edCodObs);
  Ajuste.queryCons.Close;

  PageControl1.ActivePage := tsCad;

  if (Self.Enabled) and (Self.Visible) and (edCodObs.CanFocus) then
    edCodObs.SetFocus;
end;

procedure TfrmCadServicoTr_LancD195D197.FormShow(Sender: TObject);
begin
//

end;

function TfrmCadServicoTr_LancD195D197.GetAjuste: TServTransporte_D195D197;
begin
  Result := FServT.Ajuste;
end;

procedure TfrmCadServicoTr_LancD195D197.Init(
  ServicoTransporte: TServTransporte);
var
  list: TStrings;
begin
  FServT := ServicoTransporte;

  DBGrid1.DataSource := Ajuste._dataSourceOOP;
  edCodObs.DataSource := Ajuste._dataSourceOOP;
  edTxtCompl.DataSource := Ajuste._dataSourceOOP;
  edDescrAj.DataSource := Ajuste._dataSourceOOP;
  edCodAj.DataSource := Ajuste._dataSourceOOP;
  edBC.DataSource := Ajuste._dataSourceOOP;
  edAliq.DataSource := Ajuste._dataSourceOOP;
  edValor.DataSource := Ajuste._dataSourceOOP;
  edOutros.DataSource := Ajuste._dataSourceOOP;

  PageControl1.ActivePage := tsGrid;

  tsGrid.TabVisible := False;
  tsCad.TabVisible := False;

  list := Ajuste.queryCons.Open(
    'select aj.cod_aj from (' +
    '  select distinct lf.cod_padrao_ajuste cod_aj from sped_lancamento_fiscal lf' +
    '  union' +
    '  select distinct c1.cod_aj from notafiscal_sped_c195_c197 c1' +
    '  union' +
    '  select distinct sa.cod_aj from servico_transporte_ajuste sa' +
    ') aj' +
    ' where char_length(coalesce(aj.cod_aj, '''')) = 10')
    .flist('cod_aj');

  edCodAj.Items.AddStrings(list);

  Ajuste.queryCons.Close;
  list.Free;

  Ajuste.Open();

  PageControl1.ActivePage := tsGrid;
end;

procedure TfrmCadServicoTr_LancD195D197.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

end.
