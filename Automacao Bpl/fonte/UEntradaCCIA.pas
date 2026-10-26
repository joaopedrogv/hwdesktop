unit UEntradaCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UClassesVeiculosCCIA, Grids, DBGrids,
  ComCtrls, Menus, DB;

type
  TfrmEntradaCCIA = class(TForm)
    PageControl1: TPageControl;
    tsEntrada: TTabSheet;
    tsVeiculosXML: TTabSheet;
    pnVeiculosXML: TPanel;
    Panel25: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    Label103: TLabel;
    Label125: TLabel;
    Label187: TLabel;
    Label15: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Label130: TLabel;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    EditChassiXML: TEdit;
    EditEspecieXML: TEdit;
    EditMarcaXML: TEdit;
    EditModeloXML: TEdit;
    EditCorXML: TEdit;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    cbxNovoXml: TCheckBox;
    cbxUsadoXml: TCheckBox;
    ComboBox5: TComboBox;
    Panel29: TPanel;
    DBGrid6: TDBGrid;
    PopupMenu1: TPopupMenu;
    Copiarparareadetransferncia1: TMenuItem;
    DtVeiculosXML: TDataSource;
    pnEntrada: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn170: TBitBtn;
    procedure BitBtn170Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure DBGrid6TitleClick(Column: TColumn);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxUsadoXmlClick(Sender: TObject);
    procedure cbxNovoXmlClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SetarValoresXml(pFlag: Integer = 0);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaCCIA: TfrmEntradaCCIA;
  vXmlNf: TXmlImport;

implementation

uses
  Registry, uDtmAtivo, DBClient, Clipbrd;

{$R *.dfm}

procedure TfrmEntradaCCIA.BitBtn170Click(Sender: TObject);
begin
 ModalResult := mrCancel;
 vXmlNf.manifestacaodestinatario;
end;

procedure TfrmEntradaCCIA.BitBtn1Click(Sender: TObject);
begin
  try
   Screen.Cursor := crHourGlass;
   if not vDadosIni.vDtSetTmp.IsEmpty then
   begin
     if vDadosIni.vDtSetTmp.State <> dsEdit then
      vDadosIni.vDtSetTmp.Edit;
     vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CTR';
     vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'E';
     vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CTRCOMPRA';
     vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'V';
     vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Contrato de Compra';
     vDadosIni.vDtSetTmp.Post;
   end;

   ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEntradaCCIA.BitBtn2Click(Sender: TObject);
begin
 try
    Screen.Cursor := crHourGlass;
   if not vDadosIni.vDtSetTmp.IsEmpty then
   begin
     if vDadosIni.vDtSetTmp.State <> dsEdit then
      vDadosIni.vDtSetTmp.Edit;
     vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString := 'CTR';
     vDadosIni.vDtSetTmp.FieldByName('NATUREZA').AsString := 'E';
     vDadosIni.vDtSetTmp.FieldByName('MODELO').AsString := 'CTRENTCONS';
     vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString := 'C';
     vDadosIni.vDtSetTmp.FieldByName('NOME_CONTRATO').AsString := 'Contrato Entrada em Consignação';
     vDadosIni.vDtSetTmp.Post;
   end;
    ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEntradaCCIA.BitBtn3Click(Sender: TObject);
begin
  try
    if CheckBox1.Checked then
    begin
      if OpenDialog1.Execute then
      begin
        ModalResult := mrCancel;
        vXmlNf.importaXml(OpenDialog1.FileName);
      end;
    end
    else
    begin
      if OpenDialog1.Execute then
      begin
        ModalResult := mrCancel;
        vXmlNf.importaXmlNF(OpenDialog1.FileName);
      end;
    end;
  except
  end;
end;

