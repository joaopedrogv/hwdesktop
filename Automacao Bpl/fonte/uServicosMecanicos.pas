unit uServicosMecanicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmAgendaMecanico = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    pnMecanico: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    ckTodos: TCheckBox;
    qrpAgenda: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    BitBtn7: TBitBtn;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRExpr29: TQRExpr;
    procedure qrpAgendaPreview(Sender: TObject);
    procedure QRExpr29Print(sender: TObject; var Value: string);
    procedure ckTodosClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MarcarDesmarcaMecanico;
    procedure DesabilitarCampos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendaMecanico: TfrmAgendaMecanico;
  sqladcional: string;

implementation

uses
  uDtmAgenda, uClassesAgenda, uDtmAtivo, DB, uDataSet_OOP, uDadosIni;

{$R *.dfm}

procedure TfrmAgendaMecanico.BitBtn1Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('AGO023', 'PESQUISAR', '',
      'AGENDA_ITENS', '', ServicosMecanicos.buscas, true) then
    begin
      inherited;

      if not ckTodos.Checked then
      begin
        if DBLookupComboBox1.KeyValue > 0 then
           sqladcional := ' AGENDA_ITENS.COD_VENDEDOR = ' + IntToStr(DBLookupComboBox1.KeyValue) //+ ' AND '
      else
        sqladcional :='';
      end
      else
        sqladcional :='';

      ServicosMecanicos.rBOL.vCampo := ComboBox1.Text;
      ServicosMecanicos.rBOL.vValor := MaskEdit3.Text;
      ServicosMecanicos.rBOL.vDataIni := MaskEdit1.Text;
      ServicosMecanicos.rBOL.vDataFim := MaskEdit2.Text;
      ServicosMecanicos.rBOL.vCondicao := ComboBox3.Text;
      ServicosMecanicos.rBOL.vPorData := MaskEdit1.Visible;
      ServicosMecanicos.rBOL.vAdicional := CheckBox1.Checked;
      ServicosMecanicos._defineSqlAdicional;
      if MaskEdit2.Visible then
      begin
       if not ServicosMecanicos.ConsultaAvancada(MaskEdit1.Text, MaskEdit2.Text, ckTodos.Checked, DBLookupComboBox1.KeyValue) then
       	 if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
         	 combobox1.setfocus
  //      if not ServicosMecanicos.ConsultaCampos('AGENDA_ITENS', ComboBox1.Text,
  //        'AGENDA.COD_AGENDA', ServicosMecanicos.rBOL.vDataIni, ServicosMecanicos.rBOL.vDataFim, vDadosIni.codEmpresa, 1,
  //        ' AGENDA_ITENS.*, AGENDA.COD_CLIENTE, AGENDA.NOME_CLIENTE, AGENDA.DATA_AGENDA, AGENDA.HORA_AGENDA, AGENDA.MINUTO_AGENDA, ' +
  //				' AGENDA.STATUS_AGENDA, AGENDA.COD_VEICULO, AGENDA.PLACA, AGENDA.CHASSI, AGENDA.COD_EQUIP, COLABORADOR.NOME_VENDEDOR, BOX.DESCR_BOX',
  //        ' INNER JOIN AGENDA ON AGENDA.COD_AGENDA = AGENDA_ITENS.COD_AGENDA AND AGENDA.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA' +
  //        ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = AGENDA_ITENS.COD_VENDEDOR AND COLABORADOR.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA ' +
  //        ' LEFT JOIN BOX ON BOX.COD_BOX = AGENDA_ITENS.COD_BOX AND BOX.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA', sqladcional
  //        + ServicosMecanicos.rBOL.vSqlAdicional + ' AND AGENDA_ITENS.COD_VENDEDOR IS NOT NULL') then
  //          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
  //        		combobox1.setfocus
      end
      else
        if not ServicosMecanicos.ConsultaCampos('AGENDA_ITENS', ServicosMecanicos.rBOL.vValor, ComboBox1.Text,
          combobox3.Text, 'AGENDA.COD_AGENDA', true, vDadosIni.codEmpresa,
          ' AGENDA_ITENS.*, AGENDA.COD_CLIENTE, AGENDA.NOME_CLIENTE, AGENDA.DATA_AGENDA, AGENDA.HORA_AGENDA, AGENDA.MINUTO_AGENDA, ' +
          ' AGENDA.STATUS_AGENDA, AGENDA.COD_VEICULO, AGENDA.PLACA, AGENDA.CHASSI, AGENDA.COD_EQUIP, COLABORADOR.NOME_VENDEDOR, BOX.DESCR_BOX',
          ' INNER JOIN AGENDA ON AGENDA.COD_AGENDA = AGENDA_ITENS.COD_AGENDA AND AGENDA.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA' +
          ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = AGENDA_ITENS.COD_VENDEDOR AND COLABORADOR.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA' +
          ' LEFT JOIN BOX ON BOX.COD_BOX = AGENDA_ITENS.COD_BOX AND BOX.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA',
             sqladcional +  vDadosIni.IfThen(sqladcional = '', '', ' AND ') +
           ServicosMecanicos.rBOL.vSqlAdicional + vDadosIni.IfThen(ServicosMecanicos.rBOL.vSqlAdicional = '', '', ' AND ') +
          ' AGENDA_ITENS.COD_VENDEDOR IS NOT NULL') then
          	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          		ComboBox1.SetFocus;
    end;
  finally
    _GravaConfiguracoesBoolean('ckTodos', ckTodos.Checked);
  end;
