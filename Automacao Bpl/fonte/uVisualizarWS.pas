unit uVisualizarWS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, UDtmConfig,
  uDtmAtivo, DB, CheckLst, Registry, ImgList;

type
  TfrmVisualizarWs = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    Timer2: TTimer;
    Timer3: TTimer;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Panel4: TPanel;
    BitBtn7: TBitBtn;
    btnIniciar: TBitBtn;
    BitBtn9: TBitBtn;
    btnParar: TBitBtn;
    PageControl4: TPageControl;
    TabSheet6: TTabSheet;
    PageControl5: TPageControl;
    Panel5: TPanel;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    btnPararE: TBitBtn;
    btnIniciarE: TBitBtn;
    GeralTab: TTabSheet;
    GeralErrosTab: TTabSheet;
    GeralTxt: TMemo;
    GeralErrosTxt: TMemo;
    procedure PageControl5Change(Sender: TObject);
    procedure PageControl4Change(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizarWs: TfrmVisualizarWs;
  vTimer2, vTimer3: Boolean;
  vComponentesCriados: Boolean;

implementation

uses uClassesConfigWS;

{$R *.dfm}

procedure TfrmVisualizarWs.btnPararClick(Sender: TObject);
begin
  if (vTimer2) then
  begin
    btnIniciar.Visible := true;
    btnIniciarE.Visible := true;
    btnParar.Visible := false;
    btnPararE.Visible := false;
    vTimer2 := false;
    Timer2.Enabled := false;
  end;
end;

procedure TfrmVisualizarWs.BitBtn13Click(Sender: TObject);
var
 I: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TMemo) then
        if ((PageControl5.ActivePage.Name = 'GeralErrosTab') and (TMemo(Components[I]).Name = 'GeralErrosTxt')) then
        begin
           TMemo(Components[I]).Clear;
           Break;
        end
        else if 'MemoErros' + StringReplace(PageControl5.ActivePage.Name, 'TabsheetErros', '', []) = TMemo(Components[I]).Name then
        begin
           TMemo(Components[I]).Clear;
           Break;
        end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVisualizarWs.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CWS032', 'CONSULTA', '', 'WSR_CONSULTAS', '', vConsultasWs.buscas, true) then
    Exit;

  inherited;
  vConsultasWs.rConsulta.vCampo := ComboBox1.Text;
  vConsultasWs.rConsulta.vCampoAd := ComboBox11.Text;
  vConsultasWs.rConsulta.vValorAd := trim(MaskEdit7.Text);
  vConsultasWs.rConsulta.vDataIniAd := MaskEdit9.Text;
  vConsultasWs.rConsulta.vDataFimAd := MaskEdit8.Text;
  vConsultasWs.rConsulta.vCondicaoAd := ComboBox12.Text;
  vConsultasWs.rConsulta.vPorDataAd := MaskEdit9.Visible;
  vConsultasWs.rConsulta.vAdicional := CheckBox1.Checked;
  vConsultasWs._defineSqlAdicional;

    if MaskEdit2.Visible then
    begin
      if not vConsultasWs.ConsultaCamposOutrasEmp('WSR_CONSULTAS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, '99999', 1, 'WSR_CONSULTAS.*, EMPRESA.IDENTIFICACAO_EMP, WSR_SCHEMAS.IDENTIFICACAO, WSR_SCHEMAS.TOKEN ',
        'LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = WSR_CONSULTAS.COD_EMPRESA ' +
        'LEFT JOIN WSR_SCHEMAS ON WSR_SCHEMAS.COD_SCHEMA = WSR_CONSULTAS.COD_SCHEMA ', vConsultasWs.rConsulta.vSqlAdicional) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not vConsultasWs.ConsultaCamposOutrasEmp('WSR_CONSULTAS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, '99999', 'WSR_CONSULTAS.*, EMPRESA.IDENTIFICACAO_EMP, WSR_SCHEMAS.IDENTIFICACAO, WSR_SCHEMAS.TOKEN ',
      'LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = WSR_CONSULTAS.COD_EMPRESA ' +
      'LEFT JOIN WSR_SCHEMAS ON WSR_SCHEMAS.COD_SCHEMA = WSR_CONSULTAS.COD_SCHEMA ', vConsultasWs.rConsulta.vSqlAdicional) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	  DBGrid1.SetFocus;
end;

procedure TfrmVisualizarWs.BitBtn7Click(Sender: TObject);
begin
  inherited;
   vTimer2 := False;
   vTimer3 := False;
   Timer2.Enabled := False;
   Timer3.Enabled := False;
   PageControl1.ActivePage := TabSheet2;
   TabSheet2.Show; 
end;

procedure TfrmVisualizarWs.btnIniciarClick(Sender: TObject);
begin
  if not (vTimer2) then
  begin
    btnIniciar.Visible := false;
    btnIniciarE.Visible := false;
    btnParar.Visible := true;
    btnPararE.Visible := true;
    vTimer2 := true;
    Timer2.Enabled := true;
  end;
end;

procedure TfrmVisualizarWs.BitBtn9Click(Sender: TObject);
var
 I: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TMemo) then
        if ((PageControl4.ActivePage.Name = 'GeralTab') and (TMemo(Components[I]).Name = 'GeralTxt')) then
        begin
           TMemo(Components[I]).Clear;
           Break;
        end
        else if 'Memo' + StringReplace(PageControl4.ActivePage.Name, 'Tabsheet', '', []) = TMemo(Components[I]).Name then
        begin
           TMemo(Components[I]).Clear;
           Break;
        end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmVisualizarWs.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    groupAdicional.Visible := CheckBox1.Checked
  else
    groupAdicional.Visible := not CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if (Self.Enabled) and (Self.Visible) and (combobox11.CanFocus) then
  	ComboBox11.SetFocus;
