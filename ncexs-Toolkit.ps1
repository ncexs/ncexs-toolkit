[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    if ($MyInvocation.MyCommand.Path) {
        Write-Host "Toolkit perlu dijalankan sebagai Administrator. Meminta akses..." -ForegroundColor Yellow
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
        exit
    } else {
        Write-Host "`n[!] AKSES DITOLAK: Anda belum membuka PowerShell sebagai Administrator." -ForegroundColor Red
        Write-Host "Silakan klik kanan pada PowerShell dan pilih 'Run as Administrator', lalu jalankan ulang command-nya.`n" -ForegroundColor Yellow
        Read-Host "Tekan Enter untuk keluar..."
        exit
    }
}

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

$global:ToolkitVersion = "v3.1"
$global:Language = "EN"

$global:Theme = @{
    Border = 'DarkCyan'; Title = 'Cyan'; Section = 'Magenta'
    MenuNumber = 'Cyan'; MenuText = 'White'; Special = 'Yellow'
    Highlight = 'Green'; Prompt = 'Cyan'; Success = 'Green'
    Error = 'Red'; Warning = 'Yellow'; Info = 'Gray'
    Exit = 'Red'; AsciiArt = 'Magenta'
}

$global:UI = @{
    HLine = [char]0x2500; VLine = [char]0x2502
    TopLeft = [char]0x256D; TopRight = [char]0x256E
    BottomLeft = [char]0x2570; BottomRight = [char]0x256F
    LeftT = [char]0x251C; RightT = [char]0x2524
    Check = [char]0x2714; Cross = [char]0x2718
    RArrow = [char]0x00BB; LArrow = [char]0x00AB
}
try { $Host.PrivateData.PromptForegroundColor = $global:Theme.Prompt } catch {}

