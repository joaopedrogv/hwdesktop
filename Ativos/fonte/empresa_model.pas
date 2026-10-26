unit empresa_model;

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
  TEmpresaModel = class(TBaseFb_class)
  private
    Fcod_empresa      : Integer;
    Fcgc_emp          : string;
    Fie_emp           : string;
    Fim_emp           : string;
    Fcnae_fiscal      : string;
    Fnome_emp         : string;
    Ffantasia_emp     : string;
    Fidentificacao_emp: string;
    Fendreco_emp      : string;
    Fnumero_end       : Integer;
    Fcomplemento_emp  : string;
    Fbairro_emp       : string;
    Fibge_cod_cidade  : Integer;
    Fcep_emp          : string;
    Fcidade_emp       : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_empresa      : Integer read Fcod_empresa       write Fcod_empresa;
    property cgc_emp          : string  read Fcgc_emp           write Fcgc_emp;
    property ie_emp           : string  read Fie_emp            write Fie_emp;
    property im_emp           : string  read Fim_emp            write Fim_emp;
    property cnae_fiscal      : string  read Fcnae_fiscal       write Fcnae_fiscal;
    property nome_emp         : string  read Fnome_emp          write Fnome_emp;
    property fantasia_emp     : string  read Ffantasia_emp      write Ffantasia_emp;
    property identificacao_emp: string  read Fidentificacao_emp write Fidentificacao_emp;
    property endreco_emp      : string  read Fendreco_emp       write Fendreco_emp;
    property numero_end       : Integer read Fnumero_end        write Fnumero_end;
    property complemento_emp  : string  read Fcomplemento_emp   write Fcomplemento_emp;
    property bairro_emp       : string  read Fbairro_emp        write Fbairro_emp;
    property ibge_cod_cidade  : Integer read Fibge_cod_cidade   write Fibge_cod_cidade;
    property cep_emp          : string  read Fcep_emp           write Fcep_emp;
    property cidade_emp       : string  read Fcidade_emp        write Fcidade_emp;
  end;

  TEmpresaList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEmpresaModel;
    procedure SetItem(Index: Integer; const Value: TEmpresaModel);
  public
    function New: TEmpresaModel;

    property Items[Index: Integer]: TEmpresaModel read GetItem write SetItem;
  end;

implementation

{ TEmpresaModel }

procedure TEmpresaModel.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

constructor TEmpresaModel.Create;
begin
  InitializeObjects;
end;

{ TEmpresaList }

function TEmpresaList.GetItem(Index: Integer): TEmpresaModel;
begin
  Result := TEmpresaModel(inherited Items[Index]);
end;

function TEmpresaList.New: TEmpresaModel;
begin
  Result := TEmpresaModel.Create;
  Add(Result);
end;

procedure TEmpresaList.SetItem(Index: Integer; const Value: TEmpresaModel);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TEmpresaModel);
finalization
  UnRegisterClass(TEmpresaModel);

end.
