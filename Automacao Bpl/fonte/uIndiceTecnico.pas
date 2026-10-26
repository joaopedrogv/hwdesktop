unit uIndiceTecnico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, uClassesIndiceTecnico,
  ExtCtrls, DBCtrls, UclassesProdutos;

type
  TfrmIndiceTecnico = class(TfrmPadrao)
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit_CodProd: TEdit;
    GroupBox2: TGroupBox;
    GroupBox_Dados: TGroupBox;
    Label_CodProduto: TLabel;
    Label_Quant: TLabel;
    Edit_CodProduto: TEdit;
    Edit_Quant: TEdit;
    GroupBox4: TGroupBox;
    DBGrid_IndiceTecnico: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox13: TGroupBox;
    Label22: TLabel;
    Label7: TLabel;
    Edit10: TEdit;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox7: TGroupBox;
    DBGrid3: TDBGrid;
    PageControl1: TPageControl;
    Label_UnidadeMP: TLabel;
    BitBtn70: TBitBtn;
    Panel1: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Edit_Descricao: TEdit;
    Edit_DescricaoMP: TEdit;
    Label_DescricaoMP: TLabel;
    Edit_UnidadeMP: TEdit;
    LabelSeq: TLabel;
    CheckCadSeq: TCheckBox;
    Memo_Receita: TMemo;
    GroupBox3: TGroupBox;
    BitBtn_InserirReceita: TBitBtn;
    Panel3: TPanel;
    BitBtn_OK: TBitBtn;
    BitBtn_cancelar: TBitBtn;
    Panel4: TPanel;
    BitBtn_Novo: TBitBtn;
    BitBtn_Editar: TBitBtn;
    BitBtn_Excluir: TBitBtn;
    BitBtn_Visualizar: TSpeedButton;
    procedure DBGrid_IndiceTecnicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn_VisualizarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn_cancelarClick(Sender: TObject);
    procedure BitBtn_EditarClick(Sender: TObject);
    procedure BitBtn_ExcluirClick(Sender: TObject);
    procedure BitBtn_NovoClick(Sender: TObject);
    procedure BitBtn_InserirReceitaClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn70Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn_OKClick(Sender: TObject);
    procedure Edit_CodProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit_CodProdutoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn15Click(Sender: TObject);
    procedure Edit_CodProdExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit_CodProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure VoltarBotoes;
  public
    { Public declarations }
    procedure _InserirCodigoProduto(CodProd: string);
  end;

var
  frmIndiceTecnico: TfrmIndiceTecnico;
  obIndiceTecnico: TIndiceTecnico;
  vacao: string;

implementation

uses
  udtmprodutos, uDtmAtivo, uDadosIni, DB, uDataSet_OOP, UCadReceitas, hw_utils,
  UVisualizarAcabadoMateriasPrimas;

{$R *.dfm}

