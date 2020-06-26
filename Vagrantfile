# Proxy vars
proxy_ip = "192.168.56.30"

# PTFE vars
ptfe_ip = "192.168.56.33"


# Vagrant configuration start
Vagrant.configure("2") do |config|
  
  config.vm.define "proxy" do |proxy|
    proxy.vm.box = "berchev/bionic64"
    proxy.vm.hostname = "proxy"
    proxy.vm.network "private_network", ip: proxy_ip
    proxy.vm.provision :shell, path: "scripts/proxy_provision.sh", env: { "proxy_ip" => proxy_ip }
  end

  config.vm.define "ptfe" do |ptfe|
    ptfe.vm.box = "berchev/bionic64"
    ptfe.vm.hostname = "ptfe"
    ptfe.vm.network "private_network", ip: ptfe_ip
    ptfe.vm.provision :shell, path: "scripts/ptfe_provision.sh", env: { "ptfe_ip_address" => ptfe_ip, "proxy_ip" => proxy_ip }
    ptfe.vm.provider "virtualbox" do |v|
      v.memory = 1024 * 8
      v.cpus = 2
    end
  end 
 
end
