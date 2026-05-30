# 🚀 ncexs Toolkit v3.3

🌐 [English](../CHANGELOG.md) | **Bahasa Indonesia** | [Basa Jawa](CHANGELOG.jv.md) | [Basa Sunda](CHANGELOG.su.md) | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – Pembaruan Performa & Diagnostik v3.3

### ✨ Fitur Baru & Peningkatan
- **Skor Performa WinSAT**: Mengintegrasikan metrik Windows System Assessment Tool ke dalam layar CLI Informasi Sistem dan laporan audit PC interaktif (HTML). Menghadirkan visualisasi bar berwarna (`█` & `░`) untuk menunjukkan performa sub-sistem (CPU, RAM, GPU, Gaming Grafis, Disk).
- **Kesehatan Baterai di Informasi Sistem**: Menambahkan informasi kesehatan baterai (persentase wear, kapasitas desain, full charge) secara real-time langsung di menu Informasi Sistem (otomatis terdeteksi pada laptop).
- **Optimasi Performa Besar-besaran**:
  - **Pembersihan Cache Browser Super Cepat**: Mengoptimalkan pelacakan direktori ke tingkat folder, melakukan pembersihan cache browser hingga 100x lebih cepat.
  - **Bypass Kompilasi RAM Cleaner**: Menambahkan verifikasi tipe data aktif untuk melewatkan kompilasi C# pada pembersihan RAM berikutnya, menghilangkan lag tunggu.

### 🐛 Perbaikan Bug & Refaktor
- **Parser Laporan Baterai Tangguh**: Memperbarui pencocokan regex (`DESIGN CAPACITY.*?>\s*([\d,.]+)\s*mWh`) untuk mendukung format HTML Windows 11 terbaru dan membersihkan pemisah ribuan secara dinamis.
- **Kompatibilitas PowerShell 3.0**: Memperbaiki pemanggilan type accelerator .NET (`[System.Net.ServicePointManager]`) pada perintah mulai cepat di seluruh dokumen README demi mendukung sistem lama.

---

# 🚀 ncexs Toolkit v3.2

## 🧰 ncexs Toolkit – v3.2 Pemeliharaan & Audit Sistem

### ✨ Fitur & Peningkatan
- **Pusat Pemeliharaan Sistem**: Menambahkan sub-menu komprehensif baru (Menu 17) yang dilengkapi dengan alat-alat berikut:
  - **Laporan Audit PC (HTML)**: Membuat laporan spesifikasi PC interaktif premium dan bersih dalam format HTML yang diekspor langsung ke Desktop. Mengaudit CPU, RAM, detail OS, Motherboard, ruang penyimpanan, dan **Akun Windows Aktif** dengan label hak akses yang jelas (Administrator vs Standar).
  - **Pemeliharaan Satu Klik**: Melakukan pemeliharaan sistem otomatis (pembersihan sampah, pembersihan DNS, pemindaian SFC/DISM) dengan tetap mempertahankan Recycle Bin untuk menghindari hilangnya file penting milik pengguna.
  - **Analisis Kesehatan Baterai**: Menghitung tingkat keausan baterai real-time, kapasitas desain, dan kapasitas isi penuh, atau mendeteksi PC Desktop secara dinamis.
  - **Pengelola Remote Desktop (RDP)**: Mengaktifkan/menonaktifkan RDP secara instan dan mengonfigurasi aturan Windows Firewall yang diperlukan.
  - **Pembersih Cache Browser**: Membersihkan database cache dari Google Chrome, Microsoft Edge, dan Mozilla Firefox.
- **Pembersihan Event Logs Cepat via .NET**: Meningkatkan fitur pembersih Event Viewer menggunakan kueri API .NET secara langsung, menghasilkan eksekusi instan kurang dari 1 detik (60x lebih cepat daripada proses berulang tradisional).
- **DNS Multi-Adapter**: Memperluas utilitas Pengubah DNS untuk menerapkan alamat DNS yang dikonfigurasi ke *semua adapter jaringan fisik yang aktif* secara bersamaan.
- **Compact OS Dua Arah**: Membangun ulang utilitas Compact OS untuk mendukung kompresi (`/CompactOS:always`) dan dekompresi (`/CompactOS:never`) file sistem.

### 🐛 Perbaikan Bug & Refaktor
- **Lokalisasi & Pengamanan**: Memperbaiki bug bahasa campuran pada Compact OS dengan mengabstraksikan seluruh string secara penuh ke sistem pemetaan `$global:Translations` untuk lokal Inggris dan Indonesia.
- **Perlindungan File Pengguna**: Mengecualikan Recycle Bin dari pemeliharaan otomatis demi melindungi berkas penting pengguna dari penghapusan yang tidak disengaja.

---

# 🚀 ncexs Toolkit v3.1

## 🧰 ncexs Toolkit – v3.1 Pembaruan Penguasaan Sistem

### ✨ Fitur & Peningkatan
- **Info Sistem Ditingkatkan**: Menampilkan detail motherboard, versi OS build, uptime, dan Serial Number. Metrik penyimpanan lebih jelas.
- **Pembersih Sampah Ekstra**: Membersihkan cache Windows Update, CrashDumps, WER, dan log CBS untuk membebaskan ruang besar.
- **Pembersih Cache Aplikasi**: Menggantikan utilitas lama untuk membersihkan cache Discord, Spotify, Steam, Telegram, dan WhatsApp dengan aman.
- **Pembersih Event Logs**: Menambahkan aksi khusus (Menu 16) untuk membersihkan log Windows Event Viewer.
- **Metrik Live**: Menu Recycle Bin dan lainnya kini menampilkan persis berapa MB data yang berhasil dihapus.
- **Pemeriksaan Kesehatan Aman**: Menambahkan pemindaian non-destruktif `chkdsk C: /scan` berdampingan dengan SFC dan DISM.

### 🎨 UI & UX
- **Grid 17-Menu**: Antarmuka disempurnakan untuk menampung jumlah ganjil (17) menu dengan mulus.
- **Lokal Default**: Bahasa default diatur ke Bahasa Inggris (EN).
- **Depresiasi**: Menghapus opsi Reset Windows Update demi keamanan sistem yang maksimal.

---

# 🚀 ncexs Toolkit v3.0.1

## 🧰 ncexs Toolkit – v3.0.1 Penyempurnaan Keamanan & UX

### ✨ Fitur & Peningkatan
- **Penyempurnaan Keamanan UX**: Menambahkan instruksi pembatalan multi-bahasa yang jelas dan dinamis untuk membantu pengguna memahami cara membatalkan tugas dengan aman tanpa menutup jendela terminal secara paksa.
- **Penanganan Anggun Ctrl+C**: Menerapkan penangkap eksepsi global (`trap [PipelineStoppedException]`) di dalam loop utama. Menekan `Ctrl+C` untuk membatalkan tugas yang sedang berjalan tidak akan lagi keluar dari toolkit ke shell. Skrip kini menangkap sinyal batal dengan anggun, menampilkan pesan pembatalan lokal, dan mengembalikan pengguna ke menu utama tanpa perlu menjalankan ulang perintah eksekusi!
- **Dukungan Multibahasa**: Mengimplementasikan string terjemahan baru `"Process_Cancel"` dan `"Process_Aborted"` yang mencakup bahasa Inggris ("EN") dan Indonesia ("ID"), memandu pengguna untuk membatalkan/menghentikan proses menggunakan `Ctrl+C` kapan saja.
- **Peringatan Kontekstual**: Mengintegrasikan peringatan pembatalan ke dalam pembantu konfirmasi standar sehingga muncul otomatis sebelum mengeksekusi proses apa pun (mis. Junk Cleaner, Defrag, Compact OS), dan tepat sebelum memulai *Winget Upgrades* serta *Driver Backups*.

---

# 🚀 ncexs Toolkit v3.0

## 🎓 ncexs Toolkit – v3.0 Build Pasca UTS

### ⚡ Eksekusi Langsung (Tanpa File Rilis)
- **Tanpa Unduhan**: Mulai dari v3.0, kami telah menghilangkan kebutuhan untuk mengunduh file `.ps1` secara manual dari halaman Rilis. Toolkit kini berjalan langsung dari branch `main` melalui satu perintah PowerShell, memastikan Anda selalu menjalankan kode terbaru secara instan.

### ✨ Fitur & Peningkatan
- **UI & Estetika**: Mengganti seni ASCII utama dengan desain 3D 'Big Money' yang tebal dan memperbarui warnanya menjadi Biru. Meningkatkan visibilitas opsi 'Ganti Bahasa' dengan mengubah warnanya menjadi Kuning.
- **Lokalisasi**: Menambahkan cakupan terjemahan penuh bahasa Inggris dan Indonesia. Mengganti semua string hardcode di dalam berbagai fungsi toolkit dengan `Get-Translation` untuk memastikan peralihan bahasa berfungsi sempurna di seluruh skrip.
- **Ganti Bahasa Cepat**: Mengimplementasikan peralihan bahasa cepat [L] antara bahasa Inggris dan Indonesia. Memperbaiki bug di mana sakelar case-insensitive mengalihkan bahasa dua kali.
- **Pengubah DNS**: Menambahkan sub-menu Pengubah DNS interaktif dengan 5 penyedia utama. Memodifikasi 'Pusat Pembaruan & Driver' (Menu 11) dan 'Pengubah DNS' (Menu 12) agar dieksekusi sebaris di dalam menu utama daripada membuka layar terpisah.
- **Metrik Pengoptimal Detail**: Menambahkan statistik MB 'Sebelum/Sesudah' ke Junk Cleaner dan Memory Optimizer.
- **Perbaikan Jaringan**: Menambahkan notifikasi progres langkah demi langkah (IP Release/Renew, DNS Flush, Winsock/TCP reset) untuk memberikan umpan balik pengguna yang lebih baik.

### 🐛 Perbaikan Bug & Refaktor
- **Loop Menu**: Memperbaiki loop menu tak terbatas dengan menambahkan Clear-Host dan kasus default pada pernyataan switch.
- **Advanced Uninstaller**: Menambahkan jeda (pause) yang hilang pada hasil Advanced Uninstaller.
- **Abstraksi String**: Mengabstraksi string hardcode ke dalam kamus terjemahan global.

---

# 🚀 ncexs Toolkit v2.6

## 🎂 ncexs Toolkit – v2.6 Build Ulang Tahun Pengembang

### ✨ Ditambahkan
- ⚡ **Quick Fix (Utilitas Ulang Tahun Khusus)** – Menambahkan fitur pemeliharaan "Sekali Klik" (Menu Q) yang mengotomatiskan tiga tugas penting secara berurutan:
    - **Pembersihan Sampah:** Secara otomatis membersihkan file sementara dan sampah sistem.
    - **Perbaikan Jaringan:** Mereset konfigurasi jaringan untuk stabilitas yang lebih baik.
    - **Optimasi Memori:** Membebaskan RAM standby untuk meningkatkan responsivitas sistem.
- 📐 **UI 2-Kolom Simetris** – Membangun ulang menu utama dengan tata letak 2 kolom yang presisi, memastikan semua batas dan pembatas tetap lurus sempurna.
- 📂 **Akses Cepat Berdampingan** – Merancang ulang baris atas untuk menampilkan **Compact OS (Menu 0)** dan **Quick Fix (Menu Q)** secara berdampingan untuk navigasi yang lebih cepat dan tampilan modern.
- 📊 **Integrasi Progres Dinamis** – Menambahkan bar progres persentase real-time ke utilitas Quick Fix untuk memberikan umpan balik visual selama eksekusi.

### 🎨 Peningkatan UI & UX
- 📏 **Batas Presisi** – Menerapkan pemformatan string tingkat lanjut untuk menghilangkan masalah batas kanan yang "bergeser", memastikan antarmuka berbentuk kotak yang rapi.
- 🔢 **Penomoran Cerdas** – Angka [1-14] kini rata kanan, mencegah tata letak rusak saat beralih antara satu dan dua digit.
- 💻 **Metadata di Tengah** – Header informasi Hostname dan Pengguna kini diposisikan secara matematis di tengah bawah bingkai toolkit.

