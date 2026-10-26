unit efd_ajustes_model;

interface

uses      
  sp_efd_ajustes_class,
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
//  TNotaItemfParam = class(TBaseFb_class)
  TNotaItemParam = class(TBaseFb_class)
  private
    Fcod_nf          : Integer;
    Fnitem           : Integer;
    Fcod_empresa     : Integer;
    Fcodigo_nop      : Double;
    Fncm             : string;
    Fuf              : string;
    Fconsumidor_final: string;
    Fnfe_indiedest   : Integer;
    Fpessoa          : string;
    Ffinalidadeid    : Integer;
    Ftipo_emissao    : string;
    Fopf_icms_id     : Integer;
    Fcst             : string;
    Faliq_icm        : Double;
    Fbase_icm        : Double;
    Fvalor_icm       : Double;
    Faliq_icmsub     : Double;
    Fbase_icmsub     : Double;
    Fvalor_icmsub    : Double;
    Fvalor_total     : Double;
    Frateio_desconto : Double;
    Frateio_seguro   : Double;
    Frateio_outdesp  : Double;
    Frateio_frete    : Double;
    Fvalor_ipi       : Double;
    Fvicmdeson       : Double;
    Fvpisdeson       : Double;
    Fvcofinsdeson    : Double;
    Ffrete_f_nfe     : string;
    Fguidt           : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_nf          : Integer read Fcod_nf           write Fcod_nf;
    property nitem           : Integer read Fnitem            write Fnitem;
    property cod_empresa     : Integer read Fcod_empresa      write Fcod_empresa;
    property codigo_nop      : Double  read Fcodigo_nop       write Fcodigo_nop;
    property ncm             : string  read Fncm              write Fncm;
    property uf              : string  read Fuf               write Fuf;
    property consumidor_final: string  read Fconsumidor_final write Fconsumidor_final;
    property nfe_indiedest   : Integer read Fnfe_indiedest    write Fnfe_indiedest;
    property pessoa          : string  read Fpessoa           write Fpessoa;
    property finalidadeid    : Integer read Ffinalidadeid     write Ffinalidadeid;
    property tipo_emissao    : string  read Ftipo_emissao     write Ftipo_emissao;
    property opf_icms_id     : Integer read Fopf_icms_id      write Fopf_icms_id;
    property cst             : string  read Fcst              write Fcst;
    property aliq_icm        : Double  read Faliq_icm         write Faliq_icm;
    property base_icm        : Double  read Fbase_icm         write Fbase_icm;
    property valor_icm       : Double  read Fvalor_icm        write Fvalor_icm;
    property aliq_icmsub     : Double  read Faliq_icmsub      write Faliq_icmsub;
    property base_icmsub     : Double  read Fbase_icmsub      write Fbase_icmsub;
    property valor_icmsub    : Double  read Fvalor_icmsub     write Fvalor_icmsub;
    property valor_total     : Double  read Fvalor_total      write Fvalor_total;
    property rateio_desconto : Double  read Frateio_desconto  write Frateio_desconto;
    property rateio_seguro   : Double  read Frateio_seguro    write Frateio_seguro;
    property rateio_outdesp  : Double  read Frateio_outdesp   write Frateio_outdesp;
    property rateio_frete    : Double  read Frateio_frete     write Frateio_frete;
    property valor_ipi       : Double  read Fvalor_ipi        write Fvalor_ipi;
    property vicmdeson       : Double  read Fvicmdeson        write Fvicmdeson;
    property vpisdeson       : Double  read Fvpisdeson        write Fvpisdeson;
    property vcofinsdeson    : Double  read Fvcofinsdeson     write Fvcofinsdeson;
    property frete_f_nfe     : string  read Ffrete_f_nfe      write Ffrete_f_nfe;
    property guidt           : string  read Fguidt            write Fguidt;
  end;

  TNotaItemParamList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNotaItemParam;
    procedure SetItem(Index: Integer; const Value: TNotaItemParam);
  public
    function New: TNotaItemParam;

    property Items[Index: Integer]: TNotaItemParam read GetItem write SetItem;
  end;     

  TEfdAjustesConfResult = class(TNotaItemParam)
  private
    Fajustes: TSpEfdAjustesList;
  public
    property ajustes: TSpEfdAjustesList read Fajustes write Fajustes;
  end;

  TEfdAjustesConfResultList = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEfdAjustesConfResult;
    procedure SetItem(Index: Integer; const Value: TEfdAjustesConfResult);
  public
    procedure AddPar(nfitem: TNotaItemParam; ajuste: TSpEfdAjustes);

    property Items[Index: Integer]: TEfdAjustesConfResult read GetItem write SetItem;
  end;

implementation

{ TNotaItemParam }

procedure TNotaItemParam.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

constructor TNotaItemParam.Create;
begin
  InitializeObjects;
end;

{ TNotaItemParamList }

function TNotaItemParamList.GetItem(Index: Integer): TNotaItemParam;
begin
  Result := TNotaItemParam(inherited Items[Index]);
end;

function TNotaItemParamList.New: TNotaItemParam;
begin
  Result := TNotaItemParam.Create;
  Add(Result);
end;

procedure TNotaItemParamList.SetItem(Index: Integer; const Value: TNotaItemParam);
begin
  Put(Index, Value);
end;

{ TEfdAjustesConfResultList }

function TEfdAjustesConfResultList.GetItem(
  Index: Integer): TEfdAjustesConfResult;
begin
  Result := TEfdAjustesConfResult(inherited Items[Index]);
end;

procedure TEfdAjustesConfResultList.AddPar(nfitem: TNotaItemParam; ajuste: TSpEfdAjustes);
var
  I: Integer;
  iAj: Integer;
  exiteNfItem, existeAjuste: Boolean;
begin
  exiteNfItem := False;
  for I := 0 to Self.Count - 1 do
    if (nfitem.cod_nf = Self.Items[I].cod_nf)
      and (nfitem.nitem = Self.Items[I].nitem) then
    begin
      exiteNfItem := True;

      existeAjuste := False;
      for iAj := 0 to Self.Items[I].ajustes.Count - 1 do
      begin

        if (ajuste.id = Self.Items[I].ajustes.Items[iAj].Id) then
        begin
          existeAjuste := True;
          Break;
        end;

      end;

      if not existeAjuste then
        Self.Items[I].ajustes.Add(ajuste.Clone as TSpEfdAjustes);      

      Break;
    end;

  if not exiteNfItem then
  begin
    Self.Add(nfitem.Clone);
    Self.Items[Self.Count - 1].ajustes := TSpEfdAjustesList.Create;
    Self.Items[Self.Count - 1].ajustes.Add(ajuste.Clone as TSpEfdAjustes);
  end;
end;

procedure TEfdAjustesConfResultList.SetItem(Index: Integer;
  const Value: TEfdAjustesConfResult);
begin
  Put(Index, Value);
end;


initialization
  RegisterClass(TNotaItemParam);
finalization
  UnRegisterClass(TNotaItemParam);

end.
