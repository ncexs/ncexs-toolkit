<#
===============================================
 ncexs Toolkit v2.3 beta3
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
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
}

# Set execution policy (for this session only)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

# ---------------------------
# Global vars & Translations
# ---------------------------
$global:ToolkitVersion = "2.3 beta3"
$global:Language = "ID"  # default

# Standardized translation structure
$global:Translations = @{
    "EN" = @{
        "Menu_Title" = ("ncexs Toolkit v{0}" -f $global:ToolkitVersion)
        "Menu_Option1" = "System Information"
        "Menu_Option2" = "Junk Cleaner"
        "Menu_Option3" = "Empty Recycle Bin"
        "Menu_Option4" = "Open Disk Cleanup"
        "Menu_Option5" = "Network Utilities"
        "Menu_Option6" = "Memory Optimizer"
        "Menu_Option7" = "Open Windows Security"
        "Menu_Option8" = "Defragment & Optimize Drives"
        "Menu_Option9" = "System Health Checker"
        "Menu_Option10" = "Startup Manager"
        "Menu_Option11" = "Language Settings"
        "Menu_Option12" = "Exit"
        "SubMenu_Network" = "NETWORK UTILITIES"
        "SubMenu_Network1" = "Network Repair (Reset TCP/IP & flush DNS)"
        "SubMenu_Network2" = "Internet Accelerator (Change DNS)"
        "SubMenu_Network3" = "Back to Main Menu"
        "SubMenu_Health" = "SYSTEM HEALTH CHECKER"
        "SubMenu_Health1" = "Run System File Checker (SFC)"
        "SubMenu_Health2" = "Run DISM Image Repair"
        "SubMenu_Health3" = "Back to Main Menu"
        "SubMenu_Startup" = "STARTUP MANAGER"
        "SubMenu_Startup1" = "Disable Startup Programs"
        "SubMenu_Startup2" = "Enable Startup Programs"
        "SubMenu_Startup3" = "Back to Main Menu"
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
        "RAM" = "Memory"
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
        "RAM_Confirm" = "This will run a light optimization on the memory. The effect may be minimal. Continue?"
        "RAM_Before" = "Available Memory (Before): {0} MB"
        "RAM_After" = "Available Memory (After): {0} MB"
        "RAM_Freed" = "Successfully freed {0} MB of memory."
        "RAM_Cancel" = "Memory optimization cancelled."
        "Recycle_Title" = "RECYCLE BIN CLEANUP"
        "Recycle_Confirm" = "Are you sure you want to permanently empty the Recycle Bin?"
        "Recycle_Success" = "Recycle Bin emptied successfully."
        "Recycle_AlreadyEmpty" = "Recycle Bin is already empty."
        "Clean_Title" = "TEMP & CACHE CLEANUP"
        "Network_Repairing" = "Repairing network settings..."
        "Network_Repaired" = "Network settings repaired successfully."
        "Network_ErrorRepair" = "Error repairing network: {0}"
        "Startup_Title" = "STARTUP MANAGER"
        "Startup_List" = "Current Startup Programs:"
        "Startup_Disabled" = "Startup program disabled: {0}"
        "Startup_Enabled" = "Startup program enabled: {0}"
        "Startup_None" = "No startup programs found."
        "Startup_Error" = "Error managing startup: {0}"
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
        "Chrome_Confirm" = "Do you want to clean Google Chrome? This will close all Chrome windows but will NOT log you out of websites."
        "Chrome_Closing" = "Closing Google Chrome processes..."
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
        "Menu_Option5" = "Utilitas Jaringan"
        "Menu_Option6" = "Optimasi Memori"
        "Menu_Option7" = "Buka Keamanan Windows"
        "Menu_Option8" = "Defragment & Optimasi Drive"
        "Menu_Option9" = "Pemeriksa Kesehatan Sistem"
        "Menu_Option10" = "Pengelola Startup"
        "Menu_Option11" = "Pengaturan Bahasa"
        "Menu_Option12" = "Keluar"
        "SubMenu_Network" = "UTILITAS JARINGAN"
        "SubMenu_Network1" = "Perbaikan Jaringan (Reset TCP/IP & flush DNS)"
        "SubMenu_Network2" = "Akselerator Internet (Ubah DNS)"
        "SubMenu_Network3" = "Kembali ke Menu Utama"
        "SubMenu_Health" = "PEMERIKSA KESEHATAN SISTEM"
        "SubMenu_Health1" = "Jalankan Pemeriksa Berkas Sistem (SFC)"
        "SubMenu_Health2" = "Jalankan Perbaikan Image DISM"
        "SubMenu_Health3" = "Kembali ke Menu Utama"
        "SubMenu_Startup" = "PENGELOLA STARTUP"
        "SubMenu_Startup1" = "Nonaktifkan Program Startup"
        "SubMenu_Startup2" = "Aktifkan Program Startup"
        "SubMenu_Startup3" = "Kembali ke Menu Utama"
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
        "RAM" = "Memori"
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
        "RAM_Confirm" = "Ini akan menjalankan optimasi ringan pada memori. Efeknya mungkin minimal. Lanjutkan?"
        "RAM_Before" = "Memori Tersedia (Sebelum): {0} MB"
        "RAM_After" = "Memori Tersedia (Setelah): {0} MB"
        "RAM_Freed" = "Berhasil membebaskan {0} MB memori."
        "RAM_Cancel" = "Optimasi memori dibatalkan."
        "Recycle_Title" = "PEMBERSIHAN RECYCLE BIN"
        "Recycle_Confirm" = "Apakah Anda yakin ingin mengosongkan Recycle Bin secara permanen?"
        "Recycle_Success" = "Recycle Bin berhasil dikosongkan."
        "Recycle_AlreadyEmpty" = "Recycle Bin sudah kosong."
        "Clean_Title" = "PEMBERSIHAN SEMENTARA & CACHE"
        "Network_Repairing" = "Memperbaiki pengaturan jaringan..."
        "Network_Repaired" = "Pengaturan jaringan berhasil diperbaiki."
        "Network_ErrorRepair" = "Kesalahan memperbaiki jaringan: {0}"
        "Startup_Title" = "PENGELOLA STARTUP"
        "Startup_List" = "Program Startup Saat Ini:"
        "Startup_Disabled" = "Program startup dinonaktifkan: {0}"
        "Startup_Enabled" = "Program startup diaktifkan: {0}"
        "Startup_None" = "Tidak ada program startup yang ditemukan."
        "Startup_Error" = "Kesalahan mengelola startup: {0}"
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
        "Chrome_Confirm" = "Apakah Anda ingin membersihkan Google Chrome? Ini akan menutup semua jendela Chrome tapi TIDAK akan membuat Anda logout dari website."
        "Chrome_Closing" = "Menutup proses Google Chrome..."
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
    # Fallback to English if key not found in current language
    if ($global:Translations["EN"].ContainsKey($key)) { return $global:Translations["EN"][$key] }
    return $key # Return the key itself if not found anywhere
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
        "ERROR"   { Write-Host $logEntry -ForegroundColor Red }
        "WARNING" { Write-Host $logEntry -ForegroundColor Yellow }
        "SUCCESS" { Write-Host $logEntry -ForegroundColor Green }
        default   { Write-Host $logEntry -ForegroundColor White }
    }
}

