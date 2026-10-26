unit CorrelacaoCodigosFiscaisDataSet;

interface     

uses
  DataSetGrid, DB, FieldsConfigUnit;

type
  TCorrelacaoCodigosFiscaisDataSet = class(TDataSetGrid)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    procedure Setup(const Builder: IFieldsConfigBuilder);
  end;

implementation

uses SysUtils, uDataSet_OOP;

{ TCorrelacaoCodigosFiscaisDataSet }

constructor TCorrelacaoCodigosFiscaisDataSet.Create;
begin
  inherited Create( 'CDS_NFSCORRELFISCAL', 'NFS_CORRELFISCAL' );
end;

procedure TCorrelacaoCodigosFiscaisDataSet.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.FieldName = 'DESCRICAO_CTRIBNAC' then
    Text := Format('%s - %s', [ fstr('ctribnac'), Sender.AsString ] )
  else if Sender.FieldName = 'DESCRICAO_NBS' then
    Text := Format('%s - %s', [ fstr('cnbs'), Sender.AsString ] )
  else if Sender.FieldName = 'DESCRICAO_CINDOP' then
    Text := Format('%s - %s', [ fstr('cindop'), Sender.AsString ] )  
end;

procedure TCorrelacaoCodigosFiscaisDataSet.Setup(const Builder: IFieldsConfigBuilder);
var
  S: string;
begin
  S :=
    'select distinct c.clc116, c.cnbs, c.cindop, ' +
    '       cn.ctribnac,  cn.descricao descricao_ctribnac, ' +
    '       co.descricao descricao_cindop, ' +
    '       nb.descricao_nbs ' +
    'from ( ' +
    '  select c.clc116, c.cnbs, c.cindop, c.cclasstrib, ' +
    '         substring(c.clc116 from 1 for 2) || substring(c.clc116 from 4 for 2) ctribnac_4 ' +
    '  from nfs_fiscal_correl c ' +
    ') as c ' +
    'left join nfs_fiscal_ctribnac cn on cn.ctribnac starts with c.ctribnac_4 ' +
    'left join nfs_fiscal_cindop co on co.cindop = c.cindop ' +
    'left join nbs nb on nb.cod_nbs = c.cnbs '
  ;

  ConfigFields( Builder
    //.Add('id', fvInvisivel)
    .Add('clc116', 'Cod LC116').Width(75)
    .Add('ctribnac', 'CTrib Nacional', '99.99.99;0;_').Width(75)
    .Add('cnbs', 'NBS', '9.9999.99.99;0;_').Width(100)
    .Add('cindop', 'Cod Ind Operacao').Width(90)
    .Add('descricao_ctribnac', 'Descrição Tributação Nacional', GetText ).Width(500)
    .Add('descricao_nbs', 'NBS', GetText ).Width(500)
    .Add('descricao_cindop', 'Descrição Codigo Indicador de Fornecimento(NFSe)', GetText ).Width(400)
  );

  CreateFieldsBySQL( Format('%s where 1=0', [ S ]));

  ClientOpen( S );
end;

end.
