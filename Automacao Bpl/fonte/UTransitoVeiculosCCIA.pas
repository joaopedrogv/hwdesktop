unit UTransitoVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, UClassesVeiculosCCIA, 
  DBClient, IBDatabase, Menus;

type
  TFrmTransitoVeiculosCCIA = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridTrans: TDBGrid;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn19: TBitBtn;
    Label30: TLabel;
    Panel4: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBoxTrans: TGroupBox;
    ScrollBoxTrans: TScrollBox;
    PopupMenuTrans: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    Panel46: TPanel;
    Label86: TLabel;
    Panel48: TPanel;
    Label90: TLabel;
    procedure DBGridTransDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn19Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure ScrollBoxTransExit(Sender: TObject);
    procedure ScrollBoxTransEnter(Sender: TObject);
    procedure DBGridTransTitleClick(Column: TColumn);
    procedure DBGridTransColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    cdsColunasTrans: TClientDataSet;
    trans: TIBTransaction;
    vCheck: TCheckBox;
    vTabela, vCampoPadrao, vAlterarNomeDtSet: string;
    fReset, vConfigColuna: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTransitoVeiculosCCIA: TFrmTransitoVeiculosCCIA;
  EstMotoTransito: TEstMotoTransitoCCIA;

implementation

uses UDtmVeiculosCCIA, uDtmAtivo, uDataSet_OOP, DB, uDadosIni;

{$R *.dfm}

procedure TFrmTransitoVeiculosCCIA.BitBtn19Click(Sender: TObject);
begin
  try
    inherited;
    if not EstMotoTransito.Delete then
      exit;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    EstMotoTransito.Cancel;
    EstMotoTransito.RollBackTransacao;
  end;
end;

procedure TFrmTransitoVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
 Close;
end;

procedure TFrmTransitoVeiculosCCIA.DBGridTransColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridTrans.Columns.Count - 1 do
    DBGridTrans.Columns[i].Title.Font.Style := [];
  DBGridTrans.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasTrans, DBGridTrans, vDadosIni.vNomeUsuario, 'cdsEstMotosTransito', self, ScrollBoxTrans, trans);
end;

procedure TFrmTransitoVeiculosCCIA.DBGridTransDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_CANC').AsString) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_NF').AsInteger <= 0)
  and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('POSICAO').AsString) <> 'MORTO')
  and ((trim(TDBGrid(sender).DataSource.DataSet.FieldByName('MODELO_NF').AsString) = 'TRA')
  or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('POSICAO').AsString) = 'TRANSITO')) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clMenuHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmTransitoVeiculosCCIA.DBGridTransTitleClick(Column: TColumn);
begin
 vDadosIni.DBGridOnTitleClick(DBGridTrans, Column);
end;

procedure TFrmTransitoVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (cdsColunasTrans <> nil) and (DBGridTrans.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridTrans.DataSource.DataSet), self);

  if (EstMotoTransito <> nil) then
    EstMotoTransito.Cancel;

  EstMotoTransito.free;
  EstMotoTransito := nil;

  Action := caFree;
  if (FrmTransitoVeiculosCCIA <> nil) then
    FrmTransitoVeiculosCCIA := nil;
end;

procedure TFrmTransitoVeiculosCCIA.FormCreate(Sender: TObject);
begin
  EstMotoTransito := TEstMotoTransitoCCIA.create;
  EstMotoTransito.AbreEstMotoTransito;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmTransitoVeiculosCCIA.FormShow(Sender: TObject);
