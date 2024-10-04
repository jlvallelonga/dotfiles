echo '--- Installing for Linux ---'

echo '--- Uninstalling outdated packages with apt-get ---'
sudo apt-get remove \
docker \
docker-engine \
docker.io \
containerd \
runc

echo '--- Installing packages with apt-get ---'
sudo apt-get update && sudo apt-get -y install \
build-essential \
autoconf \
m4 \
libncurses5-dev \
libwxgtk3.0-gtk3-dev \
libgl1-mesa-dev \
libglu1-mesa-dev \
libpng-dev \
libssh-dev \
unixodbc-dev \
xsltproc \
fop \
libxml2-utils \
libncurses-dev \
openjdk-11-jdk \
zsh \
curl \
vim \
ripgrep \
apt-transport-https \
ca-certificates \
gnupg \
lsb-release

echo '--- Docker install steps ---'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get -y install \
docker-ce \
docker-ce-cli \
containerd.io
getent group docker || sudo groupadd docker
sudo usermod -aG docker $USER

echo '--- Docker Compose install steps ---'
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo '--- Installing Python and tools ---'
# skip if python3 is not installed
if ! command -v python3 &> /dev/null
then
    echo "python3 could not be found"
else
    sudo apt-get -y install python3-pip
    pip3 install --upgrade pip
    # pip3 install virtualenv

    pip3 install jtbl
fi

echo '--- Installing software with snap package manager ---'
sudo snap install --classic code
sudo snap install slack
sudo snap install zoom-client

echo '--- Changing shell to zsh (relogin for this to take effect) ---'
chsh -s $(which zsh)
