# 🚀 ncexs Toolkit v3.5.1 Hotfix

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | [Basa Jawa](CHANGELOG.jv.md) | **Basa Sunda** | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – Pembaruan v3.5.1 Hotfix

### 🐛 Kadaitkeun Bug & Refaktor
- **Nyaketan RAM Optimizer**: Ngalereskeun kasalahan sintaks kompilasi C# dinamis (`Write-Debug` sareng block catch gaya PowerShell dina jero string C#) anu nyababkeun Menu 5 (Optimasi Memori) crash.
- **Kamus Tarjamahan Basa Sunda**: Nambihkeun tarjamahan sareng fallback anu langkung sae pikeun tampilan antarmuka.
- **Fallback Tarjamahan**: Ngaronjatkeun fungsi `Get-Translation` sangkan otomatis ngagunakeun Basa Inggris (EN) upami tarjamahan henteu kapendak.
- **Nyaketan Judul DNS Changer**: Ngalereskeun kasalahan judul menu DNS Changer anu sateuacana nembongkeun "PEMBERSIH CACHE APLIKASI" alih-alih "DNS Changer".
- **Dukungan Titik Dua SSID / Sandi WiFi**: Ngalereskeun masalah pamotongan nami atanapi sandi WiFi anu ngandung karakter titik dua (`:`).
- **Statistik Mersihan anu Akurat**: Ngamutahirkeun logika miceun file supados ngan ngitung ukuran file anu leres-reres hasil dipiceun.
- **Validasi Index Uninstaller**: Nambihkeun pamariksaan watesan index dina uninstaller pikeun nyegah error out of range.
- **Lokalisasi Menu Kasehatan**: Narjamahkeun pesen konsol dina menu Kasehatan Sistem.

---

# 🚀 ncexs Toolkit v3.5

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | [Basa Jawa](CHANGELOG.jv.md) | **Basa Sunda** | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🎓 ncexs Toolkit – v3.5 UAS Freedom Update

### ✨ Fitur & Peningkatan
- **System & App Deep Cleaner**: Ngahijikeun Runtah Sistem, Cache Aplikasi (ngadukung Teams, Zoom, Skype, Epic Games, GOG, WhatsApp, Discord, Spotify, Steam, Telegram), sareng Windows Event Logs janten hiji utilitas pembersih mendalam (`[11]`). Ngadukung operasi tiiseun (silent) di jero Pemeliharaan Sakali Klik.
- **Menu Diagnostik & Laporan Sistem**: Ngadamel sub-menu Diagnostik khusus (`[19]`) anu ngandung PC Audit HTML, laporan kasehatan baterai, pamariksaan lisensi Windows, sareng pamariksaan kasaluyuan Windows 11.
- **Pamariksa Kasaluyuan Windows 11**: Ngahijikeun pamariksa kasaluyuan hardware inti pikeun marios mode boot UEFI, status Secure Boot, sareng spésifikasi TPM 2.0 kalayan pituduh rekomendasi anu detil.
- **Pengelola Startup (Startup Manager)**: Nambihan manajer interaktif (`[18]`) pikeun ningali, ngaktipkeun, atanapi nganonaktipkeun aplikasi startup tina registry sareng folder startup.
- **Kategorisasi Logis UI Grid**: Ngatur deui perenah menu 2 kolom janten bagian anu teratur: Kolom Kénca pikeun Diagnostik & Utilitas Sistem, Kolom Katuhu pikeun Kinerja, Pembersihan & Optimasi.
- **CI/CD & Pipeline Kaamanan**: Ngahijikeun PSScriptAnalyzer pikeun analisis kode statis, Pester pikeun tés unit anu diisolasi, sareng VirusTotal CLI Action pikeun mindai malware otomatis dina unggal push kode.

---

# 🚀 ncexs Toolkit v3.4

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | [Basa Jawa](CHANGELOG.jv.md) | **Basa Sunda** | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – v3.4 Pembaruan Struktur Menu

