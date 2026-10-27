@{
    # Integração SVN tradicional; identificação automática pela working copy .svn.
    # Copie para workflow.local.psd1. O modo SVN não exige WSL/git-svn.
    # Nos clones Git, use workflow.work.exemplo.psd1, sem caminhos da integração.
    IntegrationPath = 'C:\Projeto_Fiscal40'
    GitBranch = 'main'
    SvnUrlSuffix = '/svn/hwsistemas/Projeto_Fiscal40'
    # Caminho relativo a este arquivo de configuração, ou absoluto.
    SecretsFile = 'segredos.md'
}
