
echo "Start build neovim"

export DEBIAN_FRONTEND=noninteractive

cd ~

apt-get update 
apt-get -y install ninja-build gettext cmake unzip curl

git clone https://github.com/neovim/neovim.git

cd neovim
git checkout v0.9.0
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
