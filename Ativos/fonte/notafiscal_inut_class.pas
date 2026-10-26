unit notafiscal_inut_class;

interface

uses
{$IFDEF VER180}
  Classes,
  Contnrs,
  DB,
  IBQuery;
{$ELSE}
  System.Classes,
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ENDIF}

type
  TNotafiscal_inut_class = class(TObject)
  private
    Fseqid      : Integer;
    Fcod_empresa: Integer;
    Ftpamb      : string;
    Fano        : Integer;
    Fcnpj       : string;
    Fmodelo     : string;
    Fserie      : Integer;
    Fnnfini     : Integer;
    Fnnffin     : Integer;
    Fxjust      : string;
    Fxml_inut   : TStrings;
    Fcstat      : Integer;
    Fxmotivo    : string;
    Fdhrecbto   : TDateTime;
    Fnprot      : string;
    Fid_dfe     : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TNotafiscal_inut_class; virtual;

    property seqid      : Integer   read Fseqid       write Fseqid;
    property cod_empresa: Integer   read Fcod_empresa write Fcod_empresa;
    property tpamb      : string    read Ftpamb       write Ftpamb;
    property ano        : Integer   read Fano         write Fano;
    property cnpj       : string    read Fcnpj        write Fcnpj;
    property modelo     : string    read Fmodelo      write Fmodelo;
    property serie      : Integer   read Fserie       write Fserie;
    property nnfini     : Integer   read Fnnfini      write Fnnfini;
    property nnffin     : Integer   read Fnnffin      write Fnnffin;
    property xjust      : string    read Fxjust       write Fxjust;
    property xml_inut   : TStrings  read Fxml_inut    write Fxml_inut;
    property cstat      : Integer   read Fcstat       write Fcstat;
    property xmotivo    : string    read Fxmotivo     write Fxmotivo;
    property dhrecbto   : TDateTime read Fdhrecbto    write Fdhrecbto;
    property nprot      : string    read Fnprot       write Fnprot;
    property id_dfe     : string    read Fid_dfe      write Fid_dfe;
  end;

  TNotafiscal_inut_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_inut_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_inut_class);
  public
    function New: TNotafiscal_inut_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_inut_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_inut_class }

constructor TNotafiscal_inut_class.Create;
begin
  Fxml_inut := TStringList.Create;
end;

destructor TNotafiscal_inut_class.Destroy;
begin
  if Assigned(Fxml_inut) then
    FreeAndNil(Fxml_inut);
  inherited;
end;

function TNotafiscal_inut_class.Clone: TNotafiscal_inut_class;
begin
  Result               := TNotafiscal_inut_class.Create;
  Result.seqid         := Self.seqid;
  Result.cod_empresa   := Self.cod_empresa;
  Result.tpamb         := Self.tpamb;
  Result.ano           := Self.ano;
  Result.cnpj          := Self.cnpj;
  Result.modelo        := Self.modelo;
  Result.serie         := Self.serie;
  Result.nnfini        := Self.nnfini;
  Result.nnffin        := Self.nnffin;
  Result.xjust         := Self.xjust;
  Result.xml_inut.Text := Self.xml_inut.Text;
  Result.cstat         := Self.cstat;
  Result.xmotivo       := Self.xmotivo;
  Result.dhrecbto      := Self.dhrecbto;
  Result.nprot         := Self.nprot;
  Result.id_dfe        := Self.id_dfe;
end;

