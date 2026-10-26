unit UFichaInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ComCtrls, Mask, ExtCtrls, QRCtrls,
  QuickRpt, UDtmProdutos, UClassesProdutos, uEditMoeda, pQRBarCode, Grids,
  DBGrids, uEditHw;

type
  TFrmFichaInv = class(TfrmPadrao)
    PageControl1: TPageControl;
    tsFichaMovimentacao: TTabSheet;
    tsFichaInventario: TTabSheet;
    tsBalancoEstoque: TTabSheet;
    GroupBox37: TGroupBox;
    BitBtn8: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbDescProd: TLabel;
    lbLocacao: TLabel;
    lbContado: TLabel;
    EditNumFabProd: TEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    ProgressBar2: TProgressBar;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    MaskEdit3: TMaskEdit;
    ComboBox2: TComboBox;
    CheckBox2: TCheckBox;
    tsRelFichaInvBalanco: TTabSheet;
    CheckBox3: TCheckBox;
    lbInforme: TLabel;
    PageControl2: TPageControl;
    tsRelComEtiqueta: TTabSheet;
    tsRelSemEtiqueta: TTabSheet;
    qrpFichaInventario: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBandFichaInv: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrpFichaInvSemEtiqueta: TQuickRep;
    QRBand2: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    DetailBFichaInvSemEti: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel22: TQRLabel;
    BitBtn4: TBitBtn;
    EditMoeda1: TEditMoeda;
    ProgressBar1: TProgressBar;
    BitBtn5: TBitBtn;
    QRBarcode1: TQRBarcode;
    TabSheet_Grade: TTabSheet;
    Panel_Grade: TPanel;
    DBGrid_Grade: TDBGrid;
    Panel4: TPanel;
    Label10: TLabel;
    Edit_ProdutoGrade: TEdit;
    Panel5: TPanel;
    BitBtn_Grade_OK: TBitBtn;
    Label11: TLabel;
    Edit3: TEdit;
    Label12: TLabel;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    CheckBox4: TCheckBox;
    QrLbGrade: TQRLabel;
    QrLbGradComEti: TQRLabel;
    lbQtdGrade: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CheckBox5: TCheckBox;
    QRDBText5: TQRDBText;
    QRDBText10: TQRDBText;
    lbCodGrupo: TLabel;
    lbCodProd: TLabel;
    EditCodProd: TEdit;
    EditGrupoProd: TEditHw;
    BitBtn6: TBitBtn;
    CheckBox6: TCheckBox;
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid_GradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid_GradeDblClick(Sender: TObject);
    procedure BitBtn_Grade_OKClick(Sender: TObject);
    procedure qrpFichaInvSemEtiquetaAfterPrint(Sender: TObject);
    procedure BitBtn4Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tsFichaInventarioShow(Sender: TObject);
    procedure EditNumFabProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure EditNumFabProdExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qrpFichaInventarioPreview(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure tsBalancoEstoqueShow(Sender: TObject);
    procedure tsFichaMovimentacaoShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFichaInv: TFrmFichaInv;
  vFichaInv: TFichaInventario;
  _vBotaoOKGrade : Boolean;
  _FormGrade : TForm;
implementation
uses uDtmAtivo, DB, hw_utils;
{$R *.dfm}

procedure TFrmFichaInv.tsFichaInventarioShow(Sender: TObject);
begin
  inherited;
  GroupBox37.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
  	ComboBox1.SetFocus;
end;

procedure TFrmFichaInv.tsFichaMovimentacaoShow(Sender: TObject);
begin
  inherited;
  GroupBox37.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (maskedit1.CanFocus) then
  	MaskEdit1.SetFocus;
end;

procedure TFrmFichaInv.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO150', 'EMITIR', '','ESTOQUE_INI','', vFichaInv.buscas, true) then
//  if vDadosIni.PesqPros('PRO150', '', vFichaInv.buscas, true) then
  begin
    if PageControl1.ActivePage = tsBalancoEstoque then
    begin
      tsFichaMovimentacao.Enabled := false;
      tsFichaInventario.Enabled := false;
      if CheckBox3.Checked then
        vFichaInv.RelProdutosContados(true,  true, lbInforme, ProgressBar2)
      else
        vFichaInv.RelProdutosContados(false, true, lbInforme, ProgressBar2);
      tsFichaMovimentacao.Enabled := true;
      tsFichaInventario.Enabled := true;
    end;
  end;
end;

procedure TFrmFichaInv.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO151', 'CONFIRMAR', '','ESTOQUE_INI','', vFichaInv.buscas, true) then
//  if vDadosIni.PesqPros('PRO151', '', vFichaInv.buscas, true) then
  begin
    if Application.MessageBox('Deseja realmente confirmar o Balanço do dia?',
     'Confirmação', MB_YESNO + MB_ICONQUESTION +
    MB_DEFBUTTON1)
    = mrYES then
    begin
      tsFichaMovimentacao.Enabled := false;
      tsFichaInventario.Enabled := false;
      Panel3.Enabled := false;
      if vFichaInv.ConfirmaBalancoDiario then
         vDadosIni.GravaAuditoria('PRO151', 'CONFIRMAR BALANCO', 'SUCESSO', 'ESTOQUE_INI',
          '', vFichaInv.buscas)
  //      vDadosIni.GravaAuditoria('PRO151', 'SUCESSO', vFichaInv.buscas)
      else
       vDadosIni.GravaAuditoria('PRO151', 'CONFIRMAR BALANCO', 'FALHA', 'ESTOQUE_INI',
       '', vFichaInv.buscas);
  //      vDadosIni.GravaAuditoria('PRO151', 'FALHA', vFichaInv.buscas);
      tsFichaMovimentacao.Enabled := true;
      tsFichaInventario.Enabled := true;
      Panel3.Enabled := true;
    end;
  end;
end;

procedure TFrmFichaInv.BitBtn4Click(Sender: TObject);
begin
  inherited;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;

  if vDadosIni.PesqPros('PRO149', 'INCLUIR', '','ESTOQUE_INI','', vFichaInv.buscas, true) then
  begin
    if trim(maskedit4.text) <> '' then //'__-_-___' then
      vFichaInv.Loc1 := maskedit4.text;
    if trim(maskedit5.text) <> '' then //'__-_-___' then
      vFichaInv.Loc2 := maskedit5.text;
    if vFichaInv.ValidaInclusaoProd(Trunc(EditGrupoProd.AsValue), EditCodProd.Text,
    	EditNumFabProd.Text, EditMoeda1.Valor) then
    begin
      vFichaInv.Loc1 := '';
      vFichaInv.Loc2 := '';
    	lbCodGrupo.Caption := '';
      lbCodProd.Caption := '';
      lbDescProd.caption := '';
      lbLocacao.Caption := '';
      lbContado.Caption := '';
      lbQtdGrade.Caption:='';
      EditGrupoProd.AsValue := 0;
      EditCodProd.Text := '';
      maskedit4.text := '';
      maskedit5.text := '';
      EditMoeda1.valor := 0;
      vDadosIni.GravaAuditoria('PRO149', 'VALIDAR INCLUSÃO', 'SUCESSO', 'ESTOQUE_INI',
      '', vFichaInv.buscas);
    end
    else
     vDadosIni.GravaAuditoria('PRO149', 'VALIDAR INCLUSÃO', 'FALHA', 'ESTOQUE_INI',
     '', vFichaInv.buscas);
    if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
    	EditNumFabProd.setfocus;
  end;
end;

procedure TFrmFichaInv.BitBtn4Enter(Sender: TObject);
begin
  inherited;
  if trim(EditNumFabProd.Text)='' then
  begin
    Application.MessageBox('Código do Produto Vazio!', 'Aviso', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
    	EditNumFabProd.SetFocus;
    exit;
  end;
end;

procedure TFrmFichaInv.BitBtn6Click(Sender: TObject);
begin
  inherited;
	if vDadosIni.PesqPros('PRO150', 'EMITIR', '','ESTOQUE_INI','', vFichaInv.buscas, true) then
//  if vDadosIni.PesqPros('PRO150', '', vFichaInv.buscas, true) then
  begin
    if PageControl1.ActivePage = tsBalancoEstoque then
    begin
      tsFichaMovimentacao.Enabled := false;
      tsFichaInventario.Enabled := false;
      vFichaInv.RelProdutosContados(CheckBox3.Checked, CheckBox6.Checked, lbInforme, ProgressBar2);
      tsFichaMovimentacao.Enabled := true;
      tsFichaInventario.Enabled := true;
    end;
  end;
end;

procedure TFrmFichaInv.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO148', 'OK', '','ESTOQUE_INI','', vFichaInv.buscas, true) then
//  if vDadosIni.PesqPros('PRO148', '', vFichaInv.buscas, true) then
  begin
    if PageControl1.ActivePage = tsFichaMovimentacao then
    begin
      try
        Screen.Cursor := crHourGlass;
        vFichaInv.ImprimirFichaMovimentacao(MaskEdit1.Text, MaskEdit2.Text, ProgressBar1);
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else if PageControl1.ActivePage = tsFichaInventario then
    begin
      if Edit3.text <> '' then
      begin
        try
          StrToInt(Edit3.Text)
        except
         Application.MessageBox('Erro Grupo inicial informado!', 'Aviso', MB_OK + MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
         	 Edit3.setfocus;
         exit;
        end;
      end;
      if Edit4.text <> '' then
      begin
        try
          StrToInt(Edit4.Text)
        except
         Application.MessageBox('Erro Grupo Final informado!', 'Aviso', MB_OK + MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
         	 Edit4.setfocus;
         exit;
        end;
      end;
      if CheckBox5.Checked then
      begin
        QRLabel21.Caption := 'Grupo e Código';
        QRDBText8.Enabled := False;
        QRDBText5.Enabled := True;
        QRDBText10.Enabled := True;
      end
      else
      begin
        QRLabel21.Caption := 'Num. Fabricação';
        QRDBText8.Enabled := True;
        QRDBText5.Enabled := False;
        QRDBText10.Enabled := False;
      end;

      if CheckBox1.Checked then
      begin
        if CheckBox2.Checked then
          if ComboBox1.Text = 'Alfabética' then
            vFichaInv.ImprimirFichaInventarioComEtiquetaqrp(true, true, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked)
          else
            vFichaInv.ImprimirFichaInventarioComEtiquetaqrp(true, false, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked)
        else
        begin
          if ComboBox1.Text = 'Alfabética' then
            vFichaInv.ImprimirFichaInventarioComEtiquetaqrp(false, true, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked)
          else
            vFichaInv.ImprimirFichaInventarioComEtiquetaqrp(false, false, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked);
        end;
      end
      else
      begin
        if CheckBox2.Checked then
          if ComboBox1.Text = 'Alfabética' then
            vFichaInv.ImprimirFichaInventarioSemEtiquetaqrp(true, true, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked)
          else
            vFichaInv.ImprimirFichaInventarioSemEtiquetaqrp(true, false, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked)
        else
        begin
          if ComboBox1.Text = 'Alfabética' then
            vFichaInv.ImprimirFichaInventarioSemEtiquetaqrp(false, true, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked)
          else
            vFichaInv.ImprimirFichaInventarioSemEtiquetaqrp(false, false, strtoint(ComboBox2.Text), MaskEdit3.Text,edit3.text,edit4.text,CheckBox4.Checked);
        end;
      end;
    end;
  end;
end;

procedure TFrmFichaInv.BitBtn_Grade_OKClick(Sender: TObject);
begin
  inherited;
  _vBotaoOKGrade := true;
  TForm(Panel_Grade.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmFichaInv.DBGrid_GradeDblClick(Sender: TObject);
begin
  inherited;
BitBtn_Grade_OKClick(Sender);
end;

procedure TFrmFichaInv.DBGrid_GradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if key = VK_RETURN then
BitBtn_Grade_OKClick(Sender);
end;

procedure TFrmFichaInv.EditNumFabProdExit(Sender: TObject);
begin
  inherited;
  try
    if (ActiveControl = BitBtn3) or (ActiveControl = BitBtn5) then
      exit;

    if trim(vFichaInv.vCodBarra) <> trim(EditNumFabProd.Text) then
    begin
      EditGrupoProd.AsValue := 0;
      EditCodProd.text := '';
    end;

    if Trim(EditNumFabProd.Text) = '' then
    begin
      if (ActiveControl <> CheckBox3) and (ActiveControl <> CheckBox6)
      	and (ActiveControl <> EditMoeda1) and (ActiveControl <> MaskEdit4)
        and (ActiveControl <> MaskEdit5) and (ActiveControl <> BitBtn4) then
        exit;
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
          EditNumFabProd.Text := trim(vDadosIni.vPesquisa);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
          EditGrupoProd.AsValue := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
          EditCodProd.Text := trim(vDadosIni.vPesquisaCod_prod);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
    if Trim(EditNumFabProd.Text) <> '' then
    begin
      //Verificar Grade
      vFichaInv.vnomegrade:='';
      vFichaInv._ValidaGrade := false;
      if not (vFichaInv._AbreGradeProduto(Trunc(EditGrupoProd.AsValue),
        EditCodProd.Text,
        EditNumFabProd.Text)) then
      begin
        ShowErro('Produto não encontrado');
        if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
        	EditNumFabProd.SetFocus;
        exit;
      end
      else
      begin
        if vFichaInv.vPesqDescrProd then
          EditNumFabProd.Text := vFichaInv.buscas.FieldByName('NUM_FAB_PROD').AsString;

        EditGrupoProd.AsValue := vFichaInv.buscas.FieldByName('GRUPO_PROD').AsInteger;
        EditCodProd.Text := vFichaInv.buscas.FieldByName('COD_PROD').AsString;

        vFichaInv.vVisGrade._AbreVisGrade(vFichaInv.buscas.FieldByName('GRUPO_PROD').AsString,
          vFichaInv.buscas.FieldByName('COD_PROD').AsString,
          '0');
  //        vFichaInv.buscas.FieldByName('COD_GRADE').AsString);
        //Usuario informar grade

        vFichaInv.vcodGrade := 0;
        if not vFichaInv.vVisGrade.dataSet.IsEmpty then
        begin
          try
            _FormGrade := TForm.Create(Application);
            _FormGrade.Position := poScreenCenter;
            Panel_Grade.Parent := _FormGrade;
            _FormGrade.AutoSize := True;
            _FormGrade.AutoScroll := False;
            _FormGrade.KeyPreview := True;
            _FormGrade.BorderIcons:=[biSystemMenu];
            _FormGrade.Width := 510;
            _FormGrade.Height := 486;
            Edit_ProdutoGrade.Text := vFichaInv.buscas.FieldByName('DESCR_PROD').AsString;
            _vBotaoOKGrade := false;
            _FormGrade.ShowModal;
            vFichaInv.vnomegrade:=' GRADE: '+ vFichaInv.vVisGrade.dataSet.FieldByName('DESCRICAO').AsString;
            if not(_vBotaoOKGrade) then
            begin
              Application.MessageBox('É preciso informar a grade para prosseguir','Informação obrigatória',0);
              if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
              	EditNumFabProd.SetFocus;
              exit;
            end;
            vFichaInv.vcodGrade := vFichaInv.vVisGrade.dataSet.FieldByName('COD_GRADE').Asinteger;
            vFichaInv._ValidaGrade := vFichaInv.vcodGrade > 0;
          finally
            Panel_Grade.Parent := TabSheet_Grade;
            _FormGrade.Free;
            _FormGrade := nil;
          end;
        end;
      end;
      if vFichaInv.vEncontrouProd then
      begin
        if not vFichaInv.BuscasProd(vFichaInv.buscas.FieldByName('GRUPO_PROD').AsInteger,
          vFichaInv.buscas.FieldByName('COD_PROD').AsString) then
        begin
          EditNumFabProd.Clear;
          EditGrupoProd.AsValue := 0;
          EditCodProd.Clear;
          if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
          	EditNumFabProd.SetFocus;
          exit;
        end;
      end
      else
      begin
        if not vFichaInv.BuscasProd(EditNumFabProd.text) then
        begin
          EditNumFabProd.Clear;
          EditGrupoProd.AsValue := 0;
          EditCodProd.Clear;
          if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
          	EditNumFabProd.SetFocus;
          exit;
        end;
      end;
      if vFichaInv.ProdJaContado(Trunc(EditGrupoProd.AsValue),
        trim(EditCodProd.Text)) then
      begin
        if (ActiveControl <> BitBtn3) and (ActiveControl <> BitBtn4) and vFichaInv.editarEstoque then
        	if (Self.Enabled) and (Self.Visible) and (EditMoeda1.CanFocus) then
          	EditMoeda1.SetFocus;
  //      else
  //      begin
  //        EditMoeda1.Valor:=0;
  //        Edit1.Clear;
  //        if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
  //        	Edit1.SetFocus;
  //        exit;
  //      end;
      end
      else if not vFichaInv.vContar then
      begin
        EditMoeda1.Valor:=0;
        EditNumFabProd.Clear;
        EditGrupoProd.AsValue := 0;
        EditCodProd.Clear;
        if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
        	EditNumFabProd.SetFocus;
        exit;
      end;             
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
      	EditNumFabProd.SetFocus;
      exit;
    end;
  finally
    vFichaInv.vCodBarra := trim(EditNumFabProd.Text);
  end;
end;

procedure TFrmFichaInv.EditNumFabProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
//    if vDadosIni.PesqPros('PRO159', 'PESQUISAR', '','ESTOQUE_INI','', vFichaInv.buscas, true) then
    if vDadosIni.PesqPros('PRO159', 'F3 PARA PESQUISAR PRODUTOS','','PRODUTOS','', vFichaInv.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
          EditNumFabProd.Text := trim(vDadosIni.vPesquisa);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
          EditGrupoProd.AsValue := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
          EditCodProd.Text := trim(vDadosIni.vPesquisaCod_prod);
        vFichaInv.vCodBarra := trim(EditNumFabProd.Text);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end

end;

procedure TFrmFichaInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  vFichaInv.Cancel;
  vFichaInv.RollBackTransacao;
end;

procedure TFrmFichaInv.FormShow(Sender: TObject);
begin
  inherited;
  tsRelFichaInvBalanco.TabVisible := false;
  TabSheet_Grade.TabVisible := false;
  PageControl1.ActivePage := tsFichaMovimentacao;
  MaskEdit4.EditMask := vDadosIni.vMascaraLocacao;
  MaskEdit5.EditMask := vDadosIni.vMascaraLocacao;
  MaskEdit3.EditMask := copy(vDadosIni.vMascaraLocacao, 1, pos('-', vDadosIni.vMascaraLocacao) - 1) + ';0;_';
  lbCodGrupo.Caption := '';
  lbCodProd.Caption := '';
  lbDescProd.Caption := '';
  lbLocacao.Caption := '';
  lbContado.Caption := '';
  lbInforme.Caption := '';
  lbQtdGrade.Caption:='';
  if vFichaInv = nil then
    vFichaInv := TFichaInventario.Create;
end;

procedure TFrmFichaInv.qrpFichaInventarioPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Ficha de Inventário para Balanço');
end;

procedure TFrmFichaInv.qrpFichaInvSemEtiquetaAfterPrint(Sender: TObject);
begin
  inherited;
vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmFichaInv.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if ActiveControl = MaskEdit4 then
    Perform(WM_NEXTDLGCTL, 0, 0);
  MaskEdit4.Clear;
end;

procedure TFrmFichaInv.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if ActiveControl = MaskEdit5 then
    Perform(WM_NEXTDLGCTL, 0, 0);
  MaskEdit5.Clear;
end;

procedure TFrmFichaInv.tsBalancoEstoqueShow(Sender: TObject);
begin
  inherited;
  GroupBox37.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (EditNumFabProd.CanFocus) then
  	EditNumFabProd.SetFocus;
end;

end.

