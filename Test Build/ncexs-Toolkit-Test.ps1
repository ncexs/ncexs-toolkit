<#
===============================================
 ncexs Toolkit v2.4 Test
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

# Set execution policy (for this session only)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

# ---------------------------
# Global vars & Translations
# ---------------------------
$global:ToolkitVersion = "2.4 Test"
$global:Language = "ID"  # default

# ---------------------------
# Color Theme
# ---------------------------
# Define all colors in one place for easy editing
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

# ---------------------------
# FIX FOR "RED FLICKER"
# ---------------------------
# Set the prompt color for Read-Host globally
try {
    $Host.PrivateData.PromptForegroundColor = $global:Theme.Prompt
} catch {
    # Failed to set prompt color (e.g., in non-standard hosts like ISE)
    # This is not a fatal error, continue.
    Write-Warning "Could not set themed prompt color. This is non-fatal."
}
# ---------------------------

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
        "Menu_Option11" = "Language Settings"
        "Menu_Option12" = "Exit"
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
        "Health_SFC_Error" = "SFC scan failed with exit code: {0}. This indicates a Windows System issue."
        "Health_DISM_Running" = "Running DISM image repair (DISM /Online /Cleanup-Image /RestoreHealth)... Please wait."
        "Health_DISM_Done" = "DISM image repair completed successfully."
        "Health_DISM_Error" = "DISM repair failed with exit code: {0}. This indicates a Windows System issue."
        "Clean_Calculating" = "Calculating space to be freed..."
        "Clean_SpaceFreed" = "Cleanup complete. Freed approximately {0} MB of space."
        "Clean_Warning" = "Note: Some files may not be deleted if they are currently in use by another program."
        "Clean_Confirm" = "This will clean system temporary files and browser data (if detected). Continue?"
        "RAM_Confirm" = "This will perform an optimal cleanup of the system memory cache to free up RAM. Continue?"
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
        "Network_Repairing" = "Repairing network settings (Release, Renew, Flush DNS, Reset TCP/IP & Winsock)..."
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
        "Uninstall_Prompt" = "Type the name (or part of the name) of the program to uninstall (or press Enter to cancel):"
        "Uninstall_Searching" = "Searching for '{0}'..."
        "Uninstall_FoundMultiple" = "Found multiple matches. Please be more specific:"
        "Uninstall_FoundOne" = "Found program: {0}"
        "Uninstall_Confirm" = "Are you sure you want to run the uninstaller for this program?"
        "Uninstall_Running" = "Running uninstaller... Please follow the prompts on your screen."
        "Uninstall_Success" = "Uninstaller process started successfully."
        "Uninstall_NoMatch" = "No program found matching that name."
        "Uninstall_Error" = "Could not run the uninstaller. The program may be corrupt or already partially removed."
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
        "Defrag_SSD_Cancel" = "Operation cancelled. The selected drive is an SSD. Defragmentation is not needed."
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
        "Menu_Option11" = "Pengaturan Bahasa"
        "Menu_Option12" = "Keluar"
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
        "Health_SFC_Error" = "Pemindaian SFC gagal dengan kode keluar: {0}. Ini menandakan ada masalah pada sistem Windows."
        "Health_DISM_Running" = "Menjalankan perbaikan image DISM (DISM /Online /Cleanup-Image /RestoreHealth)... Harap tunggu."
        "Health_DISM_Done" = "Perbaikan image DISM selesai dengan sukses."
        "Health_DISM_Error" = "Perbaikan DISM gagal dengan kode keluar: {0}. Ini menandakan ada masalah pada sistem Windows."
        "Clean_Calculating" = "Menghitung ruang yang akan dibersihkan..."
        "Clean_SpaceFreed" = "Pembersihan selesai. Berhasil membebaskan sekitar {0} MB ruang."
        "Clean_Warning" = "Catatan: Beberapa file mungkin tidak terhapus jika sedang digunakan oleh program lain."
        "Clean_Confirm" = "Tindakan ini akan membersihkan file sementara sistem dan data browser (jika terdeteksi). Lanjutkan?"
        "RAM_Confirm" = "Tindakan ini akan melakukan pembersihan optimal pada cache memori sistem untuk melegakan RAM. Lanjutkan?"
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
        "Network_Repairing" = "Memperbaiki pengaturan jaringan (Release, Renew, Flush DNS, Reset TCP/IP & Winsock)..."
        "Network_Repaired" = "Pengaturan jaringan berhasil diperbaiki."
        "Network_ErrorRepair" = "Kesalahan memperbaiki jaringan: {0}"
        "Network_Restart_Warning" = "Disarankan untuk me-restart komputer Anda agar semua perubahan diterapkan."
        "Power_Balanced" = "Seimbang (Disarankan)"
        "Power_Saver" = "Hemat Daya"
        "Power_High" = "Performa Tinggi"
        "Power_Changed" = "Power plan berhasil diubah ke {0}."
        "Power_Active_Now" = "Power plan aktif saat ini: {0}"
        "Battery_Generating" = "Membuat laporan kesehatan baterai..."
        "Battery_Generated" = "Laporan disimpan di {0}. Sedang dibuka..."
        "Battery_NotFound" = "Tidak dapat membuat laporan. PC ini mungkin tidak memiliki baterai."
        "Battery_Error" = "Terjadi kesalahan saat membuat laporan baterai."
        "Uninstall_Title" = "UNINSTALLER MANUAL"
        "Uninstall_Scanning" = "Memindai registry untuk program terinstal... Harap tunggu."
        "Uninstall_Found" = "Ditemukan {0} program."
        "Uninstall_Prompt" = "Ketik nama (atau bagian nama) program untuk di-uninstall (atau tekan Enter untuk batal):"
        "Uninstall_Searching" = "Mencari '{0}'..."
        "Uninstall_FoundMultiple" = "Ditemukan beberapa yang cocok. Harap lebih spesifik:"
        "Uninstall_FoundOne" = "Program ditemukan: {0}"
        "Uninstall_Confirm" = "Apakah Anda yakin ingin menjalankan uninstaller untuk program ini?"
        "Uninstall_Running" = "Menjalankan uninstaller... Harap ikuti petunjuk di layar Anda."
        "Uninstall_Success" = "Proses uninstaller berhasil dimulai."
        "Uninstall_NoMatch" = "Tidak ada program yang ditemukan cocok dengan nama itu."
        "Uninstall_Error" = "Tidak dapat menjalankan uninstaller. Program mungkin rusak atau sudah terhapus sebagian."
        "System_Title" = "Informasi Sistem"
        "Clean_ErrorCalc" = "Kesalahan menghitung ukuran di {0}: {1}"
        "Clean_ErrorDelete" = "Tidak dapat menghapus file terkunci {0}: {1}"
        "Clean_Status" = "Pembersihan sedang berlangsung..."
        "RAM_Error" = "Kesalahan saat membersihkan memori: {0}"
        "Defrag_Title" = "OPTIMASI DRIVE"
        "Defrag_Select" = "Pilih drive yang akan dioptimasi:"
        "Defrag_Analyzing" = "Menganalisis {0} ({1})..."
        "Defrag_Optimizing" = "Mengoptimasi {0} ({1})... Proses ini mungkin butuh waktu."
        "Defrag_Complete" = "Optimalisasi selesai untuk drive {0}."
        "Defrag_Type_SSD" = "SSD"
        "Defrag_Type_HDD" = "HDD"
        "Defrag_SSD_Cancel" = "Operasi dibatalkan. Drive yang dipilih adalah SSD. Defragmentasi tidak diperlukan."
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

