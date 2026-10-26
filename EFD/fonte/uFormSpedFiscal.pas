unit uFormSpedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, Menus, ExtCtrls, Mask, XPMan, uClassesSpedFiscal;

type
  TfrmSpedFiscal = class(TForm)
    PopupMenu1: TPopupMenu;
    SalvarLogSpedFiscal1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    pg_principal: TPageControl;
    ts_arquivo: TTabSheet;
    ts_final: TTabSheet;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    bt_conf_k: TSpeedButton;
    dtIni: TMaskEdit;
    dtFim: TMaskEdit;
    GroupBox4: TGroupBox;
    ckBloco0: TCheckBox;
    ckBlocoC: TCheckBox;
    ckBlocoD: TCheckBox;
    ckBlocoH: TCheckBox;
    ckBlocoE: TCheckBox;
    ckBloco1: TCheckBox;
    ckBlocoG: TCheckBox;
    ckBloco9: TCheckBox;
    ckBlocoK: TCheckBox;
    edDestino: TEdit;
    ComboBox1: TComboBox;
    dtInventario: TMaskEdit;
    GroupBox2: TGroupBox;
    lbBloco: TLabel;
    lbTempo: TLabel;
    lbCupons: TLabel;
    lbStatus: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Panel1: TPanel;
    SpeedButton59: TSpeedButton;
    btIniciar: TBitBtn;
    btSair: TBitBtn;
    GroupBox1: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    edCreditoPeriodoAnteriorICMS: TPanel;
    edCreditoPeriodoAnteriorIPI: TPanel;
    GroupBox5: TGroupBox;
    lb_rest_compl_st_info: TLabel;
    SpeedButton4: TSpeedButton;
    ck_rest_compl_st: TCheckBox;
    pn_final: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pn_mensagem_final: TPanel;
    lb_mensagem_final: TLabel;
    lb_mensagem_final_time: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    lb_mensagem_final_file: TPanel;
    group_final_restcompSt: TGroupBox;
    Label8: TLabel;
    SpeedButton7: TSpeedButton;
    bt_88_advertencias: TBitBtn;
    bt_88_erros: TBitBtn;
    pn_final_bottom: TPanel;
    BitBtn4: TBitBtn;
    lbx_arquivos_st: TListBox;
    ck_rest_compl_st_jagravado: TCheckBox;
    Label9: TLabel;
    procedure SpeedButton59Click(Sender: TObject);
    procedure edDestinoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dtFimExit(Sender: TObject);
    procedure ckBlocoHClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btIniciarClick(Sender: TObject);
    procedure dtIniExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ckBlocoKClick(Sender: TObject);
    procedure bt_conf_kClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ck_rest_compl_stClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure lb_mensagem_final_fileClick(Sender: TObject);
  private
    { Private declarations }
    Fefd_icms_k: RConf_Bloco_K;
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    function _LerConfiguracoesRegistroString(NomeVariavel : string; pDefault: string = '') : string;
  public
    { Public declarations }
    vCodEmpresa, vEndBanco:string;
    vTempoGasto: TTime;
  end;

var
  frmSpedFiscal: TfrmSpedFiscal;

implementation

uses DateUtils, Registry, uSpedHw, uFormSpedFiscal_bloco_K, hw_win_utils,
  Winapi.ShellAPI, ClipBrd;

function verificarCampoOutrasNotaFiscal(pDataIni, pDataFim, pCodEmpresa, pEnderecoBanco:
      WideString): LongBool; stdcall; external 'CompativelHW.dll';

function hw_config_sistema_dx( pChaveIdent, pUsuario: WideString; pCodEmpresa, pNivel: Integer): Integer; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TfrmSpedFiscal.btIniciarClick(Sender: TObject);
var
  vSped:TSpedFiscal;
  vrTemp: string;
