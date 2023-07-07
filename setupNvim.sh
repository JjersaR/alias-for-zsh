#!/bin/bash

cd $HOME

echo('Descargando clangd')
sudo pacman -S clangd --noconfirm

echo('Descargando pyright')
sudo dnf install pip
pip install pyright

echo('Descargando lua')
yay -s lua-language-server

echo('Descargando jdtls')
curl https://raw.githubusercontent.com/eruizc-dev/jdtls-launcher/master/install.sh | bash

echo('Descargando metals')
curl -fL "https://github.com/coursier/launchers/raw/master/cs-$(uname -m)-pc-linux.gz" | gzip -d > cs
chmod +x cs
./cs setup
cs install metals

echo('Descargando bash')
sudo npm i -g bash-language-server

echo('Descargando Rust')
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rls rust-analysis rust-src

echo('Descargando taplo')
cargo install taplo-cli --locked
cargo install --features lsp --locked taplo-cli

echo('Descargando vala')
yay -S vala-language-server

echo('Descargando docker')
sudo npm install -g dockerfile-language-server-nodejs

echo('Descargando tailwindcss')
npm install -g @tailwindcss/language-server

echo('Descargando sdkman para gradle')
curl -s "https://get.sdkman.io" | bash
