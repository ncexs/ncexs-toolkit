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
    Border      = 'DarkGray'
    Title       = 'Cyan'
    Section     = 'White'
    MenuNumber  = 'DarkCyan'
    MenuText    = 'Gray'    
    Highlight   = 'White'
    Special     = 'Magenta'
    Prompt      = 'Cyan'
    Success     = 'Green'
    Error       = 'Red'
    Warning     = 'Yellow'
    Info        = 'DarkGray'
    Exit        = 'Red'
    AsciiArt    = 'Cyan'
}

try { $Host.PrivateData.PromptForegroundColor = $global:Theme.Prompt } catch {}

$global:Translations = @{
    "EN" = @{
        "Menu_Title" = "ncexs Toolkit (Test Build)"
        "Menu_Option0" = "Compact OS (Save 2-5GB Space)"
        "Menu_Option1" = "System Information"
        "Menu_Option2" = "Enhanced Junk Cleaner"
        "Menu_Option3" = "Empty Recycle Bin"
        "Menu_Option4" = "Open Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"
        "Menu_Option6" = "Network Repair"
        "Menu_Option7" = "Power & Battery Utilities"
        "Menu_Option8" = "Memory Optimizer"
        "Menu_Option9" = "Defrag & Optimize Drives"
        "Menu_Option10" = "System Health Checker"
        "Menu_Option11" = "Updates & Drivers Center"
        "Menu_Option12" = "DNS Changer"
        "Menu_Option13" = "Wi-Fi Password Recovery"
        "Menu_Option14" = "Visual FX Booster (Smooth UI)"
        "Menu_Option15" = "Exit"
        "SubMenu_Power" = "POWER & BATTERY"
        "SubMenu_Power1" = "Change Power Plan"
        "SubMenu_Power2" = "Generate Battery Report"
        "SubMenu_Power3" = "Back"
        "SubMenu_Update" = "UPDATES & DRIVERS CENTER"
        "Power_Prompt"   = "Change Power Plan?"
        "Power_Options"  = "[1] Saver | [2] Balanced | [3] High"
        "Power_Success"  = "Power plan updated."
        "Battery_Prompt" = "Generate battery report?"
        "Battery_Gen"    = "Generating HTML report..."
        "PressAnyKey" = "Press any key to continue..."
        "InvalidOption" = "Invalid option. Please try again."
        "ExitMessage" = "Exiting Toolkit. Have a productive day!"
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
        "System_Title" = "SYSTEM INFORMATION"
        "Uninstall_Title" = "SMART UNINSTALLER"
        "Uninstall_Scanning" = "Scanning installed programs..."
        "Uninstall_Found" = "Database loaded: {0} programs found."
        "Uninstall_Prompt" = "Enter app name/initial:"
        "Uninstall_FoundMultiple" = "Matches found:"
        "Uninstall_Confirm" = "Uninstall this program?"
        "Clean_Title" = "ENHANCED JUNK CLEANER"
        "Clean_Confirm" = "Clean temp files & browser cache?"
        "Update_Title"  = "WINDOWS UPDATE FIXER"
        "Update_Warn"   = "Reset Update Services?"
        "Confirm_Action" = "Are you sure you want to proceed?"
        "YesNo" = "(Y/N)"
        "Compact_Title" = "COMPACT OS (SYSTEM COMPRESSION)"
        "Compact_Info1" = "This feature compresses Windows system binaries."
        "Compact_Info2" = "100% Safe. Can save 2GB - 5GB of disk space."
        "Compact_Info3" = "Process may take 5-10 minutes."
        "Compact_Confirm" = "Run Compact OS Compression?"
        "Compact_Done"  = "Compression complete. Check your C: drive space."
        "Wifi_Title" = "WI-FI PASSWORD RECOVERY"
        "Wifi_Scanning" = "Scanning saved profiles..."
        "Visual_Title" = "VISUAL FX BOOSTER"
        "Visual_Info" = "Disable animations for a snappier feel."
        "Visual_Prompt" = "Choose Mode"
    };
    "ID" = @{
        "Menu_Title" = "ncexs Toolkit (Test Build)"
        "Menu_Option0" = "Compact OS (Hemat 2-5GB Space)"
        "Menu_Option1" = "Informasi Sistem"
        "Menu_Option2" = "Pembersih Sampah (Enhanced)"
        "Menu_Option3" = "Kosongkan Recycle Bin"
        "Menu_Option4" = "Buka Disk Cleanup"
        "Menu_Option5" = "Smart Uninstaller"
        "Menu_Option6" = "Perbaikan Jaringan"
        "Menu_Option7" = "Utilitas Daya & Baterai"
        "Menu_Option8" = "Optimasi Memori"
        "Menu_Option9" = "Defragment & Optimasi Drive"
        "Menu_Option10" = "Pemeriksa Kesehatan Sistem"
        "Menu_Option11" = "Pusat Update & Driver"
        "Menu_Option12" = "Pengubah DNS"
        "Menu_Option13" = "Wi-Fi Password Recovery"
        "Menu_Option14" = "Visual FX Booster (Smooth UI)"
        "Menu_Option15" = "Keluar"
        "SubMenu_Power" = "UTILITAS DAYA & BATERAI"
        "SubMenu_Power1" = "Ubah Rencana Daya (Power Plan)"
        "SubMenu_Power2" = "Buat Laporan Kesehatan Baterai"
        "SubMenu_Power3" = "Kembali"
        "SubMenu_Update" = "PUSAT UPDATE & DRIVER"
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
        "System_Title" = "INFORMASI SISTEM"
        "Uninstall_Title" = "SMART UNINSTALLER"
        "Uninstall_Scanning" = "Memindai program terinstal..."
        "Uninstall_Found" = "Database dimuat: {0} program ditemukan."
        "Uninstall_Prompt" = "Ketik inisial/nama aplikasi:"
        "Uninstall_FoundMultiple" = "Aplikasi ditemukan:"
        "Uninstall_Confirm" = "Jalankan uninstaller untuk program ini?"
        "Clean_Title" = "PEMBERSIH SAMPAH (ENHANCED)"
        "Clean_Confirm" = "Bersihkan file temp & cache browser?"
        "Update_Title"  = "PERBAIKAN WINDOWS UPDATE"
        "Update_Warn"   = "Reset Layanan Update?"
        "Confirm_Action" = "Apakah Anda yakin ingin melanjutkan?"
        "YesNo" = "(Y/T)"
        "Compact_Title" = "COMPACT OS (KOMPRESI SISTEM)"
        "Compact_Info1" = "Fitur ini memadatkan file sistem Windows (Binary Compression)."
        "Compact_Info2" = "100% Aman. Bisa menghemat 2GB - 5GB ruang disk."
        "Compact_Info3" = "Proses mungkin memakan waktu 5-10 menit."
        "Compact_Confirm" = "Jalankan Kompresi Compact OS?"
        "Compact_Done"  = "Selesai! Cek Free Space drive C anda."
        "Wifi_Title" = "WI-FI PASSWORD RECOVERY"
        "Wifi_Scanning" = "Memindai profil tersimpan..."
        "Visual_Title" = "VISUAL FX BOOSTER"
        "Visual_Info" = "Mematikan animasi Windows agar terasa instan & ringan."
        "Visual_Prompt" = "Pilih Mode"
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

function Request-Confirm {
    param([string]$msg)
    $yn = Get-Translation "YesNo"
    $c = Read-Host " $msg $yn"
    if ($c -match '^(Y|y|T|t)$') {
        if ($global:Language -eq "ID") { return $c -eq 'Y' }
        return $c -eq 'Y'
    }
    return $false
}

function Show-Intro {
    Clear-Host
    Write-Host ""
    Write-Centered "    _  __ ____ ______ _  __ _____" "Cyan"
    Write-Centered "  / |/ // __// ____/| |/_// ___/" "Cyan"
    Write-Centered " /    // /__/ __/  _>  < (__  ) " "Cyan"
    Write-Centered "/_/|_/ \___/_____//_/|_|/____/  " "Cyan"
    Write-Host ""
    Write-Centered "T E S T    B U I L D" "DarkCyan"
    Write-Host ""
    
    $modules = @("Kernel", "UI", "Network", "Disk", "Security")
    foreach ($m in $modules) {
        Write-Host " [INIT] Loading module: $m..." -ForegroundColor DarkGray
        Start-Sleep -Milliseconds 50
    }
    Start-Sleep -Milliseconds 200
}

function Invoke-CompactOS {
    Clear-Host
    Write-Title (Get-Translation 'Compact_Title')
    Write-Host ""
    Write-Info (Get-Translation 'Compact_Info1')
    Write-Info (Get-Translation 'Compact_Info2')
    Write-Host (" " + (Get-Translation 'Compact_Info3')) -ForegroundColor Yellow
    Write-Host ""
    
    Write-Host " Memeriksa status..." -NoNewline -ForegroundColor DarkGray
    $rawStatus = compact.exe /CompactOS:query
    $statusDisplay = "Tidak Diketahui"
    $statColor = "White"
    
    if ($rawStatus -match "not in the Compact state") {
        $statusDisplay = "Normal (Belum Dikompresi)"
        $statColor = "Yellow"
    } elseif ($rawStatus -match "is in the Compact state") {
        $statusDisplay = "Aktif (Sudah Dikompresi)"
        $statColor = "Green"
    }
    
    Write-Host " Selesai." -ForegroundColor Green
    Write-Host " Status Saat Ini: $statusDisplay" -ForegroundColor $statColor
    Write-Host ""

    if (Request-Confirm (Get-Translation 'Compact_Confirm')) {
        Write-Host ""
        Write-Host " Sedang mengompresi... (Jangan tutup jendela ini)" -ForegroundColor Cyan
        $tempLog = "$env:TEMP\compact_log.txt"
        $proc = Start-Process "compact.exe" -ArgumentList "/CompactOS:always" -NoNewWindow -Wait -PassThru -RedirectStandardOutput $tempLog
        if ($proc.ExitCode -eq 0) {
            Write-Success (Get-Translation 'Compact_Done')
        } else {
            Write-Error "Gagal mengaktifkan Compact OS."
        }
        Remove-Item $tempLog -ErrorAction SilentlyContinue
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-SystemInfo {
    Clear-Host
    Write-Title (Get-Translation 'System_Title')
    Write-Progress -Activity "Collecting System Data" -Status "Querying WMI/CIM..." -PercentComplete 0
    try {
        $os = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop
        $system = Get-CimInstance -ClassName Win32_ComputerSystem -ErrorAction Stop
        $cpu = Get-CimInstance -ClassName Win32_Processor -ErrorAction Stop
        $gpus = Get-CimInstance -ClassName Win32_VideoController -ErrorAction SilentlyContinue
        $bios = Get-CimInstance -ClassName Win32_BIOS -ErrorAction SilentlyContinue

        Write-Host "`n [ System Details ]" -ForegroundColor $global:Theme.Section
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "Hostname"), $env:COMPUTERNAME) -ForegroundColor $global:Theme.MenuText
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "OS"), $os.Caption) -ForegroundColor $global:Theme.MenuText
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "Version"), $os.Version) -ForegroundColor $global:Theme.MenuText
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "CPU"), $cpu.Name.Trim()) -ForegroundColor $global:Theme.MenuText
        
        foreach ($gpu in $gpus) {
            Write-Host ("   {0,-20} : {1}" -f (Get-Translation "GPU"), $gpu.Name) -ForegroundColor $global:Theme.MenuText
        }
        
        $totalMemory = [math]::Round($system.TotalPhysicalMemory / 1GB, 2)
        $freeMemory = [math]::Round($os.FreePhysicalMemory / 1MB / 1024, 2)
        Write-Host ("   {0,-20} : {1} GB ({2} GB {3})" -f (Get-Translation "RAM"), $totalMemory, $freeMemory, (Get-Translation "Free")) -ForegroundColor $global:Theme.MenuText
        Write-Host ("   {0,-20} : {1}" -f (Get-Translation "SerialNumber"), $bios.SerialNumber) -ForegroundColor $global:Theme.MenuText
        
        Write-Host "`n [ Storage ]" -ForegroundColor $global:Theme.Section
        $disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3"
        foreach ($disk in $disks) {
            $free = [math]::Round($disk.FreeSpace / 1GB, 2)
            $total = [math]::Round($disk.Size / 1GB, 2)
            Write-Host ("   [{0}] {1} GB Total - {2} GB {3}" -f $disk.DeviceID, $total, $free, (Get-Translation "Free")) -ForegroundColor $global:Theme.Info
        }
    } catch { 
        Write-Error (Get-Translation "System_Error") 
    }
    Write-Progress -Activity "Collecting System Data" -Status "Done" -Completed
    Write-Host "`n"
    Read-Host " $(Get-Translation 'PressAnyKey')"
}

