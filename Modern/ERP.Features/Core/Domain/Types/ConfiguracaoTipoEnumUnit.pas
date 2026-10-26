unit ConfiguracaoTipoEnumUnit;

interface

type
  ConfiguracaoTipo = (ctBlob, ctBool, ctString, ctInt, ctFloat, ctDateTime);

const
  ConfiguracaoTipoStr: array[ConfiguracaoTipo] of string = ('blob', 'boolean', 'string', 'interger', 'float', 'datetime');

implementation

end.
