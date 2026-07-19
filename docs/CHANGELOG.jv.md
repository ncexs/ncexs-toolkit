# 🚀 ncexs Toolkit v3.5.1 Hotfix

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | **Basa Jawa** | [Basa Sunda](CHANGELOG.su.md) | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – Pembaruan v3.5.1 Hotfix

### 🐛 Dandani Bug & Refaktor
- **Ndandani RAM Optimizer**: Rampungake kesalahan sintaks kompilasi C# dinamis (`Write-Debug` lan block catch gaya PowerShell ing njero string C#) sing nyebabake Menu 5 (Optimasi Memori) crash nalika dilakokake.
- **Kamus Terjemahan Basa Jawa**: Nambahake terjemahan anyar lan fallback sing luwih apik kanggo tampilan antarmuka.
- **Fallback Terjemahan**: Nambah fungsi `Get-Translation` supaya otomatis nganggo Basa Inggris (EN) yen terjemahan ora ditemokake ing kamus liyane.
- **Ndandani Judul DNS Changer**: Ndandani kesalahan judhul menu DNS Changer sing sadurunge metu "PEMBERSIH CACHE APLIKASI" tinimbang "DNS Changer".
- **Dhukungan Titik Loro SSID / Sandi WiFi**: Ndandani masalah pemotongan jeneng utawa sandi WiFi sing ngemot karakter titik loro (`:`).
- **Statistik Resik-resik sing Akurat**: Nganyari logika mbusak file supaya mung ngetung ukuran file sing bener-bener kasil dibusak.
- **Validasi Index Uninstaller**: Nambahake pamriksaan watesan index ing uninstaller kanggo nyegah error out of range.
- **Lokalisasi Menu Kesehatan**: Nerjemahake pesen konsol ing menu Kesehatan Sistem.

---

# 🚀 ncexs Toolkit v3.5

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | **Basa Jawa** | [Basa Sunda](CHANGELOG.su.md) | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🎓 ncexs Toolkit – v3.5 UAS Freedom Update

### ✨ Fitur & Peningkatan
- **System & App Deep Cleaner**: Nggabungake Junk Sistem, Cache Aplikasi (Teams, Zoom, Skype, Epic Games, GOG, WhatsApp, Discord, Spotify, Steam, Telegram), lan Event Logs Windows dadi siji utilitas pembersih (`[11]`).
- **Menu Diagnostik & Laporan Sistem**: Nggawe sub-menu Diagnostik khusus (`[19]`) kanggo laporan PC Audit HTML, kesehatan baterei, lisensi Windows, lan kompatibilitas Windows 11.
- **Windows 11 Compatibility Checker**: Nambahake fitur mriksa kompatibilitas Windows 11 (UEFI, Secure Boot, TPM 2.0).
- **Startup Manager**: Nambahake fitur kanggo ngatur aplikasi startup registry lan folder (`[18]`).
- **Kategorisasi Menu**: Nata menu utama dadi 2 kolom sing logis (Kiwa: Diagnostik & Sistem, Tengen: Pembersihan & Optimasi).
- **CI/CD & Pipeline Keamanan**: Nggabungake PSScriptAnalyzer kanggo analisis kode statis, Pester kanggo tes unit terisolasi, lan VirusTotal CLI Action kanggo mindhai malware otomatis saben push kode.

---

# 🚀 ncexs Toolkit v3.4

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | **Basa Jawa** | [Basa Sunda](CHANGELOG.su.md) | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – v3.4 Pembaruan Struktur Menu

### ✨ Fitur & Peningkatan
- **UI 2-Kolom Simetris**: Ngowahi menu utama TUI (Terminal User Interface) dadi tata letak 2 kolom sing presisi lan simetris kanthi tepat 20 opsi (10 baris, 2 kolom).
- **Pilihan Metu Abang**: Mindhah Opsi `[20]` kanggo metu saka toolkit (Keluar Aplikasi) ing posisi tengen ngisor, lan diwenehi warna abang (`$global:Theme.Exit`) supaya gampang dingerteni.
- **Rute Menu Teroptimasi**: Nyelarasake logika switch pilihan (`switch ($choice)`) kanggo ndhukung 20 opsi lan ngarahake input `"20"` kanggo metu kanthi resik.

---

