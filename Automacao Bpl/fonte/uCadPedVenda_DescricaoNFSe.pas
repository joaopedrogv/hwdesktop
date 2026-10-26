unit uCadPedVenda_DescricaoNFSe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, uDataSet_OOP, ComCtrls, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  DiscriminacaoOSResult = record
  private
    FDiscriminacao: string;
    FNumeroNFSe: Int64;
    FDiscriminacaoSugerida: string;
  public
    property Discriminacao: string read FDiscriminacao;
    property DiscriminacaoSugerida: string read FDiscriminacaoSugerida;
    property NumeroNFSe: Int64 read FNumeroNFSe;
  end;

  IHandlerDiscriminacaoNFSe = interface
    ['{B413BF06-233F-41FD-B328-B2A042C3307B}']

    function ObterDiscriminacao(): DiscriminacaoOSResult;
    function SalvarDiscriminacao(const ATexto: string): Boolean;
    function ExcluirDiscriminacao(): Boolean;
  end;

  TfrmCadPedVenda_DescricaoNFSe = class(TfrmPadrao)
    Panel2: TPanel;
    BitBtn115: TBitBtn;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    edPersonalizado: TMemo;
    Label2: TLabel;
    Panel30: TPanel;
    btPersonalizado: TBitBtn;
    btExcluir: TBitBtn;
    Panel4: TPanel;
    btObsOS: TBitBtn;
    DBMemoObservacao: TDBMemo;
    btSugestao: TBitBtn;
    lbSize: TLabel;
    procedure edPersonalizadoChange(Sender: TObject);
    procedure btSugestaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btPersonalizadoClick(Sender: TObject);
  private
    FPedVeda: TDataSet_OOP;
    FDescrHandler: IHandlerDiscriminacaoNFSe;
    procedure Reset();
  public
    procedure Setup(APedVeda: TDataSet_OOP);
  end;

var
  frmCadPedVenda_DescricaoNFSe: TfrmCadPedVenda_DescricaoNFSe;

implementation

{$R *.dfm}

uses
  StrUtils, Query_OOP, hw_utils, hw_win_utils, uDtmPedVenda;

type
  THandlerDiscriminacaoNFSe = class(TInterfacedObject, IHandlerDiscriminacaoNFSe)
  private
    FNumeroPed, FEmpresaId: Integer;
    FTipoPed: string;
    FQuery: TQuery_OOP;
  public
    constructor Create(APedVeda: TDataSet_OOP);
    destructor Destroy; override;

    function ObterDiscriminacao(): DiscriminacaoOSResult;
    function SalvarDiscriminacao(const ATexto: string): Boolean;
    function ExcluirDiscriminacao(): Boolean;
  end;

{ THandlerDiscriminacaoNFSe }

constructor THandlerDiscriminacaoNFSe.Create(APedVeda: TDataSet_OOP);
begin
  FQuery := QueryHelper.CreateObj( APedVeda.buscas );
  FNumeroPed := APedVeda.fint('nped');
  FTipoPed := APedVeda.fstr('tipo');
  FEmpresaId := APedVeda.fint('cod_empresa');
end;

destructor THandlerDiscriminacaoNFSe.Destroy;
begin
  FQuery.Free();
  inherited;
end;

function THandlerDiscriminacaoNFSe.ExcluirDiscriminacao: Boolean;
begin
  Result := False;
  try
    FQuery.SQL('delete from DOC_ELETRONICO' +
               ' where ID_DOC = :ID_DOC and COD_EMPRESA = :COD_EMPRESA')
      .ParamValue('ID_DOC', Format('DISCRIMINACAO_NFS_%s_%d', [ FTipoPed, FNumeroPed ]) )
      .ParamValue('COD_EMPRESA', FEmpresaId)
      .ExecSQL().query
      .Transaction.Commit();

    Result := True;

  except on E: Exception do
    begin
      LogApp.Error('THandlerDiscriminacaoNFSe.SalvarDiscriminacao ' + e.Message);
      raise Exception.Create('Erro ao salvar discriminação. Por favor contacte o suporte técnico');
    end;
  end;