### 🔧 Perbaikan Bug
- **Memperbaiki Pergeseran Batas** – Menyelesaikan masalah lama di mana garis vertikal kanan rusak karena panjang teks menu yang bervariasi.
- **Memperbaiki Spasi Multi-Warna** – Menghilangkan "spasi hantu" yang disebabkan oleh perilaku bawaan Write-Host PowerShell ketika menangani banyak warna.
- **Memperbaiki Kesalahan Pemformatan** – Menghapus logika substring berisiko yang sebelumnya menyebabkan pesan kesalahan merah ketika judul menu terlalu pendek.

---

# 🚀 ncexs Toolkit v2.5

## 🎆 ncexs Toolkit – v2.5 Edisi Tahun Baru

### ✨ Ditambahkan
- 📦 **Utilitas Compact OS** – Menambahkan fitur khusus (Menu 0) untuk mengompresi biner sistem Windows, mampu menghemat **2GB – 5GB** ruang disk tanpa menghapus file.
- 🔄 **Pusat Pembaruan & Driver** – (Menu 11) Hub terpusat baru yang menggabungkan tiga alat penting:
    - **Pembaruan Perangkat Lunak (Winget):** Memperbarui semua aplikasi terinstal secara otomatis dengan satu klik.
    - **Pencadangan Driver:** Mengekspor driver pihak ketiga ke lokasi aman (default: `C:\DriversBackup`), penting sebelum menginstal ulang Windows.
    - **Perbaikan Windows Update:** Mereset komponen pembaruan (`wuauserv`, `bits`) untuk memperbaiki pembaruan yang macet.
- 🧹 **Pembersih Sampah yang Ditingkatkan** – Peningkatan besar pada logika pembersihan (Menu 2):
    - **Dukungan Multi-Profil:** Kini mendeteksi dan membersihkan cache dari *semua* profil browser (bukan hanya 'Default') untuk Chrome, Edge, dan Brave.
    - **Pembersihan Mendalam:** Menambahkan dukungan untuk menghapus **Cache Driver GPU** (AMD DxCache, NVIDIA GLCache, Intel ShaderCache) dan unduhan Windows Update lama.
- 🌐 **Pengubah DNS** – Menambahkan menu cepat untuk mengalihkan DNS adaptor jaringan aktif ke **Google (8.8.8.8)**, **Cloudflare (1.1.1.1)**, atau kembali ke **Otomatis (DHCP)**.
- 🎆 **Animasi Intro Perayaan** – Menambahkan animasi kembang api dinamis dan spanduk ASCII besar "Welcome to 2026" saat startup.
- 🔍 **Smart Uninstaller** – Mengganti metode lama dengan uninstaller pemindai registri yang mendukung **pencarian fuzzy** dan navigasi cepat.
- 🛡️ **Konfirmasi Keamanan** – Menerapkan prompt konfirmasi wajib **(Y/N)** untuk semua tindakan eksekusi demi mencegah klik yang tidak disengaja.

### 🎨 Peningkatan UI & UX
- 📐 **Perombakan UI Modern** – Merancang ulang antarmuka sepenuhnya dengan **tata letak 2 kolom** menggunakan karakter kotak untuk tampilan yang lebih bersih dan profesional.
- 📊 **Statistik RAM** – Menambahkan perhitungan **"Sebelum & Sesudah"** pada Memory Optimizer (Menu 8) untuk menunjukkan secara tepat berapa MB RAM yang dibebaskan.
- 👁️ **Visibilitas Proses Real-time** – Mengubah metode eksekusi untuk SFC dan DISM (Menu 10) untuk menampilkan **bar progres persentase langsung** di konsol.
- ⚠️ **Peringatan Cerdas** – Menambahkan pesan saran khusus untuk proses yang berjalan lama seperti DISM untuk memberi tahu pengguna bahwa jeda pada persentase tertentu adalah normal.
- 🏆 **Tema "Emas" Baru** – Menerapkan skema warna Emas & Cyan perayaan dengan penyorotan khusus untuk fitur premium.

