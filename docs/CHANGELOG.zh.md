# 🚀 ncexs Toolkit v3.2

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | [Basa Jawa](CHANGELOG.jv.md) | [Basa Sunda](CHANGELOG.su.md) | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | **中文** | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – v3.2 系统维护与审计版

### ✨ 功能与改进
- **PC 维护套件**: 新增全新综合子菜单（菜单 17）：
  - **PC 审计报告 (HTML)**: 在桌面生成精美的交互式 HTML 系统规格报告。审计 CPU、内存、系统、主板及**活跃 Windows 账户**权限级别（管理员与标准）。
  - **一键维护**: 自动进行系统维护（清理垃圾、刷新 DNS、SFC/DISM 扫描），同时安全保留回收站以防文件丢失。
  - **电池健康分析**: 实时计算电池损耗或自动识别台式机。
  - **远程桌面 (RDP) 管理**: 快速启用/禁用 RDP 并自动配置防火墙规则。
  - **浏览器缓存清理**: 清除 Google Chrome、Edge 和 Firefox 的缓存。
- **.NET 高速事件日志清理**: 升级为直接使用 .NET API 查询清理事件查看器日志，1 秒内瞬间完成。
- **多网卡 DNS**: DNS 更改功能现已支持同时应用到所有处于活跃状态的物理网卡。
- **双向 Compact OS**: 支持系统文件的压缩（`/CompactOS:always`）与解压缩（`/CompactOS:never`）。

### 🐛 缺陷修复与本地化
- **本地化与安全**: 修复了 Compact OS 中的语言混合 Bug，并完善了翻译映射。
- **保护用户文件**: 一键维护中排除了清空回收站操作，以防用户的重要文件被意外删除。

---

# 🚀 ncexs Toolkit v3.1

🌐 [English](../CHANGELOG.md) | [Bahasa Indonesia](CHANGELOG.id.md) | [Basa Jawa](CHANGELOG.jv.md) | [Basa Sunda](CHANGELOG.su.md) | [हिन्दी](CHANGELOG.hi.md) | [Русский](CHANGELOG.ru.md) | [日本語](CHANGELOG.ja.md) | [한국어](CHANGELOG.ko.md) | **中文** | [العربية](CHANGELOG.ar.md)

## 🧰 ncexs Toolkit – v3.1 系统精通更新

### ✨ 功能与增强
- **增强的系统信息**: 增加了主板详细信息、操作系统版本、运行时间和序列号。
- **更强的垃圾清理**: 新增清理 Windows Update 缓存、CrashDumps、WER 和 CBS 日志。
- **应用缓存清理**: 安全清除 Discord、Spotify、Steam、Telegram 和 WhatsApp 的缓存。
- **事件日志清理**: 新增菜单 (16) 以清除所有 Windows 事件日志。
- **实时指标**: 清理工具现在显示释放的具体 MB。
- **更安全的健康检查**: 在 SFC 和 DISM 旁添加了无损的 `chkdsk C: /scan`。

### 🎨 UI 和 UX
- **17 菜单网格**: 完美支持奇数 (17) 菜单项目的布局。
- **默认语言**: 默认语言现已设置为英语 (EN)。
- **已弃用**: 为确保最高级别的系统安全性，已完全删除重置 Windows Update 的功能。

---

# 🚀 ncexs Toolkit v3.0.1

## 🧰 ncexs Toolkit – v3.0.1 安全性与用户体验优化

### ✨ 功能与增强
- **用户体验安全优化**: 添加了清晰、动态的多语言取消说明，以帮助非技术人员理解如何安全地取消任务，而无需强行关闭终端窗口。
- **优雅捕获 Ctrl+C 中断**: 在主循环中实现了全局异常捕获器 (`trap [PipelineStoppedException]`)。按下 `Ctrl+C` 取消正在运行的任务，将不再退出工具箱。脚本现在会优雅地捕获中断信号，输出多语言提示信息，并将用户带回主菜单，无需重新运行执行命令。
- **多语言支持**: 为英语 ("EN") 和印尼语 ("ID") 实现了新的 `"Process_Cancel"` 和 `"Process_Aborted"` 翻译文本，指导用户在任何时候通过 `Ctrl+C` 安全中断任务。
- **上下文警告提示**: 将取消警告整合到标准确认提示中，因此在运行垃圾清理、磁盘整理、Compact OS、软件升级和驱动备份之前会自动显示。

---

# 🚀 ncexs Toolkit v3.0

## 🎓 ncexs Toolkit – v3.0 期中考试后版本

### ⚡ 直接执行 (无需下载发布包)
- **零下载**: 从 v3.0 开始，消除了手动下载 `.ps1` 文件的需求。工具箱现通过一条 PowerShell 命令从 `main` 分支直接运行，确保始终执行最新代码。

### ✨ 功能与增强
- **界面与设计**: 将主菜单的 ASCII 艺术字替换为醒目的 3D 'Big Money' 样式，并采用蓝色主题。将“切换语言”选项更改为黄色以提高可见度。
- **本地化支持**: 全面覆盖英语和印尼语翻译。将脚本中硬编码的字符串全部替换为 `Get-Translation`。
- **语言切换**: 实现了英语和印尼语之间的快速切换 [L]。修复了不区分大小写的切换逻辑导致重复切换的 Bug。
- **DNS 切换器**: 新增包含 5 大主流 DNS 供应商的交互式切换子菜单。
- **详细优化指标**: 为垃圾清理和内存优化添加了“清理前/后”的 MB 统计数据。
- **网络修复**: 增加了分步进度通知。

### 🐛 错误修复与重构
- **菜单循环**: 通过在 switch 语句中加入 Clear-Host 和 default 处理，修复了菜单无限循环的问题。
- **高级卸载程序**: 为高级卸载程序的执行结果添加了缺失的暂停 (pause)。
- **字符串抽象**: 将硬编码字符串提取至全局翻译词典。

---

# 🚀 ncexs Toolkit v2.6

## 🎂 ncexs Toolkit – v2.6 开发者生日纪念版

### ✨ 新增功能
- ⚡ **快速修复 (Quick Fix)**: 自动化依次执行垃圾清理、网络修复和内存优化的“一键维护”功能 (菜单 Q)。
- 📐 **对称双列排版** – 完全对称且对齐的主菜单排版。
- 📊 **动态进度集成** – 为快速修复功能添加了实时百分比进度条。

### 🔧 错误修复
- 修复了不同菜单文本长度导致的边框错位问题。
- 修复了多色输出时 PowerShell Write-Host 产生的多余空格。

---

# 🚀 ncexs Toolkit v2.5 至 v2.0

以往版本包括了对清理逻辑、卸载管理、网络修复的重大升级，以及全面迁移至模块化的 PowerShell 架构。
