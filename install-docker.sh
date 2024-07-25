#!/bin/bash

# check whether root user or not
R="\e[31m"
N="\e[0m"

yum install -y yum-utils
yum-config-manager -y --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl start docker
systemctl status docker
systemctl enable docker
usermod -aG docker ec2-user
echo -e "$R Logout and Login Again $N"