@{
    # Module manifest for NCEXS Toolkit
    RootModule        = 'ncexs-toolkit.psm1'
    ModuleVersion     = '2.3.0'
    Author            = 'Fathullah Nur Akbar'
    CompanyName       = 'NCEXS Project'
    Copyright         = '(c) 2025 NCEXS'
    Description       = 'NCEXS Toolkit - All-in-one PowerShell utility suite for Windows optimization and maintenance.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @(
        'Start-NcexsToolkit',
        'Invoke-JunkCleaner',
        'Optimize-Memory',
        'Test-NetworkUtility'
    )
    GUID = 'a7c2d6f8-f04e-4c5b-95b2-12fd4c8a42a1'
}
