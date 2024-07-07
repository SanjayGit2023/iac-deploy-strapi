#!/bin/bash

# Log output to /var/log/user-data.log for debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# Update package index
sudo apt-get update -y

# Install required dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the Docker stable repository
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package index again
sudo apt-get update -y

# Install Docker CE
sudo apt-get install -y docker-ce

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add 'ubuntu' user to the Docker group
sudo usermod -aG docker ubuntu

# Pull the Docker image
sudo docker pull san21doc/strapi:latest

# Run the Docker container
sudo docker run -d -p 1337:1337 --name my_strapi san21doc/strapi:latest