### 🔧 Perbaikan Bug
- **Memperbaiki Logika Skema Daya** – Skrip kini mendeteksi jika skema High Performance/Saver disembunyikan oleh Windows dan secara otomatis memulihkannya.
- **Memperbaiki Pemilihan Drive** – Menu Defrag (Menu 9) kini menampilkan daftar bernomor untuk navigasi yang lebih mudah dan memfilter partisi tersembunyi.
- **Memperbaiki Prompt Winget** – Menyelesaikan masalah di mana `winget` membeku menunggu input pengguna.
- **Memperbaiki Pembersihan Browser** – Menyelesaikan masalah di mana cache Chrome/Brave dilewati jika jalur folder tidak cocok dengan profil "Default".
- **Memperbaiki Seni ASCII** – Memperbaiki tipografi spanduk "Tahun Baru" agar lebih mudah dibaca.

### ⚡ Performa
- 🚀 **Optimasi Penyimpanan** – Fitur Compact OS baru memberikan peningkatan performa dan penyimpanan yang signifikan.
- 🎨 **Visual Teroptimasi** – Logika animasi intro baru sangat ringan dan tidak memengaruhi waktu startup skrip.

---

# 🚀 ncexs Toolkit v2.4

## 🧰 ncexs Toolkit – v2.4 Rilis Teroptimasi

### ✨ Ditambahkan
- 🔬 **Advanced Uninstaller** – Mengganti pintasan `appwiz.cpl` dasar dengan uninstaller pemindai registri baru.
- 🖥️ **Info Sistem Detail** – Fungsi 'Show-SystemInfo' kini menampilkan versi driver GPU yang terinstal (AMD, Intel, NVIDIA) dan RAM Bebas saat ini.
- 🌐 **Perbaikan Jaringan Terkonsolidasi** – Menggabungkan 5 perbaikan jaringan menjadi satu tindakan komprehensif.
- 🔋 **Menu Daya & Baterai Baru** – Menambahkan sub-menu Utilitas Daya & Baterai, menampilkan Laporan Kesehatan Baterai.
- 🎨 **Tema Warna UI Baru** – Menerapkan tema warna baru pada antarmuka pengguna untuk tampilan yang lebih modern.

### 🔧 Perbaikan Bug
- **Memperbaiki Kesalahan Parsing Kritis** – Menyelesaikan kesalahan pengodean fatal yang menyebabkan seluruh skrip gagal.
- **Memperbaiki Info Sistem Rusak** – Menghapus tampilan "Uptime" yang tidak berfungsi untuk mencegah kebingungan.
- **Memperbaiki Logika Restart Admin** – Memperbaiki bug jalur absolut yang mencegah "Restart as Admin" berfungsi.

### ⚡ Performa
- 🤖 **Pembersih Sampah Agnostik Perangkat Keras** – Pembersih kini mendeteksi cache AMD, Intel, & NVIDIA secara cerdas.
- 🧹 **Pembersihan Lebih Menyeluruh** – Menambahkan cache Windows Update ke daftar jalur pembersihan.
- 🔇 **Operasi Lebih Tenang** – Memperbaiki logika Junk Cleaner untuk mengurangi kebisingan log yang tidak perlu selama pembersihan.

---

# 🚀 ncexs Toolkit v2.3

## 🧰 ncexs Toolkit – v2.3 Rilis yang Disempurnakan

### ✨ Ditambahkan
- 🚀 **Pengoptimal Memori Kuat** – Menggunakan API Windows (`EmptyWorkingSet`) untuk membersihkan cache sistem dan membebaskan lebih banyak RAM.
- 🌐 **Utilitas Jaringan Sederhana** – Seluruh menu disederhanakan menjadi satu tindakan "Perbaikan Jaringan Otomatis".
- 🛡️ **Pemeriksaan Keamanan SSD** – Alat Defrag kini otomatis mendeteksi dan melewati SSD untuk mencegah aus yang tidak perlu.
- 🧹 **Pembersih Sampah yang Ditingkatkan** – Kini menargetkan folder `Prefetch` dan cache browser tanpa menutup paksa browser Anda.

### 🔧 Perbaikan Bug
- **Memperbaiki Bug Konfirmasi Kritis** – Junk Cleaner kini membatalkan operasi dengan benar saat Anda memilih "Tidak".
- **Memperbaiki Deteksi Adaptor Jaringan** – Menghapus pengubah DNS yang tidak peka untuk menghilangkan sumber kesalahan.
- **Memperbaiki Pemindaian Pembersihan Tidak Lengkap** – Memperbaiki salah ketik (`-Recourse` ke `-Recurse`).

