# 🧰 ncexs Toolkit (NT)

🌐 [English](../README.md) | [Bahasa Indonesia](README.id.md) | [Basa Jawa](README.jv.md) | [Basa Sunda](README.su.md) | [हिन्दी](README.hi.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [한국어](README.ko.md) | **中文** | [العربية](README.ar.md)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **全能 Windows 工具箱** – 通过精美的命令行控制台界面，简单、快速、安全地清理、优化和维护您的 Windows 电脑。

---

## 🔥 主要功能与模块

### ⚡ 快速修复与诊断
* **实时进度跟踪:** 直接在终端中通过精美的百分比进度指示器实时查看任务执行状态。
* **系统健康检查:** 调用系统内置的 `SFC`、`DISM` 以及无损 `chkdsk /scan` 修复命令，并使用自定义 UI 渲染展现。
* **系统诊断与报告:** 专属的诊断子菜单，内含 PC 审计 HTML 导出、电池健康报告、许可证激活检查以及 Windows 11 兼容性检查。
* **Windows 11 兼容性检查器:** 验证 UEFI 启动模式、安全启动 (Secure Boot) 状态和 TPM 2.0 规格。

### 🧹 存储与清理
* **Compact OS 双向压缩：** 重新构建为**双向**模式（支持压缩系统文件及恢复为默认解压状态），安全释放 **2GB – 5GB** 存储空间。
* **系统与应用深度清理**: 将系统垃圾、应用缓存（支持 WhatsApp、Discord、Spotify、Steam, Telegram、Teams、Zoom、Skype、Epic Games, GOG）以及 Windows 事件日志整合为单个深度清理工具。支持在“一键维护”中静默运行。
* **智能软件卸载:** 模糊搜索活跃的系统注册表以快速定位并启动自带的卸载程序。
* **清空回收站与磁盘清理:** 安全清空回收站，或快速触发系统自带的磁盘清理工具。

### 🛠️ PC 维护套件
* **一键维护:** 自动执行系统维护（垃圾清理、DNS 刷新、SFC/DISM 扫描），同时安全保留回收站以防用户文件丢失。
* **启动管理器 (Startup Manager):** 交互式启动管理器，用于列出、启用或禁用注册表和文件夹中的自启动应用程序。
* **远程桌面 (RDP) 管理:** 快速启用/禁用 RDP 并自动配置 Windows 防火墙规则。
* **浏览器缓存清理:** 清除 Google Chrome、Edge 和 Firefox 的缓存数据库。

### ⚡ 性能与优化
* **内存优化：** 释放未使用的内存工作集（Working Set），在控制台清晰显示优化“前与后”的可用内存统计数据。
* **视觉特效加速 (Visual FX Booster)：** 优化系统响应速度，瞬间缩短窗口与菜单的视觉过渡延迟 (MenuShowDelay)。
* **智能电源计划：** 恢复隐藏的系统电源计划（高性能与平衡）并优化屏幕亮度设置。
* **驱动器优化：** 运行智能磁盘碎片整理和 TRIM，自动排除系统隐藏分区。

### 🌐 网络与管理工具
* **网络修复套件：** 自动化执行 5 项关键网络修复（重置 TCP/IP、Winsock 重置、刷新 DNS、释放/更新 IP），以解决网络连接异常。
* **DNS 配置文件切换：** 快速在 Cloudflare (1.1.1.1)、Google DNS (8.8.8.8)、Quad9、AdGuard（广告拦截）或标准 DHCP 之间切换。自动应用配置至**所有活跃的物理网卡**。
* **Wi-Fi 密码找回：** 检索并显示您电脑上保存过的所有本地无线网络的安全密码。
* **软件更新与驱动备份：** 使用 `winget` 一键批量更新已安装的应用程序，并将第三方驱动程序导出备份至 `C:\DriversBackup`。

---

## 🚀 快速开始 (稳定版)

无需手动下载文件，即可直接运行最新稳定版的 ncexs Toolkit：

1. 打开 **开始菜单**，搜索 **`powershell`**，右键点击并选择 **“以管理员身份运行”**。
2. 复制并粘贴下方命令，然后按 **Enter** 键执行：

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/ncexs-Toolkit.ps1" | iex
```

> [!TIP]
> 建议每月运行一次此工具箱，以保持您的电脑干净、健康且运行在最佳状态！

👉 **[访问 ncexs.github.io 查看完整文档与操作指南](https://ncexs.github.io/)**

---

## ⚙️ 进阶指南与常见问题解答 (FAQ)

<details>
<summary><b>🛡️ 点击查看安全性与透明度说明</b></summary>

* **VirusTotal 安全验证：** 脚本已通过全面审查，确认 100% 无病毒、无恶意软件。
* **开源透明：** 您可以亲自检查每一行 PowerShell 代码——绝对没有代码混淆、加密或任何第三方外部二进制依赖。
* **优雅的权限管理：** 规范地请求管理员权限；如果权限被拒绝，脚本会安全干净地退出，绝不卡死系统会话。
* **会话保护：** 脚本会排除浏览器和 Discord 的关键数据目录，确保您的账号登录状态不会丢失。

</details>

<details>
<summary><b>🔹 垃圾清理功能会让我退出浏览器的账号登录吗？</b></summary>

**不会。** 增强型垃圾清理功能专为删除 **缓存、代码缓存和 GPU 缓存** 而设计。它 **绝不会** 触碰浏览器 Cookie、保存的密码、表单数据或活跃会话数据库。

</details>

<details>
<summary><b>🔹 “Compact OS” 会让我的电脑变慢吗？</b></summary>

**不会。** Compact OS 是针对固态硬盘（SSD）优化的 Windows 原生压缩算法。在现代多核处理器上，它对系统性能的影响几乎为零，同时能立即为您腾出宝贵的磁盘空间。

</details>

<details>
<summary><b>🔹 为什么健康检查 (DISM) 看起来像卡住了？</b></summary>

系统原生的 `DISM /RestoreHealth` 命令在后台从微软服务器下载或验证文件时，通常会在特定百分比（例如 62.3%）停留一段时间。这是正常的系统行为，请耐心等待流程结束。

</details>

---

## 💻 系统运行要求

* **操作系统：** Windows 7、8、8.1、10、11（同时支持 32 位和 64 位架构）
* **PowerShell：** PowerShell 3.0 或更新版本
* **系统权限：** 管理员权限（深度系统清理、驱动备份和网络重置所需）

---

## 📜 开源协议

本项目遵循 **MIT License** 开源协议发布。请参阅 [LICENSE](../LICENSE) 文件获取完整许可详情。  
*在进行系统深度维护之前，请务必备份重要数据。* ⚠️

---

## ☕ 支持与联系

如果您觉得本工具箱对您有帮助，欢迎支持本项目的持续开发：

[![Saweria](https://img.shields.io/badge/Saweria-请我喝杯咖啡-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![GitHub Star](https://img.shields.io/badge/GitHub-点亮小星星-blue?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit)
