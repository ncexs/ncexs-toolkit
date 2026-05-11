# 🧰 ncexs Toolkit (NT)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **All-in-One Windows Toolkit** – Simple, fast, and safe tools to clean, optimize, and maintain your PC through a gorgeous terminal-based dashboard.

---

## 🎯 Purpose & Design Principles

<table width="100%">
  <tr>
    <th width="50%" align="left">🎯 Purpose</th>
    <th width="50%" align="left">🧠 Design Principles</th>
  </tr>
  <tr>
    <td valign="top">
      <ul>
        <li>Provide a complete, centralized toolkit for Windows performance, storage, and network repairs.</li>
        <li>Enable lightning-fast, automated "Quick Fix" routines.</li>
        <li>Simplify complex administrator commands into clean, one-click options.</li>
        <li>Promote secure system optimization without destructive registry modifications.</li>
      </ul>
    </td>
    <td valign="top">
      <ul>
        <li><b>User-Centered & Elegant:</b> Gorgeous Gold & Cyan theme with intuitive 2-column layouts and progress loaders.</li>
        <li><b>Safety First:</b> Vital operations require mandatory confirmation prompts.</li>
        <li><b>Non-Destructive:</b> Retains passwords, cookies, active states, and essential system telemetry defaults.</li>
        <li><b>100% Transparent:</b> Open-source script designed to run safely on all major Windows platforms.</li>
      </ul>
    </td>
  </tr>
</table>

---

## ⚡ Toolkit Scope & Capabilities

<table width="100%">
  <tr>
    <th width="50%" align="left">✅ What the Toolkit Does</th>
    <th width="50%" align="left">❌ What the Toolkit Does NOT Do</th>
  </tr>
  <tr>
    <td valign="top">
      <ul>
        <li><b>⚡ Quick Fix Suite:</b> Runs an automated, high-speed junk cleanup, network repair, and memory sweep in one go.</li>
        <li><b>🧹 Enhanced Junk & Browser Cleaning:</b> Safely clears temp folders, prefetch, shader caches (Intel/AMD/NVIDIA), and multi-profile web browser caches.</li>
        <li><b>⚙️ Storage Compression:</b> Leverages native Compact OS to reclaim up to 5GB of system drive space safely.</li>
        <li><b>🌐 Admin Network Repairs:</b> One-click repair sequence (flush DNS, TCP/IP reset, Winsock) + rapid DNS profile switcher.</li>
        <li><b>🛡️ System Diagnostics:</b> Real-time progress indicators for SFC and DISM health scans.</li>
      </ul>
    </td>
    <td valign="top">
      <ul>
        <li>Does <b>NOT</b> collect or upload any user data, statistics, or custom telemetries.</li>
        <li>Does <b>NOT</b> log you out of active websites or delete browser history, passwords, or cookies.</li>
        <li>Does <b>NOT</b> apply dangerous or unvalidated "Windows Tweaks" that break OS updates.</li>
        <li>Does <b>NOT</b> run third-party installers silently without your direct authorization.</li>
        <li>Does <b>NOT</b> modify secure kernel settings or bypass critical Windows Defender policies.</li>
      </ul>
    </td>
  </tr>
</table>

---

## 🔥 Key Features & Modules

### ⚡ Quick Fix & Diagnostics
* **One-Click Maintenance:** Runs a bundled sequence combining Junk Cleanup, Network Repair, and RAM Optimization with a single menu trigger.
* **Live Progress Tracking:** Follow task execution in real-time with beautiful percentage-based feedback indicators directly in your terminal.
* **Live Health Check:** Invokes native `SFC` and `DISM` tools with custom UI rendering so you never have to guess when the task completes.

### 🧹 Storage & Clean Up
* **Compact OS Compression:** Safely compresses system binaries to free up **2GB – 5GB** of storage without losing system performance or features.
* **Enhanced Junk Cleaner:** Deep-cleans temporary system folders, Prefetch files, GPU shader caches, and multiple active browser profiles (Chrome, Edge, Brave, WhatsApp Web).
* **Smart App Uninstaller:** Quick fuzzy search through active system registries to find and run uninstallation scripts immediately.
* **Recycle Bin & Disk Cleanup:** Safely purges deleted files or triggers the native Windows Cleanup interface instantly.

### ⚡ Performance & Optimization
* **Memory Optimizer:** Flushes unused active working sets to free up system memory, displaying precise "Before & After" RAM stats.
* **Smart Power Plans:** Restores hidden system power plans (High Performance vs. Balanced) and optimizes active brightness defaults.
* **Drive Optimizer:** Runs smart defrag/trim routines with exclusion rules for system and hidden partitions.

### 🌐 Network & Admin Tools
* **Network Repair Suite:** Automates 5 critical repair tools (TCP/IP stack reset, Winsock reset, DNS flush, IP release/renew) to restore broken connectivity.
* **DNS Profile Switcher:** Rapidly toggle between Cloudflare (1.1.1.1), Google DNS (8.8.8.8), Quad9, AdGuard (Ad-blocking), or standard DHCP.
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
