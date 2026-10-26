library hw.utils.dx;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.DateUtils,
  Vcl.Forms,
  Vcl.Dialogs,
  REST.Json,
  uClasseConexao in '..\..\Automacao Bpl\fonte\uClasseConexao.pas',
  HW.Utils.Classes.Registros_DX in 'fontes\HW.Utils.Classes.Registros_DX.pas',
  HW.Utils.Classes.Estatisticas_DX in 'fontes\HW.Utils.Classes.Estatisticas_DX.pas',
  HW.Utils.Classes.Funcoes_DX in 'fontes\HW.Utils.Classes.Funcoes_DX.pas',
  HW.Utils.Classes.Rest_DX in 'fontes\HW.Utils.Classes.Rest_DX.pas',
  HW.Utils.Classes.IBPT in 'fontes\HW.Utils.Classes.IBPT.pas',
  HW.Utils.Classes.Rtti in 'fontes\HW.Utils.Classes.Rtti.pas',
  HW.Utils.Classes.CentralAcoes in 'fontes\HW.Utils.Classes.CentralAcoes.pas',
  HW.Utils.Classes.Registros.Cidade_DX in 'fontes\HW.Utils.Classes.Registros.Cidade_DX.pas',
  HW.Utils.Classes.Registros.Estado_DX in 'fontes\HW.Utils.Classes.Registros.Estado_DX.pas',
  HW.Utils.Classes.Registros.Cliente_DX in 'fontes\HW.Utils.Classes.Registros.Cliente_DX.pas',
  HW.Utils.Classes.Registros.ClientesSetor_DX in 'fontes\HW.Utils.Classes.Registros.ClientesSetor_DX.pas',
  HW.Utils.Classes.Registros.Setor_DX in 'fontes\HW.Utils.Classes.Registros.Setor_DX.pas',
  HW.Utils.Classes.Registros.Usuario_DX in 'fontes\HW.Utils.Classes.Registros.Usuario_DX.pas',
  HW.Utils.Classes.Registros.Chamado_DX in 'fontes\HW.Utils.Classes.Registros.Chamado_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Consulta_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Consulta_DX.pas',
  HW.Utils.Forms.CentralAcoes in 'fontes\HW.Utils.Forms.CentralAcoes.pas' {frmUtilsCentralAcoes},
  HW.Utils.Forms.Chamados in 'fontes\HW.Utils.Forms.Chamados.pas' {frmUtilsChamado},
  HW.Utils.Forms.Tickets in 'fontes\HW.Utils.Forms.Tickets.pas' {frmUtilsTickets},
  HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX in 'fontes\HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX.pas',
  HW.Utils.Forms.Notificacoes in 'fontes\HW.Utils.Forms.Notificacoes.pas' {frmUtilsNotificacoes},
  HW.Utils.Classes.Registros.Ticket.Empresa_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Empresa_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Categoria_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Categoria_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Anexo_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Anexo_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Documento.Rastreamento_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Documento.Rastreamento_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Documento_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Documento_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Documento.Revisao_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Documento.Revisao_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Participante_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Participante_DX.pas',
  HW.Utils.Classes.Registros.Ticket.Mensagem_DX in 'fontes\HW.Utils.Classes.Registros.Ticket.Mensagem_DX.pas',
  HW.Utils.Classes.Registros.Ticket_DX in 'fontes\HW.Utils.Classes.Registros.Ticket_DX.pas',
  HW.Utils.Forms.Tickets.Resposta in 'fontes\HW.Utils.Forms.Tickets.Resposta.pas' {frmUtilsTicketResposta},
  HW.Utils.Classes.Registros.Documento_DX in 'fontes\HW.Utils.Classes.Registros.Documento_DX.pas',
  HW.Utils.Forms.Tickets.Visualizar in 'fontes\HW.Utils.Forms.Tickets.Visualizar.pas' {frmUtilsTicketsVisualizar},
  HW.Utils.Classes.Registros.NotificacaoApiNavegador_DX in 'fontes\HW.Utils.Classes.Registros.NotificacaoApiNavegador_DX.pas',
  HW.Utils.Classes.Registros.NotificacoesNaoLidasERP_DX in 'fontes\HW.Utils.Classes.Registros.NotificacoesNaoLidasERP_DX.pas',
  HW.Utils.Classes.Registros.ConsultaClienteUsuario in 'fontes\HW.Utils.Classes.Registros.ConsultaClienteUsuario.pas',
  HW.Utils.Classes.NotificacoesERP_DX in 'fontes\HW.Utils.Classes.NotificacoesERP_DX.pas',
  HW.Utils.Forms.NotificacoesDB in 'fontes\HW.Utils.Forms.NotificacoesDB.pas' {frmUtilsNotificacoesDB},
  Winapi.ActiveX {frmUtilsTicketsVisualizar},
  System.Win.ComObj,
  hw_utils in '..\..\Ativos\fonte\hw_utils.pas',
  uClassesProgFidelidade in '..\..\Ativos\fonte\uClassesProgFidelidade.pas',
  basefb_class in '..\..\Ativos\fonte\basefb_class.pas',
  config_sistema_class in '..\..\Ativos\fonte\config_sistema_class.pas',
  contas_a_pagar_class in '..\..\Ativos\fonte\contas_a_pagar_class.pas',
  hw.image.form.dx in 'hw.image\hw.image.form.dx.pas' {FormImageView},
  hw.image.export.dx in 'hw.image\hw.image.export.dx.pas',
  hw.image.utils.dx in 'hw.image\hw.image.utils.dx.pas',
  Hw.Integra.Api.Rest in 'hw.integra.api\Hw.Integra.Api.Rest.pas',
  Hw.Integra.Api in 'hw.integra.api\Hw.Integra.Api.pas',
  Hw.Integra.Api.Boleto in 'hw.integra.api\Hw.Integra.Api.Boleto.pas',
  Hw.Integra.Api.Credito in 'hw.integra.api\Hw.Integra.Api.Credito.pas',
  Hw.Integra.Api.TipoContato in 'hw.integra.api\Hw.Integra.Api.TipoContato.pas',
  Hw.Integra.Api.ContatoCliente in 'hw.integra.api\Hw.Integra.Api.ContatoCliente.pas',
  Hw.Integra.Api.Form.Creditos in 'hw.integra.api\Hw.Integra.Api.Form.Creditos.pas' {FrmCreditosHw},
  Hw.Integra.Api.NotificacaoContasEmAberto in 'hw.integra.api\Hw.Integra.Api.NotificacaoContasEmAberto.pas',
  Hw.Integra.Api.CreditoBoleto in 'hw.integra.api\Hw.Integra.Api.CreditoBoleto.pas',
  Hw.Integra.Api.FinanceiroService in 'hw.integra.api\Hw.Integra.Api.FinanceiroService.pas',
  Hw.Integra.Credito.Aviso in 'hw.integra.api\Hw.Integra.Credito.Aviso.pas',
  Hw.Integra.Servicos in 'hw.integra.api\Hw.Integra.Servicos.pas',
  Hw.Integra.Servicos.Financeiro in 'hw.integra.api\Hw.Integra.Servicos.Financeiro.pas',
  HW.Comercio.Api in 'hw.comercio\HW.Comercio.Api.pas',
  HW.Comercio.Servicos in 'hw.comercio\HW.Comercio.Servicos.pas',
  HW.Servicos in 'Shared\HW.Servicos.pas',
  Hw.Api.Rest in 'Shared\Hw.Api.Rest.pas',
  Hw.Comercio.Api.Rest in 'hw.comercio\Hw.Comercio.Api.Rest.pas',
  Hw.Api in 'Shared\Hw.Api.pas',
  HW.Comercio.Api.Comercio in 'hw.comercio\HW.Comercio.Api.Comercio.pas',
  HW.Comercio.Api.Lojista in 'hw.comercio\HW.Comercio.Api.Lojista.pas',
  HW.Comercio.Api.Produto in 'hw.comercio\HW.Comercio.Api.Produto.pas',
  HW.Comercio.Api.ImagemProduto in 'hw.comercio\HW.Comercio.Api.ImagemProduto.pas',
  HW.KeyValue in 'Shared\HW.KeyValue.pas',
  HW.Json in 'Shared\HW.Json.pas',
  HW.Comercio.Api.Pedido in 'hw.comercio\HW.Comercio.Api.Pedido.pas',
  Hw.Tray.Api.Rest in 'hw.tray\Hw.Tray.Api.Rest.pas',
  Hw.Tray.Api in 'hw.tray\Hw.Tray.Api.pas',
  Hw.Tray.Api.Consumo in 'hw.tray\Hw.Tray.Api.Consumo.pas',
  Hw.Tray.Api.Category in 'hw.tray\Hw.Tray.Api.Category.pas',
  Hw.Tray.Api.Image in 'hw.tray\Hw.Tray.Api.Image.pas',
  Hw.Tray.Servicos in 'hw.tray\Hw.Tray.Servicos.pas',
  Hw.Tray.Api.Variant in 'hw.tray\Hw.Tray.Api.Variant.pas',
  Hw.Tray.Api.Property_ in 'hw.tray\Hw.Tray.Api.Property_.pas',
  Hw.Tray.Api.PaymentOptionDetail in 'hw.tray\Hw.Tray.Api.PaymentOptionDetail.pas',
  Hw.Tray.Api.Product in 'hw.tray\Hw.Tray.Api.Product.pas',
  Hw.Tray.Api.AdditionalInfo in 'hw.tray\Hw.Tray.Api.AdditionalInfo.pas',
  Hw.Tray.Api.Url in 'hw.tray\Hw.Tray.Api.Url.pas',
  Hw.Tray.Api.Form.Cadastros in 'hw.tray\Hw.Tray.Api.Form.Cadastros.pas' {FrmTrayCadastros},
  Hw.Tray.Api.Brand in 'hw.tray\Hw.Tray.Api.Brand.pas',
  marca_prod_class in '..\..\Ativos\fonte\marca_prod_class.pas',
  hw_grid_utils in '..\..\Ativos\fonte\hw_grid_utils.pas',
  categoria_class in '..\..\Ativos\fonte\categoria_class.pas',
  grade_class in '..\..\Ativos\fonte\grade_class.pas',
  hw_audit_utils in '..\..\Ativos\fonte\hw_audit_utils.pas',
  hw_auditoria_class in '..\..\Ativos\fonte\hw_auditoria_class.pas',
  senhas_class in '..\..\Ativos\fonte\senhas_class.pas',
  solicitacoes_acesso_class in '..\..\Ativos\fonte\solicitacoes_acesso_class.pas',
  tabela_processos_class in '..\..\Ativos\fonte\tabela_processos_class.pas',
  tabela_processos_usuarios_class in '..\..\Ativos\fonte\tabela_processos_usuarios_class.pas',
  uPesqPros_lote in '..\..\Ativos\fonte\uPesqPros_lote.pas' {frmPesqPros_lote},
  hw_lote_liberacao_class in '..\..\Ativos\fonte\hw_lote_liberacao_class.pas',
  hw_processo_class in '..\..\Ativos\fonte\hw_processo_class.pas',
  uScript in 'hw.script\uScript.pas',
  produtos_tmp_class in '..\..\Ativos\fonte\produtos_tmp_class.pas',
  Form.NbackupHw in 'hw.script\Form.NbackupHw.pas' {FormNbackupHw},
  uHistoricoProd in 'hw.corrigir.historico.prod\uHistoricoProd.pas',
  Hw.Tray.Api.Kit in 'hw.tray\Hw.Tray.Api.Kit.pas',
  Hw.CEP.Api in 'hw.cep\Hw.CEP.Api.pas',
  cep_class in '..\..\Ativos\fonte\cep_class.pas',
  AnexoXV in 'hw.integra.api\Entities\AnexoXV.pas',
  Api.AnexoXVService in 'hw.integra.api\AnexoXV\Api.AnexoXVService.pas',
  Servicos.AnexoXV in 'hw.integra.api\AnexoXV\Servicos.AnexoXV.pas',
  cest_item_class in '..\..\Ativos\fonte\cest_item_class.pas',
  cest__class in '..\..\Ativos\fonte\cest__class.pas',
  cest_mva_class in '..\..\Ativos\fonte\cest_mva_class.pas',
  cest_mva_uf_class in '..\..\Ativos\fonte\cest_mva_uf_class.pas',
  cest_ncm_class in '..\..\Ativos\fonte\cest_ncm_class.pas',
  cest_variante_class in '..\..\Ativos\fonte\cest_variante_class.pas',
  cest_versao_class in '..\..\Ativos\fonte\cest_versao_class.pas',
  cest_ambito_class in '..\..\Ativos\fonte\cest_ambito_class.pas',
  anexoxv_utils in '..\..\Ativos\fonte\anexoxv_utils.pas',
  hw_progress_utils in '..\..\Ativos\fonte\hw_progress_utils.pas' {FrmDoProgress},
  GS1Prefix in 'hw.integra.api\Entities\GS1Prefix.pas',
  Api.GS1Service in 'hw.integra.api\GS1\Api.GS1Service.pas',
  Servicos.GS1 in 'hw.integra.api\GS1\Servicos.GS1.pas',
  gs1prefix_class in '..\..\Ativos\fonte\gs1prefix_class.pas',
  hw_strings in '..\..\Ativos\fonte\hw_strings.pas',
  uClassesKentro in 'kentro\uClassesKentro.pas',
  uMensagemKentro in 'kentro\uMensagemKentro.pas' {frmMensagemKentro},
  CaixaEtd in 'hw.api.cloud\Entities\CaixaEtd.pas',
  GenericDataEtd in 'hw.api.cloud\Entities\GenericDataEtd.pas',
  SchemaEtd in 'hw.api.cloud\Entities\SchemaEtd.pas',
  ApiCloud in 'hw.api.cloud\Services\ApiCloud.pas',
  RepoHw in 'hw.api.cloud\Services\RepoHw.pas',
  hw.api.cloud.export in 'hw.api.cloud\hw.api.cloud.export.pas',
  UserCredentialsEtd in 'hw.api.cloud\Entities\UserCredentialsEtd.pas',
  Hw.Convert in 'Shared\Hw.Convert.pas',
  sincoff_schema_class in '..\..\Ativos\fonte\sincoff_schema_class.pas',
  BaseApiRes in 'hw.api.cloud\Base\BaseApiRes.pas',
  ErrorApiRes in 'hw.api.cloud\Base\ErrorApiRes.pas',
  RestApiBaseRes in 'hw.api.cloud\Base\RestApiBaseRes.pas',
  GenericDataGetUseCase in 'hw.api.cloud\UseCases\GenericDataGetUseCase.pas',
  UseCaseBase in 'hw.api.cloud\Base\UseCaseBase.pas',
  TableFieldsEtd in 'hw.api.cloud\Entities\TableFieldsEtd.pas',
  Hw.Types in 'Shared\Hw.Types.pas',
  NFCeEtd in 'hw.api.cloud\Entities\NFCeEtd.pas',
  NFCeDataEtd in 'hw.api.cloud\Entities\NFCeDataEtd.pas',
  NFCePostUseCase in 'hw.api.cloud\UseCases\NFCePostUseCase.pas',
  ConstsBase in 'hw.api.cloud\Base\ConstsBase.pas',
  ServiceSincUseCase in 'hw.api.cloud\UseCases\ServiceSincUseCase.pas',
  ConfigServerUseCase in 'hw.api.cloud\UseCases\ConfigServerUseCase.pas',
  uFormConfigServer in 'hw.api.cloud\Forms\uFormConfigServer.pas' {frmConfigServer},
  RepoLog in 'hw.api.cloud\Services\RepoLog.pas',
  logmessage_values_class in '..\..\Ativos\fonte\logmessage_values_class.pas',
  logmessage_table_class in '..\..\Ativos\fonte\logmessage_table_class.pas',
  logmessage_class in '..\..\Ativos\fonte\logmessage_class.pas',
  uFormLogView in 'hw.api.cloud\Forms\uFormLogView.pas' {frmLogView},
  PropostaEtd in 'hw.api.cloud\Entities\PropostaEtd.pas',
  PedidosGetUseCase in 'hw.api.cloud\UseCases\PedidosGetUseCase.pas',
  OrcamentoGetUseCase in 'hw.api.cloud\UseCases\OrcamentoGetUseCase.pas',
  ViewLogUseCase in 'hw.api.cloud\UseCases\ViewLogUseCase.pas',
  DeletedEtd in 'hw.api.cloud\Entities\DeletedEtd.pas',
  TestConnectionUseCase in 'hw.api.cloud\UseCases\TestConnectionUseCase.pas',
  BaseApi_45 in 'hw.api.cloud.dotnet.4.5\Base\BaseApi_45.pas',
  ApiCloud_45 in 'hw.api.cloud.dotnet.4.5\Services\ApiCloud_45.pas',
  PrintModels in 'hw.api.cloud.dotnet.4.5\Models\PrintModels.pas',
  UseCaseBase_45 in 'hw.api.cloud.dotnet.4.5\Base\UseCaseBase_45.pas',
  PrintTextUseCase in 'hw.api.cloud.dotnet.4.5\UseCases\PrintTextUseCase.pas',
  hw.api.cloud.dotnet45 in 'hw.api.cloud.dotnet.4.5\hw.api.cloud.dotnet45.pas',
  PrintNFCeUseCase in 'hw.api.cloud.dotnet.4.5\UseCases\PrintNFCeUseCase.pas',
  OpenDrawerUseCase in 'hw.api.cloud.dotnet.4.5\UseCases\OpenDrawerUseCase.pas',
  Hw.Nuvemshop.Api.Category in 'hw.nuvemshop\Hw.Nuvemshop.Api.Category.pas',
  Hw.Nuvemshop.Api.Product in 'hw.nuvemshop\Hw.Nuvemshop.Api.Product.pas',
  Hw.Nuvemshop.Api.Variant in 'hw.nuvemshop\Hw.Nuvemshop.Api.Variant.pas',
  Hw.Nuvemshop.Api.Form.Cadastros in 'hw.nuvemshop\Hw.Nuvemshop.Api.Form.Cadastros.pas' {FrmNuvemshopCadastros},
  Hw.Nuvemshop.Api in 'hw.nuvemshop\Hw.Nuvemshop.Api.pas',
  Hw.Nuvemshop.Api.Rest in 'hw.nuvemshop\Hw.Nuvemshop.Api.Rest.pas',
  Hw.Nuvemshop.Servicos in 'hw.nuvemshop\Hw.Nuvemshop.Servicos.pas',
  Hw.Nuvemshop.Api.Consumo in 'hw.nuvemshop\Hw.Nuvemshop.Api.Consumo.pas',
  Hw.Nuvemshop.Api.Url in 'hw.nuvemshop\Hw.Nuvemshop.Api.Url.pas',
  Hw.Nuvemshop.Api.Image in 'hw.nuvemshop\Hw.Nuvemshop.Api.Image.pas',
  cod_grade_prod_class in '..\..\Ativos\fonte\cod_grade_prod_class.pas',
  produtos_ec_grade_class in '..\..\Ativos\fonte\produtos_ec_grade_class.pas',
  produtos_ec_class in '..\..\Ativos\fonte\produtos_ec_class.pas',
  Hw.Nuvemshop.Api.Form.Padrao in 'hw.nuvemshop\Hw.Nuvemshop.Api.Form.Padrao.pas' {FrmNuvemshopPadrao},
  Hw.Tray.Api.Form.Padrao in 'hw.tray\Hw.Tray.Api.Form.Padrao.pas' {FrmTrayPadrao},
  Hw.Tray.Api.ProductKit in 'hw.tray\Hw.Tray.Api.ProductKit.pas',
  marca_prod_ec_class in '..\..\Ativos\fonte\marca_prod_ec_class.pas',
  PrintTermicUseCase in 'hw.api.cloud.dotnet.4.5\UseCases\PrintTermicUseCase.pas',
  UseCaseBaseIntegra in 'hw.integra.api\Base\UseCaseBaseIntegra.pas',
  RepoIntegraHW in 'hw.integra.api\Services\RepoIntegraHW.pas',
  UsuarioClienteEtd in 'hw.integra.api\Entities\UsuarioClienteEtd.pas',
  ApiIntegraBase in 'hw.integra.api\Base\ApiIntegraBase.pas',
  SendUsersUseCase in 'hw.integra.api\UseCases\SendUsersUseCase.pas',
  ApiIntegra in 'hw.integra.api\Services\ApiIntegra.pas',
  SendStatistcsUseCase in 'hw.integra.api\UseCases\SendStatistcsUseCase.pas',
  EstatisticaEtd in 'hw.integra.api\Entities\EstatisticaEtd.pas',
  IncStatisticsUseCase in 'hw.integra.api\UseCases\IncStatisticsUseCase.pas',
  AddUserStatisticsUseCase in 'hw.integra.api\UseCases\AddUserStatisticsUseCase.pas',
  BaseApiAO in 'assineon\Base\BaseApiAO.pas',
  AssineonRepo in 'assineon\Repositories\AssineonRepo.pas',
  ApiAssineOn in 'assineon\Repositories\ApiAssineOn.pas',
  frmConfAssineOn in 'assineon\Views\frmConfAssineOn.pas' {formConfAssineOn},
  BaseSingleton in 'Shared\BaseSingleton.pas',
  ConfigureAssineOnUseCase in 'assineon\UseCases\ConfigureAssineOnUseCase.pas',
  BaseUseCaseAO in 'assineon\Base\BaseUseCaseAO.pas',
  BaseConsts in 'Shared\BaseConsts.pas',
  assineon.export in 'assineon\assineon.export.pas',
  AccountModel in 'assineon\Models\AccountModel.pas',
  TemplateModel in 'assineon\Models\TemplateModel.pas',
  ConfigurationModel in 'assineon\Models\ConfigurationModel.pas',
  ao_revisions_tags_class in '..\..\Ativos\fonte\ao_revisions_tags_class.pas',
  TablesModel in 'Shared\TablesModel.pas',
  ServiceUrgencySincUseCase in 'hw.api.cloud\UseCases\ServiceUrgencySincUseCase.pas',
  DocumentsModel in 'assineon\Models\DocumentsModel.pas',
  frmTermosPessoa in 'assineon\Views\frmTermosPessoa.pas' {formTermosPessoa},
  ShowDocumentsPessoaUseCase in 'assineon\UseCases\ShowDocumentsPessoaUseCase.pas',
  BaseApiRenave in 'renave\Base\BaseApiRenave.pas',
  SolicitacaoEntradaEstoqueZeroModel in 'renave\Models\SolicitacaoEntradaEstoqueZeroModel.pas',
  renave.export in 'renave\renave.export.pas',
  UseCaseSelectCertificate in 'renave\UseCases\UseCaseSelectCertificate.pas',
  BaseUseCaseRenave in 'renave\Base\BaseUseCaseRenave.pas',
  ApiRenave in 'renave\Repositories\ApiRenave.pas',
  RenaveRepo in 'renave\Repositories\RenaveRepo.pas',
  frmSelectCertificate in 'renave\Views\frmSelectCertificate.pas' {formSelectCertificate},
  ClienteAutenticadoModel in 'renave\Models\ClienteAutenticadoModel.pas',
  CertificadoModel in 'renave\Models\CertificadoModel.pas',
  frmVeiculosZeroPendentes in 'renave\Views\frmVeiculosZeroPendentes.pas' {formVeiculosZeroPendentes},
  VeiculoZeroKmPendenteEntradaEstoqueModel in 'renave\Models\VeiculoZeroKmPendenteEntradaEstoqueModel.pas',
  UseCaseVeiculosZeroPendentes in 'renave\UseCases\UseCaseVeiculosZeroPendentes.pas',
  VeiculoEstoqueModel in 'renave\Models\VeiculoEstoqueModel.pas',
  frmVeiculosZeroEntradaEstoque in 'renave\Views\frmVeiculosZeroEntradaEstoque.pas' {formVeiculosZeroEntradaEstoque},
  rnv_estoque_canc_class in '..\..\Ativos\fonte\rnv_estoque_canc_class.pas',
  rnv_estoque_class in '..\..\Ativos\fonte\rnv_estoque_class.pas',
  rnv_estoque_entrada_class in '..\..\Ativos\fonte\rnv_estoque_entrada_class.pas',
  rnv_estoque_restr_class in '..\..\Ativos\fonte\rnv_estoque_restr_class.pas',
  rnv_estoque_saida_canc_class in '..\..\Ativos\fonte\rnv_estoque_saida_canc_class.pas',
  rnv_estoque_saida_class in '..\..\Ativos\fonte\rnv_estoque_saida_class.pas',
  rnv_estoque_saida_cmp_class in '..\..\Ativos\fonte\rnv_estoque_saida_cmp_class.pas',
  UseCaseEntrarComEstoqueZero in 'renave\UseCases\UseCaseEntrarComEstoqueZero.pas',
  frmInformarDadosHodometro in 'renave\Views\frmInformarDadosHodometro.pas' {formInformarDadosHodometro},
  VeiculoDadosHodometroModel in 'renave\Models\hw\VeiculoDadosHodometroModel.pas',
  SolicitacaoSaidaEstoqueZeroModel in 'renave\Models\SolicitacaoSaidaEstoqueZeroModel.pas',
  MunicipioRenaveModel in 'renave\Models\MunicipioRenaveModel.pas',
  rnv_municipio_class in '..\..\Ativos\fonte\rnv_municipio_class.pas',
  PdfAtpvModel in 'renave\Models\PdfAtpvModel.pas',
  SolicitacaoCancelamentoEntradaZeroKmModel in 'renave\Models\SolicitacaoCancelamentoEntradaZeroKmModel.pas',
  SolicitacaoCancelamentoSaidaZeroKmModel in 'renave\Models\SolicitacaoCancelamentoSaidaZeroKmModel.pas',
  SolicitacaoDevolucaoMontadoraZeroKmModel in 'renave\Models\SolicitacaoDevolucaoMontadoraZeroKmModel.pas',
  frmSolicitacaoDevolucaoMontadoraVeiculoZero in 'renave\Views\frmSolicitacaoDevolucaoMontadoraVeiculoZero.pas' {formSolicitacaoDevolucaoMontadoraVeiculoZero},
  SolicitacaoRejeicaoZeroKmModel in 'renave\Models\SolicitacaoRejeicaoZeroKmModel.pas',
  BaseApiPlugBoleto in 'plugboleto\Base\BaseApiPlugBoleto.pas',
  BaseUseCasePlugBoleto in 'plugboleto\Base\BaseUseCasePlugBoleto.pas',
  PlugBoletoRepo in 'plugboleto\Repositories\PlugBoletoRepo.pas',
  ApiPlugBoleto in 'plugboleto\Repositories\ApiPlugBoleto.pas',
  Types_OOP in '..\..\Ativos\fonte\Types_OOP.pas',
  Query_OOP in '..\..\Ativos\fonte\Query_OOP.pas',
  PlugBoletoModels in 'plugboleto\Models\PlugBoletoModels.pas',
  BoletoResponseModels in 'plugboleto\Models\BoletoResponseModels.pas',
  UseCaseEmitirBoletos in 'plugboleto\UseCase\UseCaseEmitirBoletos.pas',
  plugboleto.export in 'plugboleto\plugboleto.export.pas',
  UseCaseConsultaBoletoIntegrado in 'plugboleto\UseCase\UseCaseConsultaBoletoIntegrado.pas',
  UseCaseGerarRemessa in 'plugboleto\UseCase\UseCaseGerarRemessa.pas',
  UseCaseDescartarBoletos in 'plugboleto\UseCase\UseCaseDescartarBoletos.pas',
  UseCaseImprimirBoleto in 'plugboleto\UseCase\UseCaseImprimirBoleto.pas',
  UseCaseUploadArquivoRetorno in 'plugboleto\UseCase\UseCaseUploadArquivoRetorno.pas',
  hw_boleto_utils in '..\..\Ativos\fonte\hw_boleto_utils.pas' {formPreviewBoleto},
  superobject in 'plugboleto\Base\superobject.pas',
  UseCaseCedente in 'plugboleto\UseCase\UseCaseCedente.pas',
  UseCaseConta in 'plugboleto\UseCase\UseCaseConta.pas',
  UseCaseConvenio in 'plugboleto\UseCase\UseCaseConvenio.pas',
  tipo_grade_ec_class in '..\..\Ativos\fonte\tipo_grade_ec_class.pas',
  PrintPdfUseCase in 'hw.api.cloud.dotnet.4.5\UseCases\PrintPdfUseCase.pas',
  uClassesKentroAPI in 'kentro.api\uClassesKentroAPI.pas',
  uMensagemKentroAPI in 'kentro.api\uMensagemKentroAPI.pas' {frmMensagemKentroAPI},
  UseCaseEnviarMensagem in 'kentro.api\UseCase\UseCaseEnviarMensagem.pas',
  UseCaseEnviarArquivo in 'kentro.api\UseCase\UseCaseEnviarArquivo.pas',
  KentroModels in 'kentro.api\Models\KentroModels.pas',
  KentroRepo in 'kentro.api\Repositories\KentroRepo.pas',
  BaseUseCaseKentro in 'kentro.api\Base\BaseUseCaseKentro.pas',
  ApiKentro in 'kentro.api\Repositories\ApiKentro.pas',
  BaseApiKentro in 'kentro.api\Base\BaseApiKentro.pas',
  KentroResponseModels in 'kentro.api\Models\KentroResponseModels.pas',
  UseCaseEnviarMensagemArquivo in 'kentro.api\UseCase\UseCaseEnviarMensagemArquivo.pas',
  UseCaseDownloadBoletoViaUrl in 'plugboleto\UseCase\UseCaseDownloadBoletoViaUrl.pas',
  hw_const_types in '..\..\Ativos\fonte\hw_const_types.pas',
  hw_graphics_utils in '..\..\Ativos\fonte\hw_graphics_utils.pas',
  MyShellApi in '..\..\Ativos\fonte\MyShellApi.pas',
  config_colunas_class in '..\..\Ativos\fonte\config_colunas_class.pas',
  brasilapi.export in 'brasil.api\brasilapi.export.pas',
  PessoaJuridica in 'brasil.api\Models\PessoaJuridica.pas',
  GetPessoaJuridica in 'brasil.api\UsesCases\GetPessoaJuridica.pas',
  BrasilApi.Client in 'brasil.api\Base\BrasilApi.Client.pas',
  uClassesNummusAPI in 'nummus\uClassesNummusAPI.pas',
  UseCaseConsultarSaldoCliente in 'nummus\UseCase\UseCaseConsultarSaldoCliente.pas',
  Nummus.Client in 'nummus\Base\Nummus.Client.pas',
  NummusRepo in 'nummus\Repositories\NummusRepo.pas',
  UseCaseSimularResgateCliente in 'nummus\UseCase\UseCaseSimularResgateCliente.pas',
  NummusResponseModels in 'nummus\Models\NummusResponseModels.pas',
  hw_win_utils in '..\..\Ativos\fonte\hw_win_utils.pas',
  SuzukiRepo in 'Suzuki\Repositories\SuzukiRepo.pas',
  ApiSuzuki in 'Suzuki\Repositories\ApiSuzuki.pas',
  BaseApiSuzuki in 'Suzuki\Base\BaseApiSuzuki.pas',
  SuzukiResponseModels in 'Suzuki\Models\SuzukiResponseModels.pas',
  suzuki.export in 'Suzuki\suzuki.export.pas',
  UseCaseVendaVeiculos in 'Suzuki\UseCase\UseCaseVendaVeiculos.pas',
  BaseUseCaseSuzuki in 'Suzuki\Base\BaseUseCaseSuzuki.pas',
  SuzukiModels in 'Suzuki\Models\SuzukiModels.pas',
  UseCaseAutenticacao in 'Suzuki\UseCase\UseCaseAutenticacao.pas',
  Neon.Core.Attributes in '..\..\lib\neon\Neon.Core.Attributes.pas',
  Neon.Core.DynamicTypes in '..\..\lib\neon\Neon.Core.DynamicTypes.pas',
  Neon.Core.Nullables in '..\..\lib\neon\Neon.Core.Nullables.pas',
  Neon.Core.Persistence.JSON in '..\..\lib\neon\Neon.Core.Persistence.JSON.pas',
  Neon.Core.Persistence.JSON.Schema in '..\..\lib\neon\Neon.Core.Persistence.JSON.Schema.pas',
  Neon.Core.Persistence in '..\..\lib\neon\Neon.Core.Persistence.pas',
  Neon.Core.Serializers.DB in '..\..\lib\neon\Neon.Core.Serializers.DB.pas',
  Neon.Core.Serializers.Nullables in '..\..\lib\neon\Neon.Core.Serializers.Nullables.pas',
  Neon.Core.Serializers.RTL in '..\..\lib\neon\Neon.Core.Serializers.RTL.pas',
  Neon.Core.Serializers.VCL in '..\..\lib\neon\Neon.Core.Serializers.VCL.pas',
  Neon.Core.Tags in '..\..\lib\neon\Neon.Core.Tags.pas',
  Neon.Core.TypeInfo in '..\..\lib\neon\Neon.Core.TypeInfo.pas',
  Neon.Core.Types in '..\..\lib\neon\Neon.Core.Types.pas',
  Neon.Core.Utils in '..\..\lib\neon\Neon.Core.Utils.pas',
  BaseApiHwCloud in 'hw.cloud\Base\BaseApiHwCloud.pas',
  BaseUseCaseHwCloud in 'hw.cloud\Base\BaseUseCaseHwCloud.pas',
  HwCloudModels in 'hw.cloud\Models\HwCloudModels.pas',
  HwCloudResponseModels in 'hw.cloud\Models\HwCloudResponseModels.pas',
  ApiHwCloud in 'hw.cloud\Repositories\ApiHwCloud.pas',
  HwCloudRepo in 'hw.cloud\Repositories\HwCloudRepo.pas',
  hwcloud.export in 'hw.cloud\hwcloud.export.pas',
  EmpresaModel in 'ModelsHW\EmpresaModel.pas',
  UsuarioSenhaModel in 'ModelsHW\UsuarioSenhaModel.pas',
  BoletoModel in 'ModelsHW\BoletoModel.pas',
  ClienteModel in 'ModelsHW\ClienteModel.pas',
  ConfigApiModel in 'ModelsHW\ConfigApiModel.pas',
  ContatoPlataformaModel in 'ModelsHW\ContatoPlataformaModel.pas',
  UseCaseCadMensageriaComTemplateComAnexo in 'hw.cloud\UseCase\UseCaseCadMensageriaComTemplateComAnexo.pas',
  UseCaseCadMensageriaComTemplateSemAnexo in 'hw.cloud\UseCase\UseCaseCadMensageriaComTemplateSemAnexo.pas',
  UseCaseCadMensageriaSemTemplateSemAnexo in 'hw.cloud\UseCase\UseCaseCadMensageriaSemTemplateSemAnexo.pas',
  UseCaseCadPessoa in 'hw.cloud\UseCase\UseCaseCadPessoa.pas',
  UseCaseCadEmpresa in 'hw.cloud\UseCase\UseCaseCadEmpresa.pas',
  UseCaseCadContato in 'hw.cloud\UseCase\UseCaseCadContato.pas',
  UseCaseBuscarCustos in 'hw.cloud\UseCase\UseCaseBuscarCustos.pas',
  UseCaseCadUsuarioSenha in 'hw.cloud\UseCase\UseCaseCadUsuarioSenha.pas',
  UseCaseBuscarConfig in 'hw.cloud\UseCase\UseCaseBuscarConfig.pas',
  UseCaseLerMensageria in 'hw.cloud\UseCase\UseCaseLerMensageria.pas',
  UseCaseCadMensageriaSemTemplateComAnexo in 'hw.cloud\UseCase\UseCaseCadMensageriaSemTemplateComAnexo.pas',
  UseCaseUpdateMensageria in 'hw.cloud\UseCase\UseCaseUpdateMensageria.pas',
  UseCaseEnvMensageria in 'hw.cloud\UseCase\UseCaseEnvMensageria.pas',
  UseCaseCadMensageria in 'hw.cloud\UseCase\UseCaseCadMensageria.pas',
  USock in '..\..\lib\sock\USock.pas',
  uClasseTagMacro in '..\..\Ativos\fonte\uClasseTagMacro.pas',
  hw_jsondx in '..\..\Ativos\fonte\hw_jsondx.pas';

