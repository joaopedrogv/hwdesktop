# SQL de desenvolvimento por demanda

Cada demanda que precisar de alteração de banco utiliza `<identificador-da-demanda>/` nesta pasta. Não criar pastas vazias de demandas futuras.

Exemplo de caminho: `condicoes-operacoes-ibscbs/001-condicoes.sql`. Esse exemplo não declara uma mudança física aprovada nem cria o arquivo.

Use um arquivo inicialmente e mais arquivos quando a ordem de evolução exigir etapas distintas. Identifique no registro existente da demanda a base esperada, a sequência, os comandos finais de entrega e o que foi efetivamente testado ou aplicado.

Estes arquivos acompanham a demanda no controle de versão. Não são descobertos ou executados automaticamente pelo ERP; o histórico de produção permanece em `scripts/versoes`. Conserve o vínculo de origem ao incorporar os comandos, para evitar tratá-los novamente como pendentes.

A incorporação segue a [skill database-migration](../../../Modern/.ai/skills/database-migration/SKILL.md), em etapa própria. Não misturar aqui bancos físicos, backups, credenciais ou resultados temporários de execução.

A exceção de scripts por intervalo do Workflow Fiscal.Calculos permanece no caminho que esse Workflow já define.

[Visão geral e procedimento](../README.md).
