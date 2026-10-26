unit UConsGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, UClassesConsGeral, Mask, Menus,
  EnterantHw, Contnrs, xhGrid, uPadrao;

type
  ArrayBi = array[0..4, 0..2] of ShortString;
//  array of array of shortstring;

  TFrmConsGeral = class(TfrmPadrao)
    MainMenu1: TMainMenu;
    VerificarConsultasDiversas1: TMenuItem;
    DefinirUsurioparaConsultas1: TMenuItem;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TreeView1: TTreeView;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lbConsultasSalvas: TLabel;
    cbConsultasSalvas: TComboBox;
    Splitter1: TSplitter;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    pn_pw: TPanel;
    EnterHw1: TEnterHw;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pn_pwDblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TreeView1Enter(Sender: TObject);
    procedure DefinirUsurioparaConsultas1Click(Sender: TObject);
    procedure VerificarConsultasDiversas1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BitBtn2Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure FormShow(Sender: TObject);
    function ConsultaDireta(vcodcnt: integer; vpar: ArrayBi; vtitulo: pchar): boolean;
  private
    { Private declarations }
    FFormsList: TObjectList;
    FSenha: string;

    procedure ConsultaSalva_Go(var AGrid: THierCubeGrid; var ACombo: TComboBox; var AConsultas: TObjectList);
    procedure ConsultaSalva_Save(var AGrid: THierCubeGrid; var ACombo: TComboBox; var AConsultas: TObjectList);
    procedure ConsultaSalva_Save_Last(var AGrid: THierCubeGrid; var ACombo: TComboBox; var AConsultas: TObjectList);
    procedure ConsultaSalva_Delete(var AGrid: THierCubeGrid; var ACombo: TComboBox; var AConsultas: TObjectList);
    function ValidaAcesso(ALocal: string): Boolean;
    procedure validarSenhaBotaoBuildOLAP;
  public
    { Public declarations }
  end;

var
  FrmConsGeral: TFrmConsGeral;
  Cadconsgeral: TRelConsGeral;
  AMDI: Boolean;

implementation

uses
  ShellAPI, UvisualizadorOLAP_2, UvincConsultaUsuario, xhHierCube, DB,
  UdtmConsGeral, uBuildConsulta, DateUtils;

{$R *.dfm}

function verificaConsultas(pathBanco, codEmpresa: string): LongBool; stdcall; external 'cons40.dll';

procedure olap_pesquisageral_mdi(Atipo, ACodEmpresa, ADataBaseName, AUsuario, ACodUsuario: string);
begin
  AMDI := True;

  if not Assigned(DtmConsGeral) then
    DtmConsGeral := TDtmConsGeral.Create(Application);

  if not Assigned(Cadconsgeral) then
  begin
    Cadconsgeral := TRelConsGeral.create;

    Cadconsgeral.vendbanco := ADataBaseName;
    Cadconsgeral.conectaBanco;
    Cadconsgeral.cod_empresa := ACodEmpresa;
    Cadconsgeral.vusuario := AUsuario;
    Cadconsgeral.vcodus := strtoint(ACodUsuario);
  end;

  if not Assigned(FrmConsGeral) then
    Application.CreateForm(TFrmConsGeral, FrmConsGeral);

  if (not FrmConsGeral.Visible) then
	  FrmConsGeral.Show
  else if FrmConsGeral.FormStyle = fsMDIChild then
    FrmConsGeral.Show
  else
    FrmConsGeral.ShowModal;
end;

procedure olap_pesquisageral_mdi_free();
begin
  if Assigned(Cadconsgeral) then
  begin
    Cadconsgeral.desconectabanco;
    FreeAndNil(Cadconsgeral);
  end;

  if Assigned(FrmConsGeral) then
    FreeAndNil(FrmConsGeral);

  if Assigned(DtmConsGeral) then
    FreeAndNil(DtmConsGeral);
end;

exports
  olap_pesquisageral_mdi,
  olap_pesquisageral_mdi_free;


procedure TFrmConsGeral.BitBtn1Click(Sender: TObject);
var
  AForm: TFrmVisualizaOlap_2;
  ATab: TTabSheet;
  I, J, IndexConsultaSalva: Integer;
  AConsultaSalva: TConsultasSalvas;
