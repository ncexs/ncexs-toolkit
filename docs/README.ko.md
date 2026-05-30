# 🧰 ncexs Toolkit (NT)

🌐 [English](../README.md) | [Bahasa Indonesia](README.id.md) | [Basa Jawa](README.jv.md) | [Basa Sunda](README.su.md) | [हिन्दी](README.hi.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | **한국어** | [中文](README.zh.md) | [العربية](README.ar.md)

[![GitHub Release](https://img.shields.io/github/v/release/ncexs/ncexs-toolkit?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit/releases/latest)
[![Website](https://img.shields.io/badge/Website-ncexs.github.io-blueviolet?style=flat&logo=github&logoColor=white)](https://ncexs.github.io/)
[![VirusTotal](https://img.shields.io/badge/VirusTotal-0%2F70%20Detections-brightgreen?style=flat&logo=virustotal&logoColor=white)](https://www.virustotal.com/gui/file/your-new-file-hash-here/detection)
[![Windows](https://img.shields.io/badge/Windows-7%2B-0078D4?style=flat&logo=windows)](#)
[![PowerShell](https://img.shields.io/badge/PowerShell-3.0%2B-5D2D8C?style=flat&logo=powershell)](#)

✨ **올인원 Windows 툴킷** – 세련된 터미널 기반 대시보드를 통해 PC를 정리, 최적화 및 유지 관리하는 간단하고 빠르며 안전한 도구입니다.

---

## 🔥 주요 기능 및 모듈

### ⚡ 빠른 수정 및 진단
* **실시간 진행률 추적:** 터미널에서 직접 직관적인 백분율 표시줄을 통해 실시간으로 작업 실행을 모니터링합니다.
* **실시간 상태 검사:** 사용자 지정 UI와 함께 `SFC`, `DISM` 및 비파괴적 `chkdsk /scan` 도구를 호출하여 작업 완료 시기를 정확히 알 수 있습니다.

### 🧹 저장소 및 정리
* **Compact OS 양방향 압축:** **양방향** 압축 방식(시스템 파일 압축 및 기본 상태로의 복원 해제 모두 지원)으로 재설계되어, **2GB – 5GB**의 저장 공간을 안전하게 확보합니다.
* **강력한 정크 클리너:** 임시 시스템 폴더, Prefetch 파일, CrashDumps, Windows Update 캐시, CBS 로그 및 GPU 셰이더 캐시를 정리합니다.
* **앱 캐시 클리너:** Discord, Spotify, Steam, Telegram, WhatsApp 캐시를 로그아웃 없이 안전하게 삭제합니다.
* **이벤트 로그 클리너:** 직접적인 .NET API를 기반으로 제작되어 모든 Windows 이벤트 뷰어 로그를 **즉시 (1초 미만)** 비웁니다.
* **스마트 앱 제거기:** 빠른 퍼지 검색으로 제거 스크립트를 즉시 실행합니다.
* **휴지통 및 디스크 정리:** 삭제된 파일을 안전하게 비우거나 Windows 기본 디스크 정리 도구 인터페이스를 즉시 실행합니다.

### 🛠️ PC 유지 관리 도구
* **PC 감사 보고서 (HTML):** 바탕 화면에 직접 프리미엄하고 세련된 대화형 HTML PC 상세 사양 보고서를 생성하고 내보냅니다. CPU, RAM, OS 정보, 메인보드, 저장 공간 및 권한 등급(관리자 vs 일반)이 명확히 표시된 **활성 Windows 계정**을 감사하여 보여줍니다.
* **원클릭 유지 관리:** 사용자의 중요한 파일 손실을 방지하기 위해 휴지통을 인테리전트하게 보존하면서 완전 자동화된 시스템 유지 관리(정크 정리, DNS 플러시, SFC/DISM 스캔)를 수행합니다.
* **배터리 수명 분석기:** 실시간 배터리 성능 저하율(웨어율), 설계 용량, 완충 용량을 계산하고 데스크톱 PC 여부를 동적으로 판별합니다.
* **원격 데스크톱 (RDP) 관리자:** RDP를 즉시 켜고 끄며 필요한 Windows 방화벽 규칙을 자동으로 구성합니다.
* **브라우저 캐시 클리너:** Google Chrome, Microsoft Edge, Mozilla Firefox에서 축적된 캐시 데이터베이스를 비웁니다.

### ⚡ 성능 및 최적화
* **메모리 최적화:** 사용되지 않는 작업 세트를 플러시하여 물리적 메모리를 확보하고 정확한 "정리 전과 후"의 RAM 통계를 표시합니다.
* **스마트 전원 관리 옵션:** 숨겨진 시스템 전원 관리 옵션(고성능 및 균형 조정)을 복원하고 화면 밝기를 최적화합니다.
* **드라이브 최적화:** 시스템 및 숨김 파티션에 대한 제외 규칙을 적용하여 스마트 조각 모음/트림 루틴을 실행합니다.

### 🌐 네트워크 및 관리 도구
* **네트워크 복구 도구:** 손상된 인터넷 연결을 복구하기 위해 5가지 필수 복구 도구(TCP/IP 재설정, Winsock 재설정, DNS 플러시, IP 해제/갱신)를 자동화합니다.
* **DNS 프로필 전환기:** Cloudflare(1.1.1.1), Google DNS(8.8.8.8), Quad9, AdGuard(광고 차단) 또는 표준 DHCP 간에 빠르게 전환합니다. **활성화된 모든 물리 네트워크 어댑터**에 구성을 동시에 자동 적용합니다.
* **Wi-Fi 비밀번호 복구:** 저장된 모든 로컬 네트워크의 보안 키를 검색하고 표시합니다.
* **업데이트 및 드라이버 백업:** `winget`을 사용하여 설치된 모든 앱을 일괄 업데이트하고 타사 드라이버를 `C:\DriversBackup`으로 내보냅니다.

---

## 🚀 빠른 시작 (안정화 버전)

수동으로 파일을 다운로드하지 않고 최신 안정화 버전의 ncexs Toolkit을 직접 실행하려면:

1. **시작 메뉴**를 열고 **`powershell`**을 검색한 후 마우스 오른쪽 버튼으로 클릭하고 **관리자 권한으로 실행**을 선택합니다.
2. 아래 명령을 복사하여 붙여넣은 다음 **Enter** 키를 누릅니다:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/ncexs-Toolkit.ps1" | iex
```

> [!TIP]
> 한 달에 한 번 툴킷을 실행하여 PC를 항상 깨끗하고 쾌적하며 최적화된 상태로 유지하세요!

👉 **[ncexs.github.io에서 전체 문서 및 매뉴얼 가이드 보기](https://ncexs.github.io/)**

---

## ⚙️ 고급 가이드 및 FAQ

<details>
<summary><b>🛡️ 보안 및 안전 기능 보기 (클릭하여 펼치기)</b></summary>

* **VirusTotal 검증 완료:** 스크립트는 철저한 감사를 거쳤으며 악성 코드가 전혀 없음을 확인했습니다.
* **오픈 소스 및 투명성:** 모든 PowerShell 코드를 직접 확인할 수 있습니다. 코드 난독화나 외부 바이너리 의존성이 전혀 없습니다.
* **관리자 친화적인 설계:** 관리자 권한을 안전하게 요청하며 권한 거부 시 시스템을 차단하지 않고 안전하게 종료합니다.
* **보호되는 프로필:** 활성 브라우저 및 Discord에서 로그아웃되지 않도록 중요 사용자 폴더를 제외합니다.

</details>

<details>
<summary><b>🔹 정크 클리너를 실행하면 브라우저에서 로그아웃됩니까?</b></summary>

**아니요.** 향상된 정크 클리너는 **캐시, 코드 캐시 및 GPU 캐시**만을 삭제하도록 특별히 설계되었습니다. 브라우저 쿠키, 로그인 상태, 저장된 비밀번호나 활성 세션 데이터베이스는 **절대로** 건드리지 않습니다.

</details>

<details>
<summary><b>🔹 "Compact OS" 기능이 컴퓨터를 느리게 만듭니까?</b></summary>

**아니요.** Compact OS는 SSD에 최적화된 Windows 기본 압축 알고리즘입니다. 최신 멀티 코어 프로세서에서는 성능 저하가 사실상 없으며 귀중한 저장 공간을 즉시 확보해 줍니다.

</details>

<details>
<summary><b>🔹 상태 검사 (DISM)가 멈춘 것처럼 보이는 이유는 무엇입니까?</b></summary>

`DISM /RestoreHealth`와 같은 시스템 명령은 백그라운드에서 Microsoft 서버로부터 파일을 다운로드하거나 검증하는 동안 특정 백분율(예: 62.3%)에서 일시 중지되는 경우가 많습니다. 이는 지극히 정상적인 시스템 동작입니다. 프로세스가 완료될 때까지 기다려 주십시오.

</details>

---

## 💻 시스템 요구 사항

* **운영 체제:** Windows 7, 8, 8.1, 10, 11 (32비트 및 64비트 모두 지원)
* **PowerShell:** PowerShell 3.0 이상
* **권한:** 관리자 권한 (시스템 정리, 드라이버 백업 및 네트워크 재설정에 필요)

---

## 📜 라이선스

**MIT License**에 따라 배포됩니다. 자세한 내용은 [LICENSE](../LICENSE) 파일을 참조하세요.  
*음유시인 유지 관리를 실행하기 전에 항상 중요한 파일을 백업하세요.* ⚠️

---

## ☕ 지원 및 연결

이 툴킷이 도움이 되었다면 지속적인 개발을 위한 후원을 고려해 보세요:

[![Saweria](https://img.shields.io/badge/Saweria-커피%20후원하기-orange?style=flat&logo=buymeacoffee&logoColor=white)](https://saweria.co/ncexs)
[![GitHub Star](https://img.shields.io/badge/GitHub-프로젝트%20별%20누르기-blue?style=flat&logo=github)](https://github.com/ncexs/ncexs-toolkit)
