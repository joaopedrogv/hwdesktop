unit DFeTypesUnit;

interface

type
  TipoEnteGovEnum = (
    tgvNenhum, tgvUniao, tgvEstados, tgvDistritoFederal, tgvMunicipios, tgvConsorcioPublico, tgvComiteGestorIbs);
  TipoAmbienteEnum = (tpaNaoDefinido, tpaProducao, tpaHomologacao);
  TipoOperEnteGovNFeEnum = (
    togNenhum,
    togFornecimentoPgtoPosterior,
    togRecebDoPgtoComFornJaRealizado,
    togFornComPgtoJaRealizado,
    togRecebDoPgtoComFornPosterior
  );

const
  TipoEnteGovEnumStr: array[TipoEnteGovEnum] of string = (
    'Nenhum', '1 - União', '2 - Estado', '3 - Distrito Federal', '4 - Município', '5 - Consórcio Publico', '6 - Comite Gestor IBS'
  );
  TipoAmbienteEnumStr: array[TipoAmbienteEnum] of string = (
    'Nao Definido', 'Produção', 'Homologação'
  );
  TipoAmbienteEnumGridStr: array[TipoAmbienteEnum] of string = (
    '', '1 - Produção', '2 - Homologação'
  );
  TipoOperEnteGovNFeEnumStr: array[TipoOperEnteGovNFeEnum] of string = (
    'Nenhum',
    '1 - Fornecimento com pagamento posterior',
    '2 - Recebimento do pagamento com fornecimento já realizado',
    '3 - Fornecimento com pagamento já realizado',
    '4 - Recebimento do pagamento com fornecimento posterior'
  );

implementation

end.
