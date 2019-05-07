#! /bin/bash 

set -e
. ../etc/config.sh
set +e

sudo mkdir -p /usr/local/var/log/tor/
cd ~/tor-dns/'patched tor'/${VERSION}/src/config
tor -f torrc
