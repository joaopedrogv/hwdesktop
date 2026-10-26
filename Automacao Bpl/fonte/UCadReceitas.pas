unit UCadReceitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Grids, DBGrids, Buttons,udtmprodutos, DBCtrls,
  Mask, uclassesprodutos, uDtmAtivo, ExtCtrls;

type
  TfrmCadReceitas = class(TfrmPadrao)
    DBGrid_receitas: TDBGrid;
    GroupBox_Dados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn_cancelar: TBitBtn;
    BitBtn_ok: TBitBtn;
    Label3: TLabel;
    DBMemo_Receita: TDBMemo;
    DBEdit_Titulo: TDBEdit;
    DBEdit_Data: TDBEdit;
    GroupBox_botoes: TGroupBox;
    BitBtn_Utilizar: TBitBtn;
    BitBtn_Nova: TBitBtn;
    BitBtn_Editar: TBitBtn;
    BitBtn_Excluir: TBitBtn;
    Panel1: TPanel;
    BitBtn6: TBitBtn;
    procedure DBGrid_receitasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo_ReceitaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn_cancelarClick(Sender: TObject);
    procedure BitBtn_okClick(Sender: TObject);
    procedure BitBtn_UtilizarClick(Sender: TObject);
    procedure BitBtn_EditarClick(Sender: TObject);
    procedure BitBtn_ExcluirClick(Sender: TObject);
    procedure BitBtn_NovaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure  _PesquisaReceitas(CodProd : string; CodGrupo : integer);
  end;

var
  frmCadReceitas: TfrmCadReceitas;
  _vReceita : TReceitasProd;

implementation


{$R *.dfm}

procedure TfrmCadReceitas.BitBtn_UtilizarClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO216', 'UTILIZAR', '', 'PRODUTOS',
  _vReceita.dataSet.FieldByName('COD_RECEITA').AsString
    + 'PROD: ' + inttostr(_vReceita._vGrupoProd_I) + '-'
    + _vReceita._vCodProd_I, _vReceita.buscas, true) then
    Exit;

     if (not(_vReceita.dataSet.RecordCount >0)) then
  begin
     Application.MessageBox('É preciso cadastrar a receita para utilizar no produto','Receita',0);
  Exit;
  end;

  if _vReceita.utilizar then
  begin
  Application.MessageBox('A receita foi vinculada ao produto','Receita',0);
  Exit;
   // GroupBox24.Visible := False;
//    if tsReceitaAss.Tag = 1 then
//      PageControl1.ActivePage := TabSheet1
//    else
//    begin
//      PageControl1.ActivePage := TabSheet2;
//      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//        DBGrid1.SetFocus;
//    end;
  end;
  
end;

procedure TfrmCadReceitas.DBGrid_receitasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
  	BitBtn_EditarClick(Sender)
  else if Key = VK_DELETE then
  	BitBtn_ExcluirClick(Sender)
  else if Key = VK_INSERT then
  	BitBtn_NovaClick(Sender);
end;

procedure TfrmCadReceitas.DBMemo_ReceitaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadReceitas.FormCreate(Sender: TObject);
begin
  inherited;
  if _vReceita = nil then
   _vReceita := TReceitasProd.create;
end;

procedure TfrmCadReceitas._PesquisaReceitas(CodProd: string; CodGrupo: integer);
begin
       _vReceita._vCodProd_I := CodProd;
       _vReceita._vGrupoProd_I := CodGrupo;

     _vReceita._AbreReceitas(CodProd,CodGrupo);
end;

procedure TfrmCadReceitas.BitBtn_NovaClick(Sender: TObject);
begin
inherited;
  if not vDadosIni.PesqPros('PRO213', 'ADICIONAR RECEITA', '', 'PRODUTOS',
  '', _vReceita.buscas, true) then
//  if not vDadosIni.PesqPros('PRO082', '', produto.buscas, true) then
    Exit;

  if _vReceita.Insert then
  begin
    GroupBox_Dados.Enabled := true;
    DBEdit_Data.Text := DateToStr(vDadosIni.getDataBanco(_vReceita.buscas));
    GroupBox_botoes.Enabled := false;
    BitBtn_cancelar.Enabled := true;
    //    BitBtn29.Enabled := false;
    BitBtn_ok.Enabled := true;

  	if (Self.Enabled) and (Self.Visible) and (DBEdit_Titulo.CanFocus) then
    	DBEdit_Titulo.SetFocus;
  end;
end;

procedure TfrmCadReceitas.BitBtn_EditarClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO081', 'ADICIONAR', '', 'PRODUTOS',
  _vReceita.dataSet.FieldByName('COD_RECEITA').AsString,
  _vReceita.buscas, true) then
//  if not vDadosIni.PesqPros('PRO081', Produto.dataSet.FieldByName('COD_RECEITA').AsString,
//    produto.buscas, true) then
    Exit;
  if _vReceita.Edit then
  begin
    GroupBox_Dados.Enabled := true;
    BitBtn_cancelar.Enabled := true;
    BitBtn_ok.Enabled := true;
    GroupBox_botoes.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBMemo_Receita.CanFocus) then
    	DBMemo_Receita.SetFocus;

    //BitBtn28.Enabled := true;
    //    BitBtn29.Enabled := false;
    //BitBtn34.Enabled := true;
  end;
end;

procedure TfrmCadReceitas.BitBtn_ExcluirClick(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('PRO215', 'DELETAR RECEITA', '', 'PRODUTOS',
      _vReceita.dataSet.FieldByName('COD_RECEITA').AsString, _vReceita.buscas, true) then
    Exit;

    if(not(_vReceita.dataSet.RecordCount > 0)) then
    begin
         Application.MessageBox('Selecione a receita para exclusão','Receitas',0);
         Exit;
    end;

  _vReceita.Delete;
end;

procedure TfrmCadReceitas.BitBtn6Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadReceitas.BitBtn_cancelarClick(Sender: TObject);
begin
if not vDadosIni.PesqPros('PRO218', 'CANCELAR RECEITA', '', 'REC_ASS',
      _vReceita.dataSet.FieldByName('COD_RECEITA').AsString, _vReceita.buscas, true) then
    Exit;
  _vReceita.Cancel;
  BitBtn_cancelar.Enabled := false;
  BitBtn_ok.Enabled := false;
  GroupBox_Dados.Enabled := false;
  GroupBox_botoes.Enabled := true;
 // BitBtn34.Enabled := False;
  //BitBtn28.Enabled := false;
  //  BitBtn29.Enabled := true;
  //GroupBox_botoes.Enabled := true;
end;

procedure TfrmCadReceitas.BitBtn_okClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO084', 'SALVAR', '', 'PRODUTOS', _vReceita.dataSet.FieldByName('COD_RECEITA').AsString, _vReceita.buscas, true) then
//  if not vDadosIni.PesqPros('PRO084', Produto.dataSet.FieldByName('COD_RECEITA').AsString,
//    produto.buscas, true) then
    Exit;

    _vReceita.dataset.fieldbyname('cod_prod').AsString := _vReceita._vCodProd_I;

    _vReceita.dataset.fieldbyname('cod_grupo').asinteger := _vReceita._vGrupoProd_I;

    _vReceita.dataset.fieldbyname('cod_empresa').AsString := vDadosIni.codempresa;

  if _vReceita.Post then
  begin
    GroupBox_botoes.Enabled := true;
    GroupBox_Dados.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid_receitas.CanFocus) then
    	DBGrid_receitas.SetFocus;
    BitBtn_cancelar.Enabled := false;
    BitBtn_ok.Enabled := false;
    //    BitBtn29.Enabled := true;
  end;
end;

end.
