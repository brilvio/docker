#!/bin/bash
# Script to fix GPU device permissions for OpenVINO
# This needs to be run with sudo on the host

echo "Fixing GPU device permissions..."
sudo chmod 666 /dev/dri/renderD128
sudo chmod 666 /dev/dri/card0
echo "Permissions fixed. You may need to run this after each reboot."
echo ""
echo "To make it permanent, add this to /etc/udev/rules.d/99-gpu-permissions.rules:"
echo 'KERNEL=="renderD128", MODE="0666"'
echo 'KERNEL=="card0", MODE="0666"'
sudo bash -c 'cat > /etc/udev/rules.d/99-gpu-permissions.rules << EOF
KERNEL=="renderD128", MODE="0666"
KERNEL=="card0", MODE="0666"
EOF'
sudo udevadm control --reload-rules
sudo udevadm trigger