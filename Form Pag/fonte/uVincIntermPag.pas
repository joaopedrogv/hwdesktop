unit uVincIntermPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditHw, DBCtrls, Buttons, ExtCtrls, uClasseFP, Mask;

type
  TfrmVincIntermPag = class(TForm)
    pnIntermControle: TPanel;
    Label31: TLabel;
    Panel16: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBLookupComboBoxControle: TDBLookupComboBox;
    EditHwControle: TEditHw;
    cbIntermediador: TComboBox;
    EditHwIdMetodoPag: TEditHw;
    Label30: TLabel;
    Label1: TLabel;
    EditHwCondPag: TEditHw;
    DBLookupComboBoxCondPag: TDBLookupComboBox;
    Label2: TLabel;
    cbLocalVenda: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    edIdcadinttran: TMaskEdit;
    procedure DBLookupComboBoxCondPagExit(Sender: TObject);
    procedure EditHwCondPagKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwCondPagExit(Sender: TObject);
    procedure DBLookupComboBoxControleExit(Sender: TObject);
    procedure EditHwControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwControleExit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fidcadinttran: string;
  public
    { Public declarations }
    property idcadinttran: string read Fidcadinttran write Fidcadinttran;
  end;

var
  frmVincIntermPag: TfrmVincIntermPag;
  vVincIntermPag: TVincIntermPag;

implementation

uses uDtmFormPag, uDtmAtivo, uDadosIni, DB, uDataSet_OOP, StrUtils;

{$R *.dfm}

procedure TfrmVincIntermPag.BitBtn10Click(Sender: TObject);
begin
 if (Self.Enabled) and (Self.Visible) and (BitBtn10.CanFocus) then
 	 BitBtn10.SetFocus;
 if trim(cbLocalVenda.Text) = '' then
 begin
   Application.MessageBox(pchar('Local de Venda deve ser informado!'),
    'Informação', MB_OK + MB_ICONERROR);
   exit;
 end;
 if trim(cbIntermediador.Text) = '' then
 begin
   Application.MessageBox(pchar('Intermediador deve ser informado!'),
    'Informação', MB_OK + MB_ICONERROR);
   exit;
 end;
 if EditHwControle.AsValue <= 0 then
 begin
   Application.MessageBox(pchar('Controle deve ser informado!'),
    'Informação', MB_OK + MB_ICONERROR);
   exit;
 end;

 if not vVincIntermPag.vincularIntermediadorControle(Trunc(EditHwIdMetodoPag.AsValue),
  cbLocalVenda.Text, cbIntermediador.Text, Trim(edIdcadinttran.Text), Trunc(EditHwControle.AsValue), Trunc(EditHwCondPag.AsValue)) then
   exit;

 ModalResult := mrOk;
end;

procedure TfrmVincIntermPag.BitBtn11Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn11.CanFocus) then
  	BitBtn11.SetFocus;
  ModalResult := mrCancel;
end;

procedure TfrmVincIntermPag.DBLookupComboBoxCondPagExit(Sender: TObject);
begin
   EditHwCondPag.AsValue := DBLookupComboBoxCondPag.KeyValue;
end;

procedure TfrmVincIntermPag.DBLookupComboBoxControleExit(Sender: TObject);
begin
 EditHwControle.AsValue := DBLookupComboBoxControle.KeyValue;
end;

procedure TfrmVincIntermPag.EditHwCondPagExit(Sender: TObject);
begin
  DBLookupComboBoxCondPag.KeyValue := EditHwCondPag.AsInteger;

  if (ActiveControl = BitBtn11) then
    Exit;

  if EditHwCondPag.AsInteger > 0 then
    if not vVincIntermPag.vCondPagIntermPag.dataSet.Locate('COD_COND_PAG', EditHwCondPag.AsInteger, []) then
    begin
      Application.MessageBox('Condição de Pagamento não encontrada', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (EditHwCondPag.CanFocus) then
        EditHwCondPag.SetFocus;
      exit;
    end;
end;

procedure TfrmVincIntermPag.EditHwCondPagKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COND_PAG');
      if vDadosIni.vPesquisa <> '' then
        EditHwCondPag.AsValue := StrToFloat(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmVincIntermPag.EditHwControleExit(Sender: TObject);
begin
  DBLookupComboBoxControle.KeyValue := EditHwControle.AsInteger;

  if (ActiveControl = BitBtn11) then
    Exit;

  if EditHwControle.AsInteger > 0 then
    if not vVincIntermPag.vControleIntermPag.dataSet.Locate('CODIGO_CTRL', EditHwControle.AsInteger, []) then
    begin
      Application.MessageBox('Controle não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (EditHwControle.CanFocus) then
        EditHwControle.SetFocus;
      exit;
    end;
end;

procedure TfrmVincIntermPag.EditHwControleKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CONTROLES');
      if vDadosIni.vPesquisa <> '' then
        EditHwControle.AsValue := StrToFloat(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmVincIntermPag.FormCreate(Sender: TObject);
begin
   vVincIntermPag := TVincIntermPag.create;
   vVincIntermPag.vControleIntermPag._abreVincIntermPag;
   vVincIntermPag.vCondPagIntermPag._abreVincIntermPag;
end;

procedure TfrmVincIntermPag.FormShow(Sender: TObject);
begin
  vVincIntermPag.vControleIntermPag._abreVincIntermPag;

  cbLocalVenda.Clear;
  cbLocalVenda.Items.Add(vDadosIni.vPesquisaLocalVenda);
  cbLocalVenda.ItemIndex := 0;

  cbIntermediador.Clear;
  cbIntermediador.Items.Add(vDadosIni.vPesquisaInterPag);
  cbIntermediador.ItemIndex := 0;

  EditHwIdMetodoPag.AsValue := vDadosIni.vPesquisaMetodoId;
  EditHwControle.AsValue := vVincIntermPag.retornaControleIntermediador(vDadosIni.vPesquisaLocalVenda, vDadosIni.vPesquisaInterPag);
  DBLookupComboBoxControle.KeyValue := EditHwControle.AsValue;

  EditHwCondPag.AsValue := vVincIntermPag.retornaCondPagIntermediador(vDadosIni.vPesquisaLocalVenda, vDadosIni.vPesquisaInterPag);
  DBLookupComboBoxCondPag.KeyValue := EditHwCondPag.AsValue;

  edIdcadinttran.Text := idcadinttran;

  if (Self.Enabled) and (Self.Visible) and (cbLocalVenda.CanFocus) then
    cbLocalVenda.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (edIdcadinttran.CanFocus) then
    edIdcadinttran.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHwControle.CanFocus) then
    EditHwControle.SetFocus;
  vDadosIni.fechaStatusProcessamento;
end;

end.
