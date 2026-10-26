$ExcludeFolders = @(
    "package",
    "Tests",
    "UI",
    "UI\Infrastructure\Components\UIFormObserverFactoryUnit.pas"
)

$IncludeSubpaths = @(
    "UI\Infrastructure\Services",
    "UI\Infrastructure\Components"
)

$params = @{
    DprDirectory    = "D:\Hw\ERP-Release\Modern\package"
    SearchDirectory = ".."
    ExcludeFolders = $ExcludeFolders
    IncludeSubpaths = $IncludeSubpaths
    EnableDebug = $false
    OutputFile = "temp-dpr.txt"
}

& "Scripts\Automation\Shared\create-drp-temp.ps1" @params