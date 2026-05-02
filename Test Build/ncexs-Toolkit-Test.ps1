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
    Border = 'DarkGray'; Title = 'Cyan'; Section = 'White'
    MenuNumber = 'DarkCyan'; MenuText = 'Gray'; Special = 'Magenta'
    Highlight = 'White'; Prompt = 'Cyan'; Success = 'Green'
    Error = 'Red'; Warning = 'Yellow'; Info = 'DarkGray'
    Exit = 'Red'; AsciiArt = 'Cyan'
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
        "Menu_OptionL" = "Change Language"
        "SubMenu_Power" = "POWER & BATTERY"; "SubMenu_Update" = "UPDATES & DRIVERS CENTER"
        "DNS_Menu_Text" = "`n [1] Cloudflare (Fastest)`n [2] Google DNS (Stable)`n [3] Quad9 (Privacy)`n [4] AdGuard DNS (Block Ads)`n [5] Reset to Default (DHCP)`n [6] Back"
        "DNS_NoAdapter" = "No active internet adapter found."
        "DNS_Invalid" = "Invalid option"
        "WA_Title" = "WHATSAPP OPTIMIZER"; "WA_Confirm" = "Clear WhatsApp App & Web Caches?"
        "Drive_Space" = "[C: Drive Space]"; "Memory_Status" = "[Memory Status]"
        "Stats_Before" = "Before"; "Stats_After" = "After"; "Stats_Free" = "MB Free"
        "Junk_Cleared" = "Cleared {0} MB"; "RAM_Optimized" = "Memory Optimized. Freed {0} MB."
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
        "Menu_OptionL" = "Ubah Bahasa"
        "SubMenu_Power" = "UTILITAS DAYA & BATERAI"; "SubMenu_Update" = "PUSAT UPDATE & DRIVER"
        "DNS_Menu_Text" = "`n [1] Cloudflare (Tercepat)`n [2] Google DNS (Stabil)`n [3] Quad9 (Privasi)`n [4] AdGuard DNS (Blokir Iklan)`n [5] Reset ke Default (DHCP)`n [6] Kembali"
        "DNS_NoAdapter" = "Tidak ada adapter internet aktif."
        "DNS_Invalid" = "Pilihan tidak valid"
        "WA_Title" = "OPTIMASI WHATSAPP"; "WA_Confirm" = "Bersihkan Cache WhatsApp Apl & Web?"
        "Drive_Space" = "[Ruang Drive C:]"; "Memory_Status" = "[Status Memori]"
        "Stats_Before" = "Sebelum"; "Stats_After" = "Sesudah"; "Stats_Free" = "MB Kosong"
        "Junk_Cleared" = "Berhasil membersihkan {0} MB"; "RAM_Optimized" = "Memori Dioptimasi. Berhasil mengosongkan {0} MB."
        "YesNo" = "(Y/T)"; "SelectOption" = "Pilih opsi"; "PressAnyKey" = "Tekan sembarang tombol..."
    }
}

