unit uCalculoComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, Buttons, DBCtrls,
  ComCtrls, uClassesCalculoComissao;

type
  TfrmCalculoComissao = class(TfrmPadrao)
    pg_principal: TPageControl;
    ts_comissao: TTabSheet;
    pnAll: TPanel;
    pnTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    pnPerfil: TPanel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    pnMetas: TPanel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    pnBotton: TPanel;
    BitBtn10: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ts_detalhes: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBText13: TDBText;
    DBText14: TDBText;
    Label17: TLabel;
    Panel8: TPanel;
    grid_detalhes: TDBGrid;
    ListBox1: TListBox;
    bt_detalhes: TBitBtn;
    Splitter1: TSplitter;
    Panel7: TPanel;
    Label18: TLabel;
    BitBtn4: TBitBtn;
    DBText15: TDBText;
    procedure BitBtn4Click(Sender: TObject);
    procedure bt_detalhesClick(Sender: TObject);
    procedure DBText2Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculoComissao: TfrmCalculoComissao;

implementation

uses uDtmCalculoComissao, uDtmAtivo, uDataSet_OOP, DB,
  DBClient;

{$R *.dfm}

procedure TfrmCalculoComissao.BitBtn10Click(Sender: TObject);
begin
//  inherited;
  Close;
end;

procedure TfrmCalculoComissao.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('','Iniciando cálculo de comissão');

    calcComiss.dataInicial := MaskEdit1.Text;
    calcComiss.dataFinal := MaskEdit2.Text;

    calcComiss._obterComissaoColaborador;

    DBGrid3.Columns[13].Showing;
    if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
    	DBGrid3.SetFocus;
    DBGrid3.Columns[13].Showing;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;

end;

procedure TfrmCalculoComissao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.vOpenOfficeExportRel = 'S' then
  	calcComiss._montarCalc
  else
  	calcComiss._montarExcel;
end;

procedure TfrmCalculoComissao.BitBtn4Click(Sender: TObject);
begin
  inherited;
  pg_principal.ActivePage := ts_comissao;
end;

procedure TfrmCalculoComissao.bt_detalhesClick(Sender: TObject);
begin
  inherited;
  if (not calcComiss.Active) or (calcComiss.IsEmpty) then
    Exit;

  if calcComiss.fequals('CODIGO_PERFIL', 'DEVOL') then
    Exit;

  ListBox1.Items.Clear;
  pg_principal.ActivePage := ts_detalhes;
  grid_detalhes.Visible := False;
end;

procedure TfrmCalculoComissao.DBText2Click(Sender: TObject);
var
  str: string;
begin
  inherited;
  with calcComiss.ObterDetalhes(TDBText(Sender).DataField, str) do
  begin
    grid_detalhes.DataSource := _dataSourceOOP;
    ListBox1.Items.Text := str;
    grid_detalhes.Visible := (dataSet.Active) and (not dataSet.IsEmpty);
  end;
end;

procedure TfrmCalculoComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  calcComiss.Free;
  calcComiss := nil;

  Action := caFree;
  frmCalculoComissao := nil;
end;

procedure TfrmCalculoComissao.FormCreate(Sender: TObject);
begin
  inherited;
  calcComiss:= TCalculoComissao.create;
end;

procedure TfrmCalculoComissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    if Application.MessageBox('Deseja mesmo sair do Cálculo de Comissão', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      Close;
  end;
end;

procedure TfrmCalculoComissao.FormShow(Sender: TObject);
begin
  inherited;
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit2.Text := DateToStr(Date);

  ts_comissao.TabVisible  := False;
  ts_detalhes.TabVisible  := False;
  pg_principal.ActivePage := ts_comissao;

  calcComiss.vColab._abreColaboradores;

  
end;

end.
