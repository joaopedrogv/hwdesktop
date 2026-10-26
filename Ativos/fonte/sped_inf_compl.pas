unit sped_inf_compl;

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
  Tsped_inf_compl = class(TBaseFb_class)
  private
    Fcod_inf      : Integer;
    Fcod_empresa  : Integer;
    Ftxt          : string;
    Ftxt_compl    : string;
    Ftipo         : string;
    Fativo        : Variant;
    Fativo_em_nfe : string;
    Fativo_em_nfce: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_inf      : Integer read Fcod_inf       write Fcod_inf;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property txt          : string  read Ftxt           write Ftxt;
    property txt_compl    : string  read Ftxt_compl     write Ftxt_compl;
    property tipo         : string  read Ftipo          write Ftipo;
    property ativo        : Variant read Fativo         write Fativo;
    property ativo_em_nfe : string  read Fativo_em_nfe  write Fativo_em_nfe;
    property ativo_em_nfce: string  read Fativo_em_nfce write Fativo_em_nfce;
  end;

  Tsped_inf_complList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): Tsped_inf_compl;
    procedure SetItem(Index: Integer; const Value: Tsped_inf_compl);
  public
    function New: Tsped_inf_compl;

    property Items[Index: Integer]: Tsped_inf_compl read GetItem write SetItem;
  end;

implementation

{ Tsped_inf_compl }

procedure Tsped_inf_compl.InitializeObjects;
begin
  Ftable := TTableFb.Create('SPED_INFORMACAO_COMPLEMENTAR');
  with FTable.Fields do
  begin
    AddField('COD_INF'      , fkInteger, 0  , False, True              );
    AddField('COD_EMPRESA'  , fkInteger, 0  , False, True              );
    AddField('TXT'          , fkString , 255                           );
    AddField('TXT_COMPL'    , fkString , 255                           );
    AddField('TIPO'         , fkString , 20                            );
    AddField('ATIVO'        , fkInteger, 0  , True , False, False, True);
    AddField('ATIVO_EM_NFE' , fkString , 1  , True , False, False, True);
    AddField('ATIVO_EM_NFCE', fkString , 1  , True , False, False, True);
  end;
end;

constructor Tsped_inf_compl.Create;
begin
  InitializeObjects;
end;

{ Tsped_inf_complList }

function Tsped_inf_complList.GetItem(Index: Integer): Tsped_inf_compl;
begin
  Result := Tsped_inf_compl(inherited Items[Index]);
end;

function Tsped_inf_complList.New: Tsped_inf_compl;
begin
  Result := Tsped_inf_compl.Create;
  Add(Result);
end;

procedure Tsped_inf_complList.SetItem(Index: Integer; const Value: Tsped_inf_compl);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(Tsped_inf_compl);
finalization
  UnRegisterClass(Tsped_inf_compl);

end.
