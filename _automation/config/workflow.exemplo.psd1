@{
    # Copie para workflow.local.psd1 e ajuste os caminhos pessoais.
    IntegrationPath = 'C:\Projeto_Fiscal40'
    # Clone Git de desenvolvimento existente, diferente da integração.
    # Obrigatório em start-demand.ps1; não é utilizado por sync-integration.ps1.
    WorkPath = ''
    GitBranch = 'main'
    SvnUrlSuffix = '/svn/hwsistemas/Projeto_Fiscal40'
    # Caminho relativo a este arquivo de configuração, ou absoluto.
    SecretsFile = 'segredos.md'
}
