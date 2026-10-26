unit uMensagemKentro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons, uClassesKentro, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, System.Win.Registry;

type
  TfrmMensagemKentro = class(TForm)
    GrCabecalho: TGroupBox;
    lbNumDoc: TLabel;
    lbCliente: TLabel;
    EditNumDoc: TEdit;
    EditCodCliente: TEdit;
    EditNomeCliente: TEdit;
    lbCondPag: TLabel;
    EditCondPag: TEdit;
    EditNomeCondPag: TEdit;
    lbVendedor: TLabel;
    EditCodVendedor: TEdit;
    EditNomeVendedor: TEdit;
    lbFoneCliente: TLabel;
    MaskEditFoneCliente: TMaskEdit;
    lbFoneCelular: TLabel;
    MaskEditFoneCelular: TMaskEdit;
    Panel1: TPanel;
    RadioGroupOpcoes: TRadioGroup;
    CheckBoxFoneCliente: TCheckBox;
    CheckBoxFoneCelular: TCheckBox;
    MemoItens: TMemo;
    MemoTexto: TMemo;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
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
    pnOpcoesArq: TPanel;
    SpeedButtonAdicionarArq: TSpeedButton;
    SpeedButtonExcluirArq: TSpeedButton;
    DBGridArq: TDBGrid;
    GroupBoxEnviadas: TGroupBox;
    DBGridMensEnv: TDBGrid;
    Splitter1: TSplitter;
    lbQtdeArq: TLabel;
    SpeedButtonDireitaArq: TSpeedButton;
    SpeedButtonEsquerdaArq: TSpeedButton;
    OpenDialog2: TOpenDialog;
    Panel3: TPanel;
    pnMensEnv: TPanel;
    pnMensErro: TPanel;
    pnMensPend: TPanel;
    SpeedButtonAtualizar: TSpeedButton;
    Timer1: TTimer;
    EditTipoDoc: TEdit;
    Label1: TLabel;
    procedure CheckBoxFoneClienteClick(Sender: TObject);
    procedure CheckBoxFoneCelularClick(Sender: TObject);
    procedure RadioGroupOpcoesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridProdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridProdCellClick(Column: TColumn);
    procedure DBGridProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonDireitaImgClick(Sender: TObject);
    procedure SpeedButtonEsquerdaImgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButtonAdicionarImg2Click(Sender: TObject);
    procedure SpeedButtonDireitaImg2Click(Sender: TObject);
    procedure SpeedButtonEsquerdaImg2Click(Sender: TObject);
    procedure SpeedButtonExcluirImgClick(Sender: TObject);
    procedure DBGridImgCellClick(Column: TColumn);
    procedure DBGridImgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridImgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridImgDblClick(Sender: TObject);
    procedure DBGridProdDblClick(Sender: TObject);
    procedure DBGridArqCellClick(Column: TColumn);
    procedure DBGridArqDblClick(Sender: TObject);
    procedure DBGridArqDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridArqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonAdicionarArqClick(Sender: TObject);
    procedure SpeedButtonExcluirArqClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure SpeedButtonDireitaArqClick(Sender: TObject);
    procedure SpeedButtonEsquerdaArqClick(Sender: TObject);
    procedure MaskEditFoneClienteExit(Sender: TObject);
    procedure MaskEditFoneCelularExit(Sender: TObject);
    procedure DBGridMensEnvDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButtonAtualizarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Fkentro: TKentro;
  public
    { Public declarations }
    property kentro: TKentro read Fkentro write Fkentro;
    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
  end;

var
  frmMensagemKentro: TfrmMensagemKentro;

implementation

{$R *.dfm}

