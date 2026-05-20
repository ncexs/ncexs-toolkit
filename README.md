# 🧰 ncexs Toolkit (NT)

🌐 **English** | [Bahasa Indonesia](docs/README.id.md) | [Basa Jawa](docs/README.jv.md) | [Basa Sunda](docs/README.su.md) | [हिन्दी](docs/README.hi.md) | [Русский](docs/README.ru.md) | [日本語](docs/README.ja.md) | [한국어](docs/README.ko.md) | [中文](docs/README.zh.md) | [العربية](docs/README.ar.md)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **All-in-One Windows Toolkit** – Simple, fast, and safe tools to clean, optimize, and maintain your PC through a gorgeous terminal-based dashboard.

---

## 🔥 Key Features & Modules

### ⚡ Quick Fix & Diagnostics
* **Live Progress Tracking:** Follow task execution in real-time with beautiful percentage-based feedback indicators directly in your terminal.
* **Live Health Check:** Invokes native `SFC`, `DISM`, and non-destructive `chkdsk /scan` tools with custom UI rendering so you never have to guess when the task completes.

### 🧹 Storage & Clean Up
* **Compact OS Compression:** Rebuilt to be **bidirectional** (supports both compressing OS files and decompressing back to default), safely saving **2GB – 5GB** of storage.
* **Enhanced Junk Cleaner:** Deep-cleans temporary system folders, Prefetch files, CrashDumps, Windows Update cache, bloated CBS logs, and GPU shader caches.
* **App Cache Cleaner:** Safely and automatically wipes massive storage-hogging caches from Discord, Spotify, Steam, Telegram, and WhatsApp without logging you out.
* **Event Logs Cleaner:** Direct .NET API-based utility that clears all Event Viewer logs **instantly (under 1 second)**.
* **Smart App Uninstaller:** Quick fuzzy search through active system registries to find and run uninstallation scripts immediately.
* **Recycle Bin & Disk Cleanup:** Safely purges deleted files or triggers the native Windows Cleanup interface instantly.

### 🛠️ PC Maintenance Suite
* **PC Audit Report (HTML):** Generates a premium and clean interactive HTML PC specifications report exported directly to your Desktop. Audits CPU, RAM, OS details, Motherboard, Storage space, and **Active Windows Accounts** with clear privilege badging (Administrator vs Standard).
* **One-Click Maintenance:** Performs fully automated system maintenance (junk clean, DNS flush, SFC/DISM scan) while intelligently preserving the Recycle Bin to prevent loss of important user files.
* **Battery Health Analyzer:** Calculates real-time battery wear, design capacity, and full charge capacity, or dynamically detects Desktop PCs.
* **Remote Desktop (RDP) Manager:** Turn RDP on/off instantly and configures required Windows Firewall rules.
* **Browser Cache Cleaner:** Cleans accumulated cache databases from Google Chrome, Microsoft Edge, and Mozilla Firefox.

### ⚡ Performance & Optimization
* **Memory Optimizer:** Flushes unused active working sets to free up system memory, displaying precise "Before & After" RAM stats.
* **Smart Power Plans:** Restores hidden system power plans (High Performance vs. Balanced) and optimizes active brightness defaults.
* **Drive Optimizer:** Runs smart defrag/trim routines with exclusion rules for system and hidden partitions.

### 🌐 Network & Admin Tools
* **Network Repair Suite:** Automates 5 critical repair tools (TCP/IP stack reset, Winsock reset, DNS flush, IP release/renew) to restore broken connectivity.
* **DNS Profile Switcher:** Rapidly toggle between Cloudflare (1.1.1.1), Google DNS (8.8.8.8), Quad9, AdGuard (Ad-blocking), or standard DHCP. Automatically applies configurations to **all active physical network adapters** simultaneously.
* **Wi-Fi Password Recovery:** Retrieves and displays security keys for all saved local networks.
* **Updates & Driver Backups:** Run bulk updates for all installed apps using `winget` and exports active third-party drivers to `C:\DriversBackup`.

---

## 🚀 Quick Start (Stable Release)

To run the latest stable release of the ncexs Toolkit directly without downloading files manually:

1. Open your **Start Menu**, search for **`powershell`**, right-click it, and select **Run as Administrator**.
2. Copy and paste the command below, then press **Enter**:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/ncexs-Toolkit.ps1" | iex
```

> [!TIP]
> Always run the toolkit monthly to keep your PC clean, healthy, and highly optimized!

👉 **[View Full Documentation & Manual Guides at ncexs.github.io](https://ncexs.github.io/)**

---

## ⚙️ Advanced Guides & FAQ

<details>
<summary><b>🛡️ Click to view Security & Safety Features</b></summary>

* **VirusTotal Verified:** The script is fully audited and confirmed malware-free.
* **Open Source and Transparent:** Review all PowerShell lines yourself—absolutely no obfuscation, compiled dependencies, or third-party wrappers.
* **Admin-Friendly Design:** Requests elevated permissions gracefully and safely logs out if denied without blocking system session resources.
* **Protected Profiles:** We exclude user-critical storage paths to guarantee you stay logged into your active browsers and Discord.

</details>

<details>
<summary><b>🔹 Will the Junk Cleaner log me out of my browsers?</b></summary>

**No.** The Enhanced Junk Cleaner is strictly engineered to delete **Cache, Code Cache, and GPU Cache**. It **NEVER** touches browser cookies, login states, saved forms, or active password databases.

</details>

<details>
<summary><b>🔹 Does "Compact OS" slow down my computer?</b></summary>

**No.** Compact OS is a native Windows compression algorithm optimized for SSDs. On modern multi-core processors, the impact is practically non-existent, and it frees up valuable system space instantly.

</details>

<details>
<summary><b>🔹 Why does the Health Check (DISM) seem stuck?</b></summary>

Native command routines like `DISM /RestoreHealth` often pause at specific milestones (e.g., 62.3%) while retrieving or verifying files from Microsoft servers in the background. This is completely normal behavior. Please allow the process to finish.

</details>

---

## 💻 System Requirements

* **Windows OS:** Windows 7, 8, 8.1, 10, 11 (Both 32-bit and 64-bit supported)
* **PowerShell:** PowerShell 3.0+
* **Privileges:** Administrator Rights (required for system-wide cleaning, drivers backup, and network resets)

---

## 📜 License

Distributed under the **MIT License**. See the [LICENSE](LICENSE) file for complete details.  
*Always backup important files before performing system-wide maintenance.* ⚠️

---

## ☕ Support & Connect

If you find this toolkit helpful, please consider supporting its continuous development:

[![Buy me a coffee](https://img.shields.io/badge/Saweria-Buy%20Me%20a%20Coffee-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![Star on GitHub](https://img.shields.io/badge/GitHub-Star%20Project-blue?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit)