### ✨ Fitur & Peningkatan
- **UI 2-Kolom Simétris**: Ngatur deui menu utama TUI (Terminal User Interface) janten tata perenah 2 kolom anu presisi sareng simetris kalayan leres 20 opsi (10 baris, 2 kolom).
- **Opsi Kaluar Berwarna Beureum**: Memetakan deui Opsi `[20]` pikeun kaluar ti toolkit (Keluar Aplikasi) dina posisi katuhu handap, sareng dipasihan warna beureum (`$global:Theme.Exit`) supados gampang ditingali.
- **Rute Menu Teroptimasi**: Nyaluyukeun logika switch pilihan (`switch ($choice)`) pikeun ngadukung 20 opsi sareng ngarahkeun input `"20"` pikeun kaluar sacara beresih.

---

# 🚀 ncexs Toolkit v3.3

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | [Basa Jawa](CHANGELOG.jv.md) | **Basa Sunda** | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – v3.3 Pembaruan Performa & Diagnostik

### ✨ Fitur & Peningkatan
- **Skor Kinerja WinSAT**: Ngahijikeun metrik Windows System Assessment Tool kana layar CLI Informasi Sistem sareng laporan audit PC interaktif (HTML). Nampilkeun bar rating warna visual (`█` sareng `░`) anu nunjukkeun kinerja sub-sistem (CPU, RAM, GPU, Gaming Grafis, Disk).
- **Kaséhatan Baterai dina Info Sistem**: Nambahkeun inpormasi kaséhatan baterai (persentase wear, kapasitas desain, full charge) sacara real-time langsung dina menu Informasi Sistem (otomatis dideteksi dina laptop).
- **Optimasi Kinerja Gédé-gédéan**:
  - **Beresih Cache Browser Super Gancang**: Ngoptimal keun nyukcruk diréktori kana tingkat folder, ngabersihkeun cache browser dugi ka 100x langkung gancang.
  - **Bypass Kompilasi RAM Cleaner**: Nambahkeun verifikasi jinis data aktif pikeun ngalangkungan kompilasi C# dina pembersihan RAM salajengna, ngaleungitkeun lag ngantosan.

### 🐛 Perbaikan Bug & Refaktor
- **Parser Laporan Baterai Tangguh**: Ngamutahirkeun pencocokan regex (`DESIGN CAPACITY.*?>\s*([\d,.]+)\s*mWh`) pikeun ngadukung format HTML Windows 11 panganyarna sareng ngabersihkeun pemisah rébuan sacara dinamis.
- **Kasaluyuan PowerShell 3.0**: Nereskeun pemanggilan type accelerator .NET (`[System.Net.ServicePointManager]`) dina paréntah ngamimitian gancang dina sadaya dokumén README pikeun ngadukung sistem heubeul.

---

# 🚀 ncexs Toolkit v3.2

## 🧰 ncexs Toolkit – v3.2 Pangropéa & Audit Sistem

### ✨ Fitur & Peningkatan
- **Pusat Pangropéa Sistem**: Nambihan sub-menu anyar nu komprehensif (Menu 17) nu dilengkepan ku pakakas ieu:
  - **Laporan Audit PC (HTML)**: Nyieun laporan spésifikasi PC interaktif format HTML nu diékspor langsung ka Desktop. Ngadit CPU, RAM, detail OS, Motherboard, sareng **Akun Windows Aktif** kalayan labél hak aksés nu écés (Administrator vs Standar).
  - **Pangropéa Sakali Klik**: Ngalakukeun pangropéa sistem otomatis (mupus runtah, DNS flush, SFC/DISM scan) bari tetep ngajaga Recycle Bin supados file penting teu leungit.
  - **Analisis Kaséhatan Baterai**: Ngitung tingkat keausan baterai real-time, atanapi ngadetéksi PC Desktop sacara dinamis.
  - **Pengelola Remote Desktop (RDP)**: Ngaktipkeun/nonaktipkeun RDP kalayan gancang sareng ngatur aturan Windows Firewall.
  - **Pembersih Cache Browser**: Ngabersihan cache Google Chrome, Microsoft Edge, sareng Mozilla Firefox.
