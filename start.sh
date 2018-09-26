su root

echo "deb http://httpredir.debian.org/debian/ stretch main contrib non-free" \
    >> /etc/apt/sources.list

apt-get update && apt-get install firmware-iwlwifi
modprobe -r iwlwifi ; modprobe iwlwifi
apt-get install git vim sudo curl

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list
apt install apt-transport-https
apt update
apt install sublime-text

apt install libpam-fprintd fprint-demo

exit

curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase

