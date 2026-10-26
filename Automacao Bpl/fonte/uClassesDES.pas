unit uClassesDES;

interface

uses
  SysUtils, Classes, Contnrs, DateUtils, ACBrTXTClass, ACBrSped, ACBrUtil,
  IBQuery, Forms, ComCtrls, StdCtrls, uClasseConexao;

type
  PTeste = (A, AA, B);
  TDES = class;
  TArquivoDES = class;
  TRegistroHList = class;
	TRegistroH = class;
  TRegistroEList = class;
	TRegistroE = class;
  TRegistroRList = class;
	TRegistroR = class;

  TGerarDES = class(TConexao)
  private
    FQtdRegistrosE: integer;
    FQtdRegistrosR: integer;
    FParar: boolean;
    FCodEmpresa: integer;
  public
    constructor create;
    destructor destroy; override;

    procedure cadGerarDES;
    function apenasNumeros(Texto: string): string;
    function preencheRegistroH: boolean;
    function preencheRegistroE(var progressBar: TProgressBar; var lbMensagem: TLabel): boolean;
    function preencheRegistroR(var progressBar: TProgressBar; var lbMensagem: TLabel): boolean;
    function retornaCodSerie(Serie: string): integer;
    function retornaIM: string;
    function retornaCNPJ: string;

    property QtdRegistrosE: integer read FQtdRegistrosE write FQtdRegistrosE;
    property QtdRegistrosR: integer read FQtdRegistrosR write FQtdRegistrosR;
    property Parar: boolean read FParar write FParar;
    property CodEmpresa: integer read FCodEmpresa write FCodEmpresa;
  var
    vDES: TDES;
  end;

  TDES = class(TACBrSPED)
  private
    FArquivoDES: TArquivoDES;

    FInicializado: boolean;

    FDT_INI: TDateTime;
    FDT_FIN: TDateTime;

		procedure writeRegistroH;
    procedure writeRegistroE;
    procedure writeRegistroR;
    procedure iniciaGeracao;
  public
  	constructor create;
    destructor destroy; override;

    procedure SaveFileTXT;

    property ArquivoDES: TArquivoDES read FArquivoDES write FArquivoDES;
    property DT_INI: TDateTime read FDT_INI write FDT_INI;
    property DT_FIN: TDateTime read FDT_FIN write FDT_FIN;
  end;

  TArquivoDES = class(TACBrTXTClass)
  private
    FRegistroH: TRegistroHList;
    FRegistroE: TRegistroEList;
    FRegistroR: TRegistroRList;
    procedure criaRegistros;
    procedure liberaRegistros;
  public
    constructor create; virtual;
    destructor destroy; override;

    property RegistroH: TRegistroHList read FRegistroH write FRegistroH;
    property RegistroE: TRegistroEList read FRegistroE write FRegistroE;
    property RegistroR: TRegistroRList read FRegistroR write FRegistroR; 
  end;

  //Registro H - Identificação
	TRegistroH = class
  private
{Obrigatorio}
    {S}FINSCRICAO_MUNICIPAL: string; //Número da Inscrição Municipal da empresa.
    {N}FCNPJ_CPF: string; //Número do CNPJ/CPF da empresa.
    {S}FVERSAO_SISTEMA: string; //Versão atual do sistema ("VERSÃO300")
  public
    property INSCRICAO_MUNICIPAL: string read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    property CNPJ_CPF: string read FCNPJ_CPF write FCNPJ_CPF;
    property VERSAO_SISTEMA: string read FVERSAO_SISTEMA write FVERSAO_SISTEMA;
  end;

  TRegistroHList = class(TObjectList)
  private
    function GetItem(Index: integer): TRegistroH;
    procedure SetItem(Index: integer; const Value: TRegistroH);
  public
    function New: TRegistroH;
    property Items[Index: integer]: TRegistroH read GetItem write SetItem;
  end;

  //Registro E - Serviços Prestados
	TRegistroE = class
  private
{Obrigatorio}
    {S}FDATA_EMISSAO: TDateTime; //Data na qual foi emitido o documento.
    {S}FCTISS: string; //Ver tabela de CTISS disponível no portal BHISS Digital.
    {S}FCOD_SUBITEM: string; //Ver lista anexa a LC 116/03. Informar o subitem no formato nn.nn. Informar com o ponto.
    {S}FMODELO_DOCUMENTO: integer; //Ver Tabela 13.1
    {S}FSERIE_DOCUMENTO: integer; //Ver Tabela 13.2
    {N}FSUBSERIE_DOCUMENTO: string; //Utilizar de "01" a "99"
  	{S}FTIPO_NEGOCIO: integer; //Ver Tabela 13.3
    {S}FEXIGIBILIDADE_ISSQN: integer; //Ver Tabela 13.4
    {N}FLOCAL_INCIDENCIA: string; //Código do IBGE da cidade da incidência do ISSQN
    {S}FREGIME_ESP_TRIBUTACAO: integer; //Ver Tabela 13.5
    {S}FTIPO_REC_ISSQN: integer; //Utilizar "1" para ISSQN retido por terceiros e "2" para ISSQN próprio.
    {N}FNUMERO_DOCUMENTO: string; //Informar o número do documento. Para NFS-e utilizar 4 dígitos do ano + número, sem o caractere “/”. No caso de cupom fiscal utilizar os três primeiros dígitos para informar o número da máquina ECF e os seis dígitos seguintes para o número do cupom.
		{N}FNUMERO_FINAL: string; //Informar o número final do documento se for um lançamento em lote. Caso o lançamento não seja em lote repetir o número inicial. Para NFS-e utilizar 4 dígitos do ano + número, sem o caractere “/”. No caso de cupom fiscal utilizar os três primeiros dígitos para informar o número da máquina ECF e os seis dígitos seguintes para o número do cupom.
		{S}FVALOR_BRUTO: Currency; //Valor bruto do documento.
  	{S}FVALOR_SERVICO: Currency; //Valor dos serviços constantes do documento. Preencher com o Valor Bruto. Nos casos em lotes de documentos em conjunto com o Estado informar “0”.
    {S}FALIQUOTA: Currency; //Alíquota do ISSQN. Nos casos de incidência do ISSQN fora de BH informar neste campo a alíquota do local devendo a mesma estar entre 2% (2.00) e 5% (5.00) ou ser igual a 0.00. Nos casos em que não ocorrer alíquota o campo deverá ser preenchido com 0.00.
    {S}FSITUACAO_DOCUMENTO: integer; //Utilizar "1" - Normal, "2" - Cancelado, "3" - Extraviado ou "4" - Prazo de Validade Expirado.
    {S}FSIMPLES_NACIONAL: integer; //Utilizar "1" para Optante ME/EPP, "2" para Não Optante ou "3" para Optante MEI.
    {N}FINSC_MUN_TOMADOR: string; //Informar apenas inscrições municipais de Belo Horizonte. Empresas de outra localidade ou se não houver inscrição municipal deixar em branco.
    {N}FCNPJ_TOMADOR: string; //Se não houver deixar em branco.
    {N}FCPF_TOMADOR: string; //Se não houver deixar em branco.
    {S}FNOME_TOMADOR: string; //Nome ou razão social do tomador de serviços. Se não houver preencher com o termo: "DIVERSOS".
    {S}FLOGRADOURO_TOMADOR: string; //Logradouro do endereço do tomador de serviços. Se tomador “DIVERSOS” deixar em branco.
    {S}FNUMERO_IMOVEL_TOMADOR: string; //Número do imóvel do endereço do tomador de serviços. Se tomador “DIVERSOS” deixar em branco.
    {N}FCOMPLEMENTO_TOMADOR: string; //Complemento do endereço do tomador de serviços. Obrigatório no caso de ausência do número do imóvel. Se tomador “DIVERSOS” deixar em branco.
    {S}FBAIRRO_TOMADOR: string; //Nome do Bairro do tomador de serviços. Se tomador “DIVERSOS” deixar em branco.
    {S}FCIDADE_TOMADOR: string; //Código do IBGE da Cidade do tomador de serviços. Para tomador estabelecido no exterior informar "9999999". Se tomador “DIVERSOS” deixar em branco.
    {S}FPAIS_TOMADOR: string; //Código do BACEN do País do tomador de serviços. Para Brasil informar "1058". Se tomador “DIVERSOS” deixar em branco.
    {S}FCEP_TOMADOR: string; //CEP do endereço do tomador de serviços. Para tomador do exterior ou “DIVERSOS” deixar em branco.
    {N}FTELEFONE_TOMADOR: string; //Deve-se informar o número do telefone do tomador de serviços contendo apenas os números, comportando o código DDD e DDI se necessário.
    {N}FEMAIL_TOMADOR: string; //E-mail do tomador de serviços
    {N}FINSC_MUN_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de Inscrição Municipal, mas preencher somente se houver terceiro vinculado/ intermediário.
    {N}FCNPJ_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de CNPJ preencher somente se houver terceiro vinculado/ intermediário.
    {N}FCPF_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de CPF preencher somente se houver terceiro vinculado/ intermediário.
    {N}FNOME_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de Nome/Razão Social preencher somente se houver terceiro vinculado /intermediário.
    {N}FLOGRADOURO_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de logradouro preencher somente se houver terceiro vinculado/ intermediário.
    {N}FNUMERO_IMOVEL_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de número de imóvel, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FCOMPLEMENTO_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de complemento, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FBAIRRO_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de bairro, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FCIDADE_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de Cidade, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FPAIS_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de País, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FCEP_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de CEP, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FTELEFONE_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de telefone, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FEMAIL_TERC_VINC_INTERMED: string; //Informar os dados deste campo com as mesmas regras dos campos de e-mail, preencher somente se houver terceiro vinculado/ intermediário.
    {N}FLOCAL_PRESTACAO: string; //Código do IBGE da cidade em que o serviço foi prestado. Para exterior informar "9999999".
    {N}FPAIS_PRESTACAO: string; //Código do BACEN do País onde foi executado o serviço. Para Brasil informar "1058".
    {N}FDESCRICAO_EVENTO: string; //Informar o nome do evento realizado. Preenchimento obrigatório caso seja informado o modelo do documento fiscal: Ingresso Autorizado ou Borderô.
    {N}FDATA_EVENTO: TDateTime; //Informar a data da realização do evento. Preenchimento obrigatório caso seja informado o modelo do documento fiscal: Ingresso Autorizado ou Borderô.
    {N}FDATA_COMPETENCIA: TDateTime; //Informar a Competência da prestação do serviço contido no documento informado. Deve ser informada no formato MMAAAA.
    {N}FDATA_CANCELAMENTO: TDateTime; //Preenchimento obrigatório caso seja documento cancelado.
    {N}FMOTIVO_CANCELAMENTO: string; //Código do Motivo do Cancelamento. Ver Tabela 13.9.
    {N}FOUTRO_MOTIVO_CANCELAMENTO: string; //Descrição do Motivo do Cancelamento caso campo 52 seja "Outros Motivos".
    {N}FNUMERO_NOTA_SUBSTITUI: string; //Documento substituidor em caso de cancelamento por motivo de substituição do documento emitido.
  public
  	property DATA_EMISSAO: TDateTime read FDATA_EMISSAO write FDATA_EMISSAO;
    property CTISS: string read FCTISS write FCTISS;
    property COD_SUBITEM: string read FCOD_SUBITEM write FCOD_SUBITEM;
    property MODELO_DOCUMENTO: integer read FMODELO_DOCUMENTO write FMODELO_DOCUMENTO;
    property SERIE_DOCUMENTO: integer read FSERIE_DOCUMENTO write FSERIE_DOCUMENTO;
    property SUBSERIE_DOCUMENTO: string read FSUBSERIE_DOCUMENTO write FSUBSERIE_DOCUMENTO;
    property TIPO_NEGOCIO: integer read FTIPO_NEGOCIO write FTIPO_NEGOCIO;
    property EXIGIBILIDADE_ISSQN: integer read FEXIGIBILIDADE_ISSQN write FEXIGIBILIDADE_ISSQN;
    property LOCAL_INCIDENCIA: string read FLOCAL_INCIDENCIA write FLOCAL_INCIDENCIA;
    property REGIME_ESP_TRIBUTACAO: integer read FREGIME_ESP_TRIBUTACAO write FREGIME_ESP_TRIBUTACAO;
    property TIPO_REC_ISSQN: integer read FTIPO_REC_ISSQN write FTIPO_REC_ISSQN;
    property NUMERO_DOCUMENTO: string read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    property NUMERO_FINAL: string read FNUMERO_FINAL write FNUMERO_FINAL;
    property VALOR_BRUTO: Currency read FVALOR_BRUTO write FVALOR_BRUTO;
    property VALOR_SERVICO: Currency read FVALOR_SERVICO write FVALOR_SERVICO;
    property ALIQUOTA: Currency read FALIQUOTA write FALIQUOTA;
    property SITUACAO_DOCUMENTO: integer read FSITUACAO_DOCUMENTO write FSITUACAO_DOCUMENTO;
    property SIMPLES_NACIONAL: integer read FSIMPLES_NACIONAL write FSIMPLES_NACIONAL;
    property INSC_MUN_TOMADOR: string read FINSC_MUN_TOMADOR write FINSC_MUN_TOMADOR;
    property CNPJ_TOMADOR: string read FCNPJ_TOMADOR write FCNPJ_TOMADOR;
    property CPF_TOMADOR: string read FCPF_TOMADOR write FCPF_TOMADOR;
    property NOME_TOMADOR: string read FNOME_TOMADOR write FNOME_TOMADOR;
    property LOGRADOURO_TOMADOR: string read FLOGRADOURO_TOMADOR write FLOGRADOURO_TOMADOR;
    property NUMERO_IMOVEL_TOMADOR: string read FNUMERO_IMOVEL_TOMADOR write FNUMERO_IMOVEL_TOMADOR;
    property COMPLEMENTO_TOMADOR: string read FCOMPLEMENTO_TOMADOR write FCOMPLEMENTO_TOMADOR;
    property BAIRRO_TOMADOR: string read FBAIRRO_TOMADOR write FBAIRRO_TOMADOR;
    property CIDADE_TOMADOR: string read FCIDADE_TOMADOR write FCIDADE_TOMADOR;
    property PAIS_TOMADOR: string read FPAIS_TOMADOR write FPAIS_TOMADOR;
    property CEP_TOMADOR: string read FCEP_TOMADOR write FCEP_TOMADOR;
    property TELEFONE_TOMADOR: string read FTELEFONE_TOMADOR write FTELEFONE_TOMADOR;
    property EMAIL_TOMADOR: string read FEMAIL_TOMADOR write FEMAIL_TOMADOR;
    property INSC_MUN_TERC_VINC_INTERMED: string read FINSC_MUN_TERC_VINC_INTERMED write FINSC_MUN_TERC_VINC_INTERMED;
    property CNPJ_TERC_VINC_INTERMED: string read FCNPJ_TERC_VINC_INTERMED write FCNPJ_TERC_VINC_INTERMED;
    property CPF_TERC_VINC_INTERMED: string read FCPF_TERC_VINC_INTERMED write FCPF_TERC_VINC_INTERMED;
    property NOME_TERC_VINC_INTERMED: string read FNOME_TERC_VINC_INTERMED write FNOME_TERC_VINC_INTERMED;
    property LOGRADOURO_TERC_VINC_INTERMED: string read FLOGRADOURO_TERC_VINC_INTERMED write FLOGRADOURO_TERC_VINC_INTERMED;
    property NUMERO_IMOVEL_TERC_VINC_INTERMED: string read FNUMERO_IMOVEL_TERC_VINC_INTERMED write FNUMERO_IMOVEL_TERC_VINC_INTERMED;
    property COMPLEMENTO_TERC_VINC_INTERMED: string read FCOMPLEMENTO_TERC_VINC_INTERMED write FCOMPLEMENTO_TERC_VINC_INTERMED;
    property BAIRRO_TERC_VINC_INTERMED: string read FBAIRRO_TERC_VINC_INTERMED write FBAIRRO_TERC_VINC_INTERMED;
    property CIDADE_TERC_VINC_INTERMED: string read FCIDADE_TERC_VINC_INTERMED write FCIDADE_TERC_VINC_INTERMED;
    property PAIS_TERC_VINC_INTERMED: string read FPAIS_TERC_VINC_INTERMED write FPAIS_TERC_VINC_INTERMED;
    property CEP_TERC_VINC_INTERMED: string read FCEP_TERC_VINC_INTERMED write FCEP_TERC_VINC_INTERMED;
    property TELEFONE_TERC_VINC_INTERMED: string read FTELEFONE_TERC_VINC_INTERMED write FTELEFONE_TERC_VINC_INTERMED;
    property EMAIL_TERC_VINC_INTERMED: string read FEMAIL_TERC_VINC_INTERMED write FEMAIL_TERC_VINC_INTERMED;
    property LOCAL_PRESTACAO: string read FLOCAL_PRESTACAO write FLOCAL_PRESTACAO;
    property PAIS_PRESTACAO: string read FPAIS_PRESTACAO write FPAIS_PRESTACAO;
    property DESCRICAO_EVENTO: string read FDESCRICAO_EVENTO write FDESCRICAO_EVENTO;
    property DATA_EVENTO: TDateTime read FDATA_EVENTO write FDATA_EVENTO;
    property DATA_COMPETENCIA: TDateTime read FDATA_COMPETENCIA write FDATA_COMPETENCIA;
    property DATA_CANCELAMENTO: TDateTime read FDATA_CANCELAMENTO write FDATA_CANCELAMENTO;
    property MOTIVO_CANCELAMENTO: string read FMOTIVO_CANCELAMENTO write FMOTIVO_CANCELAMENTO;
    property OUTRO_MOTIVO_CANCELAMENTO: string read FOUTRO_MOTIVO_CANCELAMENTO write FOUTRO_MOTIVO_CANCELAMENTO;
    property NUMERO_NOTA_SUBSTITUI: string read FNUMERO_NOTA_SUBSTITUI write FNUMERO_NOTA_SUBSTITUI;
  end;

  TRegistroEList = class(TObjectList)
  private
    function GetItem(Index: integer): TRegistroE;
    procedure SetItem(Index: integer; const Value: TRegistroE);
  public
    function New: TRegistroE;
    property Items[Index: integer]: TRegistroE read GetItem write SetItem;
  end;

  //Registro E - Serviços Prestados
	TRegistroR = class
  private
{Obrigatorio}
    {S}FTIPO_REC_ISSQN: integer; //Utilizar "1" quando ocorrer a retenção do ISSQN na fonte e "2" quando não ocorrer a retenção.
    {N}FCOMPLEMENTO_TOMADOR: string; //Complemento do Endereço do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {N}FCNPJ: string; //Se não houver deixar em branco.
    {N}FINSCRICAO_MUNICIPAL: string; //Informar apenas inscrições de Belo Horizonte. Empresas de outra localidade ou se não houver deixar em branco.
    {S}FPAIS_PRESTACAO: string; //Código do BACEN do País onde foi executado o serviço. Para Brasil informar "1058"
    {S}FSIMPLES_NACIONAL: Integer; //Utilizar "1" para Optante ME/EPP, "2" para Não Optante ou "3" para Optante MEI.
    {S}FDATA_EMISSAO: TDateTime; //Data na qual foi emitido o documento.
    {S}FLOCAL_PRESTACAO: string; //Código do IBGE da cidade em que o serviço foi prestado. Para exterior informar "9999999".
    {N}FNOME_TOMADOR: string; //Nome do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {S}FCEP_PRESTADOR: string; //CEP do endereço do prestador dos serviços. Para tomador do exterior deixar em branco.
    {N}FCIDADE_TOMADOR: string; //Código do IBGE da cidade do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {N}FPAIS_TOMADOR: string; //Código do BACEN do País do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {S}FMOTIVO_NAO_RETENCAO: Integer; //Ver Tabela 13.8
    {N}FTELEFONE_TOMADOR: string; //Número do telefone do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {N}FNUMERO_IMOVEL_TOMADOR: string; //Número do imóvel do Endereço do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {N}FCPF: string; //Se não houver deixar em branco.
    {N}FDATA_EVENTO: TDateTime; //Informar a data da realização do evento. Preenchimento obrigatório caso seja Ingresso Autorizado ou Borderô.
    {N}FLOGRADOURO_TOMADOR: string; //Logradouro do Endereço do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {N}FINSC_MUN_TOMADOR: string; //Informar a Inscrição Municipal do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado. Apenas inscrições de Belo Horizonte. Empresas de outra localidade ou se não houver deixar em branco.
    {N}FSUBSERIE_DOCUMENTO: string; //Utilizar de "01" a "99"
    {N}FCOMPLEMENTO_PRESTADOR: string; //Complemento do endereço do prestador dos serviços. Obrigatório no caso de ausência do número do imóvel.
    {N}FCNPJ_TOMADOR: string; //CNPJ do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {S}FSERIE_DOCUMENTO: Integer; //Ver Tabela 13.2
    {S}FMODELO_DOCUMENTO: Integer; //Ver Tabela 13.6
    {N}FEMAIL_TOMADOR: string; //E-mail do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {N}FBAIRRO_TOMADOR: string; //Nome do Bairro do efetivo tomador dos serviços quando houver intermediário/ terceiro vinculado.
    {S}FSITUACAO_ESP_RESP: integer; //Ver Tabela 13.7
    {S}FNUMERO_DOCUMENTO: string; //Informar o número do documento recebido. Para NFS-e utilizar 4 dígitos do ano + número, sem o caractere “/”.
    {S}FDATA_PAG_OU_RECONHCIMENTO_CREDITO: TDateTime; //Data de pagamento ou reconhecimento do crédito, o que ocorrer primeiro.
    {S}FNOME_PRESTADOR: string; //Nome ou razão social do prestador dos serviços.
    {S}FALIQUOTA: Currency; //Alíquota do ISSQN sobre os serviços tomados. Para ME/EPP informar alíquota apenas no caso de haver retenção do ISSQN na fonte. Para MEI ou ME/EPP sem retenção na fonte informar 0.00. Para incidência do ISSQN fora de BH informar a alíquota do local devendo a mesma estar entre 2% (2.00) e 5% (5.00) ou ser igual a 0.00. Nos demais casos em que não ocorrer alíquota o campo deverá ser preenchido com 0.00.
    {S}FCIDADE_PRESTADOR: string; //Código do IBGE da cidade do prestador dos serviços. Se estabelecido no exterior informar "9999999".
    {N}FLOCAL_INCIDENCIA: string; //Código do IBGE da cidade da incidência do ISSQN
    {S}FPAIS_PRESTADOR: string; //Código do BACEN do País do prestador dos serviços. Para Brasil informar "1058"
    {S}FVALOR_BRUTO: Currency; //Valor bruto constante do documento recebido.
    {N}FTELEFONE_PRESTADOR: string; //Número do telefone do prestador dos serviços
    {S}FNUMERO_IMOVEL_PRESTADOR: string; //Número do imóvel do endereço do prestador dos serviços.
    {N}FDESCRICAO_EVENTO: string; //Informar o nome do evento realizado. Preenchimento obrigatório caso seja informado o modelo do documento fiscal Ingresso Autorizado ou Borderô.
    {N}FCPF_TOMADOR: string; //CPF do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {S}FLOGRADOURO_PRESTADOR: string; //Logradouro do endereço do prestador de serviços
    {N}FCEP_TOMADOR: string; //CEP do endereço do efetivo tomador dos serviços quando houver intermediário/terceiro vinculado.
    {N}FEMAIL_PRESTADOR: string; //E-mail do prestador dos serviços
    {S}FBAIRRO_PRESTADOR: string; //Nome do bairro do prestador de serviços.
    {S}FVALOR_SERVICO: Currency; //Valor do serviço contratado.
  public
    property DATA_PAG_OU_RECONHCIMENTO_CREDITO: TDateTime read FDATA_PAG_OU_RECONHCIMENTO_CREDITO write FDATA_PAG_OU_RECONHCIMENTO_CREDITO;
    property DATA_EMISSAO: TDateTime read FDATA_EMISSAO write FDATA_EMISSAO;
  	property MODELO_DOCUMENTO: Integer read FMODELO_DOCUMENTO write FMODELO_DOCUMENTO;
    property SERIE_DOCUMENTO: Integer read FSERIE_DOCUMENTO write FSERIE_DOCUMENTO;
    property SUBSERIE_DOCUMENTO: string read FSUBSERIE_DOCUMENTO write FSUBSERIE_DOCUMENTO;
    property SITUACAO_ESP_RESP:integer read FSITUACAO_ESP_RESP write FSITUACAO_ESP_RESP;
    property MOTIVO_NAO_RETENCAO: Integer read FMOTIVO_NAO_RETENCAO write FMOTIVO_NAO_RETENCAO;
    property LOCAL_INCIDENCIA: string read FLOCAL_INCIDENCIA write FLOCAL_INCIDENCIA;
    property TIPO_REC_ISSQN: integer read FTIPO_REC_ISSQN write FTIPO_REC_ISSQN;
    property NUMERO_DOCUMENTO: string read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    property VALOR_BRUTO: Currency read FVALOR_BRUTO write FVALOR_BRUTO;
    property VALOR_SERVICO: Currency read FVALOR_SERVICO write FVALOR_SERVICO;
    property ALIQUOTA: Currency read FALIQUOTA write FALIQUOTA;
  	property SIMPLES_NACIONAL: Integer read FSIMPLES_NACIONAL write FSIMPLES_NACIONAL;
    property INSCRICAO_MUNICIPAL: string read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    property CNPJ: string read FCNPJ write FCNPJ;
    property CPF: string read FCPF write FCPF;
    property NOME_PRESTADOR: string read FNOME_PRESTADOR write FNOME_PRESTADOR;
    property LOGRADOURO_PRESTADOR: string read FLOGRADOURO_PRESTADOR write FLOGRADOURO_PRESTADOR;
    property NUMERO_IMOVEL_PRESTADOR: string read FNUMERO_IMOVEL_PRESTADOR write FNUMERO_IMOVEL_PRESTADOR;
    property COMPLEMENTO_PRESTADOR: string read FCOMPLEMENTO_PRESTADOR write FCOMPLEMENTO_PRESTADOR;
    property BAIRRO_PRESTADOR: string read FBAIRRO_PRESTADOR write FBAIRRO_PRESTADOR;
    property CIDADE_PRESTADOR: string read FCIDADE_PRESTADOR write FCIDADE_PRESTADOR;
    property PAIS_PRESTADOR: string read FPAIS_PRESTADOR write FPAIS_PRESTADOR;
    property CEP_PRESTADOR: string read FCEP_PRESTADOR write FCEP_PRESTADOR;
    property TELEFONE_PRESTADOR: string read FTELEFONE_PRESTADOR write FTELEFONE_PRESTADOR;
    property EMAIL_PRESTADOR: string read FEMAIL_PRESTADOR write FEMAIL_PRESTADOR;
    property INSC_MUN_TOMADOR: string read FINSC_MUN_TOMADOR write FINSC_MUN_TOMADOR;
    property CNPJ_TOMADOR: string read FCNPJ_TOMADOR write FCNPJ_TOMADOR;
    property CPF_TOMADOR: string read FCPF_TOMADOR write FCPF_TOMADOR;
    property NOME_TOMADOR: string read FNOME_TOMADOR write FNOME_TOMADOR;
    property LOGRADOURO_TOMADOR: string read FLOGRADOURO_TOMADOR write FLOGRADOURO_TOMADOR;
    property NUMERO_IMOVEL_TOMADOR: string read FNUMERO_IMOVEL_TOMADOR write FNUMERO_IMOVEL_TOMADOR;
    property COMPLEMENTO_TOMADOR: string read FCOMPLEMENTO_TOMADOR write FCOMPLEMENTO_TOMADOR;
  	property BAIRRO_TOMADOR: string read FBAIRRO_TOMADOR write FBAIRRO_TOMADOR;
    property CIDADE_TOMADOR: string read FCIDADE_TOMADOR write FCIDADE_TOMADOR;
    property PAIS_TOMADOR: string read FPAIS_TOMADOR write FPAIS_TOMADOR;
    property CEP_TOMADOR: string read FCEP_TOMADOR write FCEP_TOMADOR;
    property TELEFONE_TOMADOR: string read FTELEFONE_TOMADOR write FTELEFONE_TOMADOR;
    property EMAIL_TOMADOR: string read FEMAIL_TOMADOR write FEMAIL_TOMADOR;
    property LOCAL_PRESTACAO: string read FLOCAL_PRESTACAO write FLOCAL_PRESTACAO;
    property PAIS_PRESTACAO: string read FPAIS_PRESTACAO write FPAIS_PRESTACAO;
    property DESCRICAO_EVENTO: string read FDESCRICAO_EVENTO write FDESCRICAO_EVENTO;
    property DATA_EVENTO: TDateTime read FDATA_EVENTO write FDATA_EVENTO;
  end;

  TRegistroRList = class(TObjectList)
  private
    function GetItem(Index: integer): TRegistroR;
    procedure SetItem(Index: integer; const Value: TRegistroR);
  public
    function New: TRegistroR;
    property Items[Index: integer]: TRegistroR read GetItem write SetItem;
  end;

