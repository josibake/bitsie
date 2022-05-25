#!/usr/bin/env bash

# config options 
# SSH_IDENTITY="wallet_sims"
# SERVER_NAME="wsx"
# SERVER_TYPE="cx11"
# SERVER_IMAGE="ubuntu-22.04"

SSH_IDENTITY=$1
SERVER_NAME=$2
SERVER_TYPE=$3
SERVER_IMAGE=$4

# generate the ssh key, default filename and no passphrase
< /dev/zero ssh-keygen -f "${HOME}/.ssh/${SSH_IDENTITY}" -q -N ""

# add the ssh key to hcloud 
hcloud ssh-key create --name ${SSH_IDENTITY} --public-key-from-file ${HOME}/.ssh/${SSH_IDENTITY}.pub

# create a server using the ssh key
hcloud server create --name ${SERVER_NAME} --ssh-key ${SSH_IDENTITY} --type ${SERVER_TYPE} --image ${SERVER_IMAGE}

sleep 30

# get the ip address and setup the server 
# IP_ADDRESS=$(hcloud server list | grep ${SERVER_NAME} | tr -s ' ' | cut -d ' ' -f 4)
hcloud server ssh $SERVER_NAME