{$R *.res}

var
  LastError: string;

function hw_enviar_estatisticas( Banco, Usuario, Senha: WideString; CodEmpresa: Integer): Integer; stdcall; // Retorna a quantidade pendente
var
  Sts: THW_Estatisticas;
begin
  try
    Result := 1;
    if CodEmpresa = 1 then
    begin

    Sts := THW_Estatisticas.create;
    try
      Sts.DataBaseName  := string(Banco);
      Sts.UserName := string(Usuario);
      Sts.PassWord := string(Senha);
      Sts.CodEmpresa := CodEmpresa;

      Result := Sts.EnviarEstatiticasWSHW;

    finally
      FreeAndNil(Sts);
    end;
    end
    else
      Exit;
  except
    Result := 0;
  end;
end;

//function hw_api_chamados( Banco, Usuario, Senha: WideString; CodEmpresa: Integer): Integer; stdcall; // Retorna a quantidade pendente
//begin
//
//end;

function hw_ibpt_produtos_get( Banco, Usuario, Senha: WideString; CodEmpresa: Integer;
  cnpj, ncm, uf: WideString; ex: Integer): Integer; stdcall;
var
  ibpt: THW_IBPT;
begin
  try
    ibpt := THW_IBPT.create;
    try
      ibpt.DataBaseName  := string(Banco);
      ibpt.UserName := string(Usuario);
      ibpt.PassWord := string(Senha);
      ibpt.CodEmpresa := CodEmpresa;

      ibpt.Produto.cnpj := string(cnpj);
      ibpt.Produto.ncm := string(ncm);
      ibpt.Produto.uf := string(uf);
      ibpt.Produto.ex := ex;

      if ibpt.ConsultaIBPTporNCM then
        Result := 1
      else
        Result := 0;

    finally
      FreeAndNil(ibpt);
    end;
  except
    Result := 0;
  end;
