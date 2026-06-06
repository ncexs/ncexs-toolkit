[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    if ($MyInvocation.MyCommand.Path) {
        Write-Host "Toolkit perlu dijalankan sebagai Administrator. Meminta akses..." -ForegroundColor Yellow
        Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
        exit
    }
    else {
        Write-Host "`n[!] AKSES DITOLAK: Anda belum membuka PowerShell sebagai Administrator." -ForegroundColor Red
        Write-Host "Silakan klik kanan pada PowerShell dan pilih 'Run as Administrator', lalu jalankan ulang command-nya.`n" -ForegroundColor Yellow
        Read-Host "Tekan Enter untuk keluar..."
        exit
    }
}

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force -ErrorAction SilentlyContinue

$global:ToolkitVersion = "v3.4"
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
        "Menu_Option1" = "System Information"; "Menu_Option2" = "System Health Checker"
        "Menu_Option3" = "One-Click Maintenance"; "Menu_Option4" = "Updates & Drivers Center"
        "Menu_Option5" = "Memory Optimizer"; "Menu_Option6" = "Defrag & Optimize Drives"
        "Menu_Option7" = "Power & Battery Utilities"; "Menu_Option8" = "Visual FX Booster"
        "Menu_Option9" = "Smart Uninstaller"; "Menu_Option10" = "Remote Desktop (RDP) Manager"
        "Menu_Option11" = "Enhanced Junk Cleaner"; "Menu_Option12" = "Clear App Caches"
        "Menu_Option13" = "Clear Browser Caches"; "Menu_Option14" = "Empty Recycle Bin"
        "Menu_Option15" = "Open Disk Cleanup"; "Menu_Option16" = "Clear Event Logs"
        "Menu_Option17" = "Network Repair"; "Menu_Option18" = "DNS Changer"
        "Menu_Option19" = "Wi-Fi Password Recovery"; "Menu_Option20" = "Exit Toolkit"
        "Menu_OptionL" = "Change Language"
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
        "Compact_Option1" = "Compress OS (Save 2-5GB Space)"; "Compact_Option2" = "Decompress OS (Restore Default)"; "Compact_Option3" = "Back"
        "Compact_Decompress_Confirm" = "Restore OS to uncompressed state?"; "Compact_Decompress_Done" = "OS Decompression completed."
        "Compact_Compressing" = "Compressing..."; "Compact_Decompressing" = "Decompressing..."
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
        
        "SysInfo_Title" = "SYSTEM INFORMATION"
        "SysInfo_Option1" = "Export PC Audit Report (HTML)"
        "SysInfo_Option2" = "Open Detailed Battery Report (HTML)"
        "SysInfo_Option3" = "Check Windows License Activation"
        "SysInfo_Option4" = "Back to Main Menu"

        "Maint_License_Title" = "WINDOWS LICENSE STATUS"
        "Maint_Audit_Title" = "PC AUDIT REPORT"
        "Maint_Audit_Exporting" = "Gathering PC specifications and generating report..."
        "Maint_Audit_Success" = "Audit report successfully saved to Desktop: {0}"
        "Maint_Maint_Title" = "ONE-CLICK MAINTENANCE"
        "Maint_Maint_Confirm" = "Start automatic maintenance? (This will clean junk, flush DNS, and repair system health)"
        "Maint_Maint_Junk" = "Cleaning junk files..."
        "Maint_Maint_DNS" = "Flushing DNS Cache..."
        "Maint_Maint_SFC" = "Running System File Checker (SFC)..."
        "Maint_Maint_DISM" = "Running DISM System Image Repair..."
        "Maint_Maint_Done" = "One-Click Maintenance completed."
        "Maint_Battery_Title" = "BATTERY HEALTH CHECK"
        "Maint_Battery_Desktop" = "This system is running on a Desktop PC. No battery detected."
        "Maint_Battery_Wear" = "Battery Health: {0}% | Design Capacity: {1} mWh | Full Charge Capacity: {2} mWh"
        "Maint_RDP_Title" = "REMOTE DESKTOP MANAGER"
        "Maint_RDP_Status" = "Current RDP Status: {0}"
        "Maint_RDP_Enabled" = "ENABLED"
        "Maint_RDP_Disabled" = "DISABLED"
        "Maint_RDP_Enable_Prompt" = "Enable Remote Desktop (RDP)?"
        "Maint_RDP_Disable_Prompt" = "Disable Remote Desktop (RDP)?"
        "Maint_RDP_Enable_Success" = "Enable Remote Desktop (RDP) has been enabled and firewall rules configured."
        "Maint_RDP_Disable_Success" = "Remote Desktop (RDP) has been disabled."
        "Maint_Browser_Title" = "BROWSER CACHE CLEANER"
        "Maint_Browser_Confirm" = "Clear caches for Google Chrome, MS Edge, and Firefox?"
        "Maint_Browser_Cleared" = "Cleared cache folder for {0}."
        "Maint_Browser_Success" = "Browser cache cleaning completed. Freed: {0} MB"
        "Maint_Option1" = "Windows License Status"
        "Maint_Option2" = "Export PC Audit Report (HTML)"
        "Maint_Option3" = "One-Click Maintenance"
        "Maint_Option4" = "Battery Health Analyzer"
        "Maint_Option5" = "Remote Desktop (RDP) Manager"
        "Maint_Option6" = "Clear Browser Caches"
        "Maint_Option7" = "Back to Main Menu"
    };
    "ID" = @{
        "Menu_Title" = "ncexs Toolkit $($global:ToolkitVersion)"; "Menu_Option0" = "Compact OS (Hemat 2-5GB Ruang)"
        "Menu_Option1" = "Informasi Sistem"; "Menu_Option2" = "Pemeriksa Kesehatan Sistem"
        "Menu_Option3" = "Pemeliharaan Satu Klik"; "Menu_Option4" = "Pusat Update & Driver"
        "Menu_Option5" = "Optimasi Memori"; "Menu_Option6" = "Defragment & Optimasi Drive"
        "Menu_Option7" = "Utilitas Daya & Baterai"; "Menu_Option8" = "Visual FX Booster"
        "Menu_Option9" = "Smart Uninstaller"; "Menu_Option10" = "Remote Desktop (RDP) Manager"
        "Menu_Option11" = "Pembersih Sampah (Enhanced)"; "Menu_Option12" = "Pembersih Cache Aplikasi"
        "Menu_Option13" = "Bersihkan Cache Browser"; "Menu_Option14" = "Kosongkan Recycle Bin"
        "Menu_Option15" = "Buka Disk Cleanup"; "Menu_Option16" = "Hapus Event Logs"
        "Menu_Option17" = "Perbaikan Jaringan"; "Menu_Option18" = "Pengubah DNS"
        "Menu_Option19" = "Wi-Fi Password Recovery"; "Menu_Option20" = "Keluar Aplikasi"
        "Menu_OptionL" = "Ubah Bahasa"
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
        "Compact_Option1" = "Kompres OS (Hemat 2-5GB Ruang)"; "Compact_Option2" = "Dekompres OS (Kembalikan Default)"; "Compact_Option3" = "Kembali"
        "Compact_Decompress_Confirm" = "Kembalikan OS ke kondisi tidak terkompresi?"; "Compact_Decompress_Done" = "Dekompresi OS selesai."
        "Compact_Compressing" = "Sedang mengompresi..."; "Compact_Decompressing" = "Sedang mendekampresi..."
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
        
        "SysInfo_Title" = "INFORMASI SISTEM"
        "SysInfo_Option1" = "Ekspor Laporan Audit PC (HTML)"
        "SysInfo_Option2" = "Analisis Detail Kesehatan Baterai"
        "SysInfo_Option3" = "Cek Status Lisensi Windows"
        "SysInfo_Option4" = "Kembali ke Menu Utama"
    }
}

