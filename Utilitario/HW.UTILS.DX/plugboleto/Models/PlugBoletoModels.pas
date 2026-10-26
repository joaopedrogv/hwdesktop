unit PlugBoletoModels;

interface

uses
  System.Classes, System.Generics.Collections;

type
//  TArrayItems = class
//  private
//    Fmue: string;
//    Fvalue: Double;
//  published
//    property mue: string read Fmue write Fmue;
//    property value: Double read Fvalue write Fvalue;
//  end;
//
//  TOutroObjeto = class
//  private
//    Fid: string;
//    Fname: string;
//    Fitems: TArray<TArrayItems>;
//  published
//    property id: string read Fid write Fid;
//    property name: string read Fname write Fname;
//    property items: TArray<TArrayItems> read Fitems write Fitems;
//  end;

  TBoleto = class(TPersistent)
  private
    Fhibrido: Boolean;
    FCedenteContaCodigoBanco: string;
    FSacadoNome: string;
    FTituloDocEspecie: string;
    FTituloParcela: string;
    FTituloNumeroDocumento: string;
    FSacadoEnderecoLogradouro: string;
    FTituloSacadorAvalistaCEP: string;
    FSacadoTelefone: string;
    FTituloInstrucoes: string;
    FTituloValorDescontoTaxa2: string;
    FTituloDataDesconto: string;
    FSacadoCelular: string;
    FCedenteContaNumero: string;
    FTituloCodEmissaoBloqueto: string;
    FSacadoEnderecoBairro: string;
    FTituloInscricaoSacadorAvalista: string;
    FTituloPrazoProtesto: string;
    FTituloValor: string;
    FSacadoEmail: string;
    FTituloValorDesconto: string;
    FSacadoEnderecoUf: string;
    FTituloValorDescontoTaxa: string;
    FCedenteContaNumeroDV: string;
    FTituloNossoNumero: string;
    FTituloDataVencimento: string;
    FTituloOutrosAcrescimos: string;
    FTituloSacadorAvalistaCidade: string;
    FTituloAceite: string;
    FCedenteConvenioNumero: string;
    FTituloSacadorAvalistaEndereco: string;
    FTituloDataMulta: string;
    FTituloDataJuros: string;
    FSacadoEnderecoCep: string;
    FSacadoEnderecoNumero: string;
    FTituloCategoria: string;
    FTituloSacadorAvalista: string;
    FTituloCodProtesto: string;
    FTituloLocalPagamento: string;
    FSacadoCPFCNPJ: string;
    FTituloDataEmissao: string;
    FTituloEmissaoBoleto: string;
    FTituloCodDesconto2: string;
    FTituloVariacaoCarteira: string;
    FTituloValorMulta: string;
    FTituloValorJuros: string;
    FSacadoEnderecoComplemento: string;
    FTituloValorMultaTaxa: string;
    FTituloDataDesconto2: string;
    FTituloSacadorAvalistaUF: string;
    FTituloCodBaixaDevolucao: string;
    FTituloInformacoesAdicionais: string;
    FTituloPostagemBoleto: string;
    FTituloPrazoBaixa: string;
    FTituloCodigoMulta: string;
    FTituloCodigoJuros: string;
    FSacadoEnderecoCidade: string;
    FTituloCodDesconto: string;
    FSacadoEnderecoPais: string;
    FTituloMensagem01: string;
    FTituloMensagem02: string;
    FTituloMensagem03: string;
    FTituloMensagem04: string;
    FTituloMensagem05: string;
    FTituloMensagem06: string;
    FTituloMensagem07: string;
    FTituloMensagem08: string;
    FTituloMensagem09: string;
    FTituloCodigoReferencia: string;
  published
    property Hibrido: Boolean read FHibrido write FHibrido;
    property CedenteContaCodigoBanco: string read FCedenteContaCodigoBanco write FCedenteContaCodigoBanco;
    property CedenteContaNumero: string read FCedenteContaNumero write FCedenteContaNumero;
    property CedenteContaNumeroDV: string read FCedenteContaNumeroDV write FCedenteContaNumeroDV;
    property CedenteConvenioNumero: string read FCedenteConvenioNumero write FCedenteConvenioNumero;
    property SacadoCPFCNPJ: string read FSacadoCPFCNPJ write FSacadoCPFCNPJ;
    property SacadoEmail: string read FSacadoEmail write FSacadoEmail;
    property SacadoEnderecoLogradouro: string read FSacadoEnderecoLogradouro write FSacadoEnderecoLogradouro;
    property SacadoEnderecoNumero: string read FSacadoEnderecoNumero write FSacadoEnderecoNumero;
    property SacadoEnderecoBairro: string read FSacadoEnderecoBairro write FSacadoEnderecoBairro;
    property SacadoEnderecoCep: string read FSacadoEnderecoCep write FSacadoEnderecoCep;
    property SacadoEnderecoCidade: string read FSacadoEnderecoCidade write FSacadoEnderecoCidade;
    property SacadoEnderecoComplemento: string read FSacadoEnderecoComplemento write FSacadoEnderecoComplemento;
    property SacadoEnderecoPais: string read FSacadoEnderecoPais write FSacadoEnderecoPais;
    property SacadoEnderecoUf: string read FSacadoEnderecoUf write FSacadoEnderecoUf;
    property SacadoNome: string read FSacadoNome write FSacadoNome;
    property SacadoTelefone: string read FSacadoTelefone write FSacadoTelefone;
    property SacadoCelular: string read FSacadoCelular write FSacadoCelular;
    property TituloCodigoReferencia: string read FTituloCodigoReferencia write FTituloCodigoReferencia;
    property TituloNossoNumero: string read FTituloNossoNumero write FTituloNossoNumero;
    property TituloValor: string read FTituloValor write FTituloValor;
    property TituloNumeroDocumento: string read FTituloNumeroDocumento write FTituloNumeroDocumento;
    property TituloDataEmissao: string read FTituloDataEmissao write FTituloDataEmissao;
    property TituloDataVencimento: string read FTituloDataVencimento write FTituloDataVencimento;
    property TituloAceite: string read FTituloAceite write FTituloAceite;
    property TituloDocEspecie: string read FTituloDocEspecie write FTituloDocEspecie;
    property TituloLocalPagamento: string read FTituloLocalPagamento write FTituloLocalPagamento;
    property TituloCodDesconto: string read FTituloCodDesconto write FTituloCodDesconto;
    property TituloDataDesconto: string read FTituloDataDesconto write FTituloDataDesconto;
    property TituloValorDescontoTaxa: string read FTituloValorDescontoTaxa write FTituloValorDescontoTaxa;
    property TituloCodDesconto2: string read FTituloCodDesconto2 write FTituloCodDesconto2;
    property TituloDataDesconto2: string read FTituloDataDesconto2 write FTituloDataDesconto2;
    property TituloValorDescontoTaxa2: string read FTituloValorDescontoTaxa2 write FTituloValorDescontoTaxa2;
    property TituloValorDesconto: string read FTituloValorDesconto write FTituloValorDesconto;
    property TituloCodigoJuros: string read FTituloCodigoJuros write FTituloCodigoJuros;
    property TituloDataJuros: string read FTituloDataJuros write FTituloDataJuros;
    property TituloValorJuros: string read FTituloValorJuros write FTituloValorJuros;
    property TituloCodigoMulta: string read FTituloCodigoMulta write FTituloCodigoMulta;
    property TituloDataMulta: string read FTituloDataMulta write FTituloDataMulta;
    property TituloValorMultaTaxa: string read FTituloValorMultaTaxa write FTituloValorMultaTaxa;
    property TituloValorMulta: string read FTituloValorMulta write FTituloValorMulta;
    property TituloCodProtesto: string read FTituloCodProtesto write FTituloCodProtesto;
    property TituloPrazoProtesto: string read FTituloPrazoProtesto write FTituloPrazoProtesto;
    property TituloCodBaixaDevolucao: string read FTituloCodBaixaDevolucao write FTituloCodBaixaDevolucao;
    property TituloPrazoBaixa: string read FTituloPrazoBaixa write FTituloPrazoBaixa;
    property TituloMensagem01: string read FTituloMensagem01 write FTituloMensagem01;
    property TituloMensagem02: string read FTituloMensagem02 write FTituloMensagem02;
    property TituloMensagem03: string read FTituloMensagem03 write FTituloMensagem03;
    property TituloMensagem04: string read FTituloMensagem04 write FTituloMensagem04;
    property TituloMensagem05: string read FTituloMensagem05 write FTituloMensagem05;
    property TituloMensagem06: string read FTituloMensagem06 write FTituloMensagem06;
    property TituloMensagem07: string read FTituloMensagem07 write FTituloMensagem07;
    property TituloMensagem08: string read FTituloMensagem08 write FTituloMensagem08;
    property TituloMensagem09: string read FTituloMensagem09 write FTituloMensagem09;
    property TituloSacadorAvalista: string read FTituloSacadorAvalista write FTituloSacadorAvalista;
    property TituloSacadorAvalistaEndereco: string read FTituloSacadorAvalistaEndereco write FTituloSacadorAvalistaEndereco;
    property TituloSacadorAvalistaCidade: string read FTituloSacadorAvalistaCidade write FTituloSacadorAvalistaCidade;
    property TituloSacadorAvalistaCEP: string read FTituloSacadorAvalistaCEP write FTituloSacadorAvalistaCEP;
    property TituloSacadorAvalistaUF: string read FTituloSacadorAvalistaUF write FTituloSacadorAvalistaUF;
    property TituloInscricaoSacadorAvalista: string read FTituloInscricaoSacadorAvalista write FTituloInscricaoSacadorAvalista;
    property TituloEmissaoBoleto: string read FTituloEmissaoBoleto write FTituloEmissaoBoleto;
    property TituloCategoria: string read FTituloCategoria write FTituloCategoria;
    property TituloPostagemBoleto: string read FTituloPostagemBoleto write FTituloPostagemBoleto;
    property TituloCodEmissaoBloqueto: string read FTituloCodEmissaoBloqueto write FTituloCodEmissaoBloqueto;
    property TituloOutrosAcrescimos: string read FTituloOutrosAcrescimos write FTituloOutrosAcrescimos;
    property TituloInformacoesAdicionais: string read FTituloInformacoesAdicionais write FTituloInformacoesAdicionais;
    property TituloInstrucoes: string read FTituloInstrucoes write FTituloInstrucoes;
    property TituloParcela: string read FTituloParcela write FTituloParcela;
    property TituloVariacaoCarteira: string read FTituloVariacaoCarteira write FTituloVariacaoCarteira;

