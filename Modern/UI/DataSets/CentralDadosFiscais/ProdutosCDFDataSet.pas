unit ProdutosCDFDataSet;

interface 

uses
  DataSetGrid, DB;

type
  TProdutosCDFDataSetQuery = (prdQryPorNCM);

  TProdutosCDFDataSetSetup = record
  private
    Query: TProdutosCDFDataSetQuery;
    SelectionField: string;
  public
    class function Create(
      Query: TProdutosCDFDataSetQuery;
      SelectionField: string
    ): TProdutosCDFDataSetSetup; static;
  end;

  TProdutosCDFDataSet = class(TDataSetGrid)
  public
    procedure Setup(const Input: TProdutosCDFDataSetSetup);
    procedure ListarPorNCM(const NCM: string);
  end;

implementation

uses
  SysUtils;

{ TProdutosCDFDataSet }

procedure TProdutosCDFDataSet.ListarPorNCM(const NCM: string);
var
  SQL: string;
begin
  if NCM = '' then
    SQL := Format('select * from ( %s and p.nbm = :ncm union %s and p.nbm is null) ', [ SQLText, SQLText ] )
  else
    SQL := Format('select * from (%s and p.nbm = :ncm ) order by descr_prod', [SQLText]);
  Self.Close();
  Self.SQLClient( SQL )
    .ParamValue('cod_empresa', EmpresaId)
    .ParamValue('ncm', NCM)
    .Open();
end;

procedure TProdutosCDFDataSet.Setup(const Input: TProdutosCDFDataSetSetup);
begin
  case Input.Query of
    prdQryPorNCM:
      begin
        SQLText :=
          'select p.grupo_prod, p.cod_prod, p.num_fab_prod, p.cod_empresa, p.nbm, p.descr_prod ' +
          'from produtos p ' +
          'where p.cod_empresa = :cod_empresa and p.ativo <> 99';

        CreateFieldsBySQL(Format('%s and 1=0', [ SQLText ]));
      end;
  end;
  if Input.SelectionField <> '' then
    CreateSelectionField(Input.SelectionField);
end;


{ TProdutosCDFDataSetSetup }

class function TProdutosCDFDataSetSetup.Create(
  Query: TProdutosCDFDataSetQuery;
  SelectionField: string
): TProdutosCDFDataSetSetup;
begin
  Result.Query := Query;
  Result.SelectionField := SelectionField;
end;

end.
