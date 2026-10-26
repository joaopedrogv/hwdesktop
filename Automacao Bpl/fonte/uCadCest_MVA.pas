unit uCadCest_MVA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, CestVarianteMvaNcmUf_Model, ExtCtrls, StdCtrls, Buttons,
  uEditHw, DBCtrls, uClassesCEST, uDataSet_OOP;

type
  TfrmCadCest_MVA = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ed_variante_id: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ed_mva: TEditHw;
    list_ncm: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    lb_data_cad: TLabel;
    Label6: TLabel;
    lb_data_mod: TLabel;
    Label8: TLabel;
    lb_versao: TLabel;
    Label10: TLabel;
    lb_tipo_cadastro: TLabel;
    list_uf: TListBox;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ckDefault: TCheckBox;
    procedure ckDefaultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FMVA: TCestMvaM;
    Fexclusoes: TCEST_Exclusao;
    Variacoes: TDadosLookUp_OOP;
    FOwner: TCEST_;
    FEstados: string;
    FindiceMva: Integer;
    { Private declarations }
    procedure BuildForm;
    procedure BuildControlsUFs;
  public
    { Public declarations }
    property MVA: TCestMvaM read FMVA write FMVA;
    property exclusoes: TCEST_Exclusao read Fexclusoes write Fexclusoes;
    property Owner: TCEST_ read FOwner write FOwner;
    property Estados: string read FEstados write FEstados;
    property indiceMva: Integer read FindiceMva write FindiceMva;
  end;

var
  frmCadCest_MVA: TfrmCadCest_MVA;

implementation

uses
  hw_utils,
  uDtmAtivo,
  StrUtils,
  cest_mva_class, cest_mva_uf_class, uDadosIni, DB;

{$R *.dfm}

procedure TfrmCadCest_MVA.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if ed_variante_id.KeyValue = Null then
  begin
    ShowErro('Variante precisa ser informada');
    Exit;
  end;

  if ed_mva.AsValue <= 0 then
  begin
    ed_mva.AsValue := 0;

    if ShowConfirmacao('Quando MVA for encontrado zerado pelo sistema o item não será considerado como ST' + sLineBreak +
                       'Continuar assim mesmo') <> IDYES then
      Exit;
  end;

  if not ckDefault.Checked then  
    if list_uf.Count <= 0 then
    begin
      ShowErro('Nenhuma UF selecionada. Deseja continuar mesmo assim? ');
      Exit;
    end;

  MVA.mva := ed_mva.AsValue;
  MVA.cest_variante_id := ed_variante_id.KeyValue;
  MVA.ncm_excecao.Clear;
  //MVA.ncm_excecao.LineBreak := ',';
  for I := 0 to list_ncm.Count - 1 do
    if Trim(list_ncm.Items[I]) <> '' then
      MVA.ncm_excecao.Add(list_ncm.Items[I]);
  MVA.Variante.CopyFrom(FOwner.SqlOpen('select * from cest_variante where id = %d and cod_empresa = %s', [VarToInt(MVA.cest_variante_id), vDadosIni.codEmpresa]));
  MVA.ufs_aliq := IfThen(ckDefault.Checked, 'Padrao,', list_uf.Items.Text);
  while EndsStr(',', MVA.ufs_aliq) do
    MVA.ufs_aliq := Copy(MVA.ufs_aliq, 1 , Length(MVA.ufs_aliq) - 1);

  ModalResult := IDOK;
end;

procedure TfrmCadCest_MVA.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmCadCest_MVA.BuildControlsUFs;
begin
  SpeedButton1.Enabled := not ckDefault.Checked;
  SpeedButton2.Enabled := not ckDefault.Checked;
end;

procedure TfrmCadCest_MVA.BuildForm;
var
  I: Integer;
begin
  Variacoes  := TDadosLookUp_OOP.create;
  Variacoes.setDadosDataSet('id', 'descricao',
    FOwner.SqlOpen('select distinct id, descricao from cest_variante order by id'), ed_variante_id);

  if (VarToInt(FMVA.cest_variante_id) = 0) then
  begin
    Variacoes.dataSet.Filter:= 'descricao = ''Regra Geral''';
    try
      Variacoes.dataSet.Filtered := True;
      FMVA.cest_variante_id  := Variacoes.dataSet.FieldByName('id').AsInteger;
    finally
      Variacoes.dataSet.Filtered := False;
    end;
    //FMVA.UFs.New.uf        := vDadosIni.vEmp.vSiglaUF;
    //FMVA.cest_variante_id  := 1;
    ed_variante_id.Enabled := True;
  end
  else
    ed_variante_id.Enabled := False;

  lb_data_cad.Caption      := '';
  lb_data_mod.Caption      := '';
  ed_variante_id.KeyValue  := VarToInt(FMVA.cest_variante_id);
  ed_mva.AsValue           := FMVA.mva;
  //list_ncm.Items.LineBreak := ',';
  lb_versao.Caption        := FMVA.versao;
  lb_tipo_cadastro.Caption := TCest_Builder.VarToTipoCadastroCestStr(FMVA.origem);
  list_ncm.Items.Text      := FMVA.ncm_excecao.Text;
  list_uf.Items.LineBreak  := ',';
  list_uf.Items.Text       := FMVA.ufs_aliq;
  if list_uf.Items.IndexOf('Padrao') >= 0 then
  begin                                                   
    list_uf.Items.Clear;
    ckDefault.Checked := True;
  end
  else
    ckDefault.Checked := False;
  BuildControlsUFs;

  {
  list_uf.Items.Clear;

  for I := 0 to FMVA.UFs.Count - 1 do
    list_uf.Items.Add(FMVA.UFs.Items[I].uf);
  }
  if not VarIsEmpty(FMVA.data_cadastro) then
    lb_data_cad.Caption := FormatDateTime('dd/MM/yyyy hh:mm:ss', VarToDateTime(FMVA.data_cadastro));
  if not VarIsEmpty(FMVA.data_modificacao) then
    lb_data_mod.Caption := FormatDateTime('dd/MM/yyyy hh:mm:ss', VarToDateTime(FMVA.data_modificacao));