procedure TfrmMensagemKentro.CheckBoxFoneCelularClick(Sender: TObject);
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
          kentro.CarregarMensagemEnvidas(trim(MaskEditFoneCelular.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentro.CheckBoxFoneClienteClick(Sender: TObject);
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
          kentro.CarregarMensagemEnvidas(trim(MaskEditFoneCliente.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentro.DBGridArqCellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    kentro._marcaDesmarcaLinha(DBGridArq.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridArqDblClick(Sender: TObject);
begin
  if not DBGridArq.DataSource.DataSet.IsEmpty then
    kentro._marcaDesmarcaLinha(DBGridArq.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridArqDrawColumnCell(Sender: TObject;
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

procedure TfrmMensagemKentro.DBGridArqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not DBGridArq.DataSource.DataSet.IsEmpty then
      kentro._marcaDesmarcaLinha(DBGridArq.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridImgCellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    kentro._marcaDesmarcaLinha(DBGridImg.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridImgDblClick(Sender: TObject);
begin
  if not DBGridImg.DataSource.DataSet.IsEmpty then
    kentro._marcaDesmarcaLinha(DBGridImg.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridImgDrawColumnCell(Sender: TObject;
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

procedure TfrmMensagemKentro.DBGridImgKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not DBGridImg.DataSource.DataSet.IsEmpty then
      kentro._marcaDesmarcaLinha(DBGridImg.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridMensEnvDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DBGridMensEnv.DataSource.dataSet.FieldByName('STATUS').AsString = '0') then
  begin
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
      TDBGrid(sender).canvas.brush.color := pnMensPend.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end;
  end
  else if (DBGridMensEnv.DataSource.dataSet.FieldByName('STATUS').AsString = '1') then
  begin
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
      TDBGrid(sender).canvas.brush.color := pnMensEnv.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end;
  end
  else if (DBGridMensEnv.DataSource.dataSet.FieldByName('STATUS').AsString = '2') then
  begin
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
      TDBGrid(sender).canvas.brush.color := pnMensErro.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmMensagemKentro.DBGridProdCellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    kentro._marcaDesmarcaLinha(DBGridProd.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridProdDblClick(Sender: TObject);
begin
  if not DBGridProd.DataSource.DataSet.IsEmpty then
    kentro._marcaDesmarcaLinha(DBGridProd.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.DBGridProdDrawColumnCell(Sender: TObject;
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

procedure TfrmMensagemKentro.DBGridProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not DBGridProd.DataSource.DataSet.IsEmpty then
      kentro._marcaDesmarcaLinha(DBGridProd.DataSource.DataSet);
end;

procedure TfrmMensagemKentro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Timer1.Enabled := false;
  Action := caFree;
  if (frmMensagemKentro <> nil) then
    frmMensagemKentro := nil;
end;

procedure TfrmMensagemKentro.FormCreate(Sender: TObject);
begin
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
end;

procedure TfrmMensagemKentro.FormShow(Sender: TObject);
begin
//  GroupBoxEnviadas.Width := _LerConfiguracoesRegistroInteger(GroupBoxEnviadas.Name, 347);
//  if GroupBoxEnviadas.Width <= 200 then
//    GroupBoxEnviadas.Width := 200;
  kentro._carregarImagem;

  Timer1.Enabled := true;
end;

procedure TfrmMensagemKentro.MaskEditFoneCelularExit(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if CheckBoxFoneCelular.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCelular.Checked then
          kentro.CarregarMensagemEnvidas(trim(MaskEditFoneCelular.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentro.MaskEditFoneClienteExit(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if CheckBoxFoneCliente.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCliente.Checked then
          kentro.CarregarMensagemEnvidas(trim(MaskEditFoneCliente.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentro.RadioGroupOpcoesClick(Sender: TObject);
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

procedure TfrmMensagemKentro.SpeedButton1Click(Sender: TObject);
begin
  try
    CheckBoxFoneCliente.Enabled := false;
    CheckBoxFoneCelular.Enabled := false;
    if (MaskEditFoneCliente.Visible) and (CheckBoxFoneCliente.Checked) and (trim(MaskEditFoneCliente.Text) <> '') then
      kentro.vFoneMensagem := MaskEditFoneCliente.Text
    else if (MaskEditFoneCelular.Visible) and (CheckBoxFoneCelular.Checked) and (trim(MaskEditFoneCelular.Text) <> '') then
      kentro.vFoneMensagem := MaskEditFoneCelular.Text;

    kentro.vNdocMensagem := StrToInt(EditNumDoc.Text);
    kentro.vTipoDocMensagem := trim(EditTipoDoc.Text);
    if PageControl1.ActivePage = TabSheet1 then
      kentro.vTextoMensagem := MemoMensAvulsa.Text
    else if PageControl1.ActivePage = TabSheet2 then
      kentro.vTextoMensagem := MemoMensDoc.Text
    else if PageControl1.ActivePage = TabSheet3 then
      kentro.vTextoMensagem := MemoImg1.Text
    else if PageControl1.ActivePage = TabSheet4 then
      kentro.vTextoMensagem := MemoImg2.Text
    else if PageControl1.ActivePage = TabSheet5 then
      kentro.vTextoMensagem := MemoArq.Text;

    if not kentro.EnviarMensagem then
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
  end;
end;

procedure TfrmMensagemKentro.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmMensagemKentro.SpeedButtonAtualizarClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if CheckBoxFoneCliente.Enabled then
    begin
      try
        CheckBoxFoneCliente.Enabled := false;
        CheckBoxFoneCelular.Enabled := false;
        if CheckBoxFoneCliente.Checked then
          kentro.CarregarMensagemEnvidas(trim(MaskEditFoneCliente.Text));
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
          kentro.CarregarMensagemEnvidas(trim(MaskEditFoneCelular.Text));
      finally
        CheckBoxFoneCliente.Enabled := true;
        CheckBoxFoneCelular.Enabled := true;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmMensagemKentro.SpeedButtonAdicionarArqClick(Sender: TObject);
begin
  kentro._adicionarArquivo;
end;

procedure TfrmMensagemKentro.SpeedButtonExcluirArqClick(Sender: TObject);
begin
  kentro._deletarArquivo;
end;

procedure TfrmMensagemKentro.SpeedButtonAdicionarImg2Click(Sender: TObject);
begin
  kentro._adicionarImagem2;
end;

procedure TfrmMensagemKentro.SpeedButtonDireitaArqClick(Sender: TObject);
begin
  kentro._proximaArquivo;
end;

procedure TfrmMensagemKentro.SpeedButtonDireitaImg2Click(Sender: TObject);
begin
  kentro._proximaImagem2;
end;

procedure TfrmMensagemKentro.SpeedButtonDireitaImgClick(Sender: TObject);
begin
  kentro._proximaImagem;
end;

procedure TfrmMensagemKentro.SpeedButtonEsquerdaArqClick(Sender: TObject);
begin
  kentro._anteriorArquivo;
end;

procedure TfrmMensagemKentro.SpeedButtonEsquerdaImg2Click(Sender: TObject);
begin
  kentro._anteriorImagem2;
end;

procedure TfrmMensagemKentro.SpeedButtonEsquerdaImgClick(Sender: TObject);
begin
  kentro._anteriorImagem;
end;

procedure TfrmMensagemKentro.SpeedButtonExcluirImgClick(Sender: TObject);
begin
  kentro._deletarImagem2;
end;

procedure TfrmMensagemKentro.Splitter1Moved(Sender: TObject);
begin
//  _GravaConfiguracoesInteger(GroupBoxEnviadas.Name, GroupBoxEnviadas.Width);
end;

procedure TfrmMensagemKentro.Timer1Timer(Sender: TObject);
begin
  if (CheckBoxFoneCliente.Enabled) and (trim(MaskEditFoneCliente.Text) <> '') then
    SpeedButtonAtualizarClick(Sender)
  else if (CheckBoxFoneCelular.Enabled) and (trim(MaskEditFoneCelular.Text) <> '') then
    SpeedButtonAtualizarClick(Sender);
end;

procedure TfrmMensagemKentro._GravaConfiguracoesInteger(NomeVariavel: string;
  Valor: Integer);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
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
      Registro.WriteInteger(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TfrmMensagemKentro._LerConfiguracoesRegistroInteger(
  NomeVariavel: string; Adefault: Integer): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := Adefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadInteger(NomeVariavel);
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
