#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Install necessary dependencies
echo "Installing necessary dependencies..."
apt update
apt install -y screen curl

# Create directory structure
echo "Creating directory structure..."
mkdir -p ~/theta_mainnet/bin
mkdir -p ~/theta_mainnet/guardian_mainnet/node

# Download binaries and configuration files
echo "Downloading binaries and configuration files..."
cd ~/theta_mainnet/bin
curl -k --output theta `curl -k 'https://mainnet-data.thetatoken.org/binary?os=linux&name=theta'`
curl -k --output thetacli `curl -k 'https://mainnet-data.thetatoken.org/binary?os=linux&name=thetacli'`
wget -O ../guardian_mainnet/node/snapshot `curl -k https://mainnet-data.thetatoken.org/snapshot`
curl -k --output ../guardian_mainnet/node/config.yaml `curl -k 'https://mainnet-data.thetatoken.org/config?is_guardian=true'`
chmod +x theta thetacli

# Create a systemd service for the Theta Guardian Node
echo "Creating systemd service for Theta Guardian Node..."
sudo tee /etc/systemd/system/theta_guardian_node.service << EOF
[Unit]
Description=Theta Guardian Node
After=network.target

[Service]
User=$USER
Group=$USER
WorkingDirectory=/home/$USER/theta_mainnet/bin
ExecStart=/usr/bin/screen -S theta_mainnet -d -m bash -c "ulimit -n 4096; ./theta start --config=../guardian_mainnet/node"
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to apply changes
echo "Reloading systemd..."
sudo systemctl daemon-reload

# Enable the service to start automatically on boot
echo "Enabling systemd service..."
sudo systemctl enable theta_guardian_node.service

echo "Theta Guardian Node installation and setup completed successfully!"