# 🚀 ncexs Toolkit v3.3

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | **Basa Jawa** | [Basa Sunda](CHANGELOG.su.md) | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – v3.3 Pembaruan Performa & Diagnostik

### ✨ Fitur & Peningkatan
- **Skor Kinerja WinSAT**: Nggabungake metrik Windows System Assessment Tool menyang layar CLI Informasi Sistem lan laporan audit PC interaktif (HTML). Nampilake bar rating warna visual (`█` lan `░`) sing nuduhake kinerja sub-sistem (CPU, RAM, GPU, Gaming Grafis, Disk).
- **Kesehatan Baterai ing Info Sistem**: Nambahake informasi kesehatan baterai (persentase wear, kapasitas desain, full charge) sacara real-time langsung ing menu Informasi Sistem (otomatis dideteksi ing laptop).
- **Optimasi Kinerja Gedhe-gedhean**:
  - **Reresik Cache Browser Super Cepet**: Ngoptimalake pelacakan direktori menyang tingkat folder, ngresiki cache browser nganti 100x luwih cepet.
  - **Bypass Kompilasi RAM Cleaner**: Nambahake verifikasi jinis data aktif kanggo ngliwati kompilasi C# ing pembersihan RAM sabanjure, ngilangi lag nunggu.

### 🐛 Perbaikan Bug & Refaktor
- **Parser Laporan Baterai Tangguh**: Nganyari pencocokan regex (`DESIGN CAPACITY.*?>\s*([\d,.]+)\s*mWh`) kanggo ndhukung format HTML Windows 11 paling anyar lan ngresiki pemisah ewonan sacara dinamis.
- **Kompatibilitas PowerShell 3.0**: Ndandani pemanggilan type accelerator .NET (`[System.Net.ServicePointManager]`) ing prentah wiwitan cepet ing kabeh dokumen README kanggo ndhukung sistem lawas.

---

# 🚀 ncexs Toolkit v3.2

## 🧰 ncexs Toolkit – v3.2 Pangopenan & Audit Sistem

### ✨ Fitur & Peningkatan
- **Pusat Pangopenan Sistem**: Nambahake sub-menu anyar sing komplit (Menu 17) kanthi piranti ing ngisor iki:
  - **Laporan Audit PC (HTML)**: Nggawe laporan spesifikasi PC interaktif format HTML sing diekspor langsung menyang Desktop. Ngadit CPU, RAM, detail OS, Motherboard, lan **Akun Windows Aktif** kanthi label hak akses sing cetha (Administrator vs Standar).
  - **Pangopenan Sepisan Klik**: Nindakake pangopenan sistem otomatis (ngresiki sampah, DNS flush, SFC/DISM scan) kanthi tetep njaga Recycle Bin supaya file penting ora ilang.
  - **Analisis Kesehatan Baterai**: Ngitung tingkat keausan baterai real-time, utawa ndeteksi PC Desktop sacara dinamis.
  - **Pengelola Remote Desktop (RDP)**: Ngaktifake/nonaktifake RDP kanthi cepet lan ngatur aturan Windows Firewall.
  - **Pembersih Cache Browser**: Ngresiki database cache Google Chrome, Microsoft Edge, lan Mozilla Firefox.
- **Pembersihan Event Logs .NET**: Nganyari fitur reresik Event Viewer nganggo API .NET, eksekusi cepet kurang saka 1 detik.
- **DNS Multi-Adapter**: Ngetrapake konfigurasi DNS menyang *kabeh adaptor jaringan fisik sing aktif* bebarengan.
- **Compact OS Rong Arah**: Ndhukung kompresi (`/CompactOS:always`) lan dekompresi (`/CompactOS:never`) file sistem.

### 🐛 Perbaikan Bug & Lokalisasi
- **Lokalisasi & Pengamanan**: Ndandani bug basa campuran ing Compact OS kanthi mindhah kabeh string menyang sistem `$global:Translations`.
- **Perlindungan File Pangguna**: Nyegah pambusakan Recycle Bin saka pangopenan otomatis supaya berkas pangguna ora ilang.

---

# 🚀 ncexs Toolkit v3.1

## 🧰 ncexs Toolkit – v3.1 Pembaruan Panguasaan Sistem

