🔐 pfSense Automatic Deployment with Vagrant

This project quickly deploys a pfSense virtual machine preconfigured for cybersecurity scenarios such as SOC, Red Team, client endpoints, and domains.

---

## 📦 Start the Virtual Machine
```
vagrant up
```
🖧 Network Interfaces
```
Network Interface	IP Address	Purpose
VirtualBox intnet	WAN: 192.168.1.1	WAN Interface
vboxnet5	192.168.2.1	SOC / DMZ / Red Team Interface
vboxnet4	LAN Client: 10.10.0.1	Client Workstation Interface
vboxnet3	Domain 1: 10.10.1.1	Active Directory 1 Interface
vboxnet1	Domain 2: 10.10.2.1	Active Directory 2 Interface
```
🔗 Access pfSense Interface

Access the pfSense web interface from the host via:
📍 https://localhost:4343
⚙️ Technical Details

  Vagrant box used: kennyl/pfsense version 2.4.0

  Memory: 2 GB

  CPU: 1 core

  Directory sharing: Disabled

  Imported configuration file: nouveau_fichier_de_conf/conf_pfsense.xml

  The XML configuration file is copied to /conf/config.xml, then the VM automatically reboots to apply the configuration.

🛑 Cleanup

To power off and delete the VM:
```
vagrant halt
vagrant destroy
```