end;

{function ExtractToken(var AText: string): string; //recebe todo o texto, remove o token do texto e retorna
begin
  if (Pos('<token>', AText) = 1) and (Pos('<token/>', AText) > 8)  then
  begin
//    TStringList.Create().AddPair('comtag', AText).SaveToFile('d:\comtag.txt');
    Result := Copy(AText, 8, Pos('<token/>', AText) - 8);
//    TStringList.Create().AddPair('comtag', Result).SaveToFile('d:\semtag.txt');

    AText := Copy(AText, Pos('<token/>', AText) + 8, Length(AText));
  end
  else
    Result := '';
end;}

function hw_central_suporte( AEmail, AColaborador, ACnpj, AToken: WideString): WideString; stdcall; // Retorna o json do usuario e abre o navegador
var
  ACentralSuporte: THW_CentralSuporte;
  Atoken_: string;
begin
  try
    Result := '';
    Atoken_ := string(AToken);
    ACentralSuporte := THW_CentralSuporte.create(string(AEmail), string(AColaborador), string(ACnpj), THwUtilsClass.ExtractTagXML('token', Atoken_));

    Application.CreateForm(TfrmUtilsCentralAcoes, frmUtilsCentralAcoes);
  Application.CreateForm(TfrmLogView, frmLogView);
  Application.CreateForm(TFrmNuvemshopCadastros, FrmNuvemshopCadastros);
  Application.CreateForm(TFrmNuvemshopPadrao, FrmNuvemshopPadrao);
  Application.CreateForm(TFrmTrayPadrao, FrmTrayPadrao);
  Application.CreateForm(TformConfAssineOn, formConfAssineOn);
  Application.CreateForm(TformTermosPessoa, formTermosPessoa);
  Application.CreateForm(TformSelectCertificate, formSelectCertificate);
  Application.CreateForm(TformVeiculosZeroPendentes, formVeiculosZeroPendentes);
  Application.CreateForm(TformVeiculosZeroEntradaEstoque, formVeiculosZeroEntradaEstoque);
  Application.CreateForm(TformInformarDadosHodometro, formInformarDadosHodometro);
  Application.CreateForm(TformSolicitacaoDevolucaoMontadoraVeiculoZero, formSolicitacaoDevolucaoMontadoraVeiculoZero);
  Application.CreateForm(TformPreviewBoleto, formPreviewBoleto);
  try
      frmUtilsCentralAcoes.centralSuporte := THW_CentralSuporte(ACentralSuporte);
      frmUtilsCentralAcoes.ShowModal;
      Exit(
        WideString(THwUtilsClass.AddTagXML('token', THwUtilsClass.EncodeASCIIBase64(ACentralSuporte.resposta.ToJsonStringEncode)))
      );
    finally
      FreeAndNil(frmUtilsCentralAcoes);
      FreeAndNil(ACentralSuporte);
    end;

  except
    Result := '';
  end;