function Clear-JunkFiles {
    Clear-Host
    Write-Title (Get-Translation 'Clean_Title')
    if (-not (Request-Confirm (Get-Translation 'Clean_Confirm'))) { return }

    $totalFreed = 0
    $cleanTargets = @(
        @{Name="Chrome"; Path="$env:LOCALAPPDATA\Google\Chrome\User Data"; Type="Browser"},
        @{Name="Edge";   Path="$env:LOCALAPPDATA\Microsoft\Edge\User Data"; Type="Browser"},
        @{Name="Brave";  Path="$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data"; Type="Browser"},
        @{Name="AMD Cache";    Path="$env:LOCALAPPDATA\AMD\DxCache"; Type="Driver"},
        @{Name="NVIDIA Cache"; Path="$env:LOCALAPPDATA\NVIDIA\GLCache"; Type="Driver"},
        @{Name="Intel Cache";  Path="$env:LOCALAPPDATA\Intel\ShaderCache"; Type="Driver"},
        @{Name="Win Update";   Path="$env:SystemRoot\SoftwareDistribution\Download"; Type="System"},
        @{Name="Sys Temp";     Path="$env:SystemRoot\Temp"; Type="System"},
        @{Name="User Temp";    Path="$env:TEMP"; Type="System"},
        @{Name="Prefetch";     Path="$env:SystemRoot\Prefetch"; Type="System"}
    )

    foreach ($target in $cleanTargets) {
        Write-Progress -Activity "Cleaning System" -Status "Checking $($target.Name)..." 
        if (Test-Path $target.Path) {
            $subPaths = if ($target.Type -eq "Browser") {
                @("$($target.Path)\*\Cache\*", "$($target.Path)\*\Code Cache\*", "$($target.Path)\*\GPUCache\*")
            } else { @("$($target.Path)\*") }

            foreach ($path in $subPaths) {
                try {
                    $files = Get-ChildItem -Path $path -Recurse -Force -ErrorAction SilentlyContinue
                    if ($files) {
                        $currentSize = ($files | Measure-Object -Property Length -Sum).Sum
                        $files | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
                        if ($currentSize -gt 0) {
                            $totalFreed += $currentSize
                            Write-Host " [✓] Cleaned $($target.Name): $([math]::Round($currentSize/1MB, 2)) MB" -ForegroundColor DarkGray
                        }
                    }
                } catch {}
            }
        }
    }
    Write-Progress -Activity "Cleaning System" -Status "Done" -Completed
    Write-Success "`n Cleanup complete. Total Freed: $([math]::Round($totalFreed / 1MB, 2)) MB"
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Clear-RecycleBin-Menu {
    Clear-Host; Write-Title "Recycle Bin"
    if (-not (Request-Confirm (Get-Translation 'Confirm_Action'))) { return }
    try { Clear-RecycleBin -Force -ErrorAction Stop; Write-Success "Recycle Bin Emptied." } catch { Write-Info "Already empty." }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Open-DiskCleanup { 
    if (Request-Confirm "Buka Disk Cleanup Utility?") { Start-Process "cleanmgr.exe" }
}

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
        Write-Host " [ENTER] Kembali ke Menu Utama" -ForegroundColor DarkGray
        $search = Read-Host " $(Get-Translation 'Uninstall_Prompt')"
        
        if ([string]::IsNullOrWhiteSpace($search)) { return }
        
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
            $selection = Read-Host " Pilih nomor (atau Enter untuk batal)"
            if ([string]::IsNullOrWhiteSpace($selection)) { continue }
            
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

function Invoke-NetworkRepair {
    Clear-Host; Write-Title "Network Repair"
    if (-not (Request-Confirm (Get-Translation 'Confirm_Action'))) { return }
    Write-Progress -Activity "Network Repair" -Status "Running commands..."
    ipconfig /release; ipconfig /renew; ipconfig /flushdns; netsh winsock reset; netsh int ip reset | Out-Null
    Write-Success "Network settings repaired. Restart recommended."
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-PowerMenu {
    do {
        Clear-Host; Write-Title (Get-Translation 'SubMenu_Power')
        Write-Host "`n [1] $(Get-Translation 'SubMenu_Power1')"
        Write-Host " [2] $(Get-Translation 'SubMenu_Power2')"
        Write-Host " [3] $(Get-Translation 'SubMenu_Power3')" -ForegroundColor $global:Theme.Exit
        $c = Read-Host "`n $(Get-Translation 'SelectOption')"
        if ($c -eq "1") { 
             Write-Host "`n $(Get-Translation 'Power_Options')"
             $p = Read-Host " $(Get-Translation 'SelectOption')"
             if ($p -eq "1") { powercfg /s a1841308-3541-4fab-bc81-f71556f20b4a } 
             elseif ($p -eq "3") { powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c } 
             else { powercfg /s 381b4222-f694-41f0-9685-ff5bb260df2e }
             Write-Success (Get-Translation 'Power_Success')
        } elseif ($c -eq "2") {
             $path = "$env:USERPROFILE\Desktop\battery_report.html"
             powercfg /batteryreport /output "$path" /duration 1 | Out-Null
             Invoke-Item $path
        } elseif ($c -eq "3") { return }
        Read-Host "`n $(Get-Translation 'PressAnyKey')"
    } while ($true)
}

function Clear-RAM {
    Clear-Host; Write-Title "Memory Optimizer"
    $code = @"
    using System; using System.Runtime.InteropServices;
    public class M { [DllImport("psapi.dll")] public static extern bool EmptyWorkingSet(IntPtr h);
    public static void C() { foreach(var p in System.Diagnostics.Process.GetProcesses()) try { EmptyWorkingSet(p.Handle); } catch {} } }
"@
    Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue
    [M]::C(); [System.GC]::Collect()
    Write-Success "Memory optimized."
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Invoke-Defragment {
    do {
        Clear-Host; Write-Title "Optimize Drives"
        $vols = Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' -and $_.DriveLetter }
        $count = 0
        foreach ($v in $vols) { $count++; Write-Host " [$count] Drive ($($v.DriveLetter):)" }
        $backOpt = $count + 1
        Write-Host " [$backOpt] Kembali" -ForegroundColor Red
        $c = Read-Host "`n $(Get-Translation 'SelectOption')"
        if ($c -eq $backOpt -or -not $c) { return }
        if ($c -le $count) { Optimize-Volume -DriveLetter $vols[$c-1].DriveLetter -Verbose }
        Read-Host "`n $(Get-Translation 'PressAnyKey')"
    } while ($true)
}

function Show-SystemHealthMenu {
    Clear-Host; Write-Title "Health Check"
    Write-Host "`n [1] SFC Scan`n [2] DISM Repair`n [3] Back"
    $c = Read-Host "`n $(Get-Translation 'SelectOption')"
    if ($c -eq "1") { sfc /scannow }
    elseif ($c -eq "2") { dism /online /cleanup-image /restorehealth }
    Read-Host "`n Done."
}

function Invoke-DriverBackup {
    Clear-Host; Write-Title "DRIVER BACKUP UTILITY"
    Write-Host "`n [1] FULL BACKUP (Semua Driver)`n [2] THIRD-PARTY ONLY (Rekomendasi)`n [3] Kembali"
    $type = Read-Host "`n $(Get-Translation 'SelectOption')"
    if ($type -eq "3" -or [string]::IsNullOrWhiteSpace($type)) { return }
    $dest = "C:\DriversBackup"
    if (Request-Confirm "Backup ke $dest?") {
        try {
            if (!(Test-Path $dest)) { New-Item $dest -ItemType Directory -Force | Out-Null }
            if ($type -eq "1") { 
                Export-WindowsDriver -Online -Destination $dest -ErrorAction Stop 
            } else {
                $oem = Get-WindowsDriver -Online -All | Where-Object { $_.Inbox -eq $false }
                foreach ($d in $oem) {
                    $src = Split-Path $d.OriginalFileName -Parent
                    $tgt = Join-Path $dest (Split-Path $src -Leaf)
                    if (!(Test-Path $tgt)) { New-Item $tgt -ItemType Directory -Force | Out-Null }
                    Copy-Item "$src\*" $tgt -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
            Write-Success "Backup selesai."; Start-Process explorer.exe $dest
        } catch { Write-Error "Gagal." }
    }
}

function Invoke-WindowsUpdateFix {
    Clear-Host; Write-Title (Get-Translation 'Update_Title')
    if (-not (Request-Confirm (Get-Translation 'Update_Warn'))) { return }
    $s = @("wuauserv", "bits", "cryptSvc", "msiserver")
    foreach ($n in $s) { 
        Stop-Service $n -Force -ErrorAction SilentlyContinue
        if ((Get-Service $n).Status -ne "Stopped") { taskkill /f /fi "SERVICES eq $n" /t | Out-Null }
    }
    Remove-Item "$env:SystemRoot\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$env:SystemRoot\System32\catroot2" -Recurse -Force -ErrorAction SilentlyContinue
    foreach ($n in $s) { Start-Service $n -ErrorAction SilentlyContinue }
    Write-Success "Done."
}

function Show-UpdateDriverMenu {
    do {
        Clear-Host; Write-Title (Get-Translation 'SubMenu_Update')
        Write-Host "`n [1] Winget Update`n [2] Backup Drivers`n [3] WU Fixer`n [4] Kembali"
        $c = Read-Host "`n $(Get-Translation 'SelectOption')"
        switch ($c) {
            "1" { winget upgrade --all --silent --include-unknown --accept-package-agreements --accept-source-agreements --force }
            "2" { Invoke-DriverBackup }
            "3" { Invoke-WindowsUpdateFix }
            "4" { return }
        }
        if ($c -ne "4") { Read-Host "`n $(Get-Translation 'PressAnyKey')" }
    } while ($true)
}

function Invoke-WifiGrabber {
    Clear-Host; Write-Title (Get-Translation "Wifi_Title")
    $p = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
    if (-not $p) { Write-Error "Not found."; return }
    Write-Host ""
    foreach ($n in $p) {
        $r = netsh wlan show profile name="$n" key=clear
        $l = $r | Select-String "Key Content|Konten Kunci"
        $v = if ($l) { $l.ToString().Split(":")[1].Trim() } else { "Open/No Pass" }
        Write-Host " SSID: " -NoNewline -ForegroundColor Cyan
        Write-Host ("{0,-30}" -f $n) -NoNewline
        Write-Host " -> " -NoNewline -ForegroundColor DarkGray
        Write-Host "$v" -ForegroundColor Yellow
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-DNSMenu {
    Clear-Host; Write-Title "DNS Changer"
    Write-Host "`n [1] Google`n [2] Cloudflare`n [3] Auto`n [4] Back"
    $choice = Read-Host "`n $(Get-Translation 'SelectOption')"
    if ($choice -eq "4") { return }
    $adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1
    switch ($choice) {
        "1" { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("8.8.8.8","8.8.4.4") }
        "2" { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("1.1.1.1","1.0.0.1") }
        "3" { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ResetServerAddresses }
    }
    Write-Success "DNS Updated."
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Invoke-WifiGrabber {
    Clear-Host; Write-Title (Get-Translation "Wifi_Title")
    Write-Info (Get-Translation "Wifi_Scanning")
    
    $profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { 
        $_.ToString().Split(":")[1].Trim() 
    }
    
    if (-not $profiles) { 
        Write-Error "No Wi-Fi profiles found."
        Read-Host "`n $(Get-Translation 'PressAnyKey')"
        return 
    }

    Write-Host ""
    foreach ($p in $profiles) {
        $res = netsh wlan show profile name="$p" key=clear
        
        $keyLine = $res | Select-String "Key Content|Konten Kunci"
        
        if ($keyLine) {
            $pass = $keyLine.ToString().Split(":")[1].Trim()
        } else {
            $pass = "(Open / No Password)"
        }
        
        Write-Host " SSID: " -NoNewline -ForegroundColor Cyan
        Write-Host ("{0,-30}" -f $p) -NoNewline -ForegroundColor White
        Write-Host " -> " -NoNewline -ForegroundColor DarkGray
        Write-Host "$pass" -ForegroundColor Yellow
    }
    
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Invoke-VisualPerf {
    Clear-Host; Write-Title (Get-Translation "Visual_Title")
    Write-Host "`n [1] BOOST`n [2] DEFAULT`n [3] Back"
    $c = Read-Host "`n $(Get-Translation 'SelectOption')"
    if ($c -eq "1") {
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value 0
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value 0
        Write-Success "Optimized. Restart needed."
    } elseif ($c -eq "2") {
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value 400
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value 1
        Write-Success "Restored."
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-MainMenu {
    Clear-Host
    $w = 86
    $line = "═" * ($w - 2)
    Write-Host ("╔" + $line + "╗") -ForegroundColor $global:Theme.Border
    Write-Centered "    _  __ ____ ______ _  __ _____" $global:Theme.AsciiArt $w
    Write-Centered "  / |/ // __// ____/| |/_// ___/" $global:Theme.AsciiArt $w
    Write-Centered " /    // /__/ __/  _>  < (__  ) " $global:Theme.AsciiArt $w
    Write-Centered "/_/|_/ \___/_____//_/|_|/____/  " $global:Theme.AsciiArt $w
    Write-Host ""
    Write-Centered (Get-Translation 'Menu_Title') $global:Theme.Title $w
    Write-Host ("╠" + $line + "╣") -ForegroundColor $global:Theme.Border
    Write-Host "║ " -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host "[0] " -NoNewline -ForegroundColor $global:Theme.Special
    Write-Host ("{0,-79}" -f (Get-Translation 'Menu_Option0')) -NoNewline -ForegroundColor $global:Theme.Special
    Write-Host "║" -ForegroundColor $global:Theme.Border
    Write-Host ("╠" + $line + "╣") -ForegroundColor $global:Theme.Border

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
        Write-Host (" {0,-35}" -f $l.T) -NoNewline -ForegroundColor $global:Theme.MenuText
        Write-Host "│ " -NoNewline -ForegroundColor $global:Theme.Border
        Write-Host ("[{0,-2}]" -f $r.N) -NoNewline -ForegroundColor $global:Theme.MenuNumber
        Write-Host (" {0,-36}" -f $r.T) -NoNewline -ForegroundColor $global:Theme.MenuText
        Write-Host "║" -ForegroundColor $global:Theme.Border
    }
    Write-Host ("╠" + $line + "╣") -ForegroundColor $global:Theme.Border
    Write-Host "║ " -NoNewline -ForegroundColor $global:Theme.Border
    Write-Host "[15]" -NoNewline -ForegroundColor $global:Theme.Exit
    Write-Host (" {0,-78}" -f (Get-Translation 'Menu_Option15')) -NoNewline -ForegroundColor $global:Theme.Exit
    Write-Host "║" -ForegroundColor $global:Theme.Border
    Write-Host ("╚" + $line + "╝") -ForegroundColor $global:Theme.Border
    Write-Centered "Hostname: $env:COMPUTERNAME | User: $env:USERNAME" "DarkGray" $w
}

Show-Intro
do {
    Show-MainMenu
    $choice = Read-Host " $(Get-Translation 'SelectOption')"
    switch ($choice) {
        "0"  { Invoke-CompactOS }
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
        "11" { Show-UpdateDriverMenu }
        "12" { Show-DNSMenu }
        "13" { Invoke-WifiGrabber }
        "14" { Invoke-VisualPerf }
        "15" { exit }
    }
} while ($true)