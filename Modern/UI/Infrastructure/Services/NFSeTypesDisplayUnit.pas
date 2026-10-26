unit NFSeTypesDisplayUnit;

interface

uses
  NFSeTypesUnit;

const
//  EmitenteDPSEnumStr: array[EmitenteDPSEnum] of string = (
//    'Não Definido', '1 - Prestador', '2 - Tomador', '3 - Intermediario'
//  );
  OptanteSNEnumStr: array[OptanteSNEnum] of string = (
    'Não Definido',
    '1 - Não Optante',
    '2 - Optante - Microempreendedor Individual (MEI)',
    '3 - Optante - Microempresa ou Empresa de Pequeno Porte (ME/EPP)'
  );
  RegimeApuracaoSNEnumStr: array[RegimeApuracaoSNEnum] of string = (
    'Não Definido',
    '1 – Tributos federais e Municipal pelo SN',
    '2 – Tributos federais pelo SN e o ISSQN pela NFS-e',
    '3 – Tributos federais e Municipal pela NFS-e'
  );
  TributacaoISSQNEnumStr: array[TributacaoISSQNEnum] of string = (
    'Não Definido',
    '1 - Operação tributável',
    '2 - Imunidade',
    '3 - Exportação de serviço',
    '4 - Não Incidência'
  );
  TipoRetencaoISSQNEnumStr: array[TipoRetencaoISSQNEnum] of string = (
    'Não Definido',
    '1 - Não Retido',
    '2 - Retido pelo Tomador',
    '3 - Retido pelo Intermediario'
  );
  TipoRetencaoPisCofinsEnumStr: array[TipoRetencaoPisCofinsEnum] of string = (
    '0 - PIS/COFINS/CSLL Não Retidos',
    '1 - PIS/COFINS Retido',
    '2 - PIS/COFINS Não Retido',
    '3 - PIS/COFINS/CSLL Retidos',
    '4 - PIS/COFINS Retidos, CSLL Não Retido',
    '5 - PIS Retido, COFINS/CSLL Não Retido',
    '6 - COFINS Retido, PIS/CSLL Não Retido',
    '7 - PIS Não Retido, COFINS/CSLL Retidos',
    '8 - PIS/COFINS Não Retidos, CSLL Retido',
    '9 - COFINS Não Retido, PIS/CSLL Retidos'
  );
  MotivoSubstituicaoEnumGridStr: array[MotivoSubstituicaoEnum] of string = (
    'Nao definido',
    '1 – Desenquadramento do Simples Nacional',
    '2 – Enquadramento no Simples Nacional',
    '3 – Inclusão retroativa de imunidade ou isenção',
    '4 – Exclusão retroativa de imunidade ou isenção',
    '5 – Rejeição da NFS-e pelo tomador ou intermediário',
    '6 - (99 – Outros motivos)'
  );
  MotivoSubstituicaoEnumStr: array[MotivoSubstituicaoEnum] of string = (
    'Nao definido',
    '1 – Desenquadramento do Simples Nacional',
    '2 – Enquadramento no Simples Nacional',
    '3 – Inclusão retroativa de imunidade ou isenção',
    '4 – Exclusão retroativa de imunidade ou isenção',
    '5 – Rejeição da NFS-e pelo tomador ou intermediário',
    '99 – Outros motivos'
  );
  TipoOperEnteGovEnumStr: array[TipoOperEnteGovEnum] of string = (
    'Não Definido',
    '1 – Fornecimento antes do pagamento',
    '2 – Pagamento após fornecimento',
    '3 – Fornecimento após pagamento',
    '4 – Pagamento antes do fornecimento',
    '5 – Fornecimento e pagamento simultâneos'
  );
  TipoOperEnteGovEnumStrLayout: array[TipoOperEnteGovEnum] of string = (
    'Não Definido',
    '1 – Fornecimento com pagamento posterior',
    '2 - Recebimento do pagamento com fornecimento já realizado',
    '3 – Fornecimento com pagamento já realizado',
    '4 – Recebimento do pagamento com fornecimento posterior',
    '5 – Fornecimento e recebimento do pagamento concomitantes'
  );
  TipoPartDpesEnumStr: array[TipoPartDpesEnum] of string = (
    'Não Definido', 'Prestador', 'Tomador', 'Intermediário', 'Destinatário IBSCBS'
  );
  SituacaoNFSeEnumStr: array[SituacaoNFSeEnum] of string = (
    'Excluído', 'Rascunho', 'Rejeição', 'Emissão', 'EmProcessamento', 'Autorizada', 'Cancelada', 'Substituída'
  );

  SituacaoNFSeEnumGridStr: array[SituacaoNFSeEnum] of string = (
    '0 - Excluído', '1 - Rascunho', '2 - Rejeição', '3 - Emissão', '4 - EmProcessamento', '5 - Autorizada', '6 - Cancelada', '7 - Substituída'
  );
  NaturezaEmissaoNFSeEnumGridStr: array[NaturezaEmissaoNFSeEnum] of string = (
    '0 - Serviço Prestado/WS', '1 - Serviço Prestado/Portal', '2 - Serviço Tomado'
  );
  NaturezaEmissaoNFSeEnumStr: array[NaturezaEmissaoNFSeEnum] of string = (
    'Serviço Prestado/WS', 'Serviço Prestado/Portal', 'Serviço Tomado'
  );
  LayoutNFSeEnumGridStr: array[LayoutNFSeEnum] of string = (
    '0 - Próprio Prefeitura', '1 - Nacional', '2 - Nacional com IBSCBS'
  );
  LayoutNFSeEnumStr: array[LayoutNFSeEnum] of string = (
    'Prefeitura', 'Nacional', 'Nacional com IBSCBS'
  );
  TipoHistoricoNFSeEnumStr: array[TipoHistoricoNFSeEnum] of string = (
    'Alteração de Status', 'Rejeição', 'Evento', 'Email Enviado', 'Log histórico'
  );
  TipoEventoNFSeEnumStr: array[TipoEventoNFSeEnum] of string = ('Cancelamento');

  OrigemCancelamentoNFSeEnumGridStr: array[OrigemCancelamentoNFSeEnum] of string = (
    '', '1 - Sistema/WebService', '2 - Website ou Portal'
  );
  MotivoCancelamentoNFSeEnumGridStr: array[MotivoCancelamentoNFSeEnum] of string = (
    '1 - Erro na Emissão', '2 - Serviço não Prestado', '3 - RPS Cancelado na Emissão', '9 - Outros');

  MotivoCancelamentoNFSeEnumValues: array[MotivoCancelamentoNFSeEnum] of string = (
    '1', '2', '3', '9');

implementation

end.