var
	vCadGerarDES: TGerarDES;

implementation

	uses uCadGerarDES, DB;

{ TRegistroHList }

function TRegistroHList.GetItem(Index: integer): TRegistroH;
begin
  Result := TRegistroH(inherited Items[Index]);
end;

function TRegistroHList.New: TRegistroH;
begin
  Result := TRegistroH.create;
  Add(Result);
end;

procedure TRegistroHList.SetItem(Index: integer; const Value: TRegistroH);
begin
	Put(Index, Value);
end;

{ TArquivoDES }

constructor TArquivoDES.create;
begin
	inherited;
	criaRegistros;
end;

procedure TArquivoDES.criaRegistros;
begin
  FRegistroH := TRegistroHList.Create;
  FRegistroE := TRegistroEList.Create;
  FRegistroR := TRegistroRList.Create;
end;

destructor TArquivoDES.destroy;
begin
  liberaRegistros;
  inherited;
end;

procedure TArquivoDES.liberaRegistros;
begin
  FreeAndNil(FRegistroH);
  FreeAndNil(FRegistroE);
  FreeAndNil(FRegistroR);
end;

constructor TDES.create;
begin
	inherited;
  Delimitador := '|';
  CurMascara := '#0.00';
  TrimString := True;
  FArquivoDES := TArquivoDES.create;
end;

destructor TDES.destroy;
begin
	FreeAndNil(FArquivoDES);
  inherited;
end;

procedure TDES.iniciaGeracao;
begin
  	if FInicializado then exit ;

    if (Trim(NomeArquivo) = '') then
    	raise Exception.Create(ACBrStr('Nome do arquivo não informado!'));

    Reset;


    if not(FDT_INI > 0) then
    	raise Exception.Create('Informe a data inicial das informações contidas no arquivo!');
    if not(FDT_FIN > 0) then
    	raise Exception.Create('Informe a data final das informações contidas no arquivo!');
    if not(DayOf(FDT_INI) = 1) then
    	raise Exception.Create('A data inicial deve corresponder ao primeiro dia do mês informado!');
    if not(FDT_FIN >= FDT_INI) then
    	raise Exception.Create('A data final deve ser maior que a data inicial!');
    if not(FDT_FIN <= Date) then
    	raise Exception.Create( 'A data final não pode ser superior a data atual!');
    if not(DateOf(EndOfTheMonth(FDT_FIN)) = DateOf(FDT_FIN)) then
    	raise Exception.Create('A data final deve corresponder ao último dia do mês informado!');

    FInicializado := True ;
end;

procedure TDES.SaveFileTXT;
begin
  try
 		iniciaGeracao;
    writeRegistroH;
    writeRegistroE;
    writeRegistroR;
    WriteBuffer;
  finally
  	FArquivoDES.liberaRegistros;
    FArquivoDES.criaRegistros;
    FInicializado := False ;
  end;
end;

procedure TDES.writeRegistroE;
var
  intFor: integer;
begin
  if Assigned( ArquivoDES.RegistroE ) then
  begin
     for intFor := 0 to ArquivoDES.RegistroE.Count - 1 do
     begin
        with ArquivoDES.RegistroE.Items[intFor] do
        begin
          Add( 'E' +
               LFill( DATA_EMISSAO ) +
               LFill( CTISS ) +
               LFill( COD_SUBITEM ) +
               LFill( MODELO_DOCUMENTO,0 ) +
               LFill( SERIE_DOCUMENTO,0 ) +
               LFill( SUBSERIE_DOCUMENTO ) +
               LFill( TIPO_NEGOCIO,0 ) +
               LFill( EXIGIBILIDADE_ISSQN,0 ) +
               LFill( LOCAL_INCIDENCIA ) +
               LFill( REGIME_ESP_TRIBUTACAO,0 ) +
               LFill( TIPO_REC_ISSQN,0 ) +
               LFill( NUMERO_DOCUMENTO ) +
               LFill( NUMERO_FINAL ) +
               LFill( VALOR_BRUTO,0 ) +
               LFill( VALOR_SERVICO,0 ) +
               LFill( ALIQUOTA,0 ) +
               LFill( SITUACAO_DOCUMENTO,0 ) +
               LFill( SIMPLES_NACIONAL,0 ) +
               LFill( INSC_MUN_TOMADOR ) +
               LFill( CNPJ_TOMADOR ) +
               LFill( CPF_TOMADOR ) +
               LFill( NOME_TOMADOR ) +
               LFill( LOGRADOURO_TOMADOR ) +
               LFill( NUMERO_IMOVEL_TOMADOR ) +
               LFill( COMPLEMENTO_TOMADOR ) +
               LFill( BAIRRO_TOMADOR ) +
               LFill( CIDADE_TOMADOR ) +
               LFill( PAIS_TOMADOR ) +
               LFill( CEP_TOMADOR ) +
               LFill( TELEFONE_TOMADOR ) +
               LFill( EMAIL_TOMADOR ) +
               LFill( INSC_MUN_TERC_VINC_INTERMED ) +
               LFill( CNPJ_TERC_VINC_INTERMED ) +
               LFill( CPF_TERC_VINC_INTERMED ) +
               LFill( NOME_TERC_VINC_INTERMED ) +
               LFill( LOGRADOURO_TERC_VINC_INTERMED ) +
               LFill( NUMERO_IMOVEL_TERC_VINC_INTERMED ) +
               LFill( COMPLEMENTO_TERC_VINC_INTERMED ) +
               LFill( BAIRRO_TERC_VINC_INTERMED ) +
               LFill( CIDADE_TERC_VINC_INTERMED ) +
               LFill( PAIS_TERC_VINC_INTERMED ) +
               LFill( CEP_TERC_VINC_INTERMED ) +
               LFill( TELEFONE_TERC_VINC_INTERMED ) +
               LFill( EMAIL_TERC_VINC_INTERMED ) +
               LFill( LOCAL_PRESTACAO ) +
               LFill( PAIS_PRESTACAO ) +
               LFill( DESCRICAO_EVENTO ) +
               LFill( DATA_EVENTO ) +
               LFill( DATA_COMPETENCIA, 'mmyyyy' ) +
               LFill( DATA_CANCELAMENTO ) +
               LFill( MOTIVO_CANCELAMENTO,0, True ) +
               LFill( OUTRO_MOTIVO_CANCELAMENTO ) +
               LFill( NUMERO_NOTA_SUBSTITUI ), False);
        end;
     end;
  end;
end;

procedure TDES.writeRegistroH;
var
  intFor: integer;
begin
  if Assigned( ArquivoDES.RegistroH ) then
  begin
     for intFor := 0 to ArquivoDES.RegistroH.Count - 1 do
     begin
        with ArquivoDES.RegistroH.Items[intFor] do
        begin
          Add( 'H' +
               LFill( INSCRICAO_MUNICIPAL ) +
               LFill( CNPJ_CPF ) +
               LFill( VERSAO_SISTEMA ), False);
        end;
     end;
  end;
end;

procedure TDES.writeRegistroR;
var
  intFor: integer;
begin
  if Assigned( ArquivoDES.RegistroR ) then
  begin
     for intFor := 0 to ArquivoDES.RegistroR.Count - 1 do
     begin
        with ArquivoDES.RegistroR.Items[intFor] do
        begin
          Add( 'R' +
               LFill( DATA_PAG_OU_RECONHCIMENTO_CREDITO ) +
               LFill( DATA_EMISSAO ) +
               LFill( MODELO_DOCUMENTO, 0 ) +
               LFill( SERIE_DOCUMENTO, 0 ) +
               LFill( SUBSERIE_DOCUMENTO ) +
               LFill( SITUACAO_ESP_RESP, 0 ) +
               LFill( MOTIVO_NAO_RETENCAO, 0 ) +
               LFill( LOCAL_INCIDENCIA ) +
               LFill( TIPO_REC_ISSQN, 0 ) +
               LFill( NUMERO_DOCUMENTO ) +
               LFill( VALOR_BRUTO, 0 ) +
               LFill( VALOR_SERVICO, 0 ) +
               LFill( ALIQUOTA, 0 ) +
               LFill( SIMPLES_NACIONAL, 0 ) +
               LFill( INSCRICAO_MUNICIPAL ) +
               LFill( CNPJ ) +
               LFill( CPF ) +
               LFill( NOME_PRESTADOR ) +
               LFill( LOGRADOURO_PRESTADOR ) +
               LFill( NUMERO_IMOVEL_PRESTADOR ) +
               LFill( COMPLEMENTO_PRESTADOR ) +
               LFill( BAIRRO_PRESTADOR ) +
               LFill( CIDADE_PRESTADOR ) +
               LFill( PAIS_PRESTADOR ) +
               LFill( CEP_PRESTADOR ) +
               LFill( TELEFONE_PRESTADOR ) +
               LFill( EMAIL_PRESTADOR ) +
               LFill( INSC_MUN_TOMADOR ) +
               LFill( CNPJ_TOMADOR ) +
               LFill( CPF_TOMADOR ) +
               LFill( NOME_TOMADOR ) +
               LFill( LOGRADOURO_TOMADOR ) +
               LFill( NUMERO_IMOVEL_TOMADOR ) +
               LFill( COMPLEMENTO_TOMADOR ) +
               LFill( BAIRRO_TOMADOR ) +
               LFill( CIDADE_TOMADOR ) +
               LFill( PAIS_TOMADOR ) +
               LFill( CEP_TOMADOR ) +
               LFill( TELEFONE_TOMADOR ) +
               LFill( EMAIL_TOMADOR ) +
               LFill( LOCAL_PRESTACAO ) +
               LFill( PAIS_PRESTACAO ) +
               LFill( DESCRICAO_EVENTO ) +
               LFill( DATA_EVENTO ), False);
        end;
     end;
  end;