begin
  vSped := TSpedFiscal.create;
  vTempoGasto := Now;
  Timer1.Enabled := True;
  try
    GroupBox3.Enabled := False;
    Panel1.Enabled := False;
    vSped.CodEmpresa:= vCodEmpresa;
    vSped.EnderecoBanco := vEndBanco;

    if not vSped.conectarBanco then
      Exit;
    if not vDadosIniSPED.PesqPros('EFD001', 'GERAR', 'DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' DEST:' + edDestino.Text, 'SPED_FISCAL', '', vSped.qrAux, True) then
      Exit;

    vSped.DataIni := dtIni.Text;
    vSped.DataFim := dtFim.Text;
    vSped.DataInv := dtInventario.Text;
    vSped.Finalidade :=ComboBox1.Text;
    vSped.FLabelStatus := TLabel(lbStatus);
    vSped.FLabelBloco := TLabel(lbBloco);
    vSped.FLabelCupons := TLabel(lbCupons);
    vSped.FProgressBar := TProgressBar(ProgressBar1);
    vSped.FProgressBar2 := TProgressBar(ProgressBar2);
    vSped.Destino := edDestino.Text ;
    vSped.RestComplST.Gerar := ck_rest_compl_st.Checked;
    vSped.RestComplST.UsarJaGravado := ck_rest_compl_st_jagravado.Checked;

    vrTemp := StringReplace(edCreditoPeriodoAnteriorICMS.Caption, '.', '', [rfReplaceAll]);
    vSped.vValorCredPerAnt_ICMS := StrToFloatDef(vrTemp, 0);

    vrTemp := StringReplace(edCreditoPeriodoAnteriorIPI.Caption, '.', '', [rfReplaceAll]);
    vSped.vValorCredPerAnt_IPI := StrToFloatDef(vrTemp, 0);

    vSped.vBloco0 := ckBloco0.Checked;
    vSped.vBlocoC := ckBlocoC.Checked;
    vSped.vBlocoD := ckBlocoD.Checked;
    vSped.vBlocoE := ckBlocoE.Checked;
    vSped.vBlocoG := ckBlocoG.Checked;
    vSped.vBlocoH := ckBlocoH.Checked;
    vSped.vBlocoK := ckBlocoK.Checked;
    vSped.vBloco1 := ckBloco1.Checked;
    vSped.vBloco9 := ckBloco9.Checked;

    vSped.efd_icms_k := Fefd_icms_k;

//    verificarCampoOutrasNotaFiscal((vSped.DataIni), (vSped.DataFim), (vSped.CodEmpresa), (vSped.EnderecoBanco));

    if vSped.iniciaSpedFiscal then
    begin
      lb_mensagem_final.Caption      := 'Arquivo criado';
      lb_mensagem_final_time.Caption := Format('Tempo de execução: %s', [TimeToStr(Now - vTempoGasto)]);
      lb_mensagem_final_file.Caption := Format('Salvo em "%s"', [edDestino.Text]);
      group_final_restcompSt.Visible := vSped.RestComplST.Gerar;
      lbx_arquivos_st.Items.Text     := vSped.RestComplST.CriarArquivosCSV.Text;
      lbx_arquivos_st.Hint           := 'Arquivos contábeis e de conferencia' + sLineBreak + sLineBreak +
                                        'EFD...._CONT.txt -> Arquivo de importação da restitu~ição/complemento' + sLineBreak +
                                        'EFD...._ENT.txt -> Arquivo com as entradas do período' + sLineBreak +
                                        'EFD...._SAI.txt -> Arquivo com as saídas do período' + sLineBreak +
                                        'EFD...._EST.txt -> Arquivo com o estoque mes anterior e do período';
      pg_principal.ActivePage        := ts_final;
    end;

  finally
    GroupBox3.Enabled := True;
    Panel1.Enabled := True;
    vSped.Free;
    vSped := nil;
    Timer1.Enabled := False;
    lbTempo.Caption := 'Tempo Gasto: '+TimeToStr(Now - vTempoGasto);
//    Application.MessageBox(PWideChar('Arquivo gerado com sucesso: '+#13+
//      edDestino.Text),'Atenção',0+64);
    ProgressBar1.Position := 0;
    ProgressBar2.Position := 0;
    //Close;
  end;           
end;

procedure TfrmSpedFiscal.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSpedFiscal.bt_conf_kClick(Sender: TObject);
begin
  Application.CreateForm(TformSpedFiscal_bloco_K, formSpedFiscal_bloco_K);
  try
    with formSpedFiscal_bloco_K do
    begin
      dataIniApuracao := StrToDate(Self.dtIni.Text);
      dataEstoque     := Fefd_icms_k.dataEstoque;
      dataAjusteIni   := Fefd_icms_k.dataAjusteIni;
      dataAjusteFim   := Fefd_icms_k.dataAjusteFim;

      if ShowModal = IDOK then
      begin
        Fefd_icms_k.dataEstoque   := StrToDate(formSpedFiscal_bloco_K.ed_dataestoque_k.Text);
        Fefd_icms_k.dataAjusteIni := StrToDate(formSpedFiscal_bloco_K.dtIni.Text);
        Fefd_icms_k.dataAjusteFim := StrToDate(formSpedFiscal_bloco_K.dtFim.Text);
      end;
    end;

  finally
    FreeAndNil(formSpedFiscal_bloco_K);
  end;
end;

procedure TfrmSpedFiscal.ckBlocoHClick(Sender: TObject);
var
  Data: TDate;
begin
  dtInventario.Enabled := ckBlocoH.Checked ;
  if dtInventario.Text = '  /  /    ' then
    if dtFim.Text <> '  /  /    ' then
    begin
      Data := StrToDate(dtFim.Text);
      Data := IncMonth(Data, - 2);
      dtInventario.Text := DateToStr(EndOfTheMonth(Data));
    end;
end;

procedure TfrmSpedFiscal.ckBlocoKClick(Sender: TObject);
begin
  if ckBlocoK.Checked then
  begin
    if not (Fefd_icms_k.Ativo and ((Fefd_icms_k.Producao) or (Fefd_icms_k.Estoque))) then
    begin
      ckBlocoK.Checked := False;
      Application.MessageBox('Bloco K não configurado. Configure o bloco K para gerar a Produção ou o Estoque',
                             'Atenção', 64);
    end;
  end;
end;

procedure TfrmSpedFiscal.ck_rest_compl_stClick(Sender: TObject);
begin
  RegistroWin.Write(Self.Name, ck_rest_compl_st.Name, ck_rest_compl_st.Checked);
end;

procedure TfrmSpedFiscal.dtFimExit(Sender: TObject);
begin
  edDestino.Text := ExtractFilePath(_LerConfiguracoesRegistroString(edDestino.Name, Application.ExeName))+'S'+
    copy(StringReplace(dtIni.Text,'/','',[rfReplaceAll]),3,6)+'.txt';
end;

procedure TfrmSpedFiscal.dtIniExit(Sender: TObject);
var
  vSped:TSpedFiscal;
  Alist: TStrings;
begin
  try
    StrToDate(dtIni.Text);

    Fefd_icms_k.dataEstoque   := DateOf(EndOfTheMonth(StrToDate(dtIni.Text)));
    Fefd_icms_k.dataAjusteIni := DateOf(StartOfTheMonth(IncMonth(StrToDate(dtIni.Text), -1)));
    Fefd_icms_k.dataAjusteFim := DateOf(EndOfTheMonth(Fefd_icms_k.dataAjusteIni));

    dtFim.Text := DateToStr(EndOfTheMonth(StrToDate(dtIni.Text)));
    edDestino.Text := ExtractFilePath(_LerConfiguracoesRegistroString(edDestino.Name, Application.ExeName))+'S'+
      copy(StringReplace(dtIni.Text,'/','',[rfReplaceAll]),3,6)+'.txt';
    vSped := TSpedFiscal.create;
    try
      vSped.CodEmpresa:= vCodEmpresa;
      vSped.EnderecoBanco := vEndBanco;
      vSped.getCreditoPeriodoAnterior(dtIni.Text);
      edCreditoPeriodoAnteriorICMS.Caption := Format('%0.2n', [vSped.vValorCredPerAnt_ICMS]);
      edCreditoPeriodoAnteriorIPI.Caption  := Format('%0.2n', [vSped.vValorCredPerAnt_IPI]);

      Alist                := TStringList.Create;
      try
        Alist                := vSped.getConfSisBlob('efd_icms_k', vsped.qrAux);
        Fefd_icms_k.Ativo    := vSped.GetIni('Conf', 'Ativo'   , 'N', Alist) = 'S';
        Fefd_icms_k.Producao := vSped.GetIni('Conf', 'Producao', 'N', Alist) = 'S';
        Fefd_icms_k.Estoque  := vSped.GetIni('Conf', 'Estoque' , 'N', Alist) = 'S';
      finally
        FreeAndNil(Alist);
      end;
      ckBlocoK.Checked := Fefd_icms_k.Ativo and ((Fefd_icms_k.Producao) or (Fefd_icms_k.Estoque));

    finally
      vSped.Free;
      vSped := nil;
    end;
  except
  end;
end;

procedure TfrmSpedFiscal.edDestinoExit(Sender: TObject);
begin
  _GravaConfiguracoesString(edDestino.Name, edDestino.Text);
end;

procedure TfrmSpedFiscal.FormShow(Sender: TObject);
begin
  lbTempo.Caption := '';
  lbCupons.Caption := '';
  pg_principal.ActivePage := ts_arquivo;
  ts_arquivo.TabVisible := False;
  ts_final.TabVisible := False;
  pg_principal.ActivePage := ts_arquivo;
  dtIni.Text := DateToStr(StartOfTheMonth(IncMonth(Date, -1)));
  dtFim.Text := DateToStr(endOfTheMonth(IncMonth(Date, -1)));
  ck_rest_compl_st.Checked := RegistroWin.Read(Self.Name, ck_rest_compl_st.Name, 'N') = 'S';
  if dtIni.CanFocus then
    dtIni.SetFocus;
end;

procedure TfrmSpedFiscal.lb_mensagem_final_fileClick(Sender: TObject);
begin
  if Copy(lb_mensagem_final_file.Caption, 1, 1) <> '*' then
    lb_mensagem_final_file.Caption := '*' + lb_mensagem_final_file.Caption;
  Clipboard.AsText := edDestino.Text;
end;

procedure TfrmSpedFiscal.SpeedButton1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    edDestino.Text := SaveDialog1.FileName;
    _GravaConfiguracoesString(edDestino.Name, edDestino.Text);
  end;
end;

procedure TfrmSpedFiscal.SpeedButton2Click(Sender: TObject);
var
  vrTemp: string;
  vSped: TSpedFiscal;
begin
  vSped := TSpedFiscal.create;
  try
    vSped.CodEmpresa:= vCodEmpresa;
    vSped.EnderecoBanco := vEndBanco;

    if not vSped.conectarBanco then
      Exit;
    if not vDadosIniSPED.PesqPros('EFD002', 'ALTERAR', 'ICMS DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' VLANT:' + edCreditoPeriodoAnteriorICMS.Caption, 'SPED_FISCAL', '', vSped.qrAux, True) then
      Exit;

    if not InputQuery('Valor do Crédito', 'Informe o novo valor', vrTemp) then
      Exit;
    if StrToFloatDef(vrTemp, -1) >= 0 then
    begin
      edCreditoPeriodoAnteriorICMS.Caption := Format('%0.2n', [StrToFloatDef(vrTemp, 0)]);
      vDadosIniSPED.GravaAuditoria('EFD002', 'ALTERAR', 'ICMS DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' VLNOVO:' + edCreditoPeriodoAnteriorICMS.Caption, 'SPED_FISCAL', '', vSped.qrAux);
    end;
  finally
    vSped.Free;
    vSped := nil;
  end;
end;

procedure TfrmSpedFiscal.SpeedButton3Click(Sender: TObject);

var
  vrTemp: string;
  vSped: TSpedFiscal;
begin
  vSped := TSpedFiscal.create;
  try
    vSped.CodEmpresa:= vCodEmpresa;
    vSped.EnderecoBanco := vEndBanco;

    if not vSped.conectarBanco then
      Exit;
    if not vDadosIniSPED.PesqPros('EFD002', 'ALTERAR', 'IPI DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' VLANT:' + edCreditoPeriodoAnteriorIPI.Caption, 'SPED_FISCAL', '', vSped.qrAux, True) then
      Exit;

    if not InputQuery('Valor do Crédito', 'Informe o novo valor', vrTemp) then
      Exit;
    if StrToFloatDef(vrTemp, -1) >= 0 then
    begin
      edCreditoPeriodoAnteriorIPI.Caption := Format('%0.2n', [StrToFloatDef(vrTemp, 0)]);
      vDadosIniSPED.GravaAuditoria('EFD002', 'ALTERAR', 'IPI DTINI:' + dtIni.Text + ' DTFIM:' + dtFim.Text + ' VLNOVO:' + edCreditoPeriodoAnteriorIPI.Caption, 'SPED_FISCAL', '', vSped.qrAux);
    end;
  finally
    vSped.Free;
    vSped := nil;
  end;
end;

procedure TfrmSpedFiscal.SpeedButton4Click(Sender: TObject);
var
  vSped:TSpedFiscal;
begin
  try
    vSped := TSpedFiscal.create;
    try
      vSped.CodEmpresa:= vDadosIniSPED.vCodEmpresa;
      vSped.EnderecoBanco := vEndBanco;
      vSped.verificarConfiguracoes;
    finally
      vSped.Free;
      vSped := nil;
    end;
  except
  end;
  hw_config_sistema_dx(WideString('icms_st_rest_comp'), WideString(vDadosIniSPED.vNomeUsuario), StrToInt(vDadosIniSPED.vCodEmpresa), vDadosIniSPED.vNivel);
end;

procedure TfrmSpedFiscal.SpeedButton59Click(Sender: TObject);
var
  vSped:TSpedFiscal;
begin
  try
    vSped := TSpedFiscal.create;
    try
      vSped.CodEmpresa:= vDadosIniSPED.vCodEmpresa;
      vSped.EnderecoBanco := vEndBanco;
      vSped.verificarConfiguracoes;
    finally
      vSped.Free;
      vSped := nil;
    end;
  except
  end;
  hw_config_sistema_dx(WideString('efd_icms_%'), WideString(vDadosIniSPED.vNomeUsuario), StrToInt(vDadosIniSPED.vCodEmpresa), vDadosIniSPED.vNivel);
end;

procedure TfrmSpedFiscal.SpeedButton5Click(Sender: TObject);
begin
  ShellExecute(Application.HANDLE, 'open', PWideChar(edDestino.Text), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSpedFiscal.SpeedButton6Click(Sender: TObject);
begin
  ShellExecute(Application.HANDLE, 'open', PWideChar(ExtractFilePath(edDestino.Text)),
    PWideChar('/n, /select,' + edDestino.Text), PWideChar('C:\WINDOWS\'), SW_SHOWNORMAL);
end;

procedure TfrmSpedFiscal.SpeedButton7Click(Sender: TObject);
begin
  if lbx_arquivos_st.ItemIndex > -1 then
    ShellExecute(Application.HANDLE, 'open', PChar(lbx_arquivos_st.Items[lbx_arquivos_st.ItemIndex]), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSpedFiscal.Timer1Timer(Sender: TObject);
var
  vrTemp: string;
begin
  lbTempo.Caption := TimeToStr(Now - vTempoGasto);
  Application.ProcessMessages;
end;

procedure TfrmSpedFiscal._GravaConfiguracoesString(NomeVariavel, Valor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TfrmSpedFiscal._LerConfiguracoesRegistroString(NomeVariavel, pDefault: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Classes\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  Result := pDefault;
  try
    vTemp := pDefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadString(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

end.
