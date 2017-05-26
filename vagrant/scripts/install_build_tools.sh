#!/usr/bin/env bash
# Installs build tool essentials
echo "Installing build tool essentials..."
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y

# apt-get install -y make g++ libcairo2-dev libav-tools
export DEBIAN_FRONTEND=noninteractive
apt-get install -y build-essential git curl wget vim nfs-common portmap htop ca-certificates libc6
