📦 Wazuh Server VM Deployment

This virtual machine is intended to act as the **Wazuh Server** within a SOC environment.

---

📦 Prerequisites

Make sure the following are installed on the host machine:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- Internet access available inside the VM (via gateway `192.168.1.1`, typically a pfSense router)

---

## 🖥️ VM Characteristics

| Setting     | Value                         |
|-------------|-------------------------------|
| OS          | Debian 12 (generic box)       |
| VM Name     | `wazuhserver`                 |
| Static IP   | `192.168.1.2`                 |
| Gateway     | `192.168.1.1`                 |
| Network     | `vboxnet5` (SOC zone?)        |
| RAM         | 4 GB                          |
| CPU         | 3 cores                       |

---

## ⚙️ Deployment

Start the VM:
```
vagrant up --provision
```
Automatic Provisioning Includes:

    Manual configuration of the network interface in:

/etc/network/interfaces

    Setting the default gateway to 192.168.1.1 and DNS to 8.8.8.8

    Automatic reboot of the VM to apply changes

🗂️ Expected Directory Structure

.
└── Vagrantfile

📡 Network

This VM is connected to the vboxnet5 private network, designated for the SOC zone.
It should be able to communicate with other VMs used for monitoring and security operations.
🛑 Cleanup

To stop the VM:
```
vagrant halt
```
To remove the VM:
```
vagrant destroy
```


