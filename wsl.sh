#!/bin/bash

cd $HOME

# actualizar sistema
sudo dnf update -y && sudo dnf upgrade -y

sudo dnf groupinstall -y 'Development Tools'

# instalar lo necesario
sudo dnf install -y zsh git wget curl openssl neovim java-21-openjdk java-21-openjdk-devel java-21-openjdk-headless java-21-openjdk-javadoc java-21-openjdk-src maven 'dnf-command(config-manager)'

# instalar oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install docker
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf update -y
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
sudo systemctl enable docker
sudo systemctl start docker

# install lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit
