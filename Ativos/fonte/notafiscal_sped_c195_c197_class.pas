unit notafiscal_sped_c195_c197_class;

interface

uses
{$IFDEF VER180}
  base_class,
  Contnrs,
  IBQuery;
{$ELSE}
  base_class,
  System.Contnrs,
  IBX.IBQuery;
{$ENDIF}

type
  TNotafiscal_sped_c195_c197_class = class(TBase_class)
  private
    Fcod_nf        : Integer;
    Fcod_empresa   : Integer;
    Fcod_obs       : Integer;
    Fnitem         : Integer;
    Fcod_aj        : string;
    Fdescr_compl_aj: string;
    Fvl_bc_icms    : Double;
    Faliq_icms     : Double;
    Fvl_icms       : Double;
    Fvl_outros     : Double;
    Ftxt_compl_c195: string;
    procedure Setcod_nf(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_obs(const Value: Integer);
    procedure Setnitem(const Value: Integer);
    procedure Setcod_aj(const Value: string);
    procedure Setdescr_compl_aj(const Value: string);
    procedure Setvl_bc_icms(const Value: Double);
    procedure Setaliq_icms(const Value: Double);
    procedure Setvl_icms(const Value: Double);
    procedure Setvl_outros(const Value: Double);
    procedure Settxt_compl_c195(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string; virtual;

    function Clone: TNotafiscal_sped_c195_c197_class; virtual;

    property cod_nf        : Integer read Fcod_nf         write Setcod_nf;
    property cod_empresa   : Integer read Fcod_empresa    write Setcod_empresa;
    property cod_obs       : Integer read Fcod_obs        write Setcod_obs;
    property nitem         : Integer read Fnitem          write Setnitem;
    property cod_aj        : string  read Fcod_aj         write Setcod_aj;
    property descr_compl_aj: string  read Fdescr_compl_aj write Setdescr_compl_aj;
    property vl_bc_icms    : Double  read Fvl_bc_icms     write Setvl_bc_icms;
    property aliq_icms     : Double  read Faliq_icms      write Setaliq_icms;
    property vl_icms       : Double  read Fvl_icms        write Setvl_icms;
    property vl_outros     : Double  read Fvl_outros      write Setvl_outros;
    property txt_compl_c195: string  read Ftxt_compl_c195 write Settxt_compl_c195;
  end;

  TNotafiscal_sped_c195_c197_classList = class(TBase_classList)
  private
    function GetItem(Index: Integer): TNotafiscal_sped_c195_c197_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_sped_c195_c197_class);
  public
    function New: TNotafiscal_sped_c195_c197_class;

    property Items[Index: Integer]: TNotafiscal_sped_c195_c197_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER310}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TNotafiscal_sped_c195_c197_class }

constructor TNotafiscal_sped_c195_c197_class.Create;
begin
  Ftable := TTable_fb.Create('NOTAFISCAL_SPED_C195_C197',
                             'COD_NF, COD_EMPRESA, COD_OBS, NITEM, COD_AJ',
                             'COD_NF, COD_OBS, COD_EMPRESA',
                             GetFieldsSql());
end;

destructor TNotafiscal_sped_c195_c197_class.Destroy;
begin
  if Assigned(Ftable) then
    FreeAndNil(Ftable);
  inherited;
end;

function TNotafiscal_sped_c195_c197_class.Clone: TNotafiscal_sped_c195_c197_class;
begin
  Result                := TNotafiscal_sped_c195_c197_class.Create;
  Result.cod_nf         := Self.cod_nf;
  Result.cod_empresa    := Self.cod_empresa;
  Result.cod_obs        := Self.cod_obs;
  Result.nitem          := Self.nitem;
  Result.cod_aj         := Self.cod_aj;
  Result.descr_compl_aj := Self.descr_compl_aj;
  Result.vl_bc_icms     := Self.vl_bc_icms;
  Result.aliq_icms      := Self.aliq_icms;
  Result.vl_icms        := Self.vl_icms;
  Result.vl_outros      := Self.vl_outros;
  Result.txt_compl_c195 := Self.txt_compl_c195;
  Result.recordState    := Self.recordState;
end;

class function TNotafiscal_sped_c195_c197_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_nf, @cod_empresa, @cod_obs, @nitem, @cod_aj, @descr_compl_aj, @vl_bc_icms, @aliq_icms, @vl_icms,' +
            ' @vl_outros, @txt_compl_c195';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

function TNotafiscal_sped_c195_c197_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_NF').AsInteger        := Fcod_nf;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger   := Fcod_empresa;
    ADataSet.ParamByName('COD_OBS').AsInteger       := Fcod_obs;
    ADataSet.ParamByName('NITEM').AsInteger         := Fnitem;
    ADataSet.ParamByName('COD_AJ').AsString         := Copy(Fcod_aj        , 1, 10);
    ADataSet.ParamByName('DESCR_COMPL_AJ').AsString := Copy(Fdescr_compl_aj, 1, 128);
    ADataSet.ParamByName('VL_BC_ICMS').AsFloat      := Fvl_bc_icms;
    ADataSet.ParamByName('ALIQ_ICMS').AsFloat       := Faliq_icms;
    ADataSet.ParamByName('VL_ICMS').AsFloat         := Fvl_icms;
    ADataSet.ParamByName('VL_OUTROS').AsFloat       := Fvl_outros;
    ADataSet.ParamByName('TXT_COMPL_C195').AsString := Copy(Ftxt_compl_c195, 1, 128);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_NF'        )) then   ADataSet.ParamByName('COD_NF').AsInteger        := Fcod_nf;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'   )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger   := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('COD_OBS'       )) then   ADataSet.ParamByName('COD_OBS').AsInteger       := Fcod_obs;
    if Assigned(ADataSet.Params.FindParam('NITEM'         )) then   ADataSet.ParamByName('NITEM').AsInteger         := Fnitem;
    if Assigned(ADataSet.Params.FindParam('COD_AJ'        )) then   ADataSet.ParamByName('COD_AJ').AsString         := Copy(Fcod_aj        , 1, 10);
    if Assigned(ADataSet.Params.FindParam('DESCR_COMPL_AJ')) then   ADataSet.ParamByName('DESCR_COMPL_AJ').AsString := Copy(Fdescr_compl_aj, 1, 128);
    if Assigned(ADataSet.Params.FindParam('VL_BC_ICMS'    )) then   ADataSet.ParamByName('VL_BC_ICMS').AsFloat      := Fvl_bc_icms;
    if Assigned(ADataSet.Params.FindParam('ALIQ_ICMS'     )) then   ADataSet.ParamByName('ALIQ_ICMS').AsFloat       := Faliq_icms;
    if Assigned(ADataSet.Params.FindParam('VL_ICMS'       )) then   ADataSet.ParamByName('VL_ICMS').AsFloat         := Fvl_icms;
    if Assigned(ADataSet.Params.FindParam('VL_OUTROS'     )) then   ADataSet.ParamByName('VL_OUTROS').AsFloat       := Fvl_outros;
    if Assigned(ADataSet.Params.FindParam('TXT_COMPL_C195')) then   ADataSet.ParamByName('TXT_COMPL_C195').AsString := Copy(Ftxt_compl_c195, 1, 128);
  end;
end;

procedure TNotafiscal_sped_c195_c197_class.Setcod_nf(const Value: Integer);
begin
  Fcod_nf := Value;
  ChangeField('COD_NF', Fcod_nf);
end;

procedure TNotafiscal_sped_c195_c197_class.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
  ChangeField('COD_EMPRESA', Fcod_empresa);
end;

procedure TNotafiscal_sped_c195_c197_class.Setcod_obs(const Value: Integer);
begin
  Fcod_obs := Value;
  ChangeField('COD_OBS', Fcod_obs);
end;

procedure TNotafiscal_sped_c195_c197_class.Setnitem(const Value: Integer);
begin
  Fnitem := Value;
  ChangeField('NITEM', Fnitem);
end;

procedure TNotafiscal_sped_c195_c197_class.Setcod_aj(const Value: string);
begin
  Fcod_aj := Value;
  ChangeField('COD_AJ', strq(Fcod_aj, 10));
end;

procedure TNotafiscal_sped_c195_c197_class.Setdescr_compl_aj(const Value: string);
begin
  Fdescr_compl_aj := Value;
  ChangeField('DESCR_COMPL_AJ', strq(Fdescr_compl_aj, 128));
end;

procedure TNotafiscal_sped_c195_c197_class.Setvl_bc_icms(const Value: Double);
begin
  Fvl_bc_icms := Value;
  ChangeField_f('VL_BC_ICMS', Fvl_bc_icms);
end;

procedure TNotafiscal_sped_c195_c197_class.Setaliq_icms(const Value: Double);
begin
  Faliq_icms := Value;
  ChangeField_f('ALIQ_ICMS', Faliq_icms);
end;

procedure TNotafiscal_sped_c195_c197_class.Setvl_icms(const Value: Double);
begin
  Fvl_icms := Value;
  ChangeField_f('VL_ICMS', Fvl_icms);
end;

procedure TNotafiscal_sped_c195_c197_class.Setvl_outros(const Value: Double);
begin
  Fvl_outros := Value;
  ChangeField_f('VL_OUTROS', Fvl_outros);
end;

procedure TNotafiscal_sped_c195_c197_class.Settxt_compl_c195(const Value: string);
begin
  Ftxt_compl_c195 := Value;
  ChangeField('TXT_COMPL_C195', strq(Ftxt_compl_c195, 128));
end;

{ TNotafiscal_sped_c195_c197_classList }

function TNotafiscal_sped_c195_c197_classList.GetItem(Index: Integer): TNotafiscal_sped_c195_c197_class;
begin
  Result := TNotafiscal_sped_c195_c197_class(inherited Items[Index]);
end;

function TNotafiscal_sped_c195_c197_classList.New: TNotafiscal_sped_c195_c197_class;
begin
  Result := TNotafiscal_sped_c195_c197_class.Create;
  Add(Result);
end;

procedure TNotafiscal_sped_c195_c197_classList.SetItem(Index: Integer; const Value: TNotafiscal_sped_c195_c197_class);
begin
  Put(Index, Value);
end;

end.
