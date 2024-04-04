# Theta_Guardian_Node_script

Tested on Linux server - Ubuntu 22.04 LTS 64bit

Save this script to a file named install_theta_guardian_node.sh, make it executable (chmod +x install_theta_guardian_node.sh), and execute it with root privileges (sudo ./install_theta_guardian_node.sh).

This script will perform the following tasks:

1. Install necessary dependencies (screen and curl).
2. Create the directory structure required for Theta Guardian Node.
3. Download Theta binaries and configuration files.
4. Launch Theta Guardian Node in a screen session named theta_mainnet.
5. The service will automatically start the Theta Guardian Node on system boot and restart it if it crashes.

Make sure to run this script on your Linux server to install and run the Theta Guardian Node.
