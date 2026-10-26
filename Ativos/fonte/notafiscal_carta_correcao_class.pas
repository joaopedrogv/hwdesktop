unit notafiscal_carta_correcao_class;

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
  TNotafiscal_carta_correcao_class = class(TObject)
  private
    Fcod_nf      : Integer;
    Fcod_empresa : Integer;
    Fidlote      : Integer;
    Fnseqevento  : Integer;
    Fsituacao    : string;
    Fxcorrecao   : TStrings;
    Fcstat       : string;
    Fxmotivo     : string;
    Fnprot       : string;
    Fdhevento    : TDateTime;
    Fcstat_proc  : Integer;
    Fxmotivo_proc: string;
    Ftipo_evento : string;
    Fxml_evento  : TStrings;
    Fxml_nfe_epec: TStrings;
    Flote_epec   : Integer;
    Fid_dfe      : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TNotafiscal_carta_correcao_class; virtual;

    property cod_nf      : Integer   read Fcod_nf       write Fcod_nf;
    property cod_empresa : Integer   read Fcod_empresa  write Fcod_empresa;
    property idlote      : Integer   read Fidlote       write Fidlote;
    property nseqevento  : Integer   read Fnseqevento   write Fnseqevento;
    property situacao    : string    read Fsituacao     write Fsituacao;
    property xcorrecao   : TStrings  read Fxcorrecao    write Fxcorrecao;
    property cstat       : string    read Fcstat        write Fcstat;
    property xmotivo     : string    read Fxmotivo      write Fxmotivo;
    property nprot       : string    read Fnprot        write Fnprot;
    property dhevento    : TDateTime read Fdhevento     write Fdhevento;
    property cstat_proc  : Integer   read Fcstat_proc   write Fcstat_proc;
    property xmotivo_proc: string    read Fxmotivo_proc write Fxmotivo_proc;
    property tipo_evento : string    read Ftipo_evento  write Ftipo_evento;
    property xml_evento  : TStrings  read Fxml_evento   write Fxml_evento;
    property xml_nfe_epec: TStrings  read Fxml_nfe_epec write Fxml_nfe_epec;
    property lote_epec   : Integer   read Flote_epec    write Flote_epec;
    property id_dfe      : string    read Fid_dfe       write Fid_dfe;
  end;

  TNotafiscal_carta_correcao_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotafiscal_carta_correcao_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_carta_correcao_class);
  public
    function New: TNotafiscal_carta_correcao_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TNotafiscal_carta_correcao_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_carta_correcao_class }

constructor TNotafiscal_carta_correcao_class.Create;
begin
  Fxcorrecao    := TStringList.Create;
  Fxml_evento   := TStringList.Create;
  Fxml_nfe_epec := TStringList.Create;
end;

destructor TNotafiscal_carta_correcao_class.Destroy;
begin
  if Assigned(Fxcorrecao) then
    FreeAndNil(Fxcorrecao);
  if Assigned(Fxml_evento) then
    FreeAndNil(Fxml_evento);
  if Assigned(Fxml_nfe_epec) then
    FreeAndNil(Fxml_nfe_epec);
  inherited;
end;

function TNotafiscal_carta_correcao_class.Clone: TNotafiscal_carta_correcao_class;
begin
  Result                   := TNotafiscal_carta_correcao_class.Create;
  Result.cod_nf            := Self.cod_nf;
  Result.cod_empresa       := Self.cod_empresa;
  Result.idlote            := Self.idlote;
  Result.nseqevento        := Self.nseqevento;
  Result.situacao          := Self.situacao;
  Result.xcorrecao.Text    := Self.xcorrecao.Text;
  Result.cstat             := Self.cstat;
  Result.xmotivo           := Self.xmotivo;
  Result.nprot             := Self.nprot;
  Result.dhevento          := Self.dhevento;
  Result.cstat_proc        := Self.cstat_proc;
  Result.xmotivo_proc      := Self.xmotivo_proc;
  Result.tipo_evento       := Self.tipo_evento;
  Result.xml_evento.Text   := Self.xml_evento.Text;
  Result.xml_nfe_epec.Text := Self.xml_nfe_epec.Text;
  Result.lote_epec         := Self.lote_epec;
  Result.id_dfe            := Self.id_dfe;
end;