### ✨ Fitur & Peningkatan
- **Info Sistem Ditingkatake**: Nuduhake detail motherboard, versi OS build, uptime, lan Serial Number. Metrik panyimpenan luwih cetha.
- **Pembersih Sampah Ekstra**: Mbusak cache Windows Update, CrashDumps, WER, lan log CBS kanggo mbebasake ruang sing luwih gedhe.
- **Pembersih Cache Aplikasi**: Ngganti utilitas lawas kanggo mbusak cache Discord, Spotify, Steam, Telegram, lan WhatsApp kanthi aman.
- **Pembersih Event Logs**: Nambahake aksi khusus (Menu 16) kanggo mbusak log Windows Event Viewer.
- **Metrik Live**: Menu Recycle Bin lan liyane saiki nuduhake pira MB data sing wis kasil dibusak.
- **Pemeriksaan Kesehatan Aman**: Nambahake `chkdsk C: /scan` sing aman bebarengan karo SFC lan DISM.

### 🎨 UI & UX
- **Grid 17-Menu**: Antarmuka wis disempurnakake supaya tetep lurus sanajan jumlahe ganjil (17).
- **Lokal Default**: Basa gawan diowahi dadi Basa Inggris (EN).
- **Depresiasi**: Mbusak opsi Reset Windows Update kanggo ngamanake sistem kanthi maksimal.

---

# 🚀 ncexs Toolkit v3.0.1

## 🧰 ncexs Toolkit – v3.0.1 Penyempurnaan Keamanan & UX

### ✨ Fitur & Peningkatan
- **Penyempurnaan Keamanan UX**: Nambahake pituduh pembatalan multi-basa sing cetha lan dinamis kanggo mbantu pangguna mangerteni carane mbatalke tugas kanthi aman tanpa nutup jendela terminal kanthi peksa.
- **Penanganan Ctrl+C**: Nerapake panangkap eksepsi global (`trap [PipelineStoppedException]`) ing jero loop utama. Mencet `Ctrl+C` kanggo mbatalke tugas sing mlaku ora bakal maneh metu saka toolkit menyang shell. Skrip saiki nangkep sinyal batal kanthi alus, nuduhake pesan pembatalan, lan mbalekake pangguna menyang menu utama tanpa perlu nglakokake maneh prentah eksekusi.
- **Dukungan Multi-basa**: Nambahake terjemahan `"Process_Cancel"` lan `"Process_Aborted"` kanggo basa Inggris ("EN") lan Indonesia ("ID"), nuntun pangguna mbatalke proses nganggo `Ctrl+C` ing wektu apa wae.
- **Peringatan Kontekstual**: Nggabungake peringatan pembatalan menyang pambiyantu konfirmasi standar supaya muncul otomatis sadurunge nglakokake proses apa wae (kayata Junk Cleaner, Defrag, Compact OS), lan sadurunge miwiti *Winget Upgrades* sarta *Driver Backups*.

---

# 🚀 ncexs Toolkit v3.0

## 🎓 ncexs Toolkit – v3.0 Build Pasca UTS

### ⚡ Eksekusi Langsung (Tanpa File Rilis)
- **Tanpa Ngundhuh**: Wiwit v3.0, kita ngilangi kabutuhan ngundhuh file `.ps1` sacara manual saka kaca Rilis. Toolkit saiki mlaku langsung saka branch `main` liwat siji prentah PowerShell, mesthekake panjenengan tansah nglakokake kode paling anyar sanalika.

### ✨ Fitur & Peningkatan
- **UI & Estetika**: Ngganti seni ASCII utama kanthi desain 3D 'Big Money' sing kandel lan nganyari warnane dadi Biru. Nggawe opsi 'Ganti Basa' luwih cetha kanthi ngganti warnane dadi Kuning.
- **Lokalisasi**: Nambahake cakupan terjemahan jangkep ing basa Inggris lan Indonesia. Ngganti kabeh string hardcode ing macem-macem fungsi toolkit nganggo `Get-Translation`.
- **Ganti Basa Cepet**: Nggawe ganti basa cepet [L] antarane basa Inggris lan Indonesia. Ndandani bug ing ngendi sakelar case-insensitive ngowahi basa ping pindho.
- **Pangganti DNS**: Nambahake sub-menu Pangganti DNS interaktif kanthi 5 panyedia utama.
- **Metrik Pengoptimal Detail**: Nambahake statistik MB 'Sadurunge/Sawise' menyang Junk Cleaner lan Memory Optimizer.
- **Ndandani Jaringan**: Nambahake notifikasi progres langkah demi langkah (IP Release/Renew, DNS Flush, Winsock/TCP reset).

