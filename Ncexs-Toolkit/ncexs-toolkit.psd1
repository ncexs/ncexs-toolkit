@{
    RootModule        = 'ncexs-toolkit.psm1'
    ModuleVersion     = '2.3'  # This will auto-update from release tag
    GUID              = '12345678-abcd-1234-abcd-1234567890ab'
    Author            = 'ncexs'
    CompanyName       = 'ncexs Dev'
    Copyright         = '(c) 2025 ncexs. All rights reserved.'
    Description       = 'ncexs Toolkit — a lightweight, modular PowerShell utility for Windows optimization and maintenance.'
    PowerShellVersion = '5.1'
    FunctionsToExport = '*'
    CmdletsToExport   = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags = @('toolkit', 'optimizer', 'windows', 'ncexs')
            LicenseUri = 'https://github.com/ncexs/ncexs-toolkit/blob/main/LICENSE'
            ProjectUri = 'https://github.com/ncexs/ncexs-toolkit'
            ReleaseNotes = 'https://github.com/ncexs/ncexs-toolkit/releases'
        }
    }
}
