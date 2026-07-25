VAGRANTFILE_API_VERSION = "2"

# Shared configurations between the VMs
VM_BOX        = "debian/bullseye64"
VM_BOX_VER    = "11.20241217.1"

VM_MEMORY     = 2048
VM_CPUS       = 2

NAT_NETWORK_NAME = "NatNetwork1"
NAT_NETWORK_CIDR = "10.10.10.0/24"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Create NAT network (executed before bringing the machines up)
  # Checks if the network already exists to prevent VirtualBox errors
  config.trigger.before :up do |trigger|
    trigger.name = "Create NAT Network (if needed)"
    trigger.run = {
      inline: "bash -c '" \
              "if ! VBoxManage list natnetworks | grep -q \"#{NAT_NETWORK_NAME}\"; then " \
              "  VBoxManage natnetwork add " \
              "    --netname #{NAT_NETWORK_NAME} " \
              "    --network \"#{NAT_NETWORK_CIDR}\" " \
              "    --enable; " \
              "fi'"
    }
  end

  # Global configurations (apply to all VMs defined below)
  config.vm.box         = VM_BOX
  config.vm.box_version = VM_BOX_VER

  # VM 1: Debian Server
  config.vm.define "server" do |server|
    server.vm.hostname = "debian-server"

    server.vm.provider "virtualbox" do |vb|
      vb.name   = "Debian Server"
      vb.memory = VM_MEMORY
      vb.cpus   = VM_CPUS

      # Using nic2 for the custom network, preserving nic1 for Vagrant's SSH
      vb.customize ["modifyvm", :id, "--nic2", "natnetwork"]
      vb.customize ["modifyvm", :id, "--nat-network2", NAT_NETWORK_NAME]
    end
  end

  # VM 2: Debian Client
  config.vm.define "client" do |client|
    client.vm.hostname = "debian-client"

    client.vm.provider "virtualbox" do |vb|
      vb.name   = "Debian Client"
      vb.memory = VM_MEMORY
      vb.cpus   = VM_CPUS

      # Using nic2 for the custom network, preserving nic1 for Vagrant's SSH
      vb.customize ["modifyvm", :id, "--nic2", "natnetwork"]
      vb.customize ["modifyvm", :id, "--nat-network2", NAT_NETWORK_NAME]
    end
    
    # Ansible Provisioner
    # We place it in the last VM block so it runs only once after both machines are up
    client.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/main.yaml"
      ansible.limit = "all" # Tells Ansible to apply the playbook to all VMs in the inventory
    end
  end

end