procedure TfrmIndiceTecnico.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if obIndiceTecnico.selecionarIndiceTecnico then
  begin
    PageControl1.ActivePage := TabSheet1;

    Edit_CodProd.Text := dtmprodutos.qrBuscas02.FieldByName('num_fab_prod').AsString;
   // Edit_codprod.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
	    Edit_CodProduto.SetFocus;
  end
  else
    Application.MessageBox('Índice Técnico não selecionado, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmIndiceTecnico.BitBtn11Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  if (Self.Enabled) and (Self.Visible) and (Edit_codprod.CanFocus) then
	  Edit_codprod.SetFocus;
  obIndiceTecnico.abreIndiceTecnico;
end;

procedure TfrmIndiceTecnico.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('ITEC003', 'CONFIRMAR',
    ' PROD ACAB Grupo: ' + obIndiceTecnico.vgrupo_prod_acabado +
    ' Codigo: ' + obIndiceTecnico.vcod_prod_acabado, 'INDICE_TECNICO', obIndiceTecnico.vgrupo_prod_acabado +
    ' Codigo: ' + obIndiceTecnico.vcod_prod_acabado, obIndiceTecnico.buscas, True) then
    Exit;

  if(trim(Edit_CodProd.Text) = '') then
  begin
    Application.MessageBox(PChar('Campo requerido.' + chr(13) + 'Informe o código do produto acabado .'),
      'Atenção', MB_ICONEXCLAMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (Edit_CodProd.CanFocus) then
	    Edit_CodProd.SetFocus;       	
    Exit;
  end;

  if obIndiceTecnico.dataSet.IsEmpty then
  begin
    Application.MessageBox('Não encontrado itens no Índice Ténico!', 'Atenção',
      MB_ICONINFORMATION + MB_OK);

  end;

  if obIndiceTecnico.Post then
  begin
 //   Edit_codProd.Enabled := True;
   // Edit_DescricaoMP.Text := '';
  //  Edit_UnidadeMP.Text := '';
    //Edit_codProd.Text := '';
   // Edit_Descricao.Text := '';
   // Memo_Receita.Lines.Text := '';
   // if (Self.Enabled) and (Self.Visible) and (Edit_codProd.CanFocus) then
   // 	Edit_codProd.SetFocus;

    Application.MessageBox('Índice Tecnico salvo com sucesso !', 'Atenção', MB_ICONINFORMATION +
      MB_OK);
    //BitBtn3Click(Sender);
  //  VoltarBotoes;

  end
  else
  begin
    Application.MessageBox('Erro ao tentar gravar Índice Financeiro, verifique !', 'Atenção',
      MB_ICONERROR + MB_OK);
  end;

end;

procedure TfrmIndiceTecnico.BitBtn15Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmIndiceTecnico.BitBtn16Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
  if (Self.Enabled) and (Self.Visible) and (Edit10.CanFocus) then
	  Edit10.SetFocus;
end;

procedure TfrmIndiceTecnico.BitBtn_OKClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('ITEC001', 'INCLUIR',
    ' PROD ACAB Grupo: ' + obIndiceTecnico.vgrupo_prod_acabado +
    ' Codigo: ' + obIndiceTecnico.vcod_prod_acabado +
    ' - MAT PRIM Grupo: ' + obIndiceTecnico.vgrupo_prod_mp +
    ' Codigo: ' + obIndiceTecnico.vcod_prod_mp, 'INDICE_TECNICO', '',
    obIndiceTecnico.buscas, True) then
      Exit;

  if(trim(Edit_CodProduto.Text) = '') then
  begin
    Application.MessageBox(PChar('Campo requerido.' + chr(13) + 'Informe o código da matéria prima.'),
      'Atenção', MB_ICONEXCLAMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
	    Edit_CodProduto.SetFocus;
    Exit;
  end;

  try
    StrToCurr(Edit_Quant.Text);
  except
    Application.MessageBox(PChar('Valor inválido.' + chr(13) + 'Verifique o campo Quantidade.'),
      'Atenção', MB_ICONEXCLAMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (Edit_quant.CanFocus) then
    	Edit_quant.SetFocus;
    exit;
  end;

  if StrToCurr(Edit_quant.Text) < 0 then
  begin
    Application.MessageBox(PChar('Qtde < 0 ' + chr(13) + 'Verifique o campo Quantidade.'),
      'Atenção', MB_ICONEXCLAMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
    	Edit_CodProduto.SetFocus;
    exit;
  end;
  obIndiceTecnico.vquant_mp := StrToCurr(Edit_Quant.Text);

  if(vacao = 'INCLUIR') then
  begin
    if obIndiceTecnico.pesqitemjacadastrado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
      	Edit_CodProduto.SetFocus;
      exit;
    end;

    if obIndiceTecnico.inserirItem then
    begin
      ShowAtencao('Índice Tecnico salvo com sucesso !');

      if(CheckCadSeq.Checked) then
      	BitBtn_NovoClick(Sender)
      else
      begin
        VoltarBotoes;
      end;
    end;
  end
  else
  begin
    if (obIndiceTecnico._AlterarItem) then
    begin
      ShowAtencao('Índice Tecnico salvo com sucesso !');

      VoltarBotoes;
    end
    else
    begin
     BitBtn_cancelarClick(Sender);
    end;
  end;

  GroupBox_Dados.Visible := False;
  GroupBox4.Visible := True;
  GroupBox4.Align := alClient;
end;

procedure TfrmIndiceTecnico.BitBtn3Click(Sender: TObject);
begin
  inherited;
//  vDadosIni.GravaAuditoria('ITEC006', 'CANCELAR PRODUTO', 'CANCELAR PRODUTO', 'INDICE_TECNICO', vDadosIni.vNomeUsuario, obIndiceTecnico.buscas);
  obIndiceTecnico.CancelUpdates;
  VoltarBotoes;
  obIndiceTecnico._AbreIndice;
  if (Self.Enabled) and (Self.Visible) and (Edit_CodProd.CanFocus) then
	  Edit_CodProd.SetFocus;
end;

procedure TfrmIndiceTecnico.BitBtn70Click(Sender: TObject);
begin
  inherited;
  if obIndiceTecnico.PesquisaIndices_ProdutosAcabados then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
	    DBGrid2.SetFocus;
  end
  else
  begin
  	if (Self.Enabled) and (Self.Visible) and (Edit10.CanFocus) then
	    Edit10.SetFocus;
  end;
end;

procedure TfrmIndiceTecnico.BitBtn_cancelarClick(Sender: TObject);
begin
  //vDadosIni.GravaAuditoria('ITEC006', 'CANCEL AR MAT PRIMA', 'CANCELAR INC DE MAT PRIMA', 'INDICE_TECNICO', vDadosIni.vNomeUsuario, obIndiceTecnico.buscas);
  inherited;
  if((obIndiceTecnico.dataSet.State = dsInsert)or (obIndiceTecnico.dataSet.State = dsEdit)) then
  obIndiceTecnico.Cancel;
  obIndiceTecnico.RollBackTransacao;

  VoltarBotoes;
  //BitBtn3Click(Sender);
  GroupBox_Dados.Visible := False;
  GroupBox4.Visible := True;
  GroupBox4.Align := alClient;
end;

procedure TfrmIndiceTecnico.BitBtn_EditarClick(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('ITEC005', 'EDITAR', '', 'INDICE_TECNICO', '', obIndiceTecnico.buscas, true) then
   	Exit;

	if (not(obIndiceTecnico.dataSet.RecordCount > 0)) then
  begin
    Application.MessageBox('O indice técnico não possuí itens para edição','Indice técnico',0);
    exit;
  end;

  GroupBox_Dados.Visible := True;
  GroupBox4.Visible := False;
  GroupBox_Dados.Align := alClient;

  vacao := 'ALTERAR';
  BitBtn_Novo.Enabled := false;
  BitBtn_Editar.Enabled := false;
  BitBtn_Excluir.Enabled := false;
  BitBtn_Visualizar.Enabled := false;

  Label_CodProduto.Enabled := false;
  Label_DescricaoMP.Enabled := true;
  Label_Quant.Enabled := true;
  Label_UnidadeMP.Enabled := true;

  Edit_CodProduto.Enabled := false;
//   Edit_DescricaoMP.Enabled := true;
  Edit_Quant.Enabled := true;
  Edit_UnidadeMP.Enabled := true;

  BitBtn_OK.Enabled := true;
  BitBtn_cancelar.Enabled := true;

  DBGrid_IndiceTecnico.Enabled := false;

  Edit_CodProduto.Text := obIndiceTecnico._PesquisaNumFab;

  Edit_CodProdutoExit(Sender);

  if (Self.Enabled) and (Self.Visible) and (Edit_Quant.CanFocus) then
	  Edit_Quant.SetFocus;
end;

procedure TfrmIndiceTecnico.BitBtn_ExcluirClick(Sender: TObject);
begin
  inherited;
  if obIndiceTecnico.dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('ITEC002', 'EXCLUIR',
    ' PROD ACAB Grupo: ' + obIndiceTecnico.vgrupo_prod_acabado +
    ' Codigo: ' + obIndiceTecnico.vcod_prod_acabado +
    ' - MAT PRIM Grupo: ' + obIndiceTecnico.vgrupo_prod_mp +
    ' Codigo: ' + obIndiceTecnico.vcod_prod_mp, 'INDICE_TECNICO','',
    obIndiceTecnico.buscas, True) then
    Exit;

  obIndiceTecnico.vgrupo_prod_acabado := obIndiceTecnico.dataSet.FieldByName('grupo_prod_acabado').AsString;
  obIndiceTecnico.vcod_prod_acabado := obIndiceTecnico.dataSet.FieldByName('cod_prod_acabado').AsString;
  obIndiceTecnico.vgrupo_prod_mp := obIndiceTecnico.dataSet.FieldByName('grupo_prod_mprima').AsString;
  obIndiceTecnico.vcod_prod_mp := obIndiceTecnico.dataSet.FieldByName('cod_prod_mprima').AsString;
  obIndiceTecnico.vcodprod := obIndiceTecnico.dataSet.FieldByName('num_fab_mprima').AsString;
  if not obIndiceTecnico._ExcluirItem then
  	exit;

  Edit_CodProduto.Text := '';
  Edit_Quant.Text := '';
  Edit_DescricaoMP.Text := '';
  Edit_UnidadeMP.Text := '';
end;

procedure TfrmIndiceTecnico.BitBtn_InserirReceitaClick(Sender: TObject);
var
  vRecProd: TReceitasProd;
begin
  if not vDadosIni.PesqPros('ITEC007', 'INCLUIR RECEITA', '', 'INDICE_TECNICO', '', obIndiceTecnico.buscas, true) then
    Exit;

  try
    inherited;
    if(Edit_codProd.Text <> '') then
    begin
      Screen.Cursor := crHourGlass;
      vRecProd.CadReceita(0,
      strtoint(obIndiceTecnico.vgrupo_prod_acabado),
      obIndiceTecnico.vcod_prod_acabado);

      obIndiceTecnico.vcodprod := trim(Edit_CodProd.Text);
      if (obIndiceTecnico.PesquisaProduto(4)) then
      begin
        Memo_Receita.Lines.Text :=
        obIndiceTecnico._PesqRecProd(
        obIndiceTecnico.vProduto.buscas.FieldByName('cod_recprod').AsInteger);
      end;
    end
    else
    begin
      Application.MessageBox('Primeiramente deve se informar o produto.','Receita',0);
      if (Self.Enabled) and (Self.Visible) and (Edit_codProd.CanFocus) then
        Edit_codProd.setfocus;
    end;
  finally
    Screen.Cursor := crDefault;
  end
end;

procedure TfrmIndiceTecnico.BitBtn_NovoClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('ITEC004', 'NOVO', '', 'INDICE_TECNICO','', obIndiceTecnico.buscas, true) then
    Exit;

  GroupBox_Dados.Visible := True;
  GroupBox4.Visible := False;
  GroupBox_Dados.Align := alClient;

  vacao := 'INCLUIR';
  Edit_CodProduto.Text := '';
  Edit_Quant.Text := '';

 	BitBtn_Novo.Enabled := false;
  BitBtn_Editar.Enabled := false;
  BitBtn_Excluir.Enabled := false;
  BitBtn_Visualizar.Enabled := false;

  Label_CodProduto.Enabled := true;
  Label_DescricaoMP.Enabled := true;
  Label_Quant.Enabled := true;
  Label_UnidadeMP.Enabled := true;

  Edit_CodProduto.Enabled := true;
  Edit_Quant.Enabled := true;
  Edit_UnidadeMP.Enabled := true;

  BitBtn_OK.Enabled := true;
  BitBtn_cancelar.Enabled := true;

  DBGrid_IndiceTecnico.Enabled := false;

  if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
    Edit_CodProduto.SetFocus;
end;

procedure TfrmIndiceTecnico.Edit10Exit(Sender: TObject);
begin
  inherited;

  if Edit10.Text = '' then
  begin
    if (ActiveControl <> DBGrid2) and (ActiveControl <> DBGrid3) and
      (ActiveControl <> BitBtn10) and (ActiveControl <> BitBtn11) then
    begin
      Edit10.Text := vDadosIni.pesquisaRapida('Produtos', ' and tipo_item = ''04'' ', '');
      if (Self.Enabled) and (Self.Visible) and (Edit10.CanFocus) then
      	Edit10.SetFocus;
      Exit;
    end;
  end
  else
  begin
    with obIndiceTecnico do
    begin
      vcodprod := '';
      vcod_prod_pesq := '';
      vgrupo_prod_pesq := '';
    end;

    try
      StrToInt(Trim(Edit10.Text));
    except
      Application.MessageBox(PChar('Valor inválido.' + chr(13) +
        'Verifique o campo Código do Produto.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit10.CanFocus) then
      	Edit10.SetFocus;
      exit;
    end;

    obIndiceTecnico.vcodprod := Edit10.Text;

    if obIndiceTecnico.PesquisaProduto(4) then
    begin
      Label7.Caption := obIndiceTecnico.vProduto.buscas.FieldByName('descr_prod').AsString;

      with obIndiceTecnico do
      begin
        vcod_prod_pesq := vProduto.buscas.FieldByName('cod_prod').AsString;
        vgrupo_prod_pesq := vProduto.buscas.FieldByName('grupo_prod').AsString;
      end;

    end
    else
    begin
      Application.MessageBox('Produto não encontrado, verifique !', 'Atenção', MB_ICONINFORMATION
        + MB_OK);
      Label7.Caption := '';
      if (Self.Enabled) and (Self.Visible) and (Edit10.CanFocus) then
      	Edit10.SetFocus;
    end;
  end;
end;

procedure TfrmIndiceTecnico.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    Edit10.Text := vDadosIni.pesquisaRapida('PRODUTOS', ' and PRODUTOS.tipo_item = ''04'' ',
      'Pesquisa de produtos - Produto Acabado');
end;

procedure TfrmIndiceTecnico.Edit_CodProdExit(Sender: TObject);
begin
  inherited;

  obIndiceTecnico.vcodprod := '';
  if Edit_codProd.Text = '' then
  begin
    if (activecontrol <> BitBtn_OK) and (activecontrol <> BitBtn_cancelar) and
      (activecontrol <> BitBtn14) and (activecontrol <> BitBtn15) and
      (activecontrol <> BitBtn16) and (activecontrol <> DBGrid_IndiceTecnico) and
      (activecontrol <> TabSheet1) then

    begin
      Edit_CodProd.Text := vDadosIni.pesquisaRapida('Produtos', ' and tipo_item = ''04'' ', '');
      if (Self.Enabled) and (Self.Visible) and (Edit_codProd.CanFocus) then
      	Edit_codProd.SetFocus;
      exit;
    end;
  end
  else
  begin
    obIndiceTecnico.vcod_prod_acabado   := '';
    obIndiceTecnico.vgrupo_prod_acabado := '';

    obIndiceTecnico.vcodprod := Edit_CodProd.Text;
    if obIndiceTecnico.PesquisaProduto(4) then
    begin
      Edit_Descricao.Text :=
      trim(obIndiceTecnico.vProduto.buscas.FieldByName('descr_prod').AsString);
      obIndiceTecnico.vcod_prod_acabado   := obIndiceTecnico.vProduto.buscas.FieldByName('cod_prod').AsString;
      obIndiceTecnico.vgrupo_prod_acabado := obIndiceTecnico.vProduto.buscas.FieldByName('grupo_prod').AsString;
      obIndiceTecnico.vcod_prod_pesq      := obIndiceTecnico.vcod_prod_acabado;
      obIndiceTecnico.vgrupo_prod_pesq    := obIndiceTecnico.vgrupo_prod_acabado;

      obIndiceTecnico.PesquisaIndices_ProdutosAcabados;

      //Memo_Receita.Enabled :=true;
      Memo_Receita.Lines.Text :=
      obIndiceTecnico._PesqRecProd(
      obIndiceTecnico.vProduto.buscas.FieldByName('cod_recprod').AsInteger);
      //Memo_Receita.Enabled :=false;


      obIndiceTecnico.PesquisaIndice_materiaPrima(obIndiceTecnico.vcod_prod_acabado,
      obIndiceTecnico.vgrupo_prod_acabado);
    end
    else
    begin
      Application.MessageBox('Produto não encontrado, verifique !', 'Atenção', MB_ICONINFORMATION
        + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit_CodProd.CanFocus) then
      	Edit_CodProd.SetFocus;
      Edit_Descricao.Text := '';
    end;
  end;

end;

procedure TfrmIndiceTecnico.Edit_CodProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    Edit_codProd.Text := vDadosIni.pesquisaRapida('PRODUTOS', ' and PRODUTOS.tipo_item = ''04'' ',
      'Pesquisa de produtos - Produto acabados');
end;

procedure TfrmIndiceTecnico.Edit_CodProdutoExit(Sender: TObject);
begin
  inherited;
  if (activecontrol = BitBtn_cancelar) then
  	Exit;

  obIndiceTecnico.vcodprod := '';

  if Edit_CodProduto.Text = '' then
  begin
    if (activecontrol <> BitBtn_ok) and (activecontrol <> BitBtn_cancelar) and
      (activecontrol <> BitBtn14) and (activecontrol <> BitBtn15) and
      (activecontrol <> BitBtn16) and (activecontrol <> DBGrid_IndiceTecnico) and
      (activecontrol <> Edit_codProd) and (activecontrol <> BitBtn3) then
    begin
      Edit_CodProduto.Text := vDadosIni.pesquisaRapida('Produtos', ' and (tipo_item <> '''' or tipo_item is not null)', '');
      if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
      	Edit_CodProduto.SetFocus;
      exit;
    end;
  end
  else
  begin
    obIndiceTecnico.vcod_prod_mp := '';
    obIndiceTecnico.vgrupo_prod_mp := '';
    obIndiceTecnico.vtipoitem := '';

    if(trim(Edit_CodProd.Text) = trim(Edit_CodProduto.Text)) then
    begin
      Application.MessageBox('O produto acabado utlizado como matéria prima não pode ser o mesmo para o produto acabado informado acima, verifique !', 'Atenção', MB_ICONINFORMATION + MB_OK);
      Edit_CodProduto.Text := '';
      if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
      	Edit_CodProduto.SetFocus;
      Exit;
    end;

    obIndiceTecnico.vcodprod := Edit_CodProduto.Text;
    if obIndiceTecnico.pesquisaProdutoIndice then
    begin
      Edit_DescricaoMP.Text := trim(obIndiceTecnico.vProduto.buscas.FieldByName('descr_prod').AsString);
      Edit_UnidadeMP.Text := trim(obIndiceTecnico.vProduto.buscas.FieldByName('unidade').AsString);

      with obIndiceTecnico do
      begin
        vcod_prod_mp := vProduto.buscas.FieldByName('cod_prod').AsString;
        vgrupo_prod_mp := vProduto.buscas.FieldByName('grupo_prod').AsString;
      //  vtipoitem := vProduto.buscas.FieldByName('tipo_item').AsString;
      end;

      if (Self.Enabled) and (Self.Visible) and (Edit_Quant.CanFocus) then
	    	Edit_Quant.SetFocus;
    end
    else
    begin
      Application.MessageBox('Produto não encontrado, verifique !', 'Atenção', MB_ICONINFORMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit_CodProduto.CanFocus) then
      	Edit_CodProduto.SetFocus;
      Edit_DescricaoMP.Text := '';
      Edit_UnidadeMP.Text := '';
    end;
  end;

end;

procedure TfrmIndiceTecnico.Edit_CodProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    Edit_CodProduto.Text := vDadosIni.pesquisaRapida('PRODUTOS', 'and (tipo_item <> '''' or tipo_item is not null) ',
      'Pesquisa de produtos - Matéria-prima');
end;

procedure TfrmIndiceTecnico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmIndiceTecnico := nil;
  if(obIndiceTecnico <> nil) then
  obIndiceTecnico.Cancel;
  obIndiceTecnico.Free;
end;

procedure TfrmIndiceTecnico.FormCreate(Sender: TObject);
begin
  inherited;
  obIndiceTecnico := TIndiceTecnico.create;
end;

procedure TfrmIndiceTecnico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

 {1} if (key = vk_f2) and CheckCadSeq.Enabled then
  begin
  if PageControl1.ActivePage = TabSheet1 then
      self.CheckCadSeq.Checked := not self.CheckCadSeq.Checked;
    {2}if CheckCadSeq.Checked then
    begin
      self.CheckCadSeq.Font.Color := clRed;
      LabelSeq.Font.Color := clRed;
    end{2}
    else
    begin{2}
      LabelSeq.Font.Color := clTeal;
      self.CheckCadSeq.Font.Color := clTeal;
    end;{2}
    self.CheckCadSeq.Refresh;
  end{1}
end;

procedure TfrmIndiceTecnico.FormShow(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  obIndiceTecnico._AbreIndice;
  PageControl1.ActivePage := TabSheet1;
  VoltarBotoes;

  GroupBox_Dados.Visible := False;
  GroupBox4.Visible := True;
  GroupBox4.Align := alClient;

  if (Self.Enabled) and (Self.Visible) and (Edit_codProd.CanFocus) then
    Edit_CodProd.SetFocus;

  obIndiceTecnico.abreIndiceTecnico;
end;

procedure TfrmIndiceTecnico.BitBtn_VisualizarClick(Sender: TObject);
begin
	try
    if (vDadosIni.vEmp.vUsarProducao = 'S') then
    begin
      if vDadosIni.produtoAcabadoPrimaTemGrade(
        obIndiceTecnico.buscas,
        StrToInt(obIndiceTecnico.vgrupo_prod_acabado),
        obIndiceTecnico.vcod_prod_acabado,
        0,
        '') then
      begin
        if vDadosIni.existeGradeProducao(
          obIndiceTecnico.buscas,
          StrToInt(obIndiceTecnico.vgrupo_prod_acabado),
          obIndiceTecnico.vcod_prod_acabado,
          0,
          '') then
        begin
          if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
          	obIndiceTecnico.buscas,
            StrToInt(obIndiceTecnico.vgrupo_prod_acabado),
            obIndiceTecnico.vcod_prod_acabado,
            0,
            0,
            '',
            0,
            true) then
              exit;
        end;
      end;
    end;

    Application.CreateForm(TFrmVisualizarAcabadoMateriasPrimas, FrmVisualizarAcabadoMateriasPrimas);
    vDadosIni.vPesquisaGrupo_prod := obIndiceTecnico.vgrupo_prod_acabado;
    vDadosIni.vPesquisaCod_prod := obIndiceTecnico.vcod_prod_acabado;
    FrmVisualizarAcabadoMateriasPrimas.vIndTec := obIndiceTecnico;
    if FrmVisualizarAcabadoMateriasPrimas.ShowModal <> IDOK then
      exit;
  finally
    if Assigned(FrmVisualizarAcabadoMateriasPrimas) then
    	FreeAndNil(FrmVisualizarAcabadoMateriasPrimas);
  end;
end;

procedure TfrmIndiceTecnico.DBGrid_IndiceTecnicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	BitBtn_EditarClick(Sender)
  else if Key = VK_DELETE then
    BitBtn_ExcluirClick(Sender)
  else if Key = VK_INSERT then
  	BitBtn_NovoClick(Sender);
end;

procedure TfrmIndiceTecnico.VoltarBotoes;
begin
  Edit_CodProduto.Text := '';
  Edit_Quant.Text := '';
  Edit_DescricaoMP.Text:= '';
  Edit_UnidadeMP.Text := '';

  BitBtn_Novo.Enabled := true;
  BitBtn_Editar.Enabled := true;
  BitBtn_Excluir.Enabled := true;
  BitBtn_Visualizar.Enabled := true;
  
  Label_CodProduto.Enabled := false;
  Label_DescricaoMP.Enabled := false;
  Label_Quant.Enabled := false;
  Label_UnidadeMP.Enabled := false;

  Edit_CodProduto.Enabled := false;
//  Edit_DescricaoMP.Enabled := false;
  Edit_Quant.Enabled := false;
  Edit_UnidadeMP.Enabled := false;

  BitBtn_OK.Enabled := false;
  BitBtn_cancelar.Enabled := false;

  DBGrid_IndiceTecnico.Enabled := true;

  if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo.CanFocus) then
	  BitBtn_Novo.SetFocus;
end;

procedure TfrmIndiceTecnico._InserirCodigoProduto(CodProd: string);
begin
  if(not(CodProd = '')) then
  begin
    Edit_CodProd.Text := CodProd;
    if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo.CanFocus) then
    	BitBtn_Novo.SetFocus;
  end;
end;

end.

