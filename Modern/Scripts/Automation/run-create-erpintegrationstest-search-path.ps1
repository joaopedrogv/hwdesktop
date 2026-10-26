$ExcludeFolders = @(
    "AI.Calibration",
    "docs",
    # "ERP.Features",
    # "Fiscal.Sinc.GovNFSe",
    # "Fiscal.Sinc.IBPT",
    # "Fiscal.Sinc.SERPRO",
    # "Fiscal.Sinc.SICOMEX",
    "package",
    "Tests"
    # "Tests\ERP.UnitTests",
    # "Tests\ERP.IntegrationTests",
    # "UI"
)

$IncludeSubpaths = @(
    # "UI\Forms\DownloadArquivosFiscais",
    # "UI\Frames\Componentes\Progress",
    # "UI\Infrastructure\Services",
    # "UI\Infrastructure\Components",
    # "UI\Utils"
)

$params = @{
    DprDirectory    = "D:\Hw\ERP-Release\Modern\Tests\ERP.IntegrationTests"
    SearchDirectory = "..\.."
    ExcludeFolders = $ExcludeFolders
    IncludeSubpaths = $IncludeSubpaths
    EnableDebug = $false
    OutputFile = "temp-dpr.txt"
}

& "Scripts\Automation\Shared\create-search-path.ps1" @params