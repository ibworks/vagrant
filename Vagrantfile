NAME = "vagrant"

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-17.10"
  config.vm.define NAME
  config.vm.hostname = NAME
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Enable GUI
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.name = NAME
    vb.memory = 8192
    vb.cpus = 4
    vb.customize ["modifyvm", :id, "--vram", 128]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "emptydrive"]  
  end

  # Provision
  config.vm.provision "shell", path: "provision.sh" 
end
