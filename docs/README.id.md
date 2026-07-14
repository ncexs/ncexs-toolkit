# 🧰 ncexs Toolkit (NT)

🌐 [English](../README.md) | **Bahasa Indonesia** | [Basa Jawa](README.jv.md) | [Basa Sunda](README.su.md) | [हिन्दी](README.hi.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | [中文](README.zh.md) | [العربية](README.ar.md)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **All-in-One Windows Toolkit** – Alat pembersih, optimisasi, dan pemeliharaan PC Windows dalam satu dashboard terminal yang menawan dan berkecepatan tinggi.

---

## 🔥 Fitur Unggulan & Modul

### ⚡ Quick Fix & Diagnostik
* **Pelacakan Progres Langsung:** Pantau jalannya tugas secara real-time dengan umpan balik persentase dan bar visual langsung di terminal Anda.
* **Pemeriksa Kesehatan Sistem:** Memanggil SFC, DISM bawaan, dan pemindaian non-destruktif `chkdsk /scan` dengan render UI kustom agar Anda tahu persis jalannya progres pemicu kesehatan Windows Anda.
* **Menu Diagnostik & Laporan Sistem:** Sub-menu khusus yang berisi PC Audit HTML, analisa kesehatan baterai, lisensi Windows, dan status kompatibilitas Windows 11.
* **Pemeriksa Kompatibilitas Windows 11:** Memeriksa kesiapan perangkat keras termasuk mode boot UEFI, status Secure Boot, dan spesifikasi TPM 2.0.

### 🧹 Penyimpanan & Pembersihan
* **Kompresi Compact OS:** Kini bersifat **dua arah** (mendukung kompresi file OS dan dekompresi kembali ke default), menghemat **2GB – 5GB** ruang penyimpanan.
* **Pembersih Mendalam Sistem & Aplikasi:** Menggabungkan pembersihan sampah sistem, cache aplikasi (WhatsApp, Discord, Spotify, Steam, Telegram, Teams, Zoom, Skype, Epic Games, GOG), dan Windows Event Logs ke dalam satu menu pembersih serbaguna. Mendukung pembersihan senyap (silent) di dalam Pemeliharaan Satu Klik.
* **Smart App Uninstaller:** Pencarian fuzzy cepat melalui registri sistem aktif untuk mencari dan menjalankan uninstaller bawaan secara instan.
* **Recycle Bin & Disk Cleanup:** Mengosongkan file sampah di Recycle Bin dengan aman atau memicu utilitas bawaan Windows Disk Cleanup dengan cepat.

### 🛠️ Pusat Pemeliharaan Sistem
* **Pemeliharaan Satu Klik:** Melakukan pemeliharaan sistem otomatis (pembersihan sampah, pembersihan DNS, pemindaian SFC/DISM) dengan tetap mempertahankan Recycle Bin untuk menghindari hilangnya file penting milik pengguna.
* **Pengelola Startup (Startup Manager):** Fitur interaktif untuk melihat, mengaktifkan, atau menonaktifkan aplikasi startup dari Registry dan folder Startup.
* **Pengelola Remote Desktop (RDP):** Mengaktifkan/menonaktifkan RDP secara instan dan mengonfigurasi aturan Windows Firewall yang diperlukan.
* **Pembersih Cache Browser:** Membersihkan database cache dari Google Chrome, Microsoft Edge, dan Mozilla Firefox.

### ⚡ Performa & Optimasi
* **Optimasi Memori:** Mengosongkan *working set* RAM yang tidak terpakai untuk membebaskan memori fisik, menampilkan statistik "Sebelum & Sesudah" RAM yang jelas di terminal.
* **Visual FX Booster:** Mengoptimalkan responsivitas sistem dan mempercepat efek transisi visual (MenuShowDelay) secara instan.
* **Skema Daya Pintar:** Memulihkan skema daya tersembunyi (High Performance vs Balanced) dan mengoptimalkan tingkat kecerahan layar.
* **Optimasi Drive:** Menjalankan rutinitas defrag/trim cerdas dengan aturan pengecualian otomatis untuk partisi sistem dan partisi tersembunyi.

### 🌐 Jaringan & Alat Admin
* **Perbaikan Jaringan:** Mengotomatiskan 5 alat perbaikan penting (reset TCP/IP, reset Winsock, flush DNS, release/renew IP) untuk memulihkan konektivitas internet yang bermasalah.
* **Pengubah DNS:** Mengalihkan DNS dengan cepat ke Cloudflare (1.1.1.1), Google DNS (8.8.8.8), Quad9, AdGuard (Blokir Iklan), atau default (DHCP). Secara otomatis menerapkan konfigurasi ke **semua adapter jaringan fisik yang aktif** secara bersamaan.
* **Wi-Fi Password Recovery:** Memulihkan dan menampilkan kunci keamanan WPA/WPA2 untuk semua jaringan lokal yang pernah tersimpan di PC Anda.
* **Update & Backup Driver:** Memperbarui semua aplikasi terinstal via `winget` secara massal dan mengekspor driver pihak ketiga aktif ke folder aman `C:\DriversBackup`.

---

## 🚀 Mulai Cepat (Rilis Stabil)

Untuk menjalankan rilis stabil terbaru dari ncexs Toolkit secara langsung tanpa perlu mengunduh file secara manual:

1. Buka **Start Menu** Anda, cari **`powershell`**, klik kanan, lalu pilih **Run as Administrator**.
2. Salin dan tempel perintah di bawah ini, lalu tekan **Enter**:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/ncexs-Toolkit.ps1" | iex
```

> [!TIP]
> Jalankan toolkit ini setiap sebulan sekali untuk menjaga PC Anda tetap bersih, sehat, dan berperforma optimal!

👉 **[Lihat Panduan Lengkap & Dokumentasi di ncexs.github.io](https://ncexs.github.io/)**

---

## ⚙️ Panduan Lanjutan & FAQ

<details>
<summary><b>🛡️ Klik untuk melihat Fitur Keamanan & Transparansi</b></summary>

* **Terverifikasi VirusTotal:** Skrip sepenuhnya diaudit, dikonfirmasi 100% bebas dari malware/virus berbahaya, dan otomatis dipindai oleh VirusTotal pada setiap push kode.
* **Open Source & Transparan:** Tinjau setiap baris PowerShell sendiri—sama sekali tidak ada enkripsi, dependensi tersembunyi, atau file binary eksternal.
* **Aman & Sopan:** Meminta hak akses administrator secara transparan dan keluar secara bersih tanpa memblokir sesi Windows Anda jika akses ditolak.
* **Proteksi Sesi Aktif:** Kami mengecualikan folder kritis agar sesi aktif di browser dan Discord Anda tidak keluar secara mendadak.

</details>

<details>
<summary><b>🔹 Apakah Pembersih Sampah akan me-logout akun browser saya?</b></summary>

**Tidak.** Pembersih Sampah (Enhanced Junk Cleaner) dirancang secara khusus hanya untuk menghapus **Cache, Code Cache, dan GPU Cache**. Skrip **TIDAK AKAN PERNAH** menyentuh cookies, password tersimpan, riwayat pencarian, atau basis data sesi aktif Anda.

</details>

<details>
<summary><b>🔹 Apakah fitur "Compact OS" akan memperlambat komputer saya?</b></summary>

**Tidak.** Compact OS adalah algoritma kompresi bawaan Windows yang dirancang optimal untuk SSD/HDD. Pada prosesor multi-core modern, efek kinerjanya hampir tidak terasa (0%), sementara ruang penyimpanan berharga Anda akan bertambah secara instan.

</details>

<details>
<summary><b>🔹 Mengapa Pemeriksa Kesehatan (DISM) tampak berhenti/macet?</b></summary>

Perintah bawaan sistem seperti `DISM /RestoreHealth` sering kali terlihat tertahan di persentase tertentu (misalnya, 62.3%) ketika sedang mengunduh atau memverifikasi berkas dari server Microsoft. Ini adalah perilaku bawaan sistem yang normal. Silakan biarkan prosesnya berjalan hingga selesai.

</details>

---

## 💻 Persyaratan Sistem

* **Sistem Operasi:** Windows 7, 8, 8.1, 10, 11 (Mendukung arsitektur 32-bit dan 64-bit)
* **PowerShell:** Versi 3.0 atau yang lebih baru
* **Hak Akses:** Administrator (diperlukan untuk pembersihan sistem, pencadangan driver, dan reset jaringan)

---

## 📜 Lisensi

Didistribusikan di bawah **MIT License**. Lihat berkas [LICENSE](../LICENSE) untuk detail lisensi lengkap.  
*Selalu lakukan pencadangan data penting sebelum menjalankan pemeliharaan sistem.* ⚠️

---

## ☕ Dukungan & Hubungi kami

Jika Anda merasa toolkit ini bermanfaat, pertimbangkan untuk mendukung kelangsungan pengembangannya:

[![Saweria](https://img.shields.io/badge/Saweria-Dukung%20Kopi%20Saya-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![GitHub Star](https://img.shields.io/badge/GitHub-Star%20Proyek-blue?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit)
