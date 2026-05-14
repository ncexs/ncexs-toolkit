# 🧰 ncexs Toolkit (NT)

🌐 [English](../README.md) | [Bahasa Indonesia](README.id.md) | **Basa Jawa** | [Basa Sunda](README.su.md) | [हिन्दी](README.hi.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [中文](README.zh.md) | [العربية](README.ar.md)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **All-in-One Windows Toolkit** – Piranti prasaja, cepet, lan aman kanggo ngresiki, ngoptimalake, lan njaga PC lumantar dashboard terminal kang apik tenan.

---

## 🔥 Fitur Utama & Modul

### ⚡ Quick Fix & Diagnostik
* **Pangopènan Sepisan Klik:** Nglakokaké urutan otomatis kang nggabungaké Reresik Sampah, Ndandani Jaringan, lan Optimasi RAM kanthi sepisan pilih ing menu.
* **Ngawasi Progres Langsung:** Pantau lakuné tugas kanthi wektu nyata (real-time) nganggé persentase lan bar visual langsung ing terminal panjenengan.
* **Pemeriksa Kesehatan Sistem:** Nganggo piranti bawaan SFC lan DISM kanthi tampilan UI kustom supaya panjenengan mangerteni kanthi cetha kapan prosesé rampung.

### 🧹 Panyimpenan & Reresik
* **Kompresi Compact OS:** Ngompresi file sistem kanthi aman kanggo mbebasaké ruang panyimpenan **2GB – 5GB** tanpa nyuda performa utawa fitur sistem.
* **Reresik Sampah (Enhanced):** Ngresiki folder sistem temp, Prefetch, shader cache GPU, lan cache profil browser sing aktif (Chrome, Edge, Brave, WhatsApp Web).
* **Smart App Uninstaller:** Pados cepet lumantar registri sistem aktif kanggo nemokaké lan mbukak uninstaller bawaan kanthi cepet.
* **Recycle Bin & Disk Cleanup:** Ngosongaké file ing Recycle Bin kanthi aman utawa mbukak utilitas Disk Cleanup bawaan Windows.

### ⚡ Performa & Optimasi
* **Optimasi Memori:** Ngosongaké memori RAM sing ora digunakaké kanggo mbebasaké memori fisik, kanthi nuduhaké statistik RAM "Sadurungé & Sawisé".
* **Rencana Daya Pinter:** Mbalèkaké rencana daya sing didhelikaké (High Performance vs Balanced) lan ngatur tingkat padhang layar.
* **Optimasi Drive:** Nglakokaké defrag/trim pinter kanthi aturan pangecualian otomatis kanggo partisi sistem lan partisi sing didhelikaké.

### 🌐 Jaringan & Piranti Admin
* **Ndandani Jaringan:** Ngowahi 5 piranti perbaikan penting (reset TCP/IP, reset Winsock, flush DNS, release/renew IP) kanggo ndandani koneksi internet sing rusak.
* **Pangganti DNS:** Ngalihaké DNS kanthi cepet menyang Cloudflare (1.1.1.1), Google DNS (8.8.8.8), Quad9, AdGuard (Blokir Iklan), utawa standar DHCP.
* **Wi-Fi Password Recovery:** Nemokaké lan nuduhaké tembung sandhi (password) kanggo kabeh jaringan lokal sing disimpen ing PC panjenengan.
* **Update & Backup Driver:** Nganyari kabeh aplikasi nggunakaké `winget` lan nyimpen cadangan driver menyang folder `C:\DriversBackup`.

---

## 🚀 Mulai Cepet (Rilis Stabil)

Kanggo nglakokaké ncexs Toolkit rilis stabil paling anyar tanpa ngundhuh file kanthi manual:

1. Bukak **Start Menu**, padosi **`powershell`**, klik tengen, banjur pilih **Run as Administrator**.
2. Salin lan tempel (copy-paste) prentah ing ngisor iki, banjur tekan **Enter**:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/ncexs-Toolkit.ps1" | iex
```

> [!TIP]
> Laksanaken toolkit iki sewulan sepisan kanggo njaga PC panjenengan tetep resik, sehat, lan optimal!

👉 **[Priksani Panduan Lengkap & Dokumentasi ing ncexs.github.io](https://ncexs.github.io/)**

---

## ⚙️ Panduan Lanjutan & FAQ

<details>
<summary><b>🛡️ Klik kanggo priksani Fitur Keamanan & Transparansi</b></summary>

* **Terverifikasi VirusTotal:** Skrip wis dipriksa kabeh lan dipesthekake bebas saka virus/malware.
* **Open Source & Transparan:** Panjenengan saged mriksa kabeh baris PowerShell piyambak—ora ana kode sing didhelikake utawa file tambahan saka njaba.
* **Aman kanggo Admin:** Nyuwun ijin administrator kanthi aman lan metu kanthi resik yen ijin ditulak tanpa ngganggu sistem.
* **Proteksi Sesi Aktif:** Kita ngliwati folder penting supaya akun aktif ing browser lan Discord ora metu kanthi dadakan.

</details>

<details>
<summary><b>🔹 Apa Reresik Sampah bakal nggawe akun browser kula metu (logout)?</b></summary>

**Boten.** Reresik Sampah (Enhanced Junk Cleaner) dirancang mligi kanggo mbusak **Cache, Code Cache, lan GPU Cache**. Skrip iki **BABAR PISAN ORA** nyentuh cookies, sandhi sing disimpen, riwayat, utawa database akun aktif panjenengan.

</details>

<details>
<summary><b>🔹 Apa "Compact OS" nggawe komputer dadi alon?</b></summary>

**Boten.** Compact OS yaiku kompresi bawaan Windows sing wis dioptimalake kanggo SSD. Ing prosesor modern, efeke meh ora krasa, lan mbebasake papan panyimpenan kanthi cepet.

</details>

<details>
<summary><b>🔹 Ngopo Pemeriksa Kesehatan (DISM) katon mandheg?</b></summary>

Prentah bawaan kaya `DISM /RestoreHealth` asring mandheg ing persentase tartamtu (contone 62.3%) nalika ngundhuh utawa verifikasi file saka server Microsoft ing latar mburi. Iki minangka kahanan sing lumrah. Mangga ngenteni nganti prosese rampung.

</details>

---

## 💻 Syarat Sistem

* **Sistem Operasi:** Windows 7, 8, 8.1, 10, 11 (Mendhukung 32-bit lan 64-bit)
* **PowerShell:** Versi 3.0 utawa sing luwih anyar
* **Hak Akses:** Administrator (dibutuhake kanggo ngresiki sistem, nyimpen driver, lan reset jaringan)

---

## 📜 Lisensi

Didistribusekake ing ngisor **MIT License**. Priksani file [LICENSE](../LICENSE) kanggo rincian lisensi lengkap.  
*Tansah damel cadangan data penting sadurunge nglakokake pangopenan sistem.* ⚠️

---

## ☕ Dukungan & Sesambungan

Yen panjenengan ngira toolkit iki migunani, mangga paring panyengkuyung kanggo pangembangane:

[![Saweria](https://img.shields.io/badge/Saweria-Tumbasake%20Kopi%20Kula-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![GitHub Star](https://img.shields.io/badge/GitHub-Star%20Proyek-blue?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit)
