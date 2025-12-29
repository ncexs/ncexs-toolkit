<#
===============================================
  ncexs Toolkit v2.5 Tes Version (Fix Translate)
===============================================
#>

# 1. Setup Encoding & Admin Check
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Ensure running as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Toolkit perlu dijalankan sebagai Administrator" -ForegroundColor Yellow
    Write-Host "Memulai ulang sebagai Administrator..." -ForegroundColor Green
    Start-Sleep -Seconds 2
    $scriptPath = $MyInvocation.MyCommand.Path
    if (-not $scriptPath) {
        $scriptPath = ".\" + $MyInvocation.MyCommand.Name
    }
    $resolvedScriptPath = (Resolve-Path -Path $scriptPath).Path
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$resolvedScriptPath`"" -Verb RunAs
    exit
}

# Set execution policy
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

# ---------------------------
# Global vars & Translations
# ---------------------------
$global:ToolkitVersion = "2.5 Tes Version"
$global:Language = "ID"  # default

# ---------------------------
# Color Theme
# ---------------------------
$global:Theme = @{
    Border      = 'Cyan'
    Title       = 'White'
    Section     = 'DarkCyan'
    MenuNumber  = 'Cyan'
    MenuText    = 'Gray'
    Highlight   = 'White'
    Prompt      = 'Yellow'
    Success     = 'Green'
    Error       = 'Red'
    Warning     = 'Magenta'
    Info        = 'DarkGray'
    Exit        = 'Red'
    AsciiArt    = 'Cyan'
}

# Fix Read-Host color prompt
try { $Host.PrivateData.PromptForegroundColor = $global:Theme.Prompt } catch {}

# ---------------------------
# Translations
# ---------------------------
$global:Translations = @{
    "EN" = @{
        "Menu_Title" = ("ncexs Toolkit v{0}" -f $global:ToolkitVersion)
        "Menu_Option1" = "System Information"
        "Menu_Option2" = "Junk Cleaner"
        "Menu_Option3" = "Empty Recycle Bin"
        "Menu_Option4" = "Open Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"
        "Menu_Option6" = "Network Repair"
        "Menu_Option7" = "Power & Battery Utilities"
        "Menu_Option8" = "Memory Optimizer"
        "Menu_Option9" = "Defrag & Optimize Drives"
        "Menu_Option10" = "System Health Checker"
        "Menu_Option11" = "Windows Update Fixer"
        "Menu_Option12" = "DNS Changer"
        "Menu_Option13" = "Language Settings"
        "Menu_Option14" = "Exit"
        "SubMenu_Power" = "POWER & BATTERY"
        "SubMenu_Power1" = "Change Power Plan"
        "SubMenu_Power2" = "Generate Battery Report"
        "SubMenu_Power3" = "Back"
        "Power_Prompt"   = "Change Power Plan?"
        "Power_Options"  = "[1] Saver | [2] Balanced | [3] High"
        "Power_Success"  = "Power plan updated."
        "Battery_Prompt" = "Generate battery report?"
        "Battery_Gen"    = "Generating HTML report..."
        "PressAnyKey" = "Press any key to continue..."
        "InvalidOption" = "Invalid option. Please try again."
        "ExitMessage" = "Thank you for using ncexs Toolkit!"
        "SelectOption" = "Select option"
        "Disk" = "Disk"
        "Free" = "Free"
        "OS" = "Operating System"
        "Version" = "Version"
        "CPU" = "Processor"
        "RAM" = "RAM"
        "GPU" = "GPU"
        "Hostname" = "Computer Name"
        "SerialNumber" = "Serial Number"
        "System_Error" = "Error retrieving system information"
        "Uninstall_Title" = "SMART UNINSTALLER"
        "Uninstall_Scanning" = "Scanning installed programs..."
        "Uninstall_Found" = "Database loaded: {0} programs found."
        "Uninstall_Prompt" = "Enter app name/initial (or 'b' to back):"
        "Uninstall_FoundMultiple" = "Matches found:"
        "Uninstall_Confirm" = "Uninstall this program?"
        "Clean_Title" = "JUNK CLEANER"
        "Clean_Confirm" = "Clean temporary files?"
        "Update_Title"  = "WINDOWS UPDATE FIXER"
        "Update_Warn"   = "Reset Update Services?"
        "Confirm_Action" = "Are you sure you want to proceed?"
        "YesNo" = "(Y/N)"
    };
    "ID" = @{
        "Menu_Title" = ("ncexs Toolkit v{0}" -f $global:ToolkitVersion)
        "Menu_Option1" = "Informasi Sistem"
        "Menu_Option2" = "Pembersih Sampah"
        "Menu_Option3" = "Kosongkan Recycle Bin"
        "Menu_Option4" = "Buka Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"
        "Menu_Option6" = "Perbaikan Jaringan"
        "Menu_Option7" = "Utilitas Daya & Baterai"
        "Menu_Option8" = "Optimasi Memori"
        "Menu_Option9" = "Defragment & Optimasi Drive"
        "Menu_Option10" = "Pemeriksa Kesehatan Sistem"
        "Menu_Option11" = "Perbaikan Windows Update"
        "Menu_Option12" = "Pengubah DNS"
        "Menu_Option13" = "Pengaturan Bahasa"
        "Menu_Option14" = "Keluar"
        "SubMenu_Power" = "UTILITAS DAYA & BATERAI"
        "SubMenu_Power1" = "Ubah Rencana Daya (Power Plan)"
        "SubMenu_Power2" = "Buat Laporan Kesehatan Baterai"
        "SubMenu_Power3" = "Kembali"
        "Power_Prompt"   = "Ubah Power Plan?"
        "Power_Options"  = "[1] Hemat Daya | [2] Seimbang | [3] Performa Tinggi"
        "Power_Success"  = "Rencana daya berhasil diperbarui."
        "Battery_Prompt" = "Buat laporan baterai?"
        "Battery_Gen"    = "Sedang membuat laporan HTML..."
        "PressAnyKey" = "Tekan sembarang tombol untuk melanjutkan..."
        "InvalidOption" = "Pilihan tidak valid. Silakan coba lagi."
        "ExitMessage" = "Terima kasih telah menggunakan ncexs Toolkit!"
        "SelectOption" = "Pilih opsi"
        "Disk" = "Disk"
        "Free" = "Bebas"
        "OS" = "Sistem Operasi"
        "Version" = "Versi"
        "CPU" = "Prosesor"
        "RAM" = "RAM"
        "GPU" = "GPU"
        "Hostname" = "Nama Komputer"
        "SerialNumber" = "Nomor Seri"
        "System_Error" = "Kesalahan mengambil informasi sistem"
        "Uninstall_Title" = "SMART UNINSTALLER"
        "Uninstall_Scanning" = "Memindai program terinstal..."
        "Uninstall_Found" = "Database dimuat: {0} program ditemukan."
        "Uninstall_Prompt" = "Ketik inisial/nama aplikasi (atau 'b' kembali):"
        "Uninstall_FoundMultiple" = "Aplikasi ditemukan:"
        "Uninstall_Confirm" = "Jalankan uninstaller untuk program ini?"
        "Clean_Title" = "PEMBERSIH SAMPAH"
        "Clean_Confirm" = "Bersihkan file sementara & cache?"
        "Update_Title"  = "PERBAIKAN WINDOWS UPDATE"
        "Update_Warn"   = "Reset Layanan Update?"
        "Confirm_Action" = "Apakah Anda yakin ingin melanjutkan?"
        "YesNo" = "(Y/T)"
    }
}

function Get-Translation {
    param([string]$key)
    if ($global:Translations.ContainsKey($global:Language) -and $global:Translations[$global:Language].ContainsKey($key)) {
        return $global:Translations[$global:Language][$key]
    }
    if ($global:Translations["EN"].ContainsKey($key)) { return $global:Translations["EN"][$key] }
    return $key
}

# ---------------------------
# UI Helper Functions
# ---------------------------
function Write-Line {
    param([string]$char = "═", [int]$length = 80, [string]$color = $global:Theme.Border)
    $line = ""
    for ($i = 0; $i -lt $length; $i++) { $line += $char }
    Write-Host $line -ForegroundColor $color
}

function Write-Centered {
    param([string]$text, [string]$color = $global:Theme.Title, [int]$width = 80)
    $padLeft = [math]::Max(0, [math]::Floor(($width - $text.Length) / 2))
    Write-Host (" " * $padLeft + $text) -ForegroundColor $color
}

function Write-BoxHeader {
    param([string]$title)
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor $global:Theme.Border
    $cleanTitle = " $title "
    $padLeft = [math]::Max(0, [math]::Floor((78 - $cleanTitle.Length) / 2))
    $padRight = [math]::Max(0, (78 - $cleanTitle.Length - $padLeft))
    
    Write-Host "║" -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host (" " * $padLeft) -NoNewline
    Write-Host $cleanTitle -NoNewline -ForegroundColor $global:Theme.Title
    Write-Host (" " * $padRight) -NoNewline
    Write-Host "║" -ForegroundColor $global:Theme.Border
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor $global:Theme.Border
}

function Write-Title { param([string]$message) Write-BoxHeader $message }
function Write-Error { param([string]$message) Write-Host " [!] $message" -ForegroundColor $global:Theme.Error }
function Write-Success { param([string]$message) Write-Host " [✓] $message" -ForegroundColor $global:Theme.Success }
function Write-Warning { param([string]$message) Write-Host " [!] $message" -ForegroundColor $global:Theme.Warning }
function Write-Info { param([string]$message) Write-Host " [i] $message" -ForegroundColor $global:Theme.Info }

# Helper for Confirmations
function Request-Confirm {
    param([string]$msg)
    $yn = Get-Translation "YesNo"
    $c = Read-Host " $msg $yn"
    if ($c -match '^(Y|y)$') { return $true }
    return $false
}

# ---------------------------
# 1. System Info
# ---------------------------
function Show-SystemInfo {
    Clear-Host
    Write-Title (Get-Translation 'System_Title')
    Write-Progress -Activity "Collecting System Data" -Status "Querying WMI/CIM..." -PercentComplete 0
    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        Write-Progress -Activity "Collecting System Data" -Status "OS Info Retrieved" -PercentComplete 20
        $system = Get-CimInstance -ClassName Win32_ComputerSystem
        Write-Progress -Activity "Collecting System Data" -Status "Hardware Info Retrieved" -PercentComplete 40
        $cpu = Get-CimInstance -ClassName Win32_Processor
        $gpus = Get-CimInstance -ClassName Win32_VideoController
        Write-Progress -Activity "Collecting System Data" -Status "CPU/GPU Info Retrieved" -PercentComplete 60

        Write-Host "`n [ System Details ]" -ForegroundColor $global:Theme.Section
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "Hostname"), $system.Name) -ForegroundColor $global:Theme.MenuText
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "OS"), $os.Caption) -ForegroundColor $global:Theme.MenuText
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "Version"), $os.Version) -ForegroundColor $global:Theme.MenuText
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "CPU"), $cpu.Name.Trim()) -ForegroundColor $global:Theme.MenuText
        
        foreach ($gpu in $gpus) {
            Write-Host ("   {0,-20} : {1}" -f (Get-Translation "GPU"), $gpu.Name) -ForegroundColor $global:Theme.MenuText
        }
        
        $totalMemory = [math]::Round($system.TotalPhysicalMemory / 1GB, 2)
        $freeMemory = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
        Write-Host ("   {0,-20} : {1} GB ({2} GB {3})" -f (Get-Translation "RAM"), $totalMemory, $freeMemory, (Get-Translation "Free")) -ForegroundColor $global:Theme.MenuText
        
        $bios = Get-CimInstance -ClassName Win32_BIOS
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "SerialNumber"), $bios.SerialNumber) -ForegroundColor $global:Theme.MenuText
        
        Write-Progress -Activity "Collecting System Data" -Status "Checking Disk Storage" -PercentComplete 80
        Write-Host "`n [ Storage ]" -ForegroundColor $global:Theme.Section
        $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
        foreach ($disk in $disks) {
            $free = [math]::Round($disk.FreeSpace / 1GB, 2)
            $total = [math]::Round($disk.Size / 1GB, 2)
            Write-Host ("   [{0}] {1} GB Total - {2} GB {3}" -f $disk.DeviceID, $total, $free, (Get-Translation "Free")) -ForegroundColor $global:Theme.Info
        }

        Write-Progress -Activity "Collecting System Data" -Status "Done" -Completed

    } catch { Write-Error (Get-Translation "System_Error") }
    Write-Host "`n"
    Read-Host " $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 2. Clear Junk Files