function Clear-OldLogs {
    param([int]$maxSizeMB = 10)
    if (Test-Path $logfile) {
        $log = Get-Item $logfile
        if ($log.Length -gt ($maxSizeMB * 1MB)) {
            $backupName = "log_ncexs-toolkit-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss').txt"
            Move-Item -Path $logfile -Destination (Join-Path $PSScriptRoot $backupName) -Force
            Write-Log "Log file backed up and reset." "INFO"
        }
    }
}

Clear-OldLogs

# ---------------------------
# 1. System Info
# ---------------------------
function Show-SystemInfo {
    Write-Host "`n=== $(Get-Translation 'System_Title') ===" -ForegroundColor Cyan
    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        Write-Host ("{0}: {1}" -f (Get-Translation "OS"), $os.Caption)
        Write-Host ("{0}: {1}" -f (Get-Translation "Version"), $os.Version)
        $cpu = Get-CimInstance -ClassName Win32_Processor
        Write-Host ("{0}: {1}" -f (Get-Translation "CPU"), $cpu.Name)
        $memory = Get-CimInstance -ClassName Win32_ComputerSystem
        $totalMemory = [math]::Round($memory.TotalPhysicalMemory / 1GB, 2)
        Write-Host ("{0}: {1} GB" -f (Get-Translation "RAM"), $totalMemory)
        Write-Host "`n$(Get-Translation 'Disk'):" -ForegroundColor Yellow
        $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
        foreach ($disk in $disks) {
            $freeSpace = [math]::Round($disk.FreeSpace / 1GB, 2)
            $totalSize = [math]::Round($disk.Size / 1GB, 2)
            Write-Host ("  {0} {1} GB ({2} GB {3})" -f $disk.DeviceID, $totalSize, $freeSpace, (Get-Translation "Free")) -ForegroundColor Gray
        }
    } catch {
        Write-Log "Failed to get system info: $($_.Exception.Message)" "ERROR"
        Write-Host (Get-Translation "System_Error") -ForegroundColor Red
    }
    Write-Host "==========================" -ForegroundColor Cyan
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 2. Clear Junk Files
# ---------------------------
function Clear-JunkFiles {
    Write-Log (Get-Translation 'Clean_Title') "INFO"
    Write-Host "`n=== $(Get-Translation 'Clean_Title') ===" -ForegroundColor Cyan
    Write-Host (Get-Translation 'Clean_Warning') -ForegroundColor Yellow

    $chromeProfilePath = Join-Path $env:LOCALAPPDATA 'Google\Chrome\User Data\Default'
    if (Test-Path $chromeProfilePath) {
        $confirmChrome = Read-Host "`n$( (Get-Translation 'Chrome_Confirm') ) $( (Get-Translation 'YesNoPrompt') )"
        if (($global:Language -eq "ID" -and $confirmChrome -match '^(Y|y)$') -or ($global:Language -eq "EN" -and $confirmChrome -match '^(Y|y)$')) {
            Invoke-ChromeCleanup -ProfilePath $chromeProfilePath
        }
    }

    $pathsToClean = @(
        "$env:SystemRoot\Temp",
        "$env:TEMP",
        "$env:SystemRoot\Prefetch" # FIX 1: Menambahkan folder Prefetch
    )

    Write-Host "`n$( (Get-Translation 'Clean_Calculating') )" -ForegroundColor Gray
    
    $totalFreed = 0
    Write-Progress -Activity (Get-Translation 'Clean_Title') -Status (Get-Translation 'Clean_Status')

    foreach ($folderPath in $pathsToClean) {
        if (-not (Test-Path $folderPath)) { continue }
        
        # FIX 2: Memperbaiki typo dari -Recourse menjadi -Recurse
        $items = Get-ChildItem -Path $folderPath -Recurse -Force -ErrorAction SilentlyContinue
        
        foreach ($item in $items) {
            try {
                $itemSize = if ($item.PSIsContainer) { 0 } else { $item.Length }
                
                Remove-Item -Path $item.FullName -Recurse -Force -ErrorAction Stop
                $totalFreed += $itemSize
            } catch {
                $errMsg = (Get-Translation 'Clean_ErrorDelete') -f $item.Name, $_.Exception.Message
                Write-Warning $errMsg; Write-Log $errMsg "WARNING"
            }
        }
    }
    Write-Progress -Activity (Get-Translation 'Clean_Title') -Completed

    $cleanedSizeMB = [math]::Round($totalFreed / 1MB, 2)
    $message = (Get-Translation 'Clean_SpaceFreed') -f $cleanedSizeMB
    Write-Log $message "SUCCESS"
    Write-Host "`n$message" -ForegroundColor Green
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

function Invoke-ChromeCleanup {
    param([string]$ProfilePath)
    Write-Host "`n$(Get-Translation 'Chrome_Closing')" -ForegroundColor Yellow
    Stop-Process -Name "chrome" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    Write-Host (Get-Translation 'Chrome_Cleaning') -ForegroundColor Gray
    $chromePaths = @(
        Join-Path $ProfilePath 'Cache\*', Join-Path $ProfilePath 'Code Cache\*', Join-Path $ProfilePath 'GPUCache\*',
        Join-Path $ProfilePath 'Session Storage\*', Join-Path $ProfilePath 'Service Worker\CacheStorage\*',
        Join-Path $ProfilePath 'History', Join-Path $ProfilePath 'Web Data'
    )
    foreach ($path in $chromePaths) {
        if (Test-Path $path) {
            try { Remove-Item $path -Recurse -Force -ErrorAction Stop }
            catch { $errMsg = (Get-Translation 'Clean_ErrorDelete') -f $path, $_.Exception.Message; Write-Warning $errMsg; Write-Log $errMsg "WARNING" }
        }
    }
    Write-Host (Get-Translation 'Chrome_Done') -ForegroundColor Green
    Write-Log "Chrome cleanup performed." "SUCCESS"
}

# ---------------------------
# 3. Clear Recycle Bin
# ---------------------------
function Clear-RecycleBin-Menu {
    Write-Host "`n=== $(Get-Translation 'Recycle_Title') ===" -ForegroundColor Red
    $confirm = Read-Host "$(Get-Translation 'Recycle_Confirm') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -match '^(Y|y)$') -or ($global:Language -eq "EN" -and $confirm -match '^(Y|y)$')) {
        try {
            $drives = Get-PSDrive -PSProvider FileSystem | Select-Object -ExpandProperty Name
            $isEmpty = $true
            foreach ($drive in $drives) {
                $recycleBinPath = "$($drive):\`$Recycle.Bin"
                if (Test-Path $recycleBinPath) {
                    $isEmpty = $false
                    Write-Host "Emptying Recycle Bin on drive $($drive):..." -ForegroundColor Gray
                    Remove-Item -Path $recycleBinPath -Recurse -Force -ErrorAction Stop
                }
            }
            if ($isEmpty) { Write-Host (Get-Translation 'Recycle_AlreadyEmpty') -ForegroundColor Yellow }
            else { Write-Host (Get-Translation 'Recycle_Success') -ForegroundColor Green; Write-Log "All Recycle Bins emptied successfully." "SUCCESS" }
        } catch {
            $errorMsg = "Failed to empty recycle bin: $($_.Exception.Message)"
            Write-Log $errorMsg "ERROR"; Write-Host $errorMsg -ForegroundColor Red
        }
    } else { Write-Host (Get-Translation 'Cancel') -ForegroundColor Yellow }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 4. Open Disk Cleanup
# ---------------------------
function Open-DiskCleanup {
    Write-Host "`nOpening Windows Disk Cleanup utility..." -ForegroundColor Cyan
    try { Start-Process -FilePath "cleanmgr.exe" -ErrorAction Stop; Write-Log "Launched cleanmgr.exe" "INFO" }
    catch { $errorMsg = "Failed to open Disk Cleanup: $($_.Exception.Message)"; Write-Log $errorMsg "ERROR"; Write-Host $errorMsg -ForegroundColor Red; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
}

# ---------------------------
# 5. Network Utilities
# ---------------------------
function Show-NetworkMenu {
    do {
        Clear-Host
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "        $(Get-Translation 'SubMenu_Network')" -ForegroundColor Cyan
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "1. $(Get-Translation 'SubMenu_Network1')"; Write-Host "2. $(Get-Translation 'SubMenu_Network2')"; Write-Host "3. $(Get-Translation 'SubMenu_Network3')"
        Write-Host "=========================================" -ForegroundColor Green
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { Invoke-NetworkRepair; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "2" { Set-InternetAcceleration; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "3" { return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red; Start-Sleep -Seconds 2 }
        }
    } while ($true)
}

function Invoke-NetworkRepair {
    Write-Log "Repairing network connections..." "INFO"; Write-Host (Get-Translation 'Network_Repairing') -ForegroundColor Yellow
    try {
        netsh int ip reset | Out-Null; netsh winsock reset | Out-Null; ipconfig /flushdns | Out-Null
        Write-Log "Network repair completed." "SUCCESS"; Write-Host (Get-Translation 'Network_Repaired') -ForegroundColor Green
    } catch { $errorMsg = (Get-Translation 'Network_ErrorRepair') -f $_.Exception.Message; Write-Log $errorMsg "ERROR"; Write-Host $errorMsg -ForegroundColor Red }
}

function Set-InternetAcceleration {
    Write-Host "This feature will optimize your connection by changing the DNS server." -ForegroundColor Yellow
    try {
        $activeAdapters = Get-NetAdapter -ErrorAction Stop | Where-Object { $_.Status -eq 'Up' -and (Get-NetIPConfiguration -InterfaceAlias $_.Name -ErrorAction SilentlyContinue).IPv4DefaultGateway }
        if (-not $activeAdapters) { Write-Host "No active network adapter with a gateway found." -ForegroundColor Red; return }
        Write-Host "`nPlease select the network adapter to configure:" -ForegroundColor Cyan
        for($i=0; $i -lt $activeAdapters.Count; $i++) { Write-Host "[$($i+1)] $($activeAdapters[$i].Name) - $($activeAdapters[$i].InterfaceDescription)" }
        Write-Host "[C] Cancel" -ForegroundColor Yellow
        $adapterChoice = Read-Host "Select adapter"
        if ($adapterChoice -match 'c' -or ![int]::TryParse($adapterChoice, [ref]$null) -or [int]$adapterChoice -lt 1 -or [int]$adapterChoice -gt $activeAdapters.Count) { Write-Host (Get-Translation 'Cancel') -ForegroundColor Yellow; return }
        $adapterToChange = $activeAdapters[[int]$adapterChoice - 1]
    } catch { $errorMsg = "FAILED to find network adapters. Error: $($_.Exception.Message)"; Write-Host $errorMsg -ForegroundColor Red; Write-Log $errorMsg "ERROR"; return }
    Write-Host "`nSelect DNS Provider for '$($adapterToChange.Name)':" -ForegroundColor Yellow
    Write-Host "1. Google (8.8.8.8)"; Write-Host "2. Cloudflare (1.1.1.1)"; Write-Host "3. Automatic (DHCP)"; Write-Host "4. Cancel" -ForegroundColor Cyan
    $dnsServers = $null; $dnsChoice = Read-Host "`nSelect Optimization Option"
    switch($dnsChoice) {
        "1" { $dnsServers = @("8.8.8.8", "8.8.4.4") }
        "2" { $dnsServers = @("1.1.1.1", "1.0.0.1") }
        "3" { $dnsServers = @() }
        "4" { Write-Host (Get-Translation 'Cancel') -ForegroundColor Yellow; return }
        default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red; return }
    }
    try {
        Write-Host "Changing DNS for adapter: $($adapterToChange.Name)..." -ForegroundColor Green
        if ($dnsServers.Count -gt 0) { $adapterToChange | Set-DnsClientServerAddress -ServerAddresses $dnsServers -ErrorAction Stop }
        else { $adapterToChange | Set-DnsClientServerAddress -ResetServerAddresses -ErrorAction Stop }
        Write-Host "DNS settings changed successfully. Flushing DNS cache..." -ForegroundColor Green
        ipconfig /flushdns | Out-Null; Write-Host "Done." -ForegroundColor Green
        $dnsLog = if ($dnsServers.Count -gt 0) { $dnsServers -join ', ' } else { "Automatic (DHCP)" }; Write-Log "DNS updated for adapter $($adapterToChange.Name) to $dnsLog" "SUCCESS"
    } catch { $errorMsg = "FAILED to change DNS settings. Error: $($_.Exception.Message)"; Write-Host $errorMsg -ForegroundColor Red; Write-Log $errorMsg "ERROR" }
}

# ---------------------------
# 6. Clear RAM
# ---------------------------
function Clear-RAM {
    Write-Host "`n=== $(Get-Translation 'Menu_Option6') ===" -ForegroundColor Cyan
    $confirm = Read-Host "$(Get-Translation 'RAM_Confirm') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -notmatch '^(Y|y)$') -and ($global:Language -eq "EN" -and $confirm -notmatch '^(Y|y)$')) { Write-Host (Get-Translation 'RAM_Cancel') -ForegroundColor Yellow; Read-Host "`n$(Get-Translation 'PressAnyKey')"; return }
    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem; $memBefore = [math]::Round($os.FreePhysicalMemory / 1024)
        Write-Host ((Get-Translation 'RAM_Before') -f $memBefore) -ForegroundColor Gray
        [System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers(); Start-Sleep -Seconds 1
        $memAfter = [math]::Round((Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory / 1024)
        Write-Host ((Get-Translation 'RAM_After') -f $memAfter) -ForegroundColor Gray
        $memFreed = $memAfter - $memBefore
        if ($memFreed -gt 5) { $message = (Get-Translation 'RAM_Freed') -f $memFreed; Write-Log "$message" "SUCCESS"; Write-Host $message -ForegroundColor Green }
        else { Write-Host "Memory is already optimized." -ForegroundColor Green }
    } catch { $errorMsg = (Get-Translation 'RAM_Error') -f $_.Exception.Message; Write-Log $errorMsg "ERROR"; Write-Host $errorMsg -ForegroundColor Red }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 7. Open Windows Security
# ---------------------------
function Open-WindowsSecurity {
    Write-Host "`nOpening Windows Security dashboard..." -ForegroundColor Cyan
    try { Start-Process "windowsdefender:" -ErrorAction Stop; Write-Log "Launched Windows Security (windowsdefender:)" "INFO" }
    catch { $errorMsg = "Failed to open Windows Security: $($_.Exception.Message)"; Write-Log $errorMsg "ERROR"; Write-Host $errorMsg -ForegroundColor Red; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
}

# ---------------------------
# 8. Defragment & Optimize Drives
# ---------------------------
function Invoke-Defragment {
    Write-Host "`n=== $(Get-Translation 'Defrag_Title') ===" -ForegroundColor Cyan
    try {
        $volumes = Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' -and $_.DriveLetter } | Sort-Object DriveLetter
        if (-not $volumes) { Write-Host "No fixed drives found to optimize." -ForegroundColor Red; return }
        Write-Host "`n$(Get-Translation 'Defrag_Select')" -ForegroundColor Cyan
        for ($i=0; $i -lt $volumes.Count; $i++) { $vol = $volumes[$i]; $label = if ($vol.FileSystemLabel) { $vol.FileSystemLabel } else { "No Label" }; Write-Host "[$($i+1)] $($vol.DriveLetter): ($label) - $($vol.FileSystem)" }
        Write-Host "[C] Cancel" -ForegroundColor Yellow
        $choice = Read-Host "Select drive"
        if ($choice -match 'c' -or ![int]::TryParse($choice, [ref]$null) -or [int]$choice -lt 1 -or [int]$choice -gt $volumes.Count) { Write-Host (Get-Translation 'Cancel') -ForegroundColor Yellow; return }
        $selectedVolume = $volumes[[int]$choice - 1]
        $driveLetter = $selectedVolume.DriveLetter
        
        # BUG FIX: Automatically cancel if SSD
        $diskNumber = (Get-Partition -DriveLetter $selectedVolume.DriveLetter).DiskNumber
        $mediaType = (Get-PhysicalDisk -DeviceNumber $diskNumber).MediaType
        if ($mediaType -eq "SSD") {
            Write-Host "`n$(Get-Translation 'Defrag_SSD_Cancel')" -ForegroundColor Yellow
            Write-Log "Defragmentation cancelled for SSD drive $driveLetter." "INFO"
            Read-Host "`n$(Get-Translation 'PressAnyKey')"
            return
        }
        
        $mediaTypeDisplay = Get-Translation 'Defrag_Type_HDD'
        Write-Host "`n$( (Get-Translation 'Defrag_Analyzing') -f $driveLetter, $mediaTypeDisplay )" -ForegroundColor Gray
        Optimize-Volume -DriveLetter $driveLetter -Analyze -Verbose
        $confirmationMessage = (Get-Translation 'Defrag_Optimizing') -f $driveLetter, $mediaTypeDisplay
        Write-Host "`n$confirmationMessage" -ForegroundColor Yellow
        Optimize-Volume -DriveLetter $driveLetter -Verbose
        Write-Host "`n$( (Get-Translation 'Defrag_Complete') -f $driveLetter )" -ForegroundColor Green
    } catch { $errorMsg = "An error occurred during optimization: $($_.Exception.Message)"; Write-Log $errorMsg "ERROR"; Write-Host $errorMsg -ForegroundColor Red }
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 9. System Health Checker
# ---------------------------
function Show-SystemHealthMenu {
    do {
        Clear-Host
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "        $(Get-Translation 'SubMenu_Health')" -ForegroundColor Cyan
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "1. $(Get-Translation 'SubMenu_Health1')"; Write-Host "2. $(Get-Translation 'SubMenu_Health2')"; Write-Host "3. $(Get-Translation 'SubMenu_Health3')"
        Write-Host "=========================================" -ForegroundColor Green
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { Invoke-SFCScan; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "2" { Invoke-DISMRepair; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "3" { return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red; Start-Sleep -Seconds 2 }
        }
    } while ($true)
}

function Invoke-SFCScan {
    $confirm = Read-Host "`n$(Get-Translation 'Health_Warning') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -notmatch '^(Y|y)$') -and ($global:Language -eq "EN" -and $confirm -notmatch '^(Y|y)$')) { return }
    Write-Host "`n$(Get-Translation 'Health_SFC_Running')" -ForegroundColor Yellow
    try {
        $process = Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -PassThru -NoNewWindow
        if ($process.ExitCode -eq 0) { Write-Host "`n$(Get-Translation 'Health_SFC_Done')" -ForegroundColor Green; Write-Log "SFC Scan completed successfully." "SUCCESS" }
        else { $errorMsg = (Get-Translation 'Health_SFC_Error') -f "$($process.ExitCode)"; Write-Log "SFC.exe tool reported an error." "ERROR"; Write-Host "`n$errorMsg" -ForegroundColor Red }
    } catch { Write-Log "Failed to start sfc.exe: $($_.Exception.Message)" "ERROR" }
}

function Invoke-DISMRepair {
    $confirm = Read-Host "`n$(Get-Translation 'Health_Warning') $(Get-Translation 'YesNoPrompt')"
    if (($global:Language -eq "ID" -and $confirm -notmatch '^(Y|y)$') -and ($global:Language -eq "EN" -and $confirm -notmatch '^(Y|y)$')) { return }
    Write-Host "`n$(Get-Translation 'Health_DISM_Running')" -ForegroundColor Yellow
    try {
        $process = Start-Process -FilePath "dism.exe" -ArgumentList "/online", "/cleanup-image", "/restorehealth" -Wait -PassThru -NoNewWindow
        if ($process.ExitCode -eq 0) { Write-Host "`n$(Get-Translation 'Health_DISM_Done')" -ForegroundColor Green; Write-Log "DISM repair completed successfully." "SUCCESS" }
        else { $errorMsg = (Get-Translation 'Health_DISM_Error') -f "$($process.ExitCode)"; Write-Log "DISM.exe tool reported an error." "ERROR"; Write-Host "`n$errorMsg" -ForegroundColor Red }
    } catch { Write-Log "Failed to start dism.exe: $($_.Exception.Message)" "ERROR" }
}

# ---------------------------
# 10. Startup Manager
# ---------------------------
function Show-StartupManager {
    do {
        Clear-Host
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "        $(Get-Translation 'SubMenu_Startup')" -ForegroundColor Cyan
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "1. $(Get-Translation 'SubMenu_Startup1')"; Write-Host "2. $(Get-Translation 'SubMenu_Startup2')"; Write-Host "3. $(Get-Translation 'SubMenu_Startup3')"
        Write-Host "=========================================" -ForegroundColor Green
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { Set-StartupProgram -Action Disable; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "2" { Set-StartupProgram -Action Enable; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "3" { return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red; Start-Sleep -Seconds 2 }
        }
    } while ($true)
}

function Set-StartupProgram {
    param([ValidateSet("Disable", "Enable")][string]$Action)
    $backupFile = Join-Path -Path $PSScriptRoot -ChildPath "StartupBackup.json"
    if ($Action -eq "Disable") {
        Write-Host "`n=== $(Get-Translation 'SubMenu_Startup1') ===" -ForegroundColor Cyan
        try {
            $startupItems = Get-CimInstance -ClassName Win32_StartupCommand | Select-Object @{N="Name";E={$_.Name}}, Command, Location, User | Sort-Object Name
            if (-not $startupItems) { Write-Host (Get-Translation 'Startup_None') -ForegroundColor Yellow; return }
            Write-Host (Get-Translation 'Startup_List') -ForegroundColor Yellow
            for ($i = 0; $i -lt $startupItems.Count; $i++) { Write-Host ("[{0}] {1} ({2})" -f ($i+1), $startupItems[$i].Name, $startupItems[$i].Location) -ForegroundColor Gray }
            $itemChoice = Read-Host "`nEnter number to disable (or press Enter to cancel)"
            if ([string]::IsNullOrWhiteSpace($itemChoice)) { Write-Host (Get-Translation 'Cancel'); return }
            if ($itemChoice -match '^\d+$' -and [int]$itemChoice -ge 1 -and [int]$itemChoice -le $startupItems.Count) {
                $selectedItem = $startupItems[[int]$itemChoice - 1]
                if ($selectedItem.Location -notlike "*Registry*") { Write-Host "Cannot disable non-registry startup item '$($selectedItem.Name)'." -ForegroundColor Yellow; return }
                $regPath = if ($selectedItem.User -eq "All Users") { "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" } else { "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" }
                $existingBackup = if (Test-Path $backupFile) { (Get-Content $backupFile -Raw | ConvertFrom-Json) } else { @() }
                $existingBackup += [pscustomobject]@{ Name = $selectedItem.Name; Command = $selectedItem.Command; Path = $regPath }
                $existingBackup | ConvertTo-Json | Set-Content $backupFile -Encoding UTF8
                Remove-ItemProperty -Path $regPath -Name $selectedItem.Name -Force -ErrorAction Stop
                Write-Log "Disabled startup item: $($selectedItem.Name)" "INFO"; Write-Host ((Get-Translation 'Startup_Disabled') -f $selectedItem.Name) -ForegroundColor Green
            } else { Write-Host "Invalid selection." -ForegroundColor Red }
        } catch { $errorMsg = (Get-Translation 'Startup_Error') -f $_.Exception.Message; Write-Log $errorMsg "ERROR" }
    } elseif ($Action -eq "Enable") {
        Write-Host "`n=== $(Get-Translation 'SubMenu_Startup2') ===" -ForegroundColor Cyan
        if (-not (Test-Path $backupFile)) { Write-Host "No backup of disabled startup items found." -ForegroundColor Yellow; return }
        $backupItems = Get-Content $backupFile -Raw | ConvertFrom-Json
        if (-not $backupItems) { Write-Host "No items to restore." -ForegroundColor Yellow; return }
        Write-Host "Disabled Startup Programs (available to enable):" -ForegroundColor Yellow
        for ($i = 0; $i -lt $backupItems.Count; $i++) { Write-Host ("[{0}] {1}" -f ($i+1), $backupItems[$i].Name) -ForegroundColor Gray }
        $itemChoice = Read-Host "`nEnter number to enable (or 'all', or Enter to cancel)"
        if ([string]::IsNullOrWhiteSpace($itemChoice)) { Write-Host (Get-Translation 'Cancel'); return }
        $itemsToRestore = @()
        if ($itemChoice -eq 'all') { $itemsToRestore = $backupItems } 
        elseif ($itemChoice -match '^\d+$' -and [int]$itemChoice -ge 1 -and [int]$itemChoice -le $backupItems.Count) { $itemsToRestore += $backupItems[[int]$itemChoice - 1] } 
        else { Write-Host "Invalid selection." -ForegroundColor Red; return }
        $remainingItems = $backupItems | Where-Object { $_ -notin $itemsToRestore }
        foreach ($item in $itemsToRestore) {
            try {
                if (-not (Test-Path $item.Path)) { New-Item -Path $item.Path -Force | Out-Null }
                Set-ItemProperty -Path $item.Path -Name $item.Name -Value $item.Command -ErrorAction Stop
                Write-Log "Enabled startup item: $($item.Name)" "INFO"; Write-Host ((Get-Translation 'Startup_Enabled') -f $item.Name) -ForegroundColor Green
            } catch { Write-Host "Failed to enable $($item.Name): $($_.Exception.Message)" -ForegroundColor Red; Write-Log "Failed to enable startup item $($item.Name): $($_.Exception.Message)" "ERROR" }
        }
        if ($remainingItems.Count -gt 0) { $remainingItems | ConvertTo-Json | Set-Content $backupFile -Encoding UTF8 } 
        else { Remove-Item $backupFile -Force -ErrorAction SilentlyContinue }
    }
}

# ---------------------------
# 11. Language Settings
# ---------------------------
function Show-LanguageMenu {
    Clear-Host
    Write-Host "=========================================" -ForegroundColor Green
    Write-Host "         $(Get-Translation 'LanguageMenu')" -ForegroundColor Cyan
    Write-Host "=========================================" -ForegroundColor Green
    Write-Host "1. $(Get-Translation 'LanguageMenu1')"; Write-Host "2. $(Get-Translation 'LanguageMenu2')"; Write-Host "3. $(Get-Translation 'LanguageMenu3')"
    Write-Host "=========================================" -ForegroundColor Green
    do {
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { $global:Language = "EN"; Write-Host "Language changed to English." -ForegroundColor Green; Start-Sleep -Seconds 1; return }
            "2" { $global:Language = "ID"; Write-Host "Bahasa diubah ke Indonesia." -ForegroundColor Green; Start-Sleep -Seconds 1; return }
            "3" { return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red }
        }
    } while ($true)
}

# ---------------------------
# Main Menu
# ---------------------------
function Show-MainMenu {
    Clear-Host
    Write-Host "=========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "           _ __   ___ _____  _____ " -ForegroundColor Cyan
    Write-Host "          | '_ \ / __/ _ \ \/ / __|" -ForegroundColor Cyan
    Write-Host "          | | | | (_|  __/>  <\__ \ " -ForegroundColor Cyan
    Write-Host "          |_| |_|\___\___/_/\_\___/" -ForegroundColor Cyan
    Write-Host ""
    Write-Host ("          {0}" -f (Get-Translation 'Menu_Title')) -ForegroundColor Yellow
    Write-Host ""
    Write-Host "=========================================" -ForegroundColor Green
    Write-Host ("1. {0}" -f (Get-Translation 'Menu_Option1'))
    Write-Host ("2. {0}" -f (Get-Translation 'Menu_Option2'))
    Write-Host ("3. {0}" -f (Get-Translation 'Menu_Option3'))
    Write-Host ("4. {0}" -f (Get-Translation 'Menu_Option4'))
    Write-Host ("5. {0}" -f (Get-Translation 'Menu_Option5'))
    Write-Host ("6. {0}" -f (Get-Translation 'Menu_Option6'))
    Write-Host ("7. {0}" -f (Get-Translation 'Menu_Option7')) -ForegroundColor Yellow
    Write-Host ("8. {0}" -f (Get-Translation 'Menu_Option8')) -ForegroundColor Yellow
    Write-Host ("9. {0}" -f (Get-Translation 'Menu_Option9'))
    Write-Host ("10. {0}" -f (Get-Translation 'Menu_Option10'))
    Write-Host ("11. {0}" -f (Get-Translation 'Menu_Option11'))
    Write-Host ("12. {0}" -f (Get-Translation 'Menu_Option12')) -ForegroundColor Red
    Write-Host "=========================================" -ForegroundColor Green
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
        "5"  { Show-NetworkMenu }
        "6"  { Clear-RAM }
        "7"  { Open-WindowsSecurity }
        "8"  { Invoke-Defragment }
        "9"  { Show-SystemHealthMenu }
        "10" { Show-StartupManager }
        "11" { Show-LanguageMenu }
        "12" {
            Write-Log "Toolkit session completed." "INFO"
            Write-Host (Get-Translation 'ExitMessage') -ForegroundColor Green
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($true)