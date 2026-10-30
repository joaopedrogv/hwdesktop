# Desenvolvimento assistido por IA no Modern

A entrada geral do projeto está em [AGENTS.md](../../../AGENTS.md), com processo,
agentes e metadata compartilhados em .ai/ na raiz do HWDESKTOP. O
[guia geral](../../../docs/ia-assistida/README.md) explica sua utilização.

Modern/AGENTS.md complementa essa entrada para o módulo. A arquitetura hexagonal,
as convenções de código, UI e testes permanecem em Modern/.ai/ e não são impostas
ao legado. A mudança de localização das orientações não refatora o ERP.

## Fontes específicas

- [Arquitetura](../../.ai/rules/architecture.md), [código](../../.ai/rules/coding-standards.md)
e [compatibilidade](../../.ai/rules/delphi-compatibility.md).
- [Banco](../../.ai/rules/database.md), [segurança](../../.ai/rules/security.md)
e [testes](../../.ai/rules/testing.md).
- [Workflow Fiscal.Calculos](../../.ai/workflows/fiscal-calculos-update.md) e
[guia do Caso Gold](caso-gold-fiscal-calculos.md).
- [Histórico do piloto fiscal](handoff-piloto-fiscal-calculos-update.md).

As Skills de entidades, metadata, validação, dataset, cadastro e testes continuam
sob Modern/.ai/skills/. Migrações gerais e encapsulamento de records estão em
.ai/skills/ na raiz. Os guias humanos são consultados somente para manutenção
documental solicitada; não substituem as fontes canônicas.

## Context

Context explica como o projeto realmente funciona quando esse conhecimento não é
óbvio apenas pela leitura de um arquivo isolado.

Exemplos:

- [arquitetura do projeto](../../.ai/context/project-architecture.md);
- [estrutura dos módulos](../../.ai/context/project-structure.md);
- [stack tecnológica](../../.ai/context/technology-stack.md);
- [sincronização e importação de dados](../../.ai/context/data-synchronization.md);
- [arquitetura de segurança](../../.ai/context/security-architecture.md);
- [autorização e auditoria](../../.ai/context/authorization-auditing.md);
- [estratégia de testes](../../.ai/context/testing-strategy.md);
- [integração da UI Modern com o legado](../../.ai/context/ui-integration.md);
- [particularidades do Fiscal.Calculos](../../.ai/context/fiscal-calculos-context.md).

Para cadastros compatíveis, o contexto de UI agora apresenta a referência de MVP
supervisionado do cadastro RedBenefPC: formulário concreto, contrato de View,
Presenter e composição na abertura da tela. A base TModernCadastroForm compartilha
feedback, FiltroGrid e SetupDataSetGrid, preservando a infraestrutura legada. As
Skills de cadastro e validação apontam esse caminho sem exigir conversão de todos
os formulários. O core continua sem dependências visuais; permissões e auditoria
permanecem na fronteira de UI estabelecida.

Um agente deve carregar somente o Context relevante. Uma tarefa restrita ao domínio
não precisa consumir todo o material de UI, por exemplo.

### Stack tecnológica e sua evolução

O [Context de stack tecnológica](../../.ai/context/technology-stack.md) registra
somente escolhas que afetam decisões de implementação:

- os 47 pacotes do ERP, incluindo `pkModern`, usam Delphi 2006 e Win32;
- a DLL `hw.nfe.dx` usa Delphi Rio 10.3.3 e compartilha units do `Modern`;
- Firebird 2.5 é o único banco operacional suportado e usa IBX por trás das
  abstrações próprias de conexão e transação;
- a sincronização dos dados da calculadora utiliza a API por `CalculadoraApiReader`,
  substituindo a importação de `calculadora.db`/SQLite, conforme confirmação do
  responsável em 28/10/2026;
- a presença de adapters SQLite/ZeosLib remanescentes não indica que o fluxo antigo
  continua ativo nem autoriza ampliar o uso de SQLite.

O Context não cataloga todas as bibliotecas presentes nos projetos. Tecnologias
especializadas permanecem explicadas no Context ou na Skill correspondente.

Espera-se que novas features utilizem a stack atual. Se uma necessidade não puder
ser atendida dessa forma, o agente não escolhe sozinho uma nova tecnologia nem
amplia a fronteira do Delphi Rio. Ele apresenta a limitação, alternativas e impactos
ao desenvolvedor, que decide se o caso deve permanecer na stack atual, ser atendido
pela DLL Rio ou justificar uma evolução explícita.

### Banco, UUID e sincronização externa

Novas chaves primárias definidas como UUID usam `CHAR(36) NOT NULL`. O valor é
textual, tem 36 caracteres e não contém chaves `{}`. Dentro de um repository, o
padrão é usar `GenerateNewUUID`; fora dele, `GuidService.New`.

Essa decisão não significa que toda chave primária nova deva ser UUID. Dados
mantidos por fontes oficiais ou externas preservam, por padrão, o identificador da
origem — inclusive identificadores inteiros, naturais ou de domínio. Campos legados
chamados `UUID` ou `GUID` também não devem ser usados como precedente sem verificar
sua função real, porque o legado não possui uma convenção uniforme confiável.

O fluxo preferencial de sincronização separa um Reader da fonte, um serviço de
sincronização e um Writer do ERP. Readers de JSON e CSV usam adapters próprios;
quando a fonte é outro banco, sua conexão passa por `IDatabaseConnectionFactory`.
O Writer utiliza a conexão Firebird operacional e a transação controlada pelo Use
Case. Interfaces Reader/Writer são preferidas, mas podem ser dispensadas quando uma
operação pequena não se beneficiar dessa separação no desenho aprovado.