end;

function hw_central_suporte_notificar_abrir( AEmail, ACnpj: WideString): WideString; stdcall; // Retorna a lista de mensagens para notificar
var
  ACentralNotificacaoDB: TCentralNotificacoesDB_ERP;
  Anotificacoes_db: TArray<TNotificacoesNaoLidas>;
begin
  try
    ACentralNotificacaoDB := TCentralNotificacoesDB_ERP.create(ACnpj, AEmail);

    if not ACentralNotificacaoDB.conectar(False) then
      Exit;

    if not ACentralNotificacaoDB.db_getNotificacoesnNaoLidasERP(Anotificacoes_db) then
      Result := ACentralNotificacaoDB.LastError;

    if Length(Anotificacoes_db) <= 0 then
      Exit;

    Application.CreateForm(TfrmUtilsNotificacoesDB, frmUtilsNotificacoesDB);
    try
      frmUtilsNotificacoesDB.centralNotificacaoDB := ACentralNotificacaoDB;
      frmUtilsNotificacoesDB.notificacoes         := Anotificacoes_db;
      frmUtilsNotificacoesDB.ShowModal;
    finally
      FreeAndNil(frmUtilsNotificacoesDB);
    end;

  finally
    ACentralNotificacaoDB.desconectar;
    FreeAndNil(ACentralNotificacaoDB);
  end;
