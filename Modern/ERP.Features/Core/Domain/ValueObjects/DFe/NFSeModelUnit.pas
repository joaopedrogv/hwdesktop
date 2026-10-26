unit NFSeModelUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  NFSeEtdUnit, TributoDFeContextEtdUnit, DpsEmitirIbsCbsNacionalModelUnit;

type
  NFSeModel = class
  private
    FNFSe: NFSeEtd;
    FTributo: TributoDFeContextEtd;
    FIbsCbsNacional: DpsEmitirIbsCbsNacionalModel;
                                                            
    procedure SetNFSe(const Value: NFSeEtd);
    procedure SetIbsCbsNacional(const Value: DpsEmitirIbsCbsNacionalModel);
    procedure SetTributo(const Value: TributoDFeContextEtd);
  public
    constructor Create( ANFSe: NFSeEtd; ATributo: TributoDFeContextEtd ); overload;
    constructor Create( ANFSe: NFSeEtd; AIbsCbsNacional: DpsEmitirIbsCbsNacionalModel ); overload;
    destructor Destroy(); override;

    function Clone(): NFSeModel;
    function IsEqualTo(const Other: NFSeModel): Boolean;

    property NFSe: NFSeEtd read FNFSe write SetNFSe;
    property Tributo: TributoDFeContextEtd read FTributo write SetTributo;
    property IbsCbsNacional: DpsEmitirIbsCbsNacionalModel read FIbsCbsNacional write SetIbsCbsNacional;
  end;

  NFSeModelList = class(TObjectList)
  private
    function GetItem(Index: Integer): NFSeModel;
    procedure SetItem(Index: Integer; const Value: NFSeModel);
    function IndexOfId(const Id: string): Integer;
  public
    function Find(const Id: string): NFSeModel;
    property Items[Index: Integer]: NFSeModel read GetItem write SetItem;
  end;

implementation

uses
  TributoDFeOrigemEnumUnit, TributoDFeIbsCbsEtdUnit, TipoRegraTributoDFeEnumUnit, StringNullableUnit,
  DoubleNullableUnit, RegraFiscalIbsCbsEtdUnit, CurrencyNullableUnit, TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeIbsCbsTribRegEtdUnit, TributoDFeCredPresOpIbsCbsEtdUnit, NFSeTypesUnit;

type
  TributoDFeContextFactoryInternal = class
  public
    class function Create(
      NFSe: NFSeEtd; AIbsCbsNacional: DpsEmitirIbsCbsNacionalModel
    ): TributoDFeContextEtd; overload; static;
    class function Create(
      NFSe: NFSeEtd;
      TributoDFe: TributoDFeContextEtd
    ): DpsEmitirIbsCbsNacionalModel; overload; static;
  end;

{ TributoDFeContextFactoryInternal }

class function TributoDFeContextFactoryInternal.Create(
  NFSe: NFSeEtd; AIbsCbsNacional: DpsEmitirIbsCbsNacionalModel
): TributoDFeContextEtd;
var
  R: RegraFiscalIbsCbsEtd;
  TipoRegra: TipoRegraTributoDFeEnum;
  RegraFiscalId, CCredPres: StringNullable;
  CST, CClassTrib: string;
  GIbsCbs: TributoDFeGrupoIbsCbsEtd;
