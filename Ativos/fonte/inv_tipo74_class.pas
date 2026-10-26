unit inv_tipo74_class;

interface

uses
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
  TInv_tipo74_class = class(TBaseFb_class)
  private
    Fdata_inv    : TDateTime;
    Fcod_empresa : Integer;
    Fgrupo_prod  : Integer;
    Fcod_prod    : string;
    Fquantidade  : Variant;
    Fvalor_prod  : Variant;
    Fcodigo_posse: string;
    Fcnpj_posse  : string;
    Finscr_posse : string;
    Fuf_posse    : string;
    Fchassi_mt   : string;
    Fvalor_icms  : Variant;
    Fvalor_pis   : Variant;
    Fvalor_cofins: Variant;
    Fid          : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property data_inv    : TDateTime read Fdata_inv     write Fdata_inv;
    property cod_empresa : Integer   read Fcod_empresa  write Fcod_empresa;
    property grupo_prod  : Integer   read Fgrupo_prod   write Fgrupo_prod;
    property cod_prod    : string    read Fcod_prod     write Fcod_prod;
    property quantidade  : Variant   read Fquantidade   write Fquantidade;
    property valor_prod  : Variant   read Fvalor_prod   write Fvalor_prod;
    property codigo_posse: string    read Fcodigo_posse write Fcodigo_posse;
    property cnpj_posse  : string    read Fcnpj_posse   write Fcnpj_posse;
    property inscr_posse : string    read Finscr_posse  write Finscr_posse;
    property uf_posse    : string    read Fuf_posse     write Fuf_posse;
    property chassi_mt   : string    read Fchassi_mt    write Fchassi_mt;
    property valor_icms  : Variant   read Fvalor_icms   write Fvalor_icms;
    property valor_pis   : Variant   read Fvalor_pis    write Fvalor_pis;
    property valor_cofins: Variant   read Fvalor_cofins write Fvalor_cofins;
    property id          : Variant   read Fid           write Fid;
  end;

  TInv_tipo74s_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TInv_tipo74_class;
    procedure SetItem(Index: Integer; const Value: TInv_tipo74_class);
  public
    function New: TInv_tipo74_class;

    property Items[Index: Integer]: TInv_tipo74_class read GetItem write SetItem;
  end;

implementation

{ TInv_tipo74_class }

procedure TInv_tipo74_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('INV_TIPO74');
  with FTable.Fields do
  begin
    AddField('DATA_INV'    , fkDateTime, 0, False, True);
    AddField('COD_EMPRESA' , fkInteger , 0, False, True);
    AddField('GRUPO_PROD'  , fkInteger , 0, False, True);
    AddField('COD_PROD'    , fkString  , 0, False, True);
    AddField('QUANTIDADE'  , fkFloat                   );
    AddField('VALOR_PROD'  , fkFloat                   );
    AddField('CODIGO_POSSE', fkString  , 0, False      );
    AddField('CNPJ_POSSE'  , fkString                  );
    AddField('INSCR_POSSE' , fkString                  );
    AddField('UF_POSSE'    , fkString                  );
    AddField('CHASSI_MT'   , fkString                  );
    AddField('VALOR_ICMS'  , fkFloat                   );
    AddField('VALOR_PIS'   , fkFloat                   );
    AddField('VALOR_COFINS', fkFloat                   );
    AddField('ID'          , fkInteger                 );
  end;
end;

constructor TInv_tipo74_class.Create;
begin
  InitializeObjects;
end;

{ TInv_tipo74s_class }

function TInv_tipo74s_class.GetItem(Index: Integer): TInv_tipo74_class;
begin
  Result := TInv_tipo74_class(inherited Items[Index]);
end;

function TInv_tipo74s_class.New: TInv_tipo74_class;
begin
  Result := TInv_tipo74_class.Create;
  Add(Result);
end;

procedure TInv_tipo74s_class.SetItem(Index: Integer; const Value: TInv_tipo74_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TInv_tipo74_class);
finalization
  UnRegisterClass(TInv_tipo74_class);

end.