O comportamento atual está descrito no
[Context de sincronização e importação](../../.ai/context/data-synchronization.md),
e as obrigações ficam na [Rule de banco](../../.ai/rules/database.md). Ainda existe
uma pendência não bloqueadora para definir como detectar e tratar versões externas
que alterem schema ou formato de maneira incompatível.

### Segurança, autorização e auditoria

O `Modern` participa da segurança do ERP, mas não autentica o usuário nem escolhe a
empresa ativa. Essas responsabilidades pertencem ao login legado, que preenche o
`ISessionContext`. As features usam esse contexto como somente leitura.

As permissões são verificadas na UI ou no ponto de chamada legado por meio de
`TAudit_OOP`; elas não são repetidas nos Use Cases. A UI valida a autorização antes
da operação e preserva o registro de sucesso ou falha depois dela. Uma chamada à DLL
Rio não elimina essa responsabilidade do chamador.

Cada ação protegida precisa constar do plano da feature. O desenvolvedor recebe uma
lista contendo a finalidade, tipo de ação, auditoria e necessidade de liberação
gerencial. O agente não inventa códigos como `MODxxx`, `NFSxxx`, `NFCxxx` ou
`CLIxxx`: o prefixo, a sequência e o mecanismo de registro são aprovados pelo
desenvolvedor.

Como padrão, exclusão, cancelamento e estorno exigem liberação gerencial. Inclusão,
edição, salvamento, pesquisa, visualização e impressão não exigem. Ações diferentes
ou de risco precisam de decisão explícita.

Movimentos pertencentes a uma empresa usam `COD_EMPRESA`. Cadastros podem ser
globais; quando um cadastro global precisa de acesso restrito, uma tabela de vínculo
define as empresas autorizadas. O agente deve verificar o modelo existente antes de
presumir o escopo dos dados.

Credenciais existentes são codificadas pelo legado e obtidas por
`IConfiguracoesRepository`. Como ainda não há um padrão único para novos tipos de
credencial, qualquer armazenamento novo deve ser decidido com o desenvolvedor.
Certificados A1 e A3 são configurados pelo ERP e repassados ao ACBr.

Os detalhes canônicos estão em
[Arquitetura de segurança](../../.ai/context/security-architecture.md) e
[Autorização e auditoria](../../.ai/context/authorization-auditing.md). As restrições
obrigatórias permanecem na [Rule de segurança](../../.ai/rules/security.md).

### Como o Modern classifica adapters

Para código novo, `Primary` e `Secondary` descrevem a direção da interação, não a
tecnologia usada:

- um adapter `Primary` recebe uma solicitação externa e aciona um Use Case ou input
  port;
- um adapter `Secondary` implementa uma dependência acionada pela aplicação, como
  repository, banco, arquivo, e-mail ou serviço externo.

Os repositories, readers e writers existentes seguem essa classificação. ACBr e
DFeDLL também ficam em `ERP.Features/Adapters/Secondary/`: a aplicação usa o ACBr
para envio de e-mail e transmissão de NFS-e e invoca, por meio de DFeDLL, operações
exportadas pela DLL legada. Em ambos os casos, o fluxo parte da aplicação em direção
a uma dependência externa.

O fato de uma operação ser exportada por outra DLL não transforma o adapter que a
importa em `Primary`. Para uma integração nova de saída, o padrão preferencial é
definir um contrato pertencente à aplicação e implementá-lo em `Secondary`. A
explicação operacional completa está no
[Context de arquitetura](../../.ai/context/project-architecture.md), com o mapa de pastas no
[Context de estrutura do projeto](../../.ai/context/project-structure.md).

### Contratos de UI e codificação confirmados no piloto

A refatoração de Operações Internas esclareceu os limites do padrão: o Presenter
pode usar IViewFeedback diretamente quando necessita apenas de feedback genérico.
A interface e TModernCadastroForm agora oferecem também ExibirAtencao; uma View
específica continua apropriada para capacidades próprias do cadastro.

GetAuditorFill é opcional para datasets de consulta. A implementação da base lança
erro somente se for chamada; consumidores que usam esse contexto de auditoria
precisam de uma implementação própria ou herdada apropriada.

O dataset deve reutilizar ClientOpen/RunSQLMaker. A configuração de tags e rótulos
é aplicada na abertura, antes de preparar o FiltroGrid. Além de o DFM desativar os
filtros antigos, TModernCadastroForm.FormShow reaplica a ocultação depois da chamada
herdada, pois o ancestral pode reexibir MaskEdit3. Os filhos preservam sua cadeia de
inicialização e reutilizam essa centralização, sem repetir as mesmas atribuições.

O responsável relatou que os rótulos compilados só ficaram corretos após salvar a
metadata como ANSI, embora a IDE exibisse o UTF-8 corretamente. A orientação agora
abrange fontes novos e a operação de gravação, além da preservação dos existentes.

Os contratos vigentes estão no [Context de UI](../../.ai/context/ui-integration.md),
na [Skill de dataset](../../.ai/skills/delphi-dataset-grid/SKILL.md) e na
[Rule de compatibilidade](../../.ai/rules/delphi-compatibility.md). São orientações
para os padrões compatíveis de Modern, sem impor essa estrutura ao legado inteiro.
