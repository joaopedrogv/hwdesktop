unit PedVendaOrc_Model;

interface

uses
  uClasseConexao,
  uDtmAtivo,
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type

  TPedVendaProdOrc_Model = class(TBaseFb_class)
  private
    Fnitem          : Integer;
    Fgrupo_prod     : Integer;
    Fcod_prod       : string;
    Fcod_grade      : Integer;
    Fdescr_prod_ped : string;
    Fquant_ped_item : Double;
    Fvlun_ped_item  : Double;
    Fvltot_ped_item : Double;
    Frateio_desc    : Double;
    Frateio_acresc  : Double;
    Fqtde_disponivel: Double;
    Fqtde_usada     : Double;
    Fdesc_usado     : Double;
    Facresc_usado   : Double;
    Fuvnd           : string;
    Fuvnd_fator     : Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    procedure UsarItem(Quantidade: Double);

    property nitem          : Integer read Fnitem           write Fnitem;
    property grupo_prod     : Integer read Fgrupo_prod      write Fgrupo_prod;
    property cod_prod       : string  read Fcod_prod        write Fcod_prod;
    property cod_grade      : Integer read Fcod_grade       write Fcod_grade;
    property descr_prod_ped : string  read Fdescr_prod_ped  write Fdescr_prod_ped;
    property quant_ped_item : Double  read Fquant_ped_item  write Fquant_ped_item;
    property vlun_ped_item  : Double  read Fvlun_ped_item   write Fvlun_ped_item;
    property vltot_ped_item : Double  read Fvltot_ped_item  write Fvltot_ped_item;
    property rateio_desc    : Double  read Frateio_desc     write Frateio_desc;
    property rateio_acresc  : Double  read Frateio_acresc   write Frateio_acresc;
    property qtde_disponivel: Double  read Fqtde_disponivel write Fqtde_disponivel;
    property qtde_usada     : Double  read Fqtde_usada      write Fqtde_usada;
    property desc_usado     : Double  read Fdesc_usado      write Fdesc_usado;
    property acresc_usado   : Double  read Facresc_usado    write Facresc_usado;
    property uvnd           : string  read Fuvnd            write Fuvnd;
    property uvnd_fator     : Double  read Fuvnd_fator      write Fuvnd_fator;
  end;

  TPedVendaProdOrcs_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TPedVendaProdOrc_Model;
    procedure SetItem(Index: Integer; const Value: TPedVendaProdOrc_Model);
  public
    function New: TPedVendaProdOrc_Model;
    procedure Reset;
    property Items[Index: Integer]: TPedVendaProdOrc_Model read GetItem write SetItem;
  end;

  TPedVendaOrc_Model = class(TBaseFb_class)
  private
    Fnped        : Integer;
    Ftipo        : string;
    Fcod_empresa : Integer;
    Fdata_ped    : TDateTime;
    Fcod_vendedor: Integer;
    FProdutos    : TPedVendaProdOrcs_Model;
    Fncupom      : Integer;
    Fcod_nfce    : Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure LocateAndUse(NumItem, Grupo: Integer; CodProd: string; Quantidade: Double);

  published

    property nped        : Integer                 read Fnped         write Fnped;
    property tipo        : string                  read Ftipo         write Ftipo;
    property cod_empresa : Integer                 read Fcod_empresa  write Fcod_empresa;
    property data_ped    : TDateTime               read Fdata_ped     write Fdata_ped;
    property cod_vendedor: Integer                 read Fcod_vendedor write Fcod_vendedor;
    property ncupom      : Integer                 read Fncupom       write Fncupom;
    property cod_nfce    : Integer                 read Fcod_nfce     write Fcod_nfce;
    property Produtos    : TPedVendaProdOrcs_Model read FProdutos     write FProdutos;
  end;

  TPedVendaOrc_Builder = class
  private
    class procedure GetDependences(Orcamento: TPedVendaOrc_Model; Con: TConexao);
  public
    class function GetOrcamento(Numero: Integer): TPedVendaOrc_Model; 
    class function GetItensDisponiveis(var Orcamento: TPedVendaOrc_Model; Grupo: Integer; CodProd: string; Quantidade: Double): TPedVendaProdOrcs_Model;
  end;

implementation

uses
  SysUtils,
  Math;

{ TPedVendaProdOrc_Model }

procedure TPedVendaProdOrc_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

procedure TPedVendaProdOrc_Model.UsarItem(Quantidade: Double);
var
  desc_un, acresc_un: Double;
begin
  qtde_disponivel := qtde_disponivel - Quantidade;
  qtde_usada      := Quantidade;

  desc_un   := RoundTo(rateio_desc   / quant_ped_item, -2);
  acresc_un := RoundTo(rateio_acresc / quant_ped_item, -2);

  desc_un   := desc_un   + IfThen((desc_un   * quant_ped_item) > rateio_desc  , -0.01);
  acresc_un := acresc_un + IfThen((acresc_un * quant_ped_item) > rateio_acresc, -0.01);

  desc_usado   := RoundTo(desc_un      * qtde_usada, -2);
  acresc_usado := RoundTo(acresc_usado * qtde_usada, -2);

end;

constructor TPedVendaProdOrc_Model.Create;
begin
  InitializeObjects;
end;

{ TPedVendaProdOrcs_Model }

function TPedVendaProdOrcs_Model.GetItem(Index: Integer): TPedVendaProdOrc_Model;
begin
  Result := TPedVendaProdOrc_Model(inherited Items[Index]);
