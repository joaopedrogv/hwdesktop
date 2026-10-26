$ExcludeFolders = @(
    "Adapters",
    "AI.Calibration",
    "Core",
    "docs",
    "ERP.Features",
    "Fiscal.Calculos",
    "Fiscal.Sinc.GovNFSe",
    "Fiscal.Sinc.IBPT",
    "Fiscal.Sinc.SERPRO",
    "Fiscal.Sinc.SICOMEX",
    "package",
    "Tests\ERP.UnitTests",
    "Tests\Fiscal.Calculos.Tests",
    "UI"
)

$params = @{
    DprDirectory    = "D:\Hw\ERP-Release\Modern\Tests\ERP.IntegrationTests"
    SearchDirectory = "..\.."
    ExcludeFolders = $ExcludeFolders
    EnableDebug = $false
    OutputFile = "temp-dpr.txt"
}

& "Scripts\Automation\Shared\create-drp-temp.ps1" @params