unit uDadosAdicionaisEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmDadosAdicionaisEntrega = class(TfrmPadrao)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    buscas: TIBQuery;
    Panel2: TPanel;
    GroupBoxInfFrete: TGroupBox;
    Label8: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton59: TSpeedButton;
    Label245: TLabel;
    DBText39: TDBText;
    Label241: TLabel;
    DBText13: TDBText;
    DBComboBox10: TDBComboBox;
    DBEdit138: TDBEdit;
    DBEdit139: TDBEdit;
    GroupBoxEcommerce: TGroupBox;
    Label246: TLabel;
    lkecomm_status: TDBLookupComboBox;
    GroupBoxDadosRecebedor: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    ComboBoxStatusEC: TComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton59Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosAdicionaisEntrega: TfrmDadosAdicionaisEntrega;

implementation

uses uDtmPedVenda, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmDadosAdicionaisEntrega.BitBtn1Click(Sender: TObject);
var
  vModInsercaoEdicao: boolean;
begin
  inherited;
  vModInsercaoEdicao := (DBComboBox10.DataSource.DataSet.State in [dsInsert, dsEdit]);

  if not (DBComboBox10.DataSource.DataSet.State in [dsInsert, dsEdit]) then
  	DBComboBox10.DataSource.DataSet.Edit;

  DBComboBox10.DataSource.DataSet.FieldByName('metodo_entrega').AsString := trim(DBComboBox10.Items[DBComboBox10.ItemIndex]);

  if (DBComboBox10.DataSource.DataSet.State in [dsInsert, dsEdit]) then
  	DBComboBox10.DataSource.DataSet.Post;

  if vModInsercaoEdicao then
    if not (DBComboBox10.DataSource.DataSet.State in [dsInsert, dsEdit]) then
      DBComboBox10.DataSource.DataSet.Edit;

  ModalResult := mrOk;
end;

procedure TfrmDadosAdicionaisEntrega.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmDadosAdicionaisEntrega.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmDadosAdicionaisEntrega := nil
end;

procedure TfrmDadosAdicionaisEntrega.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//	Self.fechar := True;
  inherited;
end;

procedure TfrmDadosAdicionaisEntrega.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn2Click(BitBtn2);
end;

