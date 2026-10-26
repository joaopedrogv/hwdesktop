unit TipoTributoEnumUnit;

interface

type
  TipoTributoEnum = ({0} tbtUnassigned, {1} tbtIS, {2} tbtCBS, {3} tbtIBSUF, {4} tbtIBSMun);
  TipoTributoEnumSet = set of TipoTributoEnum;

const
  TipoTributoEnumDisplay: array[TipoTributoEnum] of string =
    ('Não definido', 'Imposto Seletivo', 'CBS', 'IBS Estadual', 'IBS Municipal');

implementation

end.
