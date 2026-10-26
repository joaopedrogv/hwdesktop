unit senhas_class;

interface

uses
  Contnrs,
  DB;

type
  TSenhas_class = class(TObject)
  private
    Fcodigo                   : Integer;
    Fusuario                  : string;
    Fcod_empresa              : Integer;
    Fsenha                    : string;
    Fnome_us                  : string;
    Fnivel_us                 : Integer;
    Fprogs                    : string;
    Fserial1                  : string;
    Fserial2                  : string;
    Fcupom                    : string;
    Fqtd_cupom                : Integer;
    Festoq_neg                : string;
    Fgaveta_cupom             : string;
    Fcupom_serv               : string;
    Fcontra_senha             : string;
    Fdepart                   : string;
    Fimagens_us               : string;
    Fimp_us                   : string;
    Falt_cab                  : string;
    Falt_imp                  : string;
    Fdata_cad_s               : TDateTime;
    Fdata_mod_s               : TDateTime;
    Fativo                    : Integer;
    Femp_padrao               : Integer;
    Fexibir_mensagem_consorcio: string;
    Fliberar_acesso           : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    property codigo                   : Integer   read Fcodigo                    write Fcodigo;
    property usuario                  : string    read Fusuario                   write Fusuario;
    property cod_empresa              : Integer   read Fcod_empresa               write Fcod_empresa;
    property senha                    : string    read Fsenha                     write Fsenha;
    property nome_us                  : string    read Fnome_us                   write Fnome_us;
    property nivel_us                 : Integer   read Fnivel_us                  write Fnivel_us;
    property progs                    : string    read Fprogs                     write Fprogs;
    property serial1                  : string    read Fserial1                   write Fserial1;
    property serial2                  : string    read Fserial2                   write Fserial2;
    property cupom                    : string    read Fcupom                     write Fcupom;
    property qtd_cupom                : Integer   read Fqtd_cupom                 write Fqtd_cupom;
    property estoq_neg                : string    read Festoq_neg                 write Festoq_neg;
    property gaveta_cupom             : string    read Fgaveta_cupom              write Fgaveta_cupom;
    property cupom_serv               : string    read Fcupom_serv                write Fcupom_serv;
    property contra_senha             : string    read Fcontra_senha              write Fcontra_senha;
    property depart                   : string    read Fdepart                    write Fdepart;
    property imagens_us               : string    read Fimagens_us                write Fimagens_us;
    property imp_us                   : string    read Fimp_us                    write Fimp_us;
    property alt_cab                  : string    read Falt_cab                   write Falt_cab;
    property alt_imp                  : string    read Falt_imp                   write Falt_imp;
    property data_cad_s               : TDateTime read Fdata_cad_s                write Fdata_cad_s;
    property data_mod_s               : TDateTime read Fdata_mod_s                write Fdata_mod_s;
    property ativo                    : Integer   read Fativo                     write Fativo;
    property emp_padrao               : Integer   read Femp_padrao                write Femp_padrao;
    property exibir_mensagem_consorcio: string    read Fexibir_mensagem_consorcio write Fexibir_mensagem_consorcio;
    property liberar_acesso           : string    read Fliberar_acesso            write Fliberar_acesso;
  end;

  TSenhas_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TSenhas_class;
    procedure SetItem(Index: Integer; const Value: TSenhas_class);
  public
    function New: TSenhas_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TSenhas_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TSenhas_class }

constructor TSenhas_class.Create;
begin
  Fativo := 1;
end;

destructor TSenhas_class.Destroy;
begin
  inherited;
end;