class function TNotafiscal_carta_correcao_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @idlote, @nseqevento, @situacao, @xcorrecao, @cstat, @xmotivo, @nprot, @dhevento,' +
            ' @cstat_proc, @xmotivo_proc, @tipo_evento, @xml_evento, @xml_nfe_epec, @lote_epec, @id_dfe';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TNotafiscal_carta_correcao_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_nf            := ADataSet.FieldByName('COD_NF').AsInteger;
    Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fidlote            := ADataSet.FieldByName('IDLOTE').AsInteger;
    Fnseqevento        := ADataSet.FieldByName('NSEQEVENTO').AsInteger;
    Fsituacao          := Trim(ADataSet.FieldByName('SITUACAO').AsString);
    Fxcorrecao.Text    := Trim(ADataSet.FieldByName('XCORRECAO').AsWideString);
    Fcstat             := Trim(ADataSet.FieldByName('CSTAT').AsString);
    Fxmotivo           := Trim(ADataSet.FieldByName('XMOTIVO').AsString);
    Fnprot             := Trim(ADataSet.FieldByName('NPROT').AsString);
    Fdhevento          := ADataSet.FieldByName('DHEVENTO').AsDateTime;
    Fcstat_proc        := ADataSet.FieldByName('CSTAT_PROC').AsInteger;
    Fxmotivo_proc      := Trim(ADataSet.FieldByName('XMOTIVO_PROC').AsString);
    Ftipo_evento       := Trim(ADataSet.FieldByName('TIPO_EVENTO').AsString);
    Fxml_evento.Text   := Trim(ADataSet.FieldByName('XML_EVENTO').AsWideString);
    Fxml_nfe_epec.Text := Trim(ADataSet.FieldByName('XML_NFE_EPEC').AsWideString);
    Flote_epec         := ADataSet.FieldByName('LOTE_EPEC').AsInteger;
    Fid_dfe            := Trim(ADataSet.FieldByName('ID_DFE').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_NF'      )) then Fcod_nf            := ADataSet.FieldByName('COD_NF').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA' )) then Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('IDLOTE'      )) then Fidlote            := ADataSet.FieldByName('IDLOTE').AsInteger;
    if Assigned(ADataSet.FindField('NSEQEVENTO'  )) then Fnseqevento        := ADataSet.FieldByName('NSEQEVENTO').AsInteger;
    if Assigned(ADataSet.FindField('SITUACAO'    )) then Fsituacao          := Trim(ADataSet.FieldByName('SITUACAO').AsString);
    if Assigned(ADataSet.FindField('XCORRECAO'   )) then Fxcorrecao.Text    := Trim(ADataSet.FieldByName('XCORRECAO').AsWideString);
    if Assigned(ADataSet.FindField('CSTAT'       )) then Fcstat             := Trim(ADataSet.FieldByName('CSTAT').AsString);
    if Assigned(ADataSet.FindField('XMOTIVO'     )) then Fxmotivo           := Trim(ADataSet.FieldByName('XMOTIVO').AsString);
    if Assigned(ADataSet.FindField('NPROT'       )) then Fnprot             := Trim(ADataSet.FieldByName('NPROT').AsString);
    if Assigned(ADataSet.FindField('DHEVENTO'    )) then Fdhevento          := ADataSet.FieldByName('DHEVENTO').AsDateTime;
    if Assigned(ADataSet.FindField('CSTAT_PROC'  )) then Fcstat_proc        := ADataSet.FieldByName('CSTAT_PROC').AsInteger;
    if Assigned(ADataSet.FindField('XMOTIVO_PROC')) then Fxmotivo_proc      := Trim(ADataSet.FieldByName('XMOTIVO_PROC').AsString);
    if Assigned(ADataSet.FindField('TIPO_EVENTO' )) then Ftipo_evento       := Trim(ADataSet.FieldByName('TIPO_EVENTO').AsString);
    if Assigned(ADataSet.FindField('XML_EVENTO'  )) then Fxml_evento.Text   := Trim(ADataSet.FieldByName('XML_EVENTO').AsWideString);
    if Assigned(ADataSet.FindField('XML_NFE_EPEC')) then Fxml_nfe_epec.Text := Trim(ADataSet.FieldByName('XML_NFE_EPEC').AsWideString);
    if Assigned(ADataSet.FindField('LOTE_EPEC'   )) then Flote_epec         := ADataSet.FieldByName('LOTE_EPEC').AsInteger;
    if Assigned(ADataSet.FindField('ID_DFE'      )) then Fid_dfe            := Trim(ADataSet.FieldByName('ID_DFE').AsString);
  end;
end;