- **Pembersihan Event Logs .NET**: Naronjatkeun fitur mupus Event Viewer ngagunakeun API .NET, éksekusi gancang kirang ti 1 detik.
- **DNS Multi-Adapter**: Nerapkeun konfigurasi DNS ka *sadaya adaptor jaringan fisik nu aktip* sacara babarengan.
- **Compact OS Dua Arah**: Ngarojong komprési (`/CompactOS:always`) sareng dekomprési (`/CompactOS:never`) file sistem.

### 🐛 Perbaikan Bug & Lokalisasi
- **Lokalisasi & Pengamanan**: Ngalereskeun bug basa campuran dina Compact OS ku cara mindahkeun sadaya string kana sistem `$global:Translations`.
- **Perlindungan File Pangguna**: Nyegah pambusakan Recycle Bin tina pangropéa otomatis supados berkas pangguna teu leungit.

---

# 🚀 ncexs Toolkit v3.1

## 🧰 ncexs Toolkit – v3.1 Pembaruan Pangawasaan Sistem

### ✨ Fitur & Peningkatan
- **Info Sistem Ditingkatkeun**: Mintonkeun detail motherboard, versi OS build, uptime, sareng Serial Number. Métrik panyimpenan langkung écés.
- **Pembersih Sampah Ekstra**: Mupus cache Windows Update, CrashDumps, WER, sareng log CBS pikeun méré rohangan nu langkung badag.
- **Pembersih Cache Aplikasi**: Ngagantikeun fungsi heubeul pikeun mupus cache Discord, Spotify, Steam, Telegram, sareng WhatsApp kalayan aman.
- **Pembersih Event Logs**: Nambihan aksi husus (Menu 16) pikeun mupus log Windows Event Viewer.
- **Métrik Live**: Menu Recycle Bin ayeuna mintonkeun persis sabaraha MB data anu parantos dipupus.
- **Pamariksaan Kaséhatan Aman**: Nambihan `chkdsk C: /scan` anu aman disarengan ku SFC sarta DISM.

### 🎨 UI & UX
- **Grid 17-Menu**: Antarmuka tos disampurnakeun supados tetep lempeng najan jumlahna ganjil (17).
- **Lokal Default**: Basa bawaan diatur kana Basa Inggris (EN).
- **Déprésiasi**: Mupus opsi Reset Windows Update demi kaamanan sistem anu optimal.

---

# 🚀 ncexs Toolkit v3.0.1

## 🧰 ncexs Toolkit – v3.0.1 Panyampurnaan Kaamanan & UX

### ✨ Fitur & Peningkatan
- **Panyampurnaan Kaamanan UX**: Nambihan pituduh pambatalan multi-basa nu écés sareng dinamis pikeun ngabantu pangguna ngartos kumaha carana ngabatalkeun tugas kalayan aman tanpa nutup terminal sacara paksa.
- **Pananganan Ctrl+C**: Nerapkeun panangkap éksépsi global (`trap [PipelineStoppedException]`) dina loop utama. Menet `Ctrl+C` pikeun ngabatalkeun tugas nu nuju jalan henteu bakal deui kaluar ti toolkit ka shell. Skrip ayeuna nangkep sinyal batal kalayan lemes, mintonkeun pesen pambatalan, sareng mulangkeun pangguna kana menu utama tanpa kedah ngajalankeun deui paréntah éksekusi.
- **Pangrojong Multi-basa**: Nambihan terjemahan `"Process_Cancel"` sareng `"Process_Aborted"` pikeun basa Inggris ("EN") sareng Indonesia ("ID"), nungtun pangguna ngabatalkeun prosés nganggo `Ctrl+C` iraha waé.
- **Péringatan Kontekstual**: Ngagabungkeun péringatan pambatalan kana pambantu konfirmasi standar sangkan mintonkeun otomatis sateuacan ngajalankeun prosés naon waé (sapertos Junk Cleaner, Defrag, Compact OS), sareng sateuacan ngawitan *Winget Upgrades* sarta *Driver Backups*.

---

# 🚀 ncexs Toolkit v3.0

## 🎓 ncexs Toolkit – v3.0 Build Pasca UTS

### ⚡ Éksekusi Langsung (Tanpa File Rilis)
- **Tanpa Ngunduh**: Ngawitan v3.0, simkuring ngaleungitkeun kabutuhan ngunduh file `.ps1` sacara manual tina kaca Rilis. Toolkit ayeuna tiasa jalan langsung tina branch `main` ngaliwatan hiji paréntah PowerShell, mastikeun anjeun salawasna ngajalankeun kode panganyarna.

### ✨ Fitur & Peningkatan
- **UI & Éstétika**: Ngganti seni ASCII utama ku desain 3D 'Big Money' nu kandel sareng ngarobih warnana janten Biru. Ngadamel opsi 'Ganti Basa' langkung katingali ku ngarobih warnana janten Konéng.
- **Lokalisasi**: Nambihan cakupan terjemahan lengkep dina basa Inggris sareng Indonesia. Ngaganti sakabéh string hardcode dina sababaraha fungsi toolkit ngagunakeun `Get-Translation`.
- **Ganti Basa Gancang**: Ngadamel ganti basa gancang [L] antawis basa Inggris sareng Indonesia. Ngalereskeun bug di mana sakelar case-insensitive ngarobih basa dua kali.
- **Pangganti DNS**: Nambihan sub-menu Pangganti DNS interaktif ku 5 panyedia utama.
- **Métrik Pangoptimal Detail**: Nambihan statistik MB 'Sateuacan/Saparantos' kana Junk Cleaner sareng Memory Optimizer.
- **Ngalereskeun Jaringan**: Nambihan notifikasi progres undak-usuk (IP Release/Renew, DNS Flush, Winsock/TCP reset).

### 🐛 Peleresan Bug & Refaktor
- **Loop Menu**: Ngalereskeun loop menu tanpa wates ku nambihan Clear-Host sareng kasus default dina switch.
- **Advanced Uninstaller**: Nambihan jeda (pause) nu leungit dina hasil Advanced Uninstaller.
- **Abstraksi String**: Ngarobih string hardcode janten kamus terjemahan global.

---

# 🚀 ncexs Toolkit v2.6

## 🎂 ncexs Toolkit – v2.6 Build Tepang Taun Pangembang

### ✨ Ditambihan
- ⚡ **Quick Fix**: Fitur pangrawatan "Sakali Klik" (Menu Q) nu ngotomatiskeun tilu tugas penting:
    - **Meresihan Runtah:** Ngabersihan file sementara sareng runtah sistem.
    - **Ngalereskeun Jaringan:** Mereset konfigurasi jaringan pikeun stabilitas nu langkung hadé.
    - **Optimasi Mémori:** Ngabebaskeun RAM standby pikeun nambihan responsivitas.
- 📐 **UI 2-Kolom Simétris** – Ngadamel tata letak 2 kolom nu presisi.
- 📂 **Akses Gancang Berdampingan** – Mintonkeun Compact OS (Menu 0) sareng Quick Fix (Menu Q) sacara berdampingan.
- 📊 **Integrasi Progres Dinamis** – Nambihan bar progres persentase real-time dina Quick Fix.

### 🎨 Peningkatan UI & UX
- 📏 **Batas Presisi** – Nerapkeun pemformatan string canggih pikeun ngaleungitkeun masalah batas katuhu nu "bergeser".
- 🔢 **Penomoran Pinter** – Angka [1-14] ayeuna rata katuhu.
- 💻 **Metadata di Tengah** – Header informasi Hostname sareng Pangguna diposisikeun di tengah handap bingkai.

### 🔧 Peleresan Bug
- Ngalereskeun pergeseran batas menu.
- Ngalereskeun spasi multi-warna dina Write-Host.
- Ngalereskeun kasalahan pemformatan dina judul menu nu pondok.

---

# 🚀 ncexs Toolkit v2.5 ngugi v2.0

Rilis sateuacanna ngawengku sababaraha paningkatan dina sistem pembersihan, manajemen uninstaller, perbaikan jaringan, sarta migrasi lengkep kana arsitektur PowerShell modular.
