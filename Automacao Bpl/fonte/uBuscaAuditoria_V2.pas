unit uBuscaAuditoria_V2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesAuditoria_V2, QRCtrls, grimgctrl,
  qrpctrls, QuickRpt;

type
  TfrmBuscaAudtioria_V2 = class(TfrmCadPadraoM)
    GroupBox4: TGroupBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    Edit1: TEdit;
    Edit3: TEdit;
    ComboBox4: TComboBox;
    Edit2: TEdit;
    ComboBox5: TComboBox;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox6: TComboBox;
    Edit6: TEdit;
    Edit7: TEdit;
    ComboBox7: TComboBox;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    ComboBox8: TComboBox;
    Edit11: TEdit;
    ComboBox9: TComboBox;
    Edit12: TEdit;
    Edit13: TEdit;
    ComboBox10: TComboBox;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox11: TComboBox;
    Edit16: TEdit;
    PopupMenu3: TPopupMenu;
    Removeritemdapesquisa1: TMenuItem;
    BitBtn7: TBitBtn;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel17: TQRLabel;
    AdicionaraPesquisaAdicional: TMenuItem;
    QRDBText1: TQRDBText;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRPShape1: TQRPShape;
    QRSysData2: TQRSysData;
    procedure GroupBox4Exit(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Removeritemdapesquisa1Click(Sender: TObject);
    procedure AdicionaraPesquisaAdicionalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure retirarTodosCombobox(pCombobox: TComboBox);
  private
    { Private declarations }
    vEdit: TEdit;
    vCombo: TComboBox;
    vMEdit: TMaskEdit;
    vSpBt: TSpeedButton;
    procedure criaComponente(campo, valor: string);
    procedure campoEnter(Sender: TObject);
    procedure spClick(Sender: TObject);
    function getMask(captionCampo: string): string;
    function getCampo(captionCampo: string): string;
    function sqlAdicional: string;
  public
    { Public declarations }
  end;

var
  frmBuscaAudtioria_V2: TfrmBuscaAudtioria_V2;
  obAuditoriaV2: TAuditoriaV2;

implementation

uses
  DBClient, uDtmAtivo, uDataSet_OOP;

{$R *.dfm}

procedure TfrmBuscaAudtioria_V2.AdicionaraPesquisaAdicionalClick(
  Sender: TObject);
begin
  if ActiveControl = DBGrid1 then
    criaComponente(DBGrid1.SelectedField.DisplayName, DBGrid1.SelectedField.Value)
  else
    criaComponente(ComboBox1.Items[ComboBox1.itemIndex], '');
end;

procedure TfrmBuscaAudtioria_V2.BitBtn1Click(Sender: TObject);
begin
  try
    inherited;
    obAuditoriaV2.verificarconexao;
    if MaskEdit2.Visible then
    begin
      if not obAuditoriaV2.ConsultaCampos('AUDITORIA', ComboBox1.Text,
        {ComboBox2.text}'CODIGO', maskedit1.text, DateToStr(StrToDate(maskedit2.text)+1),sqlAdicional, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if obAuditoriaV2.ConsultaCampos('AUDITORIA', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, {ComboBox2.text}'CODIGO', sqlAdicional,true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  except
  	on e: exception do
    begin
      if (Pos('Dataset open', e.Message) > 0)
      	or (Pos('Unable to complete network', e.Message) > 0)
        or (Pos('shutdown', e.Message) > 0) then
      begin
        if Application.MessageBox('Falha de conexão com o banco de dados. Deseja tentar recuperar a conexão?', 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES then
          if not vDadosIni.conectaBanco(dtmAtivo.BancoAuditoria, vDadosIni.vBancoAuditoria, True) then
            Application.MessageBox('O sistema não recuperou a conexão. Favor entre novamente no sistema', 'Atenção', 0 + 64);
      end;
    end;
  end;
end;

procedure TfrmBuscaAudtioria_V2.BitBtn3Click(Sender: TObject);
begin
//  inherited;
  QuickRep1.Preview;
end;

procedure TfrmBuscaAudtioria_V2.campoEnter(Sender: TObject);
begin
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmBuscaAudtioria_V2.criaComponente(campo, valor: string);
var
  I, J: Integer;
begin
  for I := 1 to 8 do
  begin
    J := I;
    if FindComponent('edCampo' + IntToStr(i)) = nil then
    begin
      vEdit := TEdit.create(Self);
      vEdit.Parent := GroupBox4;
      vEdit.Name := 'edCampo' + IntToStr(i);
      vEdit.Text := campo;
      vEdit.Tag := i;
      if I <= 4 then
        vEdit.Left := 18
      else
      begin
        J := I - 4;
        vEdit.Left := 401;
      end;
      vEdit.Width := 112;
      if J = 1 then
        vEdit.Top := 18
      else vEdit.Top := 18 + (27 * (J - 1));
      vEdit.Visible := true;
      vEdit.OnEnter := campoEnter;
      vEdit.PopupMenu := PopupMenu3;

      vCombo := TComboBox.create(Self);
      vCombo.Parent := GroupBox4;
      vCombo.Name := 'edCond' + IntToStr(i);
      vCombo.Tag := i;
      if I <= 4 then
        vCombo.Left := 136
      else
        vCombo.Left := 518;
      vCombo.Width := 86;
      if J = 1 then
        vCombo.Top := 18
      else vCombo.Top := 18 + (27 * (J - 1));
      vCombo.Visible := true;
      vCombo.PopupMenu := PopupMenu3;
      vCombo.Items := ComboBox3.Items;
      vCombo.Style := csDropDownList;
      if (UpperCase(campo) = 'DATA') or (UpperCase(campo) = 'HORA') then
      begin
        vCombo.Items.Delete(5);
        vCombo.Items.Delete(0);
      end;
      vCombo.ItemIndex := 0;

      vMEdit := TMaskEdit.create(Self);
      vMEdit.Parent := GroupBox4;
      vMEdit.Name := 'edValor' + IntToStr(i);
      //      vMEdit.EditMask := getMask(campo);
      vMEdit.Text := valor;
      vMEdit.Tag := i;
      if I <= 4 then
        vMEdit.Left := 228
      else
        vMEdit.Left := 610;
      vMEdit.Width := 112;
      if J = 1 then
        vMEdit.Top := 18
      else vMEdit.Top := 18 + (27 * (J - 1));
      vMEdit.Visible := true;
      vMEdit.PopupMenu := PopupMenu3;

      vSpBt := TSpeedButton.Create(Self);
      vSpBt.Parent := GroupBox4;
      vSpBt.Name := 'spBt' + IntToStr(i);
      vSpBt.Caption := 'E';
      vSpBt.Tag := i;
      if I <= 4 then
        vSpBt.Left := 346
      else
        vSpBt.Left := 728;
      vSpBt.Height := 21;
      vSpBt.Width := 23;
      if J = 1 then
        vSpBt.Top := 18
      else vSpBt.Top := 18 + (27 * (J - 1));
      vSpBt.Visible := true;
      vSpBt.Flat := true;
      vSpBt.OnClick := spClick;
      break;
    end
    else
      TSpeedButton(FindComponent('spBt' + IntToStr(i))).Visible:= True;

  end;
  for I := 8 downto 1 do
  begin
    if FindComponent('spBt' + IntToStr(i)) <> nil then
    begin
      TSpeedButton(FindComponent('spBt' + IntToStr(i))).Visible:= False;
      Break;
    end;
  end;
end;

procedure TfrmBuscaAudtioria_V2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
  frmBuscaAudtioria_V2 := nil;

  if Assigned(obAuditoriaV2) then
	  FreeAndNil(obAuditoriaV2);
end;

procedure TfrmBuscaAudtioria_V2.FormCreate(Sender: TObject);
begin
  inherited;
  obAuditoriaV2 := TAuditoriaV2.create;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmBuscaAudtioria_V2.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := obAuditoriaV2._dataSourceOOP;
    QuickRep1.DataSet := obAuditoriaV2.dataSet;
    QRDBText1.DataSet := obAuditoriaV2.dataSet;
    QRDBText2.DataSet := obAuditoriaV2.dataSet;
    QRDBText3.DataSet := obAuditoriaV2.dataSet;
    QRDBText4.DataSet := obAuditoriaV2.dataSet;
    QRDBText5.DataSet := obAuditoriaV2.dataSet;
    QRDBText6.DataSet := obAuditoriaV2.dataSet;
    QRDBText7.DataSet := obAuditoriaV2.dataSet;
    QRDBText8.DataSet := obAuditoriaV2.dataSet;
    QRDBText9.DataSet := obAuditoriaV2.dataSet;
    QRDBText10.DataSet := obAuditoriaV2.dataSet;
    QRDBText11.DataSet := obAuditoriaV2.dataSet;
    QRDBText12.DataSet := obAuditoriaV2.dataSet;
    QRDBText13.DataSet := obAuditoriaV2.dataSet;
    obAuditoriaV2.abrirAuditoria;
    obAuditoriaV2.dataSet.FieldByName('cod_empresa').Tag := 1;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  retirarTodosCombobox(ComboBox1);
  vDadosIni.fechaStatusProcessamento;
end;

function TfrmBuscaAudtioria_V2.getCampo(captionCampo: string): string;
var
  I: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count do
    if DBGrid1.Columns[i].Title.Caption = captionCampo then
    begin
      result := DBGrid1.Columns[i].FieldName;
      Break;
    end;
end;

function TfrmBuscaAudtioria_V2.getMask(captionCampo: string): string;
var
  i: Integer;
begin
  for i := 0 to DBGrid1.Columns.Count do
    if DBGrid1.Columns[i].Title.Caption = captionCampo then
    begin
      result :=
        TClientDataSet(DBGrid1.DataSource.DataSet).FindField(DBGrid1.Columns[i].FieldName).EditMask;
      Break;
    end;
end;

procedure TfrmBuscaAudtioria_V2.GroupBox4Exit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmBuscaAudtioria_V2.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(sender,'Relatório de auditoria');
end;

procedure TfrmBuscaAudtioria_V2.Removeritemdapesquisa1Click(Sender: TObject);
var
  I: Integer;
  vComponente: TComponent;
begin
  inherited;
  if ActiveControl is TComboBox then
  begin
    for I := 1 to 8 do
      if FindComponent('edCond' + IntToStr(i)) <> nil then
        if TComboBox(ActiveControl).Name = TComboBox(FindComponent('edCond' + IntToStr(i))).Name
          then
        begin
          vComponente := TEdit(FindComponent('edCampo' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          vComponente := TComboBox(FindComponent('edCond' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          vComponente := TMaskEdit(FindComponent('edValor' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          vComponente := TSpeedButton(FindComponent('spBt' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          Break;
        end;
  end
  else if ActiveControl is TMaskEdit then
  begin
    for I := 1 to 8 do
      if FindComponent('edValor' + IntToStr(i)) <> nil then
        if TComboBox(ActiveControl).Name = TComboBox(FindComponent('edValor' + IntToStr(i))).Name
          then
        begin
          vComponente := TEdit(FindComponent('edCampo' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          vComponente := TComboBox(FindComponent('edCond' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          vComponente := TEdit(FindComponent('edValor' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          vComponente := TSpeedButton(FindComponent('spBt' + IntToStr(i)));
          vComponente.Free;
          vComponente := nil;
          Break
        end;
  end;
  for I := 8 downto 1 do
  begin
    if FindComponent('spBt' + IntToStr(i)) <> nil then
    begin
      TSpeedButton(FindComponent('spBt' + IntToStr(i))).Visible:= False;
      Break;
    end;
  end;
end;

procedure TfrmBuscaAudtioria_V2.retirarTodosCombobox(pCombobox: TComboBox);
var
  I: Integer;
begin
  if pCombobox.Text = 'Todos' then
  begin
    pCombobox.Text := 'Data';
    MaskEdit1.Text := DateToStr(Date);
    MaskEdit2.Text := DateToStr(Date);

    MaskEdit3.Visible := false;
    MaskEdit1.Visible := true;
    MaskEdit2.Visible := true;
  end;

  for I := 0 to pCombobox.Items.Count - 1 do
  	if pCombobox.Items[i] = 'Todos' then
      pCombobox.Items.Delete(i);
end;

procedure TfrmBuscaAudtioria_V2.spClick(Sender: TObject);
begin
  if TSpeedButton(Sender).Caption = 'E' then
    TSpeedButton(Sender).Caption := 'OU'
  else
    TSpeedButton(Sender).Caption := 'E';
end;

function TfrmBuscaAudtioria_V2.sqlAdicional: string;
var
  I: Integer;
  vComponente: TComponent;
  vSql, vCampo, vCondicao, vValor, vEOU, formatodata: string;
begin
  vSql := ' and '; vCampo := ''; vCondicao := ''; vValor := ''; vEOU := '';
  if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
    formatodata := 'mm/dd/yyyy'
  else if pos('.', ShortDateFormat) <> 0 then
    formatodata := 'dd.mm.yyyy';
  for I := 1 to 8 do
  begin
    if FindComponent('edCond' + IntToStr(i)) <> nil then
      if (Trim(TMaskEdit(FindComponent('edValor' + IntToStr(i))).Text) <> '') and
      (Trim(TComboBox(FindComponent('edCond' + IntToStr(i))).Text) <> '') then
      begin
        if (vSql <> ' and ') and (vEOU <> '') then
          if vEOU = 'E' then
            vSql := vSql + ' and '
          else vSql := vSql + ' or ';
        vComponente := TEdit(FindComponent('edCampo' + IntToStr(i)));
        vCampo := getCampo(TEdit(vComponente).Text);
        vComponente := TComboBox(FindComponent('edCond' + IntToStr(i)));
        vCondicao := TEdit(vComponente).Text;
        vComponente := TMaskEdit(FindComponent('edValor' + IntToStr(i)));
        vValor := TMaskEdit(vComponente).Text;
        vComponente := TSpeedButton(FindComponent('spBt' + IntToStr(i)));
        vEOU := TSpeedButton(vComponente).Caption;
        if vCondicao = 'Igual' then
          vCondicao := '='
        else if vCondicao = 'Diferente' then
          vCondicao := '<>'
        else if vCondicao = 'Maior' then
          vCondicao := '>'
        else if vCondicao = 'Menor' then
          vCondicao := '<';

        vSql := vSql + vCampo;
        if ((vCondicao = 'Começa') or (vCondicao = 'Esta contido')) and (vCampo <> '') then
        begin
          vSql := vSql + ' like ';
          if (vCondicao = 'Começa') then
            vSql := vSql + QuotedStr(vValor + '%')
          else
            vSql := vSql + QuotedStr('%' + vValor + '%');
        end
        else
        begin
          try
            if vCampo = 'DATA' then
              vValor := FormatDateTime(formatodata, StrToDate(vValor))
            else if vCampo = 'HORA' then
              vValor := FormatDateTime('hh:mm:ss', StrToTime(vValor));
          except
            on e: exception do
            begin
              Result := '';
              Application.MessageBox('Formato de Data ou Hora inválido', 'Atenção', MB_OK +
                MB_ICONINFORMATION);
              exit;
            end;
          end;
          vSql := vSql + ' ' + vCondicao + ' ' + QuotedStr(vValor);
        end;
      end;
  end;
  if vsql = ' and '  then
    Result := ''
  else
    Result := vSql;
end;

end.
