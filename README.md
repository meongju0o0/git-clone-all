# Git Clone All

## Clone your whole repository

### Windows
1. install choco
    - open powershell as a administrator admission
    - enter the following command
    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```
    - *choco install docs: [https://chocolatey.org/install](https://chocolatey.org/install)*
2. install jq
    - open powershell
    - enter the following command
    ```powershell
    choco install jq
    ```
3. install curl
    - open powershell
    - enter the following command
    ```powershell
    choco install curl
    ```
4. run clone-repos.bat at your directory

### Linux, MacOS
1. open termianl
2. install jq
3. install curl
4. install git
5. chomod +x clone-repos.sh
6. run clone-repos.sh
