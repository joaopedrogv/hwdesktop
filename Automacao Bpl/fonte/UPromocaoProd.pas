unit UPromocaoProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, uEditMoeda,
  UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, Buttons, DBCtrls, Spin;

type
  TFrmPromocaoProd = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox26: TGroupBox;
    edCodBarra: TEdit;
    edmVlUnit: TEditMoeda;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox2: TCheckBox;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edCodBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edCodBarraExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPromocaoProd: TFrmPromocaoProd;
  ProdPromocao: TPromocaoProd;

implementation

{$R *.dfm}

procedure TFrmPromocaoProd.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', ProdPromocao.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO155', 'ALTERAR', '', 'PRODUTOS', '', ProdPromocao.buscas, false) then
    exit;
  if ProdPromocao.ativarPromocao(edCodBarra.Text, edmVlUnit.Valor, SpinEdit1.Value) then
  begin
    vDadosIni.GravaAuditoria('PRO155', 'PRODUTOS', edCodBarra.Text + ' Sucesso', '', '', ProdPromocao.buscas);
    edCodBarra.Text := '';
    Label1.Caption := '';
    if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
    	edCodBarra.SetFocus;
  end
  else
  begin
    vDadosIni.GravaAuditoria('PRO155', 'PRODUTOS', edCodBarra.Text + ' Falha', '', '', ProdPromocao.buscas);
    if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
    	edCodBarra.SetFocus;
  end;
  //  ProdPromocao.ListaBancas(true);
end;

procedure TFrmPromocaoProd.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', ProdPromocao.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO156', 'ALTERAR', '', 'PRODUTOS', '', ProdPromocao.buscas, false) then
    exit;
  ProdPromocao.retirarPromocao;
  //  ProdPromocao.ListaBancas(true);
end;

procedure TFrmPromocaoProd.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPromocaoProd.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
  begin
    ProdPromocao.ListaBancas(true);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    	DBLookupComboBox1.SetFocus;
  end
  else
  begin
    SpeedButton1.Enabled := false;
    SpeedButton1.Visible := false;
    SpeedButton2.Enabled := false;
    SpeedButton2.Visible := false;
    GroupBox26.Height := 169;
    ProdPromocao.ListaBancas(false);
    ProdPromocao.abreProdutosPromocao(0);
  end;
end;

procedure TFrmPromocaoProd.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (trim(DBLookupComboBox1.Text) <> '') and (CheckBox2.Checked) then
  begin
    ProdPromocao.abreProdutosPromocao(ProdPromocao.query.FieldByName('NUM_BANCA').asinteger);
    SpeedButton1.Enabled := true;
    SpeedButton1.Visible := true;
    SpeedButton1.Caption := 'Alterar o Valor de todos os  produtos da Banca : ' + inttostr(ProdPromocao.query.FieldByName('NUM_BANCA').asinteger);
    SpeedButton2.Enabled := true;
    SpeedButton2.Visible := true;
    SpeedButton2.Caption := 'Retirar promoção de todos os  produtos da Banca : ' + inttostr(ProdPromocao.query.FieldByName('NUM_BANCA').asinteger);
    GroupBox26.Height := 249;
  end
  else
  begin
    ProdPromocao.abreProdutosPromocao(0);
    CheckBox2.Checked := false;
    SpeedButton1.Enabled := false;
    SpeedButton1.Visible := false;
    SpeedButton2.Enabled := false;
    SpeedButton2.Visible := false;
    GroupBox26.Height := 169;
  end;
end;

procedure TFrmPromocaoProd.edCodBarraExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn3) then
    if trim(edCodBarra.Text) = '' then
    begin
      Label1.Caption := '';
      if (ActiveControl <> BitBtn2) and (ActiveControl <> BitBtn3) then
      begin
        try
          Screen.Cursor := crHourGlass;
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
          if vDadosIni.vPesquisa <> '' then
          begin
            edCodBarra.Text := vDadosIni.vPesquisa;
            Label1.Caption := ProdPromocao.retornaDescricaoProd(vDadosIni.vPesquisa);
          end;
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    end
    else
    begin
      Label1.Caption := ProdPromocao.retornaDescricaoProd(edCodBarra.Text);
      if Label1.Caption = '' then
      begin
      	if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
        	edCodBarra.SetFocus;
        exit;
      end;
    end;
end;

procedure TFrmPromocaoProd.edCodBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO017', 'PESQUISAR', '', 'PRODUTOS', '', ProdPromocao.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
          edCodBarra.Text := vDadosIni.vPesquisa;
        //          ProdPromocao.dataSet.FieldByName('NUM_FAB_PROD').asstring := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
end;

procedure TFrmPromocaoProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ProdPromocao.Destroy;
  Action := caFree;
  FrmPromocaoProd := nil;
end;

procedure TFrmPromocaoProd.FormCreate(Sender: TObject);
begin
  inherited;
  ProdPromocao := TPromocaoProd.create;
  DBGrid1.DataSource := dtmProdutos.dsPromocao;
  //  ProdPromocao.abreProdutosPromocao;
  ProdPromocao.abreProdutosPromocao(0);
  ProdPromocao.ListaBancas(true);
  label1.Caption := '';
end;

procedure TFrmPromocaoProd.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = vk_f2) then
  begin
    CheckBox2.Checked := not CheckBox2.Checked;
    if CheckBox2.Checked then
    begin
      ProdPromocao.ListaBancas(true);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      	DBLookupComboBox1.SetFocus;
    end
    else
    begin
      SpeedButton1.Enabled := false;
      SpeedButton1.Visible := false;
      SpeedButton2.Enabled := false;
      SpeedButton2.Visible := false;
      GroupBox26.Height := 169;
      ProdPromocao.ListaBancas(false);
      ProdPromocao.abreProdutosPromocao(0);
    end;
  end;
end;

procedure TFrmPromocaoProd.FormShow(Sender: TObject);
begin
  inherited;
  CheckBox2.Checked := false;
  SpeedButton1.Enabled := false;
  SpeedButton1.Visible := false;
  SpeedButton2.Enabled := false;
  SpeedButton2.Visible := false;
  GroupBox26.Height := 169;
end;

procedure TFrmPromocaoProd.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', ProdPromocao.buscas) then
    Exit;
  ProdPromocao.alterarValorPromocao(edmVlUnit.Valor, ProdPromocao.dataSet.FieldByName('NUM_BANCA').AsInteger);
  CheckBox2.Checked := false;
  CheckBox2Click(sender);
end;

procedure TFrmPromocaoProd.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', ProdPromocao.buscas) then
    Exit;
  ProdPromocao.retirarPromocao(DBLookupComboBox1.KeyValue);
  CheckBox2.Checked := false;
  CheckBox2Click(sender);
end;

end.