# ---------------------------
function Clear-JunkFiles {
    Clear-Host
    Write-Title (Get-Translation 'Clean_Title')
    if (-not (Request-Confirm (Get-Translation 'Clean_Confirm'))) { return }

    $pathsToClean = @("$env:SystemRoot\Temp", "$env:TEMP", "$env:SystemRoot\Prefetch")
    $totalFreed = 0
    
    # 1. Chrome
    Write-Progress -Activity "Cleaning System" -Status "Checking Chrome Cache..." -PercentComplete 10
    $chromeProfilePath = Join-Path $env:LOCALAPPDATA 'Google\Chrome\User Data\Default'
    if (Test-Path $chromeProfilePath) { 
        $chromePaths = @(Join-Path $chromeProfilePath 'Cache\*', Join-Path $chromeProfilePath 'Code Cache\*')
        foreach ($path in $chromePaths) {
            if (Test-Path $path) { try { Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue } catch {} }
        }
    }

    # 2. System Folders
    $i = 0
    foreach ($folderPath in $pathsToClean) {
        $i++
        $percent = 20 + ($i / $pathsToClean.Count * 70)
        Write-Progress -Activity "Cleaning System" -Status "Cleaning: $folderPath" -PercentComplete $percent
        if (Test-Path $folderPath) {
            Get-ChildItem -Path $folderPath -Force -ErrorAction SilentlyContinue | ForEach-Object {
                try {
                    $size = if ($_.PSIsContainer) { (Get-ChildItem $_.FullName -Recurse -Measure Length -Sum -ErrorAction 0).Sum } else { $_.Length }
                    Remove-Item $_.FullName -Recurse -Force -ErrorAction Stop
                    $totalFreed += $size
                } catch {}
            }
        }
    }
    
    Write-Progress -Activity "Cleaning System" -Status "Done" -Completed
    $cleanedSizeMB = [math]::Round($totalFreed / 1MB, 2)
    Write-Success "`n Cleanup complete. Freed approx: $cleanedSizeMB MB"
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 3. Recycle Bin
# ---------------------------
function Clear-RecycleBin-Menu {
    Clear-Host; Write-Title "Recycle Bin"
    if (-not (Request-Confirm (Get-Translation 'Confirm_Action'))) { return }

    Write-Progress -Activity "Recycle Bin" -Status "Emptying..." -PercentComplete 50
    try { Clear-RecycleBin -Force -ErrorAction Stop; Write-Success "Recycle Bin Emptied." } catch { Write-Info "Already empty." }
    Write-Progress -Activity "Recycle Bin" -Status "Done" -Completed
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 4. Open Disk Cleanup
# ---------------------------
function Open-DiskCleanup { 
    if (Request-Confirm "Buka Disk Cleanup Utility?") { Start-Process "cleanmgr.exe" }
}

# ---------------------------
# 5. Smart Uninstaller
# ---------------------------
function Show-AdvancedUninstaller {
    Clear-Host
    Write-Title (Get-Translation 'Uninstall_Title')
    
    Write-Progress -Activity "Uninstaller" -Status "Scanning Registry Keys..." -PercentComplete 0
    $programs = @()
    $paths = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')
    $count = 0
    foreach ($path in $paths) {
        $keys = Get-ItemProperty $path -ErrorAction SilentlyContinue
        $totalKeys = $keys.Count
        $current = 0
        foreach ($key in $keys) {
            $current++
            if ($current % 10 -eq 0) { Write-Progress -Activity "Uninstaller" -Status "Scanning: $($key.DisplayName)" -PercentComplete ([int](($current / $totalKeys) * 50) + ($count * 50)) }
            if ($key.DisplayName -and $key.UninstallString) { $programs += [PSCustomObject]@{ Name = $key.DisplayName; Uninstall = $key.UninstallString } }
        }
        $count++
    }
    Write-Progress -Activity "Uninstaller" -Status "Done" -Completed

    $programs = $programs | Sort-Object Name -Unique
    Write-Success (Get-Translation 'Uninstall_Found' -f $programs.Count)
    
    while ($true) {
        Write-Host ""
        Write-Line "─" 80 "DarkGray"
        Write-Host " Ketik 'b' untuk kembali ke menu." -ForegroundColor DarkGray
        $search = Read-Host " $(Get-Translation 'Uninstall_Prompt')"
        
        if ([string]::IsNullOrWhiteSpace($search)) { continue }
        if ($search -eq "b") { return }
        
        $foundPrograms = $programs | Where-Object { $_.Name -like "*$search*" }
        
        if (-not $foundPrograms) { 
            Write-Error "Tidak ditemukan."
        } else {
            Write-Host "`n $(Get-Translation 'Uninstall_FoundMultiple')" -ForegroundColor $global:Theme.Section
            $i = 0
            foreach ($prog in $foundPrograms) {
                $i++
                Write-Host "   [$i] " -NoNewline -ForegroundColor $global:Theme.MenuNumber
                Write-Host $prog.Name -ForegroundColor $global:Theme.MenuText
            }
            
            Write-Host ""
            $selection = Read-Host " Pilih nomor"
            
            if ($selection -match '^\d+$' -and $selection -le $foundPrograms.Count -and $selection -gt 0) {
                $target = $foundPrograms[$selection-1]
                Write-Warning " Target: $($target.Name)"
                if (Request-Confirm (Get-Translation 'Uninstall_Confirm')) {
                    Write-Host " Menjalankan uninstaller..." -ForegroundColor Green
                    try { cmd /c $target.Uninstall } catch { Write-Error "Gagal." }
                }
            }
        }
    }
}

# ---------------------------
# 6. Network Repair
# ---------------------------
function Invoke-NetworkRepair {
    Clear-Host
    Write-Title "Network Repair"
    if (-not (Request-Confirm (Get-Translation 'Confirm_Action'))) { return }

    Write-Progress -Activity "Network Repair" -Status "Releasing IP..." -PercentComplete 10
    ipconfig /release | Out-Null
    Write-Progress -Activity "Network Repair" -Status "Renewing IP..." -PercentComplete 30
    ipconfig /renew | Out-Null
    Write-Progress -Activity "Network Repair" -Status "Flushing DNS..." -PercentComplete 50
    ipconfig /flushdns | Out-Null
    Write-Progress -Activity "Network Repair" -Status "Resetting Winsock..." -PercentComplete 70
    netsh winsock reset | Out-Null
    Write-Progress -Activity "Network Repair" -Status "Resetting TCP/IP..." -PercentComplete 90
    netsh int ip reset | Out-Null
    Write-Progress -Activity "Network Repair" -Status "Done" -Completed
    
    Write-Success "Network settings repaired."
    Write-Warning "Restart recommended."
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 7. Power Utilities (FIXED TRANSLATIONS)
# ---------------------------
function Show-PowerMenu {
    do {
        Clear-Host
        Write-Title (Get-Translation 'SubMenu_Power')
        Write-Host "`n [1] $(Get-Translation 'SubMenu_Power1')"
        Write-Host " [2] $(Get-Translation 'SubMenu_Power2')"
        Write-Host " [3] $(Get-Translation 'SubMenu_Power3')" -ForegroundColor $global:Theme.Exit
        
        $c = Read-Host "`n $(Get-Translation 'SelectOption')"
        if ($c -eq "1") { 
             # Sub-menu selection for power plan
             Write-Host "`n $(Get-Translation 'Power_Options')"
             $p = Read-Host " $(Get-Translation 'SelectOption')"
             if (Request-Confirm (Get-Translation 'Power_Prompt')) {
                 if ($p -eq "1") { powercfg /s a1841308-3541-4fab-bc81-f71556f20b4a } 
                 elseif ($p -eq "3") { powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c } 
                 else { powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e }
                 Write-Success (Get-Translation 'Power_Success')
             }
        } elseif ($c -eq "2") {
             if (Request-Confirm (Get-Translation 'Battery_Prompt')) {
                 Write-Progress -Activity "Battery Report" -Status (Get-Translation 'Battery_Gen')
                 $path = "$PSScriptRoot\battery_report.html"
                 powercfg /batteryreport /output "$path" /duration 1 | Out-Null
                 Start-Process $path
                 Write-Progress -Activity "Battery Report" -Status "Done" -Completed
             }
        } elseif ($c -eq "3") { return }
        Read-Host "`n $(Get-Translation 'PressAnyKey')"
    } while ($true)
}

# ---------------------------
# 8. Memory Optimizer
# ---------------------------
function Clear-RAM {
    Clear-Host; Write-Title "Memory Optimizer"
    if (-not (Request-Confirm (Get-Translation 'Confirm_Action'))) { return }

    Write-Progress -Activity "Memory Optimization" -Status "Cleaning Working Sets..." -PercentComplete 0
    $code = @"
    using System; using System.Runtime.InteropServices;
    public class M { [DllImport("psapi.dll")] public static extern bool EmptyWorkingSet(IntPtr h);
    public static void C() { foreach(var p in System.Diagnostics.Process.GetProcesses()) try { EmptyWorkingSet(p.Handle); } catch {} } }
"@
    Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue
    Write-Progress -Activity "Memory Optimization" -Status "Cleaning..." -PercentComplete 50
    [M]::C(); [System.GC]::Collect()
    Write-Progress -Activity "Memory Optimization" -Status "Done" -Completed
    Write-Success "Memory (RAM) Optimized."
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 9. Defrag
# ---------------------------
function Invoke-Defragment {
    Clear-Host; Write-Title "Optimize Drives"
    $vols = Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' }
    foreach ($v in $vols) { Write-Host " [$($v.DriveLetter)] $($v.FileSystemLabel)" }
    $dl = Read-Host " Drive Letter"
    if ($dl) { 
        if (Request-Confirm "Optimasi Drive $dl?") {
            Write-Host " Optimizing... (Window may pop up)" -ForegroundColor Cyan
            Optimize-Volume -DriveLetter $dl -Verbose
        }
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 10. Health Check
# ---------------------------
function Show-SystemHealthMenu {
    Clear-Host; Write-Title "Health Check"
    Write-Host "`n [1] SFC (System File Checker)"
    Write-Host " [2] DISM (Image Repair)"
    Write-Host " [3] Back" -ForegroundColor $global:Theme.Exit
    $c = Read-Host "`n $(Get-Translation 'SelectOption')"; 
    if ($c -eq "1") { 
        if (Request-Confirm "Jalankan SFC Scan?") { Start-Process "sfc" "/scannow" -Wait -NoNewWindow }
    }
    elseif ($c -eq "2") { 
        if (Request-Confirm "Jalankan DISM Repair?") { Start-Process "dism" "/online /cleanup-image /restorehealth" -Wait -NoNewWindow }
    }
    elseif ($c -eq "3") { return }
    Read-Host "`n Done."
}

# ---------------------------
# 11. Windows Update Fixer
# ---------------------------
function Invoke-WindowsUpdateFix {
    Clear-Host
    Write-Title (Get-Translation 'Update_Title')
    if (-not (Request-Confirm (Get-Translation 'Update_Warn'))) { return }

    Write-Progress -Activity "Update Fixer" -Status "Stopping Services..." -PercentComplete 20
    Stop-Service -Name wuauserv, bits, cryptSvc, msiserver -Force -ErrorAction SilentlyContinue

    Write-Progress -Activity "Update Fixer" -Status "Renaming Cache Folders..." -PercentComplete 50
    $paths = @("$env:SystemRoot\SoftwareDistribution", "$env:SystemRoot\System32\catroot2")
    foreach ($p in $paths) {
        if (Test-Path $p) { Rename-Item -Path $p -NewName "$($p).old.$(Get-Random)" -ErrorAction SilentlyContinue }
    }

    Write-Progress -Activity "Update Fixer" -Status "Restarting Services..." -PercentComplete 80
    Start-Service -Name wuauserv, bits, cryptSvc, msiserver -ErrorAction SilentlyContinue
    
    Write-Progress -Activity "Update Fixer" -Status "Done" -Completed
    Write-Success "Update components reset."
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 12. DNS Changer
# ---------------------------
function Show-DNSMenu {
    Clear-Host
    Write-Title "DNS Changer"
    Write-Host "`n [1] Google (8.8.8.8)"
    Write-Host " [2] Cloudflare (1.1.1.1)"
    Write-Host " [3] Auto (DHCP)"
    Write-Host " [4] Back" -ForegroundColor $global:Theme.Exit
    
    $choice = Read-Host "`n $(Get-Translation 'SelectOption')"
    if ($choice -eq "4") { return }

    $adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1
    if (-not $adapter) { Write-Error "No active adapter."; Start-Sleep 2; return }
    
    if (Request-Confirm "Ubah DNS Adapter $($adapter.Name)?") {
        Write-Progress -Activity "Setting DNS" -Status "Configuring..."
        try {
            switch ($choice) {
                "1" { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("8.8.8.8","8.8.4.4") -ErrorAction Stop }
                "2" { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction Stop }
                "3" { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ResetServerAddresses -ErrorAction Stop }
            }
            Write-Success "DNS Updated."
        } catch { Write-Error "Failed: $($_.Exception.Message)" }
        Write-Progress -Activity "Setting DNS" -Status "Done" -Completed
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# Language & Main Menu
# ---------------------------
function Show-LanguageMenu {
    Clear-Host; Write-Title "Language"; Write-Host "`n [1] English`n [2] Indonesia"
    $c = Read-Host "`n Select"; if ($c -eq "1") { $global:Language="EN" } elseif ($c -eq "2") { $global:Language="ID" }
}

function Show-MainMenu {
    Clear-Host
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor $global:Theme.Border
    Write-Centered "    _ __   ___ _____   _____ " $global:Theme.AsciiArt
    Write-Centered "   | '_ \ / __/ _ \ \/ / __| " $global:Theme.AsciiArt
    Write-Centered "   | | | | (_|  __/>  <\__ \ " $global:Theme.AsciiArt
    Write-Centered "   |_| |_|\___\___/_/\_\___/ " $global:Theme.AsciiArt
    Write-Host ""
    Write-Centered (Get-Translation 'Menu_Title') $global:Theme.Title
    Write-Host "╠══════════════════════════════════════════════════════════════════════════════╣" -ForegroundColor $global:Theme.Border
    
    $leftCol = @(
        @{N="1"; T=(Get-Translation 'Menu_Option1')}, @{N="2"; T=(Get-Translation 'Menu_Option2')},
        @{N="3"; T=(Get-Translation 'Menu_Option3')}, @{N="4"; T=(Get-Translation 'Menu_Option4')},
        @{N="5"; T=(Get-Translation 'Menu_Option5')}, @{N="6"; T=(Get-Translation 'Menu_Option6')},
        @{N="7"; T=(Get-Translation 'Menu_Option7')}
    )
    $rightCol = @(
        @{N="8"; T=(Get-Translation 'Menu_Option8')}, @{N="9"; T=(Get-Translation 'Menu_Option9')},
        @{N="10"; T=(Get-Translation 'Menu_Option10')}, @{N="11"; T=(Get-Translation 'Menu_Option11')},
        @{N="12"; T=(Get-Translation 'Menu_Option12')}, @{N="13"; T=(Get-Translation 'Menu_Option13')},
        @{N="14"; T=(Get-Translation 'Menu_Option14')}
    )

    for ($i = 0; $i -lt $leftCol.Count; $i++) {
        $l = $leftCol[$i]; $r = $rightCol[$i]
        Write-Host "║ " -NoNewline -ForegroundColor $global:Theme.Border
        Write-Host ("[{0,-2}]" -f $l.N) -NoNewline -ForegroundColor $global:Theme.MenuNumber
        Write-Host (" {0,-32}" -f $l.T) -NoNewline -ForegroundColor $global:Theme.MenuText
        Write-Host "│ " -NoNewline -ForegroundColor $global:Theme.Border
        Write-Host ("[{0,-2}]" -f $r.N) -NoNewline -ForegroundColor $global:Theme.MenuNumber
        $color = if ($r.N -eq "14") { $global:Theme.Exit } else { $global:Theme.MenuText }
        Write-Host (" {0,-29}" -f $r.T) -NoNewline -ForegroundColor $color
        Write-Host "║" -ForegroundColor $global:Theme.Border
    }
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor $global:Theme.Border
    Write-Centered "Hostname: $env:COMPUTERNAME | User: $env:USERNAME" "DarkGray"
    Write-Host ""
}

# ---------------------------
# Main Loop
# ---------------------------
do {
    Show-MainMenu
    $choice = Read-Host " $(Get-Translation 'SelectOption')"
    switch ($choice) {
        "1"  { Show-SystemInfo }
        "2"  { Clear-JunkFiles }
        "3"  { Clear-RecycleBin-Menu }
        "4"  { Open-DiskCleanup }
        "5"  { Show-AdvancedUninstaller }
        "6"  { Invoke-NetworkRepair }
        "7"  { Show-PowerMenu }
        "8"  { Clear-RAM }
        "9"  { Invoke-Defragment }
        "10" { Show-SystemHealthMenu }
        "11" { Invoke-WindowsUpdateFix }
        "12" { Show-DNSMenu }
        "13" { Show-LanguageMenu }
        "14" { Write-Success (Get-Translation 'ExitMessage'); Start-Sleep -Seconds 1; exit }
        default { Write-Error (Get-Translation 'InvalidOption'); Start-Sleep -Seconds 1 }
    }
} while ($true)