class function TNotafiscal_inut_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@seqid, @cod_empresa, @tpamb, @ano, @cnpj, @modelo, @serie, @nnfini, @nnffin, @xjust, @xml_inut, @cstat,' +
            ' @xmotivo, @dhrecbto, @nprot, @id_dfe';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_inut_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fseqid         := ADataSet.FieldByName('SEQID').AsInteger;
    Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Ftpamb         := Trim(ADataSet.FieldByName('TPAMB').AsString);
    Fano           := ADataSet.FieldByName('ANO').AsInteger;
    Fcnpj          := Trim(ADataSet.FieldByName('CNPJ').AsString);
    Fmodelo        := Trim(ADataSet.FieldByName('MODELO').AsString);
    Fserie         := ADataSet.FieldByName('SERIE').AsInteger;
    Fnnfini        := ADataSet.FieldByName('NNFINI').AsInteger;
    Fnnffin        := ADataSet.FieldByName('NNFFIN').AsInteger;
    Fxjust         := Trim(ADataSet.FieldByName('XJUST').AsString);
    Fxml_inut.Text := Trim(ADataSet.FieldByName('XML_INUT').AsString);
    Fcstat         := ADataSet.FieldByName('CSTAT').AsInteger;
    Fxmotivo       := Trim(ADataSet.FieldByName('XMOTIVO').AsString);
    Fdhrecbto      := ADataSet.FieldByName('DHRECBTO').AsDateTime;
    Fnprot         := Trim(ADataSet.FieldByName('NPROT').AsString);
    Fid_dfe        := Trim(ADataSet.FieldByName('ID_DFE').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('SEQID'      )) then Fseqid         := ADataSet.FieldByName('SEQID').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA')) then Fcod_empresa   := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('TPAMB'      )) then Ftpamb         := Trim(ADataSet.FieldByName('TPAMB').AsString);
    if Assigned(ADataSet.FindField('ANO'        )) then Fano           := ADataSet.FieldByName('ANO').AsInteger;
    if Assigned(ADataSet.FindField('CNPJ'       )) then Fcnpj          := Trim(ADataSet.FieldByName('CNPJ').AsString);
    if Assigned(ADataSet.FindField('MODELO'     )) then Fmodelo        := Trim(ADataSet.FieldByName('MODELO').AsString);
    if Assigned(ADataSet.FindField('SERIE'      )) then Fserie         := ADataSet.FieldByName('SERIE').AsInteger;
    if Assigned(ADataSet.FindField('NNFINI'     )) then Fnnfini        := ADataSet.FieldByName('NNFINI').AsInteger;
    if Assigned(ADataSet.FindField('NNFFIN'     )) then Fnnffin        := ADataSet.FieldByName('NNFFIN').AsInteger;
    if Assigned(ADataSet.FindField('XJUST'      )) then Fxjust         := Trim(ADataSet.FieldByName('XJUST').AsString);
    if Assigned(ADataSet.FindField('XML_INUT'   )) then Fxml_inut.Text := Trim(ADataSet.FieldByName('XML_INUT').AsString);
    if Assigned(ADataSet.FindField('CSTAT'      )) then Fcstat         := ADataSet.FieldByName('CSTAT').AsInteger;
    if Assigned(ADataSet.FindField('XMOTIVO'    )) then Fxmotivo       := Trim(ADataSet.FieldByName('XMOTIVO').AsString);
    if Assigned(ADataSet.FindField('DHRECBTO'   )) then Fdhrecbto      := ADataSet.FieldByName('DHRECBTO').AsDateTime;
    if Assigned(ADataSet.FindField('NPROT'      )) then Fnprot         := Trim(ADataSet.FieldByName('NPROT').AsString);
    if Assigned(ADataSet.FindField('ID_DFE'     )) then Fid_dfe        := Trim(ADataSet.FieldByName('ID_DFE').AsString);
  end;
end;

