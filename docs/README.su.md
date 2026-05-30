# 🧰 ncexs Toolkit (NT)

🌐 [English](../README.md) | [Bahasa Indonesia](README.id.md) | [Basa Jawa](README.jv.md) | **Basa Sunda** | [हिन्दी](README.hi.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [中文](README.zh.md) | [العربية](README.ar.md)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **All-in-One Windows Toolkit** – Pakakas saderhana, gancang, tur aman pikeun meresihan, ngoptimalkeun, sarta ngarawat PC Windows anjeun ngaliwatan dashboard terminal nu hadé pisan.

---

## 🔥 Fitur Utama & Modul

### ⚡ Quick Fix & Diagnostik
* **Mata-mata Progres Langsung:** Titenan jalanna pancén sacara real-time ku persentase sareng bar visual langsung dina terminal anjeun.
* **Parios Kaséhatan Sistem:** Ngagunakeun pakakas bawaan SFC, DISM, sareng `chkdsk /scan` anu aman ku tampilan UI kustom sangkan anjeun terang kalayan écés iraha prosésna réngsé.

### 🧹 Panyimpenan & Meresihan
* **Kompresi Compact OS:** Ayeuna bersifat **dua arah** (ngarojong komprési sareng dekomprési), ngahémat **2GB – 5GB** rohangan panyimpenan.
* **Meresihan Runtah (Enhanced):** Ngabersihan folder sistem temp, Prefetch, CrashDumps, cache Windows Update, log CBS anu ngabareuhan, sareng cache shader GPU.
* **Pembersih Cache Aplikasi:** Mupus cache raksasa tina Discord, Spotify, Steam, Telegram, sareng WhatsApp kalayan aman tanpa ngaluarkeun anjeun tina akun.
* **Pembersih Event Logs:** Utilitas dumasar API .NET pikeun ngosongkeun sadaya log Windows Event Viewer **sacara instan (kirang ti 1 detik)**.
* **Smart App Uninstaller:** Pilarian gancang ngaliwatan registri sistem aktif pikeun milari sareng ngajalankeun uninstaller bawaan kalayan instan.
* **Recycle Bin & Disk Cleanup:** Ngosongkeun file dina Recycle Bin kalayan aman atawa memicu utilitas Disk Cleanup bawaan Windows.

### 🛠️ Pusat Pangropéa Sistem
* **Laporan Audit PC (HTML):** Nyieun laporan spésifikasi PC interaktif format HTML nu diékspor langsung ka Desktop. Ngadit CPU, RAM, detail OS, Motherboard, sareng **Akun Windows Aktif** kalayan labél hak aksés nu écés (Administrator vs Standar).
* **Pangropéa Sakali Klik:** Ngalakukeun pangropéa sistem otomatis (mupus runtah, DNS flush, SFC/DISM scan) bari tetep ngajaga Recycle Bin supados file penting henteu leungit.
* **Analisis Kaséhatan Baterai:** Ngitung tingkat keausan baterai real-time, atanapi ngadetéksi PC Desktop sacara dinamis.
* **Pengelola Remote Desktop (RDP):** Ngaktipkeun/nonaktipkeun RDP kalayan gancang sareng ngatur aturan Windows Firewall.
* **Pembersih Cache Browser:** Ngabersihan cache Google Chrome, Microsoft Edge, sareng Mozilla Firefox.

### ⚡ Performa & Optimasi
* **Optimasi Mémori:** Ngosongkeun mémori RAM nu henteu digunakeun pikeun ngabebaskeun mémori fisik, mintonkeun statistik RAM "Sateuacan & Saparantos".
* **Rencana Daya Pinter:** Mulangkeun rencana daya nu disumputkeun (High Performance vs Balanced) sareng ngatur tingkat caangna layar.
* **Optimasi Drive:** Ngajalankeun defrag/trim pinter ku aturan pangecualian otomatis pikeun partisi sistem sareng partisi nu disumputkeun.

### 🌐 Jaringan & Pakakas Admin
* **Ngalereskeun Jaringan:** Ngawengku 5 pakakas perbaikan penting (reset TCP/IP, reset Winsock, flush DNS, release/renew IP) pikeun ngalereskeun koneksi internet nu gangguan.
* **Pangganti DNS:** Ngalihkeun DNS kalayan gancang kana Cloudflare (1.1.1.1), Google DNS (8.8.8.8), Quad9, AdGuard (Blokir Iklan), atawa standar DHCP. Dilarapkeun ka **sadaya adaptor jaringan fisik nu aktip** sacara babarengan.
* **Wi-Fi Password Recovery:** Milari sareng mintonkeun kecap sandi (password) pikeun sakabéh jaringan lokal nu kungsi disimpen dina PC anjeun.
* **Update & Backup Driver:** Ngamutahirkeun sakabéh aplikasi ngagunakeun `winget` sareng nyimpen cadangan driver kana folder `C:\DriversBackup`.

---

## 🚀 Mimitian Gancang (Rilis Stabil)

Pikeun ngajalankeun ncexs Toolkit rilis stabil panganyarna tanpa kedah ngunduh file sacara manual:

1. Buka **Start Menu** anjeun, pilari **`powershell`**, klik katuhu, lajeng pilih **Run as Administrator**.
2. Salin sareng tempel (copy-paste) paréntah di handap ieu, lajeng teken **Enter**:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/ncexs-Toolkit.ps1" | iex
```

> [!TIP]
> Jalankeun toolkit ieu sabulan sakali pikeun ngajaga PC anjeun tetep beresih, séhat, tur optimal!

👉 **[Tingali Panduan Lengkep & Dokumentasi dina ncexs.github.io](https://ncexs.github.io/)**

---

## ⚙️ Panduan Lanjutan & FAQ

<details>
<summary><b>🛡️ Klik pikeun ningali Fitur Kaamanan & Transparansi</b></summary>

* **Kaverifikasi VirusTotal:** Skrip parantos diparios sapenuhna tur dipastikeun bébas tina virus/malware.
* **Open Source & Transparan:** Anjeun tiasa marios sakabéh jajaran PowerShell ku anjeun sorangan—henteu aya kode nu disumputkeun atawa file tambahan ti luar.
* **Aman pikeun Admin:** Nyuhunkeun widi administrator kalayan aman sareng kaluar kalayan beresih upami widi ditolak tanpa ngaganggu sistem.
* **Proteksi Sesi Aktif:** Simkuring ngalangkungan folder penting sangkan akun aktif dina browser sareng Discord henteu kaluar sacara dadakan.

</details>

<details>
<summary><b>🔹 Naha Meresihan Runtah bakal ngaluarkeun akun browser simkuring?</b></summary>

**Henteu.** Meresihan Runtah (Enhanced Junk Cleaner) dirancang husus ukur pikeun mupus **Cache, Code Cache, sareng GPU Cache**. Skrip ieu **PISAN HENTEU** nyabak cookies, sandi nu disimpen, riwayat, atawa database akun aktif anjeun.

</details>

<details>
<summary><b>🔹 Naha "Compact OS" ngadamel komputer janten lambat?</b></summary>

**Henteu.** Compact OS mangrupa kompresi bawaan Windows nu parantos dioptimalkeun pikeun SSD. Dina prosesor modern, pangaruhna ampir henteu karaos, sareng ngabebaskeun rohangan panyimpenan kalayan instan.

</details>

<details>
<summary><b>🔹 Naha Parios Kaséhatan (DISM) katingali eureun/macét?</b></summary>

Paréntah bawaan sapertos `DISM /RestoreHealth` sering eureun dina persentase tinangtu (misalna 62.3%) nalika ngunduh atawa verifikasi file ti server Microsoft. Ieu mangrupa hal nu lumrah. Mangga antosan dugi ka prosésna réngsé.

</details>

---

## 💻 Syarat Sistem

* **Sistem Operasi:** Windows 7, 8, 8.1, 10, 11 (Ngarojong 32-bit sareng 64-bit)
* **PowerShell:** Versi 3.0 atawa nu langkung anyar
* **Hak Akses:** Administrator (diperyogikeun pikeun meresihan sistem, nyimpen driver, sareng reset jaringan)

---

## 📜 Lisensi

Didistribusikeun di handapeun **MIT License**. Tingali file [LICENSE](../LICENSE) pikeun rincian lisensi lengkep.  
*Tansah ngadamel cadangan data penting sateuacan ngajalankeun pangrawatan sistem.* ⚠️

---

## ☕ Pangrojong & Hubungi

Upami anjeun ngaraos toolkit ieu mangpaat, mangga pasihan pangrojong pikeun pamekaran salajengna:

[![Saweria](https://img.shields.io/badge/Saweria-Pangrojong%20Kopi%20Simkuring-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![GitHub Star](https://img.shields.io/badge/GitHub-Star%20Proyék-blue?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit)