class function TSenhas_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@codigo, @usuario, @cod_empresa, @senha, @nome_us, @nivel_us, @progs, @serial1, @serial2, @cupom, @qtd_cupom,' +
            ' @estoq_neg, @gaveta_cupom, @cupom_serv, @contra_senha, @depart, @imagens_us, @imp_us, @alt_cab, @alt_imp,' +
            ' @data_cad_s, @data_mod_s, @ativo, @emp_padrao, @exibir_mensagem_consorcio, @liberar_acesso';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TSenhas_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcodigo                    := ADataSet.FieldByName('CODIGO').AsInteger;
    Fusuario                   := Trim(ADataSet.FieldByName('USUARIO').AsString);
    Fcod_empresa               := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fsenha                     := Trim(ADataSet.FieldByName('SENHA').AsString);
    Fnome_us                   := Trim(ADataSet.FieldByName('NOME_US').AsString);
    Fnivel_us                  := ADataSet.FieldByName('NIVEL_US').AsInteger;
    Fprogs                     := Trim(ADataSet.FieldByName('PROGS').AsString);
    Fserial1                   := Trim(ADataSet.FieldByName('SERIAL1').AsString);
    Fserial2                   := Trim(ADataSet.FieldByName('SERIAL2').AsString);
    Fcupom                     := Trim(ADataSet.FieldByName('CUPOM').AsString);
    Fqtd_cupom                 := ADataSet.FieldByName('QTD_CUPOM').AsInteger;
    Festoq_neg                 := Trim(ADataSet.FieldByName('ESTOQ_NEG').AsString);
    Fgaveta_cupom              := Trim(ADataSet.FieldByName('GAVETA_CUPOM').AsString);
    Fcupom_serv                := Trim(ADataSet.FieldByName('CUPOM_SERV').AsString);
    Fcontra_senha              := Trim(ADataSet.FieldByName('CONTRA_SENHA').AsString);
    Fdepart                    := Trim(ADataSet.FieldByName('DEPART').AsString);
    Fimagens_us                := Trim(ADataSet.FieldByName('IMAGENS_US').AsString);
    Fimp_us                    := Trim(ADataSet.FieldByName('IMP_US').AsString);
    Falt_cab                   := Trim(ADataSet.FieldByName('ALT_CAB').AsString);
    Falt_imp                   := Trim(ADataSet.FieldByName('ALT_IMP').AsString);
    Fdata_cad_s                := ADataSet.FieldByName('DATA_CAD_S').AsDateTime;
    Fdata_mod_s                := ADataSet.FieldByName('DATA_MOD_S').AsDateTime;
    Fativo                     := ADataSet.FieldByName('ATIVO').AsInteger;
    Femp_padrao                := ADataSet.FieldByName('EMP_PADRAO').AsInteger;
    Fexibir_mensagem_consorcio := Trim(ADataSet.FieldByName('EXIBIR_MENSAGEM_CONSORCIO').AsString);
    Fliberar_acesso            := Trim(ADataSet.FieldByName('LIBERAR_ACESSO').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('CODIGO'                   )) then Fcodigo                    := ADataSet.FieldByName('CODIGO').AsInteger;
    if Assigned(ADataSet.FindField('USUARIO'                  )) then Fusuario                   := Trim(ADataSet.FieldByName('USUARIO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'              )) then Fcod_empresa               := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('SENHA'                    )) then Fsenha                     := Trim(ADataSet.FieldByName('SENHA').AsString);
    if Assigned(ADataSet.FindField('NOME_US'                  )) then Fnome_us                   := Trim(ADataSet.FieldByName('NOME_US').AsString);
    if Assigned(ADataSet.FindField('NIVEL_US'                 )) then Fnivel_us                  := ADataSet.FieldByName('NIVEL_US').AsInteger;
    if Assigned(ADataSet.FindField('PROGS'                    )) then Fprogs                     := Trim(ADataSet.FieldByName('PROGS').AsString);
    if Assigned(ADataSet.FindField('SERIAL1'                  )) then Fserial1                   := Trim(ADataSet.FieldByName('SERIAL1').AsString);
    if Assigned(ADataSet.FindField('SERIAL2'                  )) then Fserial2                   := Trim(ADataSet.FieldByName('SERIAL2').AsString);
    if Assigned(ADataSet.FindField('CUPOM'                    )) then Fcupom                     := Trim(ADataSet.FieldByName('CUPOM').AsString);
    if Assigned(ADataSet.FindField('QTD_CUPOM'                )) then Fqtd_cupom                 := ADataSet.FieldByName('QTD_CUPOM').AsInteger;
    if Assigned(ADataSet.FindField('ESTOQ_NEG'                )) then Festoq_neg                 := Trim(ADataSet.FieldByName('ESTOQ_NEG').AsString);
    if Assigned(ADataSet.FindField('GAVETA_CUPOM'             )) then Fgaveta_cupom              := Trim(ADataSet.FieldByName('GAVETA_CUPOM').AsString);
    if Assigned(ADataSet.FindField('CUPOM_SERV'               )) then Fcupom_serv                := Trim(ADataSet.FieldByName('CUPOM_SERV').AsString);
    if Assigned(ADataSet.FindField('CONTRA_SENHA'             )) then Fcontra_senha              := Trim(ADataSet.FieldByName('CONTRA_SENHA').AsString);
    if Assigned(ADataSet.FindField('DEPART'                   )) then Fdepart                    := Trim(ADataSet.FieldByName('DEPART').AsString);
    if Assigned(ADataSet.FindField('IMAGENS_US'               )) then Fimagens_us                := Trim(ADataSet.FieldByName('IMAGENS_US').AsString);
    if Assigned(ADataSet.FindField('IMP_US'                   )) then Fimp_us                    := Trim(ADataSet.FieldByName('IMP_US').AsString);
    if Assigned(ADataSet.FindField('ALT_CAB'                  )) then Falt_cab                   := Trim(ADataSet.FieldByName('ALT_CAB').AsString);
    if Assigned(ADataSet.FindField('ALT_IMP'                  )) then Falt_imp                   := Trim(ADataSet.FieldByName('ALT_IMP').AsString);
    if Assigned(ADataSet.FindField('DATA_CAD_S'               )) then Fdata_cad_s                := ADataSet.FieldByName('DATA_CAD_S').AsDateTime;
    if Assigned(ADataSet.FindField('DATA_MOD_S'               )) then Fdata_mod_s                := ADataSet.FieldByName('DATA_MOD_S').AsDateTime;
    if Assigned(ADataSet.FindField('ATIVO'                    )) then Fativo                     := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('EMP_PADRAO'               )) then Femp_padrao                := ADataSet.FieldByName('EMP_PADRAO').AsInteger;
    if Assigned(ADataSet.FindField('EXIBIR_MENSAGEM_CONSORCIO')) then Fexibir_mensagem_consorcio := Trim(ADataSet.FieldByName('EXIBIR_MENSAGEM_CONSORCIO').AsString);
    if Assigned(ADataSet.FindField('LIBERAR_ACESSO'           )) then Fliberar_acesso            := Trim(ADataSet.FieldByName('LIBERAR_ACESSO').AsString);
  end;
end;

{ TSenhas_classList }

function TSenhas_classList.GetItem(Index: Integer): TSenhas_class;
begin
  Result := TSenhas_class(inherited Items[Index]);
end;

function TSenhas_classList.New: TSenhas_class;
begin
  Result := TSenhas_class.Create;
  Add(Result);
end;

procedure TSenhas_classList.SetItem(Index: Integer; const Value: TSenhas_class);
begin
  Put(Index, Value);
end;

procedure TSenhas_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
