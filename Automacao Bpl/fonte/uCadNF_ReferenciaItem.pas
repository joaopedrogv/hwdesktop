unit uCadNF_ReferenciaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Mask,
  uDataSet_OOP, uClassesNotasFiscais_Tipos, uEditHw;

type
  TItemNFeRef = class(TDataSet_OOP)
  public
    procedure Inicializar(const AChaveNFe: string);
  end;

  TFrmCadNF_ReferenciaItem = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox77: TGroupBox;
    Panel117: TPanel;
    BitBtn132: TBitBtn;
    GroupBox78: TGroupBox;
    DBGrid34: TDBGrid;
    Panel2: TPanel;
    Label480: TLabel;
    Label481: TLabel;
    Label482: TLabel;
    edNumero: TEdit;
    edSerie: TEdit;
    edEmissao: TEdit;
    Label1: TLabel;
    edChaveNFe: TMaskEdit;
    edNItemNFeRef: TEditHw;
    procedure BitBtn132Click(Sender: TObject);
    procedure DBGrid34DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Items: TItemNFeRef;
    FChaveNFe: string;
    FNItemRefNFe: Integer;
    Referencia: TNotaFiscalRefenciaResult;
    ExistePorNitemXML: Boolean;
    procedure SetNItemRefNFe(const Value: Integer);
    procedure SetChaveNFe(const Value: string);
  public
    property ChaveNFe: string read FChaveNFe write SetChaveNFe;
    property NItemRefNFe: Integer read FNItemRefNFe write SetNItemRefNFe;
  end;

  ReferenciaItemUtils = class
  public
    class function Referenciar(AChaveNFe: string; ANItem: Integer = 0): TNotaFiscalRefenciaResult;
  end;

implementation

uses
  uDtmAtivo, hw_utils, hw_const_types;

{$R *.dfm}

procedure TFrmCadNF_ReferenciaItem.BitBtn132Click(Sender: TObject);
begin
  inherited;

  FNItemRefNFe := Items.fint('nitem_xml');
  if FNItemRefNFe <= 0 then
    FNItemRefNFe := Items.fint('nitem');

  ModalResult := mrOk;

end;

procedure TFrmCadNF_ReferenciaItem.DBGrid34DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (ExistePorNitemXML and ( Items.fint('nitem_xml') = NItemRefNFe)) or
   (not ExistePorNitemXML and ( Items.fint('nitem') = NItemRefNFe)) then
  begin
    DBGrid34.Canvas.Brush.Color := $00FFD9B3;
    DBGrid34.Canvas.Font.Color := clWindowText;
    DBGrid34.Canvas.FillRect(Rect);
    DBGrid34.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TFrmCadNF_ReferenciaItem.FormCreate(Sender: TObject);
begin
  inherited;
  Items := TItemNFeRef.Create(dtmAtivo.bancoHw);
end;

procedure TFrmCadNF_ReferenciaItem.FormDestroy(Sender: TObject);
begin
  inherited;
  Items.Free();
end;

procedure TFrmCadNF_ReferenciaItem.SetChaveNFe(const Value: string);
begin
  FChaveNFe := Value;
  Referencia.ChaveNFe := Value;

  edChaveNFe.Text := Referencia.ChaveNFe;
  edSerie.Text := Referencia.Serie;
  edEmissao.Text := Referencia.Emissao;
  edNumero.Text := IntToStr(Referencia.Numero);

  Items.Inicializar(Value);
  DBGrid34.DataSource := Items._dataSourceOOP;
end;

procedure TFrmCadNF_ReferenciaItem.SetNItemRefNFe(const Value: Integer);
begin
  if not Items.Active then
    raise exception.Create('TFrmCadNF_ReferenciaItem.SetNItemRefNFe. Chave NFe precisa ser informada primeiro');

  FNItemRefNFe := Value;
  Referencia.NItem := Value;

  edNItemNFeRef.AsValue := Value;

  ExistePorNitemXML := Items.dataSet.Locate('NITEM_XML', Value, []);
  if not ExistePorNitemXML then
    Items.dataSet.Locate('NITEM', Value, []);
end;

{ ReferenciaItemUtils }

class function ReferenciaItemUtils.Referenciar(AChaveNFe: string;
  ANItem: Integer): TNotaFiscalRefenciaResult;
var
  form: TFrmCadNF_ReferenciaItem;
begin

  AChaveNFe := OnlyNumber(AChaveNFe);
  if Length(AChaveNFe) <> 44 then
    raise ValidacaoException.Create('Chave da NFe inválida ou não informada');

  form := TFrmCadNF_ReferenciaItem.Create(nil);
  try

    form.ChaveNFe := AChaveNFe;
    form.NItemRefNFe := ANItem;

    if form.ShowModal() = 1 then
    begin
      Result.ChaveNFe := form.ChaveNFe;
      Result.NItem := form.NItemRefNFe;
    end;  

  finally
    form.Free;
  end;
end;

{ TItemNFeRef }

procedure TItemNFeRef.Inicializar(const AChaveNFe: string);
begin
  Self.ClientOpen(
    Self.queryCons.Table('notafiscal n', 'ni.*')
      .Join('notafiscal_item ni', 'ni.cod_nf = n.cod_nf and ni.cod_empresa = n.cod_empresa')
      .Equals('n.chave_nfe', AChaveNFe)
      .Equals('n.status', 'Fechada')
      .Equals('n.cod_empresa', vDadosIni.cod_empresa)
      .SQLText
  );

  if Self.IsEmpty then
    raise ValidacaoException.Create('Nota fiscal informada não encontrada ou sem itens');
end;

end.
