# 🧰 ncexs Toolkit (NT)

🌐 [English](../README.md) | [Bahasa Indonesia](README.id.md) | [Basa Jawa](README.jv.md) | [Basa Sunda](README.su.md) | [हिन्दी](README.hi.md) | [Русский](README.ru.md) | **日本語** | [한국어](README.ko.md) | [中文](README.zh.md) | [العربية](README.ar.md)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **オールインワン Windows ツールキット** – 洗練されたターミナルダッシュボードを通じて、PCのクリーンアップ、最適化、メンテナンスを簡単、高速、安全に行うツール。

---

## 🔥 主な機能とモジュール

### ⚡ クイックフィックス＆診断 (Quick Fix & Diagnostics)
* **ワンクリックメンテナンス:** ジャンクファイルのクリーンアップ、ネットワーク修復、RAM最適化を組み合わせた自動シーケンスを1つのメニューから実行します。
* **リアルタイム進捗追跡:** ターミナル上で直接、美しいパーセンテージバーによりタスクの実行状況をリアルタイムで把握できます。
* **システム状態チェック:** 組み込みの `SFC` および `DISM` ツールをカスタムUIで呼び出し、プロセスの進行状況を明確に表示します。

### 🧹 ストレージ＆クリーンアップ (Storage & Clean Up)
* **Compact OS 圧縮:** システムのパフォーマンスや機能を損なうことなく、システムファイルを安全に圧縮して **2GB～5GB** のストレージ容量を解放します。
* **高度なジャンククリーナー:** 一時システムフォルダ、Prefetch ファイル、GPU シェーダーキャッシュ、および複数のアクティブなブラウザプロファイル (Chrome、Edge、Brave、WhatsApp Web) を徹底的にクリーンアップします。
* **スマートアプリアンインストーラー:** アクティブなシステムレジストリの高速ファジー検索により、アンインストールスクリプトを即座に見つけて実行します。
* **ごみ箱とディスククリーンアップ:** 削除されたファイルを安全に消去するか、Windows 標準のディスククリーンアップを即座に起動します。

### ⚡ パフォーマンス＆最適化 (Performance & Optimization)
* **メモリ最適化:** 使用されていないワーキングセットを解放して物理メモリを空け、明確な「実行前と実行後」のRAM統計を表示します。
* **スマート電源プラン:** 非表示になっている電源プラン（高パフォーマンスとバランス）を復元し、画面の明るさを最適化します。
* **ドライブ最適化:** システムおよび非表示パーティションを除外ルールとしたスマートなデフラグ／トリムルーチンを実行します。

### 🌐 ネットワーク＆管理ツール (Network & Admin Tools)
* **ネットワーク修復スイート:** インターネット接続の問題を解決するため、5つの重要な修復ツール (TCP/IP リセット、Winsock リセット、DNS フラッシュ、IP リリース／更新) を自動化します。
* **DNS プロファイルスイッチャー:** Cloudflare (1.1.1.1)、Google DNS (8.8.8.8)、Quad9、AdGuard (広告ブロック)、または通常の DHCP の間をすばやく切り替えます。
* **Wi-Fi パスワード復元:** 保存されているすべてのローカルネットワークのセキュリティキーを取得して表示します。
* **アップデート＆ドライバーバックアップ:** `winget` を使用してインストール済みのすべてのアプリを一括更新し、サードパーティ製ドライバーを `C:\DriversBackup` にエクスポートします。

---

## 🚀 クイックスタート (安定版リリース)

手動でファイルをダウンロードすることなく、最新の ncexs Toolkit を直接実行するには：

1. **スタートメニュー** を開き、**`powershell`** を検索して右クリックし、**「管理者として実行」** を選択します。
2. 以下のコマンドをコピーして貼り付け、**Enter** キーを押します：

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/ncexs-Toolkit.ps1" | iex
```

> [!TIP]
> 月に一度このツールキットを実行して、PCを常にクリーンで健康、かつ最適な状態に保ちましょう！

👉 **[ncexs.github.io で完全なドキュメントとマニュアルを見る](https://ncexs.github.io/)**

---

## ⚙️ 詳細ガイド＆よくある質問 (FAQ)

<details>
<summary><b>🛡️ セキュリティと安全性機能を見る（クリックして展開）</b></summary>

* **VirusTotal 検証済み:** スクリプトは完全に監査され、マルウェアが存在しないことが確認されています。
* **オープンソースで透明:** すべての PowerShell コードをご自身で確認できます。難読化や外部バイナリへの依存は一切ありません。
* **管理者フレンドリーな設計:** 管理者権限を適切に要求し、拒否された場合はシステムリソースをブロックすることなく安全に終了します。
* **保護されたプロファイル:** アクティブなブラウザや Discord のログイン状態を維持するため、ユーザーに重要なフォルダパスは除外されます。

</details>

<details>
<summary><b>🔹 ジャンククリーナーを実行するとブラウザからログアウトされますか？</b></summary>

**いいえ。** 高度なジャンククリーナーは、**キャッシュ、コードキャッシュ、GPUキャッシュ** のみを削除するように特別に設計されています。ブラウザの Cookie、ログイン状態、保存されたパスワード、アクティブなデータベースには **絶対に** 触れません。

</details>

<details>
<summary><b>🔹 「Compact OS」はPCの動作を遅くしますか？</b></summary>

**いいえ。** Compact OS は SSD 向けに最適化された Windows 組み込みの圧縮アルゴリズムです。最新のマルチコアプロセッサではパフォーマンスへの影響は実質的にゼロであり、貴重なストレージ容量を即座に解放します。

</details>

<details>
<summary><b>🔹 状態チェック (DISM) が途中で止まっているように見えるのはなぜですか？</b></summary>

`DISM /RestoreHealth` などのシステムコマンドは、バックグラウンドで Microsoft サーバーからファイルをダウンロードまたは検証する際、特定のパーセンテージ (例: 62.3%) で一時停止することがよくあります。これは完全に正常な動作です。プロセスが完了するまでそのままお待ちください。

</details>

---

## 💻 システム要件

* **OS:** Windows 7、8、8.1、10、11 (32ビットおよび64ビットの両方に対応)
* **PowerShell:** PowerShell 3.0 以上
* **権限:** 管理者権限 (システムクリーンアップ、ドライバーバックアップ、ネットワークリセットに必要)

---

## 📜 ライセンス

**MIT License** の下で配布されています。詳細については [LICENSE](../LICENSE) ファイルをご覧ください。  
*システムメンテナンスを実行する前に、必ず重要なファイルのバックアップを行ってください。* ⚠️

---

## ☕ サポート＆連携

このツールキットがお役に立ちましたら、継続的な開発のサポートをご検討ください：

[![Saweria](https://img.shields.io/badge/Saweria-コーヒーをごちそうする-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![GitHub Star](https://img.shields.io/badge/GitHub-プロジェクトにスターをつける-blue?style=flat&logo=github)](https://github.com/ncexs/toolkit)
