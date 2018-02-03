# Getting Started

## Provision your dev environment
* Install Vagrant
* Install VirtualBox
* Download this repository as a zip file
* Unzip to your preferred location on the file system
* In a terminal navigate to the folder and type `vagrant up`
* Wait for the script to finish and the VM to reboot (approx. 15 minutes)
* Reinstall Guest Additions
* Start MiniKube

```bash
sudo -i env CHANGE_MINIKUBE_NONE_USER=true MINIKUBE_HOME=$HOME KUBECONFIG=$HOME/.kube/config minikube start --vm-driver=none
```

## Customize your setup
* Add SSH keys to your local git
* Proxies if needed
* Check out the code