//    property teste: TOutroObjeto read Fteste write Fteste;
//    property testes: TArray<TOutroObjeto> read Ftestes write Ftestes;
  end;

  TCedente = class(TPersistent)
  private
    FCedenteRazaoSocial: string;
    FCedenteNomeFantasia: string;
    FCedenteCPFCNPJ: string;
    FCedenteEnderecoLogradouro: string;
    FCedenteEnderecoNumero: string;
    FCedenteEnderecoComplemento: string;
    FCedenteEnderecoBairro: string;
    FCedenteEnderecoCEP: string;
    FCedenteEnderecoCidadeIBGE: string;
    FCedenteTelefone: string;
    FCedenteEmail: string;
  published
    property CedenteRazaoSocial: string read FCedenteRazaoSocial write FCedenteRazaoSocial;
    property CedenteNomeFantasia: string read FCedenteNomeFantasia write FCedenteNomeFantasia;
    property CedenteCPFCNPJ: string read FCedenteCPFCNPJ write FCedenteCPFCNPJ;
    property CedenteEnderecoLogradouro: string read FCedenteEnderecoLogradouro write FCedenteEnderecoLogradouro;
    property CedenteEnderecoNumero: string read FCedenteEnderecoNumero write FCedenteEnderecoNumero;
    property CedenteEnderecoComplemento: string read FCedenteEnderecoComplemento write FCedenteEnderecoComplemento;
    property CedenteEnderecoBairro: string read FCedenteEnderecoBairro write FCedenteEnderecoBairro;
    property CedenteEnderecoCEP: string read FCedenteEnderecoCEP write FCedenteEnderecoCEP;
    property CedenteEnderecoCidadeIBGE: string read FCedenteEnderecoCidadeIBGE write FCedenteEnderecoCidadeIBGE;
    property CedenteTelefone: string read FCedenteTelefone write FCedenteTelefone;
    property CedenteEmail: string read FCedenteEmail write FCedenteEmail;
  end;

  TConta = class(TPersistent)
  private
    FContaCodigoBanco: string;
    FContaNumero: string;
    FContaNumeroDV: string;
    FContaAgencia: string;
    FContaAgenciaDV: string;
    FContaTipo: string;
    FContaCodigoBeneficiario: string;
    FContaCodigoEmpresa: string;
    FContaValidacaoAtiva: boolean;
    FContaImpressaoAtualizada: boolean;
    FContaImpressaoAtualizadaAlteracao: boolean;
    FContaImpressaoAtualizadaLiquidado: boolean;
  published
    property ContaCodigoBanco: string read FContaCodigoBanco write FContaCodigoBanco;
    property ContaNumero: string read FContaNumero write FContaNumero;
    property ContaNumeroDV: string read FContaNumeroDV write FContaNumeroDV;
    property ContaAgencia: string read FContaAgencia write FContaAgencia;
    property ContaAgenciaDV: string read FContaAgenciaDV write FContaAgenciaDV;
    property ContaTipo: string read FContaTipo write FContaTipo;
    property ContaCodigoBeneficiario: string read FContaCodigoBeneficiario write FContaCodigoBeneficiario;
    property ContaCodigoEmpresa: string read FContaCodigoEmpresa write FContaCodigoEmpresa;
    property ContaValidacaoAtiva: boolean read FContaValidacaoAtiva write FContaValidacaoAtiva;
    property ContaImpressaoAtualizada: boolean read FContaImpressaoAtualizada write FContaImpressaoAtualizada;
    property ContaImpressaoAtualizadaAlteracao: boolean read FContaImpressaoAtualizadaAlteracao write FContaImpressaoAtualizadaAlteracao;
    property ContaImpressaoAtualizadaLiquidado: boolean read FContaImpressaoAtualizadaLiquidado write FContaImpressaoAtualizadaLiquidado;
  end;

  TConvenio = class(TPersistent)
  private
    FConvenioNumero: string;
    FConvenioDescricao: string;
    FConvenioCarteira: string;
    FConvenioEspecie: string;
    FConvenioPadraoCNAB: string;
    FConvenioReiniciarDiariamente: Boolean;
    FConvenioNumeroRemessa: string;
    FConta: Integer;
  published
    property ConvenioNumero: string read FConvenioNumero write FConvenioNumero;
    property ConvenioDescricao: string read FConvenioDescricao write FConvenioDescricao;
    property ConvenioCarteira: string read FConvenioCarteira write FConvenioCarteira;
    property ConvenioEspecie: string read FConvenioEspecie write FConvenioEspecie;
    property ConvenioPadraoCNAB: string read FConvenioPadraoCNAB write FConvenioPadraoCNAB;
    property ConvenioReiniciarDiariamente: boolean read FConvenioReiniciarDiariamente write FConvenioReiniciarDiariamente;
    property ConvenioNumeroRemessa: string read FConvenioNumeroRemessa write FConvenioNumeroRemessa;
    property Conta: Integer read FConta write FConta;
  end;

  TBoletoResumo = class
  private
    FSacadoNome: string;
    FCedenteContaNumero: string;
    FTituloValor: string;
    FTituloNossoNumero: string;
    FCedenteConvenioNumero: string;
    FTituloDataEmissao: string;
    FTituloCodigoReferencia: string;
  published
    property TituloNossoNumero: string read FTituloNossoNumero write FTituloNossoNumero;
    property CedenteConvenioNumero: string read FCedenteConvenioNumero write FCedenteConvenioNumero;
    property CedenteContaNumero: string read FCedenteContaNumero write FCedenteContaNumero;
    property SacadoNome: string read FSacadoNome write FSacadoNome;
    property TituloDataEmissao: string read FTituloDataEmissao write FTituloDataEmissao;
    property TituloValor: string read FTituloValor write FTituloValor;
    property TituloCodigoReferencia: string read FTituloCodigoReferencia write FTituloCodigoReferencia;
  end;

  TRemessaResumo = class
  private
    FErro: string;
    FIdintegracao: string;
    FStatusHttp: Integer;
  published
    property Erro: string read FErro write FErro;
    property Idintegracao: string read FIdintegracao write FIdintegracao;
    property StatusHttp: Integer read FStatusHttp write FStatusHttp;
  end;

  TDescartarResumo = class
  private
    FErro: string;
    FIdintegracao: string;
    FStatusHttp: Integer;
  published
    property Erro: string read FErro write FErro;
    property Idintegracao: string read FIdintegracao write FIdintegracao;
    property StatusHttp: Integer read FStatusHttp write FStatusHttp;
  end;

  TTituloOcorrencia = class(TPersistent)
  private
    Fcodigo: string;
    Fmensagem: string;
    Fcriado: string;
    Fatualizado: string;
  published
    property codigo: string read Fcodigo write Fcodigo;
    property mensagem: string read Fmensagem write Fmensagem;
    property criado: string read Fcriado write Fcriado;
    property atualizado: string read Fatualizado write Fatualizado;
  end;

  TTituloMovimento = class(TPersistent)
  private
    Fcodigo: string;
    Fmensagem: string;
    Fdata: string;
    Focorrencias: TArray<TTituloOcorrencia>;
    Ftaxa: string;
  published
    property codigo: string read Fcodigo write Fcodigo;
    property mensagem: string read Fmensagem write Fmensagem;
    property data: string read Fdata write Fdata;
    property taxa: string read Ftaxa write Ftaxa;
    property ocorrencias: TArray<TTituloOcorrencia> read Focorrencias write Focorrencias;
  end;

  TBoletoIntegrado = class(TBoleto)
  private
    Fidintegracao: string;
    FTituloCodigoReferencia: string;
    Fsituacao: string;
    Fmotivo: string;
    FTituloOcorrencias: TArray<TTituloOcorrencia>;
    FTituloMovimentos: TArray<TTituloMovimento>;
    FPagamentoData: string;
    FPagamentoDataCredito: string;
    FPagamentoRealizado: Boolean;
    FPagamentoValorCredito: string;
    FPagamentoValorPago: string;
    FPagamentoValorTaxaCobranca: string;
    FPagamentoValorAcrescimos: string;
    FPagamentoValorDesconto: string;
    FPagamentoValorAbatimento: string;
    FPagamentoDataTaxaBancaria: string;
    FPagamentoValorOutrasDespesas: string;
    FPagamentoValorOutrosCreditos: string;
    FPagamentoValorIOF: string;
    FTituloNossoNumeroImpressao: string;
    FTituloLinhaDigitavel: string;
    FTituloCodigoBarras: string;
    FConvenioRegistroAutomatico: Boolean;
    FUrlBoleto: string;
    FUrlPix: string;
    FEmv: string;
    FHibrido: Boolean;
    Fimpressao_visualizada: Boolean;
    Fatualizado: string;
    Fvia_ws: Boolean;
    Fprotesto: Boolean;
  published
    property idintegracao: string read Fidintegracao write Fidintegracao;
    property situacao: string read Fsituacao write Fsituacao;
    property motivo: string read Fmotivo write Fmotivo;
    property TituloCodigoReferencia: string read FTituloCodigoReferencia write FTituloCodigoReferencia;
    property TituloNossoNumeroImpressao: string read FTituloNossoNumeroImpressao write FTituloNossoNumeroImpressao;
    property TituloLinhaDigitavel: string read FTituloLinhaDigitavel write FTituloLinhaDigitavel;
    property TituloCodigoBarras: string read FTituloCodigoBarras write FTituloCodigoBarras;
    property PagamentoData: string read FPagamentoData write FPagamentoData;
    property PagamentoDataCredito: string read FPagamentoDataCredito write FPagamentoDataCredito;
    property PagamentoRealizado: Boolean read FPagamentoRealizado write FPagamentoRealizado;
    property PagamentoValorCredito: string read FPagamentoValorCredito write FPagamentoValorCredito;
    property PagamentoValorPago: string read FPagamentoValorPago write FPagamentoValorPago;
    property PagamentoValorTaxaCobranca: string read FPagamentoValorTaxaCobranca write FPagamentoValorTaxaCobranca;
    property PagamentoValorAcrescimos: string read FPagamentoValorAcrescimos write FPagamentoValorAcrescimos;
    property PagamentoValorDesconto: string read FPagamentoValorDesconto write FPagamentoValorDesconto;
    property PagamentoValorAbatimento: string read FPagamentoValorAbatimento write FPagamentoValorAbatimento;
    property PagamentoDataTaxaBancaria: string read FPagamentoDataTaxaBancaria write FPagamentoDataTaxaBancaria;
    property PagamentoValorOutrasDespesas: string read FPagamentoValorOutrasDespesas write FPagamentoValorOutrasDespesas;
    property PagamentoValorOutrosCreditos: string read FPagamentoValorOutrosCreditos write FPagamentoValorOutrosCreditos;
    property PagamentoValorIOF: string read FPagamentoValorIOF write FPagamentoValorIOF;
    property ConvenioRegistroAutomatico: Boolean read FConvenioRegistroAutomatico write FConvenioRegistroAutomatico;
    property UrlBoleto: string read FUrlBoleto write FUrlBoleto;
    property UrlPix: string read FUrlPix write FUrlPix;
    property Emv: string read FEmv write FEmv;
    property Hibrido: Boolean read FHibrido write FHibrido;
    property impressao_visualizada: Boolean read Fimpressao_visualizada write Fimpressao_visualizada;
    property atualizado: string read Fatualizado write Fatualizado;
    property via_ws: Boolean read Fvia_ws write Fvia_ws;
    property protesto: Boolean read Fprotesto write Fprotesto;

    property TituloOcorrencias: TArray<TTituloOcorrencia> read FTituloOcorrencias write FTituloOcorrencias;
    property TituloMovimentos: TArray<TTituloMovimento> read FTituloMovimentos write FTituloMovimentos;

    function TituloOcorrenciasToStr: string;
    function CodigoUltOcorrenciasToStr: string;
    function DescrUltOcorrenciasToStr: string;
    function TituloMovimentosToStr: string;
  end;

  TTitulos = class
  private
    FCedentecpfcnpj: string;
    FIdIntegracao: string;
  published
    property Cedentecpfcnpj: string read FCedentecpfcnpj write FCedentecpfcnpj;
    property IdIntegracao: string read FIdIntegracao write FIdIntegracao;
  end;

  TTitulosNaoConciliados = class
  private
    FCodigoMovimento: string;
