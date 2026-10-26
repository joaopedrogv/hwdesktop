unit StatusResolucaoNFeSefEnumUnit;

interface

type
  StatusResolucaoNFeSefEnum = (srsPendente, srsACancelar, srsAInutilizar, srsResolvida, srsResolvidaManual);

const
  StatusResolucaoNFeSefEnumStr: array[StatusResolucaoNFeSefEnum] of string = (
    'Pendente', 'A Cancelar', 'A Inutilizar', 'Resolvida', 'Resolvida Manual'
  );

implementation

end.
