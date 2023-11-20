# Git Clone All

## Clone your whole repository
### Only public repository is available
### Windows
1. install choco
    - open powershell as a administrator admission
    - enter the following command
    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```
    - *choco installation docs: [https://chocolatey.org/install](https://chocolatey.org/install)*
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
4. modify username at batch script file
5. run clone-repos.bat at your directory

### Linux, MacOS
1. open termianl
2. install jq
3. install curl
4. install git
5. chmod +x clone-repos.sh
6. modify username at shell script file
7. run clone-repos.sh

### Licnese
© 2023 meongju0o0 uses MIT License.
