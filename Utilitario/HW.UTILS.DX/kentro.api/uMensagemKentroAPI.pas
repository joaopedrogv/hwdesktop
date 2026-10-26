unit uMensagemKentroAPI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  uClassesKentroAPI;

type
  TfrmMensagemKentroAPI = class(TForm)
    GrCabecalho: TGroupBox;
    lbNumDoc: TLabel;
    lbCliente: TLabel;
    lbCondPag: TLabel;
    lbVendedor: TLabel;
    lbFoneCliente: TLabel;
    lbFoneCelular: TLabel;
    EditNumDoc: TEdit;
    EditCodCliente: TEdit;
    EditNomeCliente: TEdit;
    EditCondPag: TEdit;
    EditNomeCondPag: TEdit;
    EditCodVendedor: TEdit;
    EditNomeVendedor: TEdit;
    MaskEditFoneCliente: TMaskEdit;
    MaskEditFoneCelular: TMaskEdit;
    CheckBoxFoneCliente: TCheckBox;
    CheckBoxFoneCelular: TCheckBox;
    RadioGroupOpcoes: TRadioGroup;
    GroupBoxEnviadas: TGroupBox;
    DBGridMensEnv: TDBGrid;
    Panel3: TPanel;
    SpeedButtonAtualizar: TSpeedButton;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    MemoItens: TMemo;
    MemoTexto: TMemo;
    GroupBoxEnvMens: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    MemoMensAvulsa: TMemo;
    TabSheet2: TTabSheet;
    MemoMensDoc: TMemo;
    TabSheet3: TTabSheet;
    GroupBoxImg: TGroupBox;
    MemoImg1: TMemo;
    DBGridProd: TDBGrid;
    ScrollBoxImg: TScrollBox;
    GroupBoxImgProd: TGroupBox;
    lbQtdeImg: TLabel;
    Image1: TImage;
    pnOpcoesImg: TPanel;
    SpeedButtonDireitaImg: TSpeedButton;
    SpeedButtonEsquerdaImg: TSpeedButton;
    TabSheet4: TTabSheet;
    GroupBoxImg2: TGroupBox;
    MemoImg2: TMemo;
    DBGridImg: TDBGrid;
    GroupBoxImgSel2: TGroupBox;
    lbQtdeImg2: TLabel;
    Image2: TImage;
    pnOpcoesImg2: TPanel;
    SpeedButtonDireitaImg2: TSpeedButton;
    SpeedButtonEsquerdaImg2: TSpeedButton;
    SpeedButtonAdicionarImg2: TSpeedButton;
    SpeedButtonExcluirImg: TSpeedButton;
    TabSheet5: TTabSheet;
    GroupBoxArq: TGroupBox;
    MemoArq: TMemo;
    GroupBoxArqSel: TGroupBox;
    lbQtdeArq: TLabel;
    pnOpcoesArq: TPanel;
    SpeedButtonAdicionarArq: TSpeedButton;
    SpeedButtonExcluirArq: TSpeedButton;
    SpeedButtonDireitaArq: TSpeedButton;
    SpeedButtonEsquerdaArq: TSpeedButton;
    DBGridArq: TDBGrid;
    Splitter1: TSplitter;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Label1: TLabel;
    EditTipoDoc: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroupOpcoesClick(Sender: TObject);
    procedure CheckBoxFoneClienteClick(Sender: TObject);
    procedure CheckBoxFoneCelularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonAtualizarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MaskEditFoneClienteExit(Sender: TObject);
    procedure MaskEditFoneCelularExit(Sender: TObject);
    procedure DBGridImgCellClick(Column: TColumn);
    procedure DBGridImgDblClick(Sender: TObject);
    procedure DBGridImgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridImgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonAdicionarImg2Click(Sender: TObject);
    procedure SpeedButtonDireitaImg2Click(Sender: TObject);
    procedure SpeedButtonEsquerdaImg2Click(Sender: TObject);
    procedure SpeedButtonExcluirImgClick(Sender: TObject);
    procedure DBGridProdCellClick(Column: TColumn);
    procedure DBGridProdDblClick(Sender: TObject);
    procedure DBGridProdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonDireitaImgClick(Sender: TObject);
    procedure SpeedButtonEsquerdaImgClick(Sender: TObject);
    procedure DBGridArqCellClick(Column: TColumn);
    procedure DBGridArqDblClick(Sender: TObject);
    procedure DBGridArqDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridArqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonAdicionarArqClick(Sender: TObject);
    procedure SpeedButtonDireitaArqClick(Sender: TObject);
    procedure SpeedButtonEsquerdaArqClick(Sender: TObject);
    procedure SpeedButtonExcluirArqClick(Sender: TObject);
  private
    { Private declarations }
    FkentroAPI: TKentroAPI;
  public
    { Public declarations }
    property kentroAPI: TKentroAPI read FkentroAPI write FkentroAPI;
  end;

