#!/bin/bash
set -e

echo "Installing dependencies..."
apt-get -qq update && apt-get -qq install -y \
  apt-transport-https \
  apache2-utils \
  bash-completion \
  ca-certificates \
  curl \
  figlet \
  gettext \
  graphviz \
  jq \
  libasound2 \
  libgconf2-dev \
  libgtkextra-dev \
  libnss3 \
  libx11-xcb1 \
  libxss1 \
  libxtst-dev \
  locales \
  nano \
  python \
  python-argcomplete \
  python-virtualenv \
  python-setuptools \
  python-pip \
  python3-pip \
  silversearcher-ag \
  software-properties-common \
  sudo \
  tmux \
  unzip \
  vim \
  wget \
  zsh \
  zip

# Locale
echo "Locale"
locale-gen en_US.UTF-8

# Docker in Docker
echo "Docker in Docker"
apt-get -qq remove docker docker-engine docker.io
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get -qq update && apt-get -qq -y install docker-ce

echo "TFSwitch"
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

echo "Blast Radius"
pip3 install blastradius

# Ansible
echo "Ansible"
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -qq -y ansible

# yq - jq for yaml
pip3 install yq

# argcomplete
activate-global-python-argcomplete

# Cleanup
echo "Cleanup"
apt-get clean && rm -rf /var/lib/apt/lists/*