$global:Translations = @{
    "EN" = @{
        "Menu_Title" = "ncexs Toolkit $($global:ToolkitVersion)"; "Menu_Option0" = "Compact OS (Save 2-5GB Space)"
        "Menu_Option1" = "System Information"; "Menu_Option2" = "Enhanced Junk Cleaner"
        "Menu_Option3" = "Empty Recycle Bin"; "Menu_Option4" = "Open Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"; "Menu_Option6" = "Network Repair"
        "Menu_Option7" = "Power & Battery Utilities"; "Menu_Option8" = "Memory Optimizer"
        "Menu_Option9" = "Defrag & Optimize Drives"; "Menu_Option10" = "System Health Checker"
        "Menu_Option11" = "Updates & Drivers Center"; "Menu_Option12" = "DNS Changer"
        "Menu_Option13" = "Wi-Fi Password Recovery"; "Menu_Option14" = "Visual FX Booster"
        "Menu_Option15" = "Clear App Caches"; "Menu_Option16" = "Clear Event Logs"; "Menu_Option17" = "Exit Toolkit"
        "Menu_OptionL" = "Change Language"
        "SubMenu_Power" = "POWER & BATTERY"; "SubMenu_Update" = "UPDATES & DRIVERS CENTER"
        "DNS_Menu_Text" = "`n [1] Cloudflare (Fastest)`n [2] Google DNS (Stable)`n [3] Quad9 (Privacy)`n [4] AdGuard DNS (Block Ads)`n [5] Reset to Default (DHCP)`n [6] Back"
        "DNS_NoAdapter" = "No active internet adapter found."
        "DNS_Invalid" = "Invalid option"
        "WA_Title" = "APP CACHE CLEANER"; "WA_Confirm" = "Clear caches for Discord, Spotify, Steam, Telegram, WhatsApp?"
        "Drive_Space" = "[C: Drive Space]"; "Memory_Status" = "[Memory Status]"
        "Stats_Before" = "Before"; "Stats_After" = "After"; "Stats_Free" = "MB Free"
        "Junk_Cleared" = "Cleared {0} MB"; "RAM_Optimized" = "Memory Optimized. Freed {0} MB."
        "YesNo" = "(Y/N)"; "SelectOption" = "Select option"; "PressAnyKey" = "Press any key..."
        "Process_Cancel" = "Press Ctrl+C to cancel/abort the running process."
        "Process_Aborted" = "Process cancelled/aborted by user. Returning to main menu..."
        "Compact_Title" = "COMPACT OS"; "Compact_Confirm" = "Start compressing OS?"; "Compact_Done" = "OS Compression completed."
        "System_Title" = "SYSTEM INFORMATION"; "Clean_Title" = "JUNK CLEANER"; "Clean_Confirm" = "Start scanning and cleaning junk files?"
        "Uninstall_Title" = "ADVANCED UNINSTALLER"; "Uninstall_Prompt" = "Enter application name to search:"
        "Uninstall_Search" = "Searching for installed applications..."; "Uninstall_NotFound" = "Application not found."
        "Recycle_Confirm" = "Empty Recycle Bin?"; "Recycle_Success" = "Recycle Bin Emptied."; "Recycle_Empty" = "Recycle Bin is already empty."
        "Disk_Confirm" = "Open Windows Disk Cleanup?"
        "Net_Confirm" = "Start network repair?"; "Net_Release" = "Releasing IP Address..."; "Net_Renew" = "Renewing IP Address (Renew)..."
        "Net_Flush" = "Flushing DNS Cache (Flush DNS)..."; "Net_Winsock" = "Resetting Winsock..."; "Net_TCP" = "Resetting TCP/IP..."
        "Net_Done" = "Network repair completed."
        "Invalid_Option" = "Invalid option"; "RAM_Confirm" = "Optimize memory now?"; "Defrag_Confirm" = "Optimize C: Drive?"
        "Health_Confirm" = "Scan system health? (Takes a few minutes)"; "Update_Backup" = "Backup created at"
        "Visual_Confirm" = "Boost UI now? (Explorer will restart)"; "Visual_Success" = "UI Boosted."
        "Event_Confirm" = "Clear all Windows Event Logs? (May take a minute)"; "Event_Done" = "Event Logs cleared."
    };
    "ID" = @{
        "Menu_Title" = "ncexs Toolkit $($global:ToolkitVersion)"; "Menu_Option0" = "Compact OS (Hemat 2-5GB Space)"
        "Menu_Option1" = "Informasi Sistem"; "Menu_Option2" = "Pembersih Sampah (Enhanced)"
        "Menu_Option3" = "Kosongkan Recycle Bin"; "Menu_Option4" = "Buka Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"; "Menu_Option6" = "Perbaikan Jaringan"
        "Menu_Option7" = "Utilitas Daya & Baterai"; "Menu_Option8" = "Optimasi Memori"
        "Menu_Option9" = "Defragment & Optimasi Drive"; "Menu_Option10" = "Pemeriksa Kesehatan Sistem"
        "Menu_Option11" = "Pusat Update & Driver"; "Menu_Option12" = "Pengubah DNS"
        "Menu_Option13" = "Wi-Fi Password Recovery"; "Menu_Option14" = "Visual FX Booster"
        "Menu_Option15" = "Pembersih Cache Aplikasi"; "Menu_Option16" = "Hapus Event Logs"; "Menu_Option17" = "Keluar Aplikasi"
        "Menu_OptionL" = "Ubah Bahasa"
        "SubMenu_Power" = "UTILITAS DAYA & BATERAI"; "SubMenu_Update" = "PUSAT UPDATE & DRIVER"
        "DNS_Menu_Text" = "`n [1] Cloudflare (Tercepat)`n [2] Google DNS (Stabil)`n [3] Quad9 (Privasi)`n [4] AdGuard DNS (Blokir Iklan)`n [5] Reset ke Default (DHCP)`n [6] Kembali"
        "DNS_NoAdapter" = "Tidak ada adapter internet aktif."
        "DNS_Invalid" = "Pilihan tidak valid"
        "WA_Title" = "PEMBERSIH CACHE APLIKASI"; "WA_Confirm" = "Bersihkan Cache Discord, Spotify, Steam, Telegram, WhatsApp?"
        "Drive_Space" = "[Ruang Drive C:]"; "Memory_Status" = "[Status Memori]"
        "Stats_Before" = "Sebelum"; "Stats_After" = "Sesudah"; "Stats_Free" = "MB Kosong"
        "Junk_Cleared" = "Berhasil membersihkan {0} MB"; "RAM_Optimized" = "Memori Dioptimasi. Berhasil mengosongkan {0} MB."
        "YesNo" = "(Y/T)"; "SelectOption" = "Pilih opsi"; "PressAnyKey" = "Tekan sembarang tombol..."
        "Process_Cancel" = "Tekan Ctrl+C untuk membatalkan/menghentikan proses yang sedang berjalan."
        "Process_Aborted" = "Proses dibatalkan oleh pengguna. Kembali ke menu utama..."
        "Compact_Title" = "COMPACT OS"; "Compact_Confirm" = "Mulai kompresi OS?"; "Compact_Done" = "Kompresi OS selesai."
        "System_Title" = "INFORMASI SISTEM"; "Clean_Title" = "PEMBERSIH SAMPAH"; "Clean_Confirm" = "Mulai memindai dan membersihkan file sampah?"
        "Uninstall_Title" = "ADVANCED UNINSTALLER"; "Uninstall_Prompt" = "Masukkan nama aplikasi yang dicari:"
        "Uninstall_Search" = "Mencari aplikasi terinstal..."; "Uninstall_NotFound" = "Aplikasi tidak ditemukan."
        "Recycle_Confirm" = "Kosongkan Recycle Bin?"; "Recycle_Success" = "Recycle Bin berhasil dikosongkan."; "Recycle_Empty" = "Recycle Bin sudah kosong."
        "Disk_Confirm" = "Buka Windows Disk Cleanup?"
        "Net_Confirm" = "Mulai perbaikan jaringan?"; "Net_Release" = "Melepaskan IP Address..."; "Net_Renew" = "Memperbarui IP Address (Renew)..."
        "Net_Flush" = "Membersihkan DNS Cache (Flush DNS)..."; "Net_Winsock" = "Mereset Winsock..."; "Net_TCP" = "Mereset TCP/IP..."
        "Net_Done" = "Perbaikan jaringan selesai."
        "Invalid_Option" = "Opsi tidak valid"; "RAM_Confirm" = "Optimasi memori sekarang?"; "Defrag_Confirm" = "Optimasi Drive C:?"
        "Health_Confirm" = "Scan kesehatan sistem? (Butuh beberapa menit)"; "Update_Backup" = "Backup selesai di"
        "Visual_Confirm" = "Boost UI sekarang? (Explorer akan direstart)"; "Visual_Success" = "UI Boosted."
        "Event_Confirm" = "Bersihkan semua log Windows Event Viewer? (Butuh 1 menit)"; "Event_Done" = "Event Logs berhasil dibersihkan."
    }
}

