echo "========================="
echo "DESCARGANDO DEPENDENCIAS"
echo "========================="
cd $HOME
sudo dnf update -y && sudo dnf upgrade -y
sudo dnf group install 'Herramientas y Librerías de Desarrollo en C' -y
sudo dnf group install 'Herramientas de desarrollo' -y
sudo dnf group install 'System tools' -y
sudo dnf group install 'Herramientas de Desarrollo RPM' -y
sudo dnf install -y rofi xbindkeys feh picom make gcc gcc-c++ kernel-devel kitty neovim lsd bat pcmanfm tlp tlp-rdw flameshot light brightnessctl libX11-devel libXft-devel libXinerama-devel xorg-X11-xinit-session libXrandr-devel openssh pnpm

echo "========================="
echo "     EJECUTANDO TLP"
echo "========================="
sudo tlp start
sudo systemctl start tlp
sudo systemctl enable tlp

echo "========================="
echo "  DESCARGANDO    JAVA    "
echo "========================="
sudo dnf install -y java-21-openjdk java-21-openjdk-devel java-21-openjdk-headless java-21-openjdk-src

echo "=========================="
echo "DESCARGANDO DWM Y SLSTATUS"
echo "=========================="
git clone https://github.com/JjersaR/DwM_config.git
git clone https://github.com/JjersaR/slstatus_config.git
mv DwM_config dwm
mv slstatus_config slstatus
mv dwm slstatus ~/.config

echo "=============================="
echo "DESCARGANDO DMENU Y EJECUTANDO"
echo "=============================="
git clone https://git.suckless.org/dmenu
mv dmenu ~/.config
cd ~/.config/dmenu
sudo make clean install

echo "=============================="
echo "DESCARGANDO SLOCK Y EJECUTANDO"
echo "=============================="
git clone https://github.com/JjersaR/Slock_Config.git
mv Slock_Config slock
mv slock ~/.config
cd $HOME/.config/slock
sudo make clean install
cd $HOME

echo "=========================="
echo "INSTALANDO DWM Y SLSTATUS"
echo "=========================="
cd ~/.config/dwm
sudo make clean install
cd ~/.config/slstatus
sudo make clean install

echo "=========================="
echo "  PONIENDO EL AUTOSTART"
echo "=========================="
cd $HOME
git clone https://github.com/JjersaR/configurations.git
cd configurations
mv kitty ~/.config
mv .xbindkeysrc $HOME
mv media_keys.sh $HOME
mv gitconfig .gitconfig
mv dwm ~/.local/share
sudo mv dwm.desktop /usr/share/xsessions
mv picom ~/.config
mv .xinitrc $HOME
cd ..
rm -rf configurations

echo "========================="
echo "DESCARGANDO REPOSITORIOS"
echo "========================="
cd $HOME
git clone https://github.com/JjersaR/nvim.git

echo "=================="
echo "MOVIENDO A .config"
echo "=================="
mv nvim ~/.config
echo "Listo!"

echo "=================="
echo "INSTALANDO DOCKER "
echo "=================="
cd $HOME
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf update -y
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
sudo systemctl enable docker
sudo systemctl start docker

echo "=================="
echo " INSTALANDO BRAVE "
echo "=================="
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser -y

echo "=================="
echo "INSTALANDO LAZYGIT"
echo "=================="
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit
