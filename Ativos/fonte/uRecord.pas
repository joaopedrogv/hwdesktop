unit uRecord;

interface

uses
  IBDatabase;

const
  padraoCAT52: array[1..33] of string = ('1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C',
    'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', {}
    'X', 'Z');

type
  RTotAliq = record
    seq, aliq: string;
    valor: Currency;
  end;
  RmapaResumo = record
    nreducoes: string; //      tipo 1
    coored: string; //      tipo h
    vlCancel: string; //      tipo 1
    vlAcrescimo: string; //      tipo F
    vlDesconto: string; //      tipo 1
    vlISS: string; //      tipo 2
    vlIsentos: string; //      tipo 3
    vlNaoIncidencia: string; // alvez tipo 3
    vlSubst: string; //      tipo 3
    vlTotLiq: string; //      tipo 1
    vlCancelamentoICMS: string;
    vlDescontoICMS: string;
    vlCancelamentoISSQN: string;
    vlDescontoISSQN: string;
    vlAcrescimoICMS:string;
    vlAcrescimoISSQN:string;
    vlIsencaoICM:string;
    vlIsencaoISSQN:string;
    vlNaoIncidenciaICMS:string;
    vlNaoIncidenciaISSQN:string;
    vlSubstICMS:string;
    vlSubstISSQN:string;
    dataRed: string;
    horaRed: string;
    qtdeAliq: integer;
    valiqs: array of RTotAliq;
  end;
  RItemVenda = record
    tipo, cod_prod, num_fab_prod, descr, descr_red, csdecqtde, csdecvlunt: string;
    nped, grupo_prod, cod_empresa: integer;
    qtde: Real;
    vl_unit, rateio_desc, rateio_acresc, desc_item, acresc_intem: Currency;
  end;
  RVenda = record
    nped, cod_cliente, cod_vendedor, nprevenda, qtdeItens, cod_cond_pag: integer;
    empresa, fone_Empresa, cgc_emp, tipo_venda, nome_cliente, endereco_cliente, bairro_cliente,
      cidade_cliente, cnpjcpf_cliente, insc_cliente, fone_cliente, cond_pag, observacao,
      usar_Declaracao, vendedor, estado_cliente, NSerie_Impressao, linhaAd1, linhaAd2, linhaAd3: string;
    valor_bruto, desconto, acrescimo, valor_produtos, valor_servicos, valor_liquido: Currency;
    item: array of RItemVenda;
    qtde_Produtos, qtde_Servicos, COO_Impressao, CAIXA_Impressao: integer;
  end;

  RDocNaoFiscais = record
    coo, gnf, grg, cdc, tipoDoc, data, hora: string;
  end;
  (*
  TDadosEstabelecimento = packed record
    CNPJ: array[0..20] of Char; // CNPJ
    IE: array[0..20] of Char; // Inscrição Estadual
    IM: array[0..20] of Char; // Inscrição Municipal
    RazaoSocial: array[0..50] of Char; // Nome comercial (Razão Social) do contribuinte
    Logradouro: array[0..50] of Char; // Logradouro
    Numero: array[0..10] of Char; // Número
    Complemento: array[0..30] of Char; // Complemento
    Bairro: array[0..40] of Char; // Bairro
    Municipio: array[0..40] of Char;
    // Município onde está domiciliado o estabelecimento informante
    UF: array[0..2] of Char; // Unidade da Federação referente ao Município
    CEP: array[0..15] of Char; // CEP (Código de Endereçamento Postal)
    Telefone: array[0..20] of Char; // Número de telefone para contato
    FAX: array[0..20] of Char; // Fax
    Contato: array[0..40] of Char; // Pessoa responsável para contato
  end;

  // Informações sobre o arquivo de origem
  TArquivoOrigem = packed record
    Nome: array[0..259] of Char; // Arquivo de origem
    Data: array[0..10] of Char; // Data do arquivo
    Horario: array[0..9] of Char; // Horário do arquivo
    Dispositivo: PChar; // Descrição do dispositivo
    Loja: array[0..4] of Char; // Loja
    ECF: array[0..3] of Char; // Número sequencial do ECF
    FAB: array[0..21] of Char; // N/S de fabricação do ECF
    Tipo: Word; // Tipo
    Extensao: Integer; // Extensão do arquivo em bytes
  end;

  TContador = packed record
    Minimo: Integer; // Valor incial do contador
    Maximo: Integer; // Valor final do contador
    Valor: Integer; // Valor corrente do contador
  end;

  // Informações repassadas pela função de geração do SINTEGRA à rotina de callback.
  TInfoCallBackSintegra = packed record
    Estabelecimento: TDadosEstabelecimento;
    Fila: array[0..99] of TArquivoOrigem; // Fila de arquivos para processamento
    Arquivos: SmallInt; // Número total de arquivos
    Arquivo: TArquivoOrigem; // Informações do arquivo em processamento
    Sequencial: SmallInt; // Número sequencial do arquivo
    Contador: TContador; // Contador
    Destino: array[0..259] of Char; // Nome do arquivo destino
    Evento: SmallInt; // Mensagem
    Retorno: SmallInt; // Valor de retorno da função
    Tipo: SmallInt; // Tipo do registro (Mensagem 50)
    Subtipo: Char; // Subtipo do registro (Mensagem 50)
    Registro: PChar; // Registro (Mensagem 50)
  end;

  // Propriedades do arquivo binário retornadas pela função SWEDA_ExtrairInformacoesECF

  TPropriedadesDispositivo = packed record
    // Sobre o arquivo
    Arquivo: packed record
      Tipo: Smallint;
      Nome: array[0..259] of Char;
      Data: array[0..10] of Char;
      Horario: array[0..9] of Char;
      Dispositivo: array[0..39] of Char;
      Extensao: Integer;
    end;

    // De identificação do equipamento
    ECF: packed record
      Loja: array[0..19] of Char;
      ECF: array[0..9] of Char;
      FAB: array[0..21] of Char;
      Marca: array[0..20] of Char;
      Modelo: array[0..20] of Char;
      Tipo: array[0..20] of Char;
      Berco: Char;
    end;

    // Sobre usuário(s)
    Usuario: array[0..11] of packed record
      CNPJ: array[0..20] of Char;
      IE: array[0..20] of Char;
      IM: array[0..20] of Char;
      MFD: array[0..21] of Char;
      Moeda: array[0..6] of Char;
      GT: array[0..24] of Char;
    end;
    Usuarios: SmallInt;

    // Sobre o software básico
    SB: packed record
      Versao: array[0..11] of Char; // "01.00.04"
      Checksum: array[0..8] of Char;
    end;

    // Sobre a MFD
    MFD: packed record
      NS: array[0..21] of Char;
      Berco: Char;
      Capacidade: Integer;
      Consumo: Integer;
      DataInstalacao: array[0..10] of Char;
    end;

    Contadores: packed record
      COO: array[0..6] of Char;
      CRZ: array[0..6] of Char;
      CRO: array[0..6] of Char;
    end;
  end;

  // Informações repassadas pela função de captura de dispositivos à rotina de callback da aplicação.

  TInfoCallBackCD = packed record
    Arquivo: array[0..259] of Char; // Arquivo de origem
    NS: array[0..21] of Char; // N/S do dispositivo
    FAB: array[0..21] of Char; // N/S de fabricação do ECF
    Evento: Word; // Evento
    Dispositivo: Word; // Descrição do dispositivo
    Contador: TContador; // Contador
    Retorno: Smallint; // Código retornado à aplicação
  end;

  // Parâmetros de configuração da SWMFD.DLL
  TSWMFD_INI = packed record
    DiretorioSweda: array[0..259] of Char; // Arquivo de origem
    FAB: array[0..21] of Char; // N/S de fabricação do ECF do ECF local
    MFD: array[0..21] of Char; // N/S do dispositivo de MFD instalado no ECF local
    Porta: SmallInt;
    Velocidade: Integer;
  end;
  *)
  RegUltimaZ = record
    ModoRZ: array[0..2] of char;
    CRO: array[0..4] of char;
    CRZ: array[0..4] of char;
    COO: array[0..6] of char;
    GNF: array[0..6] of char;
    CCF: array[0..6] of char;
    GRG: array[0..6] of char;
    CFD: array[0..6] of char;
    NFC: array[0..4] of char;
    CFC: array[0..4] of char;
    CON: array[0..29] of array[0..3] of char;
    Separador: char;
    CER: array[0..29] of array[0..3] of char;
    Separador2: char;
    CDC: array[0..4] of char;
    CDN: array[0..4] of char;
    VAZIO: array[0..4] of char;
    GT: array[0..18] of char;
    ParciaisTributados: array[0..15] of array[0..13] of char;
    Separador3: char;
    I_ICMS: array[0..14] of char;
    N_ICMS: array[0..14] of char;
    F_ICMS: array[0..14] of char;
    I_ISS: array[0..14] of char;
    N_ISS: array[0..14] of char;
    F_ISS: array[0..14] of char;
    D_ICMS: array[0..14] of char; // desconto
    D_ISS: array[0..14] of char;
    A_ICMS: array[0..14] of char; // acrescimo
    A_ISS: array[0..14] of char;
    C_ICMS: array[0..14] of char; // Cancelamento
    C_ISS: array[0..14] of char;
    ParciaisNaoTributados: array[0..27] of array[0..13] of char;
    Separador4: char;
    SANGRIA: array[0..14] of char;
    SUPRIMENTO: array[0..14] of char;
    C_NFISC: array[0..14] of char; // Cancelamento nao fiscal
    D_NFISC: array[0..14] of char; // Desconto nao fiscal
    A_NFISC: array[0..14] of char; // Acréscimo nao fiscal
    Aliquotas: array[0..15] of array[0..3] of char;
    Separador5: char;
    DataMovimento: array[0..6] of char;
  end;

  REquipamento = record
    COD_NF_ENT: Integer;
    NITEM_ENT: Integer;
    VLR_EQUI: Extended;
    NOM_EQUIP: string;
    MARCA: string;
    COD_MARCA: integer;
    TIPEQUIP: string;

    transacao: TIBTransaction;
  end;

implementation

end.