end;

procedure hw_notificacao_backup(banco: WideString; empresa: Integer; usuario: WideString;
  titulo: WideString; header: WideString; mensagem: WideString); stdcall;
var
  AVerificarBakup: TVerificarBakup;
  AcentralSuporte: THW_CentralSuporte;
  dataAtual: TDateTime;
  dataultbackup: TDateTime;
  vmensagem: string;
begin
  try
    AVerificarBakup := TVerificarBakup.create;

    AVerificarBakup.DataBasePath := Banco;
    AVerificarBakup.CodEmpresa := empresa;
    if not AVerificarBakup.conectar(AVerificarBakup.DataBasePath, True) then
      Exit;

    vmensagem := '';
    if not AVerificarBakup.verificarNotificacaoBackupERP(empresa, usuario, dataAtual, dataultbackup, vmensagem) then
      Exit;

    vmensagem := vmensagem + mensagem;

    vmensagem := StringReplace(vmensagem, '*|*', '"', [rfReplaceAll]);

    try
      AcentralSuporte := THW_CentralSuporte.create('', '', '', '');

      if not AcentralSuporte.NotificacaoCriarBackup(
        titulo,
        header,
        vmensagem) then
      begin
        Exit;
      end;

    finally
      FreeAndNil(AcentralSuporte);
    end;
  finally
    AVerificarBakup.desconectar;
    FreeAndNil(AVerificarBakup);
  end;