function Get-Translation { param([string]$key) if ($global:Translations[$global:Language].ContainsKey($key)) { return $global:Translations[$global:Language][$key] } return $key }
function Write-Centered { param([string]$text, [string]$color = $global:Theme.Title, [int]$width = 80) $padLeft = [math]::Max(0, [math]::Floor(($width - $text.Length) / 2)); Write-Host (" " * $padLeft + $text) -ForegroundColor $color }
function Write-BoxHeader { param([string]$title) $w = 86; $l = [string]$global:UI.HLine * ($w - 4); Write-Host (" {0}{1}{2}" -f $global:UI.TopLeft, $l, $global:UI.TopRight) -ForegroundColor $global:Theme.Border; $cleanTitle = " $title "; $padLeft = [math]::Max(0, [math]::Floor((($w - 4) - $cleanTitle.Length) / 2)); $padRight = [math]::Max(0, (($w - 4) - $cleanTitle.Length - $padLeft)); Write-Host " $($global:UI.VLine)" -NoNewline -ForegroundColor $global:Theme.Border; Write-Host (" " * $padLeft) -NoNewline; Write-Host $cleanTitle -NoNewline -ForegroundColor $global:Theme.Title; Write-Host (" " * $padRight) -NoNewline; Write-Host "$($global:UI.VLine)" -ForegroundColor $global:Theme.Border; Write-Host (" {0}{1}{2}" -f $global:UI.BottomLeft, $l, $global:UI.BottomRight) -ForegroundColor $global:Theme.Border }
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
    Write-Host " Status: $rawStatus`n"
    
    Write-Host " [1] $(Get-Translation 'Compact_Option1')"
    Write-Host " [2] $(Get-Translation 'Compact_Option2')"
    Write-Host " [3] $(Get-Translation 'Compact_Option3')"
    Write-Host ""
    
    $c = Read-Host " $(Get-Translation 'SelectOption')"
    if ($c -eq "1") {
        if (Request-Confirm (Get-Translation 'Compact_Confirm')) { 
            Write-Host " $(Get-Translation 'Compact_Compressing')" -ForegroundColor Cyan
            compact.exe /CompactOS:always
            Write-Success (Get-Translation 'Compact_Done') 
        }
    }
    elseif ($c -eq "2") {
        if (Request-Confirm (Get-Translation 'Compact_Decompress_Confirm')) {
            Write-Host " $(Get-Translation 'Compact_Decompressing')" -ForegroundColor Cyan
            compact.exe /CompactOS:never
            Write-Success (Get-Translation 'Compact_Decompress_Done')
        }
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Show-SystemInfo {
    do {
        Clear-Host
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
                $total = [math]::Round($_.Size / 1GB, 2)
                $free = [math]::Round($_.FreeSpace / 1GB, 2)
                $usedPct = [math]::Round((($total - $free) / $total) * 100, 1)
                Write-Host "   $($_.DeviceID)\          : $total GB Total | $free GB Free | Used: $usedPct%" 
            }

            Write-Host "`n [ Battery Health ]" -ForegroundColor $global:Theme.Section
            try {
                $batteries = Get-CimInstance -ClassName Win32_Battery -ErrorAction SilentlyContinue
                if ($batteries) {
                    $reportPath = "$env:TEMP\battery-report-sysinfo.html"
                    powercfg /batteryreport /output $reportPath > $null
                    
                    foreach ($b in $batteries) {
                        Write-Host "   Name         : $($b.Name)"
                        Write-Host "   Chemistry    : $($b.Chemistry)"
                        Write-Host "   Status       : $($b.Status)"
                        
                        if (Test-Path $reportPath) {
                            $htmlContent = Get-Content -Path $reportPath -Raw
                            $designCapMatch = [regex]::Match($htmlContent, 'DESIGN CAPACITY.*?>\s*([\d,.]+)\s*mWh')
                            $fullCapMatch = [regex]::Match($htmlContent, 'FULL CHARGE CAPACITY.*?>\s*([\d,.]+)\s*mWh')
                            
                            if ($designCapMatch.Success -and $fullCapMatch.Success) {
                                $designCapVal = $designCapMatch.Groups[1].Value -replace '[.,\s]'
                                $fullCapVal = $fullCapMatch.Groups[1].Value -replace '[.,\s]'
                                $designCap = [double]$designCapVal
                                $fullCap = [double]$fullCapVal
                                
                                if ($designCap -gt 0) {
                                    $healthPct = [math]::Round(($fullCap / $designCap) * 100, 1)
                                    $blockFull = [char]0x2588
                                    $blockLight = [char]0x2591
                                    $filled = [math]::Min(10, [math]::Max(0, [int][math]::Round($healthPct / 10)))
                                    $empty = 10 - $filled
                                    $bar = ([string]$blockFull * $filled) + ([string]$blockLight * $empty)
                                    
                                    $color = "Green"
                                    if ($healthPct -lt 50.0) { $color = "Red" }
                                    elseif ($healthPct -lt 80.0) { $color = "Yellow" }
                                    
                                    Write-Host "   Health       : [" -NoNewline
                                    Write-Host $bar -NoNewline -ForegroundColor $color
                                    Write-Host "] $healthPct%"
                                    Write-Host "   Capacity     : $fullCap mWh / $designCap mWh"
                                }
                            }
                        }
                    }
                    Remove-Item $reportPath -Force -ErrorAction SilentlyContinue
                }
                else {
                    Write-Host "   No battery detected on this system (Desktop/Virtual Machine)." -ForegroundColor $global:Theme.Warning
                }
            }
            catch {
                Write-Host "   Unable to retrieve battery details." -ForegroundColor $global:Theme.Error
            }

            Write-Host "`n [ WinSAT Performance Scores ]" -ForegroundColor $global:Theme.Section
            try {
                $winsat = Get-CimInstance Win32_WinSAT -ErrorAction SilentlyContinue
                if ($winsat) {
                    $blockFull = [char]0x2588
                    $blockLight = [char]0x2591
                    $scores = @(
                        @{ Name = "Processor (CPU) "; Score = $winsat.CPUScore }
                        @{ Name = "Memory (RAM)    "; Score = $winsat.MemoryScore }
                        @{ Name = "Graphics (GPU)  "; Score = $winsat.GraphicsScore }
                        @{ Name = "Gaming Graphics "; Score = $winsat.D3DScore }
                        @{ Name = "Primary Disk    "; Score = $winsat.DiskScore }
                    )
                    
                    foreach ($s in $scores) {
                        $val = $s.Score
                        $filled = [math]::Min(10, [math]::Max(0, [int][math]::Round($val)))
                        $empty = 10 - $filled
                        $bar = ([string]$blockFull * $filled) + ([string]$blockLight * $empty)
                        
                        $color = "Green"
                        if ($val -lt 4.0) { $color = "Red" }
                        elseif ($val -lt 7.0) { $color = "Yellow" }
                        
                        Write-Host "   $($s.Name) : [" -NoNewline
                        Write-Host $bar -NoNewline -ForegroundColor $color
                        Write-Host "] $val"
                    }
                    
                    Write-Host "   ---------------------------------------"
                    $baseFilled = [math]::Min(10, [math]::Max(0, [int][math]::Round($winsat.WinSPRLevel)))
                    $baseEmpty = 10 - $baseFilled
                    $baseBar = ([string]$blockFull * $baseFilled) + ([string]$blockLight * $baseEmpty)
                    
                    $baseColor = "Green"
                    if ($winsat.WinSPRLevel -lt 4.0) { $baseColor = "Red" }
                    elseif ($winsat.WinSPRLevel -lt 7.0) { $baseColor = "Yellow" }
                    
                    Write-Host "   Base/Overall Score : [" -NoNewline
                    Write-Host $baseBar -NoNewline -ForegroundColor $baseColor
                    Write-Host "] $($winsat.WinSPRLevel) (Max 9.9)"
                }
                else {
                    Write-Host "   WinSAT assessment data not found." -ForegroundColor $global:Theme.Warning
                    Write-Host "   To generate scores, run 'winsat formal' in an Administrator command prompt." -ForegroundColor $global:Theme.Info
                }
            }
            catch {
                Write-Host "   Unable to retrieve WinSAT scores." -ForegroundColor $global:Theme.Error
            }
        }
        catch { Write-Error "Failed to load some system info." }
        
        Write-Host "`n [1] $(Get-Translation 'SysInfo_Option1')"
        Write-Host " [2] $(Get-Translation 'SysInfo_Option2')"
        Write-Host " [3] $(Get-Translation 'SysInfo_Option3')"
        Write-Host " [4] $(Get-Translation 'SysInfo_Option4')"
        Write-Host ""
        
        $c = Read-Host " $(Get-Translation 'SelectOption')"
        if ($c -eq "1") {
            Export-PCAuditReport
        }
        elseif ($c -eq "2") {
            Get-BatteryHealth
        }
        elseif ($c -eq "3") {
            Get-WindowsLicenseStatus
        }
        elseif ($c -eq "4") {
            return
        }
        else {
            Write-Warning (Get-Translation 'Invalid_Option')
            Start-Sleep -Seconds 1
        }
    } while ($true)
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
    }
    catch { 
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
    
    $typeLoaded = $false
    try {
        if ([M]) { $typeLoaded = $true }
    }
    catch {}
    
    if (-not $typeLoaded) {
        $code = "using System; using System.Runtime.InteropServices; public class M { [DllImport(`"psapi.dll`")] public static extern bool EmptyWorkingSet(IntPtr h); public static void C() { foreach(var p in System.Diagnostics.Process.GetProcesses()) try { EmptyWorkingSet(p.Handle); } catch {} } }"
        Add-Type -TypeDefinition $code -ErrorAction SilentlyContinue
    }
    
    [M]::C(); [System.GC]::Collect();
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
    }
    elseif ($c -eq "2") {
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
    
    $adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.Virtual -eq $false }
    if ($adapters.Count -eq 0 -and $c -match "^[1-5]$") { Write-Error (Get-Translation 'DNS_NoAdapter') }
    elseif ($c -eq "1") { foreach ($adapter in $adapters) { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("1.1.1.1", "1.0.0.1") }; Write-Success "DNS: Cloudflare (1.1.1.1)" }
    elseif ($c -eq "2") { foreach ($adapter in $adapters) { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("8.8.8.8", "8.8.4.4") }; Write-Success "DNS: Google (8.8.8.8)" }
    elseif ($c -eq "3") { foreach ($adapter in $adapters) { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("9.9.9.9", "149.112.112.112") }; Write-Success "DNS: Quad9 (9.9.9.9)" }
    elseif ($c -eq "4") { foreach ($adapter in $adapters) { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("94.140.14.14", "94.140.15.15") }; Write-Success "DNS: AdGuard (94.140.14.14)" }
    elseif ($c -eq "5") { foreach ($adapter in $adapters) { Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ResetServerAddresses }; Write-Success "DNS: Default (DHCP)" }
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
    
    # Instant Event Log clearing via .NET API for active logs
    $logs = Get-WinEvent -ListLog * -ErrorAction SilentlyContinue | Where-Object { $_.RecordCount -gt 0 }
    foreach ($log in $logs) {
        try {
            [System.Diagnostics.Eventing.Reader.EventLogSession]::GlobalSession.ClearLog($log.LogName)
        }
        catch {}
    }
    
    $afterSize = 0; try { $afterSize = (Get-ChildItem -Path $logPath -File -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum } catch {}
    $freed = $beforeSize - $afterSize; if ($freed -lt 0) { $freed = 0 }
    Write-Success ((Get-Translation 'Event_Done') + " Freed: $([math]::Round($freed / 1MB, 2)) MB")
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Get-WindowsLicenseStatus {
    Write-Title (Get-Translation 'Maint_License_Title')
    Write-Host ""
    try {
        $wmi = Get-CimInstance SoftwareLicensingProduct -Filter "PartialProductKey IS NOT NULL" | Select-Object -First 1
        $statusMap = @{
            0 = "Unlicensed"
            1 = "Licensed (Activated)"
            2 = "OOBGrace"
            3 = "OOTGrace"
            4 = "NonGenuineGrace"
            5 = "Notification"
            6 = "ExtendedGrace"
        }
        $statusStr = if ($wmi -and $statusMap.ContainsKey($wmi.LicenseStatus)) { $statusMap[[int]$wmi.LicenseStatus] } else { "Unknown" }
        
        Write-Host " [ License Information ]" -ForegroundColor $global:Theme.Section
        Write-Host "   Description      : $($wmi.Description)"
        Write-Host "   License Status   : $statusStr"
        if ($wmi.LicenseStatus -eq 1) {
            Write-Success "Windows is fully activated."
        }
        else {
            Write-Warning "Windows is not activated or is in grace period."
        }
        
        Write-Host "`n [ Activation Check via slmgr ]" -ForegroundColor $global:Theme.Section
        Write-Info "Running slmgr.vbs /dli to verify..."
        $slmgrOut = cscript //nologo $env:SystemRoot\System32\slmgr.vbs /dli
        if ($slmgrOut) {
            $slmgrOut | ForEach-Object { Write-Host "   $_" }
        }
    }
    catch {
        Write-Error "Failed to retrieve license details."
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Export-PCAuditReport {
    Write-Title (Get-Translation 'Maint_Audit_Title')
    Write-Info (Get-Translation 'Maint_Audit_Exporting')
    
    try {
        $computerName = $env:COMPUTERNAME
        $userName = $env:USERNAME
        
        $os = Get-CimInstance Win32_OperatingSystem
        $osName = $os.Caption
        $osVer = $os.Version
        $osArch = $os.OSArchitecture
        $installDate = $os.InstallDate.ToString("yyyy-MM-dd HH:mm:ss")
        $lastBoot = $os.LastBootUpTime.ToString("yyyy-MM-dd HH:mm:ss")
        $uptime = (Get-Date) - $os.LastBootUpTime
        $uptimeStr = "$($uptime.Days)d $($uptime.Hours)h $($uptime.Minutes)m"

        $mobo = Get-CimInstance Win32_BaseBoard
        $bios = Get-CimInstance Win32_BIOS
        $cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
        $system = Get-CimInstance Win32_ComputerSystem
        $gpu = Get-CimInstance Win32_VideoController | Select-Object -ExpandProperty Name
        
        $ramTotal = [math]::Round($system.TotalPhysicalMemory / 1GB, 2)
        $ramChips = Get-CimInstance Win32_PhysicalMemory
        $ramDetails = ""
        foreach ($chip in $ramChips) {
            $cap = [math]::Round($chip.Capacity / 1GB, 2)
            $ramDetails += "Slot: $($chip.DeviceLocator) | Speed: $($chip.Speed) MHz | Capacity: $cap GB<br>"
        }

        $disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
        $diskRows = ""
        foreach ($d in $disks) {
            $total = [math]::Round($d.Size / 1GB, 2)
            $free = [math]::Round($d.FreeSpace / 1GB, 2)
            $used = [math]::Round($total - $free, 2)
            $usedPct = [math]::Round(($used / $total) * 100, 1)
            $diskRows += "<tr><td>$($d.DeviceID)</td><td>$total GB</td><td>$free GB</td><td>$used GB ($usedPct%)</td></tr>"
        }

        $adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
        $netRows = ""
        foreach ($a in $adapters) {
            $ips = Get-NetIPAddress -InterfaceIndex $a.ifIndex | Where-Object { $_.AddressFamily -eq 'IPv4' } | Select-Object -ExpandProperty IPAddress
            $ipStr = $ips -join ", "
            $netRows += "<tr><td>$($a.Name)</td><td>$($a.MacAddress)</td><td>$ipStr</td><td>$($a.LinkSpeed)</td></tr>"
        }

        $userAccounts = Get-CimInstance Win32_UserAccount -Filter "LocalAccount=True" -ErrorAction SilentlyContinue
        $adminMembers = @()
        try {
            $adminGroup = Get-CimInstance Win32_Group -Filter "SID = 'S-1-5-32-544'" -ErrorAction SilentlyContinue
            if ($adminGroup) {
                $adminMembers = Get-CimInstance Win32_GroupUser -ErrorAction SilentlyContinue | 
                Where-Object { $_.GroupComponent.Name -eq $adminGroup.Name } | 
                ForEach-Object { $_.PartComponent.Name }
            }
        }
        catch {}

        $userRows = ""
        if ($userAccounts) {
            foreach ($u in $userAccounts) {
                $status = if ($u.Disabled) { "Disabled" } else { "Enabled" }
                $statusColor = if ($u.Disabled) { "#ef4444" } else { "#10b981" }
                $fullName = if ($u.FullName) { $u.FullName } else { "-" }
                $description = if ($u.Description) { $u.Description } else { "-" }
                
                # Check if user is administrator
                $isAdmin = $adminMembers -contains $u.Name
                $roleText = if ($isAdmin) { "Administrator" } else { "Standard" }
                $roleColor = if ($isAdmin) { "#ec4899" } else { "#9ca3af" }
                
                $userRows += "<tr><td>$($u.Name)</td><td>$fullName</td><td><span style='color:$statusColor;font-weight:600;'>$status</span></td><td><span style='color:$roleColor;font-weight:600;'>$roleText</span></td><td>$description</td></tr>"
            }
        }
        else {
            $userRows = "<tr><td colspan='5' style='text-align:center;color:var(--text-secondary);'>No local accounts found</td></tr>"
        }

        $uninstallPaths = @(
            'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
            'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
        )
        $installedApps = foreach ($p in $uninstallPaths) { 
            Get-ItemProperty -Path $p -ErrorAction SilentlyContinue | 
            Where-Object { $_.DisplayName } | 
            Select-Object DisplayName, DisplayVersion, InstallDate
        }
        $installedApps = $installedApps | Sort-Object DisplayName
        $appRows = ""
        foreach ($app in $installedApps) {
            $appRows += "<tr><td>$($app.DisplayName)</td><td>$($app.DisplayVersion)</td><td>$($app.InstallDate)</td></tr>"
        }

        $wmiLicense = Get-CimInstance SoftwareLicensingProduct -Filter "PartialProductKey IS NOT NULL" | Select-Object -First 1
        $licStatus = "Unknown"
        if ($wmiLicense) {
            $statusMap = @{ 0 = "Unlicensed"; 1 = "Licensed"; 2 = "OOBGrace"; 3 = "OOTGrace"; 4 = "NonGenuineGrace"; 5 = "Notification"; 6 = "ExtendedGrace" }
            $licStatus = $statusMap[[int]$wmiLicense.LicenseStatus]
        }

        $winsat = Get-CimInstance Win32_WinSAT -ErrorAction SilentlyContinue
        $winsatCard = ""
        if ($winsat) {
            $cpuPct = [int]($winsat.CPUScore * 10)
            $memPct = [int]($winsat.MemoryScore * 10)
            $gpuPct = [int]($winsat.GraphicsScore * 10)
            $d3dPct = [int]($winsat.D3DScore * 10)
            $diskPct = [int]($winsat.DiskScore * 10)
            $basePct = [int]($winsat.WinSPRLevel * 10)
            
            $winsatCard = @"
            <div class="card">
                <h2>Performance Scores (WinSAT)</h2>
                <table class="card-table">
                    <tr>
                        <td class="label">Processor (CPU)</td>
                        <td class="value">
                            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 8px;">
                                <div style="width: 100px; height: 8px; background: rgba(255,255,255,0.1); border-radius: 4px; overflow: hidden;">
                                    <div style="width: $cpuPct%; height: 100%; background: linear-gradient(90deg, #10b981, #34d399);"></div>
                                </div>
                                <span>$($winsat.CPUScore)</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Memory (RAM)</td>
                        <td class="value">
                            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 8px;">
                                <div style="width: 100px; height: 8px; background: rgba(255,255,255,0.1); border-radius: 4px; overflow: hidden;">
                                    <div style="width: $memPct%; height: 100%; background: linear-gradient(90deg, #10b981, #34d399);"></div>
                                </div>
                                <span>$($winsat.MemoryScore)</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Graphics (GPU)</td>
                        <td class="value">
                            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 8px;">
                                <div style="width: 100px; height: 8px; background: rgba(255,255,255,0.1); border-radius: 4px; overflow: hidden;">
                                    <div style="width: $gpuPct%; height: 100%; background: linear-gradient(90deg, #10b981, #34d399);"></div>
                                </div>
                                <span>$($winsat.GraphicsScore)</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Gaming Graphics</td>
                        <td class="value">
                            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 8px;">
                                <div style="width: 100px; height: 8px; background: rgba(255,255,255,0.1); border-radius: 4px; overflow: hidden;">
                                    <div style="width: $d3dPct%; height: 100%; background: linear-gradient(90deg, #10b981, #34d399);"></div>
                                </div>
                                <span>$($winsat.D3DScore)</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Primary Disk</td>
                        <td class="value">
                            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 8px;">
                                <div style="width: 100px; height: 8px; background: rgba(255,255,255,0.1); border-radius: 4px; overflow: hidden;">
                                    <div style="width: $diskPct%; height: 100%; background: linear-gradient(90deg, #10b981, #34d399);"></div>
                                </div>
                                <span>$($winsat.DiskScore)</span>
                            </div>
                        </td>
                    </tr>
                    <tr style="border-top: 1px solid var(--border-color);">
                        <td class="label" style="color: var(--accent-cyan); font-weight: 600;">Base Score</td>
                        <td class="value">
                            <div style="display: flex; align-items: center; justify-content: flex-end; gap: 8px;">
                                <div style="width: 100px; height: 8px; background: rgba(255,255,255,0.1); border-radius: 4px; overflow: hidden;">
                                    <div style="width: $basePct%; height: 100%; background: linear-gradient(90deg, var(--accent-cyan), var(--accent-pink));"></div>
                                </div>
                                <span style="color: var(--accent-cyan); font-weight: bold;">$($winsat.WinSPRLevel)</span>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
"@
        }
        else {
            $winsatCard = @"
            <div class="card">
                <h2>Performance Scores (WinSAT)</h2>
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 80%; text-align: center; color: var(--text-secondary); padding: 20px;">
                    <p style="margin: 0 0 10px 0; font-size: 0.95rem;">No WinSAT assessment data found.</p>
                    <code style="background: rgba(255,255,255,0.05); padding: 4px 8px; border-radius: 4px; font-size: 0.85rem; border: 1px solid var(--border-color); color: var(--accent-cyan);">winsat formal</code>
                    <p style="font-size: 0.8rem; margin: 10px 0 0 0; color: var(--text-secondary);">Run the command above in an Administrator command prompt to benchmark your PC performance.</p>
                </div>
            </div>
"@
        }

        $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PC Audit Report - $computerName</title>
    <style>
        :root {
            --bg-color: #0b0f19;
            --card-bg: rgba(22, 28, 45, 0.7);
            --border-color: rgba(255, 255, 255, 0.08);
            --accent-cyan: #06b6d4;
            --accent-pink: #ec4899;
            --text-main: #f3f4f6;
            --text-secondary: #9ca3af;
        }
        body {
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            margin: 0;
            padding: 20px;
            background-image: radial-gradient(circle at 10% 20%, rgba(6, 182, 212, 0.05) 0%, transparent 40%),
                              radial-gradient(circle at 90% 80%, rgba(236, 72, 153, 0.05) 0%, transparent 40%);
            background-attachment: fixed;
        }
        .container {
            max-width: 1100px;
            margin: 0 auto;
        }
        header {
            text-align: center;
            padding: 30px 20px;
            background: var(--card-bg);
            border-radius: 16px;
            border: 1px solid var(--border-color);
            margin-bottom: 25px;
            backdrop-filter: blur(12px);
        }
        h1 {
            margin: 0 0 10px 0;
            font-size: 2.2rem;
            background: linear-gradient(135deg, var(--accent-cyan), var(--accent-pink));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .meta {
            color: var(--text-secondary);
            font-size: 0.95rem;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(340px, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }
        .card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 20px;
            border: 1px solid var(--border-color);
            backdrop-filter: blur(8px);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-2px);
            border-color: rgba(6, 182, 212, 0.2);
        }
        .card h2 {
            margin-top: 0;
            margin-bottom: 15px;
            font-size: 1.25rem;
            color: var(--accent-cyan);
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 8px;
            display: flex;
            justify-content: space-between;
        }
        .card-table {
            width: 100%;
            border-collapse: collapse;
        }
        .card-table td {
            padding: 8px 0;
            border-bottom: 1px solid rgba(255,255,255,0.03);
            font-size: 0.92rem;
        }
        .card-table td.label {
            color: var(--text-secondary);
            width: 35%;
            font-weight: 500;
        }
        .card-table td.value {
            color: var(--text-main);
            text-align: right;
            word-break: break-word;
        }
        .section-title {
            color: var(--accent-pink);
            font-size: 1.4rem;
            margin: 30px 0 15px 0;
            padding-left: 10px;
            border-left: 4px solid var(--accent-pink);
        }
        table.data-table {
            width: 100%;
            border-collapse: collapse;
            background: var(--card-bg);
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid var(--border-color);
            margin-bottom: 25px;
        }
        table.data-table th, table.data-table td {
            padding: 12px 15px;
            text-align: left;
        }
        table.data-table th {
            background-color: rgba(6, 182, 212, 0.1);
            color: var(--accent-cyan);
            font-size: 0.95rem;
            font-weight: 600;
            border-bottom: 1px solid var(--border-color);
        }
        table.data-table td {
            border-bottom: 1px solid rgba(255,255,255,0.04);
            color: var(--text-main);
            font-size: 0.9rem;
        }
        table.data-table tr:hover td {
            background-color: rgba(255,255,255,0.02);
        }
        .footer {
            text-align: center;
            padding: 30px 0;
            color: var(--text-secondary);
            font-size: 0.85rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>PC AUDIT REPORT</h1>
            <div class="meta">Generated by ncexs PC Maintenance Suite on $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")</div>
        </header>

        <div class="grid">
            <div class="card">
                <h2>System Details</h2>
                <table class="card-table">
                    <tr><td class="label">Host Name</td><td class="value">$computerName</td></tr>
                    <tr><td class="label">User Name</td><td class="value">$userName</td></tr>
                    <tr><td class="label">OS Version</td><td class="value">$osName ($osArch)</td></tr>
                    <tr><td class="label">Build Version</td><td class="value">$osVer</td></tr>
                    <tr><td class="label">Installation Date</td><td class="value">$installDate</td></tr>
                    <tr><td class="label">System Uptime</td><td class="value">$uptimeStr</td></tr>
                    <tr><td class="label">Last Boot Time</td><td class="value">$lastBoot</td></tr>
                </table>
            </div>

            <div class="card">
                <h2>Hardware Specs</h2>
                <table class="card-table">
                    <tr><td class="label">Motherboard</td><td class="value">$($mobo.Manufacturer) $($mobo.Product)</td></tr>
                    <tr><td class="label">Serial Number</td><td class="value">$($bios.SerialNumber)</td></tr>
                    <tr><td class="label">BIOS Version</td><td class="value">$($bios.SMBIOSBIOSVersion)</td></tr>
                    <tr><td class="label">Processor</td><td class="value">$($cpu.Name)</td></tr>
                    <tr><td class="label">Cores / Threads</td><td class="value">$($cpu.NumberOfCores) Cores / $($cpu.NumberOfLogicalProcessors) Threads</td></tr>
                    <tr><td class="label">GPU</td><td class="value">$($gpu -join ' | ')</td></tr>
                    <tr><td class="label">RAM Size</td><td class="value">$ramTotal GB Total</td></tr>
                </table>
            </div>

            <div class="card">
                <h2>System Health & License</h2>
                <table class="card-table">
                    <tr><td class="label">Windows Activation</td><td class="value">$licStatus</td></tr>
                    <tr><td class="label">Windows Model</td><td class="value">$($os.RegisteredUser)</td></tr>
                    <tr><td class="label">Memory Modules</td><td class="value">$ramDetails</td></tr>
                </table>
            </div>
            
            $winsatCard
        </div>

        <div class="section-title">Storage Drives</div>
        <table class="data-table">
            <thead>
                <tr>
                    <th>Drive Letter</th>
                    <th>Total Capacity</th>
                    <th>Free Space</th>
                    <th>Used Space (%)</th>
                </tr>
            </thead>
            <tbody>
                $diskRows
            </tbody>
        </table>

        <div class="section-title">Network Adapters (Active)</div>
        <table class="data-table">
            <thead>
                <tr>
                    <th>Adapter Name</th>
                    <th>MAC Address</th>
                    <th>IP Address (IPv4)</th>
                    <th>Link Speed</th>
                </tr>
            </thead>
            <tbody>
                $netRows
            </tbody>
        </table>

        <div class="section-title">Windows Accounts (Local Users)</div>
        <table class="data-table">
            <thead>
                <tr>
                    <th>Account Name</th>
                    <th>Full Name</th>
                    <th>Status</th>
                    <th>Privilege</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                $userRows
            </tbody>
        </table>

        <div class="section-title">Installed Software ($($installedApps.Count) Applications)</div>
        <div style="max-height: 400px; overflow-y: auto; border: 1px solid var(--border-color); border-radius: 12px;">
            <table class="data-table" style="margin-bottom: 0;">
                <thead>
                    <tr>
                        <th>Application Name</th>
                        <th>Version</th>
                        <th>Install Date</th>
                    </tr>
                </thead>
                <tbody>
                    $appRows
                </tbody>
            </table>
        </div>

        <div class="footer">
            Report created automatically via ncexs Toolkit &copy; 2026. All rights reserved.
        </div>
    </div>
</body>
</html>
"@
        
        $destPath = "$env:USERPROFILE\Desktop\Audit_Report_$computerName.html"
        $html | Out-File -FilePath $destPath -Encoding utf8 -Force
        
        Write-Success ((Get-Translation 'Maint_Audit_Success') -f $destPath)
        Start-Process $destPath
    }
    catch {
        Write-Error "Failed to generate PC Audit Report: $_"
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Invoke-OneClickMaintenance {
    Write-Title (Get-Translation 'Maint_Maint_Title')
    if (-not (Request-Confirm (Get-Translation 'Maint_Maint_Confirm'))) { return }
    
    Write-Info (Get-Translation 'Maint_Maint_Junk')
    $targets = @(
        "$env:TEMP\*", 
        "$env:SystemRoot\Temp\*", 
        "$env:SystemRoot\Prefetch\*"
    )
    $totalFreed = 0
    foreach ($p in $targets) {
        $files = Get-ChildItem -Path $p -Recurse -Force -ErrorAction SilentlyContinue
        if ($files) { 
            $totalFreed += ($files | Measure-Object -Property Length -Sum).Sum
            $files | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue 
        }
    }
    $freedMB = [math]::Round($totalFreed / 1MB, 2)
    Write-Success ((Get-Translation 'Junk_Cleared') -f $freedMB)

    Write-Info (Get-Translation 'Maint_Maint_DNS')
    ipconfig /flushdns > $null
    Write-Success "DNS Cache flushed."

    Write-Info (Get-Translation 'Maint_Maint_SFC')
    sfc /scannow
    Write-Success "System File Checker scan completed."

    Write-Info (Get-Translation 'Maint_Maint_DISM')
    dism /online /cleanup-image /restorehealth
    Write-Success "DISM Image repair completed."

    Write-Success (Get-Translation 'Maint_Maint_Done')
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Get-BatteryHealth {
    Write-Title (Get-Translation 'Maint_Battery_Title')
    Write-Host ""
    try {
        $batteries = Get-CimInstance -ClassName Win32_Battery
        if (-not $batteries) {
            Write-Warning (Get-Translation 'Maint_Battery_Desktop')
        }
        else {
            $reportPath = "$env:TEMP\battery-report.html"
            powercfg /batteryreport /output $reportPath > $null
            
            foreach ($b in $batteries) {
                $name = $b.Name
                $status = $b.Status
                $chem = $b.Chemistry
                
                Write-Host " [ Battery details: $name ]" -ForegroundColor $global:Theme.Section
                Write-Host "   Chemistry        : $chem"
                Write-Host "   Status           : $status"
                
                if (Test-Path $reportPath) {
                    $htmlContent = Get-Content -Path $reportPath -Raw
                    $designCapMatch = [regex]::Match($htmlContent, 'DESIGN CAPACITY.*?>\s*([\d,.]+)\s*mWh')
                    $fullCapMatch = [regex]::Match($htmlContent, 'FULL CHARGE CAPACITY.*?>\s*([\d,.]+)\s*mWh')
                    
                    if ($designCapMatch.Success -and $fullCapMatch.Success) {
                        $designCapVal = $designCapMatch.Groups[1].Value -replace '[.,\s]'
                        $fullCapVal = $fullCapMatch.Groups[1].Value -replace '[.,\s]'
                        
                        $designCap = [double]$designCapVal
                        $fullCap = [double]$fullCapVal
                        
                        if ($designCap -gt 0) {
                            $healthPct = [math]::Round(($fullCap / $designCap) * 100, 1)
                            Write-Success ((Get-Translation 'Maint_Battery_Wear') -f $healthPct, $designCap, $fullCap)
                        }
                    }
                    else {
                        Write-Info "Report generated. Details can be viewed in the battery report file."
                    }
                }
            }
            
            if (Request-Confirm "Open full battery report HTML?") {
                Start-Process $reportPath
            }
        }
    }
    catch {
        Write-Error "Failed to retrieve battery details: $_"
    }
    Read-Host "`n $(Get-Translation 'PressAnyKey')"
}

function Manage-RemoteDesktop {
    do {
        Clear-Host
        Write-Title (Get-Translation 'Maint_RDP_Title')
        Write-Host ""
        
        $rdpReg = Get-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -ErrorAction SilentlyContinue
        $rdpStatusVal = $rdpReg.fDenyTSConnections
        
        $statusText = if ($rdpStatusVal -eq 0) { Get-Translation 'Maint_RDP_Enabled' } else { Get-Translation 'Maint_RDP_Disabled' }
        $statusColor = if ($rdpStatusVal -eq 0) { $global:Theme.Success } else { $global:Theme.Error }
        
        Write-Host "   $(Get-Translation 'Maint_RDP_Status') : " -NoNewline
        Write-Host "$statusText" -ForegroundColor $statusColor
        Write-Host ""
        
        Write-Host " [1] Enable Remote Desktop (RDP)"
        Write-Host " [2] Disable Remote Desktop (RDP)"
        Write-Host " [3] Back"
        Write-Host ""
        
        $c = Read-Host " $(Get-Translation 'SelectOption')"
        if ($c -eq "1") {
            if (Request-Confirm (Get-Translation 'Maint_RDP_Enable_Prompt')) {
                Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
                Enable-NetFirewallRule -DisplayGroup "Remote Desktop" -ErrorAction SilentlyContinue
                Write-Success (Get-Translation 'Maint_RDP_Enable_Success')
                Start-Sleep -Seconds 2
            }
        }
        elseif ($c -eq "2") {
            if (Request-Confirm (Get-Translation 'Maint_RDP_Disable_Prompt')) {
                Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1
                Disable-NetFirewallRule -DisplayGroup "Remote Desktop" -ErrorAction SilentlyContinue
                Write-Success (Get-Translation 'Maint_RDP_Disable_Success')
                Start-Sleep -Seconds 2
            }
        }
        elseif ($c -eq "3") {
            return
        }
        else {
            Write-Warning (Get-Translation 'Invalid_Option')
            Start-Sleep -Seconds 1
        }
    } while ($true)
}

function Clear-BrowserCaches {
    Write-Title (Get-Translation 'Maint_Browser_Title')
    if (-not (Request-Confirm (Get-Translation 'Maint_Browser_Confirm'))) { return }
    
    $freed = 0
    $targets = @(
        @{ N = "Google Chrome"; P = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache" },
        @{ N = "Google Chrome Code"; P = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Code Cache\js" },
        @{ N = "Microsoft Edge"; P = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache" },
        @{ N = "Microsoft Edge Code"; P = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Code Cache\js" },
        @{ N = "Mozilla Firefox"; P = "$env:USERPROFILE\AppData\Local\Mozilla\Firefox\Profiles\*\cache2" }
    )
    
    foreach ($t in $targets) {
        $pPath = $t.P
        $resolvedPaths = @()
        try {
            $resolvedPaths = Resolve-Path -Path $pPath -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path
        }
        catch {}
        
        if (-not $resolvedPaths -and (Test-Path -Path $pPath)) {
            $resolvedPaths = , $pPath
        }
        
        $clearedAny = $false
        foreach ($rp in $resolvedPaths) {
            if (Test-Path -Path $rp) {
                try {
                    $files = Get-ChildItem -Path $rp -Recurse -File -Force -ErrorAction SilentlyContinue
                    if ($files) {
                        $size = ($files | Measure-Object -Property Length -Sum).Sum
                        $freed += $size
                        $files | Remove-Item -Force -ErrorAction SilentlyContinue
                        $clearedAny = $true
                    }
                }
                catch {}
            }
        }
        if ($clearedAny) {
            Write-Info ((Get-Translation 'Maint_Browser_Cleared') -f $t.N)
        }
    }
    
    Write-Success ((Get-Translation 'Maint_Browser_Success') -f [math]::Round($freed / 1MB, 2))
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
    for ($i = 1; $i -le 10; $i++) {
        $l_idx = $i; $r_idx = $i + 10
        $l_t = Get-Translation "Menu_Option$l_idx"
        Write-Host " $($global:UI.VLine) " -NoNewline -ForegroundColor $global:Theme.Border
        Write-Host ("[{0,-2}]" -f $l_idx) -NoNewline -ForegroundColor $global:Theme.MenuNumber
        Write-Host (" {0,-34}" -f $l_t) -NoNewline -ForegroundColor $global:Theme.MenuText
        Write-Host "$($global:UI.VLine) " -NoNewline -ForegroundColor $global:Theme.Border
        if ($r_idx -le 20) {
            $r_t = Get-Translation "Menu_Option$r_idx"
            $rc = if ($r_idx -eq 20) { $global:Theme.Exit } else { $global:Theme.MenuNumber }
            $rtc = if ($r_idx -eq 20) { $global:Theme.Exit } else { $global:Theme.MenuText }
            Write-Host ("[{0,-2}]" -f $r_idx) -NoNewline -ForegroundColor $rc
            Write-Host (" {0,-35}" -f $r_t) -NoNewline -ForegroundColor $rtc
        }
        else {
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
        "0" { Invoke-CompactOS }; "1" { Show-SystemInfo }; "2" { Show-SystemHealthMenu }
        "3" { Invoke-OneClickMaintenance }; "4" { Show-UpdateDriverMenu }; "5" { Clear-RAM }
        "6" { Invoke-Defragment }; "7" { Show-PowerMenu }; "8" { Invoke-VisualPerf }
        "9" { Show-AdvancedUninstaller }; "10" { Manage-RemoteDesktop }
        "11" { Clear-JunkFiles }; "12" { Invoke-OptimizeApps }; "13" { Clear-BrowserCaches }
        "14" { Clear-RecycleBin-Menu }; "15" { Open-DiskCleanup }; "16" { Clear-EventLogs }
        "17" { Invoke-NetworkRepair }; "18" { Show-DNSMenu }; "19" { Invoke-WifiGrabber }
        "20" { exit }
        "L" { if ($global:Language -eq "EN") { $global:Language = "ID" } else { $global:Language = "EN" } }
        default { Write-Warning (Get-Translation 'Invalid_Option'); Start-Sleep -Seconds 1 }
    }
} while ($true)