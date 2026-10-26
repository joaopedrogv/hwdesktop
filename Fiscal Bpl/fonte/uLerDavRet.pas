unit uLerDavRet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, uClasseDAVF,
  Menus;

type
  TfrmLerDavRet = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    BitBtn5: TBitBtn;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    BitBtn41: TBitBtn;
    ImprimirDAV1: TMenuItem;
    Label4: TLabel;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton6Click(Sender: TObject);
    procedure ImprimirDAV1Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
  private
    { Private declarations }
    vDias:integer;
  public
    { Public declarations }
  end;

var
  frmLerDavRet: TfrmLerDavRet;

implementation

uses uDtmDavF, uPrincipalF, uDadosIniFiscal, uRecord, DateUtils;

{$R *.dfm}

procedure TfrmLerDavRet.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmLerDavRet.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmLerDavRet.BitBtn3Click(Sender: TObject);
begin
  inherited;
  try                           
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Label3.Refresh;
    obVenda.selecionaVendasParaCupom(RadioGroup1.ItemIndex);
  finally
    Label3.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLerDavRet.BitBtn41Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmLerDavRet.BitBtn4Click(Sender: TObject);
begin
  inherited;
  try
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Label3.Refresh;
    obVenda.selecionaVendasParaCupomUltimos30Dias;
  finally
    Label3.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLerDavRet.BitBtn5Click(Sender: TObject);
begin
  inherited;
  try
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Label3.Refresh;
    vDias:=0;
    obVenda.selecionaVendasParaCupomDiaAtual(RadioGroup1.ItemIndex,vDias);
  finally
    Label3.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLerDavRet.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,obVenda.dataSet.FieldByName('tipo').AsString);
end;

procedure TfrmLerDavRet.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if (Key = VK_UP) or (key = VK_DOWN) then
//    obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,obVenda.dataSet.FieldByName('tipo').AsString);
end;

procedure TfrmLerDavRet.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  if (Key = #38) or (key = #40) then
//    obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,obVenda.dataSet.FieldByName('tipo').AsString);
end;

procedure TfrmLerDavRet.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if (Key = VK_UP) or (key = VK_DOWN) then
//    obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,obVenda.dataSet.FieldByName('tipo').AsString);
end;

procedure TfrmLerDavRet.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('Status').AsString = 'CANCELADO' then
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
  //Agora vamos colorir a célula utilizando o método Defaut:
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmLerDavRet.Edit1Change(Sender: TObject);
begin
  inherited;
  obVenda.FindNearest([Edit1.Text]);
  obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger, obVenda.dataSet.FieldByName('tipo').AsString);
end;

procedure TfrmLerDavRet.Edit1Enter(Sender: TObject);
begin
  inherited;
  obVenda.IndexFieldNames := 'NPED';
  Edit1.OnChange := Edit1Change;
end;

procedure TfrmLerDavRet.Edit1Exit(Sender: TObject);
begin
  inherited;
  Edit1.OnChange := nil;
end;

procedure TfrmLerDavRet.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
  begin
    obVenda.Prior;
    obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger, obVenda.dataSet.FieldByName('tipo').AsString);
  end
  else if key = VK_DOWN then
  begin
    obVenda.Next;
    obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger, obVenda.dataSet.FieldByName('tipo').AsString);
  end;
end;

procedure TfrmLerDavRet.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then
    DBGrid1.SetFocus
  else if key = VK_F3 then
    DBGrid2.SetFocus
  else if key = VK_F5 then
    Edit1.SetFocus
  else if key = VK_F6 then
  begin
    Edit1.SetFocus;
    Perform(WM_NEXTDLGCTL,0,0);
  end
  else if key = VK_F7 then
    SpeedButton2.Click
  else if key = VK_F8 then
    SpeedButton5.Click
  else if key = VK_F9 then
    SpeedButton6.Click
  else if key = VK_RETURN then
    ModalResult := mrOk
  else if key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrmLerDavRet.FormShow(Sender: TObject);
begin
  inherited;
  vDias := 0;
  if obVenda = nil then
    obVenda := TDAVF.create;
  obVenda.Refresh;
	Label4.Caption := obVenda.dataVendas;
  ImprimirDAV1.Visible := vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('IMPRIMIR_DAV_ECF').AsString) = 'S';
end;

procedure TfrmLerDavRet.ImprimirDAV1Click(Sender: TObject);
var
  rDAV: RVenda;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Panel2.Enabled := False;
    if obVenda.montarDAVparaImpressao(rDAV) then
    begin
      if not vDadosIniF.EnvCmdsCupom(2) then
        Exit;
      CImpressoraF.abrerelatorioGer;
			if CImpressoraF.imprimeDavNoEcf(rDAV) then
			begin
				rDav.COO_Impressao := StrToIntDef(CImpressoraF.NumeroCupom, 0);
				rDav.NSerie_Impressao := vDadosIniF.vNumSerieEcf;
				rDav.CAIXA_Impressao := StrToIntDef(vDadosIniF.vCodTerminal, 0);
				obVenda.setDavImpressoECF(rDAV);
			end;
      vDadosIniF.EnvCmdsCupom(10);
    end;
  finally
    Panel2.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLerDavRet.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

procedure TfrmLerDavRet.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Label3.Refresh;
    if SpeedButton2.Tag = 0 then
      vDias := 0;
    SpeedButton2.Tag := 0;
    obVenda.selecionaVendasParaCupomDiaAtual(RadioGroup1.ItemIndex,vDias);
    Label4.Caption := obVenda.dataVendas;
  finally
    Label3.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLerDavRet.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Dec(vDias);
  SpeedButton2.Tag := 1;
  SpeedButton2.Click;
end;

procedure TfrmLerDavRet.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Inc(vDias);
  SpeedButton2.Tag := 1;
  SpeedButton2.Click;
end;

procedure TfrmLerDavRet.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Label3.Refresh;
    obVenda.selecionaVendasParaCupom(RadioGroup1.ItemIndex);
    Label4.Caption := obVenda.dataVendas;
  finally
    Label3.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLerDavRet.SpeedButton6Click(Sender: TObject);
var
  vtmp: string;
  vDataTmp: TDateTime;
begin
  inherited;
  
  if not InputQuery('Informe o Dia', 'Informe o dia desejado no padrão "dd/mm/aaaa" com as barras', vtmp) then
    Exit;

  if not TryStrToDate(vtmp, vDataTmp) then
  begin
    Application.MessageBox('Data informado inválida', 'Atenção', 0 + 64);
    Exit;
  end;

  vDias := Trunc(DateOf(vDataTmp) - vDadosIniF.getDataBanco(obVenda.buscas));
  SpeedButton2.Tag := 1;
  SpeedButton2.Click;
end;

end.

