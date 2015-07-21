#!/bin/sh

install_path=/usr/local/share/ansible
prefix_path=~/Development/ansible

# Update and install via Homebrew
echo "Installing Ansible..."

git clone git://github.com/ansible/ansible.git --recursive $install_path
cd $install_path
source ./hacking/env-setup

# Create prefix path
mkdir $prefix_path

# Configure Ansible
echo "Configuring Ansible..."

# Create Ansible config file
touch ~/.ansible.cfg

# Add defaults section
if [[ ! "$(cat ~/.ansible.cfg)" == *"[defaults]"* ]]; then
  echo "[defaults]" >> ~/.ansible.cfg
fi

# Set hosts path
if [[ ! "$(cat ~/.ansible.cfg)" == *"inventory = $prefix_path/hosts"* ]]; then
  echo "inventory = $prefix_path/hosts" >> ~/.ansible.cfg
fi

# Set roles path
if [[ ! "$(cat ~/.ansible.cfg)" == *"roles_path = $prefix_path/roles"* ]]; then
  echo "roles_path = $prefix_path/roles" >> ~/.ansible.cfg
fi

echo "Installation and setup complete!"
