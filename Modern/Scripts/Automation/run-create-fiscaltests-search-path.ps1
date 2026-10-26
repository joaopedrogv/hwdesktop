$ExcludeFolders = @(
    "AI.Calibration",
    "docs",
    "ERP.Features",
    "Fiscal.Sinc.GovNFSe",
    "Fiscal.Sinc.IBPT",
    "Fiscal.Sinc.SERPRO",
    "Fiscal.Sinc.SICOMEX",
    "package",
    "Tests",
    # "Tests\ERP.UnitTests",
    # "Tests\ERP.IntegrationTests",
    "UI"
)

$params = @{
    DprDirectory    = "D:\Hw\ERP-Release\Modern\Tests\Fiscal.Calculos.Tests"
    SearchDirectory = "..\.."
    ExcludeFolders = $ExcludeFolders
    EnableDebug = $false
    OutputFile = "temp-dpr.txt"
}

& "Scripts\Automation\Shared\create-search-path.ps1" @params