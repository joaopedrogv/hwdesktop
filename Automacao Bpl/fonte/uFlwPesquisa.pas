unit uFlwPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, Mask, ExtCtrls, DB, CheckLst,
  uPadrao;

type
  TfrmFlwPesquisa = class(TfrmPadrao)
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    tsPesquisa: TTabSheet;
    tsInfCliente: TTabSheet;
    Panel1: TPanel;
    grDadosPesquisa: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton5: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    grBotoes: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    grPerguntas: TGroupBox;
    DBText1: TDBText;
    rgResposta: TRadioGroup;
    grupoComplemento: TGroupBox;
    DBText2: TDBText;
    CheckListBox1: TCheckListBox;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    Panel2: TPanel;
    GroupBox5: TGroupBox;
    DBText3: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label11: TLabel;
    DBText8: TDBText;
    GroupBox6: TGroupBox;
    Memo2: TMemo;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBText9: TDBText;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton9: TSpeedButton;
    Panel5: TPanel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel6: TPanel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    Label1: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton6: TSpeedButton;
    DataSource2: TDataSource;
    Panel7: TPanel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn7: TBitBtn;
    DBEdit9: TDBEdit;
    SpeedButton7: TSpeedButton;
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure rgRespostaClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFlwPesquisa: TfrmFlwPesquisa;

implementation

uses uDtmFollowUpPosAtendimento, uClassesFollowUpPosAtendimento, DBClient;

{$R *.dfm}

procedure TfrmFlwPesquisa.BitBtn1Click(Sender: TObject);
begin

  if flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger = 0 then
    raise exception.create('Perfil ainda não foi selecionado');

  if not flwPesquisaE._iniciarPesquisa then
    Exit;

  if flwPesquisaE.vResposta._incluirResposta(flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger,
    flwPesquisaE.vPergunta.dataSet.FieldByName('codpergunta').AsInteger, rgResposta.ItemIndex, Memo1.Lines.Text) then
  begin
    if grupoComplemento.Visible then
    begin
      if flwPesquisaE.vResposta.vRespCompl._incluirRespCompl(flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger,
        flwPesquisaE.vPergunta.dataSet.FieldByName('codpergunta').AsInteger, CheckListBox1) then
      begin
        Memo1.Lines.Clear;
        if not flwPesquisaE.vPergunta.Eof then
          SpeedButton2Click(Sender);
      end;
    end
    else
    begin
      Memo1.Lines.Clear;
      if not flwPesquisaE.vPergunta.Eof then
        SpeedButton2Click(Sender);
    end;
  end;
end;

procedure TfrmFlwPesquisa.BitBtn2Click(Sender: TObject);
begin
  if flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger = 0 then
    raise exception.create('Perfil ainda não foi selecionado');
    
  if flwPesquisaE.Post then
    flwPesquisaE.Edit;
end;

