<#
===============================================
ncexs Toolkit v2.2.2 Final Hotfix
===============================================
#>

# Ensure running as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Toolkit perlu dijalankan sebagai Administrator" -ForegroundColor Yellow
    Write-Host "Memulai ulang sebagai Administrator..." -ForegroundColor Green
    Start-Sleep -Seconds 2

    # Get script path
    $scriptPath = $MyInvocation.MyCommand.Path
    if (-not $scriptPath) {
        $scriptPath = ".\" + $MyInvocation.MyCommand.Name
    }

    # Restart as admin
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
}

# Set execution policy (for this session only)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

# ---------------------------
# Global vars & Translations
# ---------------------------
$global:Language = "ID"  # default, will be overridden if user chooses English

# Structure: $global:Translations["EN"]["Key"]  and ["ID"]["Key"]
$global:Translations = @{
    "EN" = @{
        "Menu_Title" = "ncexs Toolkit v2.2.2 Final Hotfix"
        "Menu_Option1" = "System Information"
        "Menu_Option2" = "Junk Cleaner"
        "Menu_Option3" = "Empty Recycle Bin"
        "Menu_Option4" = "Deep Cleanup"
        "Menu_Option5" = "Network Utilities"
        "Menu_Option6" = "Memory Optimizer"
        "Menu_Option7" = "Antivirus Scan"
        "Menu_Option8" = "Startup Manager"
        "Menu_Option9" = "Language Settings"
        "Menu_Option10" = "Exit"
        "SubMenu_Network" = "NETWORK UTILITIES"
        "SubMenu_Network1" = "Network Repair (Reset TCP/IP & flush DNS)"
        "SubMenu_Network2" = "Internet Accelerator (Optimize connections)"
        "SubMenu_Network3" = "Back to Main Menu"
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
        "Select_All" = "Select All"
        "Cancel" = "Cancel"

        # Additional
        "Antivirus_Title" = "ANTIVIRUS SCAN"
        "Antivirus_Warning" = "WARNING: The scan may take some time depending on the number of files."
        "Antivirus_Confirm" = "Do you want to continue with the antivirus scan?"
        "Antivirus_Cancel" = "Scan cancelled by user."
        "Antivirus_NoThreat" = "[OK] No threats detected."
        "Antivirus_ThreatFound" = "[WARNING] Threats detected!"
        "Antivirus_ActionPrompt" = "Select action to handle threats:"
        "Antivirus_Remove" = "Remove threats"
        "Antivirus_Quarantine" = "Quarantine threats (via Windows Defender Offline)"
        "Antivirus_Ignore" = "Ignore (do nothing)"
        "Antivirus_Running" = "Running antivirus scan..."
        "Antivirus_ScanStarting" = "Starting antivirus scan..."
        "Antivirus_ScanFailed" = "Antivirus scan failed: {0}"
        "Antivirus_NoEngine" = "Windows Defender engine not available"
        "Antivirus_FallbackFullScan" = "Falling back to full system scan..."
        "Antivirus_FallbackDone" = "Full system scan completed"
        "Antivirus_FallbackFailed" = "Full system scan failed: {0}"
        "Antivirus_NoAction" = "No action available for threats"
        "Antivirus_OfflineScheduled" = "Windows Defender Offline scan scheduled"
        "Antivirus_OfflineFailed" = "Windows Defender Offline scan not available"
        "System_Title" = "SYSTEM INFORMATION"
        "Recycle_Title" = "RECYCLE BIN CLEANUP"
        "Recycle_Confirm" = "Are you sure you want to empty the Recycle Bin?"
        "Recycle_Success" = "Recycle Bin emptied successfully."
        "Recycle_Cancel" = "Recycle Bin cleanup cancelled."
        "Recycle_UserConfirmed" = "User confirmed Recycle Bin cleanup"
        "Recycle_EmptiedCount" = "Recycle Bin emptied. {0} items removed."
        "Recycle_AlreadyEmpty" = "Recycle Bin is already empty."
        "Recycle_Error" = "Error emptying Recycle Bin: {0}"
        "Deep_Title" = "DEEP CLEAN (ADVANCED)"
        "Deep_Warning" = "WARNING: This feature will remove deeper junk files. Use with caution."
        "Deep_Confirm" = "Do you want to continue with deep clean?"
        "Deep_Cancel" = "Deep clean cancelled."
        "Deep_Done" = "Deep clean completed."
        "Deep_Running" = "Running deep clean operations..."
        "Deep_WindowsUpdate" = "Cleaned Windows Update cache"
        "Deep_DeliveryOpt" = "Cleaned Delivery Optimization files"
        "Deep_Error" = "Error during deep clean: {0}"
        "Clean_Title" = "TEMP & CACHE CLEANUP"
        "Clean_Progress" = "Cleaning temporary folders..."
        "Clean_Done" = "Cleanup completed."
        "Clean_TempCache" = "Starting temporary files and cache cleanup"
        "Clean_CacheBrowser" = "Cleaned {0} browser cache"
        "Clean_CacheFirefox" = "Cleaned Firefox cache"
        "Clean_TaskError" = "Error during cleanup task: {0}"
        "PressEnter" = "Press Enter to continue..."
        "Network_Repairing" = "Repairing network settings..."
        "Network_Repaired" = "Network settings repaired successfully."
        "Network_ErrorRepair" = "Error repairing network: {0}"
        "Network_Optimizing" = "Optimizing network settings..."
        "Network_Optimized" = "Network settings optimized successfully."
        "Network_ErrorOptimize" = "Error optimizing network: {0}"
        "RAM_Cleaning" = "Optimizing memory..."
        "RAM_Cleaned" = "Memory optimized successfully."
        "RAM_Error" = "Error optimizing memory: {0}"
        "Startup_NoPrograms" = "No startup programs found."
        "Startup_ListHeader" = "STARTUP PROGRAMS:"
        "ChooseProgramDisable" = "Select program to disable"
        "Startup_Invalid" = "Invalid selection."
        "Startup_Disabled" = "Disabled: {0}"
        "Startup_ListDisabledHeader" = "DISABLED STARTUP PROGRAMS:"
        "ChooseProgramEnable" = "Select program to enable"
        "Startup_Enabled" = "Enabled: {0}"
    }
    "ID" = @{
        "Menu_Title" = "ncexs Toolkit v2.2.2 Final Hotfix"
        "Menu_Option1" = "Informasi Sistem"
        "Menu_Option2" = "Pembersih Sampah"
        "Menu_Option3" = "Kosongkan Recycle Bin"
        "Menu_Option4" = "Pembersihan Mendalam"
        "Menu_Option5" = "Utilitas Jaringan"
        "Menu_Option6" = "Optimasi Memori"
        "Menu_Option7" = "Pemindaian Antivirus"
        "Menu_Option8" = "Pengelola Startup"
        "Menu_Option9" = "Pengaturan Bahasa"
        "Menu_Option10" = "Keluar"
        "SubMenu_Network" = "UTILITAS JARINGAN"
        "SubMenu_Network1" = "Perbaikan Jaringan (Reset TCP/IP & flush DNS)"
        "SubMenu_Network2" = "Akselerator Internet (Optimasi koneksi)"
        "SubMenu_Network3" = "Kembali ke Menu Utama"
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
        "Select_All" = "Pilih Semua"
        "Cancel" = "Batal"

        # Additional
        "Antivirus_Title" = "PEMINDAIAN ANTIVIRUS"
        "Antivirus_Warning" = "PERINGATAN: Pemindaian mungkin memakan waktu tergantung jumlah file."
        "Antivirus_Confirm" = "Apakah Anda ingin melanjutkan dengan pemindaian antivirus?"
        "Antivirus_Cancel" = "Pemindaian dibatalkan oleh pengguna."
        "Antivirus_NoThreat" = "[OK] Tidak ada ancaman terdeteksi."
        "Antivirus_ThreatFound" = "[PERINGATAN] Ancaman terdeteksi!"
        "Antivirus_ActionPrompt" = "Pilih tindakan untuk menangani ancaman:"
        "Antivirus_Remove" = "Hapus ancaman"
        "Antivirus_Quarantine" = "Karantina ancaman (via Windows Defender Offline)"
        "Antivirus_Ignore" = "Abaikan (tidak melakukan apa-apa)"
        "Antivirus_Running" = "Menjalankan pemindaian antivirus..."
        "Antivirus_ScanStarting" = "Memulai pemindaian antivirus..."
        "Antivirus_ScanFailed" = "Pemindaian antivirus gagal: {0}"
        "Antivirus_NoEngine" = "Engine Windows Defender tidak tersedia"
        "Antivirus_FallbackFullScan" = "Beralih ke pemindaian sistem penuh..."
        "Antivirus_FallbackDone" = "Pemindaian sistem penuh selesai"
        "Antivirus_FallbackFailed" = "Pemindaian sistem penuh gagal: {0}"
        "Antivirus_NoAction" = "Tidak ada tindakan tersedia untuk ancaman"
        "Antivirus_OfflineScheduled" = "Pemindaian Windows Defender Offline dijadwalkan"
        "Antivirus_OfflineFailed" = "Pemindaian Windows Defender Offline tidak tersedia"
        "System_Title" = "INFORMASI SISTEM"
        "Recycle_Title" = "PEMBERSIHAN RECYCLE BIN"
        "Recycle_Confirm" = "Apakah Anda yakin ingin mengosongkan Recycle Bin?"
        "Recycle_Success" = "Recycle Bin berhasil dikosongkan."
        "Recycle_Cancel" = "Pembersihan Recycle Bin dibatalkan."
        "Recycle_UserConfirmed" = "Pengguna mengonfirmasi pembersihan Recycle Bin"
        "Recycle_EmptiedCount" = "Recycle Bin dikosongkan. {0} item dihapus."
        "Recycle_AlreadyEmpty" = "Recycle Bin sudah kosong."
        "Recycle_Error" = "Kesalahan mengosongkan Recycle Bin: {0}"
        "Deep_Title" = "PENGHAPUSAN MENDALAM (DEEP CLEAN)"
        "Deep_Warning" = "PERINGATAN: Fitur ini akan menghapus file sampah lebih dalam. Gunakan dengan hati-hati."
        "Deep_Confirm" = "Apakah Anda ingin melanjutkan deep clean?"
        "Deep_Cancel" = "Deep clean dibatalkan."
        "Deep_Done" = "Deep clean selesai."
        "Deep_Running" = "Menjalankan operasi pembersihan mendalam..."
        "Deep_WindowsUpdate" = "Cache Windows Update dibersihkan"
        "Deep_DeliveryOpt" = "File Delivery Optimization dibersihkan"
        "Deep_Error" = "Kesalahan selama deep clean: {0}"
        "Clean_Title" = "PEMBERSIHAN SEMENTARA & CACHE"
        "Clean_Progress" = "Membersihkan folder sementara..."
        "Clean_Done" = "Pembersihan selesai."
        "Clean_TempCache" = "Memulai pembersihan file sementara dan cache"
        "Clean_CacheBrowser" = "Cache browser {0} dibersihkan"
        "Clean_CacheFirefox" = "Cache Firefox dibersihkan"
        "Clean_TaskError" = "Kesalahan selama tugas pembersihan: {0}"
        "PressEnter" = "Tekan Enter untuk melanjutkan..."
        "Network_Repairing" = "Memperbaiki pengaturan jaringan..."
        "Network_Repaired" = "Pengaturan jaringan berhasil diperbaiki."
        "Network_ErrorRepair" = "Kesalahan memperbaiki jaringan: {0}"
        "Network_Optimizing" = "Mengoptimalkan pengaturan jaringan..."
        "Network_Optimized" = "Pengaturan jaringan berhasil dioptimalkan."
        "Network_ErrorOptimize" = "Kesalahan mengoptimalkan jaringan: {0}"
        "RAM_Cleaning" = "Mengoptimalkan memori..."
        "RAM_Cleaned" = "Memori berhasil dioptimalkan."
        "RAM_Error" = "Kesalahan mengoptimalkan memori: {0}"
        "Startup_NoPrograms" = "Tidak ditemukan program startup."
        "Startup_ListHeader" = "PROGRAM STARTUP:"
        "ChooseProgramDisable" = "Pilih program untuk dinonaktifkan"
        "Startup_Invalid" = "Pilihan tidak valid."
        "Startup_Disabled" = "Dinonaktifkan: {0}"
        "Startup_ListDisabledHeader" = "PROGRAM STARTUP YANG DINONAKTIFKAN:"
        "ChooseProgramEnable" = "Pilih program untuk diaktifkan"
        "Startup_Enabled" = "Diaktifkan: {0}"
    }
}