function TNotafiscal_carta_correcao_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    ADataSet.ParamByName('IDLOTE').AsInteger      := Fidlote;
    ADataSet.ParamByName('NSEQEVENTO').AsInteger  := Fnseqevento;
    ADataSet.ParamByName('SITUACAO').AsString     := Copy(Fsituacao    , 1, 20);
    ADataSet.ParamByName('XCORRECAO').AsWideString:= Fxcorrecao.Text;
    ADataSet.ParamByName('CSTAT').AsString        := Copy(Fcstat       , 1, 3);
    ADataSet.ParamByName('XMOTIVO').AsString      := Copy(Fxmotivo     , 1, 255);
    ADataSet.ParamByName('NPROT').AsString        := Copy(Fnprot       , 1, 15);
    ADataSet.ParamByName('DHEVENTO').AsDateTime   := Fdhevento;
    ADataSet.ParamByName('CSTAT_PROC').AsInteger  := Fcstat_proc;
    ADataSet.ParamByName('XMOTIVO_PROC').AsString := Copy(Fxmotivo_proc, 1, 255);
    ADataSet.ParamByName('TIPO_EVENTO').AsString  := Copy(Ftipo_evento , 1, 3);
    ADataSet.ParamByName('XML_EVENTO').AsWideString   := Fxml_evento.Text;
    ADataSet.ParamByName('XML_NFE_EPEC').AsWideString := Fxml_nfe_epec.Text;
    ADataSet.ParamByName('LOTE_EPEC').AsInteger   := Flote_epec;
    ADataSet.ParamByName('ID_DFE').AsString       := Copy(Fid_dfe      , 1, 52);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'      )) then   ADataSet.ParamByName('COD_NF').AsInteger      := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA' )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('IDLOTE'      )) then   ADataSet.ParamByName('IDLOTE').AsInteger      := Fidlote;
    if Assigned(ADataSet.Params.FindParam('NSEQEVENTO'  )) then   ADataSet.ParamByName('NSEQEVENTO').AsInteger  := Fnseqevento;
    if Assigned(ADataSet.Params.FindParam('SITUACAO'    )) then   ADataSet.ParamByName('SITUACAO').AsString     := Copy(Fsituacao    , 1, 20);
    if Assigned(ADataSet.Params.FindParam('XCORRECAO'   )) then   ADataSet.ParamByName('XCORRECAO').AsWideString:= Fxcorrecao.Text;
    if Assigned(ADataSet.Params.FindParam('CSTAT'       )) then   ADataSet.ParamByName('CSTAT').AsString        := Copy(Fcstat       , 1, 3);
    if Assigned(ADataSet.Params.FindParam('XMOTIVO'     )) then   ADataSet.ParamByName('XMOTIVO').AsString      := Copy(Fxmotivo     , 1, 255);
    if Assigned(ADataSet.Params.FindParam('NPROT'       )) then   ADataSet.ParamByName('NPROT').AsString        := Copy(Fnprot       , 1, 15);
    if Assigned(ADataSet.Params.FindParam('DHEVENTO'    )) then   ADataSet.ParamByName('DHEVENTO').AsDateTime   := Fdhevento;
    if Assigned(ADataSet.Params.FindParam('CSTAT_PROC'  )) then   ADataSet.ParamByName('CSTAT_PROC').AsInteger  := Fcstat_proc;
    if Assigned(ADataSet.Params.FindParam('XMOTIVO_PROC')) then   ADataSet.ParamByName('XMOTIVO_PROC').AsString := Copy(Fxmotivo_proc, 1, 255);
    if Assigned(ADataSet.Params.FindParam('TIPO_EVENTO' )) then   ADataSet.ParamByName('TIPO_EVENTO').AsString  := Copy(Ftipo_evento , 1, 3);
    if Assigned(ADataSet.Params.FindParam('XML_EVENTO'  )) then   ADataSet.ParamByName('XML_EVENTO').AsWideString   := Fxml_evento.Text;
    if Assigned(ADataSet.Params.FindParam('XML_NFE_EPEC')) then   ADataSet.ParamByName('XML_NFE_EPEC').AsWideString := Fxml_nfe_epec.Text;
    if Assigned(ADataSet.Params.FindParam('LOTE_EPEC'   )) then   ADataSet.ParamByName('LOTE_EPEC').AsInteger   := Flote_epec;
    if Assigned(ADataSet.Params.FindParam('ID_DFE'      )) then   ADataSet.ParamByName('ID_DFE').AsString       := Copy(Fid_dfe      , 1, 52);
  end;
end;

{ TNotafiscal_carta_correcao_classList }

function TNotafiscal_carta_correcao_classList.GetItem(Index: Integer): TNotafiscal_carta_correcao_class;
begin
  Result := TNotafiscal_carta_correcao_class(inherited Items[Index]);
end;

function TNotafiscal_carta_correcao_classList.New: TNotafiscal_carta_correcao_class;
begin
  Result := TNotafiscal_carta_correcao_class.Create;
  Add(Result);
end;

procedure TNotafiscal_carta_correcao_classList.SetItem(Index: Integer; const Value: TNotafiscal_carta_correcao_class);
begin
  Put(Index, Value);
end;

procedure TNotafiscal_carta_correcao_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