end;

function THandlerDiscriminacaoNFSe.ObterDiscriminacao: DiscriminacaoOSResult;
var
  resumo: Boolean;
  S: string;
begin
  {
  with TConfig_sistema_class.getConf('nfse_config', FQuery.query, FEmpresaId) do
  try
    resumo := ReadString('Impressao', 'DiscriminacaoSimples', 'N') = 'S';
  finally
    Free();
  end;
  }
  Result.FDiscriminacao := Trim(FQuery.Table('DOC_ELETRONICO', 'DOC')
    .Equals('ID_DOC', Format('DISCRIMINACAO_NFS_%s_%d', [ FTipoPed, FNumeroPed ]) )
    .Equals('COD_EMPRESA', FEmpresaId)
    .Scalar().AsString
  );

  FQuery.Open(
    'SELECT IT.DESC_SERV_PED, it.N_NF, e.NFSE_OBSOS_SEMENTER' +
    ' FROM PEDVENDA_SERV IT' +
    ' inner join empresa e on e.cod_empresa = it.cod_empresa' +
    ' WHERE it.nped = %d and it.tipo = ''%s'' and it.cod_empresa = %d' +
    ' order by 1',
    [FNumeroPed, FTipoPed, FEmpresaId]);

  S := '';
  Result.FNumeroNFSe := 0;

  while not FQuery.Eof do
  begin
    if FQuery.query.RecNo = 1 then
      S := ''
    else
      S := S + IfThen(FQuery.fequals('NFSE_OBSOS_SEMENTER', 'S') , ';' , sLineBreak );
    S := S + FQuery.fstr('DESC_SERV_PED');

    if FQuery.fint('n_nf') > 0 then
      Result.FNumeroNFSe := FQuery.fint('n_nf');

    FQuery.Next();
  end;
  FQuery.Close();

  Result.FDiscriminacaoSugerida := S;
end;

function THandlerDiscriminacaoNFSe.SalvarDiscriminacao(const ATexto: string): Boolean;
begin
  Result := False;
  try
    FQuery.SQL('update or insert into DOC_ELETRONICO(ID_DOC, COD_EMPRESA, DOC)' +
               ' values ' +
               ' (:ID_DOC, :COD_EMPRESA, :DOC)' +
               ' matching (ID_DOC, COD_EMPRESA)')
      .ParamValue('ID_DOC', Format('DISCRIMINACAO_NFS_%s_%d', [ FTipoPed, FNumeroPed ]) )
      .ParamValue('COD_EMPRESA', FEmpresaId)
      .ParamValue('DOC', ATexto)
      .ExecSQL().query
      .Transaction.Commit();

    Result := True;

  except on E: Exception do
    begin
      LogApp.Error('THandlerDiscriminacaoNFSe.SalvarDiscriminacao ' + e.Message);
      raise Exception.Create('Erro ao salvar discriminação. Por favor contacte o suporte técnico');
    end;
  end;
end;

{ TfrmCadPedVenda_DescricaoNFSe }

procedure TfrmCadPedVenda_DescricaoNFSe.btSugestaoClick(Sender: TObject);
begin
  edPersonalizado.ReadOnly := False;
  edPersonalizado.SetFocus();
  edPersonalizado.Lines.Text := btSugestao.Hint;

  btPersonalizado.Caption := 'Salvar';
  btExcluir.Caption := 'Cancelar';
  btExcluir.Visible := True;
end;