function Get-Translation { param([string]$key) if ($global:Translations[$global:Language].ContainsKey($key)) { return $global:Translations[$global:Language][$key] } return $key }
function Write-Centered { param([string]$text, [string]$color = $global:Theme.Title, [int]$width = 80) $padLeft = [math]::Max(0, [math]::Floor(($width - $text.Length) / 2)); Write-Host (" " * $padLeft + $text) -ForegroundColor $color }
function Write-BoxHeader { param([string]$title) $w=86; $l=[string]$global:UI.HLine*($w-4); Write-Host (" {0}{1}{2}" -f $global:UI.TopLeft,$l,$global:UI.TopRight) -ForegroundColor $global:Theme.Border; $cleanTitle = " $title "; $padLeft = [math]::Max(0, [math]::Floor((($w-4) - $cleanTitle.Length) / 2)); $padRight = [math]::Max(0, (($w-4) - $cleanTitle.Length - $padLeft)); Write-Host " $($global:UI.VLine)" -NoNewline -ForegroundColor $global:Theme.Border; Write-Host (" " * $padLeft) -NoNewline; Write-Host $cleanTitle -NoNewline -ForegroundColor $global:Theme.Title; Write-Host (" " * $padRight) -NoNewline; Write-Host "$($global:UI.VLine)" -ForegroundColor $global:Theme.Border; Write-Host (" {0}{1}{2}" -f $global:UI.BottomLeft,$l,$global:UI.BottomRight) -ForegroundColor $global:Theme.Border }
function Write-Title { param([string]$message) Write-BoxHeader $message }
function Write-Error { param([string]$message) Write-Host " [$($global:UI.Cross)] $message" -ForegroundColor $global:Theme.Error }
function Write-Success { param([string]$message) Write-Host " [$($global:UI.Check)] $message" -ForegroundColor $global:Theme.Success }
function Write-Warning { param([string]$message) Write-Host " [!] $message" -ForegroundColor $global:Theme.Warning }
function Write-Info { param([string]$message) Write-Host " [i] $message" -ForegroundColor $global:Theme.Info }
function Request-Confirm {
    param([string]$msg)
    Write-Info (Get-Translation 'Process_Cancel')
    $yn = Get-Translation "YesNo"
    $c = Read-Host " $msg $yn"
    return $c -match '^(Y|y)$'
}