function TNotafiscal_inut_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('SEQID').AsInteger       := Fseqid;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('TPAMB').AsString        := Copy(Ftpamb  , 1, 1);
    ADataSet.ParamByName('ANO').AsInteger         := Fano;
    ADataSet.ParamByName('CNPJ').AsString         := Copy(Fcnpj   , 1, 14);
    ADataSet.ParamByName('MODELO').AsString       := Copy(Fmodelo , 1, 2);
    ADataSet.ParamByName('SERIE').AsInteger       := Fserie;
    ADataSet.ParamByName('NNFINI').AsInteger      := Fnnfini;
    ADataSet.ParamByName('NNFFIN').AsInteger      := Fnnffin;
    ADataSet.ParamByName('XJUST').AsString        := Copy(Fxjust  , 1, 255);
    ADataSet.ParamByName('XML_INUT').AsString     := Fxml_inut.Text;
    ADataSet.ParamByName('CSTAT').AsInteger       := Fcstat;
    ADataSet.ParamByName('XMOTIVO').AsString      := Copy(Fxmotivo, 1, 255);
    ADataSet.ParamByName('DHRECBTO').AsDateTime   := Fdhrecbto;
    ADataSet.ParamByName('NPROT').AsString        := Copy(Fnprot  , 1, 17);
    ADataSet.ParamByName('ID_DFE').AsString       := Copy(Fid_dfe , 1, 41);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('SEQID'      )) then   ADataSet.ParamByName('SEQID').AsInteger       := Fseqid;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA')) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('TPAMB'      )) then   ADataSet.ParamByName('TPAMB').AsString        := Copy(Ftpamb  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ANO'        )) then   ADataSet.ParamByName('ANO').AsInteger         := Fano;
    if Assigned(ADataSet.Params.FindParam('CNPJ'       )) then   ADataSet.ParamByName('CNPJ').AsString         := Copy(Fcnpj   , 1, 14);
    if Assigned(ADataSet.Params.FindParam('MODELO'     )) then   ADataSet.ParamByName('MODELO').AsString       := Copy(Fmodelo , 1, 2);
    if Assigned(ADataSet.Params.FindParam('SERIE'      )) then   ADataSet.ParamByName('SERIE').AsInteger       := Fserie;
    if Assigned(ADataSet.Params.FindParam('NNFINI'     )) then   ADataSet.ParamByName('NNFINI').AsInteger      := Fnnfini;
    if Assigned(ADataSet.Params.FindParam('NNFFIN'     )) then   ADataSet.ParamByName('NNFFIN').AsInteger      := Fnnffin;
    if Assigned(ADataSet.Params.FindParam('XJUST'      )) then   ADataSet.ParamByName('XJUST').AsString        := Copy(Fxjust  , 1, 255);
    if Assigned(ADataSet.Params.FindParam('XML_INUT'   )) then   ADataSet.ParamByName('XML_INUT').AsString     := Fxml_inut.Text;
    if Assigned(ADataSet.Params.FindParam('CSTAT'      )) then   ADataSet.ParamByName('CSTAT').AsInteger       := Fcstat;
    if Assigned(ADataSet.Params.FindParam('XMOTIVO'    )) then   ADataSet.ParamByName('XMOTIVO').AsString      := Copy(Fxmotivo, 1, 255);
    if Assigned(ADataSet.Params.FindParam('DHRECBTO'   )) then   ADataSet.ParamByName('DHRECBTO').AsDateTime   := Fdhrecbto;
    if Assigned(ADataSet.Params.FindParam('NPROT'      )) then   ADataSet.ParamByName('NPROT').AsString        := Copy(Fnprot  , 1, 17);
    if Assigned(ADataSet.Params.FindParam('ID_DFE'     )) then   ADataSet.ParamByName('ID_DFE').AsString       := Copy(Fid_dfe , 1, 41);
  end;
end;

{ TNotafiscal_inut_classList }

function TNotafiscal_inut_classList.GetItem(Index: Integer): TNotafiscal_inut_class;
begin
  Result := TNotafiscal_inut_class(inherited Items[Index]);
end;

function TNotafiscal_inut_classList.New: TNotafiscal_inut_class;
begin
  Result := TNotafiscal_inut_class.Create;
  Add(Result);
end;

procedure TNotafiscal_inut_classList.SetItem(Index: Integer; const Value: TNotafiscal_inut_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_inut_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
