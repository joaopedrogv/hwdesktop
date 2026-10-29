# Referência do esquema do HWDESKTOP

[Schema disponível](schema.sql). Última extração: 2026-10-29 09:12:45 -03:00.

## Origem

- Nome lógico: HWDESKTOP_REFERENCE; conexão física na configuração pessoal.
- Cliente isql: WI-V2.5.9.27139.
- Versão do ERP declarada na configuração: Não informada.
- Extração: charset WIN1252, arquivo final UTF-8 sem BOM e LF.
- Definições no arquivo: 816 tabelas e 129 views.

O responsável atualiza previamente essa base pelo ERP. Este comando não executa
migrações, não verifica os logs dessa atualização e não consulta registros de clientes.
A versão do cliente não comprova a versão do servidor.
As contagens são das declarações exportadas, não testes das rotinas.

## Comentários e uso

A exportação preserva os metadados retornados pelo Firebird, inclusive descrições
que ainda existirem na base. O responsável mantém a base sem os comentários antigos,
que foram informados como incompletos e desatualizados. Não há filtro automático
de COMMENT ON neste comando.

Leia somente os objetos pertinentes. O DDL é referência gerada, não uma migração
a executar automaticamente. Mantenha separadas as alterações pendentes da demanda.

[Procedimento](../README.md).