begin
//  DBGrid1.DataSource := dtmVeiculosCCIA.dsEstMotosTransito;
   vTabela := 'HIST_ESTMOTO';
   vCampoPadrao := 'COD_HIST';
   trans := vDadosIni.transacaoCol;

   DBGridTrans.DataSource := dtmVeiculosCCIA.dsEstMotosTransito;
   cdsColunasTrans := TClientDataSet(vDadosIni.dataSetCol);
   vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasTrans,
   'cdsEstMotosTransito', DBGridTrans, vTabela, vCampoPadrao, self, vCheck, ScrollBoxTrans);

  if EstMotoTransito.AbreEstMotoTransito(StrToInt(vDadosIni.vPesquisa)) then
  begin
   Label4.Caption := EstMotoTransito.dataSet.FieldByName('NUM_NOTA').AsString;

   EstMotoTransito.buscas.Close;
   EstMotoTransito.buscas.SQL.Text := 	' SELECT * FROM NF_TRANSITO ' +
    ' WHERE NUM_NOTAT = ' + IntToStr(EstMotoTransito.dataSet.FieldByName('NUM_NOTA').AsInteger) +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
   EstMotoTransito.buscas.Open;

   if not EstMotoTransito.buscas.IsEmpty then
   begin
      Label3.Caption := EstMotoTransito.buscas.FieldByName('SERIET').AsString;
      Label6.Caption := EstMotoTransito.buscas.FieldByName('DATA_EMISSAOT').AsString;
      Label8.Caption := EstMotoTransito.buscas.FieldByName('DATA_VENCT').AsString;
      Label22.Caption := EstMotoTransito.buscas.FieldByName('TPFATT').AsString;
      Label10.Caption := EstMotoTransito.buscas.FieldByName('STATUST').AsString;
      Label12.Caption := EstMotoTransito.buscas.FieldByName('VALORNOTAT').AsString;
      Label13.Caption := EstMotoTransito.buscas.FieldByName('FRETET').AsString;
      Label16.Caption := EstMotoTransito.buscas.FieldByName('SEGUROT').AsString;
      Label18.Caption := EstMotoTransito.buscas.FieldByName('ICMSSUBT').AsString;
      Label20.Caption := EstMotoTransito.buscas.FieldByName('N_CAIXA').AsString;
   end;
  end;
  vDadosIni.hw_registra_estatistica(Self.Name);
  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmTransitoVeiculosCCIA.MenuItem1Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI114', 'CONFIGURAR', '', 'EST_MOTO', '', EstMotoTransito.buscas, true) then
   vDadosIni.Configurarcolunas(cdsColunasTrans, DBGridTrans, GroupBoxTrans, ScrollBoxTrans, Self);
end;

procedure TFrmTransitoVeiculosCCIA.MenuItem2Click(Sender: TObject);
begin
 vDadosIni.resetarConfiguracoesDeColunas(cdsColunasTrans, 'cdsEstMotosTransito', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TFrmTransitoVeiculosCCIA.MenuItem3Click(Sender: TObject);
begin
 vDadosIni.montarExcel(DBGridTrans, 'Chassis das Notas');
end;

procedure TFrmTransitoVeiculosCCIA.MenuItem4Click(Sender: TObject);
begin
 vDadosIni.AjustaLaguraColunas(DBGridTrans);
end;

procedure TFrmTransitoVeiculosCCIA.MenuItem5Click(Sender: TObject);
begin
 vDadosIni.Copiarparareadetransferncia(DBGridTrans);
end;

procedure TFrmTransitoVeiculosCCIA.ScrollBoxTransEnter(Sender: TObject);
begin
 vConfigColuna := true;
end;

procedure TFrmTransitoVeiculosCCIA.ScrollBoxTransExit(Sender: TObject);
begin
 if (cdsColunasTrans = nil) or (not cdsColunasTrans.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasTrans, DBGridTrans, vDadosIni.vNomeUsuario, 'cdsEstMotosTransito', self, ScrollBoxTrans, trans);
  GroupBoxTrans.Visible := false;
  vDadosIni.mostraColunas(cdsColunasTrans, DBGridTrans, vDadosIni.vNomeUsuario, 'cdsEstMotosTransito', vTabela, vCampoPadrao);
end;

end.
