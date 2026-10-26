unit tipo_vendas_class;

interface

uses
  Classes,
  Contnrs,
  DB;

type
  TTipo_vendas_class = class(TObject)
  private
    Fcod_tipo                  : Integer;
    Ftipo                      : string;
    Fdescricao                 : string;
    Ftipo_os                   : string;
    Fsigla                     : string;
    Fvenda                     : string;
    Fativo                     : Integer;
    Fcomgarantia               : string;
    Fpermitir_cupom_servico    : string;
    Fordemexibicao             : Integer;
    Fconfigfechvnd             : string;
    Fusar_liberacao_gerente    : string;
    Fusarprecocusto            : string;
    Fusar_liberacao_financeiro : string;
    Fusar_conferencia_produto  : string;
    Fconsumo                   : string;
    Fn_usar_conferencia_produto: string;
    Fobservacao                : TStrings;
    Ftprest                    : string;
    Fusar_debcred              : string;
    Fverifica_funccolab_itos   : string;
    Fenv_email                 : string;
    Fimp_contrato_veic         : string;
    Fvenda_cnt                 : string;
    Farea_exec                 : string;
    Fsalvar_itens_automatic    : string;
    Frepetir_itemvnd           : string;
    Fgerar_pontos              : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TTipo_vendas_class; virtual;

    property cod_tipo                  : Integer  read Fcod_tipo                   write Fcod_tipo;
    property tipo                      : string   read Ftipo                       write Ftipo;
    property descricao                 : string   read Fdescricao                  write Fdescricao;
    property tipo_os                   : string   read Ftipo_os                    write Ftipo_os;
    property sigla                     : string   read Fsigla                      write Fsigla;
    property venda                     : string   read Fvenda                      write Fvenda;
    property ativo                     : Integer  read Fativo                      write Fativo;
    property comgarantia               : string   read Fcomgarantia                write Fcomgarantia;
    property permitir_cupom_servico    : string   read Fpermitir_cupom_servico     write Fpermitir_cupom_servico;
    property ordemexibicao             : Integer  read Fordemexibicao              write Fordemexibicao;
    property configfechvnd             : string   read Fconfigfechvnd              write Fconfigfechvnd;
    property usar_liberacao_gerente    : string   read Fusar_liberacao_gerente     write Fusar_liberacao_gerente;
    property usarprecocusto            : string   read Fusarprecocusto             write Fusarprecocusto;
    property usar_liberacao_financeiro : string   read Fusar_liberacao_financeiro  write Fusar_liberacao_financeiro;
    property usar_conferencia_produto  : string   read Fusar_conferencia_produto   write Fusar_conferencia_produto;
    property consumo                   : string   read Fconsumo                    write Fconsumo;
    property n_usar_conferencia_produto: string   read Fn_usar_conferencia_produto write Fn_usar_conferencia_produto;
    property observacao                : TStrings read Fobservacao                 write Fobservacao;
    property tprest                    : string   read Ftprest                     write Ftprest;
    property usar_debcred              : string   read Fusar_debcred               write Fusar_debcred;
    property verifica_funccolab_itos   : string   read Fverifica_funccolab_itos    write Fverifica_funccolab_itos;
    property env_email                 : string   read Fenv_email                  write Fenv_email;
    property imp_contrato_veic         : string   read Fimp_contrato_veic          write Fimp_contrato_veic;
    property venda_cnt                 : string   read Fvenda_cnt                  write Fvenda_cnt;
    property area_exec                 : string   read Farea_exec                  write Farea_exec;
    property salvar_itens_automatic    : string   read Fsalvar_itens_automatic     write Fsalvar_itens_automatic;
    property repetir_itemvnd           : string   read Frepetir_itemvnd            write Frepetir_itemvnd;
    property gerar_pontos              : string   read Fgerar_pontos               write Fgerar_pontos;
  end;

  TTipo_vendas_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TTipo_vendas_class;
    procedure SetItem(Index: Integer; const Value: TTipo_vendas_class);
  public
    function New: TTipo_vendas_class;

    property Items[Index: Integer]: TTipo_vendas_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TTipo_vendas_class }

constructor TTipo_vendas_class.Create;
begin
  Fativo      := 1;
  Fobservacao := TStringList.Create;
end;

destructor TTipo_vendas_class.Destroy;
begin
  if Assigned(Fobservacao) then
    FreeAndNil(Fobservacao);
  inherited;
end;

function TTipo_vendas_class.Clone: TTipo_vendas_class;
begin
  if not Assigned(Result) then
  Result                            := TTipo_vendas_class.Create;
  Result.cod_tipo                   := Self.cod_tipo;
  Result.tipo                       := Self.tipo;
  Result.descricao                  := Self.descricao;
  Result.tipo_os                    := Self.tipo_os;
  Result.sigla                      := Self.sigla;
  Result.venda                      := Self.venda;
  Result.ativo                      := Self.ativo;
  Result.comgarantia                := Self.comgarantia;
  Result.permitir_cupom_servico     := Self.permitir_cupom_servico;
  Result.ordemexibicao              := Self.ordemexibicao;
  Result.configfechvnd              := Self.configfechvnd;
  Result.usar_liberacao_gerente     := Self.usar_liberacao_gerente;
  Result.usarprecocusto             := Self.usarprecocusto;
  Result.usar_liberacao_financeiro  := Self.usar_liberacao_financeiro;
  Result.usar_conferencia_produto   := Self.usar_conferencia_produto;
  Result.consumo                    := Self.consumo;
  Result.n_usar_conferencia_produto := Self.n_usar_conferencia_produto;
  Result.observacao.Text            := Self.observacao.Text;
  Result.tprest                     := Self.tprest;
  Result.usar_debcred               := Self.usar_debcred;
  Result.verifica_funccolab_itos    := Self.verifica_funccolab_itos;
  Result.env_email                  := Self.env_email;
  Result.imp_contrato_veic          := Self.imp_contrato_veic;
  Result.venda_cnt                  := Self.venda_cnt;
  Result.area_exec                  := Self.area_exec;
  Result.salvar_itens_automatic     := Self.salvar_itens_automatic;
  Result.repetir_itemvnd            := Self.repetir_itemvnd;
  Result.gerar_pontos               := Self.gerar_pontos;