end;

procedure TfrmAgendaMecanico.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('AGO024', 'IMPRIMIR', '', 'AGENDA_ITENS',
    ServicosMecanicos.dataSet.FieldByName('COD_AGENDA').AsString, ServicosMecanicos.buscas, true) then
    exit;

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    QRLabel10.Caption := 'Cod Equipamento'
  else
    QRLabel10.Caption := 'Chassi/Placa';
  qrpAgenda.Preview;
end;

procedure TfrmAgendaMecanico.ckTodosClick(Sender: TObject);
begin
  inherited;
 MarcarDesmarcaMecanico;
end;

procedure TfrmAgendaMecanico.DesabilitarCampos;
begin
  BitBtn1.Enabled := false;
  BitBtn7.Enabled := false;
  ckTodos.Enabled := false;
  MaskEdit1.Enabled := false;
  MaskEdit2.Enabled := false;
  MaskEdit3.Enabled := false;
  ComboBox1.Enabled := false;
  ComboBox2.Enabled := false;
  ComboBox3.Enabled := false;
  pnMecanico.Visible := false;
end;

procedure TfrmAgendaMecanico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (ServicosMecanicos <> nil) then
    ServicosMecanicos.Cancel;

  ServicosMecanicos.free;
  ServicosMecanicos := nil;

  Action := caFree;
  if (frmAgendaMecanico <> nil) then
    frmAgendaMecanico := nil;
end;

procedure TfrmAgendaMecanico.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  ServicosMecanicos := TServicosMecanicos.create;

  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmAgendaMecanico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f10 then
  begin
    if (ckTodos.visible) and (PageControl1.ActivePage = TabSheet2) then
    begin
      ckTodos.Checked := not ckTodos.Checked;
      MarcarDesmarcaMecanico;
    end;
  end
end;

procedure TfrmAgendaMecanico.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmAgenda.dsAgendaMecanico;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    ServicosMecanicos._abrirMecanicos;
    ServicosMecanicos._abreAgendaMecanico;
  end;

  DBLookupComboBox1.KeyValue := ServicosMecanicos.fMecanicos.FieldByName('COD_VENDEDOR').AsInteger;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "AGO025" HABILITAR TODOS OS MECÂNICOS';

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
    frmAgendaMecanico.Caption := 'Consultar Serviços Técnico';
    pnMecanico.Caption := 'Técnico';
    QRLabel8.Caption := 'Técnico';
  end
  else
  begin
    frmAgendaMecanico.Caption := 'Consultar Serviços Mecânico';
    pnMecanico.Caption := 'Mecânico';
    QRLabel8.Caption := 'Mecânico';
  end;

  ckTodos.Checked := _LerConfiguracoesRegistroBoolean('ckTodos');

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmAgendaMecanico.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmAgendaMecanico.MarcarDesmarcaMecanico;
begin
  if not ckTodos.Checked then
    pnMecanico.Visible := true
  else
    pnMecanico.Visible := false;
end;

procedure TfrmAgendaMecanico.QRExpr29Print(sender: TObject; var Value: string);
begin
  inherited;
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    Value := ServicosMecanicos.dataSet.FieldByName('COD_EQUIP').AsString
  else
    Value := vDadosIni.IfThen(trim(ServicosMecanicos.dataSet.FieldByName('CHASSI').AsString) <> '',
    trim(ServicosMecanicos.dataSet.FieldByName('CHASSI').AsString) + '/' +
      trim(ServicosMecanicos.dataSet.FieldByName('PLACA').AsString), '');
end;

procedure TfrmAgendaMecanico.qrpAgendaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Serviços Mecânicos');
end;

end.