### 🐛 Perbaikan Bug & Refaktor
- **Loop Menu**: Ndandani loop menu tanpa wates kanthi nambahake Clear-Host lan kasus default ing pernyataan switch.
- **Advanced Uninstaller**: Nambahake jeda (pause) sing ilang ing asil Advanced Uninstaller.
- **Abstraksi String**: Ngowahi string hardcode dadi kamus terjemahan global.

---

# 🚀 ncexs Toolkit v2.6

## 🎂 ncexs Toolkit – v2.6 Build Ulang Tahun Pengembang

### ✨ Ditambahake
- ⚡ **Quick Fix**: Fitur pangopenan "Sepisan Klik" (Menu Q) sing ngotomatisake telung tugas penting:
    - **Reresik Sampah:** Ngresiki file sementara lan sampah sistem.
    - **Ndandani Jaringan:** Mereset konfigurasi jaringan kanggo stabilitas luwih apik.
    - **Optimasi Memori:** Mbebasake RAM standby kanggo nambah responsivitas.
- 📐 **UI 2-Kolom Simetris** – Nggawe tata letak 2 kolom sing presisi.
- 📂 **Akses Cepet Berdampingan** – Nuduhake Compact OS (Menu 0) lan Quick Fix (Menu Q) sacara berdampingan.
- 📊 **Integrasi Progres Dinamis** – Nambahake bar progres persentase real-time ing Quick Fix.

### 🎨 Peningkatan UI & UX
- 📏 **Batas Presisi** – Nerapake pemformatan string canggih kanggo ngilangi masalah batas kanan sing "bergeser".
- 🔢 **Penomoran Cerdas** – Angka [1-14] saiki rata tengen.
- 💻 **Metadata ing Tengah** – Header informasi Hostname lan Pengguna diposisikake ing tengah ngisor bingkai.

### 🔧 Perbaikan Bug
- Ndandani pergeseran batas menu.
- Ndandani spasi multi-warna ing Write-Host.
- Ndandani kesalahan pemformatan ing judul menu sing cendhak.

---

# 🚀 ncexs Toolkit v2.5

## 🎆 ncexs Toolkit – v2.5 Edisi Taun Anyar

### ✨ Ditambahake
- 📦 **Utilitas Compact OS** – Fitur (Menu 0) kanggo ngompresi biner sistem Windows, ngirit **2GB – 5GB** ruang disk tanpa mbusak file.
- 🔄 **Pusat Pembaruan & Driver** (Menu 11) – Hub terpusat sing nggabungake:
    - **Pembaruan Perangkat Lunak (Winget):** Nganyari aplikasi sacara otomatis.
    - **Pencadangan Driver:** Nyimpen driver menyang `C:\DriversBackup`.
    - **Perbaikan Windows Update:** Mereset komponen pembaruan.
- 🧹 **Reresik Sampah sing Ditingkatake** (Menu 2) – Ndhukung kabeh profil browser (Chrome, Edge, Brave) lan mbusak Cache Driver GPU.
- 🌐 **Pangganti DNS** – Ngalihake DNS menyang Google, Cloudflare, utawa DHCP.
- 🎆 **Animasi Intro** – Nambahake animasi kembang api lan spanduk "Welcome to 2026".
- 🔍 **Smart Uninstaller** – Uninstaller pemindai registri kanthi pencarian fuzzy.

### 🎨 Peningkatan UI & UX
- Tata letak 2 kolom modern nganggo karakter kotak.
- Perhitungan RAM "Sadurunge & Sawise".
- Bar progres persentase langsung ing konsol kanggo SFC lan DISM.

### 🔧 Perbaikan Bug
- Ndandani deteksi rencana daya High Performance.
- Ndandani pemilihan drive ing menu Defrag.
- Ndandani pembekuan prompt winget.

### ⚡ Performa
- Optimasi panyimpenan lan visual intro sing entheng.

---

# 🚀 ncexs Toolkit v2.4 nganti v2.0

Rilis sadurunge kalebu paningkatan maneka warna ing sistem pembersihan, manajemen uninstaller, perbaikan jaringan, lan migrasi jangkep menyang arsitektur PowerShell modular.
