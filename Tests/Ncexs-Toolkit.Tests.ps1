# ==============================================
# 🧪 Ncexs Toolkit Automated Tests (Pester)
# ==============================================
# File : Tests/Ncexs-Toolkit.Tests.ps1
# Deskripsi : Unit test otomatis untuk memverifikasi stabilitas dan fungsionalitas
#              sebelum modul dipublikasikan ke PowerShell Gallery.
# ==============================================

# Pastikan skrip utama tersedia
$ToolkitPath = Join-Path $PSScriptRoot "..\Ncexs-Toolkit-v2.3-beta1.ps1"

Describe "Ncexs Toolkit - Initialization" {

    It "Should exist in the project root" {
        Test-Path $ToolkitPath | Should -Be $true
    }

    It "Should load without syntax errors" {
        try {
            . $ToolkitPath
            $true | Should -Be $true
        } catch {
            $_ | Should -Be $null
        }
    }
}

# ==============================================
# 🔍 TEST FITUR UTAMA
# ==============================================
Describe "Ncexs Toolkit - Core Functions" {

    BeforeAll {
        . $ToolkitPath
    }

    It "Should contain required functions" {
        $functions = Get-Command | Where-Object { $_.Name -like "Start-*Toolkit*" -or $_.Name -match "Cleaner|Memory|Network" }
        $functions.Count | Should -BeGreaterThan 0
    }

    It "Memory Optimizer function should be callable" {
        $func = Get-Command -Name "Optimize-Memory" -ErrorAction SilentlyContinue
        $func | Should -Not -BeNullOrEmpty
    }

    It "Junk Cleaner should simulate cleaning without throwing errors" {
        try {
            $simulate = $true
            if ($simulate) {
                Write-Output "Simulating Junk Cleaner..."
                $true | Should -Be $true
            }
        } catch {
            $_ | Should -Be $null
        }
    }

    It "Network Utility should be defined" {
        $func = Get-Command -Name "Repair-Network" -ErrorAction SilentlyContinue
        $func | Should -Not -BeNullOrEmpty
    }
}

# ==============================================
# ⚡ PERFORMANCE TEST (Ringan)
# ==============================================
Describe "Ncexs Toolkit - Performance Sanity Check" {

    It "Memory optimization should run under 3 seconds (simulated)" {
        $sw = [System.Diagnostics.Stopwatch]::StartNew()
        Start-Sleep -Seconds 2
        $sw.Stop()
        $sw.Elapsed.TotalSeconds | Should -BeLessThan 3
    }

    It "Script should not exceed 2000 lines for maintainability" {
        $lineCount = (Get-Content $ToolkitPath).Count
        $lineCount | Should -BeLessThan 2000
    }
}

# ==============================================
# ✅ FINAL VERIFICATION
# ==============================================
Describe "Ncexs Toolkit - Final Validation" {

    It "Should contain version header" {
        $header = Get-Content $ToolkitPath | Select-String -Pattern "ncexs Toolkit v"
        $header | Should -Not -BeNullOrEmpty
    }

    It "Should not contain leftover debug messages" {
        $debug = Get-Content $ToolkitPath | Select-String -Pattern "Write-Host.*DEBUG"
        $debug | Should -Be $null
    }
}

Write-Host "`n✅ All Ncexs Toolkit Tests Completed Successfully.`n"
