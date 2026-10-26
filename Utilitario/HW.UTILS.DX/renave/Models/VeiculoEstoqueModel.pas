unit VeiculoEstoqueModel;

interface

uses
  System.Classes,
  Hw.Convert;

type
  TEntradaEstoqueModel = class;
  TCancelamentoEstoqueModel = class;
  TOrigemPorCancelamentoEstoqueModel = class;
  TRestricaoVeiculoModel = class;
  TSaidaEstoqueModel = class;
  TCancelamentoSaidaEstoqueModel = class;
  TCompradorSaidaEstoqueModel = class;
  TEnderecoModel = class;
  TMunicipioModel = class;
  TVendedorEntradaEstoqueModel = class;

  TVeiculoEstoqueModel = class(TPersistent)
  private
    FsaidaEstoque: TSaidaEstoqueModel;
    FentradaEstoque: TEntradaEstoqueModel;
    FrestricoesVeiculo: TArray<TRestricaoVeiculoModel>;
    FcancelamentoEstoque: TCancelamentoEstoqueModel;
    Fid: Int64;
    Fchassi: string;
    FcodigoSegurancaCrv: string;
    FdataHoraMedicaoHodometro: TDateTime;
    Festado: string;
    FnumeroCrv: string;
    Fplaca: string;
    FquilometragemHodometro: Integer;
    Frenavam: string;
    FtipoCrv: string;
    ForigemPorCancelamentoEstoque: TOrigemPorCancelamentoEstoqueModel;
  published
    property id: Int64 read Fid write Fid;
    property chassi: string read Fchassi write Fchassi;
    property codigoSegurancaCrv: string read FcodigoSegurancaCrv write FcodigoSegurancaCrv;
    property dataHoraMedicaoHodometro: TDateTime read FdataHoraMedicaoHodometro write FdataHoraMedicaoHodometro;
    property estado: string read Festado write Festado;
    property numeroCrv: string read FnumeroCrv write FnumeroCrv;
    property placa: string read Fplaca write Fplaca;
    property quilometragemHodometro: Integer read FquilometragemHodometro write FquilometragemHodometro;
    property renavam: string read Frenavam write Frenavam;
    property tipoCrv: string read FtipoCrv write FtipoCrv;

    property entradaEstoque: TEntradaEstoqueModel read FentradaEstoque write FentradaEstoque;
    property cancelamentoEstoque: TCancelamentoEstoqueModel read FcancelamentoEstoque write FcancelamentoEstoque;
    property restricoesVeiculo: TArray<TRestricaoVeiculoModel> read FrestricoesVeiculo write FrestricoesVeiculo;
    property saidaEstoque: TSaidaEstoqueModel read FsaidaEstoque write FsaidaEstoque;
    property origemPorCancelamentoEstoque: TOrigemPorCancelamentoEstoqueModel read ForigemPorCancelamentoEstoque write ForigemPorCancelamentoEstoque;
  end;

  TOrigemPorCancelamentoEstoqueModel = class(TPersistent)
  private
    FidEstoqueOrigem: Int64;
  published
    [DBField('IDESTOQUEORIGEMPORCANC')]
    property idEstoqueOrigem: Int64 read FidEstoqueOrigem write FidEstoqueOrigem;
  end;

  TEntradaEstoqueModel = class(TPersistent)
  private
    FchaveNotaFiscalEntrada: string;
    FcpfOperadorResponsavel: string;
    FdataHora: TDateTime;
    FdataHoraEnvioNotaFiscalEntrada: TDateTime;
    FnumeroTermoEntradaEstoque: Integer;
    Fvendedor: TVendedorEntradaEstoqueModel;
  published
    property chaveNotaFiscalEntrada: string read FchaveNotaFiscalEntrada write FchaveNotaFiscalEntrada;
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property dataHora: TDateTime read FdataHora write FdataHora;
    property dataHoraEnvioNotaFiscalEntrada: TDateTime read FdataHoraEnvioNotaFiscalEntrada write FdataHoraEnvioNotaFiscalEntrada;
    property numeroTermoEntradaEstoque: Integer read FnumeroTermoEntradaEstoque write FnumeroTermoEntradaEstoque;
    property vendedor: TVendedorEntradaEstoqueModel read Fvendedor write Fvendedor;
  end;

  TVendedorEntradaEstoqueModel = class
  private
    FnumeroDocumento: string;
    FtipoDocumento: string;
  published
    [DBField('VEND_NUMERODOCUMENTO')]
    property numeroDocumento: string read FnumeroDocumento write FnumeroDocumento;
    [DBField('VEND_TIPODOCUMENTO')]
    property tipoDocumento: string read FtipoDocumento write FtipoDocumento;
  end;

  TCancelamentoEstoqueModel = class(TPersistent)
  private
    FdataHoraCancelamentoEstoque: TDateTime;
    FmotivoCancelamentoEstoque: string;
  published
    property dataHoraCancelamentoEstoque: TDateTime read FdataHoraCancelamentoEstoque write FdataHoraCancelamentoEstoque;
    property motivoCancelamentoEstoque: string read FmotivoCancelamentoEstoque write FmotivoCancelamentoEstoque;
  end;

  TRestricaoVeiculoModel = class(TPersistent)
  private
    FcodigoTipoRestricao: string;
    FtipoRestricao: string;
  published
    property codigoTipoRestricao: string read FcodigoTipoRestricao write FcodigoTipoRestricao;
    property tipoRestricao: string read FtipoRestricao write FtipoRestricao;
  end;

  TSaidaEstoqueModel = class(TPersistent)
  private
    FchaveNotaFiscalSaida: string;
    FdataHora: TDateTime;
    FdataHoraEnvioNotaFiscalSaida: TDateTime;
    Fmotivo: string;
    FnumeroTermoSaidaEstoque: Int64;
    FcancelamentoSaidaEstoque: TCancelamentoSaidaEstoqueModel;
    Fcomprador: TCompradorSaidaEstoqueModel;
    FcpfOperadorResponsavel: string;
  published
    property chaveNotaFiscalSaida: string read FchaveNotaFiscalSaida write FchaveNotaFiscalSaida;
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property dataHora: TDateTime read FdataHora write FdataHora;
    property dataHoraEnvioNotaFiscalSaida: TDateTime read FdataHoraEnvioNotaFiscalSaida write FdataHoraEnvioNotaFiscalSaida;
    property motivo: string read Fmotivo write Fmotivo;
    property numeroTermoSaidaEstoque: Int64 read FnumeroTermoSaidaEstoque write FnumeroTermoSaidaEstoque;
    property cancelamentoSaidaEstoque: TCancelamentoSaidaEstoqueModel read FcancelamentoSaidaEstoque write FcancelamentoSaidaEstoque;
    property comprador: TCompradorSaidaEstoqueModel read Fcomprador write Fcomprador;
  end;

  TCancelamentoSaidaEstoqueModel = class
  private
    FdataHoraCancelamentoSaidaEstoque: TDateTime;
    FidEstoqueGeradoNoCancelamentoSaida: Int64;
  published
    [DBField('DHCANCSAIDAESTOQUE')]
    property dataHoraCancelamentoSaidaEstoque: TDateTime read FdataHoraCancelamentoSaidaEstoque write FdataHoraCancelamentoSaidaEstoque;
    [DBField('IDESTOQUEGERADOCANCELAMENTO')]
    property idEstoqueGeradoNoCancelamentoSaida: Int64 read FidEstoqueGeradoNoCancelamentoSaida write FidEstoqueGeradoNoCancelamentoSaida;
  end;

  TCompradorSaidaEstoqueModel = class
  private
    Fnome: string;
    FnumeroDocumento: string;
    FtipoDocumento: string;
    Fendereco: TEnderecoModel;
  published
    property nome: string read Fnome write Fnome;
    property numeroDocumento: string read FnumeroDocumento write FnumeroDocumento;
    property tipoDocumento: string read FtipoDocumento write FtipoDocumento;
    property endereco: TEnderecoModel read Fendereco write Fendereco;
  end;

  TEnderecoModel = class
  private
    Fbairro: string;
    Fcep: string;
    Fcomplemento: string;
    Flogradouro: string;
    Fmunicipio: TMunicipioModel;
    Fnumero: string;
  published
    property bairro: string read Fbairro write Fbairro;
    property cep: string read Fcep write Fcep;
    property complemento: string read Fcomplemento write Fcomplemento;
    property logradouro: string read Flogradouro write Flogradouro;
    property numero: string read Fnumero write Fnumero;
    property municipio: TMunicipioModel read Fmunicipio write Fmunicipio;
  end;

  TMunicipioModel = class
  private
    Fid: string;
    Fnome: string;
    Fuf: string;
  published
    [DBField('MUN_ID')]
    property id: string read Fid write Fid;
    [DBField('MUN_NOME')]
    property nome: string read Fnome write Fnome;
    [DBField('MUN_UF')]
    property uf: string read Fuf write Fuf;
  end;

implementation

end.
