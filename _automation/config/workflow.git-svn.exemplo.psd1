@{
    # Configuração individual da ponte git-svn; não exige SecretsFile.
    IntegrationPath = 'D:\Hw\hwdesktop-integration'
    GitBranch = 'main'
    SvnUrlSuffix = '/svn/hwsistemas/Projeto_Fiscal40'
    SvnRef = 'refs/remotes/svn/git-svn'
    WslDistribution = 'Ubuntu-24.04'
    # Opcional. Use '' quando não precisar do perfil TLS preparado manualmente.
    # Caminho relativo a este arquivo; nenhum ajuste TLS é criado pelo script.
    OpenSslConfig = '..\..\.git\openssl-svn-legacy.cnf'
}