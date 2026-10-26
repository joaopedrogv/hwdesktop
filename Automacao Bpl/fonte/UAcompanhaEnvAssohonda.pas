unit UAcompanhaEnvAssohonda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask,
  uPadrao,uDtmFabrica,UClassesFabrica,DB, Menus;

type
  TFrmEnvAssoHonda = class(TfrmPadrao)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu1: TPopupMenu;
    EnviarparaExcel1: TMenuItem;
    procedure EnviarparaExcel1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    function  RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
    function  NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEnvAssoHonda: TFrmEnvAssoHonda;
  cadfabhonda: TComunicaAssohonda;

implementation

uses
  uDtmAtivo, UcadintegraAssohonda, uDadosIni, uDataSet_OOP;



{$R *.dfm}

procedure TFrmEnvAssoHonda.BitBtn1Click(Sender: TObject);
begin
 if not vDadosIni.PesqPros('FAB009', 'CONSULTA', '', 'INTEGRA_ASSOHONDA', '',
    cadfabhonda.buscas, true) then
    Exit;

 cadfabhonda.abrecomunicaAssohonda(strtodate(maskedit1.text),strtodate(maskedit2.text))
end;

procedure TFrmEnvAssoHonda.BitBtn2Click(Sender: TObject);
begin
 try
   if not vDadosIni.PesqPros('FAB012', 'ENVIAR', '', 'INTEGRA_ASSOHONDA', '',
     cadfabhonda.buscas, true) then
      Exit;

   cadfabhonda.gravardadosinsform;
   vDadosIni.abreStatusProcessamento('','Enviando Estoques');
   cadfabhonda.enviaDadosWebservice(strtodate(MaskEdit3.text),1); // Enviando estoque
   Sleep(1000);
   vDadosIni.abreStatusProcessamento('','Enviando Vendas');
   cadfabhonda.enviaDadosWebservice(strtodate(MaskEdit3.text),2); // Enviando Vendas
   vDadosIni.fechaStatusProcessamento;

   vDadosIni.GravaAuditoria('FAB012', 'ENVIAR', 'SUCESSO', 'INTEGRA_ASSOHONDA',
   formatdatetime('dd/mm/yyyy', strtodate(MaskEdit3.text)), cadfabhonda.buscas)
 except
   vDadosIni.GravaAuditoria('FAB012', 'ENVIAR', 'FALHA', 'INTEGRA_ASSOHONDA',
   formatdatetime('dd/mm/yyyy', strtodate(MaskEdit3.text)), cadfabhonda.buscas)
 end;
end;

