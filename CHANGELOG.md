# 🚀 ncexs Toolkit v3.3

🌐 **English** | [Bahasa Indonesia](docs/CHANGELOG.id.md) | [Basa Jawa](docs/CHANGELOG.jv.md) | [Basa Sunda](docs/CHANGELOG.su.md) | [हिन्दी](docs/CHANGELOG.hi.md) | [Русский](docs/CHANGELOG.ru.md) | [日本語](docs/CHANGELOG.ja.md) | [한국어](docs/CHANGELOG.ko.md) | [中文](docs/CHANGELOG.zh.md) | [العربية](docs/CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – v3.3 Performance & Diagnostics Update

### ✨ Features & Enhancements
- **WinSAT Performance Scores**: Integrated Windows System Assessment Tool metrics into the System Information CLI screen and the interactive HTML PC Audit report. Features visual colored rating bars (`█` and `░`) indicating sub-system performance (CPU, RAM, GPU, Gaming Graphics, Disk).
- **Battery Health in System Info**: Embedded robust, real-time Battery Health metrics directly into the System Information CLI screen (auto-detected on mobile/laptops).
- **Massive Performance Optimizations**:
  - **Supercharged Browser Cache Cleaner**: Optimized path resolving to execute at the folder level instead of scanning individual files. Resolves deep-level caches up to 100x faster.
  - **RAM Clear Compile Bypass**: Implemented active Type checks to skip C# compilation on subsequent RAM clears, removing execution lag.

### 🐛 Bug Fixes & Refactors
- **Robust Battery Report Parser**: Upgraded regex pattern matching (`DESIGN CAPACITY.*?>\s*([\d,.]+)\s*mWh`) to safely support modern Windows 11 HTML reports and handle dots/commas thousand separators dynamically.
- **PowerShell 3.0 Compatibility**: Corrected .NET type accelerator calls (`[System.Net.ServicePointManager]`) in quick-launch commands across all README documentations to support legacy environments.

---

# 🚀 ncexs Toolkit v3.2

## 🧰 ncexs Toolkit – v3.2 System Maintenance Update

### ✨ Features & Enhancements
- **PC Maintenance Suite**: Introduced a brand new comprehensive sub-menu (Menu 17) packed with powerful tools:
  - **PC Audit Report (HTML)**: Generates a premium and clean interactive HTML PC specifications report exported directly to your Desktop. Audits CPU, RAM, OS details, Motherboard, Storage space, and **Active Windows Accounts** with clear privilege badging (Administrator vs Standard).
  - **One-Click Maintenance**: Performs fully automated system maintenance (junk clean, DNS flush, SFC/DISM scan) while intelligently preserving the Recycle Bin to prevent loss of important user files.
  - **Battery Health Analyzer**: Calculates real-time battery wear, design capacity, and full charge capacity, or dynamically detects Desktop PCs.
  - **Remote Desktop (RDP) Manager**: Turn RDP on/off instantly and configures required Windows Firewall rules.
  - **Browser Cache Cleaner**: Cleans accumulated cache databases from Google Chrome, Microsoft Edge, and Mozilla Firefox.
- **Direct .NET Event Logs Clearing**: Upgraded Event Viewer cleaner to use direct .NET Event Log API querying, resulting in an instant < 1 second execution (60x faster than traditional iterative processes).
- **Multi-Adapter DNS**: Expanded the DNS Changer utility to apply configured DNS addresses to *all active physical network adapters* simultaneously.
- **Bidirectional Compact OS**: Rebuilt the Compact OS utility to support both compressing (`/CompactOS:always`) and decompressing (`/CompactOS:never`) system files.

### 🐛 Bug Fixes & Refactors
- **Localization & Safeties**: Extracted all Compact OS hardcoded strings and added them cleanly to `$global:Translations` mapping tables for English (`EN`) and Indonesian (`ID`) to fix the mixed-language menu bug.
- **Preserved User Files**: Excluded the Recycle Bin deletion action from the automated maintenance routine to prevent accidental data loss.

---

# 🚀 ncexs Toolkit v3.1

## 🧰 ncexs Toolkit – v3.1 System Mastery Update

### ✨ Features & Enhancements
- **Enhanced System Info**: Upgraded the System Information (Menu 1) to display the motherboard details, exact OS build, system uptime, and hardware Serial Number. Storage metrics now clearly show total, free, and used percentage.
- **Richer Junk Cleaner**: Greatly expanded the Enhanced Junk Cleaner (Menu 2) to safely clear `SoftwareDistribution\Download` (Windows Update cache), `CrashDumps`, `WER ReportArchive`, and bloated `CBS` logs, freeing significantly more space.
- **Clear App Caches**: Rebranded and supercharged the WhatsApp Optimizer (Menu 15) into a comprehensive "App Cache Cleaner." It now automatically detects and clears massive storage-hogging caches from **Discord**, **Spotify**, **Steam (Web Cache)**, **Telegram**, and **WhatsApp**, all without touching user accounts or logins.
- **Dedicated Event Logs Cleaner**: Added a new dedicated action (Menu 16) to clear all Windows Event Viewer logs safely. Includes live calculation of MBs freed.
- **Live Cleanup Metrics**: Upgraded the Recycle Bin menu to measure and report the exact amount of MBs freed after emptying.
- **Safer Health Check**: Improved the System Health Checker (Menu 10) by injecting `chkdsk C: /scan` to verify disk integrity non-destructively alongside SFC and DISM.

### 🎨 UI & UX Improvements
- **Dynamic Grid UI**: The main menu seamlessly supports odd numbers of items (now 17) while maintaining perfectly aligned borders and empty column handling.
- **Action Feedbacks**: All cleaning actions now transparently display exactly how much data was successfully removed (in MB).
- **Default Locale**: Toolkit default language is now set to English (EN).
- **Deprecation**: Removed the "Reset Windows Update" utility entirely to prioritize maximum system safety.

---

# 🚀 ncexs Toolkit v3.0.1

## 🧰 ncexs Toolkit – v3.0.1 Safety & UX Refinement

### ✨ Features & Enhancements
- **UX Safety Refinement**: Added clear, dynamic multi-language cancellation instructions to help non-technical users understand how to safely cancel tasks without abruptly closing the terminal window.
- **Ctrl+C Graceful Trapping**: Implemented a global exception handler (`trap [PipelineStoppedException]`) inside the main loop. Pressing `Ctrl+C` to abort a running task will no longer exit the toolkit to the shell. The script now gracefully catches the abort signal, prints a localized cancellation message, and returns the user back to the main menu without needing to rerun the execution command!
- **Multilingual Support**: Implemented new `"Process_Cancel"` and `"Process_Aborted"` translation strings covering English ("EN") and Indonesian ("ID") locales, guiding users to cancel/abort processes using `Ctrl+C` at any time.
- **Contextual Warning Prompts**: Integrated the cancellation warning into the standard confirmation helper so it automatically displays before executing any process (e.g., Junk Cleaner, Defrag, Compact OS), and right before starting quiet *Winget Upgrades* and *Driver Backups*.

---

# 🚀 ncexs Toolkit v3.0

## 🎓 ncexs Toolkit – v3.0 After UTS Build

### ⚡ Direct Execution (No Release File)
- **Zero Downloads Required**: Starting from v3.0, we have eliminated the need to download `.ps1` files manually from the Releases page. The toolkit now runs directly from the raw `main` branch via a single PowerShell command, ensuring you always execute the freshest code instantly.

### ✨ Features & Enhancements
- **UI & Aesthetics**: Replaced the main ASCII art with a new bold 3D 'Big Money' design and updated its color to Blue. Improved visibility of the 'Change Language' option by changing its color to Yellow.
- **Localization**: Added full English and Indonesian translation coverage. Replaced all hardcoded strings inside multiple toolkit functions with `Get-Translation` to ensure the language toggle works perfectly across the script.
- **Language Toggle**: Implement a quick language toggle [L] between English and Indonesian. Fixed a bug where the case-insensitive switch toggled the language twice.
- **DNS Changer**: Add an interactive DNS Changer sub-menu with 5 major providers. Modified 'Updates & Drivers Center' (Menu 11) and 'DNS Changer' (Menu 12) to execute inline within the main menu instead of opening in a separate screen.
- **Detailed Optimizer Metrics**: Add 'Before/After' MB statistics to the Junk Cleaner and Memory Optimizer.
- **Network Repair**: Added detailed step-by-step progress notifications (IP Release/Renew, DNS Flush, Winsock/TCP reset) to provide better user feedback.

### 🐛 Bug Fixes & Refactors
- **Menu Loops**: Fix infinite menu loops by adding Clear-Host and default cases to switch statements.
- **Advanced Uninstaller**: Add a missing pause to the Advanced Uninstaller results.
- **String Abstraction**: Abstract hardcoded strings into the global translation dictionary.

---
# 🚀 ncexs Toolkit v2.6

## 🎂 ncexs Toolkit – v2.6 Developer's Birthday Build

### ✨ Added
- ⚡ **Quick Fix (Special Birthday Utility)** – Added a specialized "One-Click" maintenance feature (Menu Q) that automates three essential tasks in sequence:
    - **Junk Cleanup:** Automatically clears system temporary files and junk.
    - **Network Repair:** Resets network configurations for better stability.
    - **Memory Optimization:** Frees up standby RAM to boost system responsiveness.
- 📐 **Symmetrical 2-Column UI** – Completely rebuilt the main menu with a precision-aligned 2-column layout, ensuring all borders and dividers stay perfectly straight.
- 📂 **Side-by-Side Quick Access** – Redesigned the top row to feature **Compact OS (Menu 0)** and **Quick Fix (Menu Q)** side-by-side for faster navigation and a modern look.
- 📊 **Dynamic Progress Integration** – Added real-time percentage progress bars to the Quick Fix utility to provide visual feedback during execution.

### 🎨 UI & UX Improvements
- 📏 **Pixel-Perfect Borders** – Implemented advanced string formatting to eliminate the "shifting" right border issue, ensuring a clean, box-shaped interface.
- 🔢 **Smart Numbering** – Numbers [1-14] are now right-aligned, preventing the layout from breaking when switching between single and double digits.
- 💻 **Centered Metadata** – The Hostname and User information header is now mathematically centered at the bottom of the toolkit frame.

### 🔧 Bug Fixes
- **Fixed Border Displacement** – Resolved the long-standing issue where the right vertical line would break due to varying menu text lengths.
- **Fixed Multi-Color Spacing** – Eliminated "ghost spaces" caused by PowerShell's default Write-Host behaviorketika menangani banyak warna.
- **Fixed Formatting Errors** – Removed risky substring logic that previously caused red error messages when menu titles were too short.

---
# 🚀 ncexs Toolkit v2.5

## 🎆 ncexs Toolkit – v2.5 New Year Edition

### ✨ Added
- 📦 **Compact OS Utility** – Added a specialized feature (Menu 0) to compress Windows system binaries, capable of saving **2GB – 5GB** of disk space without deleting files.
- 🔄 **Updates & Drivers Center** – (Menu 11) A new centralized hub combining three critical tools:
    - **Software Updater (Winget):** Auto-updates all installed applications with a single click (auto-accepts agreements).
    - **Driver Backup:** Exports third-party drivers to a safe location (default: `C:\DriversBackup`), essential before reinstalling Windows.
    - **Windows Update Fixer:** Resets update components (`wuauserv`, `bits`) to fix stuck updates.
- 🧹 **Enhanced Junk Cleaner** – Major upgrade to cleaning logic (Menu 2):
    - **Multi-Profile Support:** Now detects and cleans caches from *all* browser profiles (not just 'Default') for Chrome, Edge, and Brave.
    - **Deep Cleaning:** Added support for removing **GPU Driver Caches** (AMD DxCache, NVIDIA GLCache, Intel ShaderCache) and old Windows Update downloads.
- 🌐 **DNS Changer** – Added a quick menu to switch the active network adapter's DNS to **Google (8.8.8.8)**, **Cloudflare (1.1.1.1)**, or revert to **Automatic (DHCP)**.
- 🎆 **Festive Intro Animation** – Added a dynamic firework animation and a large "Welcome to 2026" ASCII banner on startup.
- 🔍 **Smart Uninstaller** – Replaced the old method with a registry-scanning uninstaller that supports **fuzzy search** (typing part of a name) and quick navigation.
- 🛡️ **Safety Confirmations** – Implemented mandatory **(Y/N)** confirmation prompts for all execution actions to prevent accidental clicks.

### 🎨 UI & UX Improvements
- 📐 **Modern UI Overhaul** – Completely redesigned the interface with a **2-column layout** using box-drawing characters for a cleaner, professional look.
- 📊 **RAM Statistics** – Added **"Before & After"** calculation to the Memory Optimizer (Menu 8) to show exactly how much RAM was freed in MB.
- 👁️ **Real-time Process Visibility** – Changed the execution method for SFC and DISM (Menu 10) to display **live percentage progress bars** directly in the console, preventing the "stuck" appearance.
- ⚠️ **Smart Warnings** – Added specific advisory messages for long-running processes like DISM to inform users that pauses at certain percentages are normal.
- 🏆 **New "Gold" Theme** – Implemented a festive Gold & Cyan color scheme with special highlighting for premium features.

### 🔧 Bug Fixes
- **Fixed Power Plan Logic** – The script now detects if High Performance/Saver plans are hidden by Windows and automatically **restores/duplicates** them. It also enforces distinct brightness levels (30%/70%/100%) to ensure the mode change is felt.
- **Fixed Drive Selection** – The Defrag menu (Menu 9) now features a **numbered list** with a "Back" option for easier navigation and automatically filters out hidden partitions (like SYSTEM or Recovery).
- **Fixed Winget Prompts** – Solved the issue where `winget` would freeze waiting for user input on "Source Agreements" by automating the acceptance flag.
- **Fixed Browser Cleaning** – Resolved an issue where Chrome/Brave caches were skipped if the folder path didn't match the standard "Default" profile.
- **Fixed ASCII Art** – Corrected the "New Year" banner typography for better readability.

### ⚡ Performance
- 🚀 **Storage Optimization** – The new Compact OS feature provides a significant performance and storage boost for users with limited disk space (SSD/eMMC).
- 🎨 **Optimized Visuals** – The new intro animation logic is lightweight (`Start-Sleep` optimized) and does not impact script startup time significantly.

---
# 🚀 ncexs Toolkit v2.4

## 🧰 ncexs Toolkit – v2.4 Optimized Release

### ✨ Added
- 🔬 **Advanced Uninstaller** – Replaced the basic `appwiz.cpl` shortcut with a new, registry-scanning uninstaller.
- 🖥️ **Detailed System Info** – The 'Show-SystemInfo' function now displays installed GPU driver versions (AMD, Intel, NVIDIA) and current Free RAM.
- 🌐 **Consolidated Network Repair** – Merged all 5 network fixes (release, renew, flushdns, winsock reset, ip reset) into a single, comprehensive action.
- 🔋 **New Power & Battery Menu** – Added a 'Power & Battery Utilities' sub-menu, featuring a language-agnostic Battery Health Report.
- 🎨 **New UI Color Theme** – Implemented a new color theme for the user interface for a more modern look.

### 🔧 Bug Fixes
- **Fixed Critical Parsing Errors** – Resolved fatal encoding errors (e.g., `Unexpected token 'Â'`, `Missing '='`) that caused the entire script to fail.
- **Fixed Broken System Info** – Removed the non-functional "Uptime" display from the System Info menu to prevent confusion.
- **Fixed Admin Restart Logic** – Corrected a bug using an incorrect absolute path, which prevented "Restart as Admin" from working.

### ⚡ Performance
- 🤖 **Hardware-Agnostic Junk Cleaner** – The cleaner now intelligently detects (`Test-Path`) **AMD, Intel, & NVIDIA** caches, preventing "path not found" errors.
- 🧹 **More Thorough Cleaning** – Added the Windows Update cache (`SoftwareDistribution\Download`) to the list of general paths to be cleaned.
- 🔇 **Quieter Operation** – Refactored the Junk Cleaner logic to reduce unnecessary log noise during the cleaning process.

---
# 🚀 ncexs Toolkit v2.3

## 🧰 ncexs Toolkit – v2.3 Refined Release

### ✨ Added
- 🚀 **Powerful Memory Optimizer** – Replaced the old method with a new one that uses the Windows API (`EmptyWorkingSet`) to clear system cache, freeing up significantly more RAM.
- 🌐 **Streamlined Network Utility** – The entire menu has been simplified into a single, reliable "Automatic Network Repair" action that handles everything in one click.
- 🛡️ **SSD Safety Check** – The "Defragment & Optimize Drives" tool now automatically detects and skips SSDs to prevent unnecessary wear and tear.
- 🧹 **Enhanced Junk Cleaner** – The cleaner now also targets the `Prefetch` folder and includes a routine for browser cache without force-closing your browser.

### 🔧 Bug Fixes
- **Fixed Critical Confirmation Bug** – The Junk Cleaner now correctly cancels the operation when you select "No".
- **Fixed Inconsistent Network Adapter Detection** – Removed the unreliable DNS changer that failed to detect network adapters on some systems, eliminating a source of errors.
- **Fixed Incomplete Cleaning Scan** – Corrected a typo (`-Recourse` to `-Recurse`) that prevented the junk cleaner from properly scanning all sub-folders.

### ⚡ Performance
- **Drastic RAM Recovery** – The new memory optimization method provides a much larger and more noticeable increase in available memory compared to previous versions.
- **Faster & Safer Cleaning** – Junk cleaning processes are now more efficient and no longer interrupt your browsing session.
- **More Reliable Execution** – By removing problematic features and refining existing ones, the script is now more stable and predictable.

---
# 🚀 ncexs Toolkit v2.2.2

##  🧰 ncexs Toolkit – v2.2.2 Final Hotfix

### ✨ Added
- 🔧 Enhanced Startup Manager – fixed folder path issues  
- 🌐 Improved Multi-language Support – more accurate translations  
- 📋 Better Logging System – enhanced error tracking  

### 🔧 Bug Fixes
- Fixed Startup Folder Issue (Disabled folder auto-opening)  
- Fixed Path Handling in startup management  
- Patched Registry Startup Handling reliability  
- Fixed File Movement Logic between Startup and Disabled folders  

### ⚡ Performance
- Faster script loading  
- Reduced resource usage  
- Smoother admin elevation  

---
# 🚀 ncexs Toolkit v2.2.1

## 🧰 v2.2.1 – Hotfix Release

### ✨ Added  
- 🌐 Multi-language Support (ID/EN)
- 🔐 Advanced Startup Manager
- 📋 Universal PC Compatibility
- 🛡️ Smart Admin Access Management

### 🔧 Bug Fixes  
- Fixed PowerShell execution policy issues
- Resolved admin permission conflicts
- Fixed Recycle Bin clearing errors on older systems
- Patched network utility compatibility problems

---
# 🚀 ncexs Toolkit v2.2

## 🧰 v2.2 – Advanced Release  

### ✨ Added  
- 🗑️ Custom Recycle Bin Menu → with file preview and safety confirmation  
- 📋 New Main Menu Layout → reorganized for better clarity and easier navigation  

### 🔧 Improved
System information accuracy, progress indicators, performance, error handling, and admin access management.

---
# 🚀 ncexs Toolkit v2.1

## 🧰 v2.1 – Enhanced Edition  

### ✨ Added  
- 📊 System Info Dashboard (Menu 1)  
- 🌐 Network Repair (Menu 6)  
- 📝 Enhanced Logging  
- ⏳ Progress Indicators  

### 🔧 Improved  
Various features have been refined for better stability and usability.  

---
# 🚀 ncexs Toolkit v2.0

## 🧰 v2.0 – Extended Release  

### ✨ Added  
- 📜 Interactive menu system (1–5):  
  - 1 → Junk & Cache Cleaner  
  - 2 → Deep Cleanup  
  - 3 → Antivirus Scan  
  - 4 → Clear RAM  
  - 5 → Exit program  
- 🧽 Deep Cleanup integration → uninstall leftovers, registry orphan keys, system temp & junk  
- 🛡️ Antivirus scan runs inline (no extra PowerShell window)  
- 📝 Clean and timestamped logging system  

### 🔧 Improved  
Migrated to PowerShell with modular design for better stability and flexibility.  

### 🗑️ Removed  
Legacy `[Y/N]` prompts and old batch script compatibility.  
