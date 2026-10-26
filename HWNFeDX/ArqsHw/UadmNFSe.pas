unit UadmNFSe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, UClasseNFe, UClasseNFSe, ComObj, Data.DB;

type
  TFrmAdmNFSe = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    LbNomeEmpresa: TLabel;
    LbCNPJ_CPF: TLabel;
    Label4: TLabel;
    lbforma: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    MaskEdit3: TMaskEdit;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    ComboBox4: TComboBox;
    MaskEdit2: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label10: TLabel;
    DBText1: TDBText;
    Label11: TLabel;
    DBText2: TDBText;
    Panel2: TPanel;
    cmd_EnviarLoteRPS: TButton;
    cmd_ConsultarSituacaoRPS: TButton;
    cmd_ConsultarLoteRPS: TButton;
    BitBtn2: TBitBtn;
    cmd_PegaVersaoDLL: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnLimparRps: TSpeedButton;
    Label3: TLabel;
    lbTransicao: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cmd_ConsultarSituacaoRPSClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cmd_ConsultarLoteRPSClick(Sender: TObject);
    procedure cmd_PegaVersaoDLLClick(Sender: TObject);
    procedure cmd_EnviarLoteRPSClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure configuraVisual(nomeCampo: string);
    function EnviarNFSe(vnos: integer): boolean;
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure btnLimparRpsClick(Sender: TObject);
  private
    { Private declarations }
    naoOrdenar: boolean; // Variavel auxiliar de ordenacao das colunas
    vrelos: string;
  public
    { Public declarations }
    cadnfgeralconf: TClassnfe;
    CadNFSe: TClassNfSe;
  end;

var
  FrmAdmNFSe: TFrmAdmNFSe;

implementation

uses
  UDtmHwNFE, ShellAPI, DBClient, UdetalhesRPS, uDataSet_OOP_DX, UMotivoCancNFSe, hw_win_utils, math, hw_utils;

{$R *.dfm}

procedure TFrmAdmNFSe.BitBtn1Click(Sender: TObject);
//var
//  vtp: string;
begin
//  if RadioButton1.Checked then
//    vtp := 'S';
//  if RadioButton2.Checked then
//    vtp := 'N';
//  if RadioButton3.Checked then
//    vtp := '';
//  if MaskEdit2.Visible then
//  begin
//
//    if not CadNFSe.ConsultaCampos('', ComboBox1.Text, ComboBox4.text, maskedit1.text, maskedit2.text, inttostr(CadNFSe.cadempresa.codempresa), vtp, 'SS') then
//      combobox1.setfocus;
//  end
//  else if CadNFSe.ConsultaCampos('', MaskEdit3.text, ComboBox1.Text, combobox2.Text, ComboBox4.text, true, inttostr(CadNFSe.cadempresa.codempresa), vtp, 'SS') then
//    ComboBox1.SetFocus;

  if CadNFSe.ConsultaGrid(
    TNFSeConsulta.Create(
      TNFSeConsultaStatus( IfThen(RadioButton1.Checked, 1) + IfThen(RadioButton2.Checked, 2) ),
      TNFSeConsultaCondicao(ComboBox2.ItemIndex),
      ComboBox1.Text,
      ComboBox4.Text,
      MaskEdit3.Text,
      MaskEdit1.Text,
      MaskEdit2.Text
    )
  ) and DBGrid1.CanFocus then
    DBGrid1.SetFocus;
end;

procedure TFrmAdmNFSe.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmAdmNFSe.btSelectAllClick(Sender: TObject);
begin
  CadNFSe.dataSet.first;
  while not CadNFSe.dataSet.eof do
  begin
    if CadNFSe.dataSet.FieldByName('n_nf').AsInteger = 0 then
    begin
      DBGrid1.SelectedRows.CurrentRowSelected := true;
    end
    else
      DBGrid1.SelectedRows.CurrentRowSelected := false;
    CadNFSe.dataSet.next;
  end;
end;

procedure TFrmAdmNFSe.btUnSelectAllClick(Sender: TObject);
begin
  CadNFSe.dataSet.first;
  while not CadNFSe.dataSet.eof do
  begin
    DBGrid1.SelectedRows.CurrentRowSelected := false;
    CadNFSe.dataSet.next;
  end;
end;

