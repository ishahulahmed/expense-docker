#!/bin/bash

# Check whether root user or not
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root." >&2
    exit 1
fi

# ANSI color codes for formatting
R="\e[31m"
N="\e[0m"

# Install necessary packages
yum install -y yum-utils || { echo -e "${R}Error installing yum-utils.${N}" >&2; exit 1; }
yum-config-manager -y --add-repo https://download.docker.com/linux/rhel/docker-ce.repo || { echo -e "${R}Error adding Docker repository.${N}" >&2; exit 1; }
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || { echo -e "${R}Error installing Docker packages.${N}" >&2; exit 1; }

# Start Docker service
systemctl start docker || { echo -e "${R}Error starting Docker service.${N}" >&2; exit 1; }

# Enable Docker service to start on boot
systemctl enable docker || { echo -e "${R}Error enabling Docker service.${N}" >&2; exit 1; }

# Add user to docker group
usermod -aG docker ec2-user || { echo -e "${R}Error adding user to docker group.${N}" >&2; exit 1; }

# Prompt user to logout and login again
echo -e "${R}Logout and Login Again${N}"
