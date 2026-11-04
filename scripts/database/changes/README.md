# SQL de desenvolvimento por demanda

Cada demanda que precisar de alteração de banco utiliza `<identificador-da-demanda>/` nesta pasta. Não criar pastas vazias de demandas futuras.

Exemplo de caminho: `condicoes-operacoes-ibscbs/001-condicoes.sql`. Esse exemplo não declara uma mudança física aprovada nem cria o arquivo.

Use um arquivo inicialmente e mais arquivos quando a ordem de evolução exigir
etapas distintas. Identifique no resultado da tarefa ou nas notas existentes da
demanda a base esperada, a sequência, os comandos finais de entrega e o que foi
efetivamente testado ou aplicado.

Esta pasta contém SQL pendente de incorporação. Durante o desenvolvimento, os
arquivos acompanham a demanda no Git. O ERP executa as migrações de `scripts/versoes`.

Na etapa de incorporação solicitada, o agente confere os comandos finais, a ordem,
o arquivo de versão preferencial e as dependências. Depois de acrescentar e conferir
a sequência completa no destino, remove os scripts de entrega correspondentes.
As adições em `versoes` e as remoções em `changes` pertencem ao mesmo commit.
A preparação original permanece disponível no histórico Git.

Antes de remover, confira se testes ou automações consomem esses arquivos e resolva
essa dependência no escopo autorizado. Preserve trabalho pendente, parcialmente
incorporado ou alheio à entrega. Uma nova extração do schema, sozinha, não encerra
a incorporação de uma migração.

A identificação do schema é a referência para o estado físico observado. Considere
as migrações pertinentes posteriores à extração. Registrar a incorporação em
`versoes` não equivale a registrar sua aplicação em uma base.

A incorporação segue a [skill database-migration](../../../.ai/skills/database-migration/SKILL.md), em etapa própria. Não misturar aqui bancos físicos, backups, credenciais ou resultados temporários de execução.

A exceção de scripts por intervalo do Workflow Fiscal.Calculos permanece no caminho que esse Workflow já define.

[Visão geral e procedimento](../README.md).
