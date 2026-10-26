unit CestVarianteMvaNcmUf_Model;

interface

uses
  basefb_class,
  cest__class,
  cest_item_class,
  cest_ambito_class,
  cest_variante_class,
  cest_mva_class,
  cest_mva_uf_class,
  cest_ncm_class,
  uClasseConexao,
  Contnrs,
  {$IFDEF VER180}
    IBDatabase
  {$ELSE}
    IBX.IBDatabase
  {$ENDIF};

type
  TTipo_Cadastro_Cest_MVA = (tcNull, tcAnexoXV, tcApi, tcUsuario);
  TTipo_Variante_Cest_MVA = (tvRegraGeral, tvNacionalidade, tvOrigem, tvRamoAtividade, tvEspecificoProduto);

  TCestMvaM = class(TCest_mva_class)
  private
    FVariante: TCest_variante_class;
    FUFs     : TCest_mva_ufs_class;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;

    property Variante: TCest_variante_class read FVariante write FVariante;
    property UFs     : TCest_mva_ufs_class  read FUFs      write FUFs;
  end;

  TCestMvasM = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCestMvaM;
    procedure SetItem(Index: Integer; const Value: TCestMvaM);
  public
    function New: TCestMvaM;
    function First: TCestMvaM;
    property Items[Index: Integer]: TCestMvaM read GetItem write SetItem;
  end;

  TCestM = class(TCest__class)
  private                       
    FItem : TCest_item_class;
    FAmbit: TCest_ambito_class;
    FNCMs : TCest_ncms_class;
    FMVAs : TCestMvasM;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;

    property Item : TCest_item_class   read FItem   write FItem;
    property Ambit: TCest_ambito_class read FAmbit  write FAmbit;
    property NCMs : TCest_ncms_class   read FNCMs   write FNCMs;
    property MVAs : TCestMvasM          read FMVAs   write FMVAs;
  end;

  TCestsM = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCestM;
    procedure SetItem(Index: Integer; const Value: TCestM);
  public
    function New: TCestM;
    function GetCest(Cest, Ncm, CST_Orig, Dest_UF: string; NFe_IdDest, Cest_Variante_Id, Ramo_Ativ_Id: Integer; AliqInter: Double;
       pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM;
    function GetCestV2(Cest, Ncm, CST_Orig, Dest_UF: string; NFe_IdDest, Cest_Variante_Id, Ramo_Ativ_Id: Integer; AliqInter: Double;
       pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM;
    property Items[Index: Integer]: TCestM read GetItem write SetItem;
  end;

  TCestItemAmbitoM = class(TCest_ambito_class)
  private
    Fdescricao_item: string;
  published
    property descricao_item: string read Fdescricao_item write Fdescricao_item;
  end;

  TCestItemAmbitosM = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCestItemAmbitoM;
    procedure SetItem(Index: Integer; const Value: TCestItemAmbitoM);
  public
    function New: TCestItemAmbitoM;
    property Items[Index: Integer]: TCestItemAmbitoM read GetItem write SetItem;
  end;

  TCest_Builder = class
  private
    class procedure GetCestDependences(Cest: TCestM; Con: TConexao);
  public
    class function GetCest(Cest, Ncm, CST_Orig, Orig_UF, Dest_UF: string; NFe_IdDest, Cest_Variante_Id, Ramo_Ativ_Id: Integer; AliqInter: Double;
      pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM; overload;
    class function GetCest(Id: Integer; pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM; overload;
    class function GetCestItens(pBancoHw: TIBDataBase; pCodEmpresa: string): TCestItemAmbitosM;
    class function GetCest(Ncm: string; pBancoHw: TIBDataBase; pCodEmpresa: string): TCestsM; overload;
    class function GetCest(Aid_tmp, origUF, destUF: string; Con: TConexao; pCodEmpresa: string): TCestsM; overload;
    class function VarToTipoCadastroCest(Value: Variant): TTipo_Cadastro_Cest_MVA;
    class function VarToTipoCadastroCestStr(Value: Variant): String;
  end;


implementation

uses
  SysUtils,
  StrUtils,
  Classes,
  hw_utils;

{ TCestMvaM }

constructor TCestMvaM.Create;
begin
  inherited Create;
end;

destructor TCestMvaM.Destroy;
begin
  if Assigned(FVariante) then FreeAndNil(FVariante);
  if Assigned(FUFs     ) then FreeAndNil(FUFs);
  inherited;
end;

procedure TCestMvaM.InitializeObjects;
begin
  inherited InitializeObjects;
  FVariante := TCest_variante_class.Create;
  FUFs      := TCest_mva_ufs_class.Create;
end;

{ TCestMvasM }

function TCestMvasM.First: TCestMvaM;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
    if VarToInt(Self.Items[I].origem) = Ord(tcUsuario) then
    begin
      Result := Self.Items[I];
      Exit;
    end;

  if Self.Count > 0 then
    Result := Self.Items[0]
  else
    Result := nil;
end;

function TCestMvasM.GetItem(Index: Integer): TCestMvaM;
begin
  Result := TCestMvaM(inherited Items[Index]);
end;

function TCestMvasM.New: TCestMvaM;
begin
  Result := TCestMvaM.Create;
  Add(Result);
end;

procedure TCestMvasM.SetItem(Index: Integer; const Value: TCestMvaM);
begin
  Put(Index, Value);
end;

{ TCestM }

constructor TCestM.Create;
begin
  inherited Create;
end;

destructor TCestM.Destroy;
begin
  if Assigned(FItem ) then FreeAndNil(FItem);
  if Assigned(FAmbit) then FreeAndNil(FAmbit);
  if Assigned(FNCMs ) then FreeAndNil(FNCMs);
  if Assigned(FMVAs ) then FreeAndNil(FMVAs);
  inherited;
end;

procedure TCestM.InitializeObjects;
begin
  inherited InitializeObjects;
  FItem  := TCest_item_class.Create;
  FAmbit := TCest_ambito_class.Create;
  FNCMs  := TCest_ncms_class.Create;
  FMVAs  := TCestMvasM.Create;
end;

{ TCestsM }

function TCestsM.GetCest(Cest, Ncm, CST_Orig, Dest_UF: string; NFe_IdDest,
  Cest_Variante_Id, Ramo_Ativ_Id: Integer; AliqInter: Double;
  pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM;
var
  I, N, U: Integer;
  NcmDb: string;
  ItemCest: TCestM;
  ItemMVA: TCestMvaM;
  FoundNCM, FoundMVA, FoundUF, ExcecaoNCM: Boolean;
begin
  raise exception.Create('Não usar mais esse metodo');
  Result := TCestM.Create;

  ItemCest := nil;
  ItemMVA := nil;
  FoundNCM := False;
  FoundMVA := False;
  FoundUF  := False;
  for I := 0 to Self.Count - 1 do with Self.Items[I] do
    for N := 0 to NCMs.Count - 1 do
    begin
      NcmDb := NCMs.Items[N].ncm;
      if NcmDb = Copy(Ncm, 1, Length(NcmDb)) then
      begin
        FoundNCM := True;
        ItemCest := Self.Items[I];
      end;
    end;

  if not FoundNCM then
    Exit;

  for I := 0 to ItemCest.MVAs.Count - 1 do
  begin
    ItemMVA  := ItemCest.MVAs.Items[I];
    FoundUF  := False;

    ExcecaoNCM := False;
    for N := 0 to ItemMVA.ncm_excecao.Count - 1 do
    begin
      NcmDb := ItemMVA.ncm_excecao[N];
      if NcmDb = Copy(Ncm, 1, Length(NcmDb)) then
      begin
        ExcecaoNCM := True;
        Break;
      end;
    end;

    if not ExcecaoNCM then
      for U := 0 to ItemMVA.UFs.Count - 1 do
        if ItemMVA.UFs.Items[U].uf = Dest_UF then
        begin
          FoundUF := True;
          Break;
        end;

    if FoundUF then
    begin
      case TTipo_Variante_Cest_MVA(VarToInt(ItemMVA.Variante.tipo)) of

        tvRegraGeral :
          begin
            FoundMVA := True;
          end;

        tvRamoAtividade :
          begin
            if Ramo_Ativ_Id = VarToInt(ItemMVA.Variante.tipo_valor) then
              FoundMVA := True;
          end;
        tvOrigem :
          begin
            if NFe_IdDest = VarToInt(ItemMVA.Variante.tipo_valor) then
              if VarToFloat(ItemMVA.Variante.aliq_icms_especifica) = 0 then
                FoundMVA := True
              else if AliqInter = VarToFloat(ItemMVA.Variante.aliq_icms_especifica) then
                FoundMVA := True;
          end;

        tvNacionalidade :
          begin

            case StrToIntDef(CST_Orig, 0) of
              0, 3, 4, 5 :
                begin
                  if VarToInt(ItemMVA.Variante.tipo_valor) = 1 then //Nacional
                    FoundMVA := True;
                end;

              else if VarToInt(ItemMVA.Variante.tipo_valor) = 2 then //Estrangeeira
                FoundMVA := True;
            end;

          end;

        tvEspecificoProduto :
          begin
            if (Cest_Variante_Id > 0) and (ItemMVA.Variante.id = Cest_Variante_Id) then
              FoundMVA := True;
          end;

      end;
    end;

    if (FoundMVA) and (FoundUF) then
      Break;
  end;

  if (not FoundMVA) or (not FoundUF) then
    Exit;

  Result.CopyFrom(ItemCest);
  Result.MVAs.Add(ItemMVA.Clone);
  Result.MVAs.First.Variante.CopyFrom(ItemMVA.Variante);
end;

function TCestsM.GetCestV2(Cest, Ncm, CST_Orig, Dest_UF: string; NFe_IdDest,
  Cest_Variante_Id, Ramo_Ativ_Id: Integer; AliqInter: Double;
  pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM;
var
  I, N, U, S: Integer;
  NcmDb: string;
  ItemCest: TCestM;
  ItemMVA: TCestMvaM;
  FoundMVA, ExcecaoNCM: Boolean;
begin
  Result := TCestM.Create;

  for S := 0 to Self.Count - 1 do if Self.Items[S].cest = cest then with Self.Items[S] do
  begin

    ItemCest := nil;
    ItemMVA := nil;
    FoundMVA := False;

    for N := 0 to NCMs.Count - 1 do
    begin
      NcmDb := NCMs.Items[N].ncm;
      if NcmDb = Copy(Ncm, 1, Length(NcmDb)) then
      begin
        ItemCest := Self.Items[S];
        Break;
      end;
    end;

    if not Assigned(ItemCest) then
      Continue;

    for I := 0 to ItemCest.MVAs.Count - 1 do
    begin
      ItemMVA  := ItemCest.MVAs.Items[I];
      FoundMVA := False;

      ExcecaoNCM := False;
      for N := 0 to ItemMVA.ncm_excecao.Count - 1 do
      begin
        NcmDb := ItemMVA.ncm_excecao[N];
        if NcmDb = Copy(Ncm, 1, Length(NcmDb)) then
        begin
          ExcecaoNCM := True;
          Break;
        end;
      end;

      if (not ExcecaoNCM) and
         (ContainsText(ItemMVA.ufs_aliq, Dest_UF) or ContainsText(ItemMVA.ufs_aliq, 'Padrao')) then
      begin
        case TTipo_Variante_Cest_MVA(VarToInt(ItemMVA.Variante.tipo)) of

          tvRegraGeral :
            begin
              FoundMVA := True;
            end;

          tvRamoAtividade :
            begin
              if Ramo_Ativ_Id = VarToInt(ItemMVA.Variante.tipo_valor) then
                FoundMVA := True;
            end;
          tvOrigem :
            begin
              if NFe_IdDest = VarToInt(ItemMVA.Variante.tipo_valor) then
                if VarToFloat(ItemMVA.Variante.aliq_icms_especifica) = 0 then
                  FoundMVA := True
                else if AliqInter = VarToFloat(ItemMVA.Variante.aliq_icms_especifica) then
                  FoundMVA := True;
            end;

          tvNacionalidade :
            begin

              case StrToIntDef(CST_Orig, 0) of
                0, 3, 4, 5 :
                  begin
                    if VarToInt(ItemMVA.Variante.tipo_valor) = 1 then //Nacional
                      FoundMVA := True;
                  end;

                else if VarToInt(ItemMVA.Variante.tipo_valor) = 2 then //Estrangeeira
                  FoundMVA := True;
              end;

            end;

          tvEspecificoProduto :
            begin
              if (Cest_Variante_Id > 0) and (ItemMVA.Variante.id = Cest_Variante_Id) then
                FoundMVA := True;
            end;

        end;
      end;

      if (FoundMVA) then
        Break;
    end;

    if (not FoundMVA) then
      Continue;

    Result.CopyFrom(ItemCest);
    Result.MVAs.Add(ItemMVA.Clone);
    Result.MVAs.First.Variante.CopyFrom(ItemMVA.Variante);

  end;
end;

function TCestsM.GetItem(Index: Integer): TCestM;
begin
  Result := TCestM(inherited Items[Index]);
end;

function TCestsM.New: TCestM;
begin
  Result := TCestM.Create;
  Add(Result);
end;

procedure TCestsM.SetItem(Index: Integer; const Value: TCestM);
begin
  Put(Index, Value);
end;

{ TCest_Builder }

class function TCest_Builder.GetCest(Id: Integer; pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM;
var
  Con: TConexao;
begin
  Con := TConexao.Create(pBancoHw);
  try

    Result := TCestM.Create;
    Result.CopyFrom(Con.SqlOpen('select * from %s where id = %d and cod_empresa = %s',
                                [Result._tb.Name, Id, pCodEmpresa]));

    GetCestDependences(Result, Con);

  finally
    if Assigned(Con) then FreeAndNil(Con);
  end;
end;

class function TCest_Builder.GetCest(Cest, Ncm, CST_Orig, Orig_UF, Dest_UF: string; NFe_IdDest,
  Cest_Variante_Id, Ramo_Ativ_Id: Integer; AliqInter: Double; pBancoHw: TIBDataBase; pCodEmpresa: string): TCestM;
var
  Con: TConexao;
  List: TCestsM;
  I: Integer;
//  I, N, M, U: Integer;
//  NcmDb: string;
//  ItemCest: TCestM;
//  ItemMVA: TCestMvaM;
//  FoundNCM, FoundMVA, FoundUF, ExcecaoNCM: Boolean;
//  Variante: TCest_variante_class;
begin

  List := TCestsM.Create;
  Con := TConexao.Create(pBancoHw);
  try
    List.CopyFrom(TCestM, Con.SqlOpen('select * from cest_' +
                                      ' where cest = %s and cod_empresa = %s' +
                                      ' and ativo = 1' +
                                      ' and ufs_convenio like %s' +
                                      ' and ufs_convenio like %s' +
                                      ' order by origem desc, data_modificacao desc',
                                      [QuotedStr(Cest), pCodEmpresa,
                                       QuotedStr('%' + Orig_UF + '%'),
                                       QuotedStr('%' + Dest_UF + '%')]));


    for I := 0 to List.Count - 1 do
      GetCestDependences(List.Items[I], Con);

    Result := List.GetCestV2(Cest, Ncm, CST_Orig, Dest_UF, NFe_IdDest, Cest_Variante_Id, Ramo_Ativ_Id, AliqInter, pBancoHw, pCodEmpresa);

    {
    FoundNCM := False;
    for I := 0 to List.Count - 1 do with List.Items[I] do
      for N := 0 to NCMs.Count - 1 do
      begin
        NcmDb := NCMs.Items[N].ncm;
        if NcmDb = Copy(Ncm, 1, Length(NcmDb)) then
        begin
          FoundNCM := True;
          ItemCest := List.Items[I];
        end;
      end;

    if not FoundNCM then
      Exit;

    FoundMVA := False;
    for I := 0 to ItemCest.MVAs.Count - 1 do
    begin
      ItemMVA  := ItemCest.MVAs.Items[I];
      FoundUF  := False;

      ExcecaoNCM := False;
      for N := 0 to ItemMVA.ncm_excecao.Count - 1 do
      begin
        NcmDb := ItemMVA.ncm_excecao[N];
        if NcmDb = Copy(Ncm, 1, Length(NcmDb)) then
        begin
          ExcecaoNCM := True;
          Break;
        end;
      end;

      if not ExcecaoNCM then
        for U := 0 to ItemMVA.UFs.Count - 1 do
          if ItemMVA.UFs.Items[U].uf = Dest_UF then
          begin
            FoundUF := True;
            Break;
          end;

      if FoundUF then
      begin
        case TTipo_Variante_Cest_MVA(VarToInt(ItemMVA.Variante.tipo)) of

          tvRegraGeral :
            begin
              FoundMVA := True;
            end;

          tvRamoAtividade :
            begin
              if Ramo_Ativ_Id = VarToInt(ItemMVA.Variante.tipo_valor) then
                FoundMVA := True;
            end;
          tvOrigem :
            begin
              if NFe_IdDest = VarToInt(ItemMVA.Variante.tipo_valor) then
                if VarToFloat(ItemMVA.Variante.aqli_icms_especifica) = 0 then
                  FoundMVA := True
                else if AliqInter = VarToFloat(ItemMVA.Variante.aqli_icms_especifica) then
                  FoundMVA := True;
            end;

          tvNacionalidade :
            begin

              case StrToIntDef(CST_Orig, 0) of
                0, 3, 4, 5 :
                  begin
                    if VarToInt(ItemMVA.Variante.tipo_valor) = 1 then //Nacional
                      FoundMVA := True;
                  end;

                else if VarToInt(ItemMVA.Variante.tipo_valor) = 2 then //Estrangeeira
                  FoundMVA := True;
              end;

            end;

          tvEspecificoProduto :
            begin
              if (Cest_Variante_Id > 0) and (ItemMVA.Variante.id = Cest_Variante_Id) then
                FoundMVA := True;
            end;

        end;
      end;

      if (FoundMVA) and (FoundUF) then
        Break;
    end;

    if (not FoundMVA) or (not FoundUF) then
      Exit;

    Result.CopyFrom(ItemCest);
    Result.MVAs.Add(ItemMVA.Clone);
    Result.MVAs.First.Variante.CopyFrom(ItemMVA.Variante);
    }

  finally
    if Assigned(Con) then FreeAndNil(Con);
    List.Free();
  end;
end;

class function TCest_Builder.GetCest(Ncm: string; pBancoHw: TIBDataBase; pCodEmpresa: string): TCestsM;
var
  Con: TConexao;
  List: TStringList;
  Str, Sql: string;
  I, J: Integer;
begin
  Con := TConexao.Create(pBancoHw);
  try

    Result := TCestsM.Create;
    List   := NewStringList();

    Sql := '';
    Str := Copy(Ncm, 1, 8);
    while Length(Str) >= 2 do
    begin
      Sql := IfThen(Sql <> '', Sql + sLineBreak + ' union ' + sLineBreak) +
             Format('select c.* from cest_ c' +
                    ' inner join cest_ncm cn on cn.cest_id = c.id and cn.cod_empresa = c.cod_empresa' +
                    ' where cn.ncm = %s and cn.cod_empresa = %s', [QuotedStr(Str), pCodEmpresa]);

      Str := Copy(Str, 1, Length(Str) -1);
    end;

    Result.CopyFrom(TCestM, Con.SqlOpen(Sql));
    for I := 0 to Result.Count - 1 do
    begin
      GetCestDependences(Result.Items[I], Con);
      for J := Result.Items[I].NCMs.Count - 1 downto 0 do
        if Result.Items[I].NCMs.Items[J].ncm <> Copy(Ncm, 1, Length(Result.Items[I].NCMs.Items[J].ncm)) then
          Result.Items[I].NCMs.Delete(J);
    end;

  finally
    if not Assigned(List) then FreeAndNil(List);
    if Assigned(Con) then FreeAndNil(Con);
  end;
end;

class function TCest_Builder.GetCest(Aid_tmp, origUF, destUF: string;
  Con: TConexao; pCodEmpresa: string): TCestsM;
var
  I: Integer;
begin
  Result := TCestsM.Create;

  Result.CopyFrom(TCestM,
                  Con.SqlOpen('select c.* from cest_ c' +
                              ' where c.cod_empresa = %s and c.cest in (' +
                              ' select distinct pr.cest from produtos_tmp pvp' +
                              ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                              ' where pvp.id_tmp = %s and pvp.cod_empresa = %s)' +
                              ' and c.ativo = 1' +
                              ' and c.ufs_convenio like %s' +
                              ' and c.ufs_convenio like %s' +
                              ' order by c.cest, c.origem desc',
                              [pCodEmpresa, QuotedStr(Aid_tmp), pCodEmpresa,
                               QuotedStr('%' + origUF + '%'),
                               QuotedStr('%' + destUF + '%')]));
  for I := 0 to Result.Count - 1 do
    GetCestDependences(Result.Items[I], Con);
end;

class procedure TCest_Builder.GetCestDependences(Cest: TCestM; Con: TConexao);
var
  I: Integer;
begin
  if VarToInt(Cest.id) > 0 then
  begin

    Cest.Item.CopyFrom(Con.SqlOpen('select * from cest_item where item = %s and cod_empresa = %d',
                                   [QuotedStr(Copy(Cest.cest, 1, 2)), VarToInt(Cest.cod_empresa)]));

    Cest.Ambit.CopyFrom(Con.SqlOpen('select * from cest_ambito where item = %s and cod_empresa = %d and ambito = %d',
                                    [QuotedStr(Copy(Cest.cest, 1, 2)), VarToInt(Cest.cod_empresa), VarToInt(Cest.ambito)]));

    Cest.NCMs.CopyFrom(TCest_ncm_class, Con.SqlOpen('select * from cest_ncm where cest_id = %d and cod_empresa = %d order by char_length(ncm) desc',
                                                    [VarToInt(Cest.id), VarToInt(Cest.cod_empresa)]));

    Cest.MVAs.CopyFrom(TCestMvaM, Con.SqlOpen('select cest_mva.*, iif(cest_mva.ufs_aliq = ''Padrao'', 1, 0) ufs from cest_mva' +
                                              ' where cest_id = %d and cod_empresa = %d and ativo = 1' +
                                              ' order by origem desc, ufs',
                                              [VarToInt(Cest.id), VarToInt(Cest.cod_empresa)]));

    for I := 0 to Cest.MVAs.Count - 1 do
    begin
      Cest.MVAs.Items[I].UFs.CopyFrom(TCest_mva_uf_class, Con.SqlOpen('select * from cest_mva_uf where cest_mva_id = %d and cod_empresa = %d',
                                                                      [VarToInt(Cest.MVAs.Items[I].id),
                                                                       VarToInt(Cest.MVAs.Items[I].cod_empresa)]));

      Cest.MVAs.Items[I].Variante.CopyFrom(Con.SqlOpen('select * from cest_variante where id = %d and cod_empresa = %d',
                                                       [VarToInt(Cest.MVAs.Items[I].cest_variante_id),
                                                        VarToInt(Cest.MVAs.Items[I].cod_empresa)]));
    end;
  end;
end;

class function TCest_Builder.GetCestItens(pBancoHw: TIBDataBase; pCodEmpresa: string): TCestItemAmbitosM;
var
  Con: TConexao;
begin
  Con := TConexao.Create(pBancoHw);
  try
    Result := TCestItemAmbitosM.Create;
    Result.CopyFrom(TCestItemAmbitoM, Con.SqlOpen('select a.*, i.descricao descricao_item from cest_item i' +
                                                 ' inner join cest_ambito a on a.item = i.item and a.cod_empresa = i.cod_empresa' +
                                                 ' where i.cod_empresa = %s order by i.item, a.ambito',
                                                 [pCodEmpresa]));
  finally
    if Assigned(Con) then FreeAndNil(Con);
  end;
end;

class function TCest_Builder.VarToTipoCadastroCest(
  Value: Variant): TTipo_Cadastro_Cest_MVA;
begin
  if VarToInt(Value, -1) in [1,2,3] then
    Result := TTipo_Cadastro_Cest_MVA(VarToInt(Value, -1))
  else
    Result := tcUsuario;
end;

class function TCest_Builder.VarToTipoCadastroCestStr(
  Value: Variant): string;
begin

  case VarToTipoCadastroCest(Value) of
    tcUsuario: Result := 'Usuário';
    tcAnexoXV: Result := 'Anexo XV';
    tcApi    : Result := 'API';
  end;

end;

{ TCestItemAmbitosM }

function TCestItemAmbitosM.GetItem(Index: Integer): TCestItemAmbitoM;
begin
  Result := TCestItemAmbitoM(inherited Items[Index]);
end;

function TCestItemAmbitosM.New: TCestItemAmbitoM;
begin
  Result := TCestItemAmbitoM.Create;
  Add(Result);
end;

procedure TCestItemAmbitosM.SetItem(Index: Integer; const Value: TCestItemAmbitoM);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCestMvaM);
  RegisterClass(TCestM);
finalization
  UnRegisterClass(TCestMvaM);
  UnRegisterClass(TCestM);

end.