function Get-Translation { param([string]$key) if ($global:Translations[$global:Language].ContainsKey($key)) { return $global:Translations[$global:Language][$key] } return $key }
function Write-Centered { param([string]$text, [string]$color = $global:Theme.Title, [int]$width = 80) $padLeft = [math]::Max(0, [math]::Floor(($width - $text.Length) / 2)); Write-Host (" " * $padLeft + $text) -ForegroundColor $color }
function Write-BoxHeader { param([string]$title) Write-Host "+------------------------------------------------------------------------------+" -ForegroundColor $global:Theme.Border; $cleanTitle = " $title "; $padLeft = [math]::Max(0, [math]::Floor((78 - $cleanTitle.Length) / 2)); $padRight = [math]::Max(0, (78 - $cleanTitle.Length - $padLeft)); Write-Host "|" -NoNewline -ForegroundColor $global:Theme.Border; Write-Host (" " * $padLeft) -NoNewline; Write-Host $cleanTitle -NoNewline -ForegroundColor $global:Theme.Title; Write-Host (" " * $padRight) -NoNewline; Write-Host "|" -ForegroundColor $global:Theme.Border; Write-Host "+------------------------------------------------------------------------------+" -ForegroundColor $global:Theme.Border }
function Write-Title { param([string]$message) Write-BoxHeader $message }
function Write-Error { param([string]$message) Write-Host " [!] $message" -ForegroundColor $global:Theme.Error }
function Write-Success { param([string]$message) Write-Host " [v] $message" -ForegroundColor $global:Theme.Success }
function Write-Warning { param([string]$message) Write-Host " [!] $message" -ForegroundColor $global:Theme.Warning }
function Write-Info { param([string]$message) Write-Host " [i] $message" -ForegroundColor $global:Theme.Info }
function Request-Confirm { param([string]$msg) $yn = Get-Translation "YesNo"; $c = Read-Host " $msg $yn"; return $c -match '^(Y|y)$' }

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
    Write-Title (Get-Translation 'Compact_Title')
    $rawStatus = compact.exe /CompactOS:query
    Write-Info "Status: $rawStatus"
    if (Request-Confirm (Get-Translation 'Compact_Confirm')) { Write-Host " Sedang mengompresi..." -ForegroundColor Cyan; compact.exe /CompactOS:always; Write-Success (Get-Translation 'Compact_Done') }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-SystemInfo {
    Write-Title (Get-Translation 'System_Title')
    try {
        $os = Get-CimInstance Win32_OperatingSystem; $cpu = Get-CimInstance Win32_Processor; $system = Get-CimInstance Win32_ComputerSystem
        Write-Host "`n [ System Details ]" -ForegroundColor $global:Theme.Section
        Write-Host "   Hostname : $env:COMPUTERNAME"
        Write-Host "   OS       : $($os.Caption)"
        Write-Host "   CPU      : $($cpu.Name.Trim())"
        Write-Host "   RAM      : $([math]::Round($system.TotalPhysicalMemory / 1GB, 2)) GB"
        Write-Host "`n [ Storage ]" -ForegroundColor $global:Theme.Section
        Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object { Write-Host "   [$($_.DeviceID)] $([math]::Round($_.Size/1GB,2)) GB ($([math]::Round($_.FreeSpace/1GB,2)) GB Free)" }
    }
    catch { Write-Error "Error" }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Clear-JunkFiles {
    Write-Title (Get-Translation 'Clean_Title')
    if (-not (Request-Confirm (Get-Translation 'Clean_Confirm'))) { return }
    $cDriveBefore = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
    $freeBeforeMB = [math]::Round($cDriveBefore.FreeSpace / 1MB, 2)
    $totalFreed = 0
    $targets = @("$env:TEMP\*", "$env:SystemRoot\Temp\*", "$env:SystemRoot\Prefetch\*")
    foreach ($p in $targets) {
        $files = Get-ChildItem -Path $p -Recurse -Force -ErrorAction SilentlyContinue
        if ($files) { $totalFreed += ($files | Measure-Object -Property Length -Sum).Sum; $files | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue }
    }
    $cDriveAfter = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
    $freeAfterMB = [math]::Round($cDriveAfter.FreeSpace / 1MB, 2)
    Write-Host "`n $(Get-Translation 'Drive_Space')" -ForegroundColor Cyan
    Write-Host ("   {0,-7} : $freeBeforeMB $(Get-Translation 'Stats_Free')" -f (Get-Translation 'Stats_Before'))
    Write-Host ("   {0,-7} : $freeAfterMB $(Get-Translation 'Stats_Free')" -f (Get-Translation 'Stats_After'))
    Write-Success ((Get-Translation 'Junk_Cleared') -f [math]::Round($totalFreed / 1MB, 2))
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Clear-RecycleBin-Menu { if (-not (Request-Confirm "Kosongkan Recycle Bin?")) { return }; try { Clear-RecycleBin -Force -ErrorAction Stop; Write-Success "Recycle Bin Empty." } catch { Write-Info "Already empty." }; Read-Host "`n $(Get-Translation 'PressAnyKey')" }
function Open-DiskCleanup { if (Request-Confirm "Buka Disk Cleanup?") { cleanmgr.exe /LOWDISK } }

function Show-AdvancedUninstaller {
    Write-Title (Get-Translation 'Uninstall_Title'); Write-Info "Mencari aplikasi..."
    $paths = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')
    $programs = foreach ($p in $paths) { Get-ItemProperty -Path $p -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -and $_.UninstallString } }
    $search = Read-Host " $(Get-Translation 'Uninstall_Prompt')"
    if ($search) {
        $found = $programs | Where-Object { $_.DisplayName -like "*$search*" }
        if ($found) { 
            $count = 1
            foreach ($item in $found) { Write-Host " [$count] $($item.DisplayName)"; $count++ }
            $sel = Read-Host " Pilih nomor"; if ($sel -match '^\d+$') { cmd /c $found[[int]$sel - 1].UninstallString }
        }
        else {
            Write-Warning "Aplikasi tidak ditemukan."
        }
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Invoke-NetworkRepair { if (-not (Request-Confirm "Mulai perbaikan jaringan?")) { return }; Write-Progress -Activity "Repairing..." -Status "Running Commands"; ipconfig /release > $null; ipconfig /renew > $null; ipconfig /flushdns > $null; netsh winsock reset > $null; netsh int ip reset > $null; Write-Success "Done."; Read-Host " Press any key" }

function Show-PowerMenu {
    do {
        Clear-Host
        Write-Title (Get-Translation 'SubMenu_Power')
        Write-Host "`n [1] High Performance`n [2] Balanced`n [3] Back"
        $c = Read-Host " Pilih"; if ($c -eq "1") { powercfg /setactive SCHEME_MIN; Write-Success "Set to High" } elseif ($c -eq "2") { powercfg /setactive SCHEME_BALANCED; Write-Success "Set to Balanced" } elseif ($c -eq "3") { return } else { Write-Warning "Opsi tidak valid" }
        Read-Host " Press any key"
    } while ($true)
}

function Clear-RAM { 
    if (-not (Request-Confirm "Optimasi memori sekarang?")) { return }
    $before = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty FreePhysicalMemory
    $code = "using System; using System.Runtime.InteropServices; public class M { [DllImport(`"psapi.dll`")] public static extern bool EmptyWorkingSet(IntPtr h); public static void C() { foreach(var p in System.Diagnostics.Process.GetProcesses()) try { EmptyWorkingSet(p.Handle); } catch {} } }"
    Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue; [M]::C(); [System.GC]::Collect();
    Start-Sleep -Seconds 1
    $after = Get-CimInstance Win32_OperatingSystem | Select-Object -ExpandProperty FreePhysicalMemory
    $freed = [math]::Round(($after - $before) / 1024, 2)
    if ($freed -lt 0) { $freed = 0 }
    $beforeMB = [math]::Round($before / 1024, 2)
    $afterMB = [math]::Round($after / 1024, 2)
    Write-Host "`n $(Get-Translation 'Memory_Status')" -ForegroundColor Cyan
    Write-Host ("   {0,-7} : $beforeMB $(Get-Translation 'Stats_Free')" -f (Get-Translation 'Stats_Before'))
    Write-Host ("   {0,-7} : $afterMB $(Get-Translation 'Stats_Free')" -f (Get-Translation 'Stats_After'))
    Write-Success ((Get-Translation 'RAM_Optimized') -f $freed)
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Invoke-Defragment { if (-not (Request-Confirm "Optimasi Drive C:?")) { return }; Optimize-Volume -DriveLetter C -Verbose; Read-Host " Done" }
function Show-SystemHealthMenu { if (-not (Request-Confirm "Scan kesehatan sistem? (Butuh beberapa menit)")) { return }; sfc /scannow; dism /online /cleanup-image /restorehealth; Read-Host " Done" }

function Show-UpdateDriverMenu {
    do {
        Clear-Host
        Write-Title (Get-Translation 'SubMenu_Update')
        Write-Host "`n [1] Winget Update All`n [2] Backup Drivers`n [3] Back"
        $c = Read-Host " Pilih"; if ($c -eq "1") { winget upgrade --all --accept-package-agreements --accept-source-agreements --silent } elseif ($c -eq "2") { 
            $dest = "C:\DriversBackup"; if (!(Test-Path -Path $dest)) { New-Item -Path $dest -ItemType Directory }; Export-WindowsDriver -Online -Destination $dest; Write-Success "Backup at $dest"
        }
        elseif ($c -eq "3") { return } else { Write-Warning "Opsi tidak valid" }
        Read-Host " Press any key"
    } while ($true)
}

function Show-DNSMenu { 
    do {
        Clear-Host
        Write-Title (Get-Translation 'Menu_Option12')
        Write-Host (Get-Translation 'DNS_Menu_Text')
        $c = Read-Host " $(Get-Translation 'SelectOption')"
        
        if ($c -eq "6") { return }
        
        $adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.Virtual -eq $false } | Select-Object -First 1
        if (-not $adapter -and $c -match "^[1-5]$") { Write-Error (Get-Translation 'DNS_NoAdapter') }
        elseif ($c -eq "1") { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("1.1.1.1", "1.0.0.1"); Write-Success "DNS: Cloudflare (1.1.1.1)" }
        elseif ($c -eq "2") { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("8.8.8.8", "8.8.4.4"); Write-Success "DNS: Google (8.8.8.8)" }
        elseif ($c -eq "3") { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("9.9.9.9", "149.112.112.112"); Write-Success "DNS: Quad9 (9.9.9.9)" }
        elseif ($c -eq "4") { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("94.140.14.14", "94.140.15.15"); Write-Success "DNS: AdGuard (94.140.14.14)" }
        elseif ($c -eq "5") { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ResetServerAddresses; Write-Success "DNS: Default (DHCP)" }
        else { Write-Warning (Get-Translation 'DNS_Invalid') }
        Read-Host "`n $(Get-Translation 'PressAnyKey')"
    } while ($true)
}

function Invoke-WifiGrabber {
    netsh wlan show profiles | Select-String "All User Profile|Profil Pengguna Semua" | ForEach-Object {
        $n = $_.ToString().Split(":")[1].Trim(); $r = netsh wlan show profile name="$n" key=clear;
        $p = $r | Select-String "Key Content|Konten Kunci"; if ($p) { Write-Host " SSID: $n -> Pass: $($p.ToString().Split(":")[1].Trim())" -ForegroundColor Yellow }
    }; Read-Host "`n Press any key"
}

function Invoke-VisualPerf { if (-not (Request-Confirm "Boost UI sekarang? (Explorer akan direstart)")) { return }; Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value 0; Write-Success "UI Boosted."; Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue }

function Invoke-OptimizeWhatsApp {
    Write-Title (Get-Translation 'WA_Title')
    if (-not (Request-Confirm (Get-Translation 'WA_Confirm'))) { return }
    $freed = 0
    $targets = @(
        @{N = "WA Store"; P = "$env:LOCALAPPDATA\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalCache" },
        @{N = "WA Legacy"; P = "$env:USERPROFILE\AppData\Local\WhatsApp\cache" }
    )
    foreach ($t in $targets) {
        if (Test-Path -Path $t.P) {
            try {
                $f = Get-ChildItem -Path $t.P -Recurse -File -Force -ErrorAction SilentlyContinue
                if ($f) { $freed += ($f | Measure-Object -Property Length -Sum).Sum; $f | Remove-Item -Force -ErrorAction SilentlyContinue }
                Write-Info "Optimized: $($t.N)"
            }
            catch {}
        }
    }
    Write-Success "WhatsApp Optimized. Freed: $([math]::Round($freed / 1MB, 2)) MB"; Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-MainMenu {
    Write-Host "`n"
    $w = 86; $line = "-" * ($w - 2)
    Write-Host ("+" + $line + "+") -ForegroundColor $global:Theme.Border
    Write-Centered "    _  __ ____ ______ _  __ _____" $global:Theme.AsciiArt $w
    Write-Centered "  / |/ // __// ____/| |/_// ___/" $global:Theme.AsciiArt $w
    Write-Centered " /    // /__/ __/  _>  < (__  ) " $global:Theme.AsciiArt $w
    Write-Centered "/_/|_/ \___/_____//_/|_//____/  " $global:Theme.AsciiArt $w
    Write-Host "" ; Write-Centered (Get-Translation 'Menu_Title') $global:Theme.Title $w
    Write-Host ("+" + $line + "+") -ForegroundColor $global:Theme.Border
    Write-Host "| " -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host "[0] " -NoNewline -ForegroundColor $global:Theme.Highlight
    Write-Host ("{0,-35}" -f (Get-Translation 'Menu_Option0')) -NoNewline -ForegroundColor $global:Theme.Highlight
    Write-Host "| " -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host "[L] " -NoNewline -ForegroundColor $global:Theme.Special
    Write-Host ("{0,-36}" -f (Get-Translation 'Menu_OptionL')) -NoNewline -ForegroundColor $global:Theme.Special
    Write-Host "|" -ForegroundColor $global:Theme.Border
    Write-Host ("+" + $line + "+") -ForegroundColor $global:Theme.Border
    for ($i = 1; $i -le 8; $i++) {
        $l_idx = $i; $r_idx = $i + 8; $l_t = Get-Translation "Menu_Option$l_idx"; $r_t = Get-Translation "Menu_Option$r_idx"
        Write-Host "| " -NoNewline -ForegroundColor $global:Theme.Border
        Write-Host ("[{0,-2}]" -f $l_idx) -NoNewline -ForegroundColor $global:Theme.MenuNumber
        Write-Host (" {0,-35}" -f $l_t) -NoNewline -ForegroundColor $global:Theme.MenuText
        Write-Host "| " -NoNewline -ForegroundColor $global:Theme.Border
        $rc = if ($r_idx -eq 16) { $global:Theme.Exit }else { $global:Theme.MenuNumber }
        $rtc = if ($r_idx -eq 16) { $global:Theme.Exit }else { $global:Theme.MenuText }
        Write-Host ("[{0,-2}]" -f $r_idx) -NoNewline -ForegroundColor $rc
        Write-Host (" {0,-36}" -f $r_t) -NoNewline -ForegroundColor $rtc
        Write-Host "|" -ForegroundColor $global:Theme.Border
    }
    Write-Host ("+" + $line + "+") -ForegroundColor $global:Theme.Border
}

Show-Intro
Start-Sleep -Seconds 1
do {
    Clear-Host
    Show-MainMenu
    $choice = Read-Host " $(Get-Translation 'SelectOption')"
    switch ($choice) {
        "0" { Invoke-CompactOS }; "1" { Show-SystemInfo }; "2" { Clear-JunkFiles }
        "3" { Clear-RecycleBin-Menu }; "4" { Open-DiskCleanup }; "5" { Show-AdvancedUninstaller }
        "6" { Invoke-NetworkRepair }; "7" { Show-PowerMenu }; "8" { Clear-RAM }
        "9" { Invoke-Defragment }; "10" { Show-SystemHealthMenu }; "11" { Show-UpdateDriverMenu }
        "12" { Show-DNSMenu }; "13" { Invoke-WifiGrabber }; "14" { Invoke-VisualPerf }
        "15" { Invoke-OptimizeWhatsApp }; "16" { exit }
        "L" { if ($global:Language -eq "EN") { $global:Language = "ID" } else { $global:Language = "EN" } }
        default { Write-Warning "Opsi tidak valid / Invalid option"; Start-Sleep -Seconds 1 }
    }
} while ($true)