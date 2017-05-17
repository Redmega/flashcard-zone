#!/usr/bin/env bash
# Installs the Node Version Manager (https://github.com/creationix/nvm)

su vagrant -c "wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash"

# Load nvm for the current script
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

export NODE_VERSION='--lts=boron'
nvm install $NODE_VERSION

# Install global packages
npm install -g next

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt-get update
apt-get install -y yarn