function Show-Intro {
    Clear-Host; Write-Host ""
    $w = 86
    Write-Centered ' __    __   ______   ________  __    __   ______  ' $global:Theme.AsciiArt $w
    Write-Centered '|  \  |  \ /      \ |        \|  \  /  \ /      \ ' $global:Theme.AsciiArt $w
    Write-Centered '| $$\ | $$|  $$$$$$\| $$$$$$$$ \$$\/  $$|  $$$$$$\' $global:Theme.AsciiArt $w
    Write-Centered '| $$$\| $$| $$   \$$| $$__      >$$  $$ | $$___\$$' $global:Theme.AsciiArt $w
    Write-Centered '| $$$$\ $$| $$      | $$  \    /  $$$$\  \$$    \ ' $global:Theme.AsciiArt $w
    Write-Centered '| $$\$$ $$| $$   __ | $$$$$   |  $$ \$$\ _\$$$$$$\' $global:Theme.AsciiArt $w
    Write-Centered '| $$ \$$$$| $$__/  \| $$_____ | $$  | $$|  \__| $$' $global:Theme.AsciiArt $w
    Write-Centered '| $$  \$$$ \$$    $$| $$     \| $$  | $$ \$$    $$' $global:Theme.AsciiArt $w
    Write-Centered ' \$$   \$$  \$$$$$$  \$$$$$$$$ \$$   \$$  \$$$$$$ ' $global:Theme.AsciiArt $w
    Write-Host "" ; Write-Centered "S T A B L E    B U I L D" "Cyan" $w; Write-Host ""
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
        $os = Get-CimInstance Win32_OperatingSystem
        $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
        $system = Get-CimInstance Win32_ComputerSystem
        $gpu = Get-CimInstance Win32_VideoController | Select-Object -ExpandProperty Name
        $mobo = Get-CimInstance Win32_BaseBoard
        $bios = Get-CimInstance Win32_BIOS
        
        $uptime = (Get-Date) - $os.LastBootUpTime
        $uptimeStr = "$($uptime.Days) Hari, $($uptime.Hours) Jam, $($uptime.Minutes) Menit"
        
        Write-Host "`n [ System Details ]" -ForegroundColor $global:Theme.Section
        Write-Host "   Hostname     : $env:COMPUTERNAME"
        Write-Host "   OS           : $($os.Caption) ($($os.OSArchitecture))"
        Write-Host "   OS Build     : $($os.Version)"
        Write-Host "   System Uptime: $uptimeStr"
        Write-Host "`n [ Hardware ]" -ForegroundColor $global:Theme.Section
        Write-Host "   Motherboard  : $($mobo.Manufacturer) $($mobo.Product)"
        Write-Host "   Serial Number: $($bios.SerialNumber)"
        Write-Host "   CPU          : $($cpu.Name.Trim())"
        Write-Host "   GPU          : $($gpu -join ' | ')"
        Write-Host "   RAM          : $([math]::Round($system.TotalPhysicalMemory / 1GB, 2)) GB Total"
        
        Write-Host "`n [ Storage (Local Drives) ]" -ForegroundColor $global:Theme.Section
        Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object { 
            $total = [math]::Round($_.Size/1GB, 2)
            $free = [math]::Round($_.FreeSpace/1GB, 2)
            $usedPct = [math]::Round((($total-$free)/$total)*100, 1)
            Write-Host "   $($_.DeviceID)\          : $total GB Total | $free GB Free | Used: $usedPct%" 
        }
    }
    catch { Write-Error "Failed to load some system info." }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Clear-JunkFiles {
    Write-Title (Get-Translation 'Clean_Title')
    if (-not (Request-Confirm (Get-Translation 'Clean_Confirm'))) { return }
    $cDriveBefore = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
    $freeBeforeMB = [math]::Round($cDriveBefore.FreeSpace / 1MB, 2)
    $totalFreed = 0
    $targets = @(
        "$env:TEMP\*", 
        "$env:SystemRoot\Temp\*", 
        "$env:SystemRoot\Prefetch\*",
        "$env:SystemRoot\SoftwareDistribution\Download\*",
        "$env:LOCALAPPDATA\CrashDumps\*",
        "$env:ProgramData\Microsoft\Windows\WER\ReportArchive\*",
        "$env:SystemRoot\Logs\CBS\*.log"
    )
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

function Clear-RecycleBin-Menu { 
    if (-not (Request-Confirm (Get-Translation 'Recycle_Confirm'))) { return }
    try { 
        $items = (New-Object -ComObject Shell.Application).NameSpace(0x0a).Items()
        $size = 0; if ($items) { foreach ($i in $items) { $size += $i.Size } }
        Clear-RecycleBin -Force -ErrorAction Stop
        Write-Success ((Get-Translation 'Recycle_Success') + " Freed: $([math]::Round($size / 1MB, 2)) MB")
    } catch { 
        Write-Info (Get-Translation 'Recycle_Empty') 
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')" 
}
function Open-DiskCleanup { if (Request-Confirm (Get-Translation 'Disk_Confirm')) { cleanmgr.exe /LOWDISK } }

function Show-AdvancedUninstaller {
    Write-Title (Get-Translation 'Uninstall_Title'); Write-Info (Get-Translation 'Uninstall_Search')
    $paths = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')
    $programs = foreach ($p in $paths) { Get-ItemProperty -Path $p -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -and $_.UninstallString } }
    $search = Read-Host " $(Get-Translation 'Uninstall_Prompt')"
    if ($search) {
        $found = $programs | Where-Object { $_.DisplayName -like "*$search*" }
        if ($found) { 
            $count = 1
            foreach ($item in $found) { Write-Host " [$count] $($item.DisplayName)"; $count++ }
            $sel = Read-Host " $(Get-Translation 'SelectOption')"; if ($sel -match '^\d+$') { cmd /c $found[[int]$sel - 1].UninstallString }
        }
        else {
            Write-Warning (Get-Translation 'Uninstall_NotFound')
        }
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Invoke-NetworkRepair {
    if (-not (Request-Confirm (Get-Translation 'Net_Confirm'))) { return }
    Write-Info (Get-Translation 'Net_Release')
    ipconfig /release > $null
    Write-Info (Get-Translation 'Net_Renew')
    ipconfig /renew > $null
    Write-Info (Get-Translation 'Net_Flush')
    ipconfig /flushdns > $null
    Write-Info (Get-Translation 'Net_Winsock')
    netsh winsock reset > $null
    Write-Info (Get-Translation 'Net_TCP')
    netsh int ip reset > $null
    Write-Success (Get-Translation 'Net_Done')
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-PowerMenu {
    do {
        Clear-Host
        Write-Title (Get-Translation 'SubMenu_Power')
        Write-Host "`n [1] High Performance`n [2] Balanced`n [3] Back"
        $c = Read-Host " $(Get-Translation 'SelectOption')"; if ($c -eq "1") { powercfg /setactive SCHEME_MIN; Write-Success "Set to High" } elseif ($c -eq "2") { powercfg /setactive SCHEME_BALANCED; Write-Success "Set to Balanced" } elseif ($c -eq "3") { return } else { Write-Warning (Get-Translation 'Invalid_Option') }
        Read-Host " $(Get-Translation 'PressAnyKey')"
    } while ($true)
}

function Clear-RAM { 
    if (-not (Request-Confirm (Get-Translation 'RAM_Confirm'))) { return }
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

function Invoke-Defragment { if (-not (Request-Confirm (Get-Translation 'Defrag_Confirm'))) { return }; Optimize-Volume -DriveLetter C -Verbose; Read-Host "`n $(Get-Translation 'PressAnyKey')" }
function Show-SystemHealthMenu { 
    if (-not (Request-Confirm (Get-Translation 'Health_Confirm'))) { return }
    Write-Host "`n [1/3] Menjalankan System File Checker (SFC)..." -ForegroundColor Cyan; sfc /scannow
    Write-Host "`n [2/3] Menjalankan Deployment Image Servicing (DISM)..." -ForegroundColor Cyan; dism /online /cleanup-image /restorehealth
    Write-Host "`n [3/3] Memindai Error pada Drive C: (CHKDSK)..." -ForegroundColor Cyan; chkdsk C: /scan
    Read-Host "`n $(Get-Translation 'PressAnyKey')" 
}

function Show-UpdateDriverMenu {
    Write-Host ""
    Write-Title (Get-Translation 'SubMenu_Update')
    Write-Host "`n [1] Winget Update All`n [2] Backup Drivers`n [3] Back"
    $c = Read-Host " $(Get-Translation 'SelectOption')"
    if ($c -eq "1") {
        Write-Info (Get-Translation 'Process_Cancel')
        winget upgrade --all --accept-package-agreements --accept-source-agreements --silent
    } elseif ($c -eq "2") {
        Write-Info (Get-Translation 'Process_Cancel')
        $dest = "C:\DriversBackup"; if (!(Test-Path -Path $dest)) { New-Item -Path $dest -ItemType Directory }; Export-WindowsDriver -Online -Destination $dest; Write-Success "$(Get-Translation 'Update_Backup') $dest"
    }
    elseif ($c -eq "3") { return } else { Write-Warning (Get-Translation 'Invalid_Option') }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-DNSMenu { 
    Write-Host ""
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
}

function Invoke-WifiGrabber {
    netsh wlan show profiles | Select-String "All User Profile|Profil Pengguna Semua" | ForEach-Object {
        $n = $_.ToString().Split(":")[1].Trim(); $r = netsh wlan show profile name="$n" key=clear;
        $p = $r | Select-String "Key Content|Konten Kunci"; if ($p) { Write-Host " SSID: $n -> Pass: $($p.ToString().Split(":")[1].Trim())" -ForegroundColor Yellow }
    }; Read-Host "`n Press any key"
}

function Invoke-VisualPerf { if (-not (Request-Confirm (Get-Translation 'Visual_Confirm'))) { return }; Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value 0; Write-Success (Get-Translation 'Visual_Success'); Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue }

function Invoke-OptimizeApps {
    Write-Title (Get-Translation 'WA_Title')
    if (-not (Request-Confirm (Get-Translation 'WA_Confirm'))) { return }
    $freed = 0
    $targets = @(
        @{N = "WA Store"; P = "$env:LOCALAPPDATA\Packages\5319275A.WhatsAppDesktop_cv1g1gvanyjgm\LocalCache" },
        @{N = "WA Legacy"; P = "$env:USERPROFILE\AppData\Local\WhatsApp\cache" },
        @{N = "Discord"; P = "$env:APPDATA\discord\Cache" },
        @{N = "Discord Code"; P = "$env:APPDATA\discord\Code Cache\js" },
        @{N = "Spotify"; P = "$env:LOCALAPPDATA\Spotify\Storage" },
        @{N = "Steam Web"; P = "$env:LOCALAPPDATA\Steam\htmlcache" },
        @{N = "Telegram"; P = "$env:APPDATA\Telegram Desktop\tdata\user_data\cache" }
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
    Write-Success "Apps Optimized. Freed: $([math]::Round($freed / 1MB, 2)) MB"; Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Clear-EventLogs {
    Write-Title (Get-Translation 'Menu_Option16')
    if (-not (Request-Confirm (Get-Translation 'Event_Confirm'))) { return }
    Write-Host " Clearing Event Logs (Wait a few seconds)..." -ForegroundColor Cyan
    $logPath = "$env:SystemRoot\System32\Winevt\Logs\*"
    $beforeSize = 0; try { $beforeSize = (Get-ChildItem -Path $logPath -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum } catch {}
    wevtutil el | ForEach-Object { wevtutil cl "$_" 2>$null }
    $afterSize = 0; try { $afterSize = (Get-ChildItem -Path $logPath -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum } catch {}
    $freed = $beforeSize - $afterSize; if ($freed -lt 0) { $freed = 0 }
    Write-Success ((Get-Translation 'Event_Done') + " Freed: $([math]::Round($freed / 1MB, 2)) MB")
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-MainMenu {
    Write-Host "`n"
    $w = 86; $line = [string]$global:UI.HLine * ($w - 4)
    Write-Centered ' __    __   ______   ________  __    __   ______  ' $global:Theme.AsciiArt $w
    Write-Centered '|  \  |  \ /      \ |        \|  \  /  \ /      \ ' $global:Theme.AsciiArt $w
    Write-Centered '| $$\ | $$|  $$$$$$\| $$$$$$$$ \$$\/  $$|  $$$$$$\' $global:Theme.AsciiArt $w
    Write-Centered '| $$$\| $$| $$   \$$| $$__      >$$  $$ | $$___\$$' $global:Theme.AsciiArt $w
    Write-Centered '| $$$$\ $$| $$      | $$  \    /  $$$$\  \$$    \ ' $global:Theme.AsciiArt $w
    Write-Centered '| $$\$$ $$| $$   __ | $$$$$   |  $$ \$$\ _\$$$$$$\' $global:Theme.AsciiArt $w
    Write-Centered '| $$ \$$$$| $$__/  \| $$_____ | $$  | $$|  \__| $$' $global:Theme.AsciiArt $w
    Write-Centered '| $$  \$$$ \$$    $$| $$     \| $$  | $$ \$$    $$' $global:Theme.AsciiArt $w
    Write-Centered ' \$$   \$$  \$$$$$$  \$$$$$$$$ \$$   \$$  \$$$$$$ ' $global:Theme.AsciiArt $w
    Write-Host ""
    Write-Host (" {0}{1}{2}" -f $global:UI.TopLeft, $line, $global:UI.TopRight) -ForegroundColor $global:Theme.Border
    $title = " $($global:UI.RArrow) $(Get-Translation 'Menu_Title') $($global:UI.LArrow) "
    $padLeft = [math]::Max(0, [math]::Floor((($w - 4) - $title.Length) / 2))
    $padRight = [math]::Max(0, (($w - 4) - $title.Length - $padLeft))
    Write-Host " $($global:UI.VLine)" -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host (" " * $padLeft) -NoNewline
    Write-Host $title -NoNewline -ForegroundColor $global:Theme.Title
    Write-Host (" " * $padRight) -NoNewline
    Write-Host "$($global:UI.VLine)" -ForegroundColor $global:Theme.Border
    Write-Host (" {0}{1}{2}" -f $global:UI.LeftT, $line, $global:UI.RightT) -ForegroundColor $global:Theme.Border
    Write-Host " $($global:UI.VLine) " -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host "[0] " -NoNewline -ForegroundColor $global:Theme.Highlight
    Write-Host ("{0,-34}" -f (Get-Translation 'Menu_Option0')) -NoNewline -ForegroundColor $global:Theme.Highlight
    Write-Host " $($global:UI.VLine) " -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host "[L] " -NoNewline -ForegroundColor $global:Theme.Special
    Write-Host ("{0,-35}" -f (Get-Translation 'Menu_OptionL')) -NoNewline -ForegroundColor $global:Theme.Special
    Write-Host " $($global:UI.VLine)" -ForegroundColor $global:Theme.Border
    Write-Host (" {0}{1}{2}" -f $global:UI.LeftT, $line, $global:UI.RightT) -ForegroundColor $global:Theme.Border
    for ($i = 1; $i -le 9; $i++) {
        $l_idx = $i; $r_idx = $i + 9
        $l_t = Get-Translation "Menu_Option$l_idx"
        Write-Host " $($global:UI.VLine) " -NoNewline -ForegroundColor $global:Theme.Border
        Write-Host ("[{0,-2}]" -f $l_idx) -NoNewline -ForegroundColor $global:Theme.MenuNumber
        Write-Host (" {0,-34}" -f $l_t) -NoNewline -ForegroundColor $global:Theme.MenuText
        Write-Host "$($global:UI.VLine) " -NoNewline -ForegroundColor $global:Theme.Border
        if ($r_idx -le 17) {
            $r_t = Get-Translation "Menu_Option$r_idx"
            $rc = if ($r_idx -eq 17) { $global:Theme.Exit } else { $global:Theme.MenuNumber }
            $rtc = if ($r_idx -eq 17) { $global:Theme.Exit } else { $global:Theme.MenuText }
            Write-Host ("[{0,-2}]" -f $r_idx) -NoNewline -ForegroundColor $rc
            Write-Host (" {0,-35}" -f $r_t) -NoNewline -ForegroundColor $rtc
        } else {
            Write-Host (" " * 40) -NoNewline
        }
        Write-Host "$($global:UI.VLine)" -ForegroundColor $global:Theme.Border
    }
    Write-Host (" {0}{1}{2}" -f $global:UI.BottomLeft, $line, $global:UI.BottomRight) -ForegroundColor $global:Theme.Border
}

Show-Intro
Start-Sleep -Seconds 1
do {
    trap [System.Management.Automation.PipelineStoppedException] {
        Write-Host "`n"
        Write-Warning (Get-Translation 'Process_Aborted')
        Start-Sleep -Seconds 2
        continue
    }
    Clear-Host
    Show-MainMenu
    $choice = Read-Host " $(Get-Translation 'SelectOption')"
    switch ($choice) {
        "0" { Invoke-CompactOS }; "1" { Show-SystemInfo }; "2" { Clear-JunkFiles }
        "3" { Clear-RecycleBin-Menu }; "4" { Open-DiskCleanup }; "5" { Show-AdvancedUninstaller }
        "6" { Invoke-NetworkRepair }; "7" { Show-PowerMenu }; "8" { Clear-RAM }
        "9" { Invoke-Defragment }; "10" { Show-SystemHealthMenu }; "11" { Show-UpdateDriverMenu }
        "12" { Show-DNSMenu }; "13" { Invoke-WifiGrabber }; "14" { Invoke-VisualPerf }
        "15" { Invoke-OptimizeApps }; "16" { Clear-EventLogs }
        "17" { exit }
        "L" { if ($global:Language -eq "EN") { $global:Language = "ID" } else { $global:Language = "EN" } }
        default { Write-Warning (Get-Translation 'Invalid_Option'); Start-Sleep -Seconds 1 }
    }
} while ($true)