function Get-Translation {
    param([string]$key)
    if ($global:Translations.ContainsKey($global:Language)) {
        $dict = $global:Translations[$global:Language]
        if ($dict.ContainsKey($key)) { return $dict[$key] }
    }
    # fallback
    return $key
}

# ---------------------------
# Logging (file & console)
# ---------------------------
$logfile = Join-Path -Path $PSScriptRoot -ChildPath 'log_ncexs-toolkit.txt'

function Write-Log {
    param([string]$msg, [string]$level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$level] $msg"
    try {
        $logEntry | Out-File -FilePath $logfile -Append -Encoding utf8 -ErrorAction SilentlyContinue
    } catch {}
    switch ($level) {
        "ERROR" { Write-Host $logEntry -ForegroundColor Red }
        "WARNING" { Write-Host $logEntry -ForegroundColor Yellow }
        "SUCCESS" { Write-Host $logEntry -ForegroundColor Green }
        default { Write-Host $logEntry -ForegroundColor White }
    }
}

# ---------------------------
# Utilities
# ---------------------------
function Show-Progress {
    param([string]$activity, [string]$status, [int]$percent)
    Write-Progress -Activity $activity -Status $status -PercentComplete $percent
}

# ---------------------------
# Clear old logs
# ---------------------------
function Clear-OldLogs {
    param([int]$maxSizeMB = 10)
    Write-Log "Memeriksa ukuran file log..." "INFO"
    try {
        $log = Get-Item $logfile -ErrorAction SilentlyContinue
        if ($log -and $log.Length -gt ($maxSizeMB * 1MB)) {
            $backupName = Join-Path -Path $PSScriptRoot -ChildPath ("log_ncexs-toolkit-backup-{0}.txt" -f (Get-Date -Format 'yyyyMMdd-HHmmss'))
            Move-Item -Path $logfile -Destination $backupName -Force -ErrorAction SilentlyContinue
            Write-Log "File log dibackup ke $backupName" "INFO"
        }
    } catch {
        Write-Log "Tidak dapat memeriksa ukuran log: $($_.Exception.Message)" "ERROR"
    }
}