end;

procedure hw_verificar_backup(banco: WideString; empresa: Integer; usuario: WideString); stdcall; // Retorna a lista de mensagens para notificar
var
  AVerificarBakup: TVerificarBakup;
  AcentralSuporte: THW_CentralSuporte;
  dataAtual: TDateTime;
  dataultbackup: TDateTime;
  mensagem: string;
begin
  try
    AVerificarBakup := TVerificarBakup.create;

    AVerificarBakup.DataBasePath := Banco;
    AVerificarBakup.CodEmpresa := empresa;
    if not AVerificarBakup.conectar(AVerificarBakup.DataBasePath, True) then
      Exit;

    if not AVerificarBakup.dataVerificacaoNotificacaoBackup then
      Exit;

    if not AVerificarBakup.atualizarDataVerificacaoBackup(TiSetarData) then
      Exit;

    mensagem := '';
    if not AVerificarBakup.verificarNotificacaoBackupERP(empresa, usuario, dataAtual, dataultbackup, mensagem) then
    begin
      AVerificarBakup.atualizarDataVerificacaoBackup(TiRetirarData);
      Exit;
    end;

    try
      AcentralSuporte := THW_CentralSuporte.create('', '', '', '');

      if not AcentralSuporte.NotificacaoCriarBackup(
        'BACKUP NÃO REALIZADO HÁ ' + IntToStr(Trunc(dataAtual) - Trunc(dataultbackup)) + ' DIAS',
        'BACKUP NÃO REALIZADO HÁ ' + IntToStr(Trunc(dataAtual) - Trunc(dataultbackup)) + ' DIAS',
        mensagem) then
      begin
        AVerificarBakup.atualizarDataVerificacaoBackup(TiRetirarData);
        Exit;
      end;
    finally
      FreeAndNil(AcentralSuporte);
    end;

    if not AVerificarBakup.atualizarDataNotificacaoBackup then
      Exit;
  finally
    AVerificarBakup.desconectar;
    FreeAndNil(AVerificarBakup);
  end;
end;


{
function hw_central_suporte_notificar_erp( ACnpj, AToken: WideString): WideString; stdcall; // Retorna a lista de mensagens para notificar
var
  ACentralSuporte: THW_CentralSuporte;
  ATextOut: string;
  Atoken_: string;
begin
  try
    Result := '';
    Atoken_ := string(AToken);
    ACentralSuporte := THW_CentralSuporte.create('', '*@EMPRESA@*', string(ACnpj), THwUtilsClass.ExtractTagXML('token', Atoken_));
//    ATextOut := TStringList.Create;
    try
      ATextOut := ACentralSuporte.NotificacaoNotificarERP;
      Exit(
        WideString(
          THwUtilsClass.AddTagXML('token', THwUtilsClass.EncodeASCIIBase64(ACentralSuporte.resposta.ToJsonStringEncode) ) +
          ATextOut
        )
      );

    finally
      FreeAndNil(ACentralSuporte);
    end;

  except
    Result := 'ERRO';
  end;
end;
}
function hw_central_suporte_verificar_notificacoes_erp(ACnpj: WideString): WideString; stdcall; // Verifica todas as notificacoes não lidas do cnpj
var
  AnotificaoERP: TCentralNotificacoesDB_ERP;
begin
  try
    AnotificaoERP := TCentralNotificacoesDB_ERP.create(string(ACnpj));

    AnotificaoERP.verificarNotificacoesNaApi;

  finally
    FreeAndNil(AnotificaoERP);
  end;
end;

function calcularpontosProgFid(Aparametros: TCalculoParametros; var Ajsonretorno: WideString): TCalculo; stdcall;
begin
  Result := TCalculo.Create;
  try

    Result.parametros := Aparametros.Clone;

//    Result.Calculado := Result.Calcular;

//    Ajsonretorno := TJson.ObjectToJsonString(Result, []);
    Ajsonretorno := TJson.Format(TJson.ObjectToJsonObject(Result, []));

  finally
    Result := Result;
  end;
end;

function getDadosPontuacaoProgFid(Ajson: WideString): TCalculo; stdcall;
begin
  try
    Result := TJson.JsonToObject<TCalculo>(string(Ajson), []);
  except
    Result := nil;
  end;