end;

class function TTipo_vendas_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_tipo, @tipo, @descricao, @tipo_os, @sigla, @venda, @ativo, @comgarantia, @permitir_cupom_servico,' +
            ' @ordemexibicao, @configfechvnd, @usar_liberacao_gerente, @usarprecocusto, @usar_liberacao_financeiro,' +
            ' @usar_conferencia_produto, @consumo, @n_usar_conferencia_produto, @observacao, @tprest, @usar_debcred,' +
            ' @verifica_funccolab_itos, @env_email, @imp_contrato_veic, @venda_cnt, @area_exec, @salvar_itens_automatic,' +
            ' @repetir_itemvnd, @gerar_pontos';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TTipo_vendas_class.SetValuesFrom(ADataSet: TDataSet);
begin
  Fcod_tipo                   := ADataSet.FieldByName('COD_TIPO').AsInteger;
  Ftipo                       := Trim(ADataSet.FieldByName('TIPO').AsString);
  Fdescricao                  := Trim(ADataSet.FieldByName('DESCRICAO').AsString);
  Ftipo_os                    := Trim(ADataSet.FieldByName('TIPO_OS').AsString);
  Fsigla                      := Trim(ADataSet.FieldByName('SIGLA').AsString);
  Fvenda                      := Trim(ADataSet.FieldByName('VENDA').AsString);
  Fativo                      := ADataSet.FieldByName('ATIVO').AsInteger;
  Fcomgarantia                := Trim(ADataSet.FieldByName('COMGARANTIA').AsString);
  Fpermitir_cupom_servico     := Trim(ADataSet.FieldByName('PERMITIR_CUPOM_SERVICO').AsString);
  Fordemexibicao              := ADataSet.FieldByName('ORDEMEXIBICAO').AsInteger;
  Fconfigfechvnd              := Trim(ADataSet.FieldByName('CONFIGFECHVND').AsString);
  Fusar_liberacao_gerente     := Trim(ADataSet.FieldByName('USAR_LIBERACAO_GERENTE').AsString);
  Fusarprecocusto             := Trim(ADataSet.FieldByName('USARPRECOCUSTO').AsString);
  Fusar_liberacao_financeiro  := Trim(ADataSet.FieldByName('USAR_LIBERACAO_FINANCEIRO').AsString);
  Fusar_conferencia_produto   := Trim(ADataSet.FieldByName('USAR_CONFERENCIA_PRODUTO').AsString);
  Fconsumo                    := Trim(ADataSet.FieldByName('CONSUMO').AsString);
  Fn_usar_conferencia_produto := Trim(ADataSet.FieldByName('N_USAR_CONFERENCIA_PRODUTO').AsString);
  Fobservacao.Text            := Trim(ADataSet.FieldByName('OBSERVACAO').AsString);
  Ftprest                     := Trim(ADataSet.FieldByName('TPREST').AsString);
  Fusar_debcred               := Trim(ADataSet.FieldByName('USAR_DEBCRED').AsString);
  Fverifica_funccolab_itos    := Trim(ADataSet.FieldByName('VERIFICA_FUNCCOLAB_ITOS').AsString);
  Fenv_email                  := Trim(ADataSet.FieldByName('ENV_EMAIL').AsString);
  Fimp_contrato_veic          := Trim(ADataSet.FieldByName('IMP_CONTRATO_VEIC').AsString);
  Fvenda_cnt                  := Trim(ADataSet.FieldByName('VENDA_CNT').AsString);
  Farea_exec                  := Trim(ADataSet.FieldByName('AREA_EXEC').AsString);
  Fsalvar_itens_automatic     := Trim(ADataSet.FieldByName('SALVAR_ITENS_AUTOMATIC').AsString);
  Frepetir_itemvnd            := Trim(ADataSet.FieldByName('REPETIR_ITEMVND').AsString);
  Fgerar_pontos               := Trim(ADataSet.FieldByName('GERAR_PONTOS').AsString);
end;

{ TTipo_vendas_classList }

function TTipo_vendas_classList.GetItem(Index: Integer): TTipo_vendas_class;
begin
  Result := TTipo_vendas_class(inherited Items[Index]);
end;

function TTipo_vendas_classList.New: TTipo_vendas_class;
begin
  Result := TTipo_vendas_class.Create;
  Add(Result);
end;

procedure TTipo_vendas_classList.SetItem(Index: Integer; const Value: TTipo_vendas_class);
begin
  Put(Index, Value);
end;

end.