end;

procedure TfrmVisualizarWs.ComboBox11Exit(Sender: TObject);
var
 I: Integer;
 vCampoAdcional: string;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (combobox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmVisualizarWs.ComboBox12Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
  	BitBtn1.SetFocus;
end;

procedure TfrmVisualizarWs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vSchema.Free;
  vSchema := nil;

  vConsultasWs.Free;
  vConsultasWs := nil;

  vLogWs.Free;
  vLogWs := nil;

  Action := caFree;
  frmVisualizarWs := nil;
end;

procedure TfrmVisualizarWs.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  vSchema := TSchemasWs.create;
  vConsultasWs := TConsultasWs.create;
  vLogWs := TLogWs.create;

  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;

  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmVisualizarWs.FormShow(Sender: TObject);
begin
  vComponentesCriados := false;
  
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dswsConsultas;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
//    CheckBox1.Visible := False;
    CheckBox3.Visible := False;
  end;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmVisualizarWs.PageControl2Change(Sender: TObject);
begin
//  try
//    Screen.Cursor := crHourGlass;
//    Timer2Timer(Sender);
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmVisualizarWs.PageControl4Change(Sender: TObject);
begin
//  try
//    Screen.Cursor := crHourGlass;
//	  Timer2Timer(Sender);
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmVisualizarWs.PageControl5Change(Sender: TObject);
begin
//  try
//    Screen.Cursor := crHourGlass;
//    Timer2Timer(Sender);
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmVisualizarWs.SpeedButton6Click(Sender: TObject);
var
	Tab, TabErros : TTabSheet;
  Memo, MemoErros: TMemo;
	I : integer;
begin
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('CWS033', 'VISUALIZAR', '', 'WSR_CONSULTAS', '', vConsultasWs.buscas, true) then
      Exit;

    if not vLogWs.verificaConexao then
      exit;
    PageControl1.ActivePage := TabSheet4;
    TabSheet4.Show;
    btnIniciar.Visible := false;
    btnIniciarE.Visible := false;
    btnParar.Visible := true;
    btnPararE.Visible := true;
    if vSchema.abreSchema then
    begin
      if not vComponentesCriados then
      begin
        vSchema.dataSet.First;
        while not vSchema.dataSet.Eof do
        begin
          Tab := TTabSheet.create(Self);
          Tab.parent := PageControl4;
          Tab.name := 'Tabsheet' + vSchema.dataSet.FieldByName('TOKEN').AsString;
          Tab.Caption := vSchema.dataSet.FieldByName('IDENTIFICACAO').AsString;
          Tab.PageControl := PageControl4;
          Tab.TabVisible := True;
          Tab.Visible := True;
          Tab.show;

          TabErros := TTabSheet.create(Self);
          TabErros.parent := PageControl5;
          TabErros.name := 'TabsheetErros' + vSchema.dataSet.FieldByName('TOKEN').AsString;
          TabErros.Caption := vSchema.dataSet.FieldByName('IDENTIFICACAO').AsString;
          TabErros.PageControl := PageControl5;
          TabErros.TabVisible := True;
          TabErros.Visible := True;
          TabErros.show;

          Memo := TMemo.Create(Self);
          Memo.Parent := Tab;
          Memo.Name := 'Memo' + vSchema.dataSet.FieldByName('TOKEN').AsString;
          Memo.Align := alClient;
          Memo.ReadOnly := true;
          Memo.ScrollBars := ssBoth;
          Memo.Clear;

          MemoErros := TMemo.Create(Self);
          MemoErros.Parent := TabErros;
          MemoErros.Name := 'MemoErros' + vSchema.dataSet.FieldByName('TOKEN').AsString;
          MemoErros.Align := alClient;
          MemoErros.ReadOnly := true;
          MemoErros.ScrollBars := ssBoth;
          MemoErros.Clear;

          vSchema.dataSet.Next;
        end;
      end;
      vSchema.dataSet.First;

      if not vComponentesCriados then
      begin
        GeralErrosTab.Show;
        GeralTab.Show;
      end;
      vComponentesCriados := true;
      vLogWs.atualizarConsultaLog(vSchema.dataSet.FieldByName('TOKEN').AsString);

      vTimer2 := true;
      vTimer3 := true;
      Timer2.Enabled := true;
      Timer3.Enabled := true;
    end;
  finally
     Screen.Cursor := crDefault;
  end;
end;


procedure TfrmVisualizarWs.Timer2Timer(Sender: TObject);
var
 I: Integer;
begin
  try
    if not vTimer2 then
      exit;

    Timer2.Enabled := false;
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TMemo) then
      begin
        if Pos('MemoErros', TMemo(Components[I]).Name) > 0 then
         	vLogWs.lerLog(TMemo(Components[I]), GeralErrosTxt, StringReplace(TMemo(Components[I]).Name, 'MemoErros', '', []), 'E')
        else if Pos('Memo', TMemo(Components[I]).Name) > 0 then
          vLogWs.lerLog(TMemo(Components[I]), GeralTxt, StringReplace(TMemo(Components[I]).Name, 'Memo','', []));
      end;
    end;
  finally
    Timer2.Enabled := true;
  end;
end;

procedure TfrmVisualizarWs.Timer3Timer(Sender: TObject);
var
 I: Integer;
begin
  try
    Timer3.Enabled := true;
    for I := 0 to ComponentCount - 1 do
    	if (Components[I] is TMemo) then
      	if Pos('MemoErros',  TMemo(Components[I]).Name) > 0 then
					vLogWs.atualizarConsultaLog(StringReplace(TMemo(Components[I]).Name, 'MemoErros', '', []));
  finally
	   Timer3.Enabled := true;
  end;
end;

end.