end;

procedure hw_integra_fin_consultadiaria(banco: WideString; empresas: array of Integer); stdcall;
var
  servico: THwIntegraServicosFinanceiro;
  I: Integer;
begin
  servico := THwIntegraServicosFinanceiro.Create(True);
  try
    servico.DataBasePath := Banco;
    for I := Low(empresas) to High(empresas) do
    begin
      servico.CodEmpresa := empresas[I];
      servico.FinanceiroService_ConsultaDiaria;
    end;
  finally
    servico.Free;
  end;
end;

procedure hw_integra_fin_show_creditos_abertos(banco: WideString; empresas: array of Integer; usuario: Integer); stdcall;
var
  servico: THwIntegraServicosFinanceiro;
  emps: TArray<Integer>;
  I: Integer;
begin
  if Length(empresas) <= 0 then
    Exit;

  SetLength(emps, Length(Empresas));
  for I := Low(empresas) to High(empresas) do
    emps[I] := empresas[I];

  servico := THwIntegraServicosFinanceiro.Create(False);
  try
    servico.CodEmpresa := empresas[Low(empresas)];
    servico.DataBasePath := Banco;
    servico.FinanceiroService_ShowCreditosEmAberto(emps, usuario);
  finally
    servico.Free;
  end;
end;

procedure hw_integra_fin_documentos_em_aberto(banco: WideString; empresas: array of Integer;
  email: WideString; usuarioFinanceiro: Boolean; var dadosnotificacao: WideString); stdcall;
var
  servico: THwIntegraServicosFinanceiro;
  dados: string;
  emps: TArray<Integer>;
  I: Integer;
begin
  if Length(empresas) <= 0 then
    Exit;

  SetLength(emps, Length(Empresas));
  for I := Low(empresas) to High(empresas) do
    emps[I] := empresas[I];

  servico := THwIntegraServicosFinanceiro.Create(True);
  try
    servico.CodEmpresa := empresas[Low(empresas)];
    servico.DataBasePath := banco;

    servico.FinanceiroService_QtdeDocumentosVencidos(email, usuarioFinanceiro, dados, emps);

    dadosnotificacao := dados;

  finally
    servico.Free;
  end;
end;

procedure hw_integra_anexoxv_consultaragora(banco: WideString; empresa: Integer); stdcall;
var
  servico: TAnexoXVServico;
begin
  servico := TAnexoXVServico.Create(False);
  try
    servico.DataBasePath := Banco;
    servico.CodEmpresa   := empresa;
    servico.ConsultarAgora();
  finally
    servico.Free;
  end;
end;

procedure hw_integra_anexoxv_consultadiaria(banco: WideString; empresa: Integer); stdcall;
var
  servico: TAnexoXVServico;
begin
  servico := TAnexoXVServico.Create(True);
  try
    servico.DataBasePath := Banco;
    servico.CodEmpresa   := empresa;
    servico.ConsultaDiaria;
  finally
    servico.Free;
  end;
end;

procedure hw_integra_gs1prefix_consultaragora(banco: WideString; empresa: Integer); stdcall;
var
  servico: TGS1Servico;
begin
  servico := TGS1Servico.Create(False);
  try
    servico.DataBasePath := Banco;
    servico.CodEmpresa   := empresa;
    servico.ConsultarAgora;
  finally
    servico.Free;
  end;
end;

procedure hw_integra_gs1prefix_consultadiaria(banco: WideString; empresa: Integer); stdcall;
var
  servico: TGS1Servico;
begin
  servico := TGS1Servico.Create(True);
  try
    servico.DataBasePath := Banco;
    servico.CodEmpresa   := empresa;
    servico.ConsultaDiaria;
  finally
    servico.Free;
  end;
end;

procedure hw_integra_default_consultadiaria(banco: WideString; empresa: Integer); stdcall;
begin

  var params := Format(';databasename=%s;empresaId=%d;silent=true', [string(banco), empresa]);

  var sendUsers:= TSendUsersUseCase.Create(params);
  try
    sendUsers.Run;
  finally
    sendUsers.Free;
  end;

  var sendStatistics := TSendStatistcsUseCase.Create(params);
  try
    sendStatistics.Run;
  finally
    sendStatistics.Free;
  end;
end;

function hw_integra_estatistica_inc(banco, descricao: WideString; empresa: Integer): Integer; stdcall;
begin
  var params := Format(';databasename=%s;empresaId=%d;silent=true', [string(banco), empresa]);

  var useCase := TIncStatistcsUseCase.Create(params);
  try
    Result := useCase.Run(descricao);
  finally
    useCase.Free;
  end;
end;

procedure hw_integra_estatistica_user(banco, userHW: WideString; empresa: Integer); stdcall;
begin
  var params := Format(';databasename=%s;empresaId=%d;silent=true', [string(banco), empresa]);

  var useCase:= TAddUserStatistcsUseCase.Create(params);
  try
    useCase.Run(string(userHW));
  finally
    useCase.Free;
  end;
end;

procedure hw_comercio_produto_enviar(banco: WideString; codempresa, grupoprod: Integer; codprod: WideString; codgrade: Integer); stdcall;
var
  comercio: THwComercioServicos;
begin
  comercio := THwComercioServicos.Create(False);
  try
    comercio.CodEmpresa := codempresa;
    comercio.DataBasePath := banco;

    comercio.Comercio_ProdutoEnviar(False, grupoprod, codprod, codgrade);

  finally
    comercio.Free;
  end;
end;

procedure hw_comercio_consulta_periodica(banco: WideString; codempresa: Integer); stdcall;
var
  comercio: THwComercioServicos;
begin
  comercio := THwComercioServicos.Create(True);
  try
    comercio.CodEmpresa := codempresa;
    comercio.DataBasePath := banco;

    comercio.Comercio_ProdutoEnviar(True);

  finally
    comercio.Free;
  end;
end;

procedure hw_recriarView(banco: WideString; codempresa: Integer); stdcall;
var
  script: THwScript;
begin
  script := THwScript.Create;
  try
    script.HwRecriarView(banco, codempresa);
  finally
    script.Free;
  end;
end;

procedure hw_atualizarHistoricoProd(banco: WideString; codempresa: Integer); stdcall;
var
  vHistoricoProd: THwHistoricoProd;
begin
  vHistoricoProd := THwHistoricoProd.Create;
  try
    vHistoricoProd.HwCorrigirHistProd(banco, codempresa);
  finally
    vHistoricoProd.Free;
  end;
end;

procedure hw_comercio_consultar_notificacoes(banco: WideString; codempresa, codusuario: Integer;
  var dadosnotificacao: WideString); stdcall;
var
  comercio: THwComercioServicos;
  dados: string;
begin
  comercio := THwComercioServicos.Create(False);
  try
    comercio.CodEmpresa := codempresa;
    comercio.DataBasePath := banco;

    comercio.Comercio_Notificacoes(codusuario, dados);

    dadosnotificacao := dados;

  finally
    comercio.Free;
  end;
end;

procedure hw_tray_show_vinculos(banco, usuario: WideString; codempresa: Integer); stdcall;
begin
  Application.CreateForm(TFrmTrayCadastros, FrmTrayCadastros);
  FrmTrayCadastros.DataBasePath := banco;
  FrmTrayCadastros.CodEmpresa := codempresa;
  FrmTrayCadastros.Usuario := usuario;
  FrmTrayCadastros.ShowModal;
end;

procedure hw_nuvemshop_show_vinculos(banco, usuario: WideString; codempresa: Integer); stdcall;
begin
  Application.CreateForm(TFrmNuvemshopCadastros, FrmNuvemshopCadastros);
  FrmNuvemshopCadastros.DataBasePath := banco;
  FrmNuvemshopCadastros.CodEmpresa := codempresa;
  FrmNuvemshopCadastros.Usuario := usuario;
  FrmNuvemshopCadastros.ShowModal;
end;

procedure hw_nbackup(banco: WideString; params: WideString); stdcall;
var
  nbkp: THw_NBACKUP;