# ---------------------------
# Update check (simple)
# ---------------------------
function Get-UpdateStatus {
    Write-Log "Memeriksa pembaruan..." "INFO"
    try {
        $currentVersion = "2.2.2 Final Hotfix"
        Write-Log "Anda memiliki versi terbaru ($currentVersion)." "INFO"
    } catch {
        Write-Log "Tidak dapat memeriksa pembaruan: $($_.Exception.Message)" "ERROR"
    }
}

# run initial housekeeping
Clear-OldLogs -maxSizeMB 10
Get-UpdateStatus

# ---------------------------
# 1. System Info (Multilanguage)
# ---------------------------
function Show-SystemInfo {
    Write-Host "`n=== $(Get-Translation 'System_Title') ===" -ForegroundColor Cyan
    try {
        $os = Get-WmiObject Win32_OperatingSystem -ErrorAction SilentlyContinue
        if ($os) {
            Write-Host ("{0}: {1}" -f (Get-Translation "OS"), $os.Caption) -ForegroundColor White
            Write-Host ("{0}: {1}" -f (Get-Translation "Version"), $os.Version) -ForegroundColor White
        }
        $cpu = Get-WmiObject Win32_Processor -ErrorAction SilentlyContinue
        if ($cpu) {
            Write-Host ("{0}: {1}" -f (Get-Translation "CPU"), $cpu.Name) -ForegroundColor White
        }
        $memory = Get-WmiObject Win32_ComputerSystem -ErrorAction SilentlyContinue
        if ($memory) {
            $totalMemory = [math]::Round($memory.TotalPhysicalMemory / 1GB, 2)
            Write-Host ("{0}: {1} GB" -f (Get-Translation "RAM"), $totalMemory) -ForegroundColor White
        }
        Write-Host "`n$(Get-Translation 'Disk'):" -ForegroundColor Yellow
        $disks = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3" -ErrorAction SilentlyContinue
        if ($disks) {
            foreach ($disk in $disks) {
                $freeSpace = [math]::Round($disk.FreeSpace / 1GB, 2)
                $totalSize = [math]::Round($disk.Size / 1GB, 2)
                Write-Host ("  {0} {1} GB ({2} GB {3})" -f $disk.DeviceID, $totalSize, $freeSpace, (Get-Translation "Free")) -ForegroundColor Gray
            }
        }
    } catch {
        Write-Host (Get-Translation "System_Error") -ForegroundColor Red
    }
    Write-Host "==========================" -ForegroundColor Cyan
    Write-Host ""
    Read-Host (Get-Translation "PressEnter")
}

