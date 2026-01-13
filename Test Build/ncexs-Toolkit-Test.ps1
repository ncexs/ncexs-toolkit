[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Toolkit perlu dijalankan sebagai Administrator" -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

$global:ToolkitVersion = "Test Build"
$global:Language = "ID"

$global:Theme = @{
    Border      = 'DarkGray'; Title = 'Cyan'; Section = 'White'
    MenuNumber  = 'DarkCyan'; MenuText = 'Gray'; Special = 'Magenta'
    Highlight   = 'White'; Prompt = 'Cyan'; Success = 'Green'
    Error       = 'Red'; Warning = 'Yellow'; Info = 'DarkGray'
    Exit        = 'Red'; AsciiArt = 'Cyan'
}

try { $Host.PrivateData.PromptForegroundColor = $global:Theme.Prompt } catch {}

$global:Translations = @{
    "EN" = @{
        "Menu_Title" = "ncexs Toolkit (Test Build)"; "Menu_Option0" = "Compact OS (Save 2-5GB Space)"
        "Menu_Option1" = "System Information"; "Menu_Option2" = "Enhanced Junk Cleaner"
        "Menu_Option3" = "Empty Recycle Bin"; "Menu_Option4" = "Open Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"; "Menu_Option6" = "Network Repair"
        "Menu_Option7" = "Power & Battery Utilities"; "Menu_Option8" = "Memory Optimizer"
        "Menu_Option9" = "Defrag & Optimize Drives"; "Menu_Option10" = "System Health Checker"
        "Menu_Option11" = "Updates & Drivers Center"; "Menu_Option12" = "DNS Changer"
        "Menu_Option13" = "Wi-Fi Password Recovery"; "Menu_Option14" = "Visual FX Booster"
        "Menu_Option15" = "Optimize WhatsApp"; "Menu_Option16" = "Exit Toolkit"
        "SubMenu_Power" = "POWER & BATTERY"; "SubMenu_Update" = "UPDATES & DRIVERS CENTER"
        "WA_Title" = "WHATSAPP OPTIMIZER"; "WA_Confirm" = "Clear WhatsApp App & Web Caches?"
        "YesNo" = "(Y/N)"; "SelectOption" = "Select option"; "PressAnyKey" = "Press any key..."
    };
    "ID" = @{
        "Menu_Title" = "ncexs Toolkit (Test Build)"; "Menu_Option0" = "Compact OS (Hemat 2-5GB Space)"
        "Menu_Option1" = "Informasi Sistem"; "Menu_Option2" = "Pembersih Sampah (Enhanced)"
        "Menu_Option3" = "Kosongkan Recycle Bin"; "Menu_Option4" = "Buka Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"; "Menu_Option6" = "Perbaikan Jaringan"
        "Menu_Option7" = "Utilitas Daya & Baterai"; "Menu_Option8" = "Optimasi Memori"
        "Menu_Option9" = "Defragment & Optimasi Drive"; "Menu_Option10" = "Pemeriksa Kesehatan Sistem"
        "Menu_Option11" = "Pusat Update & Driver"; "Menu_Option12" = "Pengubah DNS"
        "Menu_Option13" = "Wi-Fi Password Recovery"; "Menu_Option14" = "Visual FX Booster"
        "Menu_Option15" = "Optimasi WhatsApp"; "Menu_Option16" = "Keluar Aplikasi"
        "SubMenu_Power" = "UTILITAS DAYA & BATERAI"; "SubMenu_Update" = "PUSAT UPDATE & DRIVER"
        "WA_Title" = "OPTIMASI WHATSAPP"; "WA_Confirm" = "Bersihkan Cache WhatsApp Apl & Web?"
        "YesNo" = "(Y/T)"; "SelectOption" = "Pilih opsi"; "PressAnyKey" = "Tekan sembarang tombol..."
    }
}

function Get-Translation { param([string]$key) if ($global:Translations[$global:Language].ContainsKey($key)) { return $global:Translations[$global:Language][$key] } return $key }
function Write-Centered { param([string]$text, [string]$color = $global:Theme.Title, [int]$width = 80) $padLeft = [math]::Max(0, [math]::Floor(($width - $text.Length) / 2)); Write-Host (" " * $padLeft + $text) -ForegroundColor $color }
function Write-BoxHeader { param([string]$title) Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor $global:Theme.Border; $cleanTitle = " $title "; $padLeft = [math]::Max(0, [math]::Floor((78 - $cleanTitle.Length) / 2)); $padRight = [math]::Max(0, (78 - $cleanTitle.Length - $padLeft)); Write-Host "║" -NoNewline -ForegroundColor $global:Theme.Border; Write-Host (" " * $padLeft) -NoNewline; Write-Host $cleanTitle -NoNewline -ForegroundColor $global:Theme.Title; Write-Host (" " * $padRight) -NoNewline; Write-Host "║" -ForegroundColor $global:Theme.Border; Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor $global:Theme.Border }
function Write-Title { param([string]$message) Write-BoxHeader $message }
function Write-Error { param([string]$message) Write-Host " [!] $message" -ForegroundColor $global:Theme.Error }
function Write-Success { param([string]$message) Write-Host " [✓] $message" -ForegroundColor $global:Theme.Success }
function Write-Warning { param([string]$message) Write-Host " [!] $message" -ForegroundColor $global:Theme.Warning }
function Write-Info { param([string]$message) Write-Host " [i] $message" -ForegroundColor $global:Theme.Info }
function Request-Confirm { param([string]$msg) $yn = Get-Translation "YesNo"; $c = Read-Host " $msg $yn"; return $c -match '^(Y|y|T|t)$' }

function Show-Intro {
    Clear-Host; Write-Host ""
    Write-Centered "    _  __ ____ ______ _  __ _____" "Cyan"
    Write-Centered "  / |/ // __// ____/| |/_// ___/" "Cyan"
    Write-Centered " /    // /__/ __/  _>  < (__  ) " "Cyan"
    Write-Centered "/_/|_/ \___/_____//_/|_//____/  " "Cyan"
    Write-Host "" ; Write-Centered "T E S T    B U I L D" "DarkCyan"; Write-Host ""
    $modules = @("Kernel", "UI", "Network", "Disk", "Security", "Social")
    foreach ($m in $modules) { Write-Host " [INIT] Loading module: $m..." -ForegroundColor DarkGray; Start-Sleep -Milliseconds 50 }
}

function Invoke-CompactOS {
    Clear-Host; Write-Title (Get-Translation 'Compact_Title')
    $rawStatus = compact.exe /CompactOS:query
    Write-Info "Status: $rawStatus"
    if (Request-Confirm (Get-Translation 'Compact_Confirm')) { Write-Host " Sedang mengompresi..." -ForegroundColor Cyan; compact.exe /CompactOS:always; Write-Success (Get-Translation 'Compact_Done') }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-SystemInfo {
    Clear-Host; Write-Title (Get-Translation 'System_Title')
    try {
        $os = Get-CimInstance Win32_OperatingSystem; $cpu = Get-CimInstance Win32_Processor; $system = Get-CimInstance Win32_ComputerSystem
        Write-Host "`n [ System Details ]" -ForegroundColor $global:Theme.Section
        Write-Host "   Hostname : $env:COMPUTERNAME"
        Write-Host "   OS       : $($os.Caption)"
        Write-Host "   CPU      : $($cpu.Name.Trim())"
        Write-Host "   RAM      : $([math]::Round($system.TotalPhysicalMemory / 1GB, 2)) GB"
        Write-Host "`n [ Storage ]" -ForegroundColor $global:Theme.Section
        Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object { Write-Host "   [$($_.DeviceID)] $([math]::Round($_.Size/1GB,2)) GB ($([math]::Round($_.FreeSpace/1GB,2)) GB Free)" }
    } catch { Write-Error "Error" }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Clear-JunkFiles {
    Clear-Host; Write-Title (Get-Translation 'Clean_Title')
    if (-not (Request-Confirm (Get-Translation 'Clean_Confirm'))) { return }
    $totalFreed = 0
    $targets = @("$env:TEMP\*", "$env:SystemRoot\Temp\*", "$env:SystemRoot\Prefetch\*")
    foreach ($p in $targets) {
        $files = Get-ChildItem -Path $p -Recurse -Force -ErrorAction SilentlyContinue
        if ($files) { $totalFreed += ($files | Measure-Object -Property Length -Sum).Sum; $files | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue }
    }
    Write-Success "Cleared $([math]::Round($totalFreed/1MB, 2)) MB"; Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Clear-RecycleBin-Menu { try { Clear-RecycleBin -Force -ErrorAction Stop; Write-Success "Recycle Bin Empty." } catch { Write-Info "Already empty." }; Read-Host "`n $(Get-Translation 'PressAnyKey')" }
function Open-DiskCleanup { if (Request-Confirm "Buka Disk Cleanup?") { Start-Process "cleanmgr.exe" } }

function Show-AdvancedUninstaller {
    Clear-Host; Write-Title (Get-Translation 'Uninstall_Title'); Write-Info "Mencari aplikasi..."
    $paths = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')
    $programs = foreach ($p in $paths) { Get-ItemProperty -Path $p -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -and $_.UninstallString } }
    $search = Read-Host " $(Get-Translation 'Uninstall_Prompt')"
    if ($search) {
        $found = $programs | Where-Object { $_.DisplayName -like "*$search*" }
        if ($found) { 
            $count = 1
            foreach ($item in $found) { Write-Host " [$count] $($item.DisplayName)"; $count++ }
            $sel = Read-Host " Pilih nomor"; if ($sel -match '^\d+$') { cmd /c $found[[int]$sel-1].UninstallString }
        }
    }
}

function Invoke-NetworkRepair { Write-Progress -Activity "Repairing..." -Status "Running Commands"; ipconfig /release; ipconfig /renew; ipconfig /flushdns; netsh winsock reset; netsh int ip reset; Write-Success "Done."; Read-Host " Press any key" }

function Show-PowerMenu {
    do {
        Clear-Host; Write-Title (Get-Translation 'SubMenu_Power')
        Write-Host "`n [1] High Performance`n [2] Balanced`n [3] Back"
        $c = Read-Host " Pilih"; if ($c -eq "1") { powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c; Write-Success "Set to High" } elseif ($c -eq "2") { powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e; Write-Success "Set to Balanced" } elseif ($c -eq "3") { return }
        Read-Host " Press any key"
    } while ($true)
}

function Clear-RAM { 
    $code = @"
    using System; using System.Runtime.InteropServices;
    public class M { [DllImport("psapi.dll")] public static extern bool EmptyWorkingSet(IntPtr h);
    public static void C() { foreach(var p in System.Diagnostics.Process.GetProcesses()) try { EmptyWorkingSet(p.Handle); } catch {} } }
"@
    Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue; [M]::C(); [System.GC]::Collect(); Write-Success "Memory Optimized."; Read-Host " Press any key"
}

function Invoke-Defragment { Optimize-Volume -DriveLetter C -Optimize -Defrag -Verbose; Read-Host " Done" }
function Show-SystemHealthMenu { sfc /scannow; dism /online /cleanup-image /restorehealth; Read-Host " Done" }

function Show-UpdateDriverMenu {
    do {
        Clear-Host; Write-Title (Get-Translation 'SubMenu_Update')
        Write-Host "`n [1] Winget Update All`n [2] Backup Drivers`n [3] Back"
        $c = Read-Host " Pilih"; if ($c -eq "1") { winget upgrade --all } elseif ($c -eq "2") { 
            $dest = "C:\DriversBackup"; if(!(Test-Path -Path $dest)){New-Item -Path $dest -ItemType Directory}; Export-WindowsDriver -Online -Destination $dest; Write-Success "Backup at $dest"
        } elseif ($c -eq "3") { return }
        Read-Host " Press any key"
    } while ($true)
}

function Show-DNSMenu { 
    $adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1
    Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("1.1.1.1","1.0.0.1")
    Write-Success "DNS Cloudflare set."; Read-Host " Done" 
}

function Invoke-WifiGrabber {
    netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object {
        $n = $_.ToString().Split(":")[1].Trim(); $r = netsh wlan show profile name="$n" key=clear;
        $p = $r | Select-String "Key Content|Konten Kunci"; if($p){ Write-Host " SSID: $n -> Pass: $($p.ToString().Split(":")[1].Trim())" -ForegroundColor Yellow }
    }; Read-Host "`n Press any key"
}

function Invoke-VisualPerf { Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value 0; Write-Success "UI Boosted."; Read-Host " Done" }

function Invoke-OptimizeWhatsApp {
    Clear-Host; Write-Title (Get-Translation 'WA_Title')
    if (-not (Request-Confirm (Get-Translation 'WA_Confirm'))) { return }
    $freed = 0
    $targets = @(
        @{N="WA Store"; P="$env:LOCALAPPDATA\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalCache"},
        @{N="WA Legacy"; P="$env:USERPROFILE\AppData\Local\WhatsApp\cache"},
        @{N="WA Web Chrome"; P="$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Service Worker\CacheStorage"},
        @{N="WA Web Edge"; P="$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Service Worker\CacheStorage"},
        @{N="WA Web Brave"; P="$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Service Worker\CacheStorage"}
    )
    foreach ($t in $targets) {
        if (Test-Path -Path $t.P) {
            try {
                $f = Get-ChildItem -Path $t.P -Recurse -File -Force -ErrorAction SilentlyContinue
                if ($f) { $freed += ($f | Measure-Object -Property Length -Sum).Sum; $f | Remove-Item -Force -ErrorAction SilentlyContinue }
                Write-Info "Optimized: $($t.N)"
            } catch {}
        }
    }
    Write-Success "WhatsApp Optimized. Freed: $([math]::Round($freed / 1MB, 2)) MB"; Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-MainMenu {
    Clear-Host; $w = 86; $line = "═" * ($w - 2)
    Write-Host ("╔" + $line + "╗") -ForegroundColor $global:Theme.Border
    Write-Centered "    _  __ ____ ______ _  __ _____" $global:Theme.AsciiArt $w
    Write-Centered "  / |/ // __// ____/| |/_// ___/" $global:Theme.AsciiArt $w
    Write-Centered " /    // /__/ __/  _>  < (__  ) " $global:Theme.AsciiArt $w
    Write-Centered "/_/|_/ \___/_____//_/|_//____/  " $global:Theme.AsciiArt $w
    Write-Host "" ; Write-Centered (Get-Translation 'Menu_Title') $global:Theme.Title $w
    Write-Host ("╠" + $line + "╣") -ForegroundColor $global:Theme.Border
    Write-Host "║ " -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host "[0] " -NoNewline -ForegroundColor $global:Theme.Highlight
    Write-Host ("{0,-79}" -f (Get-Translation 'Menu_Option0')) -NoNewline -ForegroundColor $global:Theme.Highlight
    Write-Host "║" -ForegroundColor $global:Theme.Border
    Write-Host ("╠" + $line + "╣") -ForegroundColor $global:Theme.Border
    for ($i = 1; $i -le 8; $i++) {
        $l_idx = $i; $r_idx = $i + 8; $l_t = Get-Translation "Menu_Option$l_idx"; $r_t = Get-Translation "Menu_Option$r_idx"
        Write-Host "║ " -NoNewline -ForegroundColor $global:Theme.Border
        Write-Host ("[{0,-2}]" -f $l_idx) -NoNewline -ForegroundColor $global:Theme.MenuNumber
        Write-Host (" {0,-35}" -f $l_t) -NoNewline -ForegroundColor $global:Theme.MenuText
        Write-Host "│ " -NoNewline -ForegroundColor $global:Theme.Border
        $rc = if($r_idx -eq 16){$global:Theme.Exit}else{$global:Theme.MenuNumber}
        $rtc = if($r_idx -eq 16){$global:Theme.Exit}else{$global:Theme.MenuText}
        Write-Host ("[{0,-2}]" -f $r_idx) -NoNewline -ForegroundColor $rc
        Write-Host (" {0,-36}" -f $r_t) -NoNewline -ForegroundColor $rtc
        Write-Host "║" -ForegroundColor $global:Theme.Border
    }
    Write-Host ("╚" + $line + "╝") -ForegroundColor $global:Theme.Border
}

Show-Intro
do {
    Show-MainMenu
    $choice = Read-Host " $(Get-Translation 'SelectOption')"
    switch ($choice) {
        "0"  { Invoke-CompactOS }; "1"  { Show-SystemInfo }; "2"  { Clear-JunkFiles }
        "3"  { Clear-RecycleBin-Menu }; "4"  { Open-DiskCleanup }; "5"  { Show-AdvancedUninstaller }
        "6"  { Invoke-NetworkRepair }; "7"  { Show-PowerMenu }; "8"  { Clear-RAM }
        "9"  { Invoke-Defragment }; "10" { Show-SystemHealthMenu }; "11" { Show-UpdateDriverMenu }
        "12" { Show-DNSMenu }; "13" { Invoke-WifiGrabber }; "14" { Invoke-VisualPerf }
        "15" { Invoke-OptimizeWhatsApp }; "16" { exit }
    }
} while ($true)