# Keep Track of Timing
SECONDS=0

# Fixes for things that should just work
echo -e "\e[1mExecuting Ubuntu Fixes\e[0m"
sudo apt-get -y --no-install-recommends install linux-headers-$(uname -r)
localectl set-locale LANG="en_US.UTF-8"

# Adding new sources and keys
echo -e "\e[1mAdding Packages Sources and Keys\e[0m"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" > /etc/apt/sources.list.d/azure-cli.list'
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Updaing Catalogs
echo -e "\e[1mUpdate Catalogs\e[0m"
sudo apt-get update

# Install
echo -e "\e[1mInstalling Applications\e[0m"
sudo apt-get -y --no-install-recommends install ubuntu-desktop 
sudo apt-get -y --no-install-recommends install ubuntu-software
sudo apt-get -y --no-install-recommends install gnome-terminal
sudo apt-get -y --no-install-recommends install firefox
sudo apt-get -y --no-install-recommends install google-chrome-stable
sudo apt-get -y --no-install-recommends install code
sudo apt-get -y --no-install-recommends install dotnet-sdk-2.1.3
sudo apt-get -y --no-install-recommends install apt-transport-https
sudo apt-get -y --no-install-recommends install azure-cli
sudo apt-get -y --no-install-recommends install nodejs
sudo apt-get -y --no-install-recommends install apt-transport-https ca-certificates curl software-properties-common
sudo apt-get -y --no-install-recommends install docker-ce
sudo apt-get -y --no-install-recommends install git
sudo apt-get -y --no-install-recommends install nodejs
sudo apt-get -y --no-install-recommends install npm
sudo apt-get -y --no-install-recommends install mongodb
sudo snap install kubectl --classic
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.24.1/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

# Add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Update Sources After Install
echo -e "\e[1mInstalling Patches\e[0m"
sudo apt-get update
sudo apt-get -y upgrade

# Removing Bloat
echo -e "\e[1mRemoving Bloat\e[0m"
sudo apt-get -y remove --auto-remove byobu
sudo apt-get -y remove --auto-remove vim

# Run GUI
echo -e "\e[1mEnableing Gnome Desstop Manager\e[0m"
sudo service gdm start

# Report out Timing
duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

# Rebooting after updates
echo Rebooting after Updates
sudo reboot