var
  frmMensagemKentroAPI: TfrmMensagemKentroAPI;

implementation

{$R *.dfm}

procedure TfrmMensagemKentroAPI.CheckBoxFoneCelularClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CheckBoxFoneCliente.Checked := not CheckBoxFoneCelular.Checked;

    if CheckBoxFoneCelular.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCelular.Checked then
          kentroAPI.CarregarMensagemEnvidas(trim(MaskEditFoneCelular.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentroAPI.CheckBoxFoneClienteClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CheckBoxFoneCelular.Checked := not CheckBoxFoneCliente.Checked;

    if CheckBoxFoneCliente.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCliente.Checked then
          kentroAPI.CarregarMensagemEnvidas(trim(MaskEditFoneCliente.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentroAPI.DBGridArqCellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    kentroAPI._marcaDesmarcaLinha(DBGridArq.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridArqDblClick(Sender: TObject);
begin
  if not DBGridArq.DataSource.DataSet.IsEmpty then
    kentroAPI._marcaDesmarcaLinha(DBGridArq.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridArqDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.DataSet.IsEmpty then
    exit;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMensagemKentroAPI.DBGridArqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not DBGridArq.DataSource.DataSet.IsEmpty then
      kentroAPI._marcaDesmarcaLinha(DBGridArq.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridImgCellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    kentroAPI._marcaDesmarcaLinha(DBGridImg.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridImgDblClick(Sender: TObject);
begin
  if not DBGridImg.DataSource.DataSet.IsEmpty then
    kentroAPI._marcaDesmarcaLinha(DBGridImg.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridImgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.DataSet.IsEmpty then
    exit;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMensagemKentroAPI.DBGridImgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not DBGridImg.DataSource.DataSet.IsEmpty then
      kentroAPI._marcaDesmarcaLinha(DBGridImg.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridProdCellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    kentroAPI._marcaDesmarcaLinha(DBGridProd.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridProdDblClick(Sender: TObject);
begin
  if not DBGridProd.DataSource.DataSet.IsEmpty then
    kentroAPI._marcaDesmarcaLinha(DBGridProd.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.DBGridProdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.DataSet.IsEmpty then
    exit;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMensagemKentroAPI.DBGridProdKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not DBGridProd.DataSource.DataSet.IsEmpty then
      kentroAPI._marcaDesmarcaLinha(DBGridProd.DataSource.DataSet);
end;

procedure TfrmMensagemKentroAPI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.Enabled := false;
  Action := caFree;
  if (frmMensagemKentroAPI <> nil) then
    frmMensagemKentroAPI := nil;
end;

procedure TfrmMensagemKentroAPI.FormCreate(Sender: TObject);
begin
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
end;

procedure TfrmMensagemKentroAPI.FormShow(Sender: TObject);
begin
//  GroupBoxEnviadas.Width := _LerConfiguracoesRegistroInteger(GroupBoxEnviadas.Name, 347);
//  if GroupBoxEnviadas.Width <= 200 then
//    GroupBoxEnviadas.Width := 200;
  kentroAPI._carregarImagem;

  Timer1.Enabled := true;
end;

procedure TfrmMensagemKentroAPI.MaskEditFoneCelularExit(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if CheckBoxFoneCelular.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCelular.Checked then
          kentroAPI.CarregarMensagemEnvidas(trim(MaskEditFoneCelular.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentroAPI.MaskEditFoneClienteExit(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if CheckBoxFoneCliente.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCliente.Checked then
          kentroAPI.CarregarMensagemEnvidas(trim(MaskEditFoneCliente.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentroAPI.RadioGroupOpcoesClick(Sender: TObject);
begin
  if RadioGroupOpcoes.ItemIndex = 0 then
  begin
    PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
    MemoMensAvulsa.Text := '';
    if MemoMensAvulsa.CanFocus then
      MemoMensAvulsa.SetFocus;
  end
  else if RadioGroupOpcoes.ItemIndex = 1 then
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;

    MemoMensDoc.Text := MemoItens.Text;
    if MemoMensDoc.CanFocus then
      MemoMensDoc.SetFocus;
  end
  else if RadioGroupOpcoes.ItemIndex = 2 then
  begin
    PageControl1.ActivePage := TabSheet3;
    TabSheet3.Show;

    if MemoImg1.CanFocus then
      MemoImg1.SetFocus;
  end
  else if RadioGroupOpcoes.ItemIndex = 3 then
  begin
    PageControl1.ActivePage := TabSheet4;
    TabSheet4.Show;

    if MemoImg2.CanFocus then
      MemoImg2.SetFocus;
  end
  else if RadioGroupOpcoes.ItemIndex = 4 then
  begin
    PageControl1.ActivePage := TabSheet5;
    TabSheet5.Show;

    if MemoArq.CanFocus then
      MemoArq.SetFocus;
  end
end;

procedure TfrmMensagemKentroAPI.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    CheckBoxFoneCliente.Enabled := false;
    CheckBoxFoneCelular.Enabled := false;
    if (MaskEditFoneCliente.Visible) and (CheckBoxFoneCliente.Checked) and (trim(MaskEditFoneCliente.Text) <> '') then
      kentroAPI.vFoneMensagem := MaskEditFoneCliente.Text
    else if (MaskEditFoneCelular.Visible) and (CheckBoxFoneCelular.Checked) and (trim(MaskEditFoneCelular.Text) <> '') then
      kentroAPI.vFoneMensagem := MaskEditFoneCelular.Text;

    kentroAPI.vNdocMensagem := StrToInt(EditNumDoc.Text);
    kentroAPI.vTipoDocMensagem := trim(EditTipoDoc.Text);
    if PageControl1.ActivePage = TabSheet1 then
      kentroAPI.vTextoMensagem := MemoMensAvulsa.Text
    else if PageControl1.ActivePage = TabSheet2 then
      kentroAPI.vTextoMensagem := MemoMensDoc.Text
    else if PageControl1.ActivePage = TabSheet3 then
      kentroAPI.vTextoMensagem := MemoImg1.Text
    else if PageControl1.ActivePage = TabSheet4 then
      kentroAPI.vTextoMensagem := MemoImg2.Text
    else if PageControl1.ActivePage = TabSheet5 then
      kentroAPI.vTextoMensagem := MemoArq.Text;

    if not kentroAPI.EnviarMensagem then
      exit;

    if PageControl1.ActivePage = TabSheet1 then
      MemoMensAvulsa.Text := ''
    else if PageControl1.ActivePage = TabSheet3 then
      MemoImg1.Text := ''
    else if PageControl1.ActivePage = TabSheet4 then
      MemoImg2.Text := ''
    else if PageControl1.ActivePage = TabSheet5 then
      MemoArq.Text := '';
  finally
    CheckBoxFoneCliente.Enabled := true;
    CheckBoxFoneCelular.Enabled := true;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentroAPI.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonAdicionarArqClick(Sender: TObject);
begin
  kentroAPI._adicionarArquivo;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonAdicionarImg2Click(Sender: TObject);
begin
  kentroAPI._adicionarImagem2;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonAtualizarClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if CheckBoxFoneCliente.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCliente.Checked then
          kentroAPI.CarregarMensagemEnvidas(trim(MaskEditFoneCliente.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end
    else if CheckBoxFoneCelular.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCelular.Checked then
          kentroAPI.CarregarMensagemEnvidas(trim(MaskEditFoneCelular.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonDireitaArqClick(Sender: TObject);
begin
  kentroAPI._proximaArquivo;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonDireitaImg2Click(Sender: TObject);
begin
  kentroAPI._proximaImagem2;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonDireitaImgClick(Sender: TObject);
begin
  kentroAPI._proximaImagem;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonEsquerdaArqClick(Sender: TObject);
begin
  kentroAPI._anteriorArquivo;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonEsquerdaImg2Click(Sender: TObject);
begin
  kentroAPI._anteriorImagem2;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonEsquerdaImgClick(Sender: TObject);
begin
  kentroAPI._anteriorImagem;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonExcluirArqClick(Sender: TObject);
begin
  kentroAPI._deletarArquivo;
end;

procedure TfrmMensagemKentroAPI.SpeedButtonExcluirImgClick(Sender: TObject);
begin
  kentroAPI._deletarImagem2;
  if DBGridImg.DataSource.DataSet.IsEmpty then
  begin
    Image2.Picture := nil;
    lbQtdeImg2.Caption := '0/0';
  end;
end;

procedure TfrmMensagemKentroAPI.Timer1Timer(Sender: TObject);
begin
  if (CheckBoxFoneCliente.Enabled) and (trim(MaskEditFoneCliente.Text) <> '') then
    SpeedButtonAtualizarClick(Sender)
  else if (CheckBoxFoneCelular.Enabled) and (trim(MaskEditFoneCelular.Text) <> '') then
    SpeedButtonAtualizarClick(Sender);
end;

end.
