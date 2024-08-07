virt_machines=[
    {
        :hostname => "server",
        :ip => "192.168.1.30"
    },
    {
        :hostname => "server2",
        :ip => "192.168.1.31"
    },
    {
        :hostname => "server3",
        :ip => "192.168.1.32"
    },
    {
        :hostname => "server4",
        :ip => "192.168.1.33"
    }
]

HOST_SHOW_GUI = false

HOST_MEMORY = "1024"

HOST_CPUS = 2

HOST_BRIDGE = "Intel(R) Dual Band Wireless-AC 3168"

HOST_VM_BOX = "eurolinux-vagrant/oracle-linux-8"

HOST_CONFIG_SCRIPT = "script.sh"

HOST_USER = 'root'

HOST_USER_PASS = '156721'

HOST_UPGRADE = 'false'

ZABBIX_SERVER_IP = '192.168.1.30'

Vagrant.configure("2") do |config|
    virt_machines.each do |machine|
        config.vm.box = HOST_VM_BOX
        config.vm.define machine[:hostname] do |node|
            node.vm.hostname = machine[:hostname]
            node.vm.network :public_network, bridge: HOST_BRIDGE, ip: machine[:ip]
            node.vm.provider "virtualbox" do |current_vm, override|
                current_vm.name = machine[:hostname]
                current_vm.gui = HOST_SHOW_GUI
                current_vm.memory = HOST_MEMORY
                current_vm.cpus = HOST_CPUS
                override.vm.provision "shell", path: HOST_CONFIG_SCRIPT, args: [HOST_USER, HOST_USER_PASS, 'false', machine[:hostname], machine[:ip], ZABBIX_SERVER_IP], run: "once"
            end
        end
    end
end
