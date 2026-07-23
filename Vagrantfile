Vagrant.configure("2") do |config|
  config.vm.define "debian-server" do |server|
    server.vm.box = "debian/bullseye64"
    server.vm.box_version = "11.20241217.1"

    server.vm.provider "virtualbox" do |v|
      v.name = "Debian Server"
      v.memory = 2048
      v.cpus = 2
    end
  end
end
