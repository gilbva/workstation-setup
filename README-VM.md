# Workstation Setup for VMs

For virtual machines (QEMU-KVM) we may need to install qemu-guest-agent, see: https://www.snel.com/support/nstall-qemu-guest-agent-for-debian-ubuntu/

    sudo apt update 
    sudo apt -y install qemu-guest-agent
    systemctl enable qemu-guest-agent
    systemctl start qemu-guest-agent
    systemctl status qemu-guest-agent