procedure TfrmFlwPesquisa.BitBtn3Click(Sender: TObject);
begin
  if Application.MessageBox(pchar('Todas alterações feitas antes de salvar serão descartadas.' + #13 +
    'Deseja mesmo cancelar?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    flwPesquisaE.RollBackTransacao;
    Close;
  end;
end;

procedure TfrmFlwPesquisa.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFlwPesquisa.BitBtn5Click(Sender: TObject);
begin
  if flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger = 0 then
    raise exception.create('Perfil ainda não foi selecionado');
    
  if flwPesquisaE._concluirPesquisa then
  begin
    Application.MessageBox('Pesquisa realizada com sucesso!', 'Atenção', 0 + 64);
    close;
  end;
end;

procedure TfrmFlwPesquisa.BitBtn6Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsPesquisa;
end;

procedure TfrmFlwPesquisa.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger = 0 then
    raise exception.create('Perfil ainda não foi selecionado');
    
  if flwPesquisaE.vResposta._excluirResposta(flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger,
    flwPesquisaE.vPergunta.dataSet.FieldByName('codpergunta').AsInteger) then
  begin
    rgResposta.ItemIndex := -1;
    Memo1.Lines.Clear;
    CheckListBox1.Clear;
    rgRespostaClick(rgResposta);
  end;
end;

procedure TfrmFlwPesquisa.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  rgResposta.Items.Clear;
//  flwPesquisaE.vResposta.vRespCompl.Cancel;
  grupoComplemento.Visible := false;
  if flwPesquisaE.vPergunta.dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
  begin
    rgResposta.Items.Add('Não');
    rgResposta.Items.Add('Sim');  
    rgResposta.Hint := '';
    SpeedButton7.Hint := '';
    SpeedButton7.Visible := False;
    rgResposta.Width := 578;
  end
  else if flwPesquisaE.vPergunta.dataSet.FieldByName('simnaonivel').AsString = 'Nivel de 1 a 5' then
  begin
    rgResposta.Items.Add('Não Sabe');
    rgResposta.Items.Add('1');
    rgResposta.Items.Add('2');
    rgResposta.Items.Add('3');
    rgResposta.Items.Add('4');
    rgResposta.Items.Add('5');

    if rgResposta.Enabled then
    begin
      rgResposta.Width := 578;
      SpeedButton7.Visible := False;
      rgResposta.Hint := 'Nível de 1 a 5' + #13 + #13 +
        'Não sabe responder' + #13 +
        '1 - Totalmente insatisfeito' + #13 +
        '2 - Insatisfeito' + #13 +
        '3 - Nem satisfeito nem insatisfeito' + #13 +
        '4 - Satisfeito' + #13 +
        '5 - Totalmente satisfeito';
    end
    else
    begin
      rgResposta.Width := 547;
      SpeedButton7.Visible := True;
      SpeedButton7.Hint := 'Nível de 1 a 5' + #13 + #13 +
        'Não sabe responder' + #13 +
        '1 - Totalmente insatisfeito' + #13 +
        '2 - Insatisfeito' + #13 +
        '3 - Nem satisfeito nem insatisfeito' + #13 +
        '4 - Satisfeito' + #13 +
        '5 - Totalmente satisfeito';
    end;
  end
  else if flwPesquisaE.vPergunta.dataSet.FieldByName('simnaonivel').AsString = 'Pessimo a Excelente' then
  begin               
    rgResposta.Width := 578;
    SpeedButton7.Visible := False;
    rgResposta.Items.Add('Não Sabe');
    rgResposta.Items.Add('Pessimo');
    rgResposta.Items.Add('Ruim');
    rgResposta.Items.Add('Regular');
    rgResposta.Items.Add('Bom');
    rgResposta.Items.Add('Excelente');
    rgResposta.Hint := '';
  end;
  flwPesquisaE.vResposta._selecionaResposta(flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger, flwPesquisaE.vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
  if not flwPesquisaE.vResposta.IsEmpty then
  begin
    rgResposta.ItemIndex := flwPesquisaE.vResposta.dataSet.FieldByName('nivelresposta').AsInteger;
    Memo1.Lines.Clear;
    Memo1.Lines.Text := flwPesquisaE.vResposta.dataSet.FieldByName('comentario').AsString;
  end;
  flwPesquisaE.vPergunta.vGrupo._selecionaGrupo(flwPesquisaE.vPergunta.dataSet.FieldByName('codgrupo').AsInteger);
  grPerguntas.Caption := 'Perguntas sobre ' + flwPesquisaE.vPergunta.vGrupo.dataSet.FieldByName('descricao').AsString;
  rgRespostaClick(Sender);
end;

procedure TfrmFlwPesquisa.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = DBEdit2) or (ActiveControl = DBLookupComboBox3) then
    Exit;

  if flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger > 0 then
    if flwPesquisaE._existePerfil(flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger) then
    begin
      DBEdit2.Enabled := False;
      DBLookupComboBox3.Enabled := False;
      flwPesquisaE.vPerfil._selecionaPerfil(flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger);
      flwPesquisaE.vPergunta._selecionaPergunta(flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger);
    end
    else
    begin
      Application.MessageBox('Perfil não encontrado', 'Atenção', 0 + 64);
    end;
end;

procedure TfrmFlwPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  flwPesquisaE.rollbackTransacao;
  Action := caFree;
  frmFlwPesquisa := nil;
end;

procedure TfrmFlwPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  if flwPesquisaE = nil then
    flwPesquisaE:= TFlw_Pesquisa.create;
  flwPesquisaE.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPesquisa); 
end;

procedure TfrmFlwPesquisa.FormShow(Sender: TObject);
begin
  inherited;
  DBText1.Width := 578;
  DBText2.Width := 554;

  tsPesquisa.TabVisible := False;
  tsInfCliente.TabVisible := False;

  rgRespostaClick(Sender);

  GroupBox4.Enabled:=True;
  grupoComplemento.Enabled:=True;  
    rgResposta.Enabled:=true;

  if flwPesquisaE._pesquisaConcluida then
  begin
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := false;
    BitBtn7.Enabled := false;
    BitBtn5.Enabled := false;
    SpeedButton9.Enabled := false;
    flwPesquisaE.Cancel;
    rgResposta.Enabled:=false;
    GroupBox4.Enabled:=false;
    grupoComplemento.Enabled:=false;
  end
  else if flwPesquisaE._pesquisaEmAndamento then
  begin
    DBEdit2.Enabled := False;
    DBLookupComboBox3.Enabled := False;
  end;
  DataSource1.OnDataChange := DataSource1DataChange;
  DataSource1DataChange(Sender,flwPesquisaE.dataSet.FieldByName('codpesquisa'));
  PageControl1.ActivePage := tsPesquisa;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
  
end;

procedure TfrmFlwPesquisa.Panel1Enter(Sender: TObject);
begin
  inherited;
  if flwPesquisaE.dataSet.FieldByName('tipo').AsString = 'F' then
    DBEdit6.DataField := 'NPED'
  else
    DBEdit6.DataField := 'CODATENDIMENTO';
end;

procedure TfrmFlwPesquisa.rgRespostaClick(Sender: TObject);
begin
  if flwPesquisaE.vPergunta.dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
  begin
    flwPesquisaE.vPergunta.vComplemento._selecionaPergComp(flwPesquisaE.vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
    if ((rgResposta.ItemIndex = 0) and (not flwPesquisaE.vPergunta.vComplemento.IsEmpty)) and (not grupoComplemento.Visible) then
    begin
      grupoComplemento.Visible := true;
      flwPesquisaE._populaAlternativasComplemento(CheckListBox1);
    end
    else if rgResposta.ItemIndex = 1 then
      grupoComplemento.Visible := false;
    rgResposta.Hint := '';
  end
  else if flwPesquisaE.vPergunta.dataSet.FieldByName('simnaonivel').AsString = 'Nivel de 1 a 5' then
  begin
    flwPesquisaE.vPergunta.vComplemento._selecionaPergComp(flwPesquisaE.vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
    if ((rgResposta.ItemIndex = 1) or (rgResposta.ItemIndex = 2)) and (not flwPesquisaE.vPergunta.vComplemento.IsEmpty) and (not grupoComplemento.Visible) then
    begin
      grupoComplemento.Visible := true;
      flwPesquisaE._populaAlternativasComplemento(CheckListBox1);
    end
    else if (rgResposta.ItemIndex <> 1) and (rgResposta.ItemIndex <> 2) then
      grupoComplemento.Visible := false;
  end
  else if flwPesquisaE.vPergunta.dataSet.FieldByName('simnaonivel').AsString = 'Pessimo a Excelente' then
  begin
    flwPesquisaE.vPergunta.vComplemento._selecionaPergComp(flwPesquisaE.vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
    if ((rgResposta.ItemIndex = 1) or (rgResposta.ItemIndex = 2)) and (not flwPesquisaE.vPergunta.vComplemento.IsEmpty) and (not grupoComplemento.Visible) then
    begin
      grupoComplemento.Visible := true;
      flwPesquisaE._populaAlternativasComplemento(CheckListBox1);
    end
    else if (rgResposta.ItemIndex <> 1) and (rgResposta.ItemIndex <> 2) then
      grupoComplemento.Visible := false;
  end;
end;

procedure TfrmFlwPesquisa.SpeedButton1Click(Sender: TObject);
begin
  if flwPesquisaE.vPergunta.Prior then
  begin
    if flwPesquisaE.vPergunta.Bof then
    begin
      SpeedButton1.Enabled := false;
      SpeedButton2.Enabled := true;
      SpeedButton3.Enabled := false;
      SpeedButton4.Enabled := true;
    end
    else
    begin
      SpeedButton1.Enabled := true;
      SpeedButton2.Enabled := true;
      SpeedButton3.Enabled := true;
      SpeedButton4.Enabled := true;
    end;
  end;
  rgRespostaClick(Sender);
end;

procedure TfrmFlwPesquisa.SpeedButton2Click(Sender: TObject);
begin
  if flwPesquisaE.vPergunta.Next then
  begin
    if flwPesquisaE.vPergunta.Eof then
    begin
      SpeedButton1.Enabled := true;
      SpeedButton2.Enabled := false;
      SpeedButton3.Enabled := true;
      SpeedButton4.Enabled := false;
      if not flwPesquisaE.vPergunta.IsEmpty then
        Application.MessageBox('Fim das perguntas', 'Atenção', 0 + 64);
    end
    else
    begin
      SpeedButton1.Enabled := true;
      SpeedButton2.Enabled := true;
      SpeedButton3.Enabled := true;
      SpeedButton4.Enabled := true;
    end;
  end;
end;

procedure TfrmFlwPesquisa.SpeedButton3Click(Sender: TObject);
begin
  if flwPesquisaE.vPergunta.First then
  begin
    if flwPesquisaE.vPergunta.Bof then
    begin
      SpeedButton1.Enabled := false;
      SpeedButton2.Enabled := true;
      SpeedButton3.Enabled := false;
      SpeedButton4.Enabled := true;
    end;
  end;
  rgRespostaClick(Sender);
end;

procedure TfrmFlwPesquisa.SpeedButton4Click(Sender: TObject);
begin
  if flwPesquisaE.vPergunta.Last then
  begin
    if flwPesquisaE.vPergunta.Eof then
    begin
      SpeedButton1.Enabled := true;
      SpeedButton2.Enabled := false;
      SpeedButton3.Enabled := true;
      SpeedButton4.Enabled := false;
    end;
  end;
  rgRespostaClick(Sender);
end;

procedure TfrmFlwPesquisa.SpeedButton5Click(Sender: TObject);
begin
  PageControl1.ActivePage := tsInfCliente;
  Memo2.Lines.Text := flwPesquisaE._getInformacaoClienteAtendimento;
//  Memo1.Lines.Text := flwPesquisaE.
//  Application.CreateForm(TfrmInformacoes, frmInformacoes);
//  if obOsFollow <> nil then
//  begin
//    frmInformacoes.Caption := 'Informações do Cliente e dos Serviços';
//    frmInformacoes.grPerguntas.Caption := 'Informações dos Serviços';
//    frmInformacoes.Memo1.Lines.Add('Tipo Serviço: ' + trim(flwPesquisaE.vOsFlw.dataSet.FieldByName('categoria_flw').AsString) + ' - Data: ' + flwPesquisaE.vOsFlw.dataSet.FieldByName('dataos_flw').AsString);
//    frmInformacoes.Memo1.Lines.Add(flwPesquisaE.vOsFlw.dataSet.FieldByName('servico_flw').AsString);
//  end
//  else if obPosA <> nil then
//  begin
//    frmInformacoes.Caption := 'Informações do Cliente e do Atendimento';
//    frmInformacoes.grPerguntas.Caption := 'Informações do Atendimento';
//    frmInformacoes.Memo1.Lines.Add('Tipo Atendimento: ' + trim(flwPesquisaE.vPosA.dataSet.FieldByName('categoria_pos').AsString) + ' - Data: ' + flwPesquisaE.vPosA.dataSet.FieldByName('data_pos').AsString);
//    frmInformacoes.Memo1.Lines.Add(flwPesquisaE.vPosA.dataSet.FieldByName('atendimento_pos').AsString);
//  end;
//  frmInformacoes.ShowModal;
end;

procedure TfrmFlwPesquisa.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox2.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
  	DBLookupComboBox2.SetFocus;
end;

procedure TfrmFlwPesquisa.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if not flwPesquisaE.vResposta.vRespCompl.dataSet.IsEmpty then
    Exit;

  if not flwPesquisaE.vResposta.dataSet.IsEmpty then
    Exit;

  flwPesquisaE.vPerfil._abreTodos;

  DBEdit2.Enabled := True;
  DBLookupComboBox3.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

end.

