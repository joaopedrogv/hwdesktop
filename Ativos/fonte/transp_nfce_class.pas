unit transp_nfce_class;

interface

uses
  Contnrs,
  DB;

type
  Ttransp_nfce_class = class(TObject)
  private
    Fcpfcgc         : string;
    Frazao          : string;
    Fendereco       : string;
    Fnum_end_cliente: string;
    Fcomplemento    : string;
    Fbairro         : string;
    Fibge_cod_cidade: Integer;
    Fnome_cidade    : string;
    Fsigla_uf       : string;
    Fcep            : string;
    Fcod_pais       : Integer;
    Fnome_pais      : string;
    Ffone_cliente   : string;
    Finsc_est       : string;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    function GetFieldsSql(Aalias: string = ''): string;

    property cpfcgc         : string  read Fcpfcgc          write Fcpfcgc;
    property razao          : string  read Frazao           write Frazao;
    property endereco       : string  read Fendereco        write Fendereco;
    property num_end_cliente: string  read Fnum_end_cliente write Fnum_end_cliente;
    property complemento    : string  read Fcomplemento     write Fcomplemento;
    property bairro         : string  read Fbairro          write Fbairro;
    property ibge_cod_cidade: Integer read Fibge_cod_cidade write Fibge_cod_cidade;
    property nome_cidade    : string  read Fnome_cidade     write Fnome_cidade;
    property sigla_uf       : string  read Fsigla_uf        write Fsigla_uf;
    property cep            : string  read Fcep             write Fcep;
    property cod_pais       : Integer read Fcod_pais        write Fcod_pais;
    property nome_pais      : string  read Fnome_pais       write Fnome_pais;
    property fone_cliente   : string  read Ffone_cliente    write Ffone_cliente;
    property insc_est       : string  read Finsc_est        write Finsc_est;
  end;

  Ttransp_nfce_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): Ttransp_nfce_class;
    procedure SetItem(Index: Integer; const Value: Ttransp_nfce_class);
  public
    function New: Ttransp_nfce_class;

    property Items[Index: Integer]: Ttransp_nfce_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{Ttransp_nfce_class}

function Ttransp_nfce_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cpfcgc, @razao, @endereco, @num_end_cliente, @complemento, @bairro, @ibge_cod_cidade, @nome_cidade,' +
            ' @sigla_uf, @cep, @cod_pais, @nome_pais, @fone_cliente, @insc_est';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure Ttransp_nfce_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcpfcgc          := Trim(ADataSet.FieldByName('CPFCGC').AsString);
  Frazao           := Trim(ADataSet.FieldByName('RAZAO').AsString);
  Fendereco        := Trim(ADataSet.FieldByName('ENDERECO').AsString);
  Fnum_end_cliente := Trim(ADataSet.FieldByName('NUM_END_CLIENTE').AsString);
  Fcomplemento     := Trim(ADataSet.FieldByName('COMPLEMENTO').AsString);
  Fbairro          := Trim(ADataSet.FieldByName('BAIRRO').AsString);
  Fibge_cod_cidade := ADataSet.FieldByName('IBGE_COD_CIDADE').AsInteger;
  Fnome_cidade     := Trim(ADataSet.FieldByName('NOME_CIDADE').AsString);
  Fsigla_uf        := Trim(ADataSet.FieldByName('SIGLA_UF').AsString);
  Fcep             := Trim(ADataSet.FieldByName('CEP').AsString);
  Fcod_pais        := ADataSet.FieldByName('COD_PAIS').AsInteger;
  Fnome_pais       := Trim(ADataSet.FieldByName('NOME_PAIS').AsString);
  Ffone_cliente    := Trim(ADataSet.FieldByName('FONE_CLIENTE').AsString);
  Finsc_est        := Trim(ADataSet.FieldByName('INSC_EST').AsString);
end;


{Ttransp_nfce_classList}

function Ttransp_nfce_classList.GetItem(Index: Integer): Ttransp_nfce_class;
begin
  Result := Ttransp_nfce_class(inherited Items[Index]);
end;

function Ttransp_nfce_classList.New: Ttransp_nfce_class;
begin
  Result := Ttransp_nfce_class.Create;
  Add(Result);
end;

procedure Ttransp_nfce_classList.SetItem(Index: Integer; const Value: Ttransp_nfce_class);
begin
  Put(Index, Value);
end;

end.
