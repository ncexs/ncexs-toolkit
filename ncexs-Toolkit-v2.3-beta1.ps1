<#
===============================================
 ncexs Toolkit v2.3
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
$global:ToolkitVersion = "2.3 beta1"
$global:Language = "ID"  # default

# Standardized translation structure
$global:Translations = @{
    "EN" = @{
        "Menu_Title" = ("ncexs Toolkit v{0}" -f $global:ToolkitVersion)
        "Menu_Option1" = "System Information"
        "Menu_Option2" = "Junk Cleaner"
        "Menu_Option3" = "Empty Recycle Bin"
        "Menu_Option4" = "Deep Cleanup"
        "Menu_Option5" = "Network Utilities"
        "Menu_Option6" = "Memory Optimizer"
        "Menu_Option7" = "Antivirus Scan"
        "Menu_Option8" = "System Health Checker"
        "Menu_Option9" = "Startup Manager"
        "Menu_Option10" = "Language Settings"
        "Menu_Option11" = "Exit"
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
        "Health_Warning" = "This process can take a long time and may require an internet connection. Do you want to continue?"
        "Health_SFC_Running" = "Running System File Checker (sfc /scannow)... Please wait."
        "Health_SFC_Done" = "SFC scan completed successfully."
        "Health_SFC_Error" = "SFC scan failed with exit code: {0}. This indicates a Windows System issue."
        "Health_DISM_Running" = "Running DISM image repair (DISM /Online /Cleanup-Image /RestoreHealth)... Please wait."
        "Health_DISM_Done" = "DISM image repair completed successfully."
        "Health_DISM_Error" = "DISM repair failed with exit code: {0}. This indicates a Windows System issue."
        "Clean_Calculating" = "Calculating space to be freed..."
        "Clean_SpaceFreed" = "Cleanup complete. Freed approximately {0} MB of space."
        "RAM_Confirm" = "This will run to free up memory used by background processes. The effect may be minimal. Continue?"
        "RAM_Before" = "Available Memory (Before): {0} MB"
        "RAM_After" = "Available Memory (After): {0} MB"
        "RAM_Freed" = "Successfully freed {0} MB of memory."
        "RAM_Cancel" = "Memory optimization cancelled."
        "Antivirus_Title" = "ANTIVIRUS SCAN"
        "Antivirus_NoDefender" = "Windows Defender is not available. Using alternative scan method."
        "Antivirus_Scanning" = "Scanning for malware... This may take several minutes."
        "Antivirus_Complete" = "Virus scan completed."
        "Antivirus_Found" = "Malware detected! Scan completed with findings."
        "Antivirus_NotFound" = "No malware detected."
        "Antivirus_Error" = "Error running antivirus scan: {0}"
        "Recycle_Title" = "RECYCLE BIN CLEANUP"
        "Recycle_Confirm" = "Are you sure you want to empty the Recycle Bin?"
        "Recycle_Success" = "Recycle Bin emptied successfully."
        "Recycle_AlreadyEmpty" = "Recycle Bin is already empty."
        "Deep_Title" = "DEEP CLEAN (ADVANCED)"
        "Deep_Warning" = "WARNING: This feature will remove deeper junk files. Use with caution."
        "Deep_Confirm" = "Do you want to continue with deep clean?"
        "Deep_Done" = "Deep clean completed."
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
        "Clean_ErrorDelete" = "Error deleting {0}: {1}"
        "Clean_Status" = "Cleaning in progress..."
        "RAM_Error" = "Error clearing memory: {0}"
    }
    "ID" = @{
        "Menu_Title" = ("ncexs Toolkit v{0}" -f $global:ToolkitVersion)
        "Menu_Option1" = "Informasi Sistem"
        "Menu_Option2" = "Pembersih Sampah"
        "Menu_Option3" = "Kosongkan Recycle Bin"
        "Menu_Option4" = "Pembersihan Mendalam"
        "Menu_Option5" = "Utilitas Jaringan"
        "Menu_Option6" = "Optimasi Memori"
        "Menu_Option7" = "Pemindaian Antivirus"
        "Menu_Option8" = "Pemeriksa Kesehatan Sistem"
        "Menu_Option9" = "Pengelola Startup"
        "Menu_Option10" = "Pengaturan Bahasa"
        "Menu_Option11" = "Keluar"
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
        "Health_Warning" = "Proses ini bisa memakan waktu lama dan mungkin butuh koneksi internet. Apakah Anda ingin melanjutkan?"
        "Health_SFC_Running" = "Menjalankan Pemeriksa Berkas Sistem (sfc /scannow)... Harap tunggu."
        "Health_SFC_Done" = "Pemindaian SFC selesai dengan sukses."
        "Health_SFC_Error" = "Pemindaian SFC gagal dengan kode keluar: {0}. Ini menandakan ada masalah pada sistem Windows."
        "Health_DISM_Running" = "Menjalankan perbaikan image DISM (DISM /Online /Cleanup-Image /RestoreHealth)... Harap tunggu."
        "Health_DISM_Done" = "Perbaikan image DISM selesai dengan sukses."
        "Health_DISM_Error" = "Perbaikan DISM gagal dengan kode keluar: {0}. Ini menandakan ada masalah pada sistem Windows."
        "Clean_Calculating" = "Menghitung ruang yang akan dibersihkan..."
        "Clean_SpaceFreed" = "Pembersihan selesai. Berhasil membebaskan sekitar {0} MB ruang."
        "RAM_Confirm" = "Ini akan membebaskan memori yang dipakai proses latar belakang. Efeknya mungkin minimal. Lanjutkan?"
        "RAM_Before" = "Memori Tersedia (Sebelum): {0} MB"
        "RAM_After" = "Memori Tersedia (Setelah): {0} MB"
        "RAM_Freed" = "Berhasil membebaskan {0} MB memori."
        "RAM_Cancel" = "Optimasi memori dibatalkan."
        "Antivirus_Title" = "PEMINDAIAN ANTIVIRUS"
        "Antivirus_NoDefender" = "Windows Defender tidak tersedia. Menggunakan metode pemindaian alternatif."
        "Antivirus_Scanning" = "Memindai malware... Ini mungkin memakan waktu beberapa menit."
        "Antivirus_Complete" = "Pemindaian virus selesai."
        "Antivirus_Found" = "Malware terdeteksi! Pemindaian selesai dengan temuan."
        "Antivirus_NotFound" = "Tidak ada malware yang terdeteksi."
        "Antivirus_Error" = "Kesalahan menjalankan pemindaian antivirus: {0}"
        "Recycle_Title" = "PEMBERSIHAN RECYCLE BIN"
        "Recycle_Confirm" = "Apakah Anda yakin ingin mengosongkan Recycle Bin?"
        "Recycle_Success" = "Recycle Bin berhasil dikosongkan."
        "Recycle_AlreadyEmpty" = "Recycle Bin sudah kosong."
        "Deep_Title" = "PENGHAPUSAN MENDALAM (DEEP CLEAN)"
        "Deep_Warning" = "PERINGATAN: Fitur ini akan menghapus file sampah lebih dalam. Gunakan dengan hati-hati."
        "Deep_Confirm" = "Apakah Anda ingin melanjutkan deep clean?"
        "Deep_Done" = "Deep clean selesai."
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
        "Clean_ErrorDelete" = "Kesalahan menghapus {0}: {1}"
        "Clean_Status" = "Pembersihan sedang berlangsung..."
        "RAM_Error" = "Kesalahan saat membersihkan memori: {0}"
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

    $pathsToClean = @(
        "$env:TEMP\*",
        "$env:SystemRoot\Temp\*",
        "$env:SystemRoot\Prefetch\*",
        "$env:APPDATA\Microsoft\Windows\Recent\*.lnk",
        "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache\*",
        "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache\*",
        "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Cache\*"
    )

    # Firefox cache
    $firefoxBasePath = Join-Path $env:APPDATA 'Mozilla\Firefox\Profiles\'
    if (Test-Path $firefoxBasePath) {
        $firefoxProfiles = Get-ChildItem $firefoxBasePath -Directory -ErrorAction SilentlyContinue
        if($firefoxProfiles) {
            foreach($firefoxProfile in $firefoxProfiles) {
                $pathsToClean += Join-Path $firefoxProfile.FullName "cache2\*"
            }
        }
    }

    Write-Host (Get-Translation 'Clean_Calculating') -ForegroundColor Yellow
    $totalSize = 0
    foreach ($path in $pathsToClean) {
        $parentPath = Split-Path -Path $path -Parent
        if (Test-Path $parentPath) {
            try {
                $files = Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue # Changed to SilentlyContinue
                if ($files) {
                    $size = ($files | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue).Sum
                    $totalSize += $size
                }
            } catch {
                $errMsg = (Get-Translation 'Clean_ErrorCalc') -f $path, $_.Exception.Message
                Write-Warning $errMsg
            }
        }
    }
    
    Write-Progress -Activity (Get-Translation 'Clean_Title') -Status (Get-Translation 'Clean_Status')
    foreach ($path in $pathsToClean) {
        try {
            $parentPath = Split-Path -Path $path -Parent
            if(Test-Path $parentPath) {
                Remove-Item -Path $path -Recurse -Force -ErrorAction Stop
            }
        } catch {
            $errMsg = (Get-Translation 'Clean_ErrorDelete') -f $path, $_.Exception.Message
            Write-Warning $errMsg
        }
    }
    Write-Progress -Activity (Get-Translation 'Clean_Title') -Completed

    $cleanedSizeMB = [math]::Round($totalSize / 1MB, 2)
    $message = (Get-Translation 'Clean_SpaceFreed') -f $cleanedSizeMB
    Write-Log $message "SUCCESS"
    Write-Host "`n$message" -ForegroundColor Green
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 3. Clear Recycle Bin
# ---------------------------
function Clear-RecycleBin-Menu {
    Write-Host "`n=== $(Get-Translation 'Recycle_Title') ===" -ForegroundColor Red
    $confirm = Read-Host "$(Get-Translation 'Recycle_Confirm') $(Get-Translation 'YesNoPrompt')"

    if ($confirm -match '^(Y|y|YA|ya)$') {
        try {
            if ((Get-ChildItem 'Recycle:\' -Force -ErrorAction SilentlyContinue).Count -gt 0) {
                Clear-RecycleBin -Force -ErrorAction Stop
                Write-Host (Get-Translation 'Recycle_Success') -ForegroundColor Green
            } else {
                Write-Host (Get-Translation 'Recycle_AlreadyEmpty') -ForegroundColor Yellow
            }
        } catch {
            Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
        }
    } else {
        Write-Host (Get-Translation 'Cancel') -ForegroundColor Yellow
    }

    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 4. Deep Clean
# ---------------------------
function Invoke-DeepClean {
    Write-Host "`n=== $(Get-Translation 'Deep_Title') ===" -ForegroundColor Cyan
    Write-Host (Get-Translation 'Deep_Warning') -ForegroundColor Yellow
    $confirm = Read-Host "`n$(Get-Translation 'Deep_Confirm') $(Get-Translation 'YesNoPrompt')"
    
    if ($confirm -notmatch '^(Y|y|YA|ya)$') {
        Write-Host (Get-Translation 'Cancel') -ForegroundColor Yellow
        Read-Host "`n$(Get-Translation 'PressAnyKey')"
        return
    }

    # Clear Basic Junk first (optional, but good practice)
    # Clear-JunkFiles # You can uncomment this if you want it to be automatic

    # Windows Update Cache
    Write-Host "Cleaning Windows Update cache..." -ForegroundColor Gray
    try {
        Stop-Service -Name wuauserv -Force -ErrorAction SilentlyContinue
        Remove-Item -Path (Join-Path $env:SystemRoot 'SoftwareDistribution\Download\*') -Recurse -Force -ErrorAction Stop
        Start-Service -Name wuauserv -ErrorAction SilentlyContinue
    } catch {
        Write-Warning "Failed to clean Windows Update cache. Error: $($_.Exception.Message)"
    }

    # Delivery Optimization Files
    Write-Host "Cleaning Delivery Optimization cache..." -ForegroundColor Gray
    try {
        Remove-Item -Path (Join-Path $env:SystemRoot 'SoftwareDistribution\DeliveryOptimization\*') -Recurse -Force -ErrorAction Stop
    } catch {
        Write-Warning "Failed to clean Delivery Optimization cache. Error: $($_.Exception.Message)"
    }

    # Thumbnail Cache
    Write-Host "Cleaning Thumbnail cache..." -ForegroundColor Gray
    try {
        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1
        Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*" -Force -ErrorAction SilentlyContinue
        Start-Process explorer
    } catch {
        Write-Warning "Failed to clean Thumbnail cache. Error: $($_.Exception.Message)"
    }

    # Memory Dump & Minidump Files
    Write-Host "Cleaning Memory dump files..." -ForegroundColor Gray
    try {
        Remove-Item "$env:SystemRoot\MEMORY.DMP" -Force -ErrorAction SilentlyContinue
        Remove-Item "$env:SystemRoot\Minidump\*" -Recurse -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Warning "Failed to clean dump files. Error: $($_.Exception.Message)"
    }

    # Old Temporary Internet Files
    Write-Host "Cleaning old Temporary Internet Files..." -ForegroundColor Gray
    try {
        Remove-Item "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    } catch {
        Write-Warning "Failed to clean old internet cache. Error: $($_.Exception.Message)"
    }

    Write-Host "`n$(Get-Translation 'Deep_Done')" -ForegroundColor Green
    Read-Host "`n$(Get-Translation 'PressAnyKey')"
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
        Write-Host "1. $(Get-Translation 'SubMenu_Network1')"
        Write-Host "2. $(Get-Translation 'SubMenu_Network2')"
        Write-Host "3. $(Get-Translation 'SubMenu_Network3')"
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
    Write-Log "Repairing network connections..." "INFO"
    Write-Host (Get-Translation 'Network_Repairing') -ForegroundColor Yellow

    try {
        netsh int ip reset | Out-Null
        netsh winsock reset | Out-Null
        ipconfig /flushdns | Out-Null

        Write-Log "Network repair completed." "SUCCESS"
        Write-Host (Get-Translation 'Network_Repaired') -ForegroundColor Green
    } catch {
        $errorMsg = (Get-Translation 'Network_ErrorRepair') -f $_.Exception.Message
        Write-Log $errorMsg "ERROR"
        Write-Host $errorMsg -ForegroundColor Red
    }
}

function Set-InternetAcceleration {
    Write-Host "This feature will optimize your connection by changing the DNS server." -ForegroundColor Yellow
    Write-Host "1. Set DNS to Google (8.8.8.8, 8.8.4.4)"
    Write-Host "2. Set DNS to Cloudflare (1.1.1.1, 1.0.0.1)"
    Write-Host "3. Revert to Automatic DNS (DHCP)"
    Write-Host "4. Cancel" -ForegroundColor Cyan
    
    $dnsServers = $null
    do {
        $choice = Read-Host "`nSelect Optimization Option"
        switch($choice) {
            "1" { $dnsServers = @("8.8.8.8", "8.8.4.4"); break }
            "2" { $dnsServers = @("1.1.1.1", "1.0.0.1"); break }
            "3" { $dnsServers = @(); break } # Empty array for automatic
            "4" { Write-Host (Get-Translation 'Cancel') -ForegroundColor Yellow; return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red }
        }
    } while ($null -eq $dnsServers) # FIXED: $null on the left side

    try {
        $activeAdapters = Get-NetAdapter -ErrorAction Stop | Where-Object {
            $_.Status -eq 'Up' -and (Get-NetIPConfiguration -InterfaceAlias $_.Name -ErrorAction SilentlyContinue).IPv4DefaultGateway
        }

        if (-not $activeAdapters) {
            Write-Host "No active network adapter with a gateway found. Connect to a network first." -ForegroundColor Red
            return
        }

        $adapterToChange = $activeAdapters | Select-Object -First 1
        Write-Host "Changing DNS for adapter: $($adapterToChange.Name)..." -ForegroundColor Green

        if ($dnsServers.Count -gt 0) {
            $adapterToChange | Set-DnsClientServerAddress -ServerAddresses $dnsServers -ErrorAction Stop
        } else {
            $adapterToChange | Set-DnsClientServerAddress -ResetServerAddresses -ErrorAction Stop
        }

        Write-Host "DNS settings changed successfully. Flushing DNS cache..." -ForegroundColor Green
        ipconfig /flushdns | Out-Null
        Write-Host "Done." -ForegroundColor Green
        $dnsLog = if ($dnsServers.Count -gt 0) { $dnsServers -join ', ' } else { "Automatic (DHCP)" }
        Write-Log "DNS updated for adapter $($adapterToChange.Name) to $dnsLog" "SUCCESS"
    } catch {
        $errorMsg = "FAILED to change DNS settings. Error: $($_.Exception.Message)"
        Write-Host $errorMsg -ForegroundColor Red
        Write-Log $errorMsg "ERROR"
    }
}

# ---------------------------
# 6. Clear RAM (Revised & Corrected)
# ---------------------------
function Clear-RAM {
    Write-Host "`n=== $(Get-Translation 'Menu_Option6') ===" -ForegroundColor Cyan

    $confirm = Read-Host "$(Get-Translation 'RAM_Confirm') $(Get-Translation 'YesNoPrompt')"
    if ($confirm -notmatch '^(Y|y|YA|ya)$') {
        Write-Host (Get-Translation 'RAM_Cancel') -ForegroundColor Yellow
        Read-Host "`n$(Get-Translation 'PressAnyKey')"
        return
    }

    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem
        $memBefore = [math]::Round($os.FreePhysicalMemory / 1024)
        Write-Host ((Get-Translation 'RAM_Before') -f $memBefore) -ForegroundColor Gray

        Write-Log "Running .NET Garbage Collector..." "INFO"
        
        # This is the only reliable, script-native way to influence memory.
        # It forces the .NET garbage collector to run, which cleans up memory
        # for the current PowerShell session and can sometimes trigger other processes.
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        Start-Sleep -Seconds 1

        $memAfter = [math]::Round((Get-CimInstance -ClassName Win32_OperatingSystem).FreePhysicalMemory / 1024)
        Write-Host ((Get-Translation 'RAM_After') -f $memAfter) -ForegroundColor Gray

        $memFreed = $memAfter - $memBefore
        if ($memFreed -gt 0) {
            $message = (Get-Translation 'RAM_Freed') -f $memFreed
            Write-Log "$message" "SUCCESS"
            Write-Host $message -ForegroundColor Green
        } else {
            Write-Host "Memory is already optimized or no significant change occurred." -ForegroundColor Green
        }

    } catch {
        $errorMsg = (Get-Translation 'RAM_Error') -f $_.Exception.Message
        Write-Log $errorMsg "ERROR"
        Write-Host $errorMsg -ForegroundColor Red
    }

    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 7. Antivirus Scan
# ---------------------------
function Start-AntivirusScan {
    Write-Host "`n=== $(Get-Translation 'Antivirus_Title') ===" -ForegroundColor Red

    try {
        # Check for Windows Defender
        $null = Get-MpComputerStatus -ErrorAction Stop
        Write-Host (Get-Translation 'Antivirus_Scanning') -ForegroundColor Yellow

        # Run quick scan
        Start-MpScan -ScanType QuickScan -ErrorAction Stop
        Write-Host (Get-Translation 'Antivirus_Complete') -ForegroundColor Green

        # Get threat results
        $threats = Get-MpThreatDetection -ErrorAction SilentlyContinue
        if ($threats) {
            Write-Host (Get-Translation 'Antivirus_Found') -ForegroundColor Red
            $threats | ForEach-Object {
                Write-Host "Threat: $($_.ThreatName) | Path: $($_.Resources.ThreatResource.Path)" -ForegroundColor Yellow
            }
            Write-Log "$($threats.Count) threats found during scan." "WARNING"
        } else {
            Write-Host (Get-Translation 'Antivirus_NotFound') -ForegroundColor Green
            Write-Log "No threats detected." "SUCCESS"
        }
    } catch {
        Write-Host (Get-Translation 'Antivirus_NoDefender') -ForegroundColor Yellow
        # Alternative: check third-party antivirus via Security Center
        try {
            $securityCenter = Get-CimInstance -Namespace root\SecurityCenter2 -ClassName AntivirusProduct -ErrorAction Stop
            if ($securityCenter) {
                Write-Host "Installed antivirus: $($securityCenter.displayName)" -ForegroundColor Green
                $status = if ($securityCenter.productState -eq "397568") {"Enabled and Up-to-date"} else {"Check status"}
                Write-Host "Status: $status" -ForegroundColor Yellow
                Write-Host "Running a scan with your installed antivirus is recommended." -ForegroundColor Yellow
            } else {
                Write-Host "No antivirus information found in Security Center." -ForegroundColor Yellow
            }
        } catch {
            $errorMsg = (Get-Translation 'Antivirus_Error') -f $_.Exception.Message
            Write-Log $errorMsg "ERROR"
            Write-Host $errorMsg -ForegroundColor Red
        }
    }

    Read-Host "`n$(Get-Translation 'PressAnyKey')"
}

# ---------------------------
# 8. System Health Checker
# ---------------------------
function Show-SystemHealthMenu {
    do {
        Clear-Host
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "        $(Get-Translation 'SubMenu_Health')" -ForegroundColor Cyan
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "1. $(Get-Translation 'SubMenu_Health1')"
        Write-Host "2. $(Get-Translation 'SubMenu_Health2')"
        Write-Host "3. $(Get-Translation 'SubMenu_Health3')"
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
    if ($confirm -notmatch '^(Y|y|YA|ya)$') { return }

    Write-Host "`n$(Get-Translation 'Health_SFC_Running')" -ForegroundColor Yellow
    Write-Host "This is a Windows process. The script is just waiting for it to complete." -ForegroundColor Cyan
    
    $process = Start-Process -FilePath "sfc.exe" -ArgumentList "/scannow" -Wait -PassThru -NoNewWindow
    
    if ($process.ExitCode -eq 0) {
        Write-Host "`n$(Get-Translation 'Health_SFC_Done')" -ForegroundColor Green
        Write-Log "SFC Scan completed successfully." "SUCCESS"
    } else {
        $errorMsg = (Get-Translation 'Health_SFC_Error') -f "$($process.ExitCode)"
        Write-Log "SFC.exe tool reported an error. This is a Windows System issue, not a script error." "ERROR"
        Write-Host "`n$errorMsg" -ForegroundColor Red
        Write-Host "This indicates a problem with your Windows system files that SFC could not fix." -ForegroundColor Yellow
    }
}

function Invoke-DISMRepair {
    $confirm = Read-Host "`n$(Get-Translation 'Health_Warning') $(Get-Translation 'YesNoPrompt')"
    if ($confirm -notmatch '^(Y|y|YA|ya)$') { return }
    
    Write-Host "`n$(Get-Translation 'Health_DISM_Running')" -ForegroundColor Yellow
    Write-Host "This is a Windows process. The script is just waiting for it to complete." -ForegroundColor Cyan
    
    $process = Start-Process -FilePath "dism.exe" -ArgumentList "/online", "/cleanup-image", "/restorehealth" -Wait -PassThru -NoNewWindow

    if ($process.ExitCode -eq 0) {
        Write-Host "`n$(Get-Translation 'Health_DISM_Done')" -ForegroundColor Green
        Write-Log "DISM repair completed successfully." "SUCCESS"
    } else {
        $errorMsg = (Get-Translation 'Health_DISM_Error') -f "$($process.ExitCode)"
        Write-Log "DISM.exe tool reported an error. This is a Windows System issue, not a script error." "ERROR"
        Write-Host "`n$errorMsg" -ForegroundColor Red
        Write-Host "This indicates a problem with your Windows image. Ensure you are connected to the internet." -ForegroundColor Yellow
    }
}

# ---------------------------
# 9. Startup Manager
# ---------------------------
function Show-StartupManager {
    do {
        Clear-Host
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "        $(Get-Translation 'SubMenu_Startup')" -ForegroundColor Cyan
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "1. $(Get-Translation 'SubMenu_Startup1')"
        Write-Host "2. $(Get-Translation 'SubMenu_Startup2')"
        Write-Host "3. $(Get-Translation 'SubMenu_Startup3')"
        Write-Host "=========================================" -ForegroundColor Green
        
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            # FIXED: Call renamed function
            "1" { Set-StartupProgram -Action Disable; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "2" { Set-StartupProgram -Action Enable; Read-Host "`n$(Get-Translation 'PressAnyKey')" }
            "3" { return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red; Start-Sleep -Seconds 2 }
        }
    } while ($true)
}

# FIXED: Renamed function with an approved verb 'Set'
function Set-StartupProgram {
    param([ValidateSet("Disable", "Enable")][string]$Action)

    $backupFile = Join-Path -Path $env:TEMP -ChildPath "StartupBackup.json"

    if ($Action -eq "Disable") {
        Write-Host "`n=== $(Get-Translation 'SubMenu_Startup1') ===" -ForegroundColor Cyan
        try {
            $startupItems = Get-CimInstance -ClassName Win32_StartupCommand | 
                            Select-Object @{N="Name";E={$_.Name}}, Command, Location, User | 
                            Sort-Object Name
            
            if (-not $startupItems) {
                Write-Host (Get-Translation 'Startup_None') -ForegroundColor Yellow
                return
            }

            Write-Host (Get-Translation 'Startup_List') -ForegroundColor Yellow
            for ($i = 0; $i -lt $startupItems.Count; $i++) {
                Write-Host ("[{0}] {1} ({2})" -f ($i+1), $startupItems[$i].Name, $startupItems[$i].Location) -ForegroundColor Gray
            }

            $itemChoice = Read-Host "`nEnter number of program to disable (or press Enter to cancel)"
            if ([string]::IsNullOrWhiteSpace($itemChoice)) { Write-Host (Get-Translation 'Cancel'); return }
            
            if ($itemChoice -match '^\d+$' -and [int]$itemChoice -ge 1 -and [int]$itemChoice -le $startupItems.Count) {
                $selectedIndex = [int]$itemChoice - 1
                $selectedItem = $startupItems[$selectedIndex]
                
                # Only handle registry items for simplicity and safety
                if ($selectedItem.Location -notlike "*Registry*") {
                    Write-Host "Cannot disable non-registry startup item '$($selectedItem.Name)' with this tool." -ForegroundColor Yellow
                    return
                }

                $regPath = if ($selectedItem.User -eq "All Users") { "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" }
                           else { "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" }

                # Backup to JSON file
                $existingBackup = if (Test-Path $backupFile) { (Get-Content $backupFile -Raw | ConvertFrom-Json) } else { @() }
                $existingBackup += [pscustomobject]@{ Name = $selectedItem.Name; Command = $selectedItem.Command; Path = $regPath }
                $existingBackup | ConvertTo-Json | Set-Content $backupFile

                # Remove the item
                Remove-ItemProperty -Path $regPath -Name $selectedItem.Name -Force -ErrorAction Stop
                Write-Host ((Get-Translation 'Startup_Disabled') -f $selectedItem.Name) -ForegroundColor Green

            } else {
                Write-Host "Invalid selection." -ForegroundColor Red
            }
        } catch {
            $errorMsg = (Get-Translation 'Startup_Error') -f $_.Exception.Message
            Write-Log $errorMsg "ERROR"
        }
    }
    elseif ($Action -eq "Enable") {
        Write-Host "`n=== $(Get-Translation 'SubMenu_Startup2') ===" -ForegroundColor Cyan
        if (-not (Test-Path $backupFile)) {
            Write-Host "No backup of disabled startup items found." -ForegroundColor Yellow
            return
        }

        $backupItems = Get-Content $backupFile -Raw | ConvertFrom-Json
        if (-not $backupItems) {
            Write-Host "No items to restore." -ForegroundColor Yellow; return
        }

        Write-Host "Disabled Startup Programs (available to enable):" -ForegroundColor Yellow
        for ($i = 0; $i -lt $backupItems.Count; $i++) {
            Write-Host ("[{0}] {1}" -f ($i+1), $backupItems[$i].Name) -ForegroundColor Gray
        }
        
        $itemChoice = Read-Host "`nEnter number to enable (or 'all', or Enter to cancel)"
        if ([string]::IsNullOrWhiteSpace($itemChoice)) { Write-Host (Get-Translation 'Cancel'); return }

        $itemsToRestore = @()
        if ($itemChoice -eq 'all') {
            $itemsToRestore = $backupItems
        } elseif ($itemChoice -match '^\d+$' -and [int]$itemChoice -ge 1 -and [int]$itemChoice -le $backupItems.Count) {
            $itemsToRestore += $backupItems[[int]$itemChoice - 1]
        } else {
            Write-Host "Invalid selection." -ForegroundColor Red; return
        }
        
        $remainingItems = $backupItems | Where-Object { $_ -notin $itemsToRestore }

        foreach ($item in $itemsToRestore) {
            try {
                Set-ItemProperty -Path $item.Path -Name $item.Name -Value $item.Command -ErrorAction Stop
                Write-Host ((Get-Translation 'Startup_Enabled') -f $item.Name) -ForegroundColor Green
            } catch {
                Write-Host "Failed to enable $($item.Name): $($_.Exception.Message)" -ForegroundColor Red
            }
        }
        
        # Update the backup file
        if ($remainingItems.Count -gt 0) {
            $remainingItems | ConvertTo-Json | Set-Content $backupFile
        } else {
            Remove-Item $backupFile -Force -ErrorAction SilentlyContinue
        }
    }
}

# ---------------------------
# 10. Language Settings
# ---------------------------
function Show-LanguageMenu {
    Clear-Host
    Write-Host "=========================================" -ForegroundColor Green
    Write-Host "         $(Get-Translation 'LanguageMenu')" -ForegroundColor Cyan
    Write-Host "=========================================" -ForegroundColor Green
    Write-Host "1. $(Get-Translation 'LanguageMenu1')"
    Write-Host "2. $(Get-Translation 'LanguageMenu2')"
    Write-Host "3. $(Get-Translation 'LanguageMenu3')"
    Write-Host "=========================================" -ForegroundColor Green

    do {
        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { 
                $global:Language = "EN"
                Write-Host "Language changed to English." -ForegroundColor Green
                Start-Sleep -Seconds 1
                return
            }
            "2" { 
                $global:Language = "ID"
                Write-Host "Bahasa diubah ke Indonesia." -ForegroundColor Green
                Start-Sleep -Seconds 1
                return
            }
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
    Write-Host ("11. {0}" -f (Get-Translation 'Menu_Option11')) -ForegroundColor Red
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
        "4"  { Invoke-DeepClean }
        "5"  { Show-NetworkMenu }
        "6"  { Clear-RAM }
        "7"  { Start-AntivirusScan }
        "8"  { Show-SystemHealthMenu }
        "9"  { Show-StartupManager }
        "10" { Show-LanguageMenu }
        "11" {
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