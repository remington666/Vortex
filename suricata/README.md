# 🧱 Suricata VM Deployment

This virtual machine is deployed using **Vagrant** and **VirtualBox**, connected to a private network (`vboxnet1`) routed through **pfSense** or another gateway.

---

## 🖥️ VM Specifications

| Setting     | Value                        |
|-------------|------------------------------|
| OS          | Ubuntu 22.04                 |
| Hostname    | `suricata`                   |
| Static IP   | `10.10.1.5`                  |
| Gateway     | `10.10.1.1`                  |
| Network     | `vboxnet1` (e.g., Domain 1)  |
| RAM         | 2 GB                         |
| CPU         | 1 core                       |

---

## 🔧 Deployment

Start the VM:

```
vagrant up
```
⚙️ Provisioning

Static network configuration applied to interface eth1.

Wazuh Agent v4.10.1 is downloaded with the following command:
```
wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.10.1-1_amd64.deb
```
If the installation does not start automatically, install it manually:
```
sudo dpkg -i /home/vagrant/wazuh-agent_4.10.1-1_amd64.deb
```
Then configure the agent to point to the Wazuh server by editing:
```
sudo nano /var/ossec/etc/ossec.conf
```
Update the server address in the configuration to:
```
192.168.1.2
```
🔄 Automatic Reboot

The provisioning script will automatically reboot the VM to apply the network configuration.
