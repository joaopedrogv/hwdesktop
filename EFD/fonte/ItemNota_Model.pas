unit ItemNota_Model;

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
  TItemNota_Model = class(TBaseFb_class)
  private
    Fcidade_ibge             : Integer;
    Findiedest               : Integer;
    Fconsumidor_final        : string;
    Ffinalidade_id           : Integer;
    Fuf                      : string;
    Fnatureza_nf             : string;
    Fmodelo_nf               : string;
    Fnfe_iddest              : string;
    Fpessoa                  : string;
    Ftipo_nota               : Int64;
    Fconf_bc                 : TStrings;
    Ffrete_f_nfe             : string;
    Ffreteconta_tr           : string;
    Fcod_nf                  : Integer;
    Fcod_empresa             : Integer;
    Fnitem                   : Integer;
    Fgrupo_prod              : Integer;
    Fcod_prod                : string;
    Fcod_servico             : Integer;
    Ftipo_item               : string;
    Fncm                     : string;
    Fcest                    : string;
    Fcodigo_nop              : Double;
    Ftipo_calc_pc            : Integer;
    Fcst_pis                 : string;
    Fcst_cofins              : string;
    Fnat_rec                 : string;
    Fvalor_pis               : Double;
    Fvalor_cofins            : Double;
    Fbase_pis                : Double;
    Fbase_cofins             : Double;
    Faliq_pis                : Double;
    Faliq_cofins             : Double;
    Faliq_pis_quant          : Double;
    Faliq_cofins_quant       : Double;
    Fquantidade              : Double;
    Fppisdeson               : Double;
    Fpcofinsdeson            : Double;
    Fvpisdeson               : Double;
    Fvcofinsdeson            : Double;
    Fmotdes_pc               : Integer;
    Fquant_bc_pis            : Double;
    Fquant_bc_cofins         : Double;
    Fvalor_total             : Double;
    Frateio_desconto         : Double;
    Frateio_seguro           : Double;
    Frateio_outdesp          : Double;
    Frateio_frete            : Double;
    Fvalor_ipi               : Double;
    Fvalor_icmsub            : Double;
    Fvicmdeson               : Double;
    Fvalor_icm               : Double;
    Fprec_cusm_prod          : Double;
    Fcst_pis_sai             : string;
    Fcst_pis_ent             : string;
    Fnat_rec_prod            : string;
    Ftipo_item_prod          : string;
    Fcst_prod                : string;
    Faliq_pis_diferenciada   : Double;
    Faliq_cofins_diferenciada: Double;
    Faliq_cred_pis           : Double;
    Faliq_cred_cofins        : Double;
    Fpreco_compra_veiculo    : Double;
    Fnat_rec_ncm             : string;
    Fdevolucao_sped          : string;
    Ftipv_veiculo            : string;
    Fvicmsufdest: Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property cidade_ibge             : Integer  read Fcidade_ibge              write Fcidade_ibge;
    property indiedest               : Integer  read Findiedest                write Findiedest;
    property consumidor_final        : string   read Fconsumidor_final         write Fconsumidor_final;
    property finalidade_id           : Integer  read Ffinalidade_id            write Ffinalidade_id;
    property uf                      : string   read Fuf                       write Fuf;
    property natureza_nf             : string   read Fnatureza_nf              write Fnatureza_nf;
    property modelo_nf               : string   read Fmodelo_nf                write Fmodelo_nf;
    property nfe_iddest              : string   read Fnfe_iddest               write Fnfe_iddest;
    property pessoa                  : string   read Fpessoa                   write Fpessoa;
    property tipo_nota               : Int64    read Ftipo_nota                write Ftipo_nota;
    property conf_bc                 : TStrings read Fconf_bc                  write Fconf_bc;
    property frete_f_nfe             : string   read Ffrete_f_nfe              write Ffrete_f_nfe;
    property freteconta_tr           : string   read Ffreteconta_tr            write Ffreteconta_tr;
    property cod_nf                  : Integer  read Fcod_nf                   write Fcod_nf;
    property cod_empresa             : Integer  read Fcod_empresa              write Fcod_empresa;
    property nitem                   : Integer  read Fnitem                    write Fnitem;
    property grupo_prod              : Integer  read Fgrupo_prod               write Fgrupo_prod;
    property cod_prod                : string   read Fcod_prod                 write Fcod_prod;
    property cod_servico             : Integer  read Fcod_servico              write Fcod_servico;
    property tipo_item               : string   read Ftipo_item                write Ftipo_item;
    property ncm                     : string   read Fncm                      write Fncm;
    property cest                    : string   read Fcest                     write Fcest;
    property codigo_nop              : Double   read Fcodigo_nop               write Fcodigo_nop;
    property tipo_calc_pc            : Integer  read Ftipo_calc_pc             write Ftipo_calc_pc;
    property cst_pis                 : string   read Fcst_pis                  write Fcst_pis;
    property cst_cofins              : string   read Fcst_cofins               write Fcst_cofins;
    property nat_rec                 : string   read Fnat_rec                  write Fnat_rec;
    property valor_pis               : Double   read Fvalor_pis                write Fvalor_pis;
    property valor_cofins            : Double   read Fvalor_cofins             write Fvalor_cofins;
    property base_pis                : Double   read Fbase_pis                 write Fbase_pis;
    property base_cofins             : Double   read Fbase_cofins              write Fbase_cofins;
    property aliq_pis                : Double   read Faliq_pis                 write Faliq_pis;
    property aliq_cofins             : Double   read Faliq_cofins              write Faliq_cofins;
    property aliq_pis_quant          : Double   read Faliq_pis_quant           write Faliq_pis_quant;
    property aliq_cofins_quant       : Double   read Faliq_cofins_quant        write Faliq_cofins_quant;
    property quantidade              : Double   read Fquantidade               write Fquantidade;
    property ppisdeson               : Double   read Fppisdeson                write Fppisdeson;
    property pcofinsdeson            : Double   read Fpcofinsdeson             write Fpcofinsdeson;
    property vpisdeson               : Double   read Fvpisdeson                write Fvpisdeson;
    property vcofinsdeson            : Double   read Fvcofinsdeson             write Fvcofinsdeson;
    property motdes_pc               : Integer  read Fmotdes_pc                write Fmotdes_pc;
    property quant_bc_pis            : Double   read Fquant_bc_pis             write Fquant_bc_pis;
    property quant_bc_cofins         : Double   read Fquant_bc_cofins          write Fquant_bc_cofins;
    property valor_total             : Double   read Fvalor_total              write Fvalor_total;
    property rateio_desconto         : Double   read Frateio_desconto          write Frateio_desconto;
    property rateio_seguro           : Double   read Frateio_seguro            write Frateio_seguro;
    property rateio_outdesp          : Double   read Frateio_outdesp           write Frateio_outdesp;
    property rateio_frete            : Double   read Frateio_frete             write Frateio_frete;
    property valor_ipi               : Double   read Fvalor_ipi                write Fvalor_ipi;
    property valor_icmsub            : Double   read Fvalor_icmsub             write Fvalor_icmsub;
    property vicmdeson               : Double   read Fvicmdeson                write Fvicmdeson;
    property valor_icm               : Double   read Fvalor_icm                write Fvalor_icm;
    property prec_cusm_prod          : Double   read Fprec_cusm_prod           write Fprec_cusm_prod;
    property cst_pis_sai             : string   read Fcst_pis_sai              write Fcst_pis_sai;
    property cst_pis_ent             : string   read Fcst_pis_ent              write Fcst_pis_ent;
    property nat_rec_prod            : string   read Fnat_rec_prod             write Fnat_rec_prod;
    property tipo_item_prod          : string   read Ftipo_item_prod           write Ftipo_item_prod;
    property cst_prod                : string   read Fcst_prod                 write Fcst_prod;
    property aliq_pis_diferenciada   : Double   read Faliq_pis_diferenciada    write Faliq_pis_diferenciada;
    property aliq_cofins_diferenciada: Double   read Faliq_cofins_diferenciada write Faliq_cofins_diferenciada;
    property aliq_cred_pis           : Double   read Faliq_cred_pis            write Faliq_cred_pis;
    property aliq_cred_cofins        : Double   read Faliq_cred_cofins         write Faliq_cred_cofins;
    property preco_compra_veiculo    : Double   read Fpreco_compra_veiculo     write Fpreco_compra_veiculo;
    property nat_rec_ncm             : string   read Fnat_rec_ncm              write Fnat_rec_ncm;
    property devolucao_sped          : string   read Fdevolucao_sped           write Fdevolucao_sped;
    property tipv_veiculo            : string   read Ftipv_veiculo             write Ftipv_veiculo;
    property vicmsufdest             : Double   read Fvicmsufdest              write Fvicmsufdest;
  end;

  TItemNotas_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TItemNota_Model;
    procedure SetItem(Index: Integer; const Value: TItemNota_Model);
  public
    function New: TItemNota_Model;

    property Items[Index: Integer]: TItemNota_Model read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TItemNota_Model }

procedure TItemNota_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
  Fconf_bc := TStringList.Create;
end;

constructor TItemNota_Model.Create;
begin
  InitializeObjects;
end;

destructor TItemNota_Model.Destroy;
begin
  if Assigned(Fconf_bc) then
    FreeAndNil(Fconf_bc);
  inherited;
end;

{ TItemNotas_Model }

function TItemNotas_Model.GetItem(Index: Integer): TItemNota_Model;
begin
  Result := TItemNota_Model(inherited Items[Index]);
end;

function TItemNotas_Model.New: TItemNota_Model;
begin
  Result := TItemNota_Model.Create;
  Add(Result);
end;

procedure TItemNotas_Model.SetItem(Index: Integer; const Value: TItemNota_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TItemNota_Model);
finalization
  UnRegisterClass(TItemNota_Model);

end.