//    FCodigosOcorrencias: TArray<string>;
    FOcorrencias: TArray<string>;
    FPagamentoData: string;
    FPagamentoDataCredito: string;
    FPagamentoRealizado: Boolean;
    FPagamentoValorAcrescimos: string;
    FPagamentoValorCredito: string;
    FPagamentoValorOutrosCreditos: string;
    FPagamentoValorPago: string;
    FPagamentoValorTaxaCobranca: string;
    FTituloDataVencimento: string;
    FTituloNossoNumero: string;
    FTituloNossoNumeroOriginal: string;
    FTituloNumeroDocumento: string;
    FTituloIdentificacaoEmpresa: string;
  published
    property CodigoMovimento: string read FCodigoMovimento write FCodigoMovimento;
    //property CodigosOcorrencias: TArray<string> read FCodigosOcorrencias write FCodigosOcorrencias;
    property Ocorrencias: TArray<string> read FOcorrencias write FOcorrencias;
    property PagamentoData: string read FPagamentoData write FPagamentoData;
    property PagamentoDataCredito: string read FPagamentoDataCredito write FPagamentoDataCredito;
    property PagamentoRealizado: Boolean read FPagamentoRealizado write FPagamentoRealizado;
    property PagamentoValorAcrescimos: string read FPagamentoValorAcrescimos write FPagamentoValorAcrescimos;
    property PagamentoValorCredito: string read FPagamentoValorCredito write FPagamentoValorCredito;
    property PagamentoValorOutrosCreditos: string read FPagamentoValorOutrosCreditos write FPagamentoValorOutrosCreditos;
    property PagamentoValorPago: string read FPagamentoValorPago write FPagamentoValorPago;
    property PagamentoValorTaxaCobranca: string read FPagamentoValorTaxaCobranca write FPagamentoValorTaxaCobranca;
    property TituloDataVencimento: string read FTituloDataVencimento write FTituloDataVencimento;
    property TituloNossoNumero: string read FTituloNossoNumero write FTituloNossoNumero;
    property TituloNossoNumeroOriginal: string read FTituloNossoNumeroOriginal write FTituloNossoNumeroOriginal;
    property TituloNumeroDocumento: string read FTituloNumeroDocumento write FTituloNumeroDocumento;
    property TituloIdentificacaoEmpresa: string read FTituloIdentificacaoEmpresa write FTituloIdentificacaoEmpresa;

    function TituloOcorrenciasToStr: string;
  end;

  TRetorno = class(TPersistent)
  private
    FMensagem: string;
    FNumeroArquivo: string;
    FProcessados: Integer;
    FSituacao: string;
    FTitulos: TArray<TTitulos>;
    FTitulosNaoConciliados: TArray<TTitulosNaoConciliados>;
  published
    property Mensagem: string read FMensagem write FMensagem;
    property NumeroArquivo: string read FNumeroArquivo write FNumeroArquivo;
    property Processados: Integer read FProcessados write FProcessados;
    property Situacao: string read FSituacao write FSituacao;
    property Titulos: TArray<TTitulos> read FTitulos write FTitulos;
    property TitulosNaoConciliados: TArray<TTitulosNaoConciliados> read FTitulosNaoConciliados write FTitulosNaoConciliados;
  end;

  TRetornoIntegrado = class(TPersistent)
  private
    FSituacao: string;
    FMensagem: string;
    FNumeroArquivo: string;
    FProcessados: Integer;
    FTitulos: TArray<TTitulos>;
    FTitulosNaoConciliados: TArray<TTitulosNaoConciliados>;
  published
    property Mensagem: string read FMensagem write FMensagem;
    property Processados: Integer read FProcessados write FProcessados;
    property NumeroArquivo: string read FNumeroArquivo write FNumeroArquivo;
    property Situacao: string read FSituacao write FSituacao;
    property Titulos: TArray<TTitulos> read FTitulos write FTitulos;
    property TitulosNaoConciliados: TArray<TTitulosNaoConciliados> read FTitulosNaoConciliados write FTitulosNaoConciliados;
  end;

  TRemessaIntegrado = class(TPersistent)
  private
    FArquivo: string;
    FCedenteContaCodigoBanco: string;
    FCedenteContaNumero: string;
    FCedenteConvenioNumero: string;
    FMensagem: string;
    FNumero: Integer;
    FRemessa: string;
    FSituacao: string;
    FTitulos: TArray<TTitulos>;
    FTransmissaoAutomatica: Boolean;
    FUniqueId: string;
  published
    property Arquivo: string read FArquivo write FArquivo;
    property CedenteContaCodigoBanco: string read FCedenteContaCodigoBanco write FCedenteContaCodigoBanco;
    property CedenteContaNumero: string read FCedenteContaNumero write FCedenteContaNumero;
    property CedenteConvenioNumero: string read FCedenteConvenioNumero write FCedenteConvenioNumero;
    property Mensagem: string read FMensagem write FMensagem;
    property Numero: Integer read FNumero write FNumero;
    property Remessa: string read FRemessa write FRemessa;
    property Situacao: string read FSituacao write FSituacao;
    property Titulos: TArray<TTitulos> read FTitulos write FTitulos;
    property TransmissaoAutomatica: Boolean read FTransmissaoAutomatica write FTransmissaoAutomatica;
    property UniqueId: string read FUniqueId write FUniqueId;
  end;

  TDescartarIntegrado = class(TPersistent)
  private
    FIdintegracao: string;
  published
    property Idintegracao: string read FIdintegracao write FIdintegracao;
  end;

  TCedenteIntegrado = class(TPersistent)
  private
    F_campo: string;
    F_erro: string;
    Fid: string;
    Frazaosocial: string;
    Fnomefantasia: string;
    Fcpf_cnpj: string;
    Flogradouro: string;
    Fnumero: string;
    Fcomplemento: string;
    Fbairro: string;
    Fcep: string;
    Fid_cidade: Integer;
    Ftelefone: string;
    Femail: string;
    Fcriado: string;
    Fatualizado: string;
    Ftoken_cedente: string;
    Ftoken_esales: string;
    Fsituacao: string;
    Fid_software_house: Integer;
    Fdata_ativacao: string;
    Flinha_digitavel_recibo: boolean;
    Fuf: string;
  published
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property id: string read Fid write Fid;
    property razaosocial: string read Frazaosocial write Frazaosocial;
    property nomefantasia: string read Fnomefantasia write Fnomefantasia;
    property cpf_cnpj: string read Fcpf_cnpj write Fcpf_cnpj;
    property logradouro: string read Flogradouro write Flogradouro;
    property numero: string read Fnumero write Fnumero;
    property complemento: string read Fcomplemento write Fcomplemento;
    property bairro: string read Fbairro write Fbairro;
    property cep: string read Fcep write Fcep;
    property id_cidade: Integer read Fid_cidade write Fid_cidade;
    property telefone: string read Ftelefone write Ftelefone;
    property email: string read Femail write Femail;
    property criado: string read Fcriado write Fcriado;
    property atualizado: string read Fatualizado write Fatualizado;
    property token_cedente: string read Ftoken_cedente write Ftoken_cedente;
    property token_esales: string read Ftoken_esales write Ftoken_esales;
    property situacao: string read Fsituacao write Fsituacao;
    property id_software_house: Integer read Fid_software_house write Fid_software_house;
    property data_ativacao: string read Fdata_ativacao write Fdata_ativacao;
    property linha_digitavel_recibo: boolean read Flinha_digitavel_recibo write Flinha_digitavel_recibo;
    property uf: string read Fuf write Fuf;
  end;

  TContaIntegrado = class(TPersistent)
  private
    F_campo: string;
    F_erro: string;
    Fid: string;
    Fcodigo_banco: Integer;
    Fagencia: string;
    Fagencia_dv: string;
    Fconta: string;
    Fconta_dv: string;
    Ftipo_conta: string;
    Fcod_beneficiario: string;
    Fid_cedente: Integer;
    Fcriado: string;
    Fatualizado: string;
    Fcod_empresa: string;
    Fativo: boolean;
    Fvalidacao_ativa: boolean;
    Fimpressao_atualizada: boolean;
    Fimpressao_atualizada_alteracao: boolean;
  published
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property id: string read Fid write Fid;
    property codigo_banco: Integer read Fcodigo_banco write Fcodigo_banco;
    property agencia: string read Fagencia write Fagencia;
    property agencia_dv: string read Fagencia_dv write Fagencia_dv;
    property conta: string read Fconta write Fconta;
    property conta_dv: string read Fconta_dv write Fconta_dv;
    property tipo_conta: string read Ftipo_conta write Ftipo_conta;
    property cod_beneficiario: string read Fcod_beneficiario write Fcod_beneficiario;
    property id_cedente: Integer read Fid_cedente write Fid_cedente;
    property criado: string read Fcriado write Fcriado;
    property atualizado: string read Fatualizado write Fatualizado;
    property cod_empresa: string read Fcod_empresa write Fcod_empresa;
    property ativo: boolean read Fativo write Fativo;
    property validacao_ativa: boolean read Fvalidacao_ativa write Fvalidacao_ativa;
    property impressao_atualizada: boolean read Fimpressao_atualizada write Fimpressao_atualizada;
    property impressao_atualizada_alteracao: boolean read Fimpressao_atualizada_alteracao write Fimpressao_atualizada_alteracao;
  end;

  TConvenioIntegrado = class(TPersistent)
  private
    Fid: Integer;
    Fnumero_convenio: string;
    Fdescricao_convenio: string;
    Fcarteira: string;
    Fespecie: string;
    Fid_conta: Integer;
    Fcriado: string;
    Fatualizado: string;
    FpadraoCNAB: string;
    Futiliza_van: boolean;
    Fnumero_remessa: Integer;
    Freiniciar_diariamente: boolean;
    Fregistro_automatico: boolean;
    Fativo: boolean;
    Fcodigo_identificador: string;
    Fconsultaws: boolean;
  published
    property id: Integer read Fid write Fid;
    property numero_convenio: string read Fnumero_convenio write Fnumero_convenio;
    property descricao_convenio: string read Fdescricao_convenio write Fdescricao_convenio;
    property carteira: string read Fcarteira write Fcarteira;
    property especie: string read Fespecie write Fespecie;
    property id_conta: Integer read Fid_conta write Fid_conta;
    property criado: string read Fcriado write Fcriado;
    property atualizado: string read Fatualizado write Fatualizado;
    property padraoCNAB: string read FpadraoCNAB write FpadraoCNAB;
    property utiliza_van: boolean read Futiliza_van write Futiliza_van;
    property numero_remessa: Integer read Fnumero_remessa write Fnumero_remessa;
    property reiniciar_diariamente: boolean read Freiniciar_diariamente write Freiniciar_diariamente;
    property registro_automatico: boolean read Fregistro_automatico write Fregistro_automatico;
    property ativo: boolean read Fativo write Fativo;
    property codigo_identificador: string read Fcodigo_identificador write Fcodigo_identificador;
    property consultaws: boolean read Fconsultaws write Fconsultaws;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  hw_win_utils;

