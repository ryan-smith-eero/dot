# init as root
su root
# add non-free sources
echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" \
    >> /etc/apt/sources.list
apt-get update
apt-get install \
    firmware-iwlwifi \
    git \
    vim \
    sudo \
    curl \
    libpam-fprintd \
    fprint-demo

# turn on wifi (without restart)
modprobe -r iwlwifi ; modprobe iwlwifi

# add ryan to sudo group
usermod -aG sudo ryan
exit

# sublime
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list
sudo apt install apt-transport-https
sudo apt update
sudo apt install sublime-text

# keybase
sudo curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase
