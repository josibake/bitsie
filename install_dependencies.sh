#!/usr/bin/env bash
apt-get update

# echo "-------------------------------"
# echo "| installing bcc dependencies |"
# echo "-------------------------------"
# 
# # install bcc build dependencies
# apt-get install -y bison build-essential cmake flex git libedit-dev libllvm11 llvm-11-dev libclang-11-dev zlib1g-dev libelf-dev libfl-dev python3-distutils luajit luajit-5.1-dev


# echo "----------------"
# echo "| building bcc |"
# echo "----------------"
# 
# # build bcc. this is necessary to get around a bunch of warnings
# git clone https://github.com/iovisor/bcc.git
# mkdir bcc/build; cd bcc/build
# cmake ..
# make
# sudo make install
# cmake -DPYTHON_CMD=python3 .. # build python3 binding
# pushd src/python/
# make
# sudo make install
# popd
# 
# echo "----------------------------------------"
# echo "| installing bitcoin core dependencies |"
# echo "----------------------------------------"

echo "---------------"
echo "| install bcc |"
echo "---------------"

apt-get install bpfcc-tools linux-headers-$(uname -r)

# install build dependencies for bitcoin core
apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libevent-dev libboost-dev libsqlite3-dev systemtap-sdt-dev

# install pip and gitPython
apt-get install python3-pip && pip install gitPython

echo "---------------"
echo "| setup repos |"
echo "---------------"

# get bitcoin core, helper scripts, and the simulation scenarios
git clone https://github.com/bitcoin/bitcoin.git
git clone https://github.com/achow101/coin-selection-simulation.git
