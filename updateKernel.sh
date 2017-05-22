#Build a linux kernel
#Update your APT database
sudo apt-get update
#Install the latest security updates
sudo apt-get upgrade
#dependencies
sudo apt-get install build-essential module-assistant
#Configure your system for building kernel modules
sudo m-a prepare
#Install Guest Additions from CD- not necessary if errors
cd /media/(uname)/VBOXAdditions
sudo sh VBoxLinuxAdditions.run
#if you had all updates at installation- then just do sudo apt-get install virtualbox-guest-dkms instead of all above

sudo apt-get install gcc
sudo apt-get install libncurses5-dev
sudo apt-get update && sudo apt-get upgrade
#current kernel
uname -r
cd /home/(uname)
wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.2.5.tar.xz
sudo tar -xvf linux4.2.5.tar.xz -C /usr/src/
cd /usr/src/linux-4.2.5
sudo make menuconfig
#alternatively use old one- sudo make oldconfig
#sudo make xconfig check- works for 2.x
#try with -j option if needed
sudo make
uname -r
sudo make modules install install
#last step creates entries under boot folder, make a entry in your grub.cfg (confirm)