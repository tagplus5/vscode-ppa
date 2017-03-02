# Visual Studio Code PPA
### [https://code.visualstudio.com](https://code.visualstudio.com)

## Contains
* Visual Studio Code
* Visual Studio Code Insiders

## Installation
```
sudo wget -O - https://tagplus5.github.io/vscode-ppa/ubuntu/gpg.key | sudo apt-key add - && \
sudo wget -O /etc/apt/sources.list.d/vscode.list https://tagplus5.github.io/vscode-ppa/ubuntu/vscode.list && \
sudo apt update &&
sudo apt install code code-insiders
```

## On 1.10.1 Update Microsoft create official signed repositories for Linux
https://code.visualstudio.com/updates/v1_10#_official-signed-repositories-for-linux

### Install for Debian and Ubuntu based distributions
https://code.visualstudio.com/docs/setup/linux#_installation
```
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
sudo apt-get update && \
sudo apt install code code-insiders
```
