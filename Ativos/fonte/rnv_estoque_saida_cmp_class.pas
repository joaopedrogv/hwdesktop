unit rnv_estoque_saida_cmp_class;

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
  TRnv_estoque_saida_cmp_class = class(TBaseFb_class)
  private
    Fid             : Int64;
    Fcod_empresa    : Integer;
    Fnome           : string;
    Ftipodocumento  : string;
    Fnumerodocumento: string;
    Flogradouro     : string;
    Fnumero         : string;
    Fcep            : string;
    Fbairro         : string;
    Fcomplemento    : string;
    Fmun_id         : string;
    Fmun_nome       : string;
    Fmun_uf         : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id             : Int64   read Fid              write Fid;
    property cod_empresa    : Integer read Fcod_empresa     write Fcod_empresa;
    property nome           : string  read Fnome            write Fnome;
    property tipodocumento  : string  read Ftipodocumento   write Ftipodocumento;
    property numerodocumento: string  read Fnumerodocumento write Fnumerodocumento;
    property logradouro     : string  read Flogradouro      write Flogradouro;
    property numero         : string  read Fnumero          write Fnumero;
    property cep            : string  read Fcep             write Fcep;
    property bairro         : string  read Fbairro          write Fbairro;
    property complemento    : string  read Fcomplemento     write Fcomplemento;
    property mun_id         : string  read Fmun_id          write Fmun_id;
    property mun_nome       : string  read Fmun_nome        write Fmun_nome;
    property mun_uf         : string  read Fmun_uf          write Fmun_uf;
  end;

  TRnv_estoque_saida_cmps_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TRnv_estoque_saida_cmp_class;
    procedure SetItem(Index: Integer; const Value: TRnv_estoque_saida_cmp_class);
  public
    function New: TRnv_estoque_saida_cmp_class;

    property Items[Index: Integer]: TRnv_estoque_saida_cmp_class read GetItem write SetItem;
  end;

implementation

{ TRnv_estoque_saida_cmp_class }

procedure TRnv_estoque_saida_cmp_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('RNV_ESTOQUE_SAIDA_CMP');
  with FTable.Fields do
  begin
    AddField('ID'             , fkInteger, 0 , False, True, True);
    AddField('COD_EMPRESA'    , fkInteger, 0 , False, True, True);
    AddField('NOME'           , fkString , 40                   );
    AddField('TIPODOCUMENTO'  , fkString , 4                    );
    AddField('NUMERODOCUMENTO', fkString , 14                   );
    AddField('LOGRADOURO'     , fkString , 30                   );
    AddField('NUMERO'         , fkString , 5                    );
    AddField('CEP'            , fkString , 8                    );
    AddField('BAIRRO'         , fkString , 20                   );
    AddField('COMPLEMENTO'    , fkString , 20                   );
    AddField('MUN_ID'         , fkString , 16                   );
    AddField('MUN_NOME'       , fkString , 40                   );
    AddField('MUN_UF'         , fkString , 2                    );
  end;
end;

constructor TRnv_estoque_saida_cmp_class.Create;
begin
  InitializeObjects;
end;

{ TRnv_estoque_saida_cmps_class }

function TRnv_estoque_saida_cmps_class.GetItem(Index: Integer): TRnv_estoque_saida_cmp_class;
begin
  Result := TRnv_estoque_saida_cmp_class(inherited Items[Index]);
end;

function TRnv_estoque_saida_cmps_class.New: TRnv_estoque_saida_cmp_class;
begin
  Result := TRnv_estoque_saida_cmp_class.Create;
  Add(Result);
end;

procedure TRnv_estoque_saida_cmps_class.SetItem(Index: Integer; const Value: TRnv_estoque_saida_cmp_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TRnv_estoque_saida_cmp_class);
finalization
  UnRegisterClass(TRnv_estoque_saida_cmp_class);

end.
