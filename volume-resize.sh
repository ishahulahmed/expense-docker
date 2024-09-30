#!/bin/bash
dfdfdf fdfdf
sudo growpart /dev/nvme0n1 4
fdfdfdf dfdf
sudo lvextend -l +50%FREE /dev/RootVG/rootVol
sudo lvextend -l +50%FREE /dev/RootVG/varVol

sudo xfs_growfs /
sudo xfs_growfs /var

df -hT