begin
  nbkp := THw_NBACKUP.Create;
  try
    nbkp.Executar(banco, params);
  finally
    nbkp.Free;
  end;
end;

function hw_cep_consultar(banco, cep: WideString): Boolean; stdcall;
var
  CepHw: THwCEPApi;
begin
  CepHw := THwCEPApi.Create;
  try

    CepHw.DataBase := banco;

    Result := CepHw.ConsultaCEP(cep);

    LastError := CepHw.LastError;
  finally
    CepHw.Free;
  end;
end;

function hw_utils_lasterror(): Widestring; stdcall;
begin
  Result := LastError;
end;

function nummus_consultar_saldo_cliente (
  banco: WideString;
  DadosNummus: WideString;
  CodCliente: Integer;
  CodEmpresa: Integer): Double; stdcall;
var
  nummusAPI: TNummusAPI;
begin
  Result := 0;
  try
    nummusAPI := TNummusAPI.Create(False);

    try
      nummusAPI.CodEmpresa := CodEmpresa;
      nummusAPI.DataBasePath := banco;
      nummusAPI.DataBaseNummus := DadosNummus;

      Result := nummusAPI.ConsultarSaldoCliente(CodCliente, CodEmpresa, DadosNummus, True);
    except on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao consultar saldo acumulado do cliente. Erro: ' + e.Message),'Atenção' , 0 + 64);
        Result := 0;
      end;
    end;
  finally
    if Assigned(nummusAPI) then
      FreeAndNil(nummusAPI);
  end;
end;

function nummus_simular_resgate_cliente (
  banco: WideString;
  DadosNummus: WideString;
  CodCliente: Integer;
  CodEmpresa: Integer;
  ValorCompra: Double): Double; stdcall;
var
  nummusAPI: TNummusAPI;
begin
  Result := 0;
  try
    nummusAPI := TNummusAPI.Create(False);

    try
      nummusAPI.CodEmpresa := CodEmpresa;
      nummusAPI.DataBasePath := banco;
      nummusAPI.DataBaseNummus := DadosNummus;

      Result := nummusAPI.SimularResgateCliente(CodCliente, CodEmpresa, ValorCompra, DadosNummus, True);
    except on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao consultar saldo disponível do ciente (simular resgate). Erro: ' + e.Message),'Atenção' , 0 + 64);
        Result := 0;
      end;
    end;
  finally
    if Assigned(nummusAPI) then
      FreeAndNil(nummusAPI);
  end;
end;

function kentro_enviar_mensagem(
  banco: WideString;
  DadosKentro: WideString;
  NumDoc: Integer;
  TipoDoc: WideString;
  CodEmpresa: Integer;
  Mensagem: WideString;
  ListaProdutos: WideString;
  ListaImagem: WideString): Boolean; stdcall;
var
  kentroAPI: TKentroAPI;
begin
  try
    try
      kentroAPI := TKentroAPI.Create(False);

      kentroAPI.CodEmpresa := CodEmpresa;
      kentroAPI.DataBasePath := banco;
      kentroAPI.DataBaseKentro := DadosKentro;

      kentroAPI.AbrirMensagem(NumDoc, TipoDoc, Mensagem, ListaProdutos, ListaImagem, True);
    except on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao enviar mensagens (kentro). Erro: ' + e.Message),'Atenção' , 0 + 64);
      end;
    end;
  finally
    kentroAPI.Free;
  end;
end;

function kentro_enviar_mensagem_avulsa(
  banco: WideString;
  DadosKentro: WideString;
  CodEmpresa: Integer;
  Fone: WideString;
  Mensagem: WideString;
  Arquivo: WideString): Boolean; stdcall;
var
  kentroAPI: TKentroAPI;
  paramsList: WideString;
begin
  Result := False;
  try
    try
      kentroAPI := TKentroAPI.Create(False);
      kentroAPI.CodEmpresa := CodEmpresa;
      kentroAPI.DataBasePath := banco;

      paramsList :=
          Format(';databaseName=%s;empresaid=%s;silent=true;userHw=HW;userLevel=10',
            [banco, IntToStr(CodEmpresa)]);

      if (trim(Mensagem) <> '') and (trim(Arquivo) <> '') then
      begin
        var useCase := TUseCaseEnviarMensagemArquivo.Create(paramsList);
        try
          if not useCase.Run(CodEmpresa, '55' + trim(Fone), trim(Mensagem), trim(Arquivo)) then
            exit;
        finally
          useCase.Free;
        end;

//        kentroAPI.IncluirMensagemBD(
//          trim(Fone),
//          trim(Mensagem),
//          '',
//          0,
//          '');
//
//        kentroAPI.IncluirMensagemBD(
//          trim(Fone),
//          trim(Mensagem),
//          ExtractFileName(trim(Arquivo)),
//          ExtractFileName(trim(Arquivo),
//          '');
      end
      else if (trim(Arquivo) <> '') then
      begin
        var useCase := TUseCaseEnviarArquivo.Create(paramsList);
        try
          if not useCase.Run(CodEmpresa, '55' + trim(Fone), trim(Arquivo)) then
            exit;
        finally
          useCase.Free;
        end;

//        kentroAPI.IncluirMensagemBD(
//          trim(Fone),
//          ExtractFileName(trim(Arquivo)),
//          ExtractFileName(trim(Arquivo)),
//          0,
//          '');
      end
      else if (trim(Mensagem) <> '') then
      begin
        var useCase := TUseCaseEnviarMensagem.Create(paramsList);
        try
          if not useCase.Run(CodEmpresa, '55' + trim(Fone), trim(Mensagem)) then
            exit;
        finally
          useCase.Free;
        end;

//        kentroAPI.IncluirMensagemBD(
//          trim(Fone),
//          trim(Mensagem),
//          '',
//          0,
//          '');
      end;

      Result := True;
    except on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao enviar mensagens e arquivos (kentro). Erro: ' + e.Message),'Atenção' , 0 + 64);
      end;
    end;
  finally
    kentroAPI.Free;
  end;
end;

function base64_encode_file(inputFile: WideString): WideString; stdcall;
begin
  LastError := '';
  try
    Result := Base64Helper.EncodeFile(string(inputFile));
  except on E: Exception do
    LastError := e.Message;
  end;

end;

function base64_decode_file(base64, outputFile: WideString): WideString; stdcall;
begin
  LastError := '';
  try
    Result := Base64Helper.DecodeFile(string(base64), string(outputFile));
  except on E: Exception do
    LastError := e.Message
  end;

end;

exports
  hw_enviar_estatisticas,                           // envio de estatisticas
  hw_verificar_backup,                              // verificar e notificar backup
  hw_notificacao_backup,
  hw_ibpt_produtos_get,                             // consulta de valor dos tributos ibpt
  hw_central_suporte,                               // abrir central de suporte
  hw_central_suporte_notificar_abrir,               // abrir notificacao DB
//  hw_central_suporte_notificar_erp,                 //
  hw_central_suporte_verificar_notificacoes_erp,
  hw_integra_fin_consultadiaria,
  hw_integra_fin_show_creditos_abertos,
  hw_integra_fin_documentos_em_aberto,
  hw_integra_anexoxv_consultaragora,
  hw_integra_anexoxv_consultadiaria,
  hw_integra_gs1prefix_consultaragora,
  hw_integra_gs1prefix_consultadiaria,
  hw_integra_default_consultadiaria,
  hw_integra_estatistica_inc,
  hw_integra_estatistica_user,
  hw_comercio_produto_enviar,
  hw_comercio_consulta_periodica,
  hw_comercio_consultar_notificacoes,
  hw_tray_show_vinculos,
  hw_nuvemshop_show_vinculos,
  hw_recriarView,
  hw_nbackup,
  hw_atualizarHistoricoProd,
  hw_cep_consultar,
  hw_utils_lasterror,
  nummus_consultar_saldo_cliente,
  nummus_simular_resgate_cliente,
  kentro_enviar_mensagem,
  kentro_enviar_mensagem_avulsa,
  calcularpontosProgFid,
  getDadosPontuacaoProgFid;    // hwupdate verifica notificacoes na api e salva no DB

end.