procedure TFrmAdmNFSe.Button1Click(Sender: TObject);
begin
  if CadNFSe.PesqPros(true, 'NFS004', 'O.S.: ' + CadNFSe.dataSet.FieldByName('NPED').AsString) then
  begin
    if application.messagebox('Tem certeza que deseja cancelar esta NFSe para este RPS?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    begin
      if CadNFSe.dataSet.FieldByName('COD_RPS').AsInteger <> 0 then
      begin
        Application.CreateForm(TFrmMotivoCancNFSe, FrmMotivoCancNFSe);
        FrmMotivoCancNFSe.ShowModal;
        CadNFSe.vcodigocancnfse := copy(FrmMotivoCancNFSe.ComboBox1.text, 1, 1);
        CadNFSe.vdesccancnfse := FrmMotivoCancNFSe.ComboBox1.text;
//   CadNFSe.vcodverificador:=
        FrmMotivoCancNFSe.free;
        CadNFSe.iniciaNFSE;
        CadNFSe.cancelaNFSe();
        CadNFSe.Close;
        CadNFSe.open;
      end
      else
        Application.MessageBox(pchar('Serviço sem RPS. Favor enviar o serviço para gerar um RPS!'), Pchar('Aviso'), MB_OK);
    end;
  end;
end;

procedure TFrmAdmNFSe.Button2Click(Sender: TObject);
begin
  if CadNFSe.PesqPros(true, 'NFS005', 'O.S.: ' + CadNFSe.dataSet.FieldByName('NPED').AsString + ' RPS: ' + CadNFSe.dataSet.FieldByName('COD_RPS').AsString) then
  begin
    CadNFSe.iniciaNFSE(True);
    CadNFSe.imprimedireto(2);
  end;
end;

procedure TFrmAdmNFSe.Button3Click(Sender: TObject);
begin
  if CadNFSe.DetalhesRPS(1) then
  begin
    Application.CreateForm(TFrmDetalhesRPS, FrmDetalhesRPS);
  //FrmDetalhesRPS:=TFrmDetalhesRPS.Create(Application);
    FrmDetalhesRPS.Label1.Caption := 'RPS N.: ' + CadNFSe.StrZero(CadNFSe.dataSet.FieldByName('COD_RPS').AsInteger, 6);
    FrmDetalhesRPS.ShowModal;
    CadNFSe.DetalhesRPS(2);
    FrmDetalhesRPS.Free;
  end;
end;

procedure TFrmAdmNFSe.Button4Click(Sender: TObject);
begin
  if CadNFSe.dataSet.FieldByName('COD_RPS').AsString <> '' then
  begin
    CadNFSe.iniciaNFSE;
    CadNFSe.abrirRPSDireto;
    CadNFSe.nomecliente := CadNFSe.dataSet.FieldByName('NOME_CLIENTE').AsString;
    CadNFSe.enviaemailNFSe(3);
  end
  else
    Application.MessageBox(pchar('O.S. sem RPS. Favor Enviar a O.S. para o WS!'), Pchar('Aviso'), MB_OK);
end;

procedure TFrmAdmNFSe.cmd_ConsultarLoteRPSClick(Sender: TObject);
begin
  if CadNFSe.fequals('nfse_nacional', '1') then
  begin
    cmd_ConsultarSituacaoRPS.Click;
    Exit;
  end;

  if CadNFSe.PesqPros(true, 'NFS003', 'O.S.: ' + CadNFSe.dataSet.FieldByName('NPED').AsString) then
  begin
    CadNFSe.iniciaNFSE;
    CadNFSe.ConsultaDireta(2);
    CadNFSe.Close;
    CadNFSe.open;
  end;
end;

procedure TFrmAdmNFSe.cmd_ConsultarSituacaoRPSClick(Sender: TObject);
begin
  if CadNFSe.PesqPros(true, 'NFS002', 'OS: ' + CadNFSe.dataSet.FieldByName('NPED').AsString) then
  begin
    CadNFSe.iniciaNFSE;
    CadNFSe.ConsultadiretaporRPS();
    CadNFSe.Close;
    CadNFSe.open;
  end;
end;

procedure TFrmAdmNFSe.cmd_EnviarLoteRPSClick(Sender: TObject);
var
  vflag: integer;
  vcliente: string;
begin
  if CadNFSe.PesqPros(true, 'NFS001', 'OS.: ' + CadNFSe.dataSet.FieldByName('NPED').AsString) then
  begin
//   CadNFSe.montarRPSEnv(CadNFSe.dataSet.FieldByName('NPED').AsInteger,
//   CadNFSe.dataSet.FieldByName('ALIQ_ISS').AsInteger,'',0);
    if CadNFSe.osselec.Tag <> 1 then
    begin
      CadNFSe.osselec.CreateDataSet;
      CadNFSe.osselec.Tag := 1;
    end;
    CadNFSe.osselec.EmptyDataSet;
    vrelos := '';
    CadNFSe.First;
    vflag := 0;
    vcliente := '';
    while not CadNFSe.eof do
    begin
      if DBGrid1.SelectedRows.CurrentRowSelected then
      begin
        if CadNFSe.dataSet.FieldByName('n_nf').AsInteger <> 0 then
        begin
//       Application.MessageBox(pchar('Nos documentos selecionados existe(m) serviços já com nf. Selecione apenas os serviços em NF'),Pchar('Aviso'), MB_OK);
//       vflag:=1;
//       break;
        end
        else
        begin
          if not CadNFSe.pesqprot(CadNFSe.dataSet.FieldByName('NPED').AsInteger) then
            Application.MessageBox(pchar('Ordem de Serviço ' + CadNFSe.dataSet.FieldByName('NPED').AsString + ' já com protocolo de envio necessário consultar'), Pchar('Aviso'), MB_OK)
          else
          begin
            CadNFSe.osselec.Append;
            CadNFSe.osselec.FieldByName('NPED').AsString := CadNFSe.dataSet.FieldByName('NPED').AsString;
            CadNFSe.osselec.FieldByName('NOMECLIENTE').AsString := CadNFSe.dataSet.FieldByName('NOME_CLIENTE').AsString;
            CadNFSe.osselec.post;
          end;
        end;
      end;
      CadNFSe.next;
    end;
//     if vcliente = '' then
//      vcliente:=CadNFSe.dataSet.FieldByName('NOME_CLIENTE').AsString
//     else
//     begin
//       if vcliente <> CadNFSe.dataSet.FieldByName('NOME_CLIENTE').AsString then
//       begin
//        Application.MessageBox(pchar('Clientes diferentes na seleção. Favor selecionar por cliente'),Pchar('Aviso'), MB_OK);
//        vflag:=1;
//        break;
//       end;
//     end;
    CadNFSe.osselec.IndexFieldNames := '';
    CadNFSe.osselec.IndexFieldNames := 'NOMECLIENTE';
    if vflag = 0 then
    begin
      CadNFSe.iniciaNFSE;
      CadNFSe.osselec.first;
      vcliente := CadNFSe.osselec.FieldByName('NOMECLIENTE').AsString;
      vrelos := '';
      while not CadNFSe.osselec.eof do
      begin
        if (vcliente <> CadNFSe.osselec.FieldByName('NOMECLIENTE').AsString) then
        begin
          vrelos := Copy(vrelos, 1, Length(vrelos) - 1);
          CadNFSe.nomecliente := vcliente;
          CadNFSe.montarRPSEnv(vrelos);
          CadNFSe.Close;
          CadNFSe.open;
          vcliente := CadNFSe.osselec.FieldByName('NOMECLIENTE').AsString;
          vrelos := '';
          if Pos(CadNFSe.osselec.FieldByName('NPED').AsString, vrelos) <= 0 then
            vrelos := vrelos + CadNFSe.osselec.FieldByName('NPED').AsString + ',';
        end
        else
        begin
          if Pos(CadNFSe.osselec.FieldByName('NPED').AsString, vrelos) <= 0 then
            vrelos := vrelos + CadNFSe.osselec.FieldByName('NPED').AsString + ',';
        end;
        CadNFSe.osselec.next;
        if CadNFSe.osselec.Eof then
        begin
          if vrelos <> '' then
          begin
            vrelos := Copy(vrelos, 1, Length(vrelos) - 1);
            CadNFSe.nomecliente := vcliente;
            CadNFSe.montarRPSEnv(vrelos);
            CadNFSe.Close;
            CadNFSe.open;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmAdmNFSe.cmd_PegaVersaoDLLClick(Sender: TObject);
var
  msg: string;
  Util: OleVariant;
begin

  Util := CreateOleObject('NFSe_Util.util');
  msg := Util.Versao;
  Messagebox(0, pchar(msg), 'Sobre a versão da DLL em uso:', MB_OK or MB_ICONINFORMATION);
end;

procedure TFrmAdmNFSe.ComboBox1Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TFrmAdmNFSe.ComboBox1Exit(Sender: TObject);
var
  i: integer;
begin
//  if ActiveControl = BitBtn1 then
//    Exit;

  if ComboBox1.Text <> 'TODOS' then
    ComboBox1.Text := ComboBox1.Items[ComboBox1.ItemIndex];
  if ComboBox1.Text <> 'TODOS' then
    ComboBox4.Text := ComboBox1.Text
  else
    ComboBox4.Text := ComboBox1.Items[0];
  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.Columns.Count - 1 do
    begin
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
      begin
        naoOrdenar := true;
        configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName);
      //        DBGrid1TitleClick(DBGrid1.Columns[i]);
        naoOrdenar := false;
        Exit;
      end;
    end;


