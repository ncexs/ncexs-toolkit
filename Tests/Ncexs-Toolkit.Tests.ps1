# Ncexs-Toolkit.Tests.ps1

$ToolkitPath = Join-Path $PSScriptRoot "../ncexs-Toolkit.ps1"
if (-not (Test-Path $ToolkitPath)) {
    $ToolkitPath = "./ncexs-Toolkit.ps1"
}

Describe "ncexs-Toolkit Tests" {
    # 1. Mock destructive / system-level cmdlets
    Mock Set-ItemProperty {}
    Mock Get-ItemProperty {
        return [PSCustomObject]@{ fDenyTSConnections = 1 }
    }
    Mock Enable-NetFirewallRule {}
    Mock Disable-NetFirewallRule {}
    Mock Remove-Item {}
    Mock Get-ChildItem { return @() }
    Mock Set-DnsClientServerAddress {}
    Mock Optimize-Volume {}
    Mock Export-WindowsDriver {}
    Mock Stop-Process {}
    Mock Start-Process {}
    Mock Start-Sleep {}
    Mock Clear-Host {}

    # Mock CIM/WMI queries for system diagnostics
    Mock Get-CimInstance {
        param($ClassName, $Filter)
        if ($ClassName -eq 'Win32_OperatingSystem') {
            return [PSCustomObject]@{
                Caption = "Microsoft Windows 11 Pro"
                OSArchitecture = "64-bit"
                Version = "10.0.22000"
            }
        }
        elseif ($ClassName -eq 'Win32_ComputerSystem') {
            return [PSCustomObject]@{
                Manufacturer = "TestManufacturer"
                Model = "TestModel"
                TotalPhysicalMemory = 16GB
            }
        }
        elseif ($ClassName -eq 'Win32_Processor') {
            return [PSCustomObject]@{
                Name = "Intel Core i7"
            }
        }
        return @()
    }

    # Mock external executables using local functions
    function cleanmgr.exe { }
    function powercfg { }

    Write-Host "DIAGNOSTIC: ToolkitPath is '$ToolkitPath'"
    Write-Host "DIAGNOSTIC: File exists: $(Test-Path $ToolkitPath)"
    try {
        . $ToolkitPath
        Write-Host "DIAGNOSTIC: Dot-sourcing completed successfully."
        Write-Host "DIAGNOSTIC: Get-Translation exists: $((Get-Command Get-Translation -ErrorAction SilentlyContinue) -ne $null)"
    }
    catch {
        Write-Host "DIAGNOSTIC: Dot-sourcing failed: $_"
        Write-Host "DIAGNOSTIC: Exception Details: $($_.Exception.Message)"
    }

    Context "Translation Tests" {
        It "Should translate standard English menu titles correctly" {
            $script:Language = "EN"
            $translation = Get-Translation "Menu_Title"
            $translation | Should Be "ncexs Toolkit v3.5"
        }

        It "Should translate standard Indonesian menu titles correctly" {
            $script:Language = "ID"
            $translation = Get-Translation "Menu_Title"
            $translation | Should Be "ncexs Toolkit v3.5"
        }
    }

    Context "Confirmation Tests" {
        It "Should return true when user inputs y" {
            Mock Read-Host { return "y" }
            $res = Request-Confirm "Test Message"
            $res | Should Be $true
        }

        It "Should return false when user inputs n" {
            Mock Read-Host { return "n" }
            $res = Request-Confirm "Test Message"
            $res | Should Be $false
        }
    }

    Context "Remote Desktop (RDP) Controller" {
        It "Should configure RDP status and execute registry and firewall updates cleanly" {
            # Setup choice progression for RDP Menu loop (Choice '1' to Enable, then Choice '3' to Exit)
            $script:choiceIndex = 0
            $mockChoices = @("1", "3")
            Mock Read-Host {
                $c = $mockChoices[$script:choiceIndex]
                $script:choiceIndex++
                return $c
            }
            Mock Request-Confirm { return $true }
            
            # Verify that Set-ItemProperty is called when enabling RDP
            Mock Set-ItemProperty {} -Verifiable
            
            Set-RemoteDesktop
            
            Assert-VerifiableMocks
        }
    }
}
