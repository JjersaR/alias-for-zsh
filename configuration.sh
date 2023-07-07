#!/bin/bash

# estando en HOME
cd $HOME

# limpiando fedora
echo "========================="
echo "    LIMPIANDO FEDORA     "
echo "========================="
sudo dnf remove -y abrt adcli anaconda cheese dmidecode gnome-classic-session anthy-unicode baobab bluez-cups trousers hyperv alsa-sof-firmware gnome-calendar gnome-shell-extension-background-logo gnome-weather gnome-boxes gnome-clocks gnome-contacts gnome-tour gnome-logs gnome-remote-desktop gnome-maps gnome-backgrounds virtualbox-guest-additions yelp gnome-calculator gnome-characters gnome-system-monitor gnome-font-viewer gnome-font-viewer evince-djvu orca fedora-bookmarks fedora-chromium-config mailcap open-vm-tools openconnect openvpn qgnomeplatform unbound-libs vpnc podman yajl zd1211-firmware atmel-firmware libertas-usb8388-firmware gnome-tour gnome-shell-extension totem mediawriter gnome-connections nano nano-default-editor firefox xorg-x11-drv-vmware sane perl thermald sos kpartx gnome-user-docs cyrus-sasl-plain gnome-color-manager geolite2 traceroute mtr realmd gnome-themes-extra teamd tcpdump mozilla-filesystem spice-vdagent eog gnome-text-editor perl-IO-Socket-SSL evince
echo "Listo!"

echo "========================="
echo "  AGREGANDO SEGURIDAD    "
echo "========================="
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/modprobe.d/30_security-misc.conf -o /etc/modprobe.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/sysctl.d/30_security-misc.conf -o /etc/sysctl.d/30_security-misc.conf
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/sysctl.d/30_silent-kernel-printk.conf -o /etc/sysctl.d/30_silent-kernel-printk.conf

sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_cpu_mitigations.cfg -o /etc/grub.d/40_cpu_mitigations.cfg
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_distrust_cpu.cfg -o /etc/grub.d/40_distrust_cpu.cfg
sudo curl https://raw.githubusercontent.com/Kicksecure/security-misc/master/etc/default/grub.d/40_enable_iommu.cfg -o /etc/grub.d/40_enable_iommu.cfg

sudo mkdir -p /etc/systemd/system/NetworkManager.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/NetworkManager.service.d/99-brace.conf -o /etc/systemd/system/NetworkManager.service.d/99-brace.conf
sudo mkdir -p /etc/systemd/system/irqbalance.service.d
sudo curl https://gitlab.com/divested/brace/-/raw/master/brace/usr/lib/systemd/system/irqbalance.service.d/99-brace.conf -o /etc/systemd/system/irqbalance.service.d/99-brace.conf
echo "Listo!"

# descargar dependencias de dwm
echo "========================="
echo "DESCARGANDO DEPENDENCIAS"
echo "========================="
sudo dnf update -y && sudo dnf upgrade -y
sudo dnf group install 'Herramientas y Librerías de Desarrollo en C' -y
sudo dnf group install 'Herramientas de desarrollo' -y
sudo dnf group install 'System tools' -y
sudo dnf group install 'Herramientas de Desarrollo RPM' -y
sudo dnf install -y libX11-devel libXft-devel libXinerama-devel xorg-x11-xinit-session make gcc gcc-c++ kernel-devel feh picom sxhkd kitty neofetch ranger stacer bspwm polybar light
echo "Listo!"

# clonar repositorios para mi configuracion
echo "========================="
echo "DESCARGANDO REPOSITORIOS"
echo "========================="
git clone https://github.com/JjersaR/DwM_config.git
git clone https://github.com/JjersaR/slstatus_config.git
git clone https://github.com/JjersaR/configurations.git
git clone https://github.com/JjersaR/nvim.git

echo "=================="
echo "CAMBIANDO NOMBRES"
echo "=================="
mv DwM_config dwm
mv slstatus_config slstatus
echo "Listo!"

echo "=================="
echo "MOVIENDO A .config"
echo "=================="
mv dwm ~/.config
mv slstatus ~/.config
mv nvim ~/.config
echo "Listo!"

echo "=================="
echo "CREANDO SESION DWM"
echo "=================="
cd ~/.config/dwm
sudo mv dwm.desktop /usr/share/xsessions
echo "Listo!"

echo "===================="
echo "MOVIENDO .dwm a HOME"
echo "===================="
cd $HOME
mv /mnt/Datos/Documentos/.dwm $HOME
echo "Listo!"

echo "================================"
echo "PONIENDO CONFIG DE KITTY Y SXHKD"
echo "================================"
cd configurations
mv kitty sxhkd bspwm ~/.config
chmod +777 ~/.config/bspwm/bspwmrc ~/.config/sxhkd/sxhkdrc
sudo mv whichSystem.py /usr/bin
cd ..
rm -rf configurations
cd $HOME/.config/
git clone https://github.com/JjersaR/polybar
cd $HOME
echo "Listo!"

echo "============================"
echo "HACIENDO EJECUTABLE slstatus"
echo "============================"
cd ~/.config/slstatus
sudo ln -sf slstatus /usr/local/bin/
echo "Listo!"

echo "============================"
echo "CONSTRUYENDO dwm y slstatus"
echo "============================"
cd ~/.config/slstatus
sudo make clean install
cd ../dwm
sudo make clean install
echo "Listo!"

echo "==============="
echo "PARA USAR BSPWM"
echo "==============="
cd $HOME
touch .xinitrc
echo "exec bspwm &&\nsxhkdrc &&" > .xinitrc
echo "Listo!"

echo "==============="
echo "DESCARGAR SNAP"
echo "==============="
cd $HOME
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
echo "Listo!"

echo "================"
echo "DESCARGAR WMNAME"
echo "================"
cd $HOME
git clone https://git.suckless.org/wmname
cd wmname
sudo make clean install
cd ..
echo "Listo!"

echo "================"
echo "DESCARGAR SDKMAN"
echo "================"
cd $HOME
curl -s "https://get.sdkman.io" | bash
source .zshrc
echo "Listo!"

echo "================"
echo "DESCARGAR EMPTTY"
echo "================"
cd ~/.config
git clone https://github.com/tvrzna/emptty.git
cd emptty
make build
sudo make install
sudo make install-pam
make install-pam-fedora
sudo make install-config
make install-systemd
sudo ln -s /etc/sv/emptty /var/service
echo "Listo!"
