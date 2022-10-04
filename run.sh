#!/bin/bash

echo "[*] Basic Package installation..."
sudo apt update && sudo apt install vim curl wget git python3 python3-pip build-essential gcc-multilib -y

echo "[*] Analysis Package installation..."
sudo python3 -m pip install pwntools
cd ~ && git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef.git
cd ~/gdb-peda-pwndbg-gef
sh install.sh

echo "[*] Zsh(powerlevel10k) installation..."
cd ~ && mkdir zsh-fonts
cd zsh-fonts
sudo apt install zsh -y
sudo chsh -s `which zsh`
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sh -c "$(wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)"
sh -c "$(wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)"
sh -c "$(wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)"
sh -c "$(wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)"

echo "[*] Docker installation.."
curl -fsSL get.docker.com -o get-docker.sh
chmod +x get-docker.sh && sh get-docker.sh
sudo apt install docker-compose
sudo systemctl restart docker

echo "[*] Done"