end;

procedure TfrmCadCest_MVA.ckDefaultClick(Sender: TObject);
begin
  inherited;
  try
    if ckDefault.Checked then
      if list_uf.Count > 0 then
      begin
        if ShowConfirmacao('Esse cadastro já possui estados na lista. Se continuar a lista de estados será perdida' + sLineBreak +
                           'Continuar mesmo assim?') = ID_YES then
          list_uf.Items.Clear
        else
          ckDefault.Checked := False;
      end;
  finally
    BuildControlsUFs;
  end;
end;

procedure TfrmCadCest_MVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(Variacoes);

  Action := caFree;
  frmCadCest_MVA := nil;
end;

procedure TfrmCadCest_MVA.FormCreate(Sender: TObject);
begin
  inherited;
  Variacoes := TDadosLookUp_OOP.create;
end;

procedure TfrmCadCest_MVA.FormShow(Sender: TObject);
begin
  inherited;
  BuildForm;
end;

procedure TfrmCadCest_MVA.SpeedButton14Click(Sender: TObject);
var
  Str: string;
  I: Integer;
begin
  inherited;

  if not InputQuery('NCM', 'Informe o NCM, minimo de 4 dígitos e máximo de 8', Str) then
    Exit;

  Str := OnlyNumber(Str);
  if not (Length(Str) in [4,5,6,7,8]) then
  begin
    ShowErro('NCM incorreto. Favor informar de 4 a 8 dígitos');
    Exit;
  end;

  for I := 0 to list_ncm.Count - 1 do
    if list_ncm.Items[I] = Str then
    begin
      ShowErro('NCM já existe na lista');
      Exit;
    end;

  list_ncm.Items.Add(Str);
end;

procedure TfrmCadCest_MVA.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if (list_ncm.Items.Count >= 0) and (list_ncm.ItemIndex >= 0) then
    if ShowConfirmacao('Excluir NCM "%s"?', [list_ncm.Items[list_ncm.ItemIndex]]) = ID_YES then
      list_ncm.Items.Delete(list_ncm.ItemIndex);
end;

procedure TfrmCadCest_MVA.SpeedButton1Click(Sender: TObject);
var
  Str: string;
  I, J: Integer;
begin
  inherited;

  if not InputQuery('UF', 'Informe a sigla da UF', Str) then
    Exit;

  Str := UpperCase(Trim(Str));

  if NewStringList(False, vDadosIni.getListaUF()).IndexOf(Str) <= -1 then
  begin
    ShowErro('UF informada inválida');
    Exit;
  end;

  for I := 0 to list_uf.Count - 1 do
    if Trim(list_uf.Items[I]) = Str then
    begin
      ShowErro('UF já existe na lista');
      Exit;
    end;

  if not ContainsText(Estados, Str) then
  begin
    ShowErro('UF não está na lista do cadastro do CEST' + sLineBreak +
             'Informar apenas UF que façam parte do Convênio ou Protocolo');
    Exit;
  end;

  for I := 0 to FOwner.objeto.MVAs.Count - 1 do
    if I <> indiceMva then
      if (ContainsText(FOwner.objeto.MVAs.Items[I].ufs_aliq, Str)) and
        (VarToInt(ed_variante_id.KeyValue) = VarToInt(FOwner.objeto.MVAs.Items[I].cest_variante_id)) then
      begin
        ShowErro('UF já está não está na lista de outro MVA para mesma Variação' + sLineBreak +
                 'MVA: %n', [VarToFloat(FOwner.objeto.MVAs.Items[I].mva)] );
        Exit;
      end;

  list_uf.Items.Add(UpperCase(Str));
end;

procedure TfrmCadCest_MVA.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if (list_uf.Items.Count >= 0) and (list_uf.ItemIndex >= 0) then
    if ShowConfirmacao('Excluir UF "%s"?', [list_uf.Items[list_uf.ItemIndex]]) = ID_YES then
      list_uf.Items.Delete(list_uf.ItemIndex);
end;

end.
