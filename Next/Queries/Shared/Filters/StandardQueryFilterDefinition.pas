unit StandardQueryFilterDefinition;

interface

uses
  FilterDefinition;

// Define apenas os campos de exemplo da entrada de prévia next.query.standard.
// Não representa o catálogo de filtros de uma tela de produto.
function CreateStandardQueryFilterDefinition: TFilterDefinition;

implementation

function CreateStandardQueryFilterDefinition: TFilterDefinition;
begin
  Result := FilterDefinitionOf([
    FilterField('documento', 'Documento', fftString,
      [], TFilterMaskPolicy.FromMasks('', '00.000.000/0000-00', '')),
    FilterField('descricao', 'Descrição', fftString),
    FilterField('codigo', 'Código', fftInteger),
    FilterField('valor', 'Valor', fftCurrency),
    FilterField('data', 'Data', fftDate, [], TFilterMaskPolicy.DateMask)
  ], True);
end;

end.
