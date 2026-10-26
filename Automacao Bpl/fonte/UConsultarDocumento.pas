unit UConsultarDocumento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, uEditHw, Buttons, Mask, UClassesClientes;

type
  TFrmConsultarDocumento = class(TForm)
    GroupBox11: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    SpeedButton10: TSpeedButton;
    ckReqPV: TCheckBox;
    ckOSPV: TCheckBox;
    edDataIniPV: TMaskEdit;
    edDataFimPV: TMaskEdit;
    BitBtn15: TBitBtn;
    edCodClForPedVenda: TEditHw;
    edNPedVenda: TEditHw;
    GroupBox12: TGroupBox;
    DBGrid2: TDBGrid;
    Splitter10: TSplitter;
    GroupBox13: TGroupBox;
    DBGrid3: TDBGrid;
    Panel61: TPanel;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edCodClForPedVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vReq: Integer;
    vTiporeq: string;
    vValorReq: Double;
  end;

var
  FrmConsultarDocumento: TFrmConsultarDocumento;
  vDocValeProgFid: TDocValeProgFid;

implementation

uses UDtmClientes, uDtmAtivo, DB, uDadosIni;

{$R *.dfm}

procedure TFrmConsultarDocumento.BitBtn15Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    if vDocValeProgFid.pesquisaPedVenda(ckReqPV.Checked, ckOSPV.Checked, Trunc(edNPedVenda.AsValue),
      edCodClForPedVenda.AsInteger, edDataIniPV.Text, edDataFimPV.Text) then
    begin
    	vDadosIni._GravaConfiguracoesBoolean(ckReqPV.Name, ckReqPV.Checked);
      vDadosIni._GravaConfiguracoesBoolean(ckOSPV.Name, ckOSPV.Checked);

      vDadosIni._GravaConfiguracoesDouble(edNPedVenda.Name, edNPedVenda.AsValue);

      vDadosIni._GravaConfiguracoesString(edDataIniPV.Name, edDataIniPV.Text);
      vDadosIni._GravaConfiguracoesString(edDataFimPV.Name, edDataFimPV.Text);

      vDadosIni._GravaConfiguracoesDouble(edCodClForPedVenda.Name, edCodClForPedVenda.AsValue);

      if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
      	DBGrid2.SetFocus;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConsultarDocumento.BitBtn62Click(Sender: TObject);
begin
	if DBGrid2.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(pchar('Nenhum venda encontrada.'), 'Atenção', MB_ICONERROR + MB_OK);
    Exit;
  end;

  vReq      := DBGrid2.DataSource.DataSet.FieldByName('NPED').AsInteger;
  vTiporeq  := DBGrid2.DataSource.DataSet.FieldByName('TIPO').AsString;
  vValorReq := DBGrid2.DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;

  if not vDocValeProgFid.existerecebimento(vReq, vTiporeq) then
  begin
  	Application.MessageBox(pchar('Venda já foi recebida, favor verificar antes de continuar.'), 'Atenção', MB_ICONERROR + MB_OK);
    Exit;
  end;

	ModalResult:= IDOK;
end;

procedure TFrmConsultarDocumento.BitBtn63Click(Sender: TObject);
begin
	vReq      := 0;
  vTiporeq  := '';
  vValorReq := 0;

	ModalResult:= IDCLOSE;
end;

procedure TFrmConsultarDocumento.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then
  	BitBtn62Click(Sender);
end;

procedure TFrmConsultarDocumento.edCodClForPedVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if key = VK_F3 then
  begin
		vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if vDadosIni.vPesquisa <> '' then
    	edCodClForPedVenda.Text := vDadosIni.vPesquisa;
  end;
end;

procedure TFrmConsultarDocumento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if (vDocValeProgFid <> nil) then
    vDocValeProgFid.Cancel;

  vDocValeProgFid.free;
  vDocValeProgFid := nil;

  Action := caFree;
//  if (FrmConsultarDocumento <> nil) then
//    FrmConsultarDocumento := nil;
end;

procedure TFrmConsultarDocumento.FormCreate(Sender: TObject);
begin
	vDocValeProgFid := TDocValeProgFid.create;
end;

procedure TFrmConsultarDocumento.FormShow(Sender: TObject);
begin
	ckReqPV.Checked            := vDadosIni._LerConfiguracoesRegistroBoolean(ckReqPV.Name, True);
  ckOSPV.Checked             := vDadosIni._LerConfiguracoesRegistroBoolean(ckOSPV.Name);

  edNPedVenda.AsValue        := vDadosIni._LerConfiguracoesRegistroDouble(edNPedVenda.Name);

  edDataIniPV.Text           := vDadosIni._LerConfiguracoesRegistroString(edDataIniPV.Name);
  edDataFimPV.Text           := vDadosIni._LerConfiguracoesRegistroString(edDataFimPV.Name);

  edCodClForPedVenda.AsValue := vDadosIni._LerConfiguracoesRegistroDouble(edCodClForPedVenda.Name);
end;

procedure TFrmConsultarDocumento.SpeedButton10Click(Sender: TObject);
begin
  edDataIniPV.Clear;
  edDataFimPV.Clear;
end;

end.
