unit uLerPreVendaRet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmLerPreVendaRet = class(TfrmPadrao)
    Panel1: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    BitBtn41: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    vDias:integer;
  public
    { Public declarations }
  end;

var
  frmLerPreVendaRet: TfrmLerPreVendaRet;

implementation

uses
  uPrincipalF, uDtmDAVF, uClasseDAVF, uDadosIniFiscal, DateUtils;

{$R *.dfm}

procedure TfrmLerPreVendaRet.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmLerPreVendaRet.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrAbort;
end;

procedure TfrmLerPreVendaRet.BitBtn41Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmLerPreVendaRet.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TfrmLerPreVendaRet.Edit1Change(Sender: TObject);
begin
  inherited;
  obPreVenda.FindNearest([Edit1.Text]);
  obPreVenda.vItem.selecionaItensDaVenda(obPreVenda.dataSet.FieldByName('nped').AsInteger, obPreVenda.dataSet.FieldByName('tipo').AsString);
end;

procedure TfrmLerPreVendaRet.Edit1Enter(Sender: TObject);
begin
  inherited;
  obPreVenda.IndexFieldNames := 'NPED';
  Edit1.OnChange := Edit1Change;
end;

procedure TfrmLerPreVendaRet.Edit1Exit(Sender: TObject);
begin
  inherited;
  Edit1.OnChange := nil;
end;

procedure TfrmLerPreVendaRet.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
  begin
    obPreVenda.Prior;
    obPreVenda.vItem.selecionaItensDaVenda(obPreVenda.dataSet.FieldByName('nped').AsInteger, obPreVenda.dataSet.FieldByName('tipo').AsString);
  end
  else if key = VK_DOWN then
  begin
    obPreVenda.Next;
    obPreVenda.vItem.selecionaItensDaVenda(obPreVenda.dataSet.FieldByName('nped').AsInteger, obPreVenda.dataSet.FieldByName('tipo').AsString);
  end;
end;

procedure TfrmLerPreVendaRet.FormKeyDown(Sender: TObject; var Key: Word;
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
    SpeedButton1.Click
  else if key = VK_RETURN then
    ModalResult := mrOk
  else if key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrmLerPreVendaRet.FormShow(Sender: TObject);
begin
  inherited;
  vDias := 0;
  obPreVenda := TPreVendaRetaguarda.create;
  obPreVenda.Refresh;
end;

procedure TfrmLerPreVendaRet.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

procedure TfrmLerPreVendaRet.SpeedButton1Click(Sender: TObject);
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

  vDias := Trunc(DateOf(vDataTmp) - vDadosIniF.getDataBanco(obPreVenda.buscas));
  SpeedButton2.Tag := 1;
  SpeedButton2.Click;
end;

procedure TfrmLerPreVendaRet.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Label3.Refresh;
    if SpeedButton2.Tag = 0 then
      vDias := 0;
    SpeedButton2.Tag := 0;
    obPreVenda.selecionaVendasParaCupomDiaAtual(RadioGroup1.ItemIndex,vDias);
  finally
    Label3.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLerPreVendaRet.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Dec(vDias);
  SpeedButton2.Tag := 1;
  SpeedButton2.Click;
end;

procedure TfrmLerPreVendaRet.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Inc(vDias);
  SpeedButton2.Tag := 1;
  SpeedButton2.Click;
end;

procedure TfrmLerPreVendaRet.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try                           
    Label3.Visible := true;
    Screen.Cursor := crHourGlass;
    Label3.Refresh;
    obPreVenda.selecionaVendasParaCupom(RadioGroup1.ItemIndex);
  finally
    Label3.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

end.
