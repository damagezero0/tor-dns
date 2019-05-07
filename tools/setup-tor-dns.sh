#! /bin/bash 

set -e
. ../etc/config.sh
set +e

if [ ! -e ~/tor-dns ]; then
  git clone https://github.com/0x3a/tor-dns.git
fi

# When version of openssl is 1.1.x
# apt remove libssl-dev && apt install livssl1.0-dev
sudo apt-get update && apt-get upgrade
sudo apt-get install -y gcc
sudo apt-get install -y build-essential
sudo apt-get install -y libevent-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y zlib1g
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y asciidoc-base
sudo apt-get install -y docbook-xsl
sudo apt-get install -y docbook-xml
sudo apt-get install -y xmlto
sudo apt-get install -y python-pip
sudo apt-get install -y python-setuptools
sudo apt-get install -y automake
pip install pyzmq
pip install sqlalchemy

cd ~/tor-dns/'patched tor'/${VERSION}
cp configure configure.bk
./configure
make

if [ ! -e /usr/local/bin/tor ]; then
  sudo ln -s ~/tor-dns/'patched tor'/${VERSION}/src/or/tor /usr/local/bin 
fi

echo "### finished. ###"
