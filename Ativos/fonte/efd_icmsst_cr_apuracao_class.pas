unit efd_icmsst_cr_apuracao_class;

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
  TEfd_icmsst_cr_apuracao_class = class(TBaseFb_class)
  private
    Fid            : Integer;
    Fcod_empresa   : Integer;
    Fano           : Integer;
    Fmes           : Integer;
    Ftipo          : Integer;
    Ficmsop        : Variant;
    Ficmsst        : Variant;
    Ffcpst         : Variant;
    Fdata_cadastro : Variant;
    Fdata_alteracao: Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id            : Integer read Fid             write Fid;
    property cod_empresa   : Integer read Fcod_empresa    write Fcod_empresa;
    property ano           : Integer read Fano            write Fano;
    property mes           : Integer read Fmes            write Fmes;
    property tipo          : Integer read Ftipo           write Ftipo;
    property icmsop        : Variant read Ficmsop         write Ficmsop;
    property icmsst        : Variant read Ficmsst         write Ficmsst;
    property fcpst         : Variant read Ffcpst          write Ffcpst;
    property data_cadastro : Variant read Fdata_cadastro  write Fdata_cadastro;
    property data_alteracao: Variant read Fdata_alteracao write Fdata_alteracao;
  end;

  TEfd_icmsst_cr_apuracoes_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEfd_icmsst_cr_apuracao_class;
    procedure SetItem(Index: Integer; const Value: TEfd_icmsst_cr_apuracao_class);
  public
    function New: TEfd_icmsst_cr_apuracao_class;

    property Items[Index: Integer]: TEfd_icmsst_cr_apuracao_class read GetItem write SetItem;
  end;

implementation

{ TEfd_icmsst_cr_apuracao_class }

procedure TEfd_icmsst_cr_apuracao_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('EFD_ICMSST_CR_APURACAO');
  with FTable.Fields do
  begin
    AddField('ID'            , fkInteger , 0, False, True              );
    AddField('COD_EMPRESA'   , fkInteger , 0, False, True              );
    AddField('ANO'           , fkInteger , 0, False                    );
    AddField('MES'           , fkInteger , 0, False                    );
    AddField('TIPO'          , fkInteger , 0, False                    );
    AddField('ICMSOP'        , fkFloat   , 0, True , False, False, True);
    AddField('ICMSST'        , fkFloat   , 0, True , False, False, True);
    AddField('FCPST'         , fkFloat   , 0, True , False, False, True);
    AddField('DATA_CADASTRO' , fkDateTime                              );
    AddField('DATA_ALTERACAO', fkDateTime                              );
  end;
end;

constructor TEfd_icmsst_cr_apuracao_class.Create;
begin
  InitializeObjects;
end;

{ TEfd_icmsst_cr_apuracoes_class }

function TEfd_icmsst_cr_apuracoes_class.GetItem(Index: Integer): TEfd_icmsst_cr_apuracao_class;
begin
  Result := TEfd_icmsst_cr_apuracao_class(inherited Items[Index]);
end;

function TEfd_icmsst_cr_apuracoes_class.New: TEfd_icmsst_cr_apuracao_class;
begin
  Result := TEfd_icmsst_cr_apuracao_class.Create;
  Add(Result);
end;

procedure TEfd_icmsst_cr_apuracoes_class.SetItem(Index: Integer; const Value: TEfd_icmsst_cr_apuracao_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TEfd_icmsst_cr_apuracao_class);
finalization
  UnRegisterClass(TEfd_icmsst_cr_apuracao_class);

end.
