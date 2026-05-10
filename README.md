# 🧰 ncexs Toolkit

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **All-in-One Windows Toolkit** – Simple, fast, and safe tools to clean, optimize, and maintain your PC.

---

## 🔥 Key Features
### ⚡ Quick Fix
* **One-Click Maintenance** – (Menu Q) A high-speed automated sequence combining Junk Cleanup, Network Repair, and RAM Optimization in one go.
* **Live Progress Tracking** – Watch the execution in real-time with integrated percentage bars.

### 🔄 Updates & Drivers
* **Software Updater** – Automatically updates all installed apps via `winget` (auto-accepts source agreements).
* **Driver Backup** – Exports all third-party drivers to a safe backup folder (`C:\DriversBackup`) before reinstalling Windows.
* **Windows Update Fixer** – Resets update services (`wuauserv`, `bits`) and clears download cache to resolve stuck updates.

### 🧹 Storage & Cleanup
* **Compact OS** – Safely compress Windows system binaries to free up **2GB – 5GB** of disk space without deleting files.
* **Enhanced Junk Cleaner** – Comprehensive cleaning for **System Temp, Prefetch, GPU Driver Caches** (AMD, NVIDIA, Intel), old Windows Updates, and **Multi-Profile** browser caches (Chrome, Edge, Brave).
* **Smart Uninstaller** – Registry-based uninstaller with **fuzzy search** to find and remove apps quickly.
* **Recycle Bin Cleaner** – Safely empties the Recycle Bin with a confirmation prompt.

### ⚡ Performance & Optimization
* **Memory Optimizer** – Frees up RAM by clearing working sets and displays **"Before & After" statistics** to show reclaimed memory.
* **Smart Power Plan** – Automatically **restores hidden power plans** (High Performance/Saver) and enforces distinct brightness levels.
* **Drive Optimizer** – Defrag/Trim tool with smart filtering (hides system partitions) and numbered navigation.
* **System Dashboard** – Displays real-time Free RAM, Disk Space, and installed GPU driver versions.

### 🌐 Network & Maintenance
* **Network Repair Suite** – A one-click solution that runs 5 critical fixes (TCP/IP reset, Winsock reset, DNS flush, etc.).
* **DNS Changer** – Quickly switch between Google (8.8.8.8), Cloudflare (1.1.1.1), or Auto (DHCP).

### 🛡️ Security & UI
* **Modern Interface** – Clean 2-column layout with a festive **Gold/Cyan Theme**, visual progress bars, and intro animations.
* **Live Health Check** – Runs SFC & DISM with **real-time percentage indicators** directly in the console.
* **Safe by Design** – All critical actions require mandatory **(Y/N)** confirmation.

---

## 🚀 Quick Start (Stable Release)

To run the latest stable release of the ncexs Toolkit directly without downloading files manually:

1. Open your **Start Menu**, type **`powershell`**, right-click it and select **Run as Administrator**.
2. Copy and paste the command below, then press **Enter**:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; irm "https://github.com/ncexs/ncexs-toolkit/releases/latest/download/ncexs-Toolkit.ps1" | iex
   ```

For detailed manual installation steps and feature guides, please visit our official documentation:

👉 [**View Full Guide at ncexs.github.io**](https://ncexs.github.io/)

---

## ✅ Trusted & Safe

* **VirusTotal Verified** – Scanned and confirmed to be free of malware.
* **Open Source** – The code is fully transparent and can be reviewed by anyone.
* **Stability Fixes** – Resolves critical parsing errors to ensure the script runs reliably on all systems.
* **Admin-Friendly** – Only requests elevated permissions when absolutely necessary.
* **No Telemetry** – Zero tracking, zero data collection.
* **Smart Logging** – Keeps a record of all actions performed, with an auto-clean feature to manage log size.

---

## 💻 System Requirements

* **Windows** 7+ (7, 8, 8.1, 10, 11)
* **PowerShell** 3.0+
* **Admin Rights** (for full functionality)

---

## ❓ FAQ

**🔹 Is it safe to use?**
Yes. The toolkit is fully open-source and regularly verified with VirusTotal. All critical actions (like deletions) require your mandatory **(Y/N)** confirmation before running.

**🔹 Will the Junk Cleaner log me out of my browsers?**
**No.** The Enhanced Junk Cleaner is designed to only remove **Cache, Code Cache, and GPU Cache**. It does **NOT** touch your Cookies, Saved Passwords, or History. You will stay logged in.

**🔹 Does "Compact OS" slow down my computer?**
Generally, no. Compact OS is a native Windows feature designed for SSDs. On modern CPUs, the performance impact is negligible, and it can actually make the system feel snappier by reducing disk I/O usage.

**🔹 Why does the Health Check (DISM) seem stuck?**
Commands like `DISM /RestoreHealth` often pause at specific percentages (e.g., 62.3%) for a long time. **This is normal**. It is downloading and verifying system files in the background. Please be patient and do not close the window.

**🔹 Why does it require Administrator rights?**
Most features—such as cleaning system temp files, optimizing drives, and repairing network settings—require elevated privileges to modify protected Windows system components.

---

## 📜 License

MIT License – Free to use, modify, and share.

⚠️ Always back up important data before performing system maintenance.

---

## ☕ Support

If you find this toolkit useful, consider supporting its development:

[![Buy me a coffee](https://img.shields.io/badge/Saweria-Buy%20Me%20a%20Coffee-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![Star on GitHub](https://img.shields.io/badge/GitHub-Star%20Project-blue?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit)

---

**🎯 Pro Tip**: Run the toolkit monthly to keep your PC fast, clean, and optimized!
