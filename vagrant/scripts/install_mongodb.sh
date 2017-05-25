#!/usr/bin/env bash
# Taken from http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

# Import the public key
export DEBIAN_FRONTEND=noninteractive
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

# Create a list file
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
export DEBIAN_FRONTEND=noninteractive
apt-get update

# Install release described in MONGO_VERSION of MongoDB
export DEBIAN_FRONTEND=noninteractive
mkdir /data
mkdir /data/db
apt-get install -y mongodb-org \
  mongodb-org-server \
  mongodb-org-shell \
  mongodb-org-mongos \
  mongodb-org-tools

# Pin the installed packages to prevent apt-get from upgrading them
echo "mongodb-org hold" | dpkg --set-selections
echo "mongodb-org-server hold" | dpkg --set-selections
echo "mongodb-org-shell hold" | dpkg --set-selections
echo "mongodb-org-mongos hold" | dpkg --set-selections
echo "mongodb-org-tools hold" | dpkg --set-selections

exit 0