end;

procedure TFrmAdmNFSe.configuraVisual(nomeCampo: string);
var
  i: integer;
begin
  if DBGrid1.DataSource <> nil then
    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = nomeCampo then
      begin
        if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i] is TDateTimeField then
        begin
          MaskEdit3.Visible := false;
          MaskEdit1.Visible := true;
          MaskEdit2.Visible := true;
//          Label4.Visible := true;
          if MaskEdit1.Text = '  /  /    ' then
            MaskEdit1.Text := RegistroWin.Read(Self.Name, MaskEdit1.Name, DateToStr(Date));
          if MaskEdit2.Text = '  /  /    ' then
            MaskEdit2.Text := RegistroWin.Read(Self.Name, MaskEdit2.Name, DateToStr(Date));
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox4.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          MaskEdit1.SetFocus;
          Break;
        end
        else
        begin
          MaskEdit3.Visible := true;
          MaskEdit1.Visible := false;
          MaskEdit2.Visible := false;
//          Label4.Visible := true;
          MaskEdit3.EditMask := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].EditMask;
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox4.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          MaskEdit3.SetFocus;
          Break;
        end;
      end;
    end;
end;

function TFrmAdmNFSe.EnviarNFSe(vnos: integer): boolean;
begin
  result := true;
  if CadNFSe.pesqOsNFSe(vnos) then
  begin
    CadNFSe.iniciaNFSE;
    CadNFSe.nomecliente := CadNFSe.dataSet.FieldByName('NOME_CLIENTE').AsString;
    CadNFSe.montarRPSEnv(CadNFSe.dataSet.FieldByName('NPED').AsInteger);
    result := false;
  end;