procedure TfrmDadosAdicionaisEntrega.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  Label241.Visible := DBComboBox10.DataSource.DataSet.FieldByName('ID_COMMERCE').AsInteger > 0;
  DBText13.Visible := DBComboBox10.DataSource.DataSet.FieldByName('ID_COMMERCE').AsInteger > 0;
  SpeedButton1.Visible := DBComboBox10.DataSource.DataSet.FieldByName('ID_COMMERCE').AsInteger <= 0;

  if DBComboBox10.DataSource.DataSet.FieldByName('ID_COMMERCE').AsInteger <= 0 then
  begin
  	Label242.Enabled := True;
  	DBEdit138.Enabled := True;
    
    Label243.Enabled := True;
    DBEdit139.Enabled := True;

    SpeedButton59.Enabled := True;
  end
  else
  begin
  	Label242.Enabled := (DBComboBox10.DataSource.DataSet.FieldByName('COD_FORMA_RAST').AsInteger > 0)
    	or (DBComboBox10.DataSource.DataSet.FieldByName('NF_AC_FRETE').AsFloat > 0);
  	DBEdit138.Enabled := (DBComboBox10.DataSource.DataSet.FieldByName('COD_FORMA_RAST').AsInteger > 0)
    	or (DBComboBox10.DataSource.DataSet.FieldByName('NF_AC_FRETE').AsFloat > 0);

    Label243.Enabled := (DBComboBox10.DataSource.DataSet.FieldByName('COD_FORMA_RAST').AsInteger > 0)
    	or (DBComboBox10.DataSource.DataSet.FieldByName('NF_AC_FRETE').AsFloat > 0);
  	DBEdit139.Enabled := (DBComboBox10.DataSource.DataSet.FieldByName('COD_FORMA_RAST').AsInteger > 0)
    	or (DBComboBox10.DataSource.DataSet.FieldByName('NF_AC_FRETE').AsFloat > 0);

    SpeedButton59.Enabled := (DBComboBox10.DataSource.DataSet.FieldByName('COD_FORMA_RAST').AsInteger > 0)
    	or (DBComboBox10.DataSource.DataSet.FieldByName('NF_AC_FRETE').AsFloat > 0);
  end;

  ComboBoxStatusEC.Clear;
  ComboBoxStatusEC.Items.Add(DBComboBox10.DataSource.DataSet.FieldByName('STATUS_EC').AsString);
  ComboBoxStatusEC.ItemIndex := 0;

  DBComboBox10.Clear;
  if DBComboBox10.DataSource.DataSet.FieldByName('ID_COMMERCE').AsInteger <= 0 then
  begin
  	DBComboBox10.Items.Add('CARREGAMENTO PROPRIO');
		DBComboBox10.Items.Add('RETIRAR NO LOCAL');
		DBComboBox10.Items.Add('OUTROS MEIOS');

    buscas.Close;
    buscas.SQL.Text := ' select distinct trim(coalesce(metodo_entrega, '''')) metodo_entrega from pedvenda ' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by 1 ';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      if DBComboBox10.Items.IndexOf(trim(buscas.FieldByName('metodo_entrega').AsString)) <= -1 then
        DBComboBox10.Items.Add(trim(buscas.FieldByName('metodo_entrega').AsString));

      buscas.Next;
    end;

    if trim(DBComboBox10.DataSource.DataSet.FieldByName('metodo_entrega').AsString) <> '' then
      if DBComboBox10.Items.IndexOf(trim(DBComboBox10.DataSource.DataSet.FieldByName('metodo_entrega').AsString)) <= -1 then
        DBComboBox10.Items.Add(trim(DBComboBox10.DataSource.DataSet.FieldByName('metodo_entrega').AsString));

    for I := 0 to DBComboBox10.Items.Count - 1 do
      if trim(DBComboBox10.Items[I]) = trim(DBComboBox10.DataSource.DataSet.FieldByName('metodo_entrega').AsString) then
      begin
        DBComboBox10.ItemIndex := I;
        Break;
      end;
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := ' select trim(coalesce(display, '''')) display from formas_envio_ec ' +
    	' where cod_forma = ' + IntToStr(DBComboBox10.DataSource.DataSet.FieldByName('cod_forma_rast').AsInteger) +
      ' and cod_empresa = 1 ';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      if DBComboBox10.Items.IndexOf(trim(buscas.FieldByName('display').AsString)) <= -1 then
        DBComboBox10.Items.Add(trim(buscas.FieldByName('display').AsString));

      buscas.Next;
    end;

    for I := 0 to DBComboBox10.Items.Count - 1 do
      if trim(DBComboBox10.Items[I]) = trim(buscas.FieldByName('display').AsString) then
      begin
        DBComboBox10.ItemIndex := I;
        Break;
      end
      else if UpperCase(trim(DBComboBox10.Items[I])) = UpperCase(trim(buscas.FieldByName('display').AsString)) then
      begin
        DBComboBox10.ItemIndex := I;
        Break;
      end
  end;

  GroupBoxEcommerce.Visible := DBComboBox10.DataSource.DataSet.FieldByName('id_commerce').AsInteger > 0;
  GroupBoxDadosRecebedor.Visible := vDadosIni.vMinuta = 'S';

  if (GroupBoxEcommerce.Visible) and (GroupBoxDadosRecebedor.Visible) then
  	frmDadosAdicionaisEntrega.Height := 529
  else if (GroupBoxEcommerce.Visible) then
  	frmDadosAdicionaisEntrega.Height := 259
  else if (GroupBoxDadosRecebedor.Visible) then
  	frmDadosAdicionaisEntrega.Height := 453
  else
  	frmDadosAdicionaisEntrega.Height := 186;

  if (Self.Enabled) and (Self.Visible) and (DBComboBox10.CanFocus) then
    DBComboBox10.SetFocus;
end;

procedure TfrmDadosAdicionaisEntrega.SpeedButton1Click(Sender: TObject);
var
  vTmp: string;
begin
  inherited;
	if not InputQuery('Método de Entrega', 'Informe o nome método de ' + #13 + 'entrega', vTmp) then
    exit;

  if trim(vTmp) = '' then
  begin
  	Application.MessageBox(Pchar('Método de entrega não informado'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  DBComboBox10.Items.Add(trim(vTmp));
  DBComboBox10.ItemIndex := DBComboBox10.Items.Count - 1;
end;

procedure TfrmDadosAdicionaisEntrega.SpeedButton59Click(Sender: TObject);
begin
  inherited;
	if not (DBComboBox10.DataSource.dataSet.State in [dsInsert, dsEdit]) then
   DBComboBox10.DataSource.dataSet.FieldByName('DATA_ENVIO_RAST').Value := Null;
end;

end.