end;

{ TGerarDES }

function TGerarDES.apenasNumeros(Texto: string): string;
var
	S: string;
  i: integer;
begin
	S := '';
  for I := 1 to Length(Texto) do
    if Texto[i] in ['0'..'9'] then
    	S := S + Texto[i];
  Result := S;
end;

procedure TGerarDES.cadGerarDES;
begin
	try
  	Application.CreateForm(TfrmCadGerarDES, frmCadGerarDES);
    frmCadGerarDES.ShowModal;
	finally
    FreeAndNil(frmCadGerarDES);
	end;
end;

constructor TGerarDES.create;
begin
  vDES := TDES.create;
  FParar := False;
  inherited;
end;

destructor TGerarDES.destroy;
begin
  FreeAndNil(vDES);
  inherited;
end;

function TGerarDES.preencheRegistroE(var progressBar: TProgressBar; var lbMensagem: TLabel): boolean;
begin
	try
    try
      Result := False;

      if not(conectar(True)) then
        Exit;

      Parar := False;
    
      QrAux.Close;
      QrAux.SQL.Text := 'SELECT V.DATA_EMISSAO, V.COD_CTISS, V.COD_SUBITEM, V.MODELO_DOCUMENTO, '+
      'V.SERIE_DOCUMENTO, V.SUBSERIE_DOCUMENTO, V.TIPO_NEGOCIO, V.EXIGIBILIDADE_ISSQN, V.LOCAL_INCIDENCIA, '+
      'V.REG_ESP_TRIB, V.TIPO_REC_ISSQN, V.NUMERO_DOCUMENTO, V.NUMERO_FINAL, SUM(V.VALOR_BRUTO) VALOR_BRUTO, '+
      'SUM(V.VALOR_SERVICO) VALOR_SERVICO, V.ALIQUOTA, V.SITUACAO_DOCUMENTO, V.SIMPLES_NACIONAL, '+
      'V.INSC_MUN_TOMADOR, V.CNPJ_TOMADOR, V.CPF_TOMADOR, V.NOME_TOMADOR, V.LOGRADOURO_TOMADOR, '+
      'V.NUM_IMOVEL_TOMADOR, V.COMPLEMENTO_TOMADOR, V.BAIRRO_TOMADOR, V.CIDADE_TOMADOR, '+
      'V.PAIS_TOMADOR, V.CEP_TOMADOR, V.TELEFONE_TOMADOR, V.EMAIL_TOMADOR,V.LOCAL_PRESTACAO, '+
      'V.PAIS_PRESTACAO, V.DATA_COMPETENCIA, V.DATA_CANCELAMENTO, V.MOTIVO_CANCELAMENTO, '+
      'V.OUTRO_MOTIVO_CANCELAMENTO '+
      'FROM VW_DES_E V WHERE V.COD_EMPRESA = :COD_EMPRESA AND V.DATA_EMISSAO >= :DATA_EMISSAO_I '+
      'AND V.DATA_EMISSAO <= :DATA_EMISSAO_F '+
      'GROUP BY '+
      'V.COD_CTISS, V.COD_SUBITEM, V.ALIQUOTA, V.TIPO_REC_ISSQN, V.DATA_EMISSAO, V.MODELO_DOCUMENTO, '+
      'V.SERIE_DOCUMENTO, V.SUBSERIE_DOCUMENTO, V.TIPO_NEGOCIO, V.EXIGIBILIDADE_ISSQN, V.LOCAL_INCIDENCIA, '+
      'V.REG_ESP_TRIB, V.NUMERO_DOCUMENTO, V.NUMERO_FINAL, '+
      'V.SITUACAO_DOCUMENTO, V.SIMPLES_NACIONAL, '+
      'V.INSC_MUN_TOMADOR, V.CNPJ_TOMADOR, V.CPF_TOMADOR, V.NOME_TOMADOR, V.LOGRADOURO_TOMADOR, '+
      'V.NUM_IMOVEL_TOMADOR, V.COMPLEMENTO_TOMADOR, V.BAIRRO_TOMADOR, V.CIDADE_TOMADOR, '+
      'V.PAIS_TOMADOR, V.CEP_TOMADOR, V.TELEFONE_TOMADOR, V.EMAIL_TOMADOR,V.LOCAL_PRESTACAO, '+
      'V.PAIS_PRESTACAO, V.DATA_COMPETENCIA, V.DATA_CANCELAMENTO, V.MOTIVO_CANCELAMENTO, '+
      'V.OUTRO_MOTIVO_CANCELAMENTO '+
      'ORDER BY V.DATA_EMISSAO';
      QrAux.ParamByName('COD_EMPRESA').AsInteger := CodEmpresa;
      QrAux.ParamByName('DATA_EMISSAO_I').AsDateTime := vDES.DT_INI;
      QrAux.ParamByName('DATA_EMISSAO_F').AsDateTime := vDES.DT_FIN;
      QrAux.Open;
      QrAux.FetchAll;

      if QrAux.IsEmpty then
        Exit;

      progressBar.Max := QrAux.RecordCount;

      QrAux.First;
      while not QrAux.Eof do
      begin
        with vDES.ArquivoDES.RegistroE.New do
        begin
          DATA_EMISSAO := QrAux.FieldByName('DATA_EMISSAO').AsDateTime;
          CTISS := QrAux.FieldByName('COD_CTISS').AsString;
          COD_SUBITEM := QrAux.FieldByName('COD_SUBITEM').AsString;
          MODELO_DOCUMENTO := QrAux.FieldByName('MODELO_DOCUMENTO').AsInteger;
          SERIE_DOCUMENTO := QrAux.FieldByName('SERIE_DOCUMENTO').AsInteger;
          SUBSERIE_DOCUMENTO := QrAux.FieldByName('SUBSERIE_DOCUMENTO').AsString;
          TIPO_NEGOCIO := QrAux.FieldByName('TIPO_NEGOCIO').AsInteger;
          EXIGIBILIDADE_ISSQN := QrAux.FieldByName('EXIGIBILIDADE_ISSQN').AsInteger;
          LOCAL_INCIDENCIA := QrAux.FieldByName('LOCAL_INCIDENCIA').AsString;
          REGIME_ESP_TRIBUTACAO := QrAux.FieldByName('REG_ESP_TRIB').AsInteger;
          TIPO_REC_ISSQN := QrAux.FieldByName('TIPO_REC_ISSQN').AsInteger;
          NUMERO_DOCUMENTO := QrAux.FieldByName('NUMERO_DOCUMENTO').AsString;
          NUMERO_FINAL := QrAux.FieldByName('NUMERO_FINAL').AsString;
          VALOR_BRUTO := QrAux.FieldByName('VALOR_BRUTO').AsCurrency;
          VALOR_SERVICO := QrAux.FieldByName('VALOR_SERVICO').AsCurrency;
          ALIQUOTA := QrAux.FieldByName('ALIQUOTA').AsCurrency;
          SITUACAO_DOCUMENTO := QrAux.FieldByName('SITUACAO_DOCUMENTO').AsInteger;
          SIMPLES_NACIONAL := QrAux.FieldByName('SIMPLES_NACIONAL').AsInteger;
          INSC_MUN_TOMADOR := apenasNumeros(QrAux.FieldByName('INSC_MUN_TOMADOR').AsString);
          CNPJ_TOMADOR := apenasNumeros(QrAux.FieldByName('CNPJ_TOMADOR').AsString);
          CPF_TOMADOR := apenasNumeros(QrAux.FieldByName('CPF_TOMADOR').AsString);
          NOME_TOMADOR := QrAux.FieldByName('NOME_TOMADOR').AsString;
          LOGRADOURO_TOMADOR := QrAux.FieldByName('LOGRADOURO_TOMADOR').AsString;
          NUMERO_IMOVEL_TOMADOR := QrAux.FieldByName('NUM_IMOVEL_TOMADOR').AsString;
          BAIRRO_TOMADOR := QrAux.FieldByName('BAIRRO_TOMADOR').AsString;
          CIDADE_TOMADOR := QrAux.FieldByName('CIDADE_TOMADOR').AsString;
          PAIS_TOMADOR := QrAux.FieldByName('PAIS_TOMADOR').AsString;
          CEP_TOMADOR := apenasNumeros(QrAux.FieldByName('CEP_TOMADOR').AsString);
          TELEFONE_TOMADOR := apenasNumeros(QrAux.FieldByName('TELEFONE_TOMADOR').AsString);
          EMAIL_TOMADOR := QrAux.FieldByName('EMAIL_TOMADOR').AsString;
          LOCAL_PRESTACAO := QrAux.FieldByName('LOCAL_PRESTACAO').AsString;
          PAIS_PRESTACAO := QrAux.FieldByName('PAIS_PRESTACAO').AsString;;
          DATA_CANCELAMENTO := QrAux.FieldByName('DATA_CANCELAMENTO').AsDateTime;
          MOTIVO_CANCELAMENTO := QrAux.FieldByName('MOTIVO_CANCELAMENTO').AsString;
          OUTRO_MOTIVO_CANCELAMENTO := QrAux.FieldByName('OUTRO_MOTIVO_CANCELAMENTO').AsString;
        end;
        lbMensagem.Caption := 'Registro E - Data Emissão: ' + DateToStr(QrAux.FieldByName('DATA_EMISSAO').AsDateTime) + ' Numero Documento: ' + QrAux.FieldByName('NUMERO_DOCUMENTO').AsString;
        progressBar.Position := QrAux.RecNo;
        Application.ProcessMessages;
      
        if Parar then
          Exit;
        
        QrAux.Next;
      end;

      Result := True;
    except on E: Exception do
      begin
        Result := False;
        Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      end;  
    end;
  finally
    desconectar;
  end;
