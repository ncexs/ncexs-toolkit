# ncexs Toolkit (Test Build)

This is a Windows utility toolkit. Due to Windows security policies, you must follow these steps to run the script.

## How to Run (Automatic Method - Recommended)
This method ensures you are always running the latest version directly from GitHub.

1.  Open your **Start Menu**, type **`powershell`**, right-click it and select **Run as Administrator**.
2.  Copy the following command, paste it into the PowerShell window, and press **Enter**:
    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; irm "https://raw.githubusercontent.com/ncexs/ncexs-toolkit/main/Test%20Build/ncexs-Toolkit-Test.ps1" | iex
    ```

## How to Run (Manual Method)

1.  Open your **Start Menu**.
2.  Type **`powershell`** and press **Enter**. (A PowerShell window will open).
3.  In the PowerShell window, type this command exactly and press **Enter**:
    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
    ```
4.  Find your toolkit script file (e.g., `ncexs-Toolkit-Test.ps1`).
5.  **Drag** the script file from its folder and **drop** it directly into the PowerShell window. The file's full path will automatically appear.
6.  Press **Enter** one last time to run the script.