{ TBoletoIntegrado }

function TBoletoIntegrado.CodigoUltOcorrenciasToStr: string;
begin
  try
    Result := '';
    if Length(Self.TituloOcorrencias) > 0 then
      Result := Self.TituloOcorrencias[High(Self.TituloOcorrencias)].Codigo;

  except on E: Exception do
    begin
      Result := '';
      LogApp.Error('TBoletoIntegrado.CodigoUltOcorrenciasToStr - %s', [E.Message]);
      raise;
    end;
  end;
end;

function TBoletoIntegrado.DescrUltOcorrenciasToStr: string;
begin
  try
    Result := '';
    if Length(Self.TituloOcorrencias) > 0 then
      Result := Self.TituloOcorrencias[High(Self.TituloOcorrencias)].mensagem;

  except on E: Exception do
    begin
      Result := '';
      LogApp.Error('TBoletoIntegrado.DescrUltOcorrenciasToStr - %s', [E.Message]);
      raise;
    end;
  end;
end;

function TBoletoIntegrado.TituloMovimentosToStr: string;
begin
  Result := '';
  for var movimento in Self.TituloMovimentos do
  begin
     Result := Result + IfThen(not Result.IsEmpty, sLineBreak + '--' + sLineBreak) +
                        Format('Codigo: %s', [movimento.codigo]) + sLineBreak +
                        Format('Mensagem: %s', [movimento.mensagem]) + sLineBreak +
                        Format('Data: %s', [movimento.data]);

     for var ocorrencia in movimento.ocorrencias do
       Result := Result + sLineBreak  + Format('> %s - %s', [ocorrencia.codigo, ocorrencia.mensagem]);
  end;
