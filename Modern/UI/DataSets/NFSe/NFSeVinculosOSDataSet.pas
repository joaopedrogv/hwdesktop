unit NFSeVinculosOSDataSet;

interface

uses
  DataSetGrid, DB, FieldsConfigUnit;

type
  TNFSeVinculosOSDataSet = class(TDataSetGrid)
  private
    //procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder);
  end;

implementation

uses
  SysUtils, MasksConstsUnit;

{ TNFSeVinculosOSDataSet }

constructor TNFSeVinculosOSDataSet.Create;
begin
  inherited Create( 'cdsNFSeOS', 'NFSE_OS' );

  SQLMaker.Build( TableName, 'ns',
    'ns.id, ns.nfse_id, ns.nped, ns.tipo, ns.cod_empresa, ns.vserv, ns.vdescincond, ns.vretirrf, ns.vretcp, ' +
    'ns.vretpis, ns.vretcofins, ns.vretcsll, ns.vretiss, ' +
    '(ns.vserv - ns.vdescincond - ns.vretirrf - ns.vretcp - ns.vretpis - ns.vretcofins - ns.vretcsll - ns.vretiss) vliqOS, ' +
    'n.vserv vservnf, coalesce(n.vdescincond, 0) vdescnf, n.vtotalret, n.vliq vliqnf,  n.vtotnf ',
    'inner join nfse n on n.id = ns.nfse_id',
    '',
    'nped'
  );
end;

procedure TNFSeVinculosOSDataSet.Setup(const Builder: IFieldsConfigBuilder);
var
  S: string;
begin
  ConfigFields( Builder
    .Add('id,nfse_id,tipo,cod_empresa', '', fvInvisivel)
    .Add('nped', 'Num O.S.')                          
    .Add('vliqOS', 'Valor Liquido O.S.', '', MSK_DEC_00)
    .Add('vserv', 'Valor Serviços O.S.', '', MSK_DEC_00)
    .Add('vdescincond', 'Valor Descontos O.S.', '', MSK_DEC_00)
    .Add('vretirrf', 'IRRF O.S.', '', MSK_DEC_00)
    .Add('vretcp', 'CP Retido O.S.', '', MSK_DEC_00)
    .Add('vretpis', 'PIS Retido O.S.', '', MSK_DEC_00)
    .Add('vretcofins', 'COFINS Retido O.S.', '', MSK_DEC_00)
    .Add('vretcsll', 'CSLL Retido O.S.', '', MSK_DEC_00)
    .Add('vretiss', 'ISS Retido O.S.', '', MSK_DEC_00)
    .Add('vservnf', 'Valor Serviços NF', '', MSK_DEC_00)
    .Add('vdescnf', 'Valor Descontos NF', '', MSK_DEC_00)
    .Add('vtotalret', 'Total Retenções NF', '', MSK_DEC_00)
    .Add('vliqnf', 'Valor Liquido NFS', '', MSK_DEC_00)
    .Add('vtotnf', 'Valor Tot NFS', '', MSK_DEC_00)
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('id', True);

  S := SQLMaker.GetSQL();

  CreateFieldsBySQL( S );

  RunSQLMaker();
end;

end.
