# 🚀 ncexs Toolkit v3.1

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | [Basa Jawa](CHANGELOG.jv.md) | **Basa Sunda** | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | [中文](CHANGELOG.zh.md) | [العربية](CHANGELOG.ar.md)

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
