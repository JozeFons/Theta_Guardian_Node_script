# Theta_Guardian_Node_script

Tested on Linux server - Ubuntu 22.04 LTS 64bit

* Save this script to a file named `install_theta_guardian_node.sh`.
* Make it executable `chmod +x install_theta_guardian_node.sh`.
* Execute it with root privileges `sudo ./install_theta_guardian_node.sh`.

* Optional: You can copy/paste from here to your server machine and create/open file with following command: `sudo nano path/to/your/install_theta_guardian_node.sh`.

This script will perform the following tasks:

1. Install necessary dependencies (screen and curl).
2. Create the directory structure required for Theta Guardian Node.
3. Download Theta binaries and configuration files.
4. Launch Theta Guardian Node in a screen session named theta_mainnet.
5. Create a systemd service to manage the Theta Guardian Node.
6. Enable the systemd service to start automatically on boot.

Make sure to run this script on your Linux server to install and run the Theta Guardian Node.
