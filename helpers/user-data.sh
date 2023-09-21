#!/bin/bash

################################
# Setup EC2 Instance
################################

# Update OS
echo "Updating OS"
sudo yum update -y

# Install Packages
echo "Installing additional packages"
sudo yum install -y tmux wget
