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
