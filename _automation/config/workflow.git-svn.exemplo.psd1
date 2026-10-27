@{
    # Configuração individual da ponte git-svn; credenciais no arquivo pessoal indicado.
    IntegrationPath = 'D:\Hw\hwdesktop-integration'
    GitBranch = 'main'
    # Arquivo pessoal com SVN_USER e SVN_PASS; não versionar.
    SecretsFile = 'segredos.md'
    SvnUrlSuffix = '/svn/hwsistemas/Projeto_Fiscal40'
    SvnRef = 'refs/remotes/svn/git-svn'
    WslDistribution = 'Ubuntu-24.04'
    # Opcional. Use '' quando não precisar do perfil TLS preparado manualmente.
    # Caminho relativo a este arquivo; nenhum ajuste TLS é criado pelo script.
    OpenSslConfig = '..\..\.git\openssl-svn-legacy.cnf'
}