function Write-Title {
    param([string]$message)
    Write-Host $message -ForegroundColor $global:Theme.Title
}

function Write-MenuOption {
    param([string]$number, [string]$text, [string]$color = $global:Theme.MenuText)
    Write-Host " " -NoNewline
    Write-Host $number -ForegroundColor $global:Theme.MenuNumber -NoNewline
    Write-Host ". " -ForegroundColor $global:Theme.Separator -NoNewline
    Write-Host $text -ForegroundColor $color
}

function Write-Error {
    param([string]$message)
    Write-Host $message -ForegroundColor $global:Theme.Error
}
function Write-Success {
    param([string]$message)
    Write-Host $message -ForegroundColor $global:Theme.Success
}
function Write-Warning {
    param([string]$message)
    Write-Host $message -ForegroundColor $global:Theme.Warning
}
function Write-Info {
    param([string]$message)
    Write-Host $message -ForegroundColor $global:Theme.Info
}

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
    param([int]$maxSizeMB = 10)
    if (Test-Path $logfile) {
        try {
            $log = Get-Item $logfile
            if ($log.Length -gt ($maxSizeMB * 1MB)) {
                $backupName = "log_ncexs-toolkit-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
                Move-Item -Path $logfile -Destination (Join-Path $PSScriptRoot $backupName) -Force -ErrorAction Stop
                Write-Log "Log file backed up and reset." "INFO"
            }
        } catch {
            $errorMsg = "Failed to clear old log file: $($_.Exception.Message)"
            # Write to host as error if Write-Log fails
            Write-Error $errorMsg
        }
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
        
        # --- GPU ENHANCEMENT WITH DRIVER VERSION ---
        $gpus = Get-CimInstance -ClassName Win32_VideoController
        foreach ($gpu in $gpus) {
            if ($gpu.Name) {
                $gpuName = $gpu.Name
                $driverVersion = $null
                
                try {
                    # Try to find driver version in registry for better accuracy
                    if ($gpuName -like "*NVIDIA*") {
                        $regPath = "HKLM:\SOFTWARE\NVIDIA Corporation\Geforce"
                        if (Test-Path $regPath) {
                            $driverVersion = (Get-ItemProperty $regPath).Version
                        }
                    } elseif ($gpuName -like "*AMD*" -or $gpuName -like "*Radeon*") {
                        $regPath = "HKLM:\SOFTWARE\AMD\CNext\CNext"
                         if (Test-Path $regPath) {
                            $driverVersion = (Get-ItemProperty $regPath).DriverVersion
                         }
                    } elseif ($gpuName -like "*Intel*") {
                        $regPath = "HKLM:\SOFTWARE\Intel\Gfx"
                        if (Test-Path $regPath) {
                             $driverVersion = (Get-ItemProperty $regPath).Version
                        }
                    }
                } catch {
                    # If registry fails, use the WMI version as a fallback
                    $driverVersion = $gpu.DriverVersion
                }
                
                # Final fallback if registry check was skipped or failed
                if (-not $driverVersion) {
                    $driverVersion = $gpu.DriverVersion
                }

                Write-Host ("{0}: {1} (Driver: {2})" -f (Get-Translation "GPU"), $gpuName, $driverVersion) -ForegroundColor $global:Theme.MenuText
            }
        }
        # --- END OF ENHANCEMENT ---
        
        $totalMemory = [math]::Round($system.TotalPhysicalMemory / 1GB, 2)
        $freeMemory = [math]::Round($os.FreePhysicalMemory / 1MB, 2) # FreePhysicalMemory is in KB, so divide by 1MB
        Write-Host ("{0}: {1} GB ({2} GB {3})" -f (Get-Translation "RAM"), $totalMemory, $freeMemory, (Get-Translation "Free")) -ForegroundColor $global:Theme.MenuText
        
        $board = Get-CimInstance -ClassName Win32_BaseBoard
        Write-Host ("{0}: {1} {2}" -f (Get-Translation "Motherboard"), $board.Manufacturer, $board.Product) -ForegroundColor $global:Theme.MenuText
        
        $bios = Get-CimInstance -ClassName Win32_BIOS
        Write-Host ("{0}: {1}" -f (Get-Translation "SerialNumber"), $bios.SerialNumber) -ForegroundColor $global:Theme.MenuText
        
        Write-Host "`n$(Get-Translation 'Disk'):" -ForegroundColor $global:Theme.Prompt
        $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
        foreach ($disk in $disks) {
            $freeSpace = [math]::Round($disk.FreeSpace / 1GB, 2)
            $totalSize = [math]::Round($disk.Size / 1GB, 2)
            Write-Host ("    {0} {1} GB ({2} GB {3})" -f $disk.DeviceID, $totalSize, $freeSpace, (Get-Translation "Free")) -ForegroundColor $global:Theme.Info
        }
    } catch {
        Write-Log "Failed to get system info: $($_.Exception.Message)" "ERROR"
        Write-Error (Get-Translation "System_Error")
    }
    Write-Host "==========================" -ForegroundColor $global:Theme.Title
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 2. Clear Junk Files
# ---------------------------
function Clear-JunkFiles {
    Write-Log (Get-Translation 'Clean_Title') "INFO"
    Write-Title "`n=== $(Get-Translation 'Clean_Title') ==="

    $confirm = Read-Host "`n$(Get-Translation 'Clean_Confirm') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -notmatch '^(Y|y)$') -or ($global:Language -eq "EN" -and $confirm -notmatch '^(Y|y)$')) {
        Write-Warning (Get-Translation 'Cancel')
        Read-Host "`n$(Get-Translation 'PressAnyKey')"
        return
    }

    Write-Warning (Get-Translation 'Clean_Warning')

    $chromeProfilePath = Join-Path $env:LOCALAPPDATA 'Google\Chrome\User Data\Default'
    if (Test-Path $chromeProfilePath) {
        Invoke-ChromeCleanup -ProfilePath $chromeProfilePath
    }

    # 1. Start with common paths that always exist
    $pathsToClean = @(
        "$env:SystemRoot\Temp",
        "$env:TEMP",
        "$env:SystemRoot\Prefetch",
        "$env:SystemRoot\SoftwareDistribution\Download"
    )

    # 2. Define vendor-specific cache paths
    $vendorPaths = @(
        # AMD
        (Join-Path $env:LOCALAPPDATA "AMD\DxCache"),
        (Join-Path $env:LOCALAPPDATA "AMD\GLCache"),
        (Join-Path $env:LOCALAPPDATA "AMD\OglCache"),
        
        # NVIDIA
        (Join-Path $env:LOCALAPPDATA "NVIDIA\GLCache"),
        (Join-Path $env:PROGRAMDATA  "NVIDIA Corporation\Downloader"),

        # Intel
        (Join-Path $env:LOCALAPPDATA "Intel\DxcCache"),
        (Join-Path $env:LOCALAPPDATA "Intel\Logs")
    )

    # 3. Check each vendor path and add it to the list if it exists
    foreach ($path in $vendorPaths) {
        if (Test-Path $path) {
            Write-Info "  -> Driver cache found: $path"
            $pathsToClean += $path
        }
    }

    Write-Info "`n$( (Get-Translation 'Clean_Calculating') )"   
    $totalFreed = 0
    Write-Progress -Activity (Get-Translation 'Clean_Title') -Status (Get-Translation 'Clean_Status')

    foreach ($folderPath in $pathsToClean) {
        if (-not (Test-Path $folderPath)) { continue }
        $items = Get-ChildItem -Path $folderPath -Force -ErrorAction SilentlyContinue   
        foreach ($item in $items) {
            try {
                $itemSize = 0
                if (-not $item.PSIsContainer) {
                    $itemSize = $item.Length
                } else {
                    $subItems = Get-ChildItem -Path $item.FullName -Recurse -Force -ErrorAction SilentlyContinue
                    if ($subItems) {
                        $itemSize = ($subItems | Where-Object { -not $_.PSIsContainer } | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
                    }
                }
                Remove-Item -Path $item.FullName -Recurse -Force -ErrorAction Stop
                $totalFreed += $itemSize               
            } catch {
                # (The process cannot access the file...)
                $errMsg = (Get-Translation 'Clean_ErrorDelete') -f $item.Name, $_.Exception.Message
                Write-Warning $errMsg; Write-Log $errMsg "WARNING"
            }
        }
    }
    Write-Progress -Activity (Get-Translation 'Clean_Title') -Completed

    $cleanedSizeMB = [math]::Round($totalFreed / 1MB, 2)
    $message = (Get-Translation 'Clean_SpaceFreed') -f $cleanedSizeMB
    Write-Log $message "SUCCESS"
    Write-Success "`n$message"
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

function Invoke-ChromeCleanup {
    param([string]$ProfilePath)
    Write-Info "`n$(Get-Translation 'Chrome_Cleaning')" 
    $chromePaths = @(
        Join-Path $ProfilePath 'Cache\*', 
        Join-Path $ProfilePath 'Code Cache\*', 
        Join-Path $ProfilePath 'GPUCache\*',
        Join-Path $ProfilePath 'Session Storage\*', 
        Join-Path $ProfilePath 'Service Worker\CacheStorage\*',
        Join-Path $ProfilePath 'History', 
        Join-Path $ProfilePath 'Web Data'
    )
    
    foreach ($path in $chromePaths) {
        if (Test-Path $path) {
            try { 
                Remove-Item $path -Recurse -Force -ErrorAction Stop 
            }
            catch { 
                $errMsg = (Get-Translation 'Clean_ErrorDelete') -f $path, $_.Exception.Message
                Write-Warning $errMsg
                Write-Log $errMsg "WARNING" 
            }
        }
    }
    Write-Success (Get-Translation 'Chrome_Done')
    Write-Log "Chrome cleanup performed." "SUCCESS"
}

# ---------------------------
# 3. Clear Recycle Bin
# ---------------------------
function Clear-RecycleBin-Menu {
    Write-Title "`n=== $(Get-Translation 'Recycle_Title') ==="
    $confirm = Read-Host "$(Get-Translation 'Recycle_Confirm') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -match '^(Y|y)$') -or ($global:Language -eq "EN" -and $confirm -match '^(Y|y)$')) {
        try {
            $drives = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Name
            $isEmpty = $true
            foreach ($drive in $drives) {
                $recycleBinPath = "$($drive):\`$Recycle.Bin"
                if (Test-Path $recycleBinPath) {
                    $isEmpty = $false
                    Write-Info "Emptying Recycle Bin on drive $($drive):..."
                    Remove-Item -Path $recycleBinPath -Recurse -Force -ErrorAction Stop
                }
            }
            if ($isEmpty) { Write-Warning (Get-Translation 'Recycle_AlreadyEmpty') }
            else { Write-Success (Get-Translation 'Recycle_Success'); Write-Log "All Recycle Bins emptied successfully." "SUCCESS" }
        } catch {
            $errorMsg = "Failed to empty recycle bin: $($_.Exception.Message)"
            Write-Log $errorMsg "ERROR"; Write-Error $errorMsg
        }
    } else { Write-Warning (Get-Translation 'Cancel') }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 4. Open Disk Cleanup
# ---------------------------
function Open-DiskCleanup {
    Write-Title "`nOpening Windows Disk Cleanup utility..."
    try { Start-Process -FilePath "cleanmgr.exe" -ErrorAction Stop; Write-Log "Launched cleanmgr.exe" "INFO" }
    catch { $errorMsg = "Failed to open Disk Cleanup: $($_.Exception.Message)"; Write-Log $errorMsg "ERROR"; Write-Error $errorMsg; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
}

# ---------------------------
# 5. Advanced Uninstaller
# ---------------------------
function Show-AdvancedUninstaller {
    Write-Title "`n=== $(Get-Translation 'Uninstall_Title') ==="
    Write-Warning (Get-Translation 'Uninstall_Scanning')
    
    $programs = @()
    $registryPaths = @(
        'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )

    foreach ($path in $registryPaths) {
        try {
            Get-ItemProperty -Path $path -ErrorAction SilentlyContinue | ForEach-Object {
                if ($_.DisplayName -and $_.UninstallString) {
                    if (($_.DisplayName -notmatch "KB[0-9]") -and (-not $_.ParentKeyName) -and ($_.SystemComponent -ne 1)) {
                        $programs += [PSCustomObject]@{
                            DisplayName     = $_.DisplayName
                            UninstallString = $_.UninstallString
                        }
                    }
                }
            }
        } catch {}
    }
    
    $uniquePrograms = $programs | Sort-Object DisplayName -Unique
    
    Write-Success (Get-Translation 'Uninstall_Found' -f $uniquePrograms.Count)
    $searchTerm = Read-Host "`n$(Get-Translation 'Uninstall_Prompt')"
    
    if ([string]::IsNullOrWhiteSpace($searchTerm)) {
        Write-Warning (Get-Translation 'Cancel')
        return
    }
    
    Write-Info "`n$( (Get-Translation 'Uninstall_Searching') -f $searchTerm )"
    
    $matchingPrograms = $uniquePrograms | Where-Object { $_.DisplayName -like "*$searchTerm*" }
    
    if (-not $matchingPrograms) {
        Write-Error (Get-Translation 'Uninstall_NoMatch')
        return
    }
    
    $selectedProgram = $null
    if ($matchingPrograms.Count -eq 1) {
        $selectedProgram = $matchingPrograms[0]
        Write-Success (Get-Translation 'Uninstall_FoundOne' -f $selectedProgram.DisplayName)
    } else {
        Write-Warning (Get-Translation 'Uninstall_FoundMultiple')
        for ($i = 0; $i -lt $matchingPrograms.Count; $i++) {
            Write-Host "[$($i+1)] $($matchingPrograms[$i].DisplayName)"
        }
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        if ($choice -match '^\d+$' -and [int]$choice -ge 1 -and [int]$choice -le $matchingPrograms.Count) {
            $selectedProgram = $matchingPrograms[[int]$choice - 1]
        } else {
            Write-Warning (Get-Translation 'Cancel')
            return
        }
    }
    
    $confirm = Read-Host "`n$((Get-Translation 'Uninstall_Confirm')) $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -match '^(Y|y)$') -or ($global:Language -eq "EN" -and $confirm -match '^(Y|y)$')) {
        Write-Warning "`n$(Get-Translation 'Uninstall_Running')"
        Write-Log "Attempting to uninstall: $($selectedProgram.DisplayName)" "INFO"
        
        $uninstallString = $selectedProgram.UninstallString
        $uninstallString = $uninstallString.Trim('"')
        
        try {
            if ($uninstallString -like "MsiExec.exe*") {
                Start-Process "cmd.exe" -ArgumentList "/c $uninstallString" -Wait -Verb RunAs
            } else {
                $command = $uninstallString.Split(' ')[0]
                if (-not (Test-Path $command)) {
                    $command = (Get-Command $command -ErrorAction SilentlyContinue).Source
                }
                $arguments = $uninstallString.Substring($uninstallString.IndexOf(' ') + 1)
                
                if ($command) {
                    Start-Process $command -ArgumentList $arguments -Wait -Verb RunAs
                } else {
                    Start-Process $uninstallString -Wait -Verb RunAs
                }
            }
            Write-Success "`n$(Get-Translation 'Uninstall_Success')"
        } catch {
            Write-Error "`n$(Get-Translation 'Uninstall_Error')"
            Write-Log "Failed to run uninstaller: $($_.Exception.Message)" "ERROR"
        }
    } else {
        Write-Warning (Get-Translation 'Cancel')
    }
}

# ---------------------------
# 6. Network Repair
# ---------------------------
function Invoke-NetworkRepair {
    Write-Title "`n=== $(Get-Translation 'Network_Title') ==="
    
    Write-Log "Running full network repair..." "INFO"
    Write-Warning "`n$(Get-Translation 'Network_Repairing')"
    try {
        # Run all commands sequentially
        Write-Info "  -> (1/5) Running ipconfig /release..."
        ipconfig /release | Out-Null
        
        Write-Info "  -> (2/5) Running ipconfig /renew..."
        ipconfig /renew | Out-Null
        
        Write-Info "  -> (3/5) Running ipconfig /flushdns..."
        ipconfig /flushdns | Out-Null
        
        Write-Info "  -> (4/5) Running netsh winsock reset..."
        netsh winsock reset | Out-Null
        
        Write-Info "  -> (5/5) Running netsh int ip reset..."
        netsh int ip reset | Out-Null
        
        Write-Log "Full network repair completed." "SUCCESS"
        Write-Success "`n$(Get-Translation 'Network_Repaired')"
        Write-Warning (Get-Translation 'Network_Restart_Warning')

    } catch { 
        $errorMsg = (Get-Translation 'Network_ErrorRepair') -f $_.Exception.Message
        Write-Log $errorMsg "ERROR"; Write-Error $errorMsg 
    }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 7. Power & Battery Utilities
# ---------------------------
function Show-PowerMenu {
    do {
        Clear-Host
        Write-Separator
        Write-Title "       $(Get-Translation 'SubMenu_Power')"
        Write-Separator
        Write-MenuOption "1" (Get-Translation 'SubMenu_Power1')
        Write-MenuOption "2" (Get-Translation 'SubMenu_Power2')
        Write-MenuOption "3" (Get-Translation 'SubMenu_Power3') $global:Theme.Exit
        Write-Separator
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { Invoke-PowerPlanChange; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "2" { Invoke-BatteryReport; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "3" { return }
            default { Write-Error (Get-Translation 'InvalidOption'); Start-Sleep -Seconds 2 }
        }
    } while ($true)
}

function Invoke-PowerPlanChange {
    Write-Title "`n$(Get-Translation 'Power_Select')"
    Write-MenuOption "1" (Get-Translation 'Power_Saver')
    Write-MenuOption "2" (Get-Translation 'Power_Balanced')
    Write-MenuOption "3" (Get-Translation 'Power_High')
    Write-MenuOption "4" (Get-Translation 'Cancel') $global:Theme.Exit
    
    $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
    
    $plan = $null
    $guid = $null
    
    switch ($choice) {
        "1" { $plan = (Get-Translation 'Power_Saver'); $guid = "a1841308-3541-4fab-bc81-f71556f20b4a" }
        "2" { $plan = (Get-Translation 'Power_Balanced'); $guid = "381b4222-f694-41f0-9685-ff5bb260df2e" }
        "3" { $plan = (Get-Translation 'Power_High'); $guid = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c" }
        "4" { Write-Warning (Get-Translation 'Cancel'); return }
        default { Write-Error (Get-Translation 'InvalidOption'); return }
    }

    try {
        powercfg /setactive $guid | Out-Null
        $message = (Get-Translation 'Power_Changed') -f $plan
        Write-Log $message "SUCCESS"
        Write-Success "`n$message"

        try {
            $activeSchemeOutput = powercfg /getactivescheme
            $activeSchemeName = $null
            
            if ($activeSchemeOutput -match '\((.*?)\)') {
                $activeSchemeName = $matches[1].Trim() 
            }

            if (-not [string]::IsNullOrWhiteSpace($activeSchemeName)) {
                $confirmMsg = (Get-Translation 'Power_Active_Now') -f $activeSchemeName
                Write-Host $confirmMsg -ForegroundColor $global:Theme.MenuText
            } else {
                Write-Host $activeSchemeOutput -ForegroundColor $global:Theme.MenuText
            }
        } catch {
            Write-Log "Failed to verify active power plan." "WARNING"
        }

    } catch {
        $errorMsg = "Failed to change power plan: $($_.Exception.Message)"
        Write-Log $errorMsg "ERROR"; Write-Error $errorMsg
    }
}

function Invoke-BatteryReport {
    $reportPath = Join-Path -Path $PSScriptRoot -ChildPath "battery_report.html"
    Write-Warning "`n$(Get-Translation 'Battery_Generating')"
    
    try {
        powercfg /batteryreport /output "$reportPath" /duration 1 | Out-Null
        
        if (Test-Path $reportPath) {
            $message = (Get-Translation 'Battery_Generated') -f $reportPath
            Write-Success $message
            Start-Process $reportPath
            Write-Log "Battery report generated and opened." "SUCCESS"
        } else {
            Write-Warning (Get-Translation 'Battery_NotFound')
            Write-Log "Battery report failed, likely no battery." "WARNING"
        }
    } catch {
        $errorMsg = (Get-Translation 'Battery_Error') + ": $($_.Exception.Message)"
        Write-Log $errorMsg "ERROR"; Write-Error $errorMsg
    }
}

# ---------------------------
# 8. Memory Optimizer
# ---------------------------
function Clear-RAM {
    Write-Title "`n=== $(Get-Translation 'Menu_Option8') ==="
    $confirm = Read-Host "`n$(Get-Translation 'RAM_Confirm') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -notmatch '^(Y|y)$') -or ($global:Language -eq "EN" -and $confirm -notmatch '^(Y|y)$')) {
        Write-Warning (Get-Translation 'RAM_Cancel')
        Read-Host "`n$(Get-Translation 'PressAnyKey')"
        return
    }

    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        $memBefore = [math]::Round($os.FreePhysicalMemory / 1024)
        Write-Info ((Get-Translation 'RAM_Before') -f $memBefore)
        Write-Progress -Activity (Get-Translation 'Menu_Option8') -Status "Optimizing..."

        $CSharpCode = @"
        using System;
        using System.Runtime.InteropServices;
        public class MemoryOptimizer
        {
            [DllImport("psapi.dll")]
            private static extern bool EmptyWorkingSet(IntPtr hProcess);
            public static void ClearAllProcessesWorkingSet()
            {
                foreach (var process in System.Diagnostics.Process.GetProcesses())
                {
                    try
                    {
                        if (process.Id != System.Diagnostics.Process.GetCurrentProcess().Id)
                        {
                            EmptyWorkingSet(process.Handle);
                        }
                    }
                    catch { /* Ignore processes that we can't access */ }
                }
            }
        }
"@
        Add-Type -TypeDefinition $CSharpCode
        [MemoryOptimizer]::ClearAllProcessesWorkingSet()
        
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        Start-Sleep -Seconds 1

        $memAfter = [math]::Round((Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory / 1024)
        Write-Info ((Get-Translation 'RAM_After') -f $memAfter)
        
        $memFreed = $memAfter - $memBefore
        if ($memFreed -gt 10) {
            $message = (Get-Translation 'RAM_Freed') -f $memFreed
            Write-Log "$message" "SUCCESS"; Write-Success $message
        }
        else {
            Write-Success "Memory is already optimized."
        }
    } catch {
        $errorMsg = (Get-Translation 'RAM_Error') -f $_.Exception.Message
        Write-Log $errorMsg "ERROR"; Write-Error $errorMsg
    } finally {
        Write-Progress -Activity (Get-Translation 'Menu_Option8') -Completed
    }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 9. Defragment & Optimize Drives
# ---------------------------
function Invoke-Defragment {
    Write-Title "`n=== $(Get-Translation 'Defrag_Title') ==="
    try {
        $volumes = Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' -and $_.DriveLetter } | Sort-Object DriveLetter
        if (-not $volumes) { Write-Error "No fixed drives found to optimize."; return }
        Write-Title "`n$(Get-Translation 'Defrag_Select')"
        for ($i=0; $i -lt $volumes.Count; $i++) { $vol = $volumes[$i]; $label = if ($vol.FileSystemLabel) { $vol.FileSystemLabel } else { "No Label" }; Write-MenuOption "[$($i+1)]" "$($vol.DriveLetter): ($label) - $($vol.FileSystem)" }
        Write-MenuOption "[C]" "Cancel" $global:Theme.Exit
        $choice = Read-Host "Select drive"
        if ($choice -match 'c' -or ![int]::TryParse($choice, [ref]$null) -or [int]$choice -lt 1 -or [int]$choice -gt $volumes.Count) { Write-Warning (Get-Translation 'Cancel'); return }
        $selectedVolume = $volumes[[int]$choice - 1]
        $driveLetter = $selectedVolume.DriveLetter
        
        $diskNumber = (Get-Partition -DriveLetter $selectedVolume.DriveLetter).DiskNumber
        $mediaType = (Get-PhysicalDisk -DeviceNumber $diskNumber).MediaType
        if ($mediaType -eq "SSD") {
            Write-Warning "`n$(Get-Translation 'Defrag_SSD_Cancel')"
            Write-Log "Defragmentation cancelled for SSD drive $driveLetter." "INFO"
            Read-Host "`n$(Get-Translation 'PressAnyKey')"
            return
        }
        
        $mediaTypeDisplay = Get-Translation 'Defrag_Type_HDD'
        Write-Info "`n$( (Get-Translation 'Defrag_Analyzing') -f $driveLetter, $mediaTypeDisplay )"
        Optimize-Volume -DriveLetter $driveLetter -Analyze -Verbose
        $confirmationMessage = (Get-Translation 'Defrag_Optimizing') -f $driveLetter, $mediaTypeDisplay
        Write-Warning "`n$confirmationMessage"
        Optimize-Volume -DriveLetter $driveLetter -Verbose
        Write-Success "`n$( (Get-Translation 'Defrag_Complete') -f $driveLetter )"
    } catch { $errorMsg = "An error occurred during optimization: $($_.Exception.Message)"; Write-Log $errorMsg "ERROR"; Write-Error $errorMsg }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 10. System Health Checker
# ---------------------------
function Show-SystemHealthMenu {
    do {
        Clear-Host
        Write-Separator
        Write-Title "       $(Get-Translation 'SubMenu_Health')"
        Write-Separator
        Write-MenuOption "1" (Get-Translation 'SubMenu_Health1')
        Write-MenuOption "2" (Get-Translation 'SubMenu_Health2')
        Write-MenuOption "3" (Get-Translation 'SubMenu_Health3') $global:Theme.Exit
        Write-Separator
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { Invoke-SFCScan; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "2" { Invoke-DISMRepair; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "3" { return }
            default { Write-Error (Get-Translation 'InvalidOption'); Start-Sleep -Seconds 2 }
        }
    } while ($true)
}

function Invoke-SFCScan {
    $confirm = Read-Host "`n$(Get-Translation 'Health_Warning') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -notmatch '^(Y|y)$') -or ($global:Language -eq "EN" -and $confirm -notmatch '^(Y|y)$')) { return }
    Write-Warning "`n$(Get-Translation 'Health_SFC_Running')"
    try {
        $process = Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -PassThru -NoNewWindow
        if ($process.ExitCode -eq 0) { Write-Success "`n$(Get-Translation 'Health_SFC_Done')"; Write-Log "SFC Scan completed successfully." "SUCCESS" }
        else { $errorMsg = (Get-Translation 'Health_SFC_Error') -f "$($process.ExitCode)"; Write-Log "SFC.exe tool reported an error." "ERROR"; Write-Error "`n$errorMsg" }
    } catch { Write-Log "Failed to start sfc.exe: $($_.Exception.Message)" "ERROR" }
}

function Invoke-DISMRepair {
    $confirm = Read-Host "`n$(Get-Translation 'Health_Warning') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -notmatch '^(Y|y)$') -and ($global:Language -eq "EN" -and $confirm -notmatch '^(Y|y)$')) { return }
    Write-Warning "`n$(Get-Translation 'Health_DISM_Running')"
    try {
        $process = Start-Process -FilePath "dism.exe" -ArgumentList "/online", "/cleanup-image", "/restorehealth" -Wait -PassThru -NoNewWindow
        if ($process.ExitCode -eq 0) { Write-Success "`n$(Get-Translation 'Health_DISM_Done')"; Write-Log "DISM repair completed successfully." "SUCCESS" }
        else { $errorMsg = (Get-Translation 'Health_DISM_Error') -f "$($process.ExitCode)"; Write-Log "DISM.exe tool reported an error." "ERROR"; Write-Error "`n$errorMsg" }
    } catch { Write-Log "Failed to start dism.exe: $($_.Exception.Message)" "ERROR" }
}

# ---------------------------
# 11. Language Settings
# ---------------------------
function Show-LanguageMenu {
    Clear-Host
    Write-Separator
    Write-Title "                 $(Get-Translation 'LanguageMenu')"
    Write-Separator
    Write-MenuOption "1" (Get-Translation 'LanguageMenu1')
    Write-MenuOption "2" (Get-Translation 'LanguageMenu2')
    Write-MenuOption "3" (Get-Translation 'LanguageMenu3') $global:Theme.Exit
    Write-Separator
    do {
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { $global:Language = "EN"; Write-Success "Language changed to English."; Start-Sleep -Seconds 1; return }
            "2" { $global:Language = "ID"; Write-Success "Bahasa diubah ke Indonesia."; Start-Sleep -Seconds 1; return }
            "3" { return }
            default { Write-Error (Get-Translation 'InvalidOption') }
        }
    } while ($true)
}

# ---------------------------
# Main Menu
# ---------------------------
function Show-MainMenu {
    Clear-Host
    Write-Separator
    Write-Host ""
    Write-Host "                       _ __   ___ _____   _____ " -ForegroundColor $global:Theme.AsciiArt
    Write-Host "                      | '_ \ / __/ _ \ \/ / __|" -ForegroundColor $global:Theme.AsciiArt
    Write-Host "                      | | | | (_|  __/>  <\__ \ " -ForegroundColor $global:Theme.AsciiArt
    Write-Host "                      |_| |_|\___\___/_/\_\___/" -ForegroundColor $global:Theme.AsciiArt
    Write-Host ""
    Write-Host ("                      {0}" -f (Get-Translation 'Menu_Title')) -ForegroundColor $global:Theme.Prompt
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
    Write-MenuOption "11" (Get-Translation 'Menu_Option11')
    Write-MenuOption "12" (Get-Translation 'Menu_Option12') $global:Theme.Exit
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
        "11" { Show-LanguageMenu }
        "12" {
            Write-Log "Toolkit session completed." "INFO"
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