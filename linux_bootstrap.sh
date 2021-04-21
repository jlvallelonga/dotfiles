echo '--- Installing for Linux ---'

echo '--- Installing packages with apt-get ---'
sudo apt update /
&& apt -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev /
libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk zsh

echo '--- Changing shell to zsh (relogin for this to take effect) ---'
chsh -s $(which zsh)