procedure TfrmEntradaCCIA.BitBtn4Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEntradaCCIA.BitBtn6Click(Sender: TObject);
begin
 try
  vXmlNf.fTempDtSet.Filtered := false;
  vXmlNf.fTempDtSet.Filter := 'sel = ''S''';
  vXmlNf.fTempDtSet.Filtered := true;

  if vXmlNf.fTempDtSet.RecordCount <= 0 then
  begin
   Application.MessageBox('Nenhum Veículo selecionado!', 'Atenção',MB_OK+MB_ICONINFORMATION);
   vXmlNf.fTempDtSet.Filtered := false;
   exit;
  end;

  vXmlNf.fTempDtSet.First;
  if not vXmlNf.fTempDtSet.Eof then
  begin
     if not ((vXmlNf.fTempDtSet.FieldByName('STATUS_USO').AsString= 'N') or (vXmlNf.fTempDtSet.FieldByName('STATUS_USO').AsString= 'U')) then
     begin
       Application.MessageBox('Situação (N - Novo; U - Usado) não definido para os veículos selecionados!', 'Atenção', MB_OK+MB_ICONINFORMATION);
       vXmlNf.fTempDtSet.Filtered := false;
       exit;
     end;
     if vXmlNf.fTempDtSet.FieldByName('TIPV_VEICULO').AsString = '' then
     begin
       Application.MessageBox('Tipo de Venda não definido para os veículos selecionados!', 'Atenção', MB_OK+MB_ICONINFORMATION);
       if (Self.Enabled) and (Self.Visible) and (ComboBox5.CanFocus) then
         ComboBox5.SetFocus;
       vXmlNf.fTempDtSet.Filtered := false;
       exit;
     end;

    vXmlNf.fTempDtSet.Next;
  end;
  vXmlNf.fTempDtSet.Filtered := false;
  vXmlNf.fTempDtSet.First;

  TForm(pnVeiculosXML.Parent).ModalResult := IDOK;
 except
 end;
end;

procedure TfrmEntradaCCIA.BitBtn7Click(Sender: TObject);
begin
  vXmlNf.fTempDtSet.Filtered := false;
  TForm(pnVeiculosXML.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmEntradaCCIA.BitBtn8Click(Sender: TObject);
begin
 try
   vXmlNf.CadTransito;
 except
 end;
end;

procedure TfrmEntradaCCIA.BitBtn9Click(Sender: TObject);
begin
 try
  vXmlNf.montarNfAvulsa('E');
  ModalResult := mrCancel;
 except
 end;
end;

procedure TfrmEntradaCCIA.btSelectAllClick(Sender: TObject);
begin
 if not vXmlNf.fTempDtSet.IsEmpty then
   vXmlNf._marcarTodos(vXmlNf.fTempDtSet);
end;

procedure TfrmEntradaCCIA.btUnSelectAllClick(Sender: TObject);
begin
 if not vXmlNf.fTempDtSet.IsEmpty then
   vXmlNf._desmarcarTodos(vXmlNf.fTempDtSet);
end;

procedure TfrmEntradaCCIA.cbxNovoXmlClick(Sender: TObject);
begin
 cbxNovoXml.Checked := cbxNovoXml.Checked;
  if cbxNovoXml.Checked then
    cbxUsadoXml.Checked := not cbxNovoXml.Checked;

  SetarValoresXml;
end;

procedure TfrmEntradaCCIA.cbxUsadoXmlClick(Sender: TObject);
begin
  cbxUsadoXml.Checked := cbxUsadoXml.Checked;
  if cbxUsadoXml.Checked then
    cbxNovoXml.Checked := not cbxUsadoXml.Checked;

  SetarValoresXml;
end;

procedure TfrmEntradaCCIA.ComboBox5Exit(Sender: TObject);
begin
 SetarValoresXml(1);
end;

procedure TfrmEntradaCCIA.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid6.DataSource.DataSet.FieldByName(DBGrid6.Columns[DBGrid6.SelectedIndex].FieldName).AsString;
end;

procedure TfrmEntradaCCIA.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not vXmlNf.fTempDtSet.IsEmpty then
      vXmlNf._marcaDesmarcaLinha(vXmlNf.fTempDtSet);
end;

procedure TfrmEntradaCCIA.DBGrid6TitleClick(Column: TColumn);
begin
vDadosIni.DBGridOnTitleClick(DBGrid6, Column);
end;

procedure TfrmEntradaCCIA.BitBtn5Click(Sender: TObject);
var
 vTemp: string;
begin
 vTemp := '';
  inherited;
 if ((trim(EditChassiXML.Text) = '') and (trim(EditEspecieXML.Text) = '') and (trim(EditMarcaXML.Text) = '') and
      (trim(EditModeloXML.Text) = '') and (trim(EditCorXML.Text) = '')) then
    vXmlNf.fTempDtSet.Filtered := false
 else
 begin
    if (trim(EditChassiXML.Text) <> '')  then
    begin
      if vTemp <> '' then
        vTemp := vTemp + ' AND ';
      vTemp := vTemp + ' CHASSI_C LIKE '+QuotedStr('%'+trim(EditChassiXML.Text)+'%');
    end;
    if trim(EditEspecieXML.Text) <> '' then
    begin
      if vTemp <> '' then
        vTemp := vTemp + ' AND ';
      vTemp := vTemp + ' TIPOEST LIKE '+QuotedStr('%'+trim(EditEspecieXML.Text)+'%');
    end;
    if trim(EditMarcaXML.Text) <> '' then
    begin
      if vTemp <> '' then
        vTemp := vTemp + ' AND ';
      vTemp := vTemp + ' MARCAEST LIKE '+QuotedStr('%'+trim(EditMarcaXML.Text)+'%');
    end;
    if trim(EditModeloXML.Text) <> '' then
    begin
      if vTemp <> '' then
        vTemp := vTemp + ' AND ';
      vTemp := vTemp + ' DESCRICAO_VERSAOEST LIKE '+QuotedStr('%'+trim(EditModeloXML.Text)+'%');
    end;
    if trim(EditCorXML.Text) <> '' then
    begin
      if vTemp <> '' then
        vTemp := vTemp + ' AND ';
      vTemp := vTemp + ' COREST LIKE '+QuotedStr('%'+trim(EditCorXML.Text)+'%');
    end;
    vXmlNf.fTempDtSet.Filtered := false;
    vXmlNf.fTempDtSet.Filter := vTemp;
    vXmlNf.fTempDtSet.Filtered := true;
 end;
end;

procedure TfrmEntradaCCIA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (vXmlNf <> nil) then
    vXmlNf.Cancel;

  vXmlNf.free;
  vXmlNf := nil;

//  Action := caFree;
//  if (frmEntradaCCIA <> nil) then
//    frmEntradaCCIA := nil;
end;

procedure TfrmEntradaCCIA.FormCreate(Sender: TObject);
begin
  vXmlNf := TXmlImport.create;
  tsEntrada.TabVisible := false;
  tsVeiculosXML.TabVisible := false;
end;

procedure TfrmEntradaCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if ((PageControl1.ActivePage = tsEntrada) and (Key = VK_ESCAPE)) then
  BitBtn4Click(Sender);
end;

procedure TfrmEntradaCCIA.FormShow(Sender: TObject);
var
  vModCFT, vModCFTv, vTipoVenda: string;
  vEstoque, vComFat, vMorto: boolean;
  vNumNotaV: Integer;
begin
  vModCFT := vDadosIni.vDtSetTmp.FieldByName('MODELO_CFT').AsString;
  vModCFTv := vDadosIni.vDtSetTmp.FieldByName('MODELO_CFTV').AsString;
  vEstoque := vDadosIni.vDtSetTmp.FieldByName('STATUS_ESTOQUE').AsString = 'S';
  vComFat := vDadosIni.vDtSetTmp.FieldByName('COMFAT').Value = true;
  vTipoVenda := vDadosIni.vDtSetTmp.FieldByName('TIPV_VEICULO').AsString;
  vNumNotaV := vDadosIni.vDtSetTmp.FieldByName('NUM_NOTAV').AsInteger;
  vMorto := trim(vDadosIni.vDtSetTmp.FieldByName('POSICAO').AsString) = 'MORTO';
  BitBtn1.Enabled := True;
  BitBtn2.Enabled := True;
  BitBtn3.Enabled := True;
  BitBtn4.Enabled := True;

  if (PageControl1.ActivePage = tsEntrada) then
  begin
    if not vComFat then
    begin
      BitBtn1.Enabled := (not vMorto) and (vModCFT = '') and (vNumNotaV = 0) and (vModCFTv = '')
       and ((vTipoVenda = 'V') or (vTipoVenda = 'D') or (vTipoVenda = 'T') or (vTipoVenda = 'R') or (vTipoVenda = 'E'));
      BitBtn2.Enabled := (not vMorto) and (not vEstoque) and (vModCFT = '') and (vTipoVenda = 'C') and (vNumNotaV = 0) and (vModCFTv = '');
    end
    else
    begin
      BitBtn1.Enabled := true;
      BitBtn2.Enabled := true;
    end;
  end
  else if (PageControl1.ActivePage = tsVeiculosXML) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditChassiXML.CanFocus) then
      EditChassiXML.SetFocus;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn9.CanFocus) then
    BitBtn9.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
    BitBtn3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) then
    BitBtn2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then                
    BitBtn4.SetFocus;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmEntradaCCIA.SetarValoresXml(pFlag: Integer = 0);
begin
  if ((not cbxNovoXml.Checked) and (not cbxUsadoXml.Checked)) then
    vXmlNf.SetarStatusUsoXMLVeiculo('', ComboBox5.Text, pFlag)
  else if cbxNovoXml.Checked then
    vXmlNf.SetarStatusUsoXMLVeiculo('N', ComboBox5.Text, pFlag)
  else if cbxUsadoXml.Checked then
    vXmlNf.SetarStatusUsoXMLVeiculo('U', ComboBox5.Text, pFlag);
end;

end.