end;

function TPedVendaProdOrcs_Model.New: TPedVendaProdOrc_Model;
begin
  Result := TPedVendaProdOrc_Model.Create;
  Add(Result);
end;

procedure TPedVendaProdOrcs_Model.Reset;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do with Self.Items[I] do
  begin
    qtde_disponivel := quant_ped_item;
    qtde_usada      := 0;
    desc_usado      := 0;
    acresc_usado    := 0;
  end;
end;

procedure TPedVendaProdOrcs_Model.SetItem(Index: Integer; const Value: TPedVendaProdOrc_Model);
begin
  Put(Index, Value);
end;

{ TPedVendaOrc_Model }

constructor TPedVendaOrc_Model.Create;
begin
  InitializeObjects;
end;               

destructor TPedVendaOrc_Model.Destroy;
begin
  if Assigned(FProdutos    ) then FreeAndNil(FProdutos);
  inherited;
end;

procedure TPedVendaOrc_Model.InitializeObjects;
begin
  Ftable    :=  TTableFb.Create('--ClassModelNoTable--');
  FProdutos := TPedVendaProdOrcs_Model.Create;
end;

procedure TPedVendaOrc_Model.LocateAndUse(NumItem, Grupo: Integer;
  CodProd: string; Quantidade: Double);
var
  I: Integer;
begin
  for I := 0 to Produtos.Count - 1 do with Produtos.Items[I] do
    if (nitem = NumItem) and (grupo_prod = Grupo) and (cod_prod = CodProd) then
    begin
      UsarItem(Quantidade);
      Break;
    end;
end;

{ TPedVendaOrc_Builder }

class procedure TPedVendaOrc_Builder.GetDependences(
  Orcamento: TPedVendaOrc_Model; Con: TConexao);
begin
  Orcamento.Produtos.CopyFrom(TPedVendaProdOrc_Model,
                              Con.SqlOpen('select pp.nitem, pp.grupo_prod, pp.cod_prod, pp.cod_grade, pp.descr_prod_ped,' +
                                          ' pp.quant_ped_item, pp.vlun_ped_item, pp.vltot_ped_item,' +
                                          ' pp.rateio_desc, pp.rateio_acresc,' +
                                          ' pp.quant_ped_item qtde_disponivel,' +
                                          ' pp.rateio_desc desc_disponivel,' +
                                          ' pp.rateio_acresc acresc_disponivel,' +
                                          ' 0.0 qtde_usada,' +
                                          ' 0.0 desc_usado,' +
                                          ' 0.0 acresc_usado,' +
                                          ' pf.uvnd, pf.uvnd_fator' +
                                          ' from pedvenda_prod_fator pf' +
                                          ' inner join pedvenda_prod pp on (pf.nped = pp.nped) and (pf.tipo = pp.tipo) and (pf.grupo_prod = pp.grupo_prod) and (pf.cod_prod = pp.cod_prod)' +
                                          '   and (pf.nitem = pp.nitem) and (pf.cod_empresa = pp.cod_empresa) and (pf.cod_grade = pp.cod_grade) and (pf.codigo_nop = pp.codigo_nop)' +
                                          ' where pf.nped = %d and pf.tipo = %s and pf.cod_empresa = %d order by pp.nitem',
                                          [Orcamento.nped, QuotedStr(Orcamento.tipo), Orcamento.cod_empresa]), False);
end;

class function TPedVendaOrc_Builder.GetItensDisponiveis(
  var Orcamento: TPedVendaOrc_Model; Grupo: Integer; CodProd: string;
  Quantidade: Double): TPedVendaProdOrcs_Model;
var
  I: Integer;
begin
  Result := TPedVendaProdOrcs_Model.Create;

  for I := 0 to Orcamento.Produtos.Count - 1 do with Orcamento.Produtos.Items[I] do
    if (grupo_prod = Grupo) and (cod_prod = CodProd) and (qtde_disponivel > 0) then
    begin

      if Quantidade > qtde_disponivel then
      begin
        UsarItem(qtde_disponivel);
        Result.Add(Orcamento.Produtos.Items[I]);
      end
      else if Quantidade > 0 then
      begin
        UsarItem(Quantidade);
        Result.Add(Orcamento.Produtos.Items[I]);
      end;

      Quantidade := Quantidade - qtde_usada;
      if Quantidade <= 0 then
        Break;

    end;
end;

class function TPedVendaOrc_Builder.GetOrcamento(
  Numero: Integer): TPedVendaOrc_Model;
var
  Con: TConexao;
begin

  Con := TConexao.Create(dtmAtivo.bancoHw);
  try

    Result := TPedVendaOrc_Model.Create;
    Result.CopyFrom(Con.SqlOpen('select pv.nped, pv.tipo, pv.cod_empresa, pv.data_ped, pv.cod_vendedor,' +
                                ' pv.ncupom, pv.cod_nfce' +
                                ' from pedvenda pv' +
                                ' where pv.nped = %d and pv.tipo = %s and pv.cod_empresa = %d',
                                [Numero, QuotedStr('ORC'), vDadosIni.cod_empresa]), False);

    GetDependences(Result, Con);

  finally
    if Assigned(Con) then FreeAndNil(Con);
  end;
end;

initialization
  RegisterClass(TPedVendaProdOrc_Model);
  RegisterClass(TPedVendaOrc_Model);
finalization
  UnRegisterClass(TPedVendaProdOrc_Model);
  UnRegisterClass(TPedVendaOrc_Model);

end.
