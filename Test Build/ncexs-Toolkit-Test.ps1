<#
===============================================
 ncexs Toolkit v2.5 (Tes Version)
===============================================
#>

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
    Title       = 'Cyan'
    Separator   = 'DarkGray'
    MenuNumber  = 'Yellow'
    MenuText    = 'White'
    Prompt      = 'Yellow'
    Success     = 'Green'
    Error       = 'Red'
    Warning     = 'Magenta'
    Info        = 'Gray'
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
        "Menu_Option5" = "Manual Uninstaller"
        "Menu_Option6" = "Network Repair"
        "Menu_Option7" = "Power & Battery Utilities"
        "Menu_Option8" = "Memory Optimizer"
        "Menu_Option9" = "Defragment & Optimize Drives"
        "Menu_Option10" = "System Health Checker"
        "Menu_Option11" = "Windows Update Fixer"
        "Menu_Option12" = "DNS Changer"
        "Menu_Option13" = "Language Settings"
        "Menu_Option14" = "Exit"
        "SubMenu_Power" = "POWER & BATTERY UTILITIES"
        "SubMenu_Power1" = "Change Power Plan"
        "SubMenu_Power2" = "Generate Battery Health Report"
        "SubMenu_Power3" = "Back to Main Menu"
        "SubMenu_Health" = "SYSTEM HEALTH CHECKER"
        "SubMenu_Health1" = "Run System File Checker (SFC)"
        "SubMenu_Health2" = "Run DISM Image Repair"
        "SubMenu_Health3" = "Back to Main Menu"
        "LanguageMenu" = "LANGUAGE SETTINGS"
        "LanguageMenu1" = "English"
        "LanguageMenu2" = "Indonesian"
        "LanguageMenu3" = "Back to Main Menu"
        "DNS_Menu"      = "DNS CHANGER (Active Adapter)"
        "DNS_Google"    = "Set to Google DNS (8.8.8.8)"
        "DNS_Cloudflare"= "Set to Cloudflare DNS (1.1.1.1)"
        "DNS_Auto"      = "Set to Automatic (DHCP)"
        "DNS_Success"   = "DNS settings updated successfully."
        "Update_Title"  = "WINDOWS UPDATE FIXER"
        "Update_Warn"   = "This will stop Update services, clear cache, and restart them. Continue?"
        "Update_Stop"   = "Stopping services (wuauserv, bits, cryptSvc)..."
        "Update_Ren"    = "Renaming SoftwareDistribution and catroot2 folders..."
        "Update_Start"  = "Restarting services..."
        "Update_Done"   = "Windows Update components reset successfully."
        "PressAnyKey" = "Press any key to continue..."
        "InvalidOption" = "Invalid option. Please try again."
        "ExitMessage" = "Thank you for using ncexs Toolkit!"
        "YesNoPrompt" = "(Y/N)"
        "SelectOption" = "Select option"
        "Disk" = "Disk"
        "Free" = "Free"
        "OS" = "Operating System"
        "Version" = "Version"
        "CPU" = "Processor"
        "RAM" = "RAM"
        "GPU" = "GPU"
        "Motherboard" = "Motherboard"
        "Hostname" = "Computer Name"
        "SerialNumber" = "Serial Number"
        "System_Error" = "Error retrieving system information"
        "Cancel" = "Operation cancelled."
        "Health_Warning" = "This process can take a long time. Do you want to continue?"
        "Health_SFC_Running" = "Running System File Checker (sfc /scannow)... Please wait."
        "Health_SFC_Done" = "SFC scan completed successfully."
        "Health_SFC_Error" = "SFC scan failed with exit code: {0}."
        "Health_DISM_Running" = "Running DISM image repair... Please wait."
        "Health_DISM_Done" = "DISM image repair completed successfully."
        "Health_DISM_Error" = "DISM repair failed with exit code: {0}."
        "Clean_Calculating" = "Calculating space to be freed..."
        "Clean_SpaceFreed" = "Cleanup complete. Freed approximately {0} MB of space."
        "Clean_Warning" = "Note: Some files may not be deleted if currently in use."
        "Clean_Confirm" = "This will clean system temporary files and browser data. Continue?"
        "RAM_Confirm" = "This will perform an optimal cleanup of the system memory cache. Continue?"
        "RAM_Before" = "Available Memory (Before): {0} MB"
        "RAM_After" = "Available Memory (After): {0} MB"
        "RAM_Freed" = "Successfully freed {0} MB of memory."
        "RAM_Cancel" = "Memory optimization cancelled."
        "Recycle_Title" = "RECYCLE BIN CLEANUP"
        "Recycle_Confirm" = "Are you sure you want to permanently empty the Recycle Bin?"
        "Recycle_Success" = "Recycle Bin emptied successfully."
        "Recycle_AlreadyEmpty" = "Recycle Bin is already empty."
        "Clean_Title" = "TEMP & CACHE CLEANUP"
        "Network_Title" = "NETWORK REPAIR"
        "Network_Repairing" = "Repairing network settings..."
        "Network_Repaired" = "Network settings repaired successfully."
        "Network_ErrorRepair" = "Error repairing network: {0}"
        "Network_Restart_Warning" = "A restart is recommended for all changes to take effect."
        "Power_Select" = "Select a power plan to activate:"
        "Power_Balanced" = "Balanced (Recommended)"
        "Power_Saver" = "Power Saver"
        "Power_High" = "High Performance"
        "Power_Changed" = "Power plan successfully changed to {0}."
        "Power_Active_Now" = "Active plan is now: {0}"
        "Battery_Generating" = "Generating battery health report..."
        "Battery_Generated" = "Report saved to {0}. Opening now..."
        "Battery_NotFound" = "Could not generate report. This PC may not have a battery."
        "Battery_Error" = "An error occurred while generating the battery report."
        "Uninstall_Title" = "MANUAL UNINSTALLER"
        "Uninstall_Scanning" = "Scanning registry for installed programs... Please wait."
        "Uninstall_Found" = "Found {0} programs."
        "Uninstall_Prompt" = "Type the name to uninstall (or Enter to cancel):"
        "Uninstall_Searching" = "Searching for '{0}'..."
        "Uninstall_FoundMultiple" = "Found multiple matches. Please be more specific:"
        "Uninstall_FoundOne" = "Found program: {0}"
        "Uninstall_Confirm" = "Are you sure you want to run the uninstaller?"
        "Uninstall_Running" = "Running uninstaller..."
        "Uninstall_Success" = "Uninstaller process started successfully."
        "Uninstall_NoMatch" = "No program found matching that name."
        "Uninstall_Error" = "Could not run the uninstaller."
        "System_Title" = "System Information"
        "Clean_ErrorCalc" = "Error calculating size in {0}: {1}"
        "Clean_ErrorDelete" = "Could not delete locked file {0}: {1}"
        "Clean_Status" = "Cleaning in progress..."
        "RAM_Error" = "Error clearing memory: {0}"
        "Defrag_Title" = "OPTIMIZE DRIVES"
        "Defrag_Select" = "Select the drive to optimize:"
        "Defrag_Analyzing" = "Analyzing {0} ({1})..."
        "Defrag_Optimizing" = "Optimizing {0} ({1})... This may take a while."
        "Defrag_Complete" = "Optimization complete for drive {0}."
        "Defrag_Type_SSD" = "SSD"
        "Defrag_Type_HDD" = "HDD"
        "Defrag_SSD_Cancel" = "Cancelled. Drive is an SSD."
        "Chrome_Cleaning" = "Cleaning Chrome cache, history, and session data..."
        "Chrome_Done" = "Google Chrome cleanup complete."
        "Chrome_NotFound" = "Google Chrome installation not found."
    };
    "ID" = @{
        "Menu_Title" = ("ncexs Toolkit v{0}" -f $global:ToolkitVersion)
        "Menu_Option1" = "Informasi Sistem"
        "Menu_Option2" = "Pembersih Sampah"
        "Menu_Option3" = "Kosongkan Recycle Bin"
        "Menu_Option4" = "Buka Disk Cleanup"
        "Menu_Option5" = "Uninstaller Manual"
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
        "SubMenu_Power1" = "Ubah Power Plan"
        "SubMenu_Power2" = "Buat Laporan Kesehatan Baterai"
        "SubMenu_Power3" = "Kembali ke Menu Utama"
        "SubMenu_Health" = "PEMERIKSA KESEHATAN SISTEM"
        "SubMenu_Health1" = "Jalankan Pemeriksa Berkas Sistem (SFC)"
        "SubMenu_Health2" = "Jalankan Perbaikan Image DISM"
        "SubMenu_Health3" = "Kembali ke Menu Utama"
        "LanguageMenu" = "PENGATURAN BAHASA"
        "LanguageMenu1" = "Bahasa Inggris"
        "LanguageMenu2" = "Bahasa Indonesia"
        "LanguageMenu3" = "Kembali ke Menu Utama"
        "DNS_Menu"      = "PENGUBAH DNS (Adapter Aktif)"
        "DNS_Google"    = "Gunakan Google DNS (8.8.8.8)"
        "DNS_Cloudflare"= "Gunakan Cloudflare DNS (1.1.1.1)"
        "DNS_Auto"      = "Kembalikan ke Otomatis (DHCP)"
        "DNS_Success"   = "Pengaturan DNS berhasil diperbarui."
        "Update_Title"  = "PERBAIKAN WINDOWS UPDATE"
        "Update_Warn"   = "Ini akan menghentikan layanan Update, menghapus cache, dan memulai ulang. Lanjutkan?"
        "Update_Stop"   = "Menghentikan layanan (wuauserv, bits, cryptSvc)..."
        "Update_Ren"    = "Mengganti nama folder SoftwareDistribution dan catroot2..."
        "Update_Start"  = "Memulai ulang layanan..."
        "Update_Done"   = "Komponen Windows Update berhasil di-reset."
        "PressAnyKey" = "Tekan sembarang tombol untuk melanjutkan..."
        "InvalidOption" = "Pilihan tidak valid. Silakan coba lagi."
        "ExitMessage" = "Terima kasih telah menggunakan ncexs Toolkit!"
        "YesNoPrompt" = "(Y/T)"
        "SelectOption" = "Pilih opsi"
        "Disk" = "Disk"
        "Free" = "Bebas"
        "OS" = "Sistem Operasi"
        "Version" = "Versi"
        "CPU" = "Prosesor"
        "RAM" = "RAM"
        "GPU" = "GPU"
        "Motherboard" = "Motherboard"
        "Hostname" = "Nama Komputer"
        "SerialNumber" = "Nomor Seri"
        "System_Error" = "Kesalahan mengambil informasi sistem"
        "Cancel" = "Operasi dibatalkan."
        "Health_Warning" = "Proses ini bisa memakan waktu lama. Apakah Anda ingin melanjutkan?"
        "Health_SFC_Running" = "Menjalankan Pemeriksa Berkas Sistem (sfc /scannow)... Harap tunggu."
        "Health_SFC_Done" = "Pemindaian SFC selesai dengan sukses."
        "Health_SFC_Error" = "Pemindaian SFC gagal dengan kode keluar: {0}."
        "Health_DISM_Running" = "Menjalankan perbaikan image DISM... Harap tunggu."
        "Health_DISM_Done" = "Perbaikan image DISM selesai dengan sukses."
        "Health_DISM_Error" = "Perbaikan DISM gagal dengan kode keluar: {0}."
        "Clean_Calculating" = "Menghitung ruang yang akan dibersihkan..."
        "Clean_SpaceFreed" = "Pembersihan selesai. Berhasil membebaskan sekitar {0} MB ruang."
        "Clean_Warning" = "Catatan: Beberapa file mungkin tidak terhapus jika sedang digunakan."
        "Clean_Confirm" = "Tindakan ini akan membersihkan file sementara & data browser. Lanjutkan?"
        "RAM_Confirm" = "Tindakan ini akan membersihkan cache memori sistem untuk melegakan RAM. Lanjutkan?"
        "RAM_Before" = "Memori Tersedia (Sebelum): {0} MB"
        "RAM_After" = "Memori Tersedia (Setelah): {0} MB"
        "RAM_Freed" = "Berhasil membebaskan {0} MB memori."
        "RAM_Cancel" = "Optimasi memori dibatalkan."
        "Recycle_Title" = "PEMBERSIHAN RECYCLE BIN"
        "Recycle_Confirm" = "Apakah Anda yakin ingin mengosongkan Recycle Bin secara permanen?"
        "Recycle_Success" = "Recycle Bin berhasil dikosongkan."
        "Recycle_AlreadyEmpty" = "Recycle Bin sudah kosong."
        "Clean_Title" = "PEMBERSIHAN SEMENTARA & CACHE"
        "Network_Title" = "PERBAIKAN JARINGAN"
        "Network_Repairing" = "Memperbaiki pengaturan jaringan..."
        "Network_Repaired" = "Pengaturan jaringan berhasil diperbaiki."
        "Network_ErrorRepair" = "Kesalahan memperbaiki jaringan: {0}"
        "Network_Restart_Warning" = "Disarankan untuk me-restart komputer."
        "Power_Balanced" = "Seimbang (Disarankan)"
        "Power_Saver" = "Hemat Daya"
        "Power_High" = "Performa Tinggi"
        "Power_Changed" = "Power plan berhasil diubah ke {0}."
        "Power_Active_Now" = "Power plan aktif saat ini: {0}"
        "Battery_Generating" = "Membuat laporan kesehatan baterai..."
        "Battery_Generated" = "Laporan disimpan di {0}. Sedang dibuka..."
        "Battery_NotFound" = "Tidak dapat membuat laporan (Tanpa Baterai)."
        "Battery_Error" = "Terjadi kesalahan saat membuat laporan baterai."
        "Uninstall_Title" = "UNINSTALLER MANUAL"
        "Uninstall_Scanning" = "Memindai registry untuk program terinstal... Harap tunggu."
        "Uninstall_Found" = "Ditemukan {0} program."
        "Uninstall_Prompt" = "Ketik nama program untuk di-uninstall (Enter untuk batal):"
        "Uninstall_Searching" = "Mencari '{0}'..."
        "Uninstall_FoundMultiple" = "Ditemukan beberapa yang cocok. Harap lebih spesifik:"
        "Uninstall_FoundOne" = "Program ditemukan: {0}"
        "Uninstall_Confirm" = "Yakin ingin menjalankan uninstaller untuk program ini?"
        "Uninstall_Running" = "Menjalankan uninstaller..."
        "Uninstall_Success" = "Proses uninstaller berhasil dimulai."
        "Uninstall_NoMatch" = "Tidak ada program yang ditemukan cocok."
        "Uninstall_Error" = "Tidak dapat menjalankan uninstaller."
        "System_Title" = "Informasi Sistem"
        "Clean_ErrorCalc" = "Kesalahan menghitung ukuran di {0}: {1}"
        "Clean_ErrorDelete" = "Tidak dapat menghapus file terkunci {0}: {1}"
        "Clean_Status" = "Pembersihan sedang berlangsung..."
        "RAM_Error" = "Kesalahan saat membersihkan memori: {0}"
        "Defrag_Title" = "OPTIMASI DRIVE"
        "Defrag_Select" = "Pilih drive yang akan dioptimasi:"
        "Defrag_Analyzing" = "Menganalisis {0} ({1})..."
        "Defrag_Optimizing" = "Mengoptimasi {0} ({1})... Mohon tunggu."
        "Defrag_Complete" = "Optimalisasi selesai untuk drive {0}."
        "Defrag_Type_SSD" = "SSD"
        "Defrag_Type_HDD" = "HDD"
        "Defrag_SSD_Cancel" = "Dibatalkan. Drive adalah SSD."
        "Chrome_Cleaning" = "Membersihkan cache, riwayat, dan data sesi Chrome..."
        "Chrome_Done" = "Pembersihan Google Chrome selesai."
        "Chrome_NotFound" = "Instalasi Google Chrome tidak ditemukan."
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
function Write-Separator {
    Write-Host "=========================================" -ForegroundColor $global:Theme.Separator
}
function Write-Title { param([string]$message) Write-Host $message -ForegroundColor $global:Theme.Title }
function Write-MenuOption {
    param([string]$number, [string]$text, [string]$color = $global:Theme.MenuText)
    Write-Host " " -NoNewline; Write-Host $number -ForegroundColor $global:Theme.MenuNumber -NoNewline
    Write-Host ". " -ForegroundColor $global:Theme.Separator -NoNewline; Write-Host $text -ForegroundColor $color
}
function Write-Error { param([string]$message) Write-Host $message -ForegroundColor $global:Theme.Error }
function Write-Success { param([string]$message) Write-Host $message -ForegroundColor $global:Theme.Success }
function Write-Warning { param([string]$message) Write-Host $message -ForegroundColor $global:Theme.Warning }
function Write-Info { param([string]$message) Write-Host $message -ForegroundColor $global:Theme.Info }

# ---------------------------
# Logging & Utilities
# ---------------------------
$logfile = Join-Path -Path $PSScriptRoot -ChildPath 'log_ncexs-toolkit.txt'
function Write-Log {
    param([string]$msg, [string]$level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$level] $msg"
    try { $logEntry | Out-File -FilePath $logfile -Append -Encoding utf8 -ErrorAction SilentlyContinue } catch {}
    switch ($level) {
        "ERROR"   { Write-Host $logEntry -ForegroundColor $global:Theme.Error }
        "WARNING" { Write-Host $logEntry -ForegroundColor $global:Theme.Warning }
        "SUCCESS" { Write-Host $logEntry -ForegroundColor $global:Theme.Success }
        default   { Write-Host $logEntry -ForegroundColor $global:Theme.MenuText }
    }
}
function Clear-OldLogs {
    if (Test-Path $logfile) {
        try { if ((Get-Item $logfile).Length -gt 10MB) { Remove-Item $logfile -Force -ErrorAction SilentlyContinue } } catch {}
    }
}
Clear-OldLogs

# ---------------------------
# 1. System Info
# ---------------------------
function Show-SystemInfo {
    Write-Title "`n=== $(Get-Translation 'System_Title') ==="
    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        $system = Get-CimInstance -ClassName Win32_ComputerSystem
        Write-Host ("{0}: {1}" -f (Get-Translation "Hostname"), $system.Name) -ForegroundColor $global:Theme.MenuText
        Write-Host ("{0}: {1}" -f (Get-Translation "OS"), $os.Caption) -ForegroundColor $global:Theme.MenuText
        Write-Host ("{0}: {1}" -f (Get-Translation "Version"), $os.Version) -ForegroundColor $global:Theme.MenuText
        
        $cpu = Get-CimInstance -ClassName Win32_Processor
        Write-Host ("{0}: {1}" -f (Get-Translation "CPU"), $cpu.Name.Trim()) -ForegroundColor $global:Theme.MenuText
        
        $gpus = Get-CimInstance -ClassName Win32_VideoController
        foreach ($gpu in $gpus) {
            Write-Host ("{0}: {1}" -f (Get-Translation "GPU"), $gpu.Name) -ForegroundColor $global:Theme.MenuText
        }
        
        $totalMemory = [math]::Round($system.TotalPhysicalMemory / 1GB, 2)
        $freeMemory = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
        Write-Host ("{0}: {1} GB ({2} GB {3})" -f (Get-Translation "RAM"), $totalMemory, $freeMemory, (Get-Translation "Free")) -ForegroundColor $global:Theme.MenuText
        
        $bios = Get-CimInstance -ClassName Win32_BIOS
        Write-Host ("{0}: {1}" -f (Get-Translation "SerialNumber"), $bios.SerialNumber) -ForegroundColor $global:Theme.MenuText
        
        Write-Host "`n$(Get-Translation 'Disk'):" -ForegroundColor $global:Theme.Prompt
        $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
        foreach ($disk in $disks) {
            $free = [math]::Round($disk.FreeSpace / 1GB, 2)
            $total = [math]::Round($disk.Size / 1GB, 2)
            Write-Host ("    {0} {1} GB ({2} GB {3})" -f $disk.DeviceID, $total, $free, (Get-Translation "Free")) -ForegroundColor $global:Theme.Info
        }
    } catch { Write-Error (Get-Translation "System_Error") }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 2. Clear Junk Files
# ---------------------------
function Clear-JunkFiles {
    Write-Title "`n=== $(Get-Translation 'Clean_Title') ==="
    $confirm = Read-Host "`n$(Get-Translation 'Clean_Confirm') $(Get-Translation 'YesNoPrompt')"
    if ($confirm -notmatch '^(Y|y)$') { return }

    Write-Warning (Get-Translation 'Clean_Warning')
    $chromeProfilePath = Join-Path $env:LOCALAPPDATA 'Google\Chrome\User Data\Default'
    if (Test-Path $chromeProfilePath) { Invoke-ChromeCleanup -ProfilePath $chromeProfilePath }

    $pathsToClean = @("$env:SystemRoot\Temp", "$env:TEMP", "$env:SystemRoot\Prefetch")
    $totalFreed = 0
    
    foreach ($folderPath in $pathsToClean) {
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

    $cleanedSizeMB = [math]::Round($totalFreed / 1MB, 2)
    Write-Success "`n$(Get-Translation 'Clean_SpaceFreed' -f $cleanedSizeMB)"
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

function Invoke-ChromeCleanup {
    param([string]$ProfilePath)
    Write-Info "`n$(Get-Translation 'Chrome_Cleaning')"
    $chromePaths = @(Join-Path $ProfilePath 'Cache\*', Join-Path $ProfilePath 'Code Cache\*')
    foreach ($path in $chromePaths) {
        if (Test-Path $path) { try { Remove-Item $path -Recurse -Force -ErrorAction Stop } catch {} }
    }
    Write-Success (Get-Translation 'Chrome_Done')
}

# ---------------------------
# 3. Clear Recycle Bin
# ---------------------------
function Clear-RecycleBin-Menu {
    Write-Title "`n=== $(Get-Translation 'Recycle_Title') ==="
    if ((Read-Host "$(Get-Translation 'Recycle_Confirm') $(Get-Translation 'YesNoPrompt')") -match '^(Y|y)$') {
        try {
            Clear-RecycleBin -Force -ErrorAction Stop
            Write-Success (Get-Translation 'Recycle_Success')
        } catch { Write-Warning (Get-Translation 'Recycle_AlreadyEmpty') }
    }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 4. Open Disk Cleanup
# ---------------------------
function Open-DiskCleanup {
    Start-Process "cleanmgr.exe"
}

# ---------------------------
# 5. Advanced Uninstaller
# ---------------------------
function Show-AdvancedUninstaller {
    Write-Title "`n=== $(Get-Translation 'Uninstall_Title') ==="
    Write-Warning (Get-Translation 'Uninstall_Scanning')
    
    $programs = @()
    $paths = @('HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*', 'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')
    foreach ($path in $paths) {
        Get-ItemProperty $path -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -and $_.UninstallString } | ForEach-Object {
            $programs += [PSCustomObject]@{ Name = $_.DisplayName; Uninstall = $_.UninstallString }
        }
    }
    $programs = $programs | Sort-Object Name -Unique
    Write-Success (Get-Translation 'Uninstall_Found' -f $programs.Count)
    
    $search = Read-Host "`n$(Get-Translation 'Uninstall_Prompt')"
    if ([string]::IsNullOrWhiteSpace($search)) { return }
    
    $foundPrograms = $programs | Where-Object { $_.Name -like "*$search*" }
    if (-not $foundPrograms) { Write-Error (Get-Translation 'Uninstall_NoMatch'); return }
    
    $target = $foundPrograms[0]
    if ($foundPrograms.Count -gt 1) {
        Write-Warning (Get-Translation 'Uninstall_FoundMultiple')
        for ($i=0; $i -lt $foundPrograms.Count; $i++) { Write-Host "[$($i+1)] $($foundPrograms[$i].Name)" }
        $sel = Read-Host "`n$(Get-Translation 'SelectOption')"
        if ($sel -match '^\d+$' -and $foundPrograms[$sel-1]) { $target = $foundPrograms[$sel-1] } else { return }
    }
    
    Write-Success (Get-Translation 'Uninstall_FoundOne' -f $target.Name)
    if ((Read-Host "$(Get-Translation 'Uninstall_Confirm') (Y/N)") -match '^(Y|y)$') {
        Write-Warning (Get-Translation 'Uninstall_Running')
        cmd /c $target.Uninstall
    }
}

# ---------------------------
# 6. Network Repair
# ---------------------------
function Invoke-NetworkRepair {
    Write-Title "`n=== $(Get-Translation 'Network_Title') ==="
    Write-Warning "`n$(Get-Translation 'Network_Repairing')"
    ipconfig /release | Out-Null; ipconfig /renew | Out-Null; ipconfig /flushdns | Out-Null
    netsh winsock reset | Out-Null; netsh int ip reset | Out-Null
    Write-Success "`n$(Get-Translation 'Network_Repaired')"
    Write-Warning (Get-Translation 'Network_Restart_Warning')
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 7. Power Utilities
# ---------------------------
function Show-PowerMenu {
    do {
        Clear-Host; Write-Title "`n$(Get-Translation 'SubMenu_Power')"
        Write-MenuOption "1" (Get-Translation 'SubMenu_Power1')
        Write-MenuOption "2" (Get-Translation 'SubMenu_Power2')
        Write-MenuOption "3" (Get-Translation 'SubMenu_Power3') $global:Theme.Exit
        $c = Read-Host "`n$(Get-Translation 'SelectOption')"
        if ($c -eq "1") { 
            Write-MenuOption "1" "Saver"; Write-MenuOption "2" "Balanced"; Write-MenuOption "3" "High"
            $p = Read-Host "Select"; if ($p -eq "1") { powercfg /s a1841308-3541-4fab-bc81-f71556f20b4a } elseif ($p -eq "3") { powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c } else { powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e }
            Write-Success "Power plan updated."
        } elseif ($c -eq "2") {
            $path = "$PSScriptRoot\battery_report.html"
            powercfg /batteryreport /output "$path" /duration 1 | Out-Null
            Start-Process $path
        } elseif ($c -eq "3") { return }
        Read-Host "`n$(Get-Translation 'PressAnyKey')"
    } while ($true)
}

# ---------------------------
# 8. Memory Optimizer
# ---------------------------
function Clear-RAM {
    Write-Title "`n=== $(Get-Translation 'Menu_Option8') ==="
    if ((Read-Host "$(Get-Translation 'RAM_Confirm') (Y/N)") -notmatch '^(Y|y)$') { return }
    
    $code = @"
    using System; using System.Runtime.InteropServices;
    public class M { [DllImport("psapi.dll")] public static extern bool EmptyWorkingSet(IntPtr h);
    public static void C() { foreach(var p in System.Diagnostics.Process.GetProcesses()) try { EmptyWorkingSet(p.Handle); } catch {} } }
"@
    Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue
    [M]::C(); [System.GC]::Collect()
    Write-Success (Get-Translation 'RAM_Freed' -f "RAM")
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 9. Defrag
# ---------------------------
function Invoke-Defragment {
    Write-Title "`n=== $(Get-Translation 'Defrag_Title') ==="
    $vols = Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' }
    foreach ($v in $vols) { Write-Host "[$($v.DriveLetter)] $($v.FileSystemLabel)" }
    $dl = Read-Host "Drive Letter"
    if ($dl) { Optimize-Volume -DriveLetter $dl -Verbose; Write-Success "Done." }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 10. Health Check
# ---------------------------
function Show-SystemHealthMenu {
    Clear-Host; Write-Title "`n$(Get-Translation 'SubMenu_Health')"
    Write-MenuOption "1" "SFC"; Write-MenuOption "2" "DISM"; Write-MenuOption "3" "Back"
    $c = Read-Host; 
    if ($c -eq "1") { Start-Process "sfc" "/scannow" -Wait -NoNewWindow }
    elseif ($c -eq "2") { Start-Process "dism" "/online /cleanup-image /restorehealth" -Wait -NoNewWindow }
    elseif ($c -eq "3") { return }
    Read-Host "`nDone."
}

# ---------------------------
# 11. Windows Update Fixer (NEW)
# ---------------------------
function Invoke-WindowsUpdateFix {
    Write-Title "`n=== $(Get-Translation 'Update_Title') ==="
    $confirm = Read-Host "`n$(Get-Translation 'Update_Warn') $(Get-Translation 'YesNoPrompt')"
    if ($confirm -notmatch '^(Y|y)$') { return }

    Write-Info "`n$(Get-Translation 'Update_Stop')"
    Stop-Service -Name wuauserv, bits, cryptSvc, msiserver -Force -ErrorAction SilentlyContinue

    Write-Info $(Get-Translation 'Update_Ren')
    $paths = @("$env:SystemRoot\SoftwareDistribution", "$env:SystemRoot\System32\catroot2")
    foreach ($p in $paths) {
        if (Test-Path $p) { 
            Rename-Item -Path $p -NewName "$($p).old.$(Get-Random)" -ErrorAction SilentlyContinue 
        }
    }

    Write-Info $(Get-Translation 'Update_Start')
    Start-Service -Name wuauserv, bits, cryptSvc, msiserver -ErrorAction SilentlyContinue
    
    Write-Success "`n$(Get-Translation 'Update_Done')"
    Write-Log "Windows Update components reset." "SUCCESS"
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 12. DNS Changer (NEW)
# ---------------------------
function Show-DNSMenu {
    Clear-Host
    Write-Separator
    Write-Title "       $(Get-Translation 'DNS_Menu')"
    Write-Separator
    Write-MenuOption "1" (Get-Translation 'DNS_Google')
    Write-MenuOption "2" (Get-Translation 'DNS_Cloudflare')
    Write-MenuOption "3" (Get-Translation 'DNS_Auto')
    Write-MenuOption "4" (Get-Translation 'SubMenu_Power3') $global:Theme.Exit
    Write-Separator
    
    $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
    $adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1
    
    if (-not $adapter) { Write-Error "No active network adapter found."; Start-Sleep 2; return }
    Write-Info "Target Adapter: $($adapter.Name)"

    try {
        switch ($choice) {
            "1" { 
                Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("8.8.8.8","8.8.4.4") -ErrorAction Stop
                Write-Success "`n$(Get-Translation 'DNS_Success') (Google)"
            }
            "2" { 
                Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction Stop
                Write-Success "`n$(Get-Translation 'DNS_Success') (Cloudflare)"
            }
            "3" { 
                Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ResetServerAddresses -ErrorAction Stop
                Write-Success "`n$(Get-Translation 'DNS_Success') (Auto/DHCP)"
            }
            "4" { return }
            default { Write-Error "Invalid" }
        }
    } catch {
        Write-Error "Failed to change DNS: $($_.Exception.Message)"
    }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# Language
# ---------------------------
function Show-LanguageMenu {
    Clear-Host; Write-Title "Language"; Write-MenuOption "1" "English"; Write-MenuOption "2" "Indonesia"
    $c = Read-Host; if ($c -eq "1") { $global:Language="EN" } elseif ($c -eq "2") { $global:Language="ID" }
}

# ---------------------------
# Main Menu
# ---------------------------
function Show-MainMenu {
    Clear-Host
    Write-Separator
    Write-Host ""
    Write-Host "    _ __   ___ _____   _____ " -ForegroundColor $global:Theme.AsciiArt
    Write-Host "   | '_ \ / __/ _ \ \/ / __|" -ForegroundColor $global:Theme.AsciiArt
    Write-Host "   | | | | (_|  __/>  <\__ \ " -ForegroundColor $global:Theme.AsciiArt
    Write-Host "   |_| |_|\___\___/_/\_\___/" -ForegroundColor $global:Theme.AsciiArt
    Write-Host ""
    Write-Host ("  {0}" -f (Get-Translation 'Menu_Title')) -ForegroundColor $global:Theme.Prompt
    Write-Host ""
    Write-Separator
    Write-MenuOption "1"  (Get-Translation 'Menu_Option1')
    Write-MenuOption "2"  (Get-Translation 'Menu_Option2')
    Write-MenuOption "3"  (Get-Translation 'Menu_Option3')
    Write-MenuOption "4"  (Get-Translation 'Menu_Option4')
    Write-MenuOption "5"  (Get-Translation 'Menu_Option5')
    Write-MenuOption "6"  (Get-Translation 'Menu_Option6')
    Write-MenuOption "7"  (Get-Translation 'Menu_Option7')
    Write-MenuOption "8"  (Get-Translation 'Menu_Option8')
    Write-MenuOption "9"  (Get-Translation 'Menu_Option9')
    Write-MenuOption "10" (Get-Translation 'Menu_Option10')
    Write-MenuOption "11" (Get-Translation 'Menu_Option11') # New
    Write-MenuOption "12" (Get-Translation 'Menu_Option12') # New
    Write-MenuOption "13" (Get-Translation 'Menu_Option13')
    Write-MenuOption "14" (Get-Translation 'Menu_Option14') $global:Theme.Exit
    Write-Separator
}

# ---------------------------
# Main Loop
# ---------------------------
do {
    Show-MainMenu
    $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
    switch ($choice) {
        "1"  { Show-SystemInfo }
        "2"  { Clear-JunkFiles }
        "3"  { Clear-RecycleBin-Menu }
        "4"  { Open-DiskCleanup }
        "5"  { Show-AdvancedUninstaller; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
        "6"  { Invoke-NetworkRepair }
        "7"  { Show-PowerMenu }
        "8"  { Clear-RAM }
        "9"  { Invoke-Defragment }
        "10" { Show-SystemHealthMenu }
        "11" { Invoke-WindowsUpdateFix }
        "12" { Show-DNSMenu }
        "13" { Show-LanguageMenu }
        "14" {
            Write-Success (Get-Translation 'ExitMessage')
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Write-Error (Get-Translation 'InvalidOption')
            Start-Sleep -Seconds 2
        }
    }
} while ($true)