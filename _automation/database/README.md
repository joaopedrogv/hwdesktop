# Extrair o esquema da base de referência

Antes de iniciar uma nova demanda, o responsável executa o próprio ERP na base de referência para aplicar as migrações mais recentes e confere seu resultado. Em seguida, abre **Banco de dados → Atualizar schema** no menu, ou executa diretamente:

```powershell
.\_automation\database\export-schema.ps1
```

O comando utiliza isql para exportar somente metadados e publica scripts/database/schema/schema.sql em UTF-8 sem BOM e LF. Atualiza também a identificação em scripts/database/schema/README.md. Se o DDL for igual, preserva o SQL existente e atualiza somente a identificação da extração.

## Configuração individual

- Copie ../config/database.exemplo.psd1 para ../config/database.local.psd1 e preencha conexão (campo Database), caminho do isql e charset de extração. O caminho da base não fica fixo no script; para trocar de banco, altere essa configuração individual.
- FIREBIRD_USER e FIREBIRD_PASS ficam no arquivo pessoal indicado por SecretsFile; o exemplo padrão usa ../config/segredos.md.
- ErpVersion é opcional; quando preenchida, identifica a versão usada pelo responsável para atualizar a base.
- Caminhos e segredos reais não entram no versionamento. O clone atual já recebeu database.local.psd1 com a conexão fornecida, sem duplicar as credenciais.

Configuração alternativa:

```powershell
.\_automation\database\export-schema.ps1 -ConfigPath C:\config-pessoal\database.local.psd1
```

## Limites

Não executa migrações, não inicia o ERP, não consulta registros de clientes e não faz commit ou push. A atualização prévia da base é responsabilidade do programador. A chamada permanece independente de start-demand.ps1. No menu, está no submenu Banco de dados, opção Atualizar schema; entrar no submenu não inicia a extração.

O responsável manterá a base sem os comentários antigos. O comando não filtra COMMENT ON: descrições que ainda existirem na base serão exportadas.

As credenciais são transmitidas somente ao ambiente do processo filho. Saída inválida, erro do isql, falha de conversão ou tempo superior a 60 segundos interrompem antes de substituir o esquema. Os arquivos intermediários ficam numa pasta própria ignorada e são removidos ao terminar.

A extração não é uma auditoria do SQL armazenado nem substitui a conferência do sucesso das migrações.

Visão geral: [scripts/database](../../scripts/database/README.md).