begin
  if Cadconsgeral.verificasenha('GES043', TreeView1.Selected.Text) then
  begin
    Cadconsgeral.abreStatusProcessamento('', 'Abrindo Consulta Solicitada Aguarde...');
    try

      ATab := nil;
      for I := 0 to PageControl1.PageCount - 1 do
        if PageControl1.Pages[I].Caption = TreeView1.Selected.Text then
        begin
          ATab := PageControl1.Pages[I];
          Break;
        end;
      if Assigned(ATab) then
        FreeAndNil(ATab);

      AForm := TFrmVisualizaOlap_2.Create(Application);

      AConsultaSalva := nil;
      if Assigned(Cadconsgeral.ConsultasSalvas) then
      begin

        AForm.SpeedButton2.Hint := AForm.SpeedButton2.Hint + ' - [GES081]';
        AForm.SpeedButton3.Hint := AForm.SpeedButton3.Hint + ' - [GES082]';
        AForm.SpeedButton4.Hint := AForm.SpeedButton4.Hint + ' - [GES083]';
        AForm.SpeedButton5.Hint := AForm.SpeedButton5.Hint + ' - [GES084]';

        IndexConsultaSalva := cbConsultasSalvas.ItemIndex;
        if (IndexConsultaSalva < 0) or (IndexConsultaSalva > Cadconsgeral.ConsultasSalvas.Count - 1) then
          IndexConsultaSalva := -1;
        if IndexConsultaSalva > -1 then
          AConsultaSalva := Cadconsgeral.ConsultasSalvas.Items[IndexConsultaSalva].NewCopy;

        AForm.Consultas := TObjectList.Create;
        for I := 0 to Cadconsgeral.ConsultasSalvas.Count - 1 do
          AForm.Consultas.Add(Cadconsgeral.ConsultasSalvas.NewCopy(I));

        AForm.ConsultaGo       := ConsultaSalva_Go;
        AForm.ConsultaSave     := ConsultaSalva_Save;
        AForm.ConsultaSaveLast := ConsultaSalva_Save_Last;
        AForm.ConsultaDelete   := ConsultaSalva_Delete;
        AForm.ValidaAcesso     := ValidaAcesso;
      end;

      Cadconsgeral.montapesquisa(AForm.HCubeGERAL, AForm.HierCubeGrid1, '', '', Self, 0, AConsultaSalva, False);

      ATab             := TTabSheet.Create(PageControl1);
      ATab.PageControl := PageControl1;
      ATab.Caption     := TreeView1.Selected.Text;

      AForm.ComboBox1.Items           := cbConsultasSalvas.Items;
      AForm.ComboBox1.ItemIndex       := cbConsultasSalvas.ItemIndex;
      AForm.pnConsultasSalvas.Visible := cbConsultasSalvas.Items.Count > 0;
      AForm.Label1.Caption            := TreeView1.Selected.Text;
      AForm.Panel1.Caption            := TreeView1.Selected.Text;
      AForm.NomeConsulta              := TreeView1.Selected.Text;
      AForm.PageControl1.Parent       := ATab;
      AForm.Panel1.Parent             := ATab;
      AForm.Label1.Visible            := False;
      AForm.Panel1.Visible            := False;

      AForm.HierCubeGrid1.HierCube.Active := True;

      for I := 0 to AConsultaSalva.Campos.Count - 1 do
        with AConsultaSalva.Campos.Items[I] do
          if (tipo_campo = 'S') or (tipo_campo = 'M') then
            for j := 0 to AForm.HierCubeGrid1.SummarySettings.Count - 1 do
              if UpperCase(AForm.HierCubeGrid1.SummarySettings.Items[j].FieldName) = uppercase(nome_campo) then
              begin
                if formatstring <> '' then
                  AForm.HierCubeGrid1.SummarySettings.Items[j].FunctionSum.SubFunctions[0].FormatString := formatstring;
                AForm.HierCubeGrid1.SummarySettings.Items[j].DisplayName                                := nome_apresentacao;
                AForm.HierCubeGrid1.SummarySettings.Items[j].FieldName                                  := nome_campo;
              end;

      ATab.Show;

      FFormsList.Add(AForm);
    finally
      Cadconsgeral.fechaStatusProcessamento;
    end;
  end;