end;

function TGerarDES.preencheRegistroH: boolean;
begin
	try
    Result := True;
    with vDES.ArquivoDES.RegistroH.New do
    begin
      INSCRICAO_MUNICIPAL := Copy(apenasNumeros(retornaIM), 1, 11);
      CNPJ_CPF := Copy(apenasNumeros(apenasNumeros(retornaCNPJ)), 1, 14);
      VERSAO_SISTEMA := 'VERSÃO300';
    end;
  except on E: Exception do
  	begin
    	Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
  	end;
  end;
end;

function TGerarDES.preencheRegistroR(var progressBar: TProgressBar;
  var lbMensagem: TLabel): boolean;
begin
	try
    try
      Result := False;

      if not(conectar(True)) then
        Exit;
      
      Parar := False;
    
      QrAux.Close;
      QrAux.SQL.Text := 'SELECT R.COD_SERVICO, R.TIPO_REGISTRO, R.DATA_PAG_REC_CRED, R.DATA_EMISSAO, '+
      'R.MODELO_DOCUMENTO, R.SERIE_DOCUMENTO, R.SUBSERIE_DOCUMENTO, R.SIT_ESP_RESP, '+
      'R.MOTIVO_NAO_RETENCAO, R.LOCAL_INCIDENCIA,R.TIPO_REC_ISSQN, R.NUMERO_DOCUMENTO, SUM(R.VALOR_BRUTO) VALOR_BRUTO, '+
      'SUM(R.VALOR_SERVICO) VALOR_SERVICO, R.ALIQUOTA, R.SIMPLES_NACIONAL, R.INSC_MUN_PRESTADOR, '+
      'R.CNPJ_PRESTADOR, R.CPF_PRESTADOR, R.NOME_PRESTADOR, R.LOGRADOURO_PRESTADOR, '+
      'R.NUM_IMOVEL_PRESTADOR, R.COMPLEMENTO_PRESTADOR, R.BAIRRO_PRESTADOR, '+
      'R.CIDADE_PRESTADOR, R.PAIS_PRESTADOR, R.CEP_PRESTADOR, R.TELEFONE_PRESTADOR, '+
      'R.EMAIL_PRESTADOR, R.LOCAL_PRESTACAO, R.PAIS_PRESTACAO '+
      'FROM VW_DES_R R WHERE R.COD_EMPRESA = :COD_EMPRESA '+
      'AND R.DATA_PAG_REC_CRED >= :DATA_PAG_REC_CRED_I '+
      'AND R.DATA_PAG_REC_CRED <= :DATA_PAG_REC_CRED_F '+
      'GROUP BY '+
      'R.COD_SERVICO, R.TIPO_REGISTRO, R.DATA_PAG_REC_CRED, R.DATA_EMISSAO, '+
      'R.MODELO_DOCUMENTO, R.SERIE_DOCUMENTO, R.SUBSERIE_DOCUMENTO, R.SIT_ESP_RESP, '+
      'R.MOTIVO_NAO_RETENCAO, R.LOCAL_INCIDENCIA,R.TIPO_REC_ISSQN, R.NUMERO_DOCUMENTO, '+
      'R.ALIQUOTA, R.SIMPLES_NACIONAL, R.INSC_MUN_PRESTADOR, '+
      'R.CNPJ_PRESTADOR, R.CPF_PRESTADOR, R.NOME_PRESTADOR, R.LOGRADOURO_PRESTADOR, '+
      'R.NUM_IMOVEL_PRESTADOR, R.COMPLEMENTO_PRESTADOR, R.BAIRRO_PRESTADOR, '+
      'R.CIDADE_PRESTADOR, R.PAIS_PRESTADOR, R.CEP_PRESTADOR, R.TELEFONE_PRESTADOR, '+
      'R.EMAIL_PRESTADOR, R.LOCAL_PRESTACAO, R.PAIS_PRESTACAO '+
      'ORDER BY R.DATA_EMISSAO';
      QrAux.ParamByName('COD_EMPRESA').AsInteger := CodEmpresa;
      QrAux.ParamByName('DATA_PAG_REC_CRED_I').AsDateTime := vDES.DT_INI;
      QrAux.ParamByName('DATA_PAG_REC_CRED_F').AsDateTime := vDES.DT_FIN;
      QrAux.Open;
      QrAux.FetchAll;

      if QrAux.IsEmpty then
        Exit;

      progressBar.Max := QrAux.RecordCount;

      QrAux.First;
      while not QrAux.Eof do
      begin
        with vDES.ArquivoDES.RegistroR.New do
        begin
          DATA_PAG_OU_RECONHCIMENTO_CREDITO := QrAux.FieldByName('DATA_PAG_REC_CRED').AsDateTime;
          DATA_EMISSAO := QrAux.FieldByName('DATA_EMISSAO').AsDateTime;
          MODELO_DOCUMENTO := StrToIntDef(QrAux.FieldByName('MODELO_DOCUMENTO').AsString, 0);
          SERIE_DOCUMENTO := retornaCodSerie(QrAux.FieldByName('SERIE_DOCUMENTO').AsString);
          SUBSERIE_DOCUMENTO := QrAux.FieldByName('SUBSERIE_DOCUMENTO').AsString;
          SITUACAO_ESP_RESP := QrAux.FieldByName('SIT_ESP_RESP').AsInteger;
          MOTIVO_NAO_RETENCAO := StrToIntDef(QrAux.FieldByName('MOTIVO_NAO_RETENCAO').AsString, 0);
          LOCAL_INCIDENCIA := IntToStr(QrAux.FieldByName('LOCAL_INCIDENCIA').AsInteger);
          TIPO_REC_ISSQN := StrToIntDef(QrAux.FieldByName('TIPO_REC_ISSQN').AsString, 0);
          NUMERO_DOCUMENTO := QrAux.FieldByName('NUMERO_DOCUMENTO').AsString;
          VALOR_BRUTO := QrAux.FieldByName('VALOR_BRUTO').AsCurrency;
          VALOR_SERVICO := QrAux.FieldByName('VALOR_SERVICO').AsCurrency;
          ALIQUOTA := QrAux.FieldByName('ALIQUOTA').AsCurrency;
          SIMPLES_NACIONAL := QrAux.FieldByName('SIMPLES_NACIONAL').AsInteger;
          INSCRICAO_MUNICIPAL := apenasNumeros(QrAux.FieldByName('INSC_MUN_PRESTADOR').AsString);
          CNPJ := apenasNumeros(QrAux.FieldByName('CNPJ_PRESTADOR').AsString);
          CPF := apenasNumeros(QrAux.FieldByName('CPF_PRESTADOR').AsString);
          NOME_PRESTADOR := QrAux.FieldByName('NOME_PRESTADOR').AsString;
          LOGRADOURO_PRESTADOR := QrAux.FieldByName('LOGRADOURO_PRESTADOR').AsString;
          NUMERO_IMOVEL_PRESTADOR := QrAux.FieldByName('NUM_IMOVEL_PRESTADOR').AsString;
          COMPLEMENTO_PRESTADOR := QrAux.FieldByName('COMPLEMENTO_PRESTADOR').AsString;
          BAIRRO_PRESTADOR := QrAux.FieldByName('BAIRRO_PRESTADOR').AsString;
          CIDADE_PRESTADOR := QrAux.FieldByName('CIDADE_PRESTADOR').AsString;
          PAIS_PRESTADOR := QrAux.FieldByName('PAIS_PRESTADOR').AsString;
          CEP_PRESTADOR := apenasNumeros(QrAux.FieldByName('CEP_PRESTADOR').AsString);
          TELEFONE_PRESTADOR := apenasNumeros(QrAux.FieldByName('TELEFONE_PRESTADOR').AsString);
          EMAIL_PRESTADOR := QrAux.FieldByName('EMAIL_PRESTADOR').AsString;
          LOCAL_PRESTACAO := QrAux.FieldByName('LOCAL_PRESTACAO').AsString;
          PAIS_PRESTACAO := QrAux.FieldByName('PAIS_PRESTACAO').AsString;
        end;
        lbMensagem.Caption := 'Registro R - Data Emissão: ' + DateToStr(QrAux.FieldByName('DATA_EMISSAO').AsDateTime) + ' Numero Documento: ' + QrAux.FieldByName('NUMERO_DOCUMENTO').AsString;
        progressBar.Position := QrAux.RecNo;
        Application.ProcessMessages;

        if Parar then
          Exit;
          
        QrAux.Next;
      end;
      Result := True;
    except on E: Exception do
      begin
        Result := False;
        Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      end;
    end;
  finally
    desconectar;
  end;
