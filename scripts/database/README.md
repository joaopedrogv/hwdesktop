# Estrutura do banco e alterações por demanda

Esta área fornece contexto estrutural do banco e guarda as alterações preparadas durante o desenvolvimento. O executor de migrações do ERP continua sendo o pacote pkReestrutura, com histórico em `scripts/versoes`.

| Local | Finalidade |
| --- | --- |
| [schema/schema.sql](schema/schema.sql) | Extração completa dos metadados da base de referência, quando disponível. |
| [schema/README.md](schema/README.md) | Origem e situação da extração. Consultar antes de usar o esquema. |
| [changes/](changes/README.md) | SQL de desenvolvimento organizado por demanda. |
| [scripts/versoes](../versoes/) | Histórico de migrações de produção; incorporação em etapa própria. |

## Consultar a estrutura

Pesquise os objetos pertinentes no arquivo e leia somente os trechos necessários. Não carregue o esquema inteiro no contexto do agente por padrão. Considere os objetos relacionados: domínios, chaves, índices, triggers, generators, views e procedures.

O esquema representa a base identificada no momento da extração. Não comprova que toda instalação de cliente esteja no mesmo estado, nem descreve os dados e configurações das empresas. Código e migrações são evidências complementares.

Se o arquivo estiver ausente ou o recorte estiver desatualizado, identifique a informação faltante antes de propor uma mudança física que dependa dela. Não invente definições de objetos.

## Preparar e atualizar a referência

1. Restaurar um backup em uma base separada da produção.
2. Executar a versão atual do ERP nessa cópia e conferir se as migrações terminaram sem falhas.
3. Executar _automation/database/export-schema.ps1, com configuração individual. O comando extrai metadados; não aplica migrações.
4. Conferir a extração e remover informações de conexão/credenciais e caminhos locais do resultado versionável, se presentes.
5. Manter a própria base sem os comentários antigos, conforme decisão do responsável. A exportação não filtra COMMENT ON; descrições ainda presentes serão preservadas.
6. Publicar o resultado em `schema/schema.sql` e atualizar a identificação em `schema/README.md`.

Registrar origem identificável sem dados privados, data, versão do ERP, versão do Firebird e situação conhecida das migrações. A revisão SVN ou o commit do código, isoladamente, não comprovam o estado aplicado ao banco.

O arquivo é gerado: não editar seu DDL manualmente para representar mudanças ainda não aplicadas. Ao iniciar uma nova demanda, o responsável atualiza a base pelo ERP e executa a extração; fora desse momento, atualizar quando houver evolução consolidada ou divergência pertinente. Não substituir a referência por uma extração de uma base com experiências de demandas paralelas sem identificá-las e reconciliá-las.

Comando e configuração: [_automation/database](../../_automation/database/README.md). A atualização automatizada pelo motor do ERP ficou para uma demanda futura.

A extração é material de consulta; não é uma migração nem um comando de recriação a executar automaticamente.

## Desenvolver e integrar alterações

Use `changes/<identificador-da-demanda>/`. Comece com um arquivo; use prefixos ordenados como `001-condicoes.sql` e `002-complemento.sql` quando houver etapas distintas. Não criar um arquivo por mensagem ao agente.

Registre a referência de esquema usada, a ordem de aplicação e o estado de validação no plano/notas já existentes da demanda. Diferencie comandos de entrega de consultas de diagnóstico, dados de teste e tentativas descartadas.

Preparar SQL não autoriza executá-lo. Uma revisão de um rascunho ainda não aplicado pode substituir o texto anterior; depois de aplicado em uma base compartilhada, evolua por novos comandos identificáveis.

Ao concluir, incorpore os comandos aprovados em `scripts/versoes` somente em uma etapa solicitada para esse fim. Observe a sintaxe do interpretador, preserve o histórico e consulte o arquivo ativo no manifesto. Não atualizar versão, manifesto ou CRC como efeito implícito da implementação.

A skill [database-migration](../../.ai/skills/database-migration/SKILL.md) é a fonte técnica do procedimento. O Workflow Fiscal.Calculos mantém sua exceção de caminho para scripts por intervalo de versões; esta organização não move seus arquivos nem altera esse contrato.

## Banco real e arquivos locais

O banco restaurado permanece no ambiente local ou de testes. Não é necessário versioná-lo nem fornecer seus dados ao agente para consultar a estrutura e preparar SQL. Sua disponibilidade é necessária quando o trabalho exigir executar migrações ou testes de integração; isso é separado do acesso ao esquema.

Não armazenar backups, bancos físicos ou credenciais nesta área. A primeira extração está disponível; consulte sua identificação e os limites em schema/README.md.
