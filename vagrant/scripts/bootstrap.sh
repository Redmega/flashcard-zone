#!/usr/bin/env bash

if [ -e "/etc/vagrant-provisioned" ]; then
    echo "Vagrant provisioning already completed. Skipping..."
    exit 0
fi

echo "Starting Vagrant provisioning process..."

BOX_NAME='flashcard.local'
# Change the hostname so we can easily identify what environment we're on:
echo "$BOX_NAME" > /etc/hostname
# Prevent hostname resolution issues
echo "127.0.0.1 $BOX_NAME" >> /etc/hosts
# Use new hostname immediately (skip restart)
hostname $BOX_NAME

cd /vagrant/vagrant/scripts

# Install core components
./install_build_tools.sh

# Install MongoDB
./install_mongodb.sh

# Install node
./install_nvm.sh

# On load of bash cd to /vagrant
echo "cd /vagrant" >> /home/vagrant/.bashrc

# Done
touch /etc/vagrant-provisioned

echo "--------------------------------------------------"
echo "Your vagrant instance is ready"