end;

function TGerarDES.retornaCNPJ: string;
begin
	try
    try
      Result := '';

      if not(conectar(True)) then
      	Exit;

      QrAux.Close;
      QrAux.SQL.Text := 'SELECT E.CNPJ_EMP FROM EMPRESA E WHERE E.COD_EMPRESA = :COD_EMPRESA';
      QrAux.ParamByName('COD_EMPRESA').AsInteger := CodEmpresa;
      QrAux.Open;

      if QrAux.IsEmpty then
        Exit;

      Result := QrAux.FieldByName('CNPJ_EMP').AsString;
    except on E: Exception do
    begin
      Result := '';
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
    end;
    end;
  finally
  	desconectar;
  end;
end;

function TGerarDES.retornaCodSerie(Serie: string): integer;
var
	i: integer;
const Series: array[0..28] of string = ('', 'U', 'A', 'AA', 'B','C', 'D', 'E',
'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
'V', 'W', 'X', 'Y', 'Z');
begin
	try
    if StrToIntDef(Trim(Serie), -1) <> -1 then
    begin
    	Result := StrToInt(Serie) + 28;
      Exit;
    end;
    for I := 0 to 28 - 1 do
      if Series[i] = Serie then
      begin
        Result := i;
        Exit;
      end;
  except on E: Exception do
  	Result := 0;
  end;
end;

function TGerarDES.retornaIM: string;
begin
	try
    try
      Result := '';

      if not(conectar(True)) then
        Exit;

      QrAux.Close;
      QrAux.SQL.Text := 'SELECT E.IM_EMP FROM EMPRESA E WHERE E.COD_EMPRESA = :COD_EMPRESA';
      QrAux.ParamByName('COD_EMPRESA').AsInteger := CodEmpresa;
      QrAux.Open;

      if QrAux.IsEmpty then
        Exit;

      Result := QrAux.FieldByName('IM_EMP').AsString;
    except on E: Exception do
    begin
      Result := '';
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
    end;
    end;
  finally
  	desconectar;
  end;
end;

{ TRegistroEList }

function TRegistroEList.GetItem(Index: integer): TRegistroE;
begin
  Result := TRegistroE(inherited Items[Index]);
end;

function TRegistroEList.New: TRegistroE;
begin
  Result := TRegistroE.create;
  Add(Result);
end;

procedure TRegistroEList.SetItem(Index: integer; const Value: TRegistroE);
begin
	Put(Index, Value);
end;

{ TRegistroRList }

function TRegistroRList.GetItem(Index: integer): TRegistroR;
begin
	Result := TRegistroR(inherited Items[Index]);
end;

function TRegistroRList.New: TRegistroR;
begin
	Result := TRegistroR.create;
  Add(Result);
end;

procedure TRegistroRList.SetItem(Index: integer; const Value: TRegistroR);
begin
	Put(Index, Value);
end;

end.