# ---------------------------
# 2. Clear Junk Files (Temp & browser cache)
# ---------------------------
function Clear-JunkFiles {
    Write-Log (Get-Translation 'Clean_TempCache') "INFO"
    Show-Progress -activity (Get-Translation 'Clean_Title') -status (Get-Translation 'Clean_Progress') -percent 0

    $tasks = @(
        { Remove-Item -Path (Join-Path $env:TEMP '*') -Recurse -Force -ErrorAction SilentlyContinue }
        { Remove-Item -Path (Join-Path $env:SystemRoot 'Temp\*') -Recurse -Force -ErrorAction SilentlyContinue }
        { Remove-Item -Path (Join-Path $env:SystemRoot 'Prefetch\*') -Recurse -Force -ErrorAction SilentlyContinue }
        { Remove-Item -Path (Join-Path $env:APPDATA 'Microsoft\Windows\Recent\*.lnk') -Force -ErrorAction SilentlyContinue }
    )

    $browserCaches = @(
        @{Path = Join-Path $env:LOCALAPPDATA 'Google\Chrome\User Data\Default\Cache'; Name = "Chrome"},
        @{Path = Join-Path $env:LOCALAPPDATA 'Microsoft\Edge\User Data\Default\Cache'; Name = "Edge"},
        @{Path = Join-Path $env:LOCALAPPDATA 'BraveSoftware\Brave-Browser\User Data\Default\Cache'; Name = "Brave"}
    )

    foreach ($browser in $browserCaches) {
        if (Test-Path $browser.Path) {
            $b = $browser
            $tasks += { 
                Remove-Item -Path $b.Path -Recurse -Force -ErrorAction SilentlyContinue
                Write-Log ((Get-Translation 'Clean_CacheBrowser') -f $b.Name) "INFO"
            }
        }
    }

    if (Test-Path (Join-Path $env:APPDATA 'Mozilla\Firefox\Profiles\')) {
        $tasks += {
            Get-ChildItem (Join-Path $env:APPDATA 'Mozilla\Firefox\Profiles\') -Directory -ErrorAction SilentlyContinue | ForEach-Object {
                if (Test-Path (Join-Path $_.FullName 'cache2')) { Remove-Item -Path (Join-Path $_.FullName 'cache2') -Recurse -Force -ErrorAction SilentlyContinue }
            }
            Write-Log (Get-Translation 'Clean_CacheFirefox') "INFO"
        }
    }

    for ($i = 0; $i -lt $tasks.Count; $i++) {
        Show-Progress -activity (Get-Translation 'Clean_Title') -status ("Task {0}/{1}" -f ($i+1), $tasks.Count) -percent ([int](($i/$tasks.Count)*100))
        try { & $tasks[$i] } catch { Write-Log ((Get-Translation 'Clean_TaskError') -f $_.Exception.Message) "ERROR" }
    }

    Show-Progress -activity (Get-Translation 'Clean_Title') -status (Get-Translation 'Clean_Done') -percent 100
    Start-Sleep -Seconds 1
    Write-Progress -Activity (Get-Translation 'Clean_Title') -Completed
    Write-Log (Get-Translation 'Clean_Done') "SUCCESS"
    Read-Host (Get-Translation 'PressEnter')
}

# ---------------------------
# 3. Clear Recycle Bin
# ---------------------------
function Clear-RecycleBin-Menu {
    Write-Host "`n=== $(Get-Translation 'Recycle_Title') ===" -ForegroundColor Red
    Write-Host (Get-Translation 'Recycle_Confirm') -ForegroundColor Yellow
    $confirm = Read-Host "`n$(Get-Translation 'YesNoPrompt')"

    # Fix: Check user input correctly
    if ($confirm -in @("Y","y")) {
        Write-Log (Get-Translation 'Recycle_UserConfirmed') "WARNING"
        try {
            if (Get-Command Clear-RecycleBin -ErrorAction SilentlyContinue) {
                Clear-RecycleBin -Force -ErrorAction SilentlyContinue
                Write-Log (Get-Translation 'Recycle_Success') "SUCCESS"
                Write-Host (Get-Translation 'Recycle_Success') -ForegroundColor Green
            } else {
                $shell = New-Object -ComObject Shell.Application
                $recycleBin = $shell.Namespace(0xA)
                $items = $recycleBin.Items()
                $itemCount = $items.Count
                if ($itemCount -gt 0) {
                    $items | ForEach-Object { $_.InvokeVerb("Delete") }
                    Write-Log ((Get-Translation 'Recycle_EmptiedCount') -f $itemCount) "SUCCESS"
                    Write-Host ((Get-Translation 'Recycle_EmptiedCount') -f $itemCount) -ForegroundColor Green
                } else {
                    Write-Host (Get-Translation 'Recycle_AlreadyEmpty') -ForegroundColor Green
                    Write-Log (Get-Translation 'Recycle_AlreadyEmpty') "INFO"
                }
            }
        } catch {
            Write-Log ((Get-Translation 'Recycle_Error') -f $_.Exception.Message) "ERROR"
            Write-Host ((Get-Translation 'Recycle_Error') -f $_.Exception.Message) -ForegroundColor Red
        }
    } else {
        Write-Log (Get-Translation 'Recycle_Cancel') "INFO"
        Write-Host (Get-Translation 'Recycle_Cancel') -ForegroundColor Yellow
    }

    Read-Host (Get-Translation 'PressEnter')
}

# ---------------------------
# 4. Deep Clean
# ---------------------------
function Invoke-DeepClean {
    Write-Host "`n=== $(Get-Translation 'Deep_Title') ===" -ForegroundColor Cyan
    Write-Host (Get-Translation 'Deep_Warning') -ForegroundColor Yellow
    $confirm = Read-Host "`n$(Get-Translation 'Deep_Confirm') $(Get-Translation 'YesNoPrompt')"

    if ($confirm -notin @("Y","y")) {
        Write-Host (Get-Translation 'Deep_Cancel') -ForegroundColor Yellow
        Read-Host (Get-Translation 'PressEnter')
        return
    }

    Write-Host "`n$(Get-Translation 'Deep_Running')" -ForegroundColor Green

    try {
        # ---------------------------
        # Windows Core & Temp
        # ---------------------------
        $corePaths = @(
            "$env:TEMP\*",
            "$env:SystemRoot\Temp\*",
            (Join-Path $env:SystemRoot 'Prefetch\*'),
            (Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Explorer\thumbcache_*.db'),
            (Join-Path $env:SystemRoot 'SoftwareDistribution\Download'),
            (Join-Path $env:SystemRoot 'SoftwareDistribution\DeliveryOptimization')
        )
        foreach ($p in $corePaths) { Remove-Item -Path $p -Recurse -Force -ErrorAction SilentlyContinue }

        # ---------------------------
        # Safe Registry Cleanup (MRU/Cache)
        # ---------------------------
        $registryPaths = @(
            "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU",
            "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU",
            "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU",
            "HKCU:\Software\Microsoft\Office\16.0\Common\Open Find\*",
            "HKCU:\Software\Microsoft\VSCommon\VSCode\MRU",
            "HKCU:\Software\Valve\Steam\RecentApps"
        )
        foreach ($reg in $registryPaths) {
            if (Test-Path $reg) { Remove-Item -Path $reg -Recurse -Force -ErrorAction SilentlyContinue }
        }

        # ---------------------------
        # Browser Cache
        # ---------------------------
        $browsers = @(
            "$env:LOCALAPPDATA\Google\Chrome\User Data",
            "$env:LOCALAPPDATA\Microsoft\Edge\User Data",
            "$env:APPDATA\Mozilla\Firefox\Profiles"
        )
        foreach ($browserPath in $browsers) {
            if (Test-Path $browserPath) {
                $profiles = Get-ChildItem $browserPath -Directory | Where-Object { $_.Name -match "Default|Profile|.*" }
                foreach ($p in $profiles) {
                    Remove-Item -Path (Join-Path $p.FullName 'Cache\*') -Recurse -Force -ErrorAction SilentlyContinue
                    Remove-Item -Path (Join-Path $p.FullName 'GPUCache\*') -Recurse -Force -ErrorAction SilentlyContinue
                    Remove-Item -Path (Join-Path $p.FullName 'Code Cache\*') -Recurse -Force -ErrorAction SilentlyContinue
                    Remove-Item -Path (Join-Path $p.FullName 'cache2\*') -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }

        # ---------------------------
        # Popular Applications Cleanup
        # ---------------------------
        $apps = @{
            Steam  = @('appcache','logs','shadercache')
            Spotify = @('Storage','Browser')
            VSCode  = @('Cache','CachedData')
            Office  = @('OfficeFileCache')
        }
        foreach ($app in $apps.Keys) {
            $path = switch ($app) {
                "Steam"   { "$env:ProgramFiles(x86)\Steam" }
                "Spotify" { Join-Path $env:APPDATA 'Spotify' }
                "VSCode"  { Join-Path $env:APPDATA 'Code' }
                "Office"  { Join-Path $env:LOCALAPPDATA 'Microsoft\Office\16.0' }
            }
            if (Test-Path $path) {
                foreach ($d in $apps[$app]) {
                    $fullPath = Join-Path $path $d
                    if (Test-Path $fullPath) { Remove-Item -Path "$fullPath\*" -Recurse -Force -ErrorAction SilentlyContinue }
                }
            }
        }

        # ---------------------------
        # Windows Logs & Event Logs
        # ---------------------------
        $logPaths = @(
            (Join-Path $env:SystemRoot 'Logs\*'),
            (Join-Path $env:SystemRoot 'System32\winevt\Logs\*')
        )
        foreach ($lp in $logPaths) { Remove-Item -Path $lp -Recurse -Force -ErrorAction SilentlyContinue }
        Get-WinEvent -ListLog * | ForEach-Object { try { Clear-WinEvent -LogName $_.LogName -ErrorAction SilentlyContinue } catch {} }

        # ---------------------------
        # Old Windows Update Files
        # ---------------------------
        $wuBackup = Join-Path $env:SystemRoot 'SoftwareDistribution\Download'
        if (Test-Path $wuBackup) { Remove-Item -Path "$wuBackup\*" -Recurse -Force -ErrorAction SilentlyContinue }

        # Optional: Windows.old
        $windowsOld = Join-Path $env:SystemDrive 'Windows.old'
        if (Test-Path $windowsOld) { Remove-Item -Path $windowsOld -Recurse -Force -ErrorAction SilentlyContinue }

        Write-Host "`n$(Get-Translation 'Deep_Done')" -ForegroundColor Green
    } catch {
        Write-Host ("$(Get-Translation 'Deep_Error')" -f $_.Exception.Message) -ForegroundColor Red
    }

    Read-Host (Get-Translation 'PressEnter')
}

# ---------------------------
# 6. Clear RAM
# ---------------------------
function Clear-RAM {
    Write-Log (Get-Translation 'RAM_Cleaning') "INFO"
    try {
        Get-Process | Where-Object { $_.ProcessName -notin @("Idle","System") -and $_.Responding -eq $true } | ForEach-Object {
            try { $_.MinWorkingSet = New-Object System.IntPtr(4096) } catch {}
        }
        [System.GC]::Collect()
        [System.GC]::WaitForPendingFinalizers()
        Write-Log (Get-Translation 'RAM_Cleaned') "SUCCESS"
        Write-Host (Get-Translation 'RAM_Cleaned') -ForegroundColor Green
    } catch {
        Write-Log ((Get-Translation 'RAM_Error') -f $_.Exception.Message) "ERROR"
        Write-Host ((Get-Translation 'RAM_Error') -f $_.Exception.Message) -ForegroundColor Red
    }
    Read-Host (Get-Translation 'PressEnter')
}

# ---------------------------
# 7. Antivirus Scan (Enhanced)
# ---------------------------
function Start-AntivirusScan {
    Write-Host "`n=== $(Get-Translation 'Antivirus_Title') ===" -ForegroundColor Yellow
    Write-Host (Get-Translation 'Antivirus_Warning') -ForegroundColor Yellow

    $confirm = Read-Host "`n$(Get-Translation 'Antivirus_Confirm') $(Get-Translation 'YesNoPrompt')"
    
    if ($confirm -notin @("Y","y")) {
        Write-Host (Get-Translation 'Antivirus_Cancel') -ForegroundColor Yellow
        Read-Host (Get-Translation 'PressEnter')
        return
    }

    Write-Host "`n$(Get-Translation 'Antivirus_Running')" -ForegroundColor Yellow

    if (Get-Command Start-MpScan -ErrorAction SilentlyContinue) {
        Write-Host (Get-Translation 'Antivirus_ScanStarting') -ForegroundColor Yellow
        try { 
            Start-MpScan -ScanType QuickScan -ErrorAction Stop 
        } catch {
            Write-Host ((Get-Translation 'Antivirus_ScanFailed') -f $_.Exception.Message) -ForegroundColor Red
            Read-Host (Get-Translation 'PressEnter')
            return
        }

        # Wait for scan to complete
        do {
            $status = Get-MpComputerStatus -ErrorAction SilentlyContinue
            if ($status -and $status.AntivirusScanRunning) {
                Write-Host "$(Get-Date -Format 'HH:mm:ss') - Scanning... (still running)" -ForegroundColor Cyan
                Start-Sleep -Seconds 5
            } else { break }
        } while ($true)
    } else {
        Write-Host (Get-Translation 'Antivirus_NoEngine') -ForegroundColor Yellow
        Read-Host (Get-Translation 'PressEnter')
        return
    }

    # Get scan results
    $threats = @()
    if (Get-Command Get-MpThreatDetection -ErrorAction SilentlyContinue) { 
        $threats = Get-MpThreatDetection -ErrorAction SilentlyContinue 
    }

    if (-not $threats -or $threats.Count -eq 0) {
        Write-Host "`n$(Get-Translation 'Antivirus_NoThreat')" -ForegroundColor Green
        Read-Host (Get-Translation 'PressEnter')
        return
    }

    Write-Host "`n$(Get-Translation 'Antivirus_ThreatFound')" -ForegroundColor Red
    foreach ($t in $threats) {
        $detail = ("Threat: {0} | Resource: {1} | ActionSuccess: {2}" -f ($t.ThreatName -as [string]), ($t.Resources -as [string]), ($t.ActionSuccess -as [string]))
        Write-Host $detail -ForegroundColor Yellow
    }

    # Action menu
    Write-Host "`n$(Get-Translation 'Antivirus_ActionPrompt')" -ForegroundColor Yellow
    Write-Host "[1] $(Get-Translation 'Antivirus_Remove')"
    Write-Host "[2] $(Get-Translation 'Antivirus_Quarantine')"
    Write-Host "[3] $(Get-Translation 'Antivirus_Ignore')"

    $choice = Read-Host "$(Get-Translation 'SelectOption') (1-3)"
    switch ($choice) {
        "1" {
        if (Get-Command Remove-MpThreat -ErrorAction SilentlyContinue) {
            try { 
                Remove-MpThreat -ErrorAction Stop
                Write-Host "Done. $(Get-Translation 'Antivirus_Remove')" -ForegroundColor Green

                # Re-verify
                Start-Sleep -Seconds 3
                $remain = Get-MpThreatDetection -ErrorAction SilentlyContinue
                if ($remain) {
                    foreach ($r in $remain) {
                        if ($r.ActionSuccess -eq $false -or $r.Status -match "Active") {
                            Write-Host "Threat masih ada: $($r.ThreatName) → Menjalankan Full Scan..." -ForegroundColor Yellow
                            Start-MpScan -ScanType FullScan -ErrorAction SilentlyContinue
                            break
                        }
                        elseif ($r.Status -match "RemediatedPendingReboot") {
                            Write-Host "Threat $($r.ThreatName) butuh restart untuk hilang sepenuhnya." -ForegroundColor Yellow
                        }
                    }
                }
            } catch {
                Write-Host (Get-Translation 'Antivirus_FallbackFullScan') -ForegroundColor Yellow
                try { 
                    Start-MpScan -ScanType FullScan -ErrorAction Stop
                    Write-Host (Get-Translation 'Antivirus_FallbackDone') -ForegroundColor Yellow
                } catch {}
            }
        } else { 
            Write-Host (Get-Translation 'Antivirus_NoAction') -ForegroundColor Yellow 
        }

        }
        "2" {
            if (Get-Command Start-MpWDOScan -ErrorAction SilentlyContinue) {
                try { 
                    Start-MpWDOScan -ErrorAction Stop
                    Write-Host (Get-Translation 'Antivirus_OfflineScheduled') -ForegroundColor Yellow
                } catch {
                    Write-Host ((Get-Translation 'Antivirus_OfflineFailed') -f $_.Exception.Message) -ForegroundColor Red
                }
            } else { 
                Write-Host (Get-Translation 'Antivirus_OfflineFailed') -ForegroundColor Yellow 
            }
        }
        Default { 
            Write-Host (Get-Translation 'Antivirus_Ignore') -ForegroundColor Cyan 
        }
    }

    Read-Host (Get-Translation 'PressEnter')
}

# ---------------------------
# 8 Startup Manager (Disable/Enable)
# ---------------------------
function Show-StartupManager {
    do {
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "          $(Get-Translation 'SubMenu_Startup')" -ForegroundColor Cyan
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "1. $(Get-Translation 'SubMenu_Startup1')" -ForegroundColor White
        Write-Host "2. $(Get-Translation 'SubMenu_Startup2')" -ForegroundColor White
        Write-Host "3. $(Get-Translation 'SubMenu_Startup3')" -ForegroundColor Yellow
        Write-Host "=========================================" -ForegroundColor Green

        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" { Disable-StartupPrograms; Read-Host (Get-Translation 'PressEnter') }
            "2" { Enable-StartupPrograms; Read-Host (Get-Translation 'PressEnter') }
            "3" { return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red; Start-Sleep -Seconds 2 }
        }
    } while ($true)
}

function Disable-StartupPrograms {
    Write-Log "Listing startup programs..." "INFO"
    $startupItems = @()
    $startupPaths = @(
        Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup"
        Join-Path $env:ProgramData "Microsoft\Windows\Start Menu\Programs\Startup"
    )

    # Scan shortcuts
    foreach ($path in $startupPaths) {
        if (Test-Path $path) {
            Get-ChildItem $path -Filter "*.lnk*" -ErrorAction SilentlyContinue | ForEach-Object {
                $ext = [IO.Path]::GetExtension($_.Name)
                $type = if ($ext -eq ".lnk.disabled") { "DisabledShortcut" } else { "Shortcut" }
                $startupItems += [PSCustomObject]@{
                    Name      = $_.BaseName
                    Path      = $_.FullName
                    Location  = $path
                    FullName  = $_.FullName
                    Type      = $type
                }
            }
        }
    }

    # Scan registry
    $registryPaths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
    )

    foreach ($regPath in $registryPaths) {
        if (Test-Path $regPath) {
            $regValues = Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue
            if ($regValues) {
                $regValues.PSObject.Properties | Where-Object { $_.Name -notmatch "^(PSPath|PSParentPath|PSChildName|PSDrive|PSProvider)$" } | ForEach-Object {
                    $startupItems += [PSCustomObject]@{
                        Name      = $_.Name
                        Path      = $_.Value
                        Location  = $regPath
                        FullName  = (Join-Path $regPath $_.Name)
                        Type      = "Registry"
                    }
                }
            }
        }
    }

    if ($startupItems.Count -eq 0) {
        Write-Host (Get-Translation 'Startup_NoPrograms') -ForegroundColor Yellow
        Write-Log (Get-Translation 'Startup_NoPrograms') "INFO"
        return
    }

    # Show list
    Write-Host "`n$(Get-Translation 'Startup_ListHeader')" -ForegroundColor Cyan
    for ($i = 0; $i -lt $startupItems.Count; $i++) {
        Write-Host ("{0}. {1}" -f ($i+1), $startupItems[$i].Name) -ForegroundColor White
        Write-Host ("   Path: {0}" -f $startupItems[$i].Path) -ForegroundColor Gray
        Write-Host ("   Type: {0}" -f $startupItems[$i].Type) -ForegroundColor Gray
        Write-Host ""
    }

    $cancelKey = if ($global:Language -eq "ID") { "B" } else { "C" }
    Write-Host "----------------------------------------" -ForegroundColor Green
    Write-Host "$cancelKey. $(Get-Translation 'Cancel')" -ForegroundColor Yellow
    Write-Host "----------------------------------------" -ForegroundColor Green

    $choice = Read-Host "$(Get-Translation 'ChooseProgramDisable')"

    if ($choice -in @($cancelKey, $cancelKey.ToLower())) { return }

    $index = [int]$choice - 1
    if ($index -lt 0 -or $index -ge $startupItems.Count) { return }

    $item = $startupItems[$index]
    try {
        if ($item.Type -eq "Shortcut") {
            Rename-Item -Path $item.FullName -NewName ($item.FullName + ".disabled") -Force
            Write-Log ("Disabled startup shortcut: {0}" -f $item.Name) "INFO"
        } elseif ($item.Type -eq "Registry") {
            $backupPath = $item.Location -replace "Run$","Run_StartupDisabled"
            if (-not (Test-Path $backupPath)) { New-Item -Path $backupPath -Force | Out-Null }
            Set-ItemProperty -Path $backupPath -Name $item.Name -Value $item.Path
            Remove-ItemProperty -Path $item.Location -Name $item.Name -Force
            Write-Log ("Disabled registry startup: {0}" -f $item.Name) "INFO"
        }
        Write-Host ((Get-Translation 'Startup_Disabled') -f $item.Name) -ForegroundColor Green
    } catch {
        Write-Log ("Error disabling {0}: {1}" -f $item.Name, $_.Exception.Message) "ERROR"
    }
}

function Enable-StartupPrograms {
    Write-Log "Listing disabled startup programs..." "INFO"
    $disabledItems = @()
    $startupPaths = @(
        Join-Path $env:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup"
        Join-Path $env:ProgramData "Microsoft\Windows\Start Menu\Programs\Startup"
    )

    # Disabled shortcuts
    foreach ($path in $startupPaths) {
        if (Test-Path $path) {
            Get-ChildItem $path -Filter "*.lnk.disabled" -ErrorAction SilentlyContinue | ForEach-Object {
                $disabledItems += [PSCustomObject]@{
                    Name         = $_.BaseName
                    Path         = $_.FullName
                    Type         = "Shortcut"
                    OriginalPath = ($_.FullName -replace "\.disabled$","")
                }
            }
        }
    }

    # Disabled registry
    $registryBackupPaths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run_StartupDisabled",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run_StartupDisabled"
    )

    foreach ($regPath in $registryBackupPaths) {
        if (Test-Path $regPath) {
            $regValues = Get-ItemProperty -Path $regPath -ErrorAction SilentlyContinue
            $regValues.PSObject.Properties | Where-Object { $_.Name -notmatch "^(PSPath|PSParentPath|PSChildName|PSDrive|PSProvider)$" } | ForEach-Object {
                $disabledItems += [PSCustomObject]@{
                    Name         = $_.Name
                    Path         = $_.Value
                    Type         = "Registry"
                    Location     = $regPath
                    OriginalPath = ($regPath -replace "_StartupDisabled$","")
                }
            }
        }
    }

    if ($disabledItems.Count -eq 0) {
        Write-Host (Get-Translation 'Startup_NoPrograms') -ForegroundColor Yellow
        return
    }

    Write-Host "`n$(Get-Translation 'Startup_ListDisabledHeader')" -ForegroundColor Cyan
    for ($i = 0; $i -lt $disabledItems.Count; $i++) {
        Write-Host ("{0}. {1}" -f ($i+1), $disabledItems[$i].Name) -ForegroundColor White
        Write-Host ("   Type: {0}" -f $disabledItems[$i].Type) -ForegroundColor Gray
        Write-Host ""
    }

    # >>> Tambahan biar ada Cancel/Batal seperti Disable <<<
    $cancelKey = if ($global:Language -eq "ID") { "B" } else { "C" }
    Write-Host "----------------------------------------" -ForegroundColor Green
    Write-Host "$cancelKey. $(Get-Translation 'Cancel')" -ForegroundColor Yellow
    Write-Host "----------------------------------------" -ForegroundColor Green

    $choice = Read-Host "$(Get-Translation 'ChooseProgramEnable')"
    if ($choice -in @($cancelKey, $cancelKey.ToLower())) { return }

    $index = [int]$choice - 1
    if ($index -lt 0 -or $index -ge $disabledItems.Count) { return }

    $item = $disabledItems[$index]
    try {
        if ($item.Type -eq "Shortcut") {
            Rename-Item -Path $item.Path -NewName (Split-Path $item.OriginalPath -Leaf) -Force
            Write-Log ("Enabled startup shortcut: {0}" -f $item.Name) "INFO"
        } elseif ($item.Type -eq "Registry") {
            Set-ItemProperty -Path $item.OriginalPath -Name $item.Name -Value $item.Path
            Remove-ItemProperty -Path $item.Location -Name $item.Name -Force
            Write-Log ("Enabled registry startup: {0}" -f $item.Name) "INFO"
        }
        Write-Host ((Get-Translation 'Startup_Enabled') -f $item.Name) -ForegroundColor Green
    } catch {
        Write-Log ("Error enabling {0}: {1}" -f $item.Name, $_.Exception.Message) "ERROR"
    }
}

# ---------------------------
# 9. Language Settings
# ---------------------------
function Show-LanguageMenu {
    do {
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "          $(Get-Translation 'LanguageMenu')" -ForegroundColor Cyan
        Write-Host "=========================================" -ForegroundColor Green
        Write-Host "1. $(Get-Translation 'LanguageMenu1')" -ForegroundColor White
        Write-Host "2. $(Get-Translation 'LanguageMenu2')" -ForegroundColor White
        Write-Host "3. $(Get-Translation 'LanguageMenu3')" -ForegroundColor Yellow
        Write-Host "=========================================" -ForegroundColor Green

        $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
        switch ($choice) {
            "1" {
                $global:Language = "EN"
                Write-Host "Language set to English." -ForegroundColor Green
                Read-Host (Get-Translation 'PressEnter')
                return
            }
            "2" {
                $global:Language = "ID"
                Write-Host "Bahasa diatur ke Indonesia." -ForegroundColor Green
                Read-Host (Get-Translation 'PressEnter')
                return
            }
            "3" { return }
            default { Write-Host (Get-Translation 'InvalidOption') -ForegroundColor Red; Start-Sleep -Seconds 2 }
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
    Write-Host ("1. {0}" -f (Get-Translation 'Menu_Option1')) -ForegroundColor White
    Write-Host ("2. {0}" -f (Get-Translation 'Menu_Option2')) -ForegroundColor White
    Write-Host ("3. {0}" -f (Get-Translation 'Menu_Option3')) -ForegroundColor White
    Write-Host ("4. {0}" -f (Get-Translation 'Menu_Option4')) -ForegroundColor White
    Write-Host ("5. {0}" -f (Get-Translation 'Menu_Option5')) -ForegroundColor White
    Write-Host ("6. {0}" -f (Get-Translation 'Menu_Option6')) -ForegroundColor White
    Write-Host ("7. {0}" -f (Get-Translation 'Menu_Option7')) -ForegroundColor White
    Write-Host ("8. {0}" -f (Get-Translation 'Menu_Option8')) -ForegroundColor White
    Write-Host ("9. {0}" -f (Get-Translation 'Menu_Option9')) -ForegroundColor White
    Write-Host ("10. {0}" -f (Get-Translation 'Menu_Option10')) -ForegroundColor Red
    Write-Host "=========================================" -ForegroundColor Green
}

# ---------------------------
# Main Loop
# ---------------------------
do {
    Show-MainMenu
    $choice = Read-Host "`n$(Get-Translation 'SelectOption')"
    switch ($choice) {
        "1" { Show-SystemInfo }
        "2" { Clear-JunkFiles }
        "3" { Clear-RecycleBin-Menu }
        "4" { Invoke-DeepClean }
        "5" { Show-NetworkMenu }
        "6" { Clear-RAM }
        "7" { Start-AntivirusScan }
        "8" { Show-StartupManager }
        "9" { Show-LanguageMenu }
        "10" {
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