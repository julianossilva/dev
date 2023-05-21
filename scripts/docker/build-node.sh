
echo "Start build node"

export DEBIAN_FRONTEND=noninteractive

cd ~

apt-get update 
apt-get -y install python3 g++ make python3-pip ninja-build

git clone https://github.com/nodejs/node.git

cd node
git checkout v18.16.0
./configure --ninja
make
make install