### ⚡ Performa
- **Pemulihan RAM Drastis** – Peningkatan memori tersedia yang jauh lebih besar dibandingkan versi sebelumnya.
- **Pembersihan Lebih Cepat & Aman** – Proses pembersihan sampah kini lebih efisien dan tidak mengganggu sesi penelusuran.
- **Eksekusi Lebih Andal** – Skrip kini lebih stabil dan dapat diprediksi.

---

# 🚀 ncexs Toolkit v2.2.2

##  🧰 ncexs Toolkit – v2.2.2 Hotfix Akhir

### ✨ Ditambahkan
- 🔧 Manajer Startup yang Ditingkatkan – memperbaiki masalah jalur folder  
- 🌐 Dukungan Multi-bahasa yang Ditingkatkan – terjemahan yang lebih akurat  
- 📋 Sistem Pencatatan Lebih Baik – pelacakan kesalahan yang ditingkatkan  

### 🔧 Perbaikan Bug
- Memperbaiki Masalah Folder Startup  
- Memperbaiki Penanganan Jalur dalam manajemen startup  
- Memperbaiki keandalan Penanganan Startup Registri  
- Memperbaiki Logika Perpindahan File antara folder Startup dan Disabled  

### ⚡ Performa
- Memuat skrip lebih cepat  
- Mengurangi penggunaan sumber daya  
- Peningkatan hak admin yang lebih lancar  

---

# 🚀 ncexs Toolkit v2.2.1

## 🧰 v2.2.1 – Rilis Hotfix

### ✨ Ditambahkan  
- 🌐 Dukungan Multi-bahasa (ID/EN)
- 🔐 Manajer Startup Lanjutan
- 📋 Kompatibilitas PC Universal
- 🛡️ Manajemen Akses Admin Cerdas

### 🔧 Perbaikan Bug  
- Memperbaiki masalah kebijakan eksekusi PowerShell
- Menyelesaikan konflik izin admin
- Memperbaiki kesalahan pengosongan Recycle Bin di sistem lama
- Memperbaiki masalah kompatibilitas utilitas jaringan

---

# 🚀 ncexs Toolkit v2.2

## 🧰 v2.2 – Rilis Lanjutan  

### ✨ Ditambahkan  
- 🗑️ Menu Recycle Bin Kustom → dengan pratinjau file dan konfirmasi keamanan  
- 📋 Tata Letak Menu Utama Baru → diatur ulang untuk kejelasan dan kemudahan navigasi  

### 🔧 Ditingkatkan
Akurasi informasi sistem, indikator progres, performa, penanganan kesalahan, dan manajemen akses admin.

---

# 🚀 ncexs Toolkit v2.1

## 🧰 v2.1 – Edisi yang Ditingkatkan  

### ✨ Ditambahkan  
- 📊 Dasbor Info Sistem (Menu 1)  
- 🌐 Perbaikan Jaringan (Menu 6)  
- 📝 Pencatatan yang Ditingkatkan  
- ⏳ Indikator Progres  

### 🔧 Ditingkatkan  
Berbagai fitur telah disempurnakan untuk stabilitas dan kegunaan yang lebih baik.  

---

# 🚀 ncexs Toolkit v2.0

## 🧰 v2.0 – Rilis Diperluas  

### ✨ Ditambahkan  
- 📜 Sistem menu interaktif (1–5):  
  - 1 → Pembersih Sampah & Cache  
  - 2 → Pembersihan Mendalam  
  - 3 → Pemindaian Antivirus  
  - 4 → Bersihkan RAM  
  - 5 → Keluar dari program  
- 🧽 Integrasi Pembersihan Mendalam → sisa uninstal, kunci yatim registri, temp & sampah sistem  
- 🛡️ Pemindaian antivirus berjalan sebaris (tanpa jendela PowerShell tambahan)  
- 📝 Sistem log yang bersih dan berstempel waktu  

### 🔧 Ditingkatkan  
Bermigrasi ke PowerShell dengan desain modular untuk stabilitas dan fleksibilitas yang lebih baik.  

### 🗑️ Dihapus  
Prompt `[Y/N]` lama dan kompatibilitas skrip batch lama.  
