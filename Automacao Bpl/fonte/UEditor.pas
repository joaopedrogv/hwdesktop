unit UEditor;
(************************ Hw Sistemas e Computadores ***************************
Para exibir o formulário normalmente deve apresentar os paramentros:
->   _TipodeRegistro  - Este paramentro define qual o tipo de contrato a ser
exibido, podendo ser adaptado aos demais que aparecerem no software

Para exibir o formulário em modo de edição(carregando o contrato na tela) deve
apresentar os paramentros:

->  FCodContrato - Código do contrato
->  FNomeArquivo - Nome do contrato(descrição)
->  FTexto - Conteúdo do contrato
->  _TipodeRegistro -  Este paramentro define qual o tipo de contrato a ser
exibido, podendo ser adaptado aos demais que aparecerem no software
*******************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, Menus, StdCtrls, ToolWin, ComCtrls, ActnList,
  ImgList, uclassescadastrosbasicos, DBClient;

type
  TfrmEditor = class(TfrmPadrao)
    RichEdit_Editor: TRichEdit;
    StandardToolBar: TToolBar;
    ToolButton_Novo: TToolButton;
    ToolButton_Abrir: TToolButton;
    ToolButton_Salvar: TToolButton;
    ToolButton_Imprimir: TToolButton;
    ToolButton5: TToolButton;
    ToolButton_Recortar: TToolButton;
    ToolButton_Copiar: TToolButton;
    ToolButton_Colar: TToolButton;
    ToolButton_Voltar: TToolButton;
    ToolButton10: TToolButton;
    Combobox_Fonte: TComboBox;
    ToolButton11: TToolButton;
    Edit_TamanhoFonte: TEdit;
    UpDown_TamanhoFonte: TUpDown;
    ToolButton2: TToolButton;
    ToolButton_Negrito: TToolButton;
    ToolButton_Italico: TToolButton;
    ToolButton_Underline: TToolButton;
    ToolButton16: TToolButton;
    ToolButton_AlinhaEsquerda: TToolButton;
    ToolButton_AlinhaCentro: TToolButton;
    ToolButton_AlinhaDireita: TToolButton;
    ToolButton20: TToolButton;
    ToolButton_Marcadores: TToolButton;
    MainMenu_Editor: TMainMenu;
    FileMenu: TMenuItem;
    NovoArquivo: TMenuItem;
    NovoRegistro: TMenuItem;
    AbrirArquivo: TMenuItem;
    AbrirRegistro: TMenuItem;
    Salvar: TMenuItem;
    SalvarComo: TMenuItem;
    N1: TMenuItem;
    Imprimir: TMenuItem;
    N4: TMenuItem;
    Sair: TMenuItem;
    EditMenu: TMenuItem;
    Desfazer: TMenuItem;
    N2: TMenuItem;
    Recortar: TMenuItem;
    Copiar: TMenuItem;
    Colar: TMenuItem;
    N5: TMenuItem;
    Fonte: TMenuItem;
    Formartar1: TMenuItem;
    InserirMacro: TMenuItem;
    Ajuda1: TMenuItem;
    SobreEditor: TMenuItem;
    OpenDialog_Editor: TOpenDialog;
    SaveDialog_Editor: TSaveDialog;
    PrintDialog_Editor: TPrintDialog;
    FontDialog_Editor: TFontDialog;
    ImageList_Editor: TImageList;
    ReplaceDialog_Editor: TReplaceDialog;
    Ruler: TPanel;
    FirstInd: TLabel;
    LeftInd: TLabel;
    RulerLine: TBevel;
    RightInd: TLabel;
    StatusBar_Editor: TStatusBar;
    Salvarregistro1: TMenuItem;
    Salvarcomoregistro1: TMenuItem;
    procedure Salvarregistro1Click(Sender: TObject);
    procedure Salvarcomoregistro1Click(Sender: TObject);
    procedure Edit_TamanhoFonteKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_TamanhoFonteChange(Sender: TObject);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RightIndMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure LeftIndMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FirstIndMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RulerResize(Sender: TObject);
    procedure AbrirRegistroClick(Sender: TObject);
    procedure RichEdit_EditorChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton_MarcadoresClick(Sender: TObject);
    procedure ToolButton_AlinhaDireitaClick(Sender: TObject);
    procedure ToolButton_AlinhaCentroClick(Sender: TObject);
    procedure ToolButton_AlinhaEsquerdaClick(Sender: TObject);
    procedure ToolButton_UnderlineClick(Sender: TObject);
    procedure ToolButton_ItalicoClick(Sender: TObject);
    procedure ToolButton_NegritoClick(Sender: TObject);
    procedure Combobox_FonteChange(Sender: TObject);
    procedure ToolButton_VoltarClick(Sender: TObject);
    procedure ToolButton_ColarClick(Sender: TObject);
    procedure ToolButton_CopiarClick(Sender: TObject);
    procedure ToolButton_ImprimirClick(Sender: TObject);
    procedure ToolButton_RecortarClick(Sender: TObject);
    procedure ToolButton_SalvarClick(Sender: TObject);
    procedure ToolButton_AbrirClick(Sender: TObject);
    procedure ToolButton_NovoClick(Sender: TObject);
    procedure SobreEditorClick(Sender: TObject);
    procedure InserirMacroClick(Sender: TObject);
    procedure FonteClick(Sender: TObject);
    procedure ColarClick(Sender: TObject);
    procedure CopiarClick(Sender: TObject);
    procedure RecortarClick(Sender: TObject);
    procedure DesfazerClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure SalvarComoClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
    procedure AbrirArquivoClick(Sender: TObject);
    procedure NovoRegistroClick(Sender: TObject);
    procedure NovoArquivoClick(Sender: TObject);
  private
    { Private declarations }
    FTipoTexto: string; // tipo de texto em edicao( arquivo ou carta-BD
    FAlterando: Boolean;
    FDragOfs: Integer;
    FDragging: Boolean;
    procedure _AtribuirNomedoArquivo(const FileName: string);
    procedure _AtribuirModificadoStatusBar(Valor : Boolean);
    procedure _ChecarSalvarArquivo;
    procedure _GravaContratoBD;
    procedure _ExecutarExibirArquivo(const AFileName: string);
    function _TextoAtual: TTextAttributes;
    procedure _MudarSelecao(Sender: TObject);
    procedure _AtualizarPosicaoCursor;
    function _Localizar(ENCONTRAR_TAG: string): Integer;
    procedure _TrocaMacros(Macro, Valor: string);
    function _FimEditor: Boolean;
    function _PegarValorCampo(cds: TClientDataSet; tab, Campo: string): string;
    procedure _ExibirFormulario(cds: TClientDataSet; Tabela, Tipo: string);
    procedure _ObterNomeFontes;
    procedure _ReguadeInstalacao;
    procedure _AtribuirEdicaoRedirecionamento;
    procedure _IniciarEditor;
    procedure _ChecarSalvar;
    procedure _ChecarSalvarRegistro;
  public
    { Public declarations }
    FCodContrato: Integer;
    FNomeArquivo: string;
    _TipodeRegistro : char;
    FTexto : string;
    _NOVO : boolean; //Indica se é um registro no Salvar como...
    procedure _NovoArquivoOuRegistro(TipoDeArquivo : string);


  end;

var
  frmEditor: TfrmEditor;
  vEditor : TEditor;
implementation
             uses
             udtmcadastrosbasicos, uDtmAtivo,uDadosIni,uDataSet_OOP,UCadContrato,
             RichEdit,uListar,ShellAPI, DB;

resourcestring
  sSaveChanges = 'Salvar alterações %s?';
  sOverWrite = 'Sbrescrever %s';
  _SemNome = 'Sem nome';
  _Modificado = 'Modificado';
  sColRowInfo = 'Linha: %3d   Coluna: %3d';
{$R *.dfm}

const
  RulerAdj = 4 / 3;
  GutterWid = 6;

procedure TfrmEditor.NovoRegistroClick(Sender: TObject);
begin
  inherited;
  _NovoArquivoOuRegistro('REGISTRO'); // salva atual
  FCodContrato := 0; 
end;

procedure TfrmEditor.RecortarClick(Sender: TObject);
begin
  inherited;
  RichEdit_Editor.CutToClipboard;
end;

procedure TfrmEditor.RichEdit_EditorChange(Sender: TObject);
begin
  inherited;
  _AtribuirModificadoStatusBar(RichEdit_Editor.Modified);
end;

procedure TfrmEditor.RightIndMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs;
  FDragging := True;
end;

procedure TfrmEditor.RightIndMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if FDragging then
    TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs
end;

procedure TfrmEditor.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FDragging := False;
  RichEdit_Editor.Paragraph.RightIndent :=
  Trunc((Ruler.ClientWidth - RightInd.Left + FDragOfs - 2) / RulerAdj)
   - 2 * GutterWid;
  _MudarSelecao(Sender);
end;

procedure TfrmEditor.RulerResize(Sender: TObject);
begin
  inherited;
  RulerLine.Width := Ruler.ClientWidth - (RulerLine.Left * 2);
end;

procedure TfrmEditor.SairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEditor.SalvarClick(Sender: TObject);
begin
  inherited;
_IniciarEditor;

    if (FNomeArquivo = _SemNome) or (FTipoTexto = 'REGISTRO') then
      SalvarComoClick(Sender)
    else
    begin
      RichEdit_Editor.Lines.SaveToFile(FNomeArquivo);
      RichEdit_Editor.Modified := False;
      _AtribuirModificadoStatusBar(False);
    end;

end;

procedure TfrmEditor.SalvarComoClick(Sender: TObject);
var
TipoTextoAnterior : string;
begin
  inherited;

  _IniciarEditor;
  TipoTextoAnterior := FtipoTexto;
  FTipoTexto := 'ARQUIVO';
    if SaveDialog_Editor.Execute then
    begin
      if FileExists(SaveDialog_Editor.FileName) then
        if MessageDlg(Format(sOverWrite, [SaveDialog_Editor.FileName]),
          mtConfirmation, mbYesNoCancel, 0) <> idYes then Exit;
      RichEdit_Editor.Lines.SaveToFile(SaveDialog_Editor.FileName);
      _AtribuirNomedoArquivo(SaveDialog_Editor.FileName);
      RichEdit_Editor.Modified := False;
      _AtribuirModificadoStatusBar(False);
    end
    else
    ftipotexto := tipotextoanterior;
end;

procedure TfrmEditor.Salvarcomoregistro1Click(Sender: TObject);
begin
  inherited;
_IniciarEditor;
 _NOVO := true;
_GravaContratoBD;
end;

procedure TfrmEditor.Salvarregistro1Click(Sender: TObject);
begin
  inherited;
_IniciarEditor;
_GravaContratoBD;
end;

procedure TfrmEditor.SobreEditorClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Editor de Texto - HW Sistemas');
end;

procedure TfrmEditor.ToolButton_AbrirClick(Sender: TObject);
begin
  inherited;

  if(FTipoTexto = 'ARQUIVO') then
  begin

  _ChecarSalvarArquivo;
  if OpenDialog_Editor.Execute then
  begin
    _ExecutarExibirArquivo(OpenDialog_Editor.FileName);
    RichEdit_Editor.ReadOnly := ofReadOnly in OpenDialog_Editor.Options;
  end
  end
  else
  begin
    try
      Application.CreateForm(TfrmListar, FrmListar);
      frmListar._Tabela_ := 'CONTRATO';
      frmListar._TipodeRegistro_:= 'V';
      FrmListar.ShowModal;
          if FrmListar._Registro <> '' then
      begin
        RichEdit_Editor.Lines.Clear;
        // se nao stever vazio...
        FTipoTexto := 'REGISTRO';
        FCodContrato := StrToInt(FrmListar._Registro);
        _AtribuirNomedoArquivo(DtmCadBasicos.cdsContratos.FieldByName('DESCRICAO').Text);
        RichEdit_Editor.Text:= DtmCadBasicos.cdsContratosTEXTO.AsString;
        RichEdit_Editor.Modified := False;
         _AtribuirModificadoStatusBar(False);
      end;
    except
    DtmCadBasicos.cdsContratos.Active := False;
    FrmListar.Free;
    end;
     DtmCadBasicos.cdsContratos.Active := False;
     FrmListar.Free;
  end;
end;

procedure TfrmEditor.ToolButton_AlinhaCentroClick(Sender: TObject);
begin
  inherited;
if FAlterando then Exit;
  RichEdit_Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfrmEditor.ToolButton_AlinhaDireitaClick(Sender: TObject);
begin
  inherited;
if FAlterando then Exit;
  RichEdit_Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfrmEditor.ToolButton_AlinhaEsquerdaClick(Sender: TObject);
begin
  inherited;
if FAlterando then Exit;
  RichEdit_Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TfrmEditor.ToolButton_ColarClick(Sender: TObject);
begin
  inherited;
  RichEdit_Editor.PasteFromClipboard;
end;

procedure TfrmEditor.ToolButton_CopiarClick(Sender: TObject);
begin
  inherited;
  RichEdit_Editor.CopyToClipboard;
end;

procedure TfrmEditor.ToolButton_ImprimirClick(Sender: TObject);
begin
  inherited;
  if PrintDialog_Editor.Execute then
    RichEdit_Editor.Print(FNomeArquivo);
end;

procedure TfrmEditor.ToolButton_ItalicoClick(Sender: TObject);
begin
  inherited;
 if FAlterando then Exit;
  if ToolButton_Italico.Down then
    _TextoAtual.Style := _textoatual.Style + [fsItalic]
  else
    _TextoAtual.Style := _textoAtual.Style - [fsItalic];
end;

procedure TfrmEditor.ToolButton_MarcadoresClick(Sender: TObject);
begin
  inherited;
if FAlterando then Exit;
  RichEdit_Editor.Paragraph.Numbering := TNumberingStyle(ToolButton_Marcadores.Down);
end;

procedure TfrmEditor.ToolButton_NegritoClick(Sender: TObject);
begin
  inherited;
if FAlterando then Exit;
  if ToolButton_Negrito.Down then
    _TextoAtual.Style := _TextoAtual.Style + [fsBold]
  else
    _TextoAtual.Style := _TextoAtual.Style - [fsBold];
end;

procedure TfrmEditor.ToolButton_NovoClick(Sender: TObject);
begin
  inherited;

  if(FTipoTexto = 'ARQUIVO') then
  NovoArquivoClick(Sender)
  else
  NovoRegistroClick(Sender);

end;

procedure TfrmEditor.ToolButton_RecortarClick(Sender: TObject);
begin
  inherited;
  RichEdit_Editor.CutToClipboard;
end;

procedure TfrmEditor.ToolButton_SalvarClick(Sender: TObject);
begin
  inherited;

 if RichEdit_Editor.Text = '' then
 begin
   RichEdit_Editor.Text := ' ';
 end;

if FTipoTexto = 'ARQUIVO' then
  begin
    if FNomeArquivo = _SemNome then
      SalvarComoClick(Sender)
    else
    begin
      RichEdit_Editor.Lines.SaveToFile(FNomeArquivo);
      RichEdit_Editor.Modified := False;
      _AtribuirModificadoStatusBar(False);
    end;
  end
  else
    _GravaContratoBD;
end;

procedure TfrmEditor.ToolButton_UnderlineClick(Sender: TObject);
begin
  inherited;
if FAlterando then Exit;
  if ToolButton_Underline.Down then
    _TextoAtual.Style := _textoAtual.Style + [fsUnderline]
  else
    _TextoAtual.Style := _TextoAtual.Style - [fsUnderline];
end;

procedure TfrmEditor.ToolButton_VoltarClick(Sender: TObject);
begin
  inherited;
    with RichEdit_Editor do
    if HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TfrmEditor._AtualizarPosicaoCursor;
var
  CharPos: TPoint;
begin
CharPos.Y := SendMessage(RichEdit_Editor.Handle,  EM_EXLINEFROMCHAR, 0,
    RichEdit_Editor.SelStart);
  CharPos.X := (RichEdit_Editor.SelStart -
    SendMessage(RichEdit_Editor.Handle, EM_LINEINDEX, CharPos.Y, 0));
  Inc(CharPos.Y);
  Inc(CharPos.X);
  StatusBar_Editor.Panels[0].Text := Format(sColRowInfo, [CharPos.Y, CharPos.X]);
end;

procedure TfrmEditor._AtribuirEdicaoRedirecionamento;
var
  R: TRect;
begin
  with RichEdit_Editor do
  begin
    R := Rect(GutterWid, 0, ClientWidth - GutterWid, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
  end;
end;

procedure TfrmEditor._AtribuirModificadoStatusBar(Valor: Boolean);
begin
     if Valor then
        StatusBar_Editor.Panels[1].Text := _Modificado
     else
         StatusBar_Editor.Panels[1].Text := '';
end;

procedure TfrmEditor._AtribuirNomedoArquivo(const FileName : string);
begin
  FNomeArquivo := FileName;
  if FTipoTexto = 'ARQUIVO' then
    Caption := Format('%s - %s - %s', [ExtractFileName(FileName), FTipoTexto,'HW Sistemas Editor'])
  else
    Caption := Format('%s - %s - %s', [FileName,FTipoTexto, 'HW Sistemas Editor'])
end;



procedure TfrmEditor._ChecarSalvar();
var
Senderr: TObject;
begin
  if(FTipoTexto = 'ARQUIVO') then
  _ChecarSalvarArquivo
  else
  _ChecarSalvarRegistro;
end;

procedure TfrmEditor._ChecarSalvarArquivo;
var
  RetornoSalvar: Integer;
begin
  if not RichEdit_Editor.Modified then Exit;
  	RetornoSalvar := MessageDlg(Format(sSaveChanges, [FNomeArquivo]), mtConfirmation, mbYesNoCancel, 0);
  case RetornoSalvar of
    idYes: SalvarClick(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;

end;

procedure TfrmEditor._ChecarSalvarRegistro;
var
  RetornoSalvar: Integer;
begin
  if not RichEdit_Editor.Modified then Exit;
  RetornoSalvar := MessageDlg(Format(sSaveChanges, [FNomeArquivo]),
    mtConfirmation, mbYesNoCancel, 0);
  case RetornoSalvar of
    idYes: Salvarregistro1Click(Self);
    idNo: {Nothing};
    idCancel: Abort;
  end;

end;

procedure TfrmEditor._ExecutarExibirArquivo(const AFileName: string);
begin
  RichEdit_Editor.Lines.LoadFromFile(AFileName);
  _AtribuirNomedoArquivo(AFileName);
  if (Self.Enabled) and (Self.Visible) and (RichEdit_Editor.CanFocus) then
  	RichEdit_Editor.SetFocus;
  RichEdit_Editor.Modified := False;
  _AtribuirModificadoStatusBar(False);
end;

procedure TfrmEditor._ExibirFormulario(cds: TClientDataSet; Tabela,
  Tipo: string);
begin

 MessageDlg('A tabela ' + LowerCase(Tabela) + ' não está ativa!' + #13 + #13 +
    'Selecione o ' + LowerCase(Tabela) + ' desejado para ' +
    'efetivar a troca do macro correspondente!', mtWarning, [mbOk], 0);
end;

function TfrmEditor._FimEditor: Boolean;
begin
if SendMessage(RichEdit_Editor.Handle, EM_EXLINEFROMCHAR, 0, RichEdit_Editor.SelStart) <
    (RichEdit_Editor.Lines.Count) then
    Result := False
  else
    Result := True;
end;

procedure TfrmEditor._GravaContratoBD;
var Sender : TObject;
   var
   fCont : TfrmCadContrato;
   contar,CodContratoAnterior : integer;
   TipoTextoAnterior, NomeArquivoAnterior : string;
begin
  CodContratoAnterior :=  FCodContrato;
  NomeArquivoAnterior := FNomeArquivo;
  TipoTextoAnterior := FTipoTexto;
  TForm(Fcont):=  TfrmCadContrato.Create(Application);
  fCont._AbrirnoEditor_ := true;
   Contar := 0;
  with Contratos do
  begin
  Contar :=  dataSet.ChangeCount;
       montaSelect('select * from CONTRATO where COD_EMPRESA = ' +
    vDadosIni.CodEmpresa + ' and ATIVO = 1 and CODIGO = ' +
    IntToStr(FCodContrato) + ' and TIPO_ARQUIVO =''' + _TipodeRegistro+'''');

        DeleteFile(ExtractFileDir(Application.ExeName) + '\temp~' +
  FormatDateTime('ddmmyyyy', Now) + '.rtf');



  if (not ExecutaComandosSql('select * from CONTRATO where COD_EMPRESA = ' +
    vDadosIni.CodEmpresa + ' and ATIVO = 1 and CODIGO = ' +
    IntToStr(FCodContrato) + ' and TIPO_ARQUIVO =''' + _TipodeRegistro+'''')
    or (_NOVO)) or (FTipoTexto = 'ARQUIVO') then
  begin
    if (not dataSet.Active) then
       fCont._Acao_ := '';
       fCont._Acao_ := 'NOVO';
       FCodContrato := 0;
  end
  else
  begin
       fCont._Acao_ := '';
       fCont._Acao_ := 'EDITAR';
       fCont._Codigo_ := dataset.FieldByName('CODIGO').AsInteger;
  end;

   FTipoTexto := 'REGISTRO';

  if(RichEdit_Editor.Text <> '') then
  begin

  RichEdit_Editor.Lines.SaveToFile(ExtractFileDir(Application.ExeName) + '\temp~' +
    FormatDateTime('ddmmyyyy', Now) + '.rtf');
  end;
  fCont.FormStyle := fsNormal;
  fCont.FormStyle := fsStayOnTop;
  {Evitar 2 posts no formulario por que entra no Formulario 2 com o código
  acima vezes e da o post inserindo dois valores}
  if fCont._Acao_ = 'NOVO' then
  Contratos.Cancel;
  fCont.Visible :=  false;
  frmCadContrato._Form_ :=fCont;
  fCont.ShowModal;
  // se nao stever vazio...
  if(fCont._Codigo_ <> 0)    then
  begin
  FCodContrato := fCont._Codigo_;
  RichEdit_Editor.Lines.LoadFromFile(ExtractFileDir(Application.ExeName) + '\temp~' +
  FormatDateTime('ddmmyyyy', Now) + '.rtf');
  _AtribuirNomedoArquivo(fCont._Descricao_);
  end
  else
  begin
  FTipoTexto := TipoTextoAnterior;
  FNomeArquivo := NomeArquivoAnterior;
  FCodContrato := CodContratoAnterior;
  end;

  fCont := nil;
  fCont.Free;
  dataSet.Active := False;
  RichEdit_Editor.Modified := False;
  _AtribuirModificadoStatusBar(False);
  end;
  _NOVO := false;
end;

procedure TfrmEditor._IniciarEditor;
begin
   if RichEdit_Editor.Text = '' then
 begin
   RichEdit_Editor.Text := ' ';
 end;
end;

procedure TfrmEditor._MudarSelecao(Sender: TObject);
begin
      with RichEdit_Editor.Paragraph do
  try
    FAlterando := True;
    FirstInd.Left := Trunc(FirstIndent * RulerAdj) - 4 + GutterWid;
    LeftInd.Left := Trunc((LeftIndent + FirstIndent) * RulerAdj) - 4 + GutterWid;
    RightInd.Left := Ruler.ClientWidth - 6 - Trunc((RightIndent + GutterWid) * RulerAdj);
    ToolButton_Negrito.Down := fsBold in RichEdit_Editor.SelAttributes.Style;
    ToolButton_Italico.Down := fsItalic in RichEdit_Editor.SelAttributes.Style;
    ToolButton_Underline.Down := fsUnderline in RichEdit_Editor.SelAttributes.Style;
    ToolButton_Marcadores.Down := Boolean(Numbering);
    Combobox_Fonte.Text := RichEdit_Editor.SelAttributes.Name;
    Edit_TamanhoFonte.Text := IntToStr(RichEdit_Editor.SelAttributes.Size);
    case Ord(Alignment) of
      0: ToolButton_AlinhaEsquerda.Down := True;
      1: ToolButton_AlinhaDireita.Down := True;
      2: ToolButton_AlinhaCentro.Down := True;
    end;
    _AtualizarPosicaoCursor;
  finally
    FAlterando := False;
  end;
end;

procedure TfrmEditor._NovoArquivoOuRegistro(TipoDeArquivo: string);
begin
_ChecarSalvar;
FTipoTexto := TipoDeArquivo;
 RichEdit_Editor.Lines.Clear;
  RichEdit_Editor.Modified := False;
  _AtribuirModificadoStatusBar(False);
    FTipoTexto := TipoDeArquivo;
  _AtribuirNomedoArquivo(_SemNome);
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TfrmEditor._ObterNomeFontes;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(Combobox_Fonte.Items));
  ReleaseDC(0, DC);
  Combobox_Fonte.Sorted := True;
end;



function TfrmEditor._PegarValorCampo(cds: TClientDataSet; tab,
  Campo: string): string;
begin
  with TAGs do
    if cds.Active then
      Result := cds.FieldByName(Campo).Text
    else
    begin
     _ExibirFormulario(cds, tab, '');
     ShowMessage('');
      Result := cds.FieldByName(Campo).Text;
    end;
end;



procedure TfrmEditor._ReguadeInstalacao;
var
  I: Integer;
  S: string;
begin
  SetLength(S, 201);
  I := 1;
  while I < 200 do
  begin
    S[I] := #9;
    S[I + 1] := '|';
    Inc(I, 2);
  end;
  Ruler.Caption := S;
end;

function TfrmEditor._TextoAtual: TTextAttributes;
begin
if RichEdit_Editor.SelLength > 0 then Result := RichEdit_Editor.SelAttributes
  else Result := RichEdit_Editor.DefAttributes;
end;

procedure TfrmEditor._TrocaMacros(Macro, Valor: string);
begin
  RichEdit_Editor.SelStart := 0;
  while not _FimEditor do
    with ReplaceDialog_Editor do
      { Busca em todo editor de modo case-sensitive }
      if _Localizar(Macro) > 0 then
      begin
        RichEdit_Editor.SelStart := _Localizar(Macro) - 1;
        RichEdit_Editor.SelLength := Length(Macro);
        { troca o texto selecionado pelo escolhido }
        RichEdit_Editor.SelText := Valor;
      end
      else
        Exit;
end;

procedure TfrmEditor.AbrirArquivoClick(Sender: TObject);
begin
  inherited;
  _ChecarSalvarArquivo;
  if OpenDialog_Editor.Execute then
  begin
    FTipoTexto := 'ARQUIVO';
    _ExecutarExibirArquivo(OpenDialog_Editor.FileName);
    RichEdit_Editor.ReadOnly := ofReadOnly in OpenDialog_Editor.Options;

  end;
end;

procedure TfrmEditor.AbrirRegistroClick(Sender: TObject);
begin
  inherited;
	try
    try
      _ChecarSalvarArquivo;
      Application.CreateForm(TfrmListar, FrmListar);
      frmListar._Tabela_ := 'CONTRATO';
      frmListar._TipodeRegistro_:= 'V';
      FrmListar.ShowModal;
      if FrmListar._Registro <> '' then
      begin
        RichEdit_Editor.Lines.Clear;
        // se nao stever vazio...
        FTipoTexto := 'REGISTRO';
        FCodContrato := StrToInt(FrmListar._Registro);
        _AtribuirNomedoArquivo(DtmCadBasicos.cdsContratos.FieldByName('DESCRICAO').Text);
        RichEdit_Editor.Text:= DtmCadBasicos.cdsContratosTEXTO.AsString;
        RichEdit_Editor.Modified := False;
         _AtribuirModificadoStatusBar(False);
      end;
    except
    end;
  finally
    DtmCadBasicos.cdsContratos.Active := False;
    FrmListar.Free;
  end;

end;

procedure TfrmEditor.ColarClick(Sender: TObject);
begin
  inherited;
RichEdit_Editor.PasteFromClipboard;
end;

procedure TfrmEditor.Combobox_FonteChange(Sender: TObject);
begin
  inherited;
 if FAlterando then Exit;
  _TextoAtual.Name := Combobox_Fonte.Items[Combobox_Fonte.ItemIndex];

  
end;

procedure TfrmEditor.CopiarClick(Sender: TObject);
begin
  inherited;
RichEdit_Editor.CopyToClipboard;
end;

procedure TfrmEditor.DesfazerClick(Sender: TObject);
begin
  inherited;
with RichEdit_Editor do
    if HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);

      
end;

procedure TfrmEditor.Edit_TamanhoFonteChange(Sender: TObject);
begin
  inherited;
  if not (Edit_TamanhoFonte.Text = '') then
  begin
  if FAlterando then Exit;
  _TextoAtual.Size := StrToInt(Edit_TamanhoFonte.Text);
  end;
end;

procedure TfrmEditor.Edit_TamanhoFonteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;

end;

procedure TfrmEditor.FirstIndMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs;
  FDragging := True;
end;

procedure TfrmEditor.FirstIndMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if FDragging then
    TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs
end;

procedure TfrmEditor.FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
FDragging := False;
  RichEdit_Editor.Paragraph.FirstIndent := Trunc((FirstInd.Left + FDragOfs - GutterWid) / RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmEditor.FonteClick(Sender: TObject);
begin
  inherited;
  FontDialog_Editor.Font.Assign(RichEdit_Editor.SelAttributes);
  if FontDialog_Editor.Execute then
  begin
    _TextoAtual.Assign(FontDialog_Editor.Font);
   Combobox_Fonte.ItemIndex := Integer(Combobox_Fonte.Items.IndexOf(_TextoAtual.Name));
  end;
  _MudarSelecao(Self);
  if (Self.Enabled) and (Self.Visible) and (RichEdit_Editor.CanFocus) then
  	RichEdit_Editor.SetFocus;
end;

procedure TfrmEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TAGs.Cancel;
  TAGs.RollBackTransacao;
  TAGs.free;
  Action := caFree;
  if(frmCadContrato <> nil) then
  frmCadContrato._AbrirnoEditor_ := false;
  frmListar := nil;
  frmListar.free;
end;

procedure TfrmEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  try
    _ChecarSalvarArquivo;
  except
    CanClose := False;
  end;
end;

procedure TfrmEditor.FormCreate(Sender: TObject);
begin
  inherited;


  TAGs := TTAG.create;
  Contratos := TContratos.create;
  OpenDialog_Editor.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog_Editor.InitialDir := OpenDialog_Editor.InitialDir;
  _AtribuirNomedoArquivo(_SemNome);

  _ObterNomeFontes;
  _ReguadeInstalacao;
  _MudarSelecao(Self);

  _TextoAtual.Name := DefFontData.Name;
  _TextoAtual.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  
end;

procedure TfrmEditor.FormPaint(Sender: TObject);
begin
  inherited;
_AtribuirEdicaoRedirecionamento;
end;

procedure TfrmEditor.FormResize(Sender: TObject);
begin
  inherited;
  _AtribuirEdicaoRedirecionamento;
  _MudarSelecao(Sender);
end;

procedure TfrmEditor.FormShow(Sender: TObject);
begin
  inherited;
 if FCodContrato <> 0 then
      begin
        RichEdit_Editor.Lines.Clear;
        RichEdit_Editor.Text:= FTexto;
        RichEdit_Editor.Modified := False;
         _AtribuirModificadoStatusBar(False);
      end;

  FTipoTexto := 'REGISTRO';
  _AtualizarPosicaoCursor;
  DragAcceptFiles(Handle, True);
  RichEdit_EditorChange(nil);
  if (Self.Enabled) and (Self.Visible) and (RichEdit_Editor.CanFocus) then
  	RichEdit_Editor.SetFocus;
  _AtribuirNomedoArquivo(FNomeArquivo);
  // Verificar se deve carregar um arquivo na linha de comando
  if (ParamCount > 0) and FileExists(ParamStr(1)) then
    _ExecutarExibirArquivo(ParamStr(1));    
end;

procedure TfrmEditor.ImprimirClick(Sender: TObject);
begin
  inherited;
if PrintDialog_Editor.Execute then
    RichEdit_Editor.Print(FNomeArquivo);
end;

procedure TfrmEditor.InserirMacroClick(Sender: TObject);
begin
  inherited;
  try
    try
      Application.CreateForm(TfrmListar, frmListar);
      frmListar._Tabela_ := 'MACRO';
      frmListar.ShowModal;
      if FrmListar._Registro <> '' then
        RichEdit_Editor.SelText := '<*' + frmListar._Registro + '>';
    except
    end;
  finally
    frmListar.Free;
  end;

end;

procedure TfrmEditor.LeftIndMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FDragOfs := (TLabel(Sender).Width div 2);
  TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs;
  FDragging := True;
end;

procedure TfrmEditor.LeftIndMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if FDragging then
    TLabel(Sender).Left := TLabel(Sender).Left + X - FDragOfs
end;

procedure TfrmEditor.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FDragging := False;
  RichEdit_Editor.Paragraph.LeftIndent :=
  Trunc((LeftInd.Left + FDragOfs - GutterWid) / RulerAdj) -
  RichEdit_Editor.Paragraph.FirstIndent;
  _MudarSelecao(Sender);
end;

function TfrmEditor._Localizar(ENCONTRAR_TAG: string): Integer;
var
  SelPos: Integer;
begin
  with ReplaceDialog_Editor do
  begin
    FindText := ENCONTRAR_TAG;
    { Busca em todo editor de modo case-sensitive }
    SelPos := Pos(FindText, RichEdit_Editor.Lines.Text);
    Result := SelPos;
  end;
end;

procedure TfrmEditor.NovoArquivoClick(Sender: TObject);
begin
  inherited;
  _NovoArquivoOuRegistro('ARQUIVO')

end;

end.