procedure TFrmEnvAssoHonda.BitBtn3Click(Sender: TObject);
begin
 if cadfabhonda.emTransacao then
   if Application.MessageBox('Existe Dados Alterados ou incluídos '+
   'sem salvar, Deseja salvar?', 'Confirmação', MB_YESNO
   + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
   begin
     cadfabhonda.Post;
     cadfabhonda.Apply;
     cadfabhonda.CommitaTransacao
   end
   else
   begin
    cadfabhonda.cancel;
    cadfabhonda.RollBackTransacao;
   end;
   close;
end;

procedure TFrmEnvAssoHonda.BitBtn4Click(Sender: TObject);
var
 vData: TDateTime;
 vCodModelo, vCodCor: Integer;
begin
  if not vDadosIni.PesqPros('FAB010', 'INCLUIR', '', 'INTEGRA_ASSOHONDA', '',
    cadfabhonda.buscas, true) then
    Exit;

  cadfabhonda.abreoufechatpmod(1);
  Application.CreateForm(TFrCadIntegraAssoHonda,FrCadIntegraAssoHonda);
  cadfabhonda.Insert;
  if FrCadIntegraAssoHonda.ShowModal = mrOk then
  begin
   vData := cadfabhonda.dataSet.FieldByName('DATA_ARQUIVO').AsDateTime;
   vCodModelo := cadfabhonda.dataSet.FieldByName('COD_MODELO').AsInteger;
   vCodCor := cadfabhonda.dataSet.FieldByName('COD_COR').AsInteger;

   if cadfabhonda.verificaduplicidade(
   cadfabhonda.dataSet.FieldByName('DATA_ARQUIVO').AsDateTime,
   cadfabhonda.dataSet.FieldByName('COD_MODELO').AsInteger,
   cadfabhonda.dataSet.FieldByName('COD_COR').AsInteger) then
   begin
    cadfabhonda.dataSet.FieldByName('DESC_MODELO').AsString:=
    cadfabhonda.Tipomodelo.FieldByName('DESCRICAO').AsString;
    cadfabhonda.dataSet.FieldByName('DESC_COR').AsString:=
    cadfabhonda.Codfabrica.FieldByName('DESCRICAO_COR').AsString;
    cadfabhonda.dataset.FieldByName('TP_INCLUSAO').AsString:='U';
    cadfabhonda.dataSet.FieldByName('ORDTIPO').AsInteger:=
    cadfabhonda.Tipomodelo.FieldByName('ORDTIPO').AsInteger;
    cadfabhonda.dataSet.FieldByName('COD_EMPRESA').AsString:=vDadosIni.codEmpresa;

    cadfabhonda.Post;
    cadfabhonda.Apply;
    cadfabhonda.CommitaTransacao;
    cadfabhonda.Close;
    cadfabhonda.Open;

    vDadosIni.GravaAuditoria('FAB011', 'INCLUIR', 'SUCESSO DATA ' +
     formatdatetime('dd/mm/yyyy', vData) + ' COD MODELO ' + IntToStr(vCodModelo) + ' COD COR ' + IntToStr(vCodCor),
     'INTEGRA_ASSOHONDA', formatdatetime('dd/mm/yyyy', vData), cadfabhonda.buscas)
   end
   else
   begin
     Application.MessageBox('Dados já cadastrado para o dia informado', 'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
     cadfabhonda.Cancel;

     vDadosIni.GravaAuditoria('FAB011', 'INCLUIR', 'FALHA DATA ' +
     formatdatetime('dd/mm/yyyy', vData) + ' COD MODELO ' + IntToStr(vCodModelo) + ' COD COR ' + IntToStr(vCodCor),
     'INTEGRA_ASSOHONDA', formatdatetime('dd/mm/yyyy', vData), cadfabhonda.buscas)
   end;
  end
  else
  begin
   cadfabhonda.Cancel;

   vDadosIni.GravaAuditoria('FAB011', 'INCLUIR', 'FALHA', 'INTEGRA_ASSOHONDA', '', cadfabhonda.buscas)
  end;
  cadfabhonda.abreoufechatpmod(2);
  FrCadIntegraAssoHonda.Free;
end;

procedure TFrmEnvAssoHonda.BitBtn5Click(Sender: TObject);
var
 vData: TDateTime;
 vCodModelo, vCodCor: Integer;
begin
 vData := cadfabhonda.dataSet.FieldByName('DATA_ARQUIVO').AsDateTime;
 vCodModelo := cadfabhonda.dataSet.FieldByName('COD_MODELO').AsInteger;
 vCodCor := cadfabhonda.dataSet.FieldByName('COD_COR').AsInteger;

 if trim(cadfabhonda.dataSet.FieldByName('TP_INCLUSAO').AsString) = 'S' then
 begin
   Application.MessageBox('Não permitido apagamento. Dados gerados pelo sistema!'+#13+
   ' Somente é permitido apagamento de dados cadastrados pelo usuário', 'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
 end
 else
 begin
   try
     if not vDadosIni.PesqPros('FAB011', 'EXCLUIR', '', 'INTEGRA_ASSOHONDA', '',
       cadfabhonda.buscas, true) then
       Exit;

     if Application.MessageBox('Tem certeza que deseja apagar estes dados?',
     'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
     begin
      cadfabhonda.Delete;
      vDadosIni.GravaAuditoria('FAB011', 'EXCLUIR', 'SUCESSO DATA ' +
        formatdatetime('dd/mm/yyyy', vData) + ' COD MODELO ' + IntToStr(vCodModelo) + ' COD COR ' + IntToStr(vCodCor),
        'INTEGRA_ASSOHONDA', formatdatetime('dd/mm/yyyy', vData), cadfabhonda.buscas)
     end;
   except
     vDadosIni.GravaAuditoria('FAB011', 'EXCLUIR', 'FALHA DATA ' +
     formatdatetime('dd/mm/yyyy', vData) + ' COD MODELO ' + IntToStr(vCodModelo) + ' COD COR ' + IntToStr(vCodCor),
     'INTEGRA_ASSOHONDA', formatdatetime('dd/mm/yyyy', vData), cadfabhonda.buscas)
   end;
 end;
end;

procedure TFrmEnvAssoHonda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (cadfabhonda.dataSet.FieldByName('COD_STATUS_RET').AsInteger <> 0) and (Column.FieldName = 'TP_INCLUSAO') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
end;

procedure TFrmEnvAssoHonda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { Não permite excluir }
  if  Key = VK_DELETE then
      Key := VK_NONAME
  {endif};

  { Não permite incluir }
  Key := NaoInsereDBGrid( TDBGrid(Sender), TDBGrid(Sender).DataSource.DataSet, Key );
  vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TFrmEnvAssoHonda.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TFrmEnvAssoHonda.EnviarparaExcel1Click(Sender: TObject);
begin
vDadosIni.montarExcel(DBGrid1, 'Exportação Venda_estoque Assohonda');
end;

procedure TFrmEnvAssoHonda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Assigned(cadfabhonda) then
  FreeAndNil(cadfabhonda);
 Action:=cafree;
end;

procedure TFrmEnvAssoHonda.FormCreate(Sender: TObject);
begin
   if cadfabhonda = nil then
    cadfabhonda:=TComunicaAssohonda.create;
   vDadosIni.vShiftClick := False;
   if vDadosIni.vModalOuChild <> 'M' then
     FormStyle := fsMDIChild;
   vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmEnvAssoHonda.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TFrmEnvAssoHonda.FormShow(Sender: TObject);
var
  vdataatual: Tdate;
  i: integer;
begin
   if DayOfWeek(cadfabhonda.dataatualserv-1) = 1 then
    vdataatual:=cadfabhonda.dataatualserv-2
   else
    vdataatual:=cadfabhonda.dataatualserv-1;
   for i := 0 to 9 do
    cadfabhonda.dataSet.Fields[i].ReadOnly:=false;

   cadfabhonda.MontaenvioAssohonda(vdataatual,1);
   MaskEdit1.Text:=DateToStr(vdataatual);
   MaskEdit2.Text:=DateToStr(vdataatual);
   MaskEdit3.Text:=DateToStr(vdataatual);
   cadfabhonda.abrecomunicaAssohonda(vdataatual);
   DBGrid1.DataSource:=dtmFabrica.DtcomunicaAssoHonda;
   for i := 0 to 9 do
   begin
    DBGrid1.Columns.Items[i].ReadOnly:=true;
    DBGrid1.Columns.Items[i].Color:=clGradientActiveCaption;
   end;
end;

{ Retorna o índice da última coluna visível }
function  TFrmEnvAssoHonda.RetIdxUltimaColVisivel(DBGrid: TDBGrid): integer;
var
  x: integer;
begin
  Result := -1;

  for x := DBGrid.Columns.Count-1 downto 0 do
  begin
    if  DBGrid.Columns.Items[x].Visible then
      begin
        Result := x;
        Break;
      end
    {endif};
  end;
end;

function  TFrmEnvAssoHonda.NaoInsereDBGrid(DBGrid: TDBGrid; DataSet: TDataSet; Key: Word): Word;
begin
  { Não deixa inserir registros no DBGrid caso:
    1- estiver em modo de edição: E
    1.1- se clicar na tecla "Insert"; OU
    1.2- se clicar na tecla "Seta para baixo" E estiver no último registro; OU
    1.2- se clicar na tecla "Tab" E estiver no último registro E estiver na
         última coluna visível. }
  Result := Key;

  if  dgEditing in DBGrid.Options then
    begin
      if  ( Key = VK_INSERT )
      or  ( (Key = VK_DOWN) and (DataSet.RecNo = DataSet.RecordCount) ) then
          Result := 0
      else
        if  ( Key = VK_TAB ) and ( DataSet.RecNo = DataSet.RecordCount ) then
          begin
            if  ( DBGrid.SelectedIndex = RetIdxUltimaColVisivel(DBGrid) ) then
                Result := 0
            {endif};
          end
        {endif};
      {endif}
    end
  {endif};
end;



initialization
  RegisterClass(TFrmEnvAssoHonda);
finalization
  UnRegisterClass(TFrmEnvAssoHonda);

end.
