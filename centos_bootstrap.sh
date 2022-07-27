hostnamectl set-hostname nx-centurion
yum update -y

firewall-cmd --permanent --zone=public --add-service=cockpit
firewall-cmd --add-port=3389/tcp --permanent
firewall-cmd --reload

yum group install -y "Virtualization Host" "Server with GUI"

yum install -y epel-release
yum install -y cockpit
yum install -y cockpit-machines
yum install -y cockpit-networkmanager
yum install -y cockpit-dashboard
yum install -y cockpit-storaged
yum install -y cockpit-packagekit
yum install -y xrdp
yum install -y qemu-kvm
yum install -y libvirt
yum install -y libvirt-python
yum install -y libguestfs-tools
yum install -y virt-install
yum install -y virt-manager

systemctl enable --now cockpit.socket
systemctl enable --now xrdp

set-default graphical.target
systemctl isolate graphical.target

reboot now