end;

procedure TFrmAdmNFSe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(CadNFSe) then
    FreeAndNil(CadNFSe);
end;

procedure TFrmAdmNFSe.FormCreate(Sender: TObject);
begin
  CadNFSe := TClassNfSe.create;
end;

procedure TFrmAdmNFSe.FormShow(Sender: TObject);
begin
  try
    Self.Icon.Handle := ExtractIcon(Handle, PChar(Application.ExeName), 0);
//Icon.LoadFromFile(ExtractFilePath(Application.Exename)+'icone.ico');
  except

  end;
  LbNomeEmpresa.Caption := CadNFSe.cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  LbCNPJ_CPF.Caption := CadNFSe.cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
  lbforma.Caption := CadNFSe.cadempresa.dataSet.FieldByName('IM_EMP').AsString;
//  CadNFSe := TClassNfSe.create;
//  CadNFSe.cadempresa := CadNFSe.cadempresa;
//  CadNFSe.vusuario := CadNFSe.vusuario;
  CadNFSe.vercidadeNFSe;
  CadNFSe.abrevazio;
  CadNFSe.RetornaAtributos(ComboBox1, ComboBox4);
  ComboBox1.Items.Delete(5);
  ComboBox4.Items.Delete(5);
  ComboBox1.ItemIndex := 0;
  ComboBox4.ItemIndex := 0;
  ComboBox2.Style := csDropDownList;
  ComboBox2.ItemIndex := 0;

  btnLimparRps.Visible := True;//IniConf.ReadStr('MD', 'LimparRpsNFSe') = 'S';

  if CadNFSe.DhDesativacaoModuloLegado = 0 then
    lbTransicao.Caption := 'Existe um novo módulo de emissão de notas disponível. Recomendamos a migração para o novo módulo para aproveitar os novos recursos'

  else if CadNFSe.DhDesativacaoModuloLegado < Date() then
  begin
    lbTransicao.Caption := 'A emissão de novas notas foi desativada nesse módulo';
    cmd_EnviarLoteRPS.Enabled := False;
    //Button2.Enabled := False;
  end
  else
    if CadNFSe.DhDesativacaoModuloLegado > Date() then
      lbTransicao.Caption := Format(
        'Novo módulo de emissão de notas está ativo. Falta %d dias para desativação de criação de notas nesse módulo',
        [Trunc( Max( 0, CadNFSe.DhDesativacaoModuloLegado - Date()))]
      )
    else
      lbTransicao.Caption := 'Data de desativação do módulo antigo: ' + DateToStr(CadNFSe.DhDesativacaoModuloLegado);
end;

procedure TFrmAdmNFSe.MaskEdit2Exit(Sender: TObject);
begin
  RegistroWin.Write(Self.Name, (Sender as TMaskEdit).Name, (Sender as TMaskEdit).Text);
end;

procedure TFrmAdmNFSe.SpeedButton1Click(Sender: TObject);
begin
  if not CadNFSe.pesqprot(CadNFSe.dataSet.FieldByName('NPED').AsInteger) then
  begin
    if CadNFSe.PesqPros(true, 'NFS007', ' OS: ' + CadNFSe.dataSet.FieldByName('NPED').AsString) then
    begin
      CadNFSe.retirarnprot;
    end;
  end;
end;

procedure TFrmAdmNFSe.btnLimparRpsClick(Sender: TObject);
begin
  CadNFSe.LimparRpsSelecionado();
end;

end.