procedure TfrmCadPedVenda_DescricaoNFSe.btExcluirClick(Sender: TObject);
begin
  if btExcluir.Caption = 'Cancelar' then
    Reset()

  else if btExcluir.Caption = 'Excluir' then
  begin
    if not FPedVeda.Auditor.Processo('NFS010', 'OS ' + FPedVeda.fstr('nped'), FPedVeda.fstr('nped') )
      .Excluir.Permitido()
    then
      Exit;

    try

      if FDescrHandler.ExcluirDiscriminacao() then
      begin
        edPersonalizado.Lines.Clear;
        edPersonalizado.ReadOnly := True;
        btPersonalizado.Caption := 'Incluir';
        btExcluir.Visible := False;
      end;

    except on E: Exception do
      ShowErro(e.Message);
    end;
  end;
end;

procedure TfrmCadPedVenda_DescricaoNFSe.btPersonalizadoClick(Sender: TObject);
begin
  if MatchText(btPersonalizado.Caption, [ 'Alterar', 'Incluir' ]) then
  begin
    edPersonalizado.ReadOnly := False;
    edPersonalizado.SetFocus();
    btPersonalizado.Caption := 'Salvar';
    btExcluir.Caption := 'Cancelar';
    btExcluir.Visible := True;
  end
  else if btPersonalizado.Caption = 'Salvar' then
  begin
    if not FPedVeda.Auditor.Processo('NFS009', 'OS ' + FPedVeda.fstr('nped'), FPedVeda.fstr('nped') )
      .Salvar.Permitido()
    then
      Exit;

    try

      if FDescrHandler.SalvarDiscriminacao(edPersonalizado.Lines.Text) then
      begin
        edPersonalizado.ReadOnly := True;
        btPersonalizado.Caption := 'Alterar';
        btExcluir.Visible := True;
        btExcluir.Caption := 'Excluir';
        ShowAtencao('Discriminação salva com sucesso');
      end;

    except on E: Exception do
      ShowErro(e.Message);
    end;
  end;
end;

procedure TfrmCadPedVenda_DescricaoNFSe.edPersonalizadoChange(Sender: TObject);
begin
  lbSize.Caption := IntToStr(Length(edPersonalizado.Lines.Text));
end;

procedure TfrmCadPedVenda_DescricaoNFSe.FormCreate(Sender: TObject);
begin
  Self.Name := 'frmCadPedVenda_DescricaoNFSe';
end;

procedure TfrmCadPedVenda_DescricaoNFSe.Reset;
var
  descrResult: DiscriminacaoOSResult;
begin
  descrResult := FDescrHandler.ObterDiscriminacao();

  btObsOS.Enabled := True;//descrResult.NumeroNFSe = 0;
  if btObsOS.Enabled then
    btObsOS.Caption := 'Salvar'
  else
    btObsOS.Caption := 'Desabilitado';
  DBMemoObservacao.ReadOnly := not btObsOS.Enabled;

  btPersonalizado.Enabled := descrResult.NumeroNFSe = 0;
  btSugestao.Enabled := descrResult.NumeroNFSe = 0;

  if not btPersonalizado.Enabled then
    btPersonalizado.Caption := 'Desabilitado'
  else if descrResult.Discriminacao <> '' then
    btPersonalizado.Caption := 'Alterar'
  else
    btPersonalizado.Caption := 'Incluir';

  edPersonalizado.ReadOnly := True;
  edPersonalizado.Lines.Text := descrResult.Discriminacao;
  btSugestao.Hint := descrResult.DiscriminacaoSugerida;
  lbSize.Caption := IntToStr(Length(edPersonalizado.Lines.Text));

  btExcluir.Caption := 'Excluir';
  btExcluir.Visible := (descrResult.NumeroNFSe = 0) and (descrResult.Discriminacao <> '');

  if descrResult.Discriminacao <> '' then
    PageControl2.ActivePage := TabSheet2
  else
    PageControl2.ActivePage := TabSheet1;
end;

procedure TfrmCadPedVenda_DescricaoNFSe.Setup(APedVeda: TDataSet_OOP);
begin
  FPedVeda := APedVeda;
  FDescrHandler := THandlerDiscriminacaoNFSe.Create(APedVeda);

  Reset();
end;

end.
