unit NotaFiscalPendenciaSefMetadataUnit;

interface

uses
  Classes, SysUtils, EntityMetadataUnit;

type
  NotaFiscalPendenciaSefMetadata = class
  public
    class function GetMetadata: EntityMetadata; static;
  end;

implementation

{ NotaFiscalPendenciaSefMetadata }

class function NotaFiscalPendenciaSefMetadata.GetMetadata: EntityMetadata;
begin
  Result := EntityMetadata.Create('Nota Fiscal Pendente SEFAZ', 'NOTAFISCAL_PEND_SEFAZ');

  // Atributos vinculados
  Result.RegisterField('CodNf'          , 'COD_NF'          , 'Codigo NFe Contingencia');
  Result.RegisterField('CodEmpresa'     , 'COD_EMPRESA'     , 'Codigo Empresa');
  Result.RegisterField('Dhemi'          , 'DHEMI'           , 'Data Pendencia');
  Result.RegisterField('StatusResolucao', 'STATUS_RESOLUCAO', 'Status Resolução');
  Result.RegisterField('CodNfPend'      , 'COD_NF_PEND'     , 'Codigo NFe Pendente');

  // Atributos sem vinculo com a tabela

  // Campos sem vinculo na classe
  Result.RegisterColumnOnly('num_nf_cont'  , 'Numero NF Contingencia');
  Result.RegisterColumnOnly('situacao_cont', 'Situação NF Contingencia');
  Result.RegisterColumnOnly('data_lanc_cont', 'Data NF Contingencia');
  Result.RegisterColumnOnly('num_nf_pend'  , 'Numero NF Pendente');
  Result.RegisterColumnOnly('situacao_pend', 'Situação NF Pendente');    
  Result.RegisterColumnOnly('data_lanc_pend', 'Data NF Pendente');
end;

end.
