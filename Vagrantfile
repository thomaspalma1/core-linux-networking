VAGRANTFILE_API_VERSION = "2"

# Shared configurations between the VMs
VM_BOX        = "debian/bullseye64"
VM_BOX_VER    = "11.20241217.1"

VM_MEMORY     = 2048
VM_CPUS       = 2
VM_DISK_SIZE  = "20GB"

NAT_NETWORK_NAME = "NatNetwork1"
NAT_NETWORK_CIDR = "10.10.10.0/24"

unless Vagrant.has_plugin?("vagrant-disksize")
  raise "Required plugin missing. Install it with: vagrant plugin install vagrant-disksize"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Create NAT network (executed before bringing the machines up)
  config.trigger.before :up do |trigger|
    trigger.name = "Create NAT Network (if needed)"
    trigger.run = {
      inline: "bash -c 'VBoxManage natnetwork add --netname #{NAT_NETWORK_NAME} " \
              "--network \"#{NAT_NETWORK_CIDR}\" --enable || true'"
    }
  end

  # Global configurations (apply to all VMs defined below)
  config.vm.box         = VM_BOX
  config.vm.box_version = VM_BOX_VER
  config.disksize.size  = VM_DISK_SIZE

  # VM 1: Debian Server
  config.vm.define "server" do |server|
    server.vm.hostname = "debian-server"

    server.vm.provider "virtualbox" do |vb|
      vb.name   = "Debian Server"
      vb.memory = VM_MEMORY
      vb.cpus   = VM_CPUS

      vb.customize ["modifyvm", :id, "--nic1", "natnetwork"]
      vb.customize ["modifyvm", :id, "--nat-network1", NAT_NETWORK_NAME]
    end
  end

  # VM 2: Debian Client
  config.vm.define "client" do |client|
    client.vm.hostname = "debian-client"

    client.vm.provider "virtualbox" do |vb|
      vb.name   = "Debian Client"
      vb.memory = VM_MEMORY
      vb.cpus   = VM_CPUS

      vb.customize ["modifyvm", :id, "--nic1", "natnetwork"]
      vb.customize ["modifyvm", :id, "--nat-network1", NAT_NETWORK_NAME]
    end
  end

end