begin
  if AIbsCbsNacional <> nil then
  begin
    TipoRegra := AIbsCbsNacional.TipoRegra;
    RegraFiscalId := AIbsCbsNacional.RegraFiscalId;
    CST := AIbsCbsNacional.CST;
    CClassTrib := AIbsCbsNacional.CClassTrib;
    CCredPres := AIbsCbsNacional.CCredPres;
    
    GIbsCbs := TributoDFeGrupoIbsCbsEtd.Create();
    GIbsCbs.IbsUfPdif := DoubleNullable.Create( AIbsCbsNacional.PDifUF.Value, AIbsCbsNacional.PDifUF.IsNull );
    GIbsCbs.IbsMunPdif := DoubleNullable.Create( AIbsCbsNacional.PDifMun.Value, AIbsCbsNacional.PDifMun.IsNull );
    GIbsCbs.CbsPdif := DoubleNullable.Create( AIbsCbsNacional.PDifCBS.Value, AIbsCbsNacional.PDifCBS.IsNull );

    if AIbsCbsNacional.CClassRribReg.HasValue then
    begin
      GIbsCbs.TribRegular :=  TributoDFeIbsCbsTribRegEtd.Create();
      GIbsCbs.TribRegular.Cstreg := AIbsCbsNacional.CSTReg.Value;
      GIbsCbs.TribRegular.CClasstribreg := AIbsCbsNacional.CClassRribReg.Value;
    end;  
  end
  else
  begin                                
    TipoRegra := tctAutomatica;
    RegraFiscalId := StringNullable.NullInstance();
    CST := '';
    CClassTrib := '';
    CCredPres := StringNullable.NullInstance();
  end;

  Result := TributoDFeContextEtd.Create(
      NFSe.Id,
      tdfoNFSe,
      nil,
      TributoDFeIbsCbsEtd.Create(
        CST,
        RegraFiscalId,
        TipoRegra,
        CST,
        CClassTrib,
        False,
        DoubleNullable.NullInstance(),
        DoubleNullable.NullInstance(),
        GIbsCbs,
        nil,
        nil,
        nil,
        nil,
        nil
      )
    );

  if AIbsCbsNacional.CCredPres.HasValue then
  begin
    Result.IbsCbs.CredPresOp := TributoDFeCredPresOpIbsCbsEtd.Create();
    Result.IbsCbs.CredPresOp.Ccredpres := AIbsCbsNacional.CCredPres.Value; 
  end;
end;

class function TributoDFeContextFactoryInternal.Create(NFSe: NFSeEtd;
  TributoDFe: TributoDFeContextEtd): DpsEmitirIbsCbsNacionalModel;
var
  R: RegraFiscalIbsCbsEtd;
  TipoRegra: TipoRegraTributoDFeEnum;
  RegraFiscalId, CCredPres, CSTReg, CClassTribRegular: StringNullable;
  PDifIbsUF, PDifIbsMun, PDifCbs: DoubleNullable;
  CST, CClassTrib: string;
begin
  if TributoDFe = nil then
  begin
    Result := nil;
    Exit;
  end;

  CST := '';
  CClassTrib := '';

  TipoRegra := tctAutomatica;
  RegraFiscalId := StringNullable.NullInstance();
  CCredPres := StringNullable.NullInstance();
  CSTReg := StringNullable.NullInstance();
  CClassTribRegular := StringNullable.NullInstance();
  PDifIbsUF := DoubleNullable.NullInstance();
  PDifIbsMun := DoubleNullable.NullInstance();
  PDifCbs := DoubleNullable.NullInstance();

  if (TributoDFe <> nil) and (TributoDFe.IbsCbs <> nil) then
  begin
    TipoRegra := TributoDFe.IbsCbs.TipoRegra;
    RegraFiscalId := TributoDFe.IbsCbs.RegraFiscalId;
    CST := TributoDFe.IbsCbs.Cst;
    CClassTrib := TributoDFe.IbsCbs.CClasstrib;

    if TributoDFe.IbsCbs.CredPresOp <> nil then
      CCredPres := StringNullable.CreateOrNull(TributoDFe.IbsCbs.CredPresOp.Ccredpres);

    if (TributoDFe.IbsCbs.GIbsCbs <> nil) then
    begin
      if (TributoDFe.IbsCbs.GIbsCbs.TribRegular <> nil) then
      begin
        CClassTribRegular := StringNullable.CreateOrNull( TributoDFe.IbsCbs.GIbsCbs.TribRegular.CClasstribreg );
        CSTReg := StringNullable.CreateOrNull( TributoDFe.IbsCbs.GIbsCbs.TribRegular.Cstreg );
      end;

      PDifIbsUF := TributoDFe.IbsCbs.GIbsCbs.IbsUfPdif;
      PDifIbsMun := TributoDFe.IbsCbs.GIbsCbs.IbsMunPdif;
      PDifCbs := TributoDFe.IbsCbs.GIbsCbs.CbsPdif;
    end;
  end; 

  Result := DpsEmitirIbsCbsNacionalModel.Create(
    TipoRegra,
    RegraFiscalId,
    CST,
    CClassTrib,
    CCredPres,
    CSTReg,
    CClassTribRegular,
    CurrencyNullable.Create(PDifIbsUF.Value, PDifIbsUF.IsNull),
    CurrencyNullable.Create(PDifIbsMun.Value, PDifIbsMun.IsNull),
    CurrencyNullable.Create(PDifCbs.Value, PDifCbs.IsNull)
  );
end;

{ NFSeModel }

function NFSeModel.Clone: NFSeModel;
begin
  if FNFSe.LayoutNFSeComIbsCbs() and not FNFSe.EstaFinalizada() and (FNFSe.NaturezaEmissao = nemtPrestadorWS) then
    Result := NFSeModel.Create( NFSeEtd(FNFSe.Clone), FIbsCbsNacional.Clone() )
  else
    Result := NFSeModel.Create( NFSeEtd(FNFSe.Clone), FTributo.Clone() );
end;

constructor NFSeModel.Create(
  ANFSe: NFSeEtd;
  ATributo: TributoDFeContextEtd
);
begin
  FNFSe := ANFSe;
  FTributo := ATributo;

  if Assigned(FNFSe) and FNFSe.LayoutNFSeComIbsCbs() then
    FIbsCbsNacional := TributoDFeContextFactoryInternal.Create( FNFse, FTributo );
end;

constructor NFSeModel.Create(
  ANFSe: NFSeEtd;
  AIbsCbsNacional: DpsEmitirIbsCbsNacionalModel
);
begin
  FNFSe := ANFSe;
  FIbsCbsNacional := AIbsCbsNacional;

  if Assigned(FNFSe) and FNFSe.LayoutNFSeComIbsCbs() then
    FTributo := TributoDFeContextFactoryInternal.Create( FNFse, AIbsCbsNacional );
end;

destructor NFSeModel.Destroy;
begin
  FNFSe.Free;
  FTributo.Free();
  inherited;
end;

function NFSeModel.IsEqualTo(const Other: NFSeModel): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := Self.NFSe.IsEqualTo(Other.NFSe)
      and Self.Tributo.IsEqualTo(Other.Tributo);
end;

procedure NFSeModel.SetIbsCbsNacional(const Value: DpsEmitirIbsCbsNacionalModel);
begin
  if FIbsCbsNacional <> Value then
  begin
    FIbsCbsNacional.Free();
    FIbsCbsNacional := Value;
  end;
end;

procedure NFSeModel.SetNFSe(const Value: NFSeEtd);
begin
  if FNFSe <> Value then
  begin
    FNFSe.Free();
    FNFSe := Value;
  end;
end;

procedure NFSeModel.SetTributo(const Value: TributoDFeContextEtd);
begin
  if FTributo <> Value then
  begin
    FTributo.Free();
    FTributo := Value;
  end;
end;

{ NFSeModelList }

function NFSeModelList.Find(const Id: string): NFSeModel;
var
  Idx: Integer;
begin
  Idx := Self.IndexOfId( Id );

  if Idx = -1 then
    Result := nil
  else
    Result := GetItem(Idx);
end;

function NFSeModelList.GetItem(Index: Integer): NFSeModel;
begin
  Result := NFSeModel(inherited Items[Index]);
end;

function NFSeModelList.IndexOfId(const Id: string): Integer;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
    if Assigned(Self.GetItem(I).NFSe) and (Self.GetItem(I).NFSe.Id = Id) then
    begin
      Result := I;
      Exit;
    end;

  Result := -1;
end;

procedure NFSeModelList.SetItem(Index: Integer; const Value: NFSeModel);
begin
  Put(Index, Value);
end;

end.
