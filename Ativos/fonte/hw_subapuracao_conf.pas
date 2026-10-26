unit hw_subapuracao_conf;

interface

uses
  {$IFDEF VER180}
  IBDatabase, uEditHw,
  {$ELSE}
  IBX.IBDatabase, hw_edits_dx,
  {$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, ComCtrls,
  config_sistema_class, DB,  uClasseConexao, hw_strings;

type
  TSubApuracaoConf = class
  private
    context: TConexao;
    empresaId: Integer;
    FconfSis: TConfig_sistema_class;
    Fconf: TStrings;
  public
    constructor Create(database: TIBDatabase; cod_empresa: Integer);
    destructor Destroy; override;

    function SaveConf: Boolean;

    property conf: TStrings read Fconf write Fconf;
  end;

  SubApuracaoUtils = class
  public
    class procedure ShowConf(database: TIBDatabase; cod_empresa: Integer);
    class function GetConf(database: TIBDatabase; cod_empresa: Integer): TSubApuracaoConf;
  end;

  TfrmSubApuracaoConf = class(TForm)
    page1920Conf: TPageControl;
    tsConf: TTabSheet;
    Panel23: TPanel;
    GridPanel2: TGridPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label14: TLabel;
    Label16: TLabel;
    ed_IndicadorApuracaoIcms1900: TComboBox;
    ed_DescricaoComplementar1900: TMaskEdit;
    Label18: TLabel;
    Label19: TLabel;
    ed_CodigoObrigacaoRecolher1926: TMaskEdit;
    ed_CodigoReceitaObrigacaoRecolher1926: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    ed_DiaVencimentoObrigacaoRecolher1926: TEditHw;
    ed_IndicadorProcessoObrigacaoRecolher1926: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    ed_NumeroProcessoObrigacaoRecolher1926: TMaskEdit;
    ed_DescricaoProcessoObrigacaoRecolher1926: TMaskEdit;
    Label24: TLabel;
    ed_TextoComplementarObrigacaoRecolher1926: TMaskEdit;
    Panel26: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FSubConf: TSubApuracaoConf;

    procedure MapDataToForm;
    procedure MapFormToData;
  public
    property SubConf: TSubApuracaoConf read FSubConf write FSubConf;
  end;

var
  frmSubApuracaoConf: TfrmSubApuracaoConf;

implementation

uses Query_OOP;

{$R *.dfm}

{ SubApuracaoUtils }

class function SubApuracaoUtils.GetConf(database: TIBDatabase;
  cod_empresa: Integer): TSubApuracaoConf;
begin
  Result := TSubApuracaoConf.Create(database, cod_empresa);
end;

class procedure SubApuracaoUtils.ShowConf(database: TIBDatabase; cod_empresa: Integer);
var
  SubConf: TSubApuracaoConf;
begin
  Application.CreateForm(TfrmSubApuracaoConf, frmSubApuracaoConf);
  SubConf := TSubApuracaoConf.Create(database, cod_empresa);
  try
    frmSubApuracaoConf.SubConf := SubConf;
    frmSubApuracaoConf.ShowModal;
  finally
    SubConf.Free;
  end;
end;

{ TSubApuracaoConf }

constructor TSubApuracaoConf.Create(database: TIBDatabase;
  cod_empresa: Integer);
var
  query: TQuery_OOP;
begin
  context := TConexao.Create(database);
  empresaId := cod_empresa;
  FconfSis := TCfg_sis.getConf('efd_icms_sub_apuracao_1900', context.QrAux, cod_empresa);

  if FconfSis.chave <> 'efd_icms_sub_apuracao_1900' then
  begin
    query := QueryHelper
      .CreateObj(context.QrAux, 'select id, conf from efd_ajustes_conf_tipo' +
                                ' where tipo = 2 and coalesce(cod_ajuste, '''') <> '''' and ativo = 1')
      .Open();
    try
      while not query.Eof do
      begin
        if not query.fempty('conf') then
        begin
          FconfSis.value1_b.Text := query.fstr('conf');
          Break;
        end;

        query.Next;
      end;

      FconfSis.chave       := 'efd_icms_sub_apuracao_1900';
      FconfSis.type1_      := typeBlob;
      FconfSis.cod_empresa := cod_empresa;
      FconfSis.ativo       := 1;
      FconfSis.display_    := 'EFD - Configuração da Subapuração';

      FconfSis.SaveConfDB(context.QrAux).Transaction.Commit;


    finally
      query.Free;
    end;
  end;

  Fconf := TStringList.Create;
  Fconf.Text := FconfSis.value1_b.Text;

end;

destructor TSubApuracaoConf.Destroy;
begin
  context.Free;
  Fconf.Free;
  FconfSis.Free;
  inherited;
end;

function TSubApuracaoConf.SaveConf: Boolean;
begin
  try
    FconfSis.value1_b.Text := Fconf.Text;

    FconfSis.SaveConfDB(context.QrAux).Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      context.registraErro('TSubApuracaoConf.SaveConf ' + e.Message);
      ShowMessage('Erro ao salvar conf Subapuração: ' + E.Message);
    end;
  end;

end;

{ TfrmSubApuracaoConf }

procedure TfrmSubApuracaoConf.BitBtn7Click(Sender: TObject);
begin
  inherited;
  MapFormToData;

  if SubConf.SaveConf then
    ModalResult := IDOK; 

end;

procedure TfrmSubApuracaoConf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmSubApuracaoConf := nil;
end;

procedure TfrmSubApuracaoConf.FormCreate(Sender: TObject);
begin
  inherited;
  tsConf.TabVisible := False;
end;

procedure TfrmSubApuracaoConf.FormShow(Sender: TObject);
begin
  inherited;
  page1920Conf.ActivePage := tsConf;
  Self.Height := Self.Height - 21;
  MapDataToForm;
end;

procedure TfrmSubApuracaoConf.MapDataToForm;
var
  I: Integer;
//  conf: TStrings;
  value: string;
begin
  ed_IndicadorApuracaoIcms1900.ItemIndex := -1;

  value := Copy(SubConf.conf.Values['IndicadorApuracaoIcms1900'], 1, 1);
  for I := 0 to ed_IndicadorApuracaoIcms1900.Items.Count - 1 do
    if Copy(ed_IndicadorApuracaoIcms1900.Items[I], 1, 1) = value then
      ed_IndicadorApuracaoIcms1900.ItemIndex := I;

  if ed_IndicadorApuracaoIcms1900.ItemIndex = -1 then
    ed_IndicadorApuracaoIcms1900.ItemIndex := 0;

  ed_DescricaoComplementar1900.Text := SubConf.conf.Values['DescricaoComplementar1900'];
  ed_CodigoObrigacaoRecolher1926.Text := SubConf.conf.Values['CodigoObrigacaoRecolher1926'];
  ed_CodigoReceitaObrigacaoRecolher1926.Text := SubConf.conf.Values['CodigoReceitaObrigacaoRecolher1926'];
  ed_NumeroProcessoObrigacaoRecolher1926.Text := SubConf.conf.Values['NumeroProcessoObrigacaoRecolher1926'];
  ed_DescricaoProcessoObrigacaoRecolher1926.Text := SubConf.conf.Values['DescricaoProcessoObrigacaoRecolher1926'];
  ed_TextoComplementarObrigacaoRecolher1926.Text := SubConf.conf.Values['TextoComplementarObrigacaoRecolher1926'];


  value := SubConf.conf.Values['DiaVencimentoObrigacaoRecolher1926'];
  I := 9;
  TryStrToInt(value, I);
  ed_DiaVencimentoObrigacaoRecolher1926.AsValue := I;

  value := Copy(SubConf.conf.Values['IndicadorProcessoObrigacaoRecolher1926'], 1, 1);
  for I := 0 to ed_IndicadorProcessoObrigacaoRecolher1926.Items.Count - 1 do
    if Copy(ed_IndicadorProcessoObrigacaoRecolher1926.Items[I], 1, 1) = value then
      ed_IndicadorProcessoObrigacaoRecolher1926.ItemIndex := I;
end;

procedure TfrmSubApuracaoConf.MapFormToData;
var
  I: Integer;
  value: string;
begin

  SubConf.conf.Values['IndicadorApuracaoIcms1900'] := Copy(ed_IndicadorApuracaoIcms1900.Text, 1, 1);
  SubConf.conf.Values['DescricaoComplementar1900'] := ed_DescricaoComplementar1900.Text;
  SubConf.conf.Values['CodigoObrigacaoRecolher1926'] := ed_CodigoObrigacaoRecolher1926.Text;
  SubConf.conf.Values['CodigoReceitaObrigacaoRecolher1926'] := ed_CodigoReceitaObrigacaoRecolher1926.Text;
  SubConf.conf.Values['NumeroProcessoObrigacaoRecolher1926'] := ed_NumeroProcessoObrigacaoRecolher1926.Text;
  SubConf.conf.Values['DescricaoProcessoObrigacaoRecolher1926'] := ed_DescricaoProcessoObrigacaoRecolher1926.Text;
  SubConf.conf.Values['TextoComplementarObrigacaoRecolher1926'] := ed_TextoComplementarObrigacaoRecolher1926.Text;
  SubConf.conf.Values['DiaVencimentoObrigacaoRecolher1926'] := IntToStr(ed_DiaVencimentoObrigacaoRecolher1926.AsInteger);
  SubConf.conf.Values['IndicadorProcessoObrigacaoRecolher1926'] := Copy(ed_IndicadorProcessoObrigacaoRecolher1926.Text, 1, 1);

end;

end.