end;

function TBoletoIntegrado.TituloOcorrenciasToStr: string;
begin
  Result := '';
  for var ocorrencia in Self.TituloOcorrencias do
     Result := Result + IfThen(not Result.IsEmpty, sLineBreak + '--' + sLineBreak) +
                        Format('Codigo: %s', [ocorrencia.codigo]) + sLineBreak +
                        Format('Mensagem: %s', [ocorrencia.mensagem]) + sLineBreak +
                        Format('Criado em: %s', [ocorrencia.criado]) + sLineBreak +
                        Format('Modificado em: %s', [ocorrencia.atualizado]);
end;

{ TTitulosNaoConciliados }

function TTitulosNaoConciliados.TituloOcorrenciasToStr: string;
begin
  Result := '';
  for var ocorrencia in Self.Ocorrencias do
     Result := Result + IfThen(not Result.IsEmpty, sLineBreak + '--' + sLineBreak) +
                        Format('Codigo: %s', [Self.CodigoMovimento]) + sLineBreak +
                        Format('Mensagem: %s', [ocorrencia]) + sLineBreak +
                        IfThen(not Self.PagamentoData.IsEmpty, Format('Pagamento em: %s', [Self.PagamentoData]) + sLineBreak) +
                        IfThen(not Self.PagamentoDataCredito.IsEmpty, Format('Crédito em: %s', [Self.PagamentoDataCredito]));
end;

end.