end;

procedure TFrmConsGeral.BitBtn2Click(Sender: TObject);
var
  iimp: integer;
  T: TComponent;
begin
  scrollbox1.Refresh;
  for iimp := ComponentCount - 1 downto 0 do
  begin
    T := Components[iimp];
    if (T is Tmaskedit) then
    begin
      if (T as TMaskEdit).Parent = ScrollBox1 then
        (T as TMaskEdit).Free;
    end;
    if (T is Tcombobox) then
    begin
      if (T as TCombobox).Parent = ScrollBox1 then
        (T as TCombobox).Free;
    end;
    if (T is TLabel) then
    begin
      if (T as TLabel).Parent = ScrollBox1 then
        (T as TLabel).Free;
    end;
  end;
  Panel2.Visible := False;
end;

procedure TFrmConsGeral.ConsultaSalva_Delete(var AGrid: THierCubeGrid;
  var ACombo: TComboBox; var AConsultas: TObjectList);
var
  AIndex, I: Integer;
  AConsultaSalva: TConsultasSalvas;
begin
  try
    Screen.Cursor := crHourGlass;
    AIndex := ACombo.ItemIndex;
    if AIndex = -1 then
      Exit;
    if AIndex > AConsultas.Count - 1 then
      Exit;

    AConsultaSalva := TConsultasSalvas(AConsultas.Items[AIndex]);

    if ACombo.Items[AIndex] = 'Consulta padrao' then
      Application.MessageBox('Consulta padrão não pode ser excluída', 'Atenção', MB_ICONEXCLAMATION)
    else if ACombo.Items[AIndex] = 'Ultima consulta' then
      Application.MessageBox('Ultima consulta não pode ser excluída', 'Atenção', MB_ICONEXCLAMATION)
    else
    begin
      if Application.MessageBox(PChar(Format('Deseja mesmo excluir a consulta salva com o título "%s"?', [AConsultaSalva.nome_salvo])),
        'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

      Cadconsgeral.ConsultaSalva_Excluir(AConsultaSalva);

      AConsultas.Delete(AIndex);

      ACombo.Clear;
      for I := 0 to AConsultas.Count - 1 do
        ACombo.Items.Add(TConsultasSalvas(AConsultas.Items[I]).nome_salvo);
      if AIndex > 0 then
        AIndex := AIndex - 1;
      ACombo.ItemIndex := AIndex ;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConsGeral.ConsultaSalva_Go(var AGrid: THierCubeGrid;
  var ACombo: TComboBox; var AConsultas: TObjectList);
var
  AIndex, I: Integer;
  AConsultaSalva: TConsultasSalvas;
begin
  try
    AIndex := ACombo.ItemIndex;
    if AIndex = -1 then
      Exit;
    if AIndex > AConsultas.Count - 1 then
      Exit;

    AConsultaSalva := TConsultasSalvas(AConsultas.Items[AIndex]);

    Cadconsgeral.ConsultaSalva_Go(AConsultaSalva, AGrid);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConsGeral.ConsultaSalva_Save(var AGrid: THierCubeGrid;
  var ACombo: TComboBox; var AConsultas: TObjectList);
var
  ANewName, AOldName: string;
  AConsultaSalva, AConsultaNova: TConsultasSalvas;
  AIndex, I: Integer;
  AExisteConsulta: Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    AIndex := ACombo.ItemIndex;
    if AIndex = -1 then
      Exit;
    if AIndex > AConsultas.Count - 1 then
      Exit;

    AConsultaSalva := TConsultasSalvas(AConsultas.Items[AIndex]);

    AConsultaNova := AConsultaSalva.NewCopy;
  //  AConsultaNova.cod_consulta := AConsultaSalva.cod_consulta;
  //  AConsultaNova.nome_salvo   := AConsultaSalva.nome_salvo;
  //  AConsultaNova.cod_usuario  := AConsultaSalva.cod_usuario;
  //  AConsultaNova.Campos       := AConsultaSalva.Campos.;

    AConsultaNova := Cadconsgeral.ConsultaSalva_GetFromGrid(AConsultaNova, AGrid);

    AOldName := AConsultaNova.nome_salvo;
    ANewName := AOldName;
    if not InputQuery('Salvar consulta', 'Salvar consulta como', ANewName) then
      Exit;
    ANewName := Trim(ANewName);

    if ANewName = 'Consulta padrao' then
      Application.MessageBox('O título "Consulta padrao" já existe, não pode ser utilizado', 'Atenção', MB_ICONEXCLAMATION)
    else if ANewName = 'Ultima consulta' then
      Application.MessageBox('O título "Ultima consulta" já existe, não pode ser utilizado', 'Atenção', MB_ICONEXCLAMATION)
    else
    begin
      AExisteConsulta := False;
      for I := 0 to AConsultas.Count - 1 do
        if TConsultasSalvas(AConsultas.Items[I]).nome_salvo = ANewName then
        begin
          AExisteConsulta := True;
          if Application.MessageBox(PChar(Format('Já existe consulta salva com o título "%s". Deseja substituir?', [ANewName])),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
            Exit;

          Cadconsgeral.ConsultaSalva_Excluir(AConsultaSalva);
          AConsultaNova.nome_salvo := ANewName;
          Cadconsgeral.ConsultaSalva_Salvar(AConsultaNova);
          AConsultas.Delete(I);
          AConsultas.Add(AConsultaNova);
          Break;
        end;
      if not AExisteConsulta then
      begin
        AConsultaNova.nome_salvo := ANewName;
        Cadconsgeral.ConsultaSalva_Salvar(AConsultaNova);
        AConsultas.Add(AConsultaNova);
      end;

      ACombo.Clear;
      for I := 0 to AConsultas.Count - 1 do
        ACombo.Items.Add(TConsultasSalvas(AConsultas.Items[I]).nome_salvo);
      ACombo.ItemIndex := ACombo.Items.IndexOf(ANewName);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConsGeral.ConsultaSalva_Save_Last(var AGrid: THierCubeGrid;
  var ACombo: TComboBox; var AConsultas: TObjectList);
var
  ANomeSelecionada: string;
  AConsultaSalva, AConsultaNova: TConsultasSalvas;
  AIndex, I: Integer;
  AExisteConsulta: Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    Cadconsgeral.abreStatusProcessamento('Processando', 'Salvando última consulta');
    AIndex := ACombo.ItemIndex;
    if AIndex = -1 then
      Exit;
    if AIndex > AConsultas.Count - 1 then
      Exit;

    ANomeSelecionada := TConsultasSalvas(AConsultas.Items[AIndex]).nome_salvo;

    AConsultaSalva := TConsultasSalvas(AConsultas.Items[AIndex]);

    AConsultaNova := AConsultaSalva.NewCopy;

    AConsultaNova := Cadconsgeral.ConsultaSalva_GetFromGrid(AConsultaNova, AGrid);
    AConsultaNova.nome_salvo := 'Ultima consulta';

    AExisteConsulta := False;
    for I := 0 to AConsultas.Count - 1 do
      if TConsultasSalvas(AConsultas.Items[I]).nome_salvo = AConsultaNova.nome_salvo then
      begin
        AExisteConsulta := True;
        Cadconsgeral.ConsultaSalva_Salvar(AConsultaNova);
        AConsultas.Delete(I);
        AConsultas.Add(AConsultaNova);
        Break;
      end;
    if not AExisteConsulta then
    begin
      Cadconsgeral.ConsultaSalva_Salvar(AConsultaNova);
      AConsultas.Add(AConsultaNova);
    end;

    ACombo.Clear;
    for I := 0 to AConsultas.Count - 1 do
      ACombo.Items.Add(TConsultasSalvas(AConsultas.Items[I]).nome_salvo);
    ACombo.ItemIndex := ACombo.Items.IndexOf(ANomeSelecionada);

  finally
    Cadconsgeral.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

function TFrmConsGeral.ConsultaDireta(vcodcnt: integer; vpar: ArrayBi; vtitulo: pchar): boolean;
var
  it, itx: integer;
  vnomecons: string;
begin
  if Cadconsgeral.verificasenha('GES043', 'Consulta: ' + IntToStr(vcodcnt)) then
  begin
    Application.CreateForm(TFrmVisualizaOlap_2, FrmVisualizaOlap_2);
    Cadconsgeral.abreStatusProcessamento('', 'Abrindo Consulta Solicitada Aguarde...');
    for it := 0 to 4 do
      for itx := 0 to 2 do
        Cadconsgeral.vparametrosext[it, itx] := vpar[it, itx];
    Cadconsgeral.Buscas.close;
    Cadconsgeral.buscas.sql.text := 'select * from SQLCONSULTASDIV where cod_consulta = ' + IntToStr(vcodcnt) + ' and cod_empresa = ' + Cadconsgeral.cod_empresa;
    Cadconsgeral.Buscas.open;
    vnomecons := Cadconsgeral.Buscas.FieldByName('DESCRICAOCONS').AsString;
    Cadconsgeral.vcodconsulta := Cadconsgeral.Buscas.FieldByName('COD_CONSULTA').AsInteger;
    Cadconsgeral.procuraparametros(Cadconsgeral.Buscas.FieldByName('CONSULTASQL').AsString);
    Cadconsgeral.montapesquisa(FrmVisualizaOlap_2.HCubeGERAL, FrmVisualizaOlap_2.HierCubeGrid1, '', '', Self, 1);
    FrmVisualizaOlap_2.Label1.Caption := vnomecons + ' - ' + vtitulo;
//  FrmVisualizaOlap_2.HCubeGERAL.Active:=true;

    Cadconsgeral.fechaStatusProcessamento;
    FrmVisualizaOlap_2.ShowModal;
//  ShowMessage(inttostr(FrmVisualizaOlap_2.HierCubeGrid1.GridInfo.RowDimIDs.Count));
//  ShowMessage(inttostr(FrmVisualizaOlap_2.HierCubeGrid1.GridInfo.Cube.DimensionMap.Count));
    if application.messagebox('Deseja Salvar as posições definidas nesta consulta para este usuário?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
      Cadconsgeral.Gravapospesquisa(FrmVisualizaOlap_2.HCubeGERAL, FrmVisualizaOlap_2.HierCubeGrid1);
    FrmVisualizaOlap_2.Free;
  end;
end;

procedure TFrmConsGeral.DefinirUsurioparaConsultas1Click(Sender: TObject);
begin
  if Cadconsgeral.verificasenha('GES042', '') then
  begin
    if TreeView1.Selected.Level = 1 then
    begin
      application.CreateForm(TFrmvincUsuario, FrmvincUsuario);
      FrmvincUsuario.cadDadCons := Cadconsgeral;
      FrmvincUsuario.vdesccons := TreeView1.Selected.Text;
      FrmvincUsuario.showmodal;
      FrmvincUsuario.Free;
    end
    else
      Application.MessageBox(pchar('Favor Selecionar uma consulta'), Pchar('Aviso'), MB_OK);
  end;
end;

procedure TFrmConsGeral.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
  AForm: TFrmVisualizaOlap_2;
begin
  inherited; 
  if Assigned(FFormsList) then
    for I := FFormsList.Count - 1 downto 0 do
//    begin
//      AForm := TFrmVisualizaOlap_2(FFormsList.Items[I]);
//      AForm.Close;
//      FreeAndNil(AForm);
      FFormsList.Delete(I);
//    end;

  Cadconsgeral.desconectabanco;

  if Assigned(FFormsList) then
    FreeAndNil(FFormsList);

  if Assigned(Cadconsgeral) then
    FreeAndNil(Cadconsgeral);
  Action := caFree;
  FrmConsGeral := nil
end;

procedure TFrmConsGeral.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	Self.fechar := True;
	inherited;
end;

procedure TFrmConsGeral.FormCreate(Sender: TObject);
begin
  if AMDI then
    FormStyle := fsMDIChild;
end;

procedure TFrmConsGeral.FormShow(Sender: TObject);
begin
  inherited;	
  if TreeView1.Items.Count <= 0 then
    Cadconsgeral.PopulaTreeView(TreeView1, nil, 'TIPOCONSULTA', 0, 1, 'CABECALHO_NF', 'CODIGO');
  Self.Icon.Handle := ExtractIcon(Handle, PChar(Application.ExeName), 0);
  Panel2.Visible := false;
  pn_pw.BevelKind := bkNone;
  if not Assigned(FFormsList) then
    FFormsList := TObjectList.Create;

  if not AMDI then
    Self.Caption := 'Consultas programadas OLAP - ' +
      Cadconsgeral.SqlOpen('select ''Empresa ''||(select result from strzero(emp.cod_empresa, 3))||'' - ''||emp.identificacao_emp identificacao_emp ' +
                           ' from empresa emp' +
                           ' where emp.cod_empresa = ' + Cadconsgeral.cod_empresa).FieldByName('identificacao_emp').AsString;
end;

procedure TFrmConsGeral.pn_pwDblClick(Sender: TObject);
begin
  InputQuery('@Mdhm?', '@', FSenha);
  validarSenhaBotaoBuildOLAP;
  FSenha := '';
end;

procedure TFrmConsGeral.SpeedButton1Click(Sender: TObject);
begin
  verificaConsultas(Cadconsgeral.vendbanco, Cadconsgeral.cod_empresa);
  TreeView1.Items.Clear;
  Cadconsgeral.PopulaTreeView(TreeView1, nil, 'TIPOCONSULTA', 0, 1, 'CABECALHO_NF', 'CODIGO');
  Panel2.Visible := False;

  Application.MessageBox(pchar('Processo finalizado'), Pchar('Aviso'), MB_OK);
end;

procedure TFrmConsGeral.SpeedButton2Click(Sender: TObject);
begin
  if Cadconsgeral.verificasenha('GES042', '') then
  begin
    if not Assigned(TreeView1.Selected) then
      Application.MessageBox(pchar('Favor Selecionar uma consulta'), Pchar('Aviso'), MB_OK)
    else
    if TreeView1.Selected.Level = 1 then
    begin
      application.CreateForm(TFrmvincUsuario, FrmvincUsuario);
      FrmvincUsuario.cadDadCons := Cadconsgeral;
      FrmvincUsuario.vdesccons := TreeView1.Selected.Text;
      FrmvincUsuario.showmodal;
      FrmvincUsuario.Free;

      TreeView1.Items.Clear;
      Cadconsgeral.PopulaTreeView(TreeView1, nil, 'TIPOCONSULTA', 0, 1, 'CABECALHO_NF', 'CODIGO');
    end
    else
      Application.MessageBox(pchar('Favor Selecionar uma consulta'), Pchar('Aviso'), MB_OK);
  end;
end;

procedure TFrmConsGeral.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConsGeral.SpeedButton4Click(Sender: TObject);
begin
  SpeedButton4.Enabled := False;
  SpeedButton5.Enabled := False;
  Application.CreateForm(TfrmBuilConsultaOLAP, frmBuilConsultaOLAP);
  frmBuilConsultaOLAP.ConsOLAP := Cadconsgeral;
  frmBuilConsultaOLAP.ShowModal;

  TreeView1.Items.Clear;
  Cadconsgeral.PopulaTreeView(TreeView1, nil, 'TIPOCONSULTA', 0, 1, 'CABECALHO_NF', 'CODIGO');
end;

procedure TFrmConsGeral.SpeedButton5Click(Sender: TObject);
var
  IndexConsultaSalva: Integer;
begin
  SpeedButton4.Enabled := False;
  SpeedButton5.Enabled := False;

  if not Assigned(Cadconsgeral.ConsultasSalvas) then
  begin
    Application.MessageBox('Sem consulta disponivel para cópia', 'Atenção', 64);
    Exit;
  end;

  Application.CreateForm(TfrmBuilConsultaOLAP, frmBuilConsultaOLAP);
  frmBuilConsultaOLAP.ConsOLAP := Cadconsgeral;

  IndexConsultaSalva := cbConsultasSalvas.ItemIndex;
  if (IndexConsultaSalva < 0) or (IndexConsultaSalva > Cadconsgeral.ConsultasSalvas.Count - 1) then
    IndexConsultaSalva := -1;
  if IndexConsultaSalva > -1 then
    with frmBuilConsultaOLAP do
    begin
      ConsultaOrigem := Cadconsgeral.ConsultasSalvas.Items[IndexConsultaSalva].NewCopy;
      ConsultaOrigem.nome_salvo := TreeView1.Selected.Text;
    end;

  frmBuilConsultaOLAP.ShowModal;

  TreeView1.Items.Clear;
  Cadconsgeral.PopulaTreeView(TreeView1, nil, 'TIPOCONSULTA', 0, 1, 'CABECALHO_NF', 'CODIGO');
end;

procedure TFrmConsGeral.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Panel2.Visible then
  begin
    BitBtn2Click(Sender);
  end;
end;

procedure TFrmConsGeral.TreeView1DblClick(Sender: TObject);
var
  iimp: integer;
  I: Integer;
begin
  case TreeView1.Selected.Level of
    1:
      begin
        Panel2.Visible := true;
        cbConsultasSalvas.Clear;
        Cadconsgeral.SelecionaConsultasSalvas(TreeView1.Selected.Text);
        for I := 0 to Cadconsgeral.ConsultasSalvas.Count - 1 do
          cbConsultasSalvas.Items.Add(Cadconsgeral.ConsultasSalvas.Items[I].nome_salvo);
        if cbConsultasSalvas.Items.Count > 0 then cbConsultasSalvas.ItemIndex := 0;

        try
        Cadconsgeral.criaparametrosform(FrmConsGeral, TreeView1.Selected.Text, ScrollBox1);
        except
          ShowMessage('erro nos parametros');

        end;
        scrollbox1.Refresh;
        for iimp := 0 to ComponentCount - 1 do
        begin
          if (Components[iimp] is Tmaskedit) then
          begin
            ActiveControl := (Components[iimp] as TMaskedit);
            break;
          end;
          if (Components[iimp] is TCombobox) then
          begin
            ActiveControl := (Components[iimp] as TCombobox);
            break;
          end;
        end;
      end;
  end;
end;

procedure TFrmConsGeral.TreeView1Enter(Sender: TObject);
begin
  if BitBtn2.Visible then
    BitBtn2.OnClick(sender);
end;

procedure TFrmConsGeral.TreeView1Expanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
begin
  if node.Level = 0 then
    Cadconsgeral.vtipoconsulta := Node.Text;
  Cadconsgeral.treeviewExpandir(Node, AllowExpansion, TreeView1);
  AllowExpansion := true;
end;

procedure TFrmConsGeral.TreeView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    TreeView1DblClick(Sender);
end;

function TFrmConsGeral.ValidaAcesso(ALocal: string): Boolean;
begin
  if ALocal = 'EXPORTAR_XLS_FILE' then
    Result := Cadconsgeral.verificasenha('GES081', '')
  else if ALocal = 'EXPORTAR_XLS_OLE' then
    Result := Cadconsgeral.verificasenha('GES082', '')
  else if ALocal = 'EXPORTAR_HTML_FILE' then
    Result := Cadconsgeral.verificasenha('GES083', '')
  else if ALocal = 'EXPORTAR_PDF_FILE' then
    Result := Cadconsgeral.verificasenha('GES084', '')
  else
    Result := Cadconsgeral.verificasenha(ALocal, '');
end;

procedure TFrmConsGeral.validarSenhaBotaoBuildOLAP;
var
  AChave: string;
begin
  if FSenha = '' then
    Exit;

  AChave := 'PW' + //padrao
            IntToStr(MonthOf(Date)) +
            IntToStr(DayOf(Date)) +
            IntToStr(HourOf(Now)) +
            IntToStr(MinuteOf(Now)) + '17';

  if UpperCase(AChave) = UpperCase(FSenha) then
  begin
    SpeedButton4.Enabled := True;
    SpeedButton5.Enabled := True;
  end;
end;

procedure TFrmConsGeral.VerificarConsultasDiversas1Click(Sender: TObject);
begin
  verificaConsultas(Cadconsgeral.vendbanco, Cadconsgeral.cod_empresa);
  Application.MessageBox(pchar('Este Formulário será fechado favor abrí-lo novamente'), Pchar('Aviso'), MB_OK);
  Close;
//  Cadconsgeral.PopulaTreeView(TreeView1, nil,'TIPOCONSULTA', 0, 1, 'CABECALHO_NF', 'CODIGO');
end;

end.

