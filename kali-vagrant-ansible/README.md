# 🧪 Kali Ansible VM Deployment

This virtual machine is designed for automation with **Ansible** and typically used in **Red Team** lab environments.

---

## 📦 Prerequisites

Ensure the following are available on the host machine:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- A `./provision` directory containing:
  - `playbook.yml` (required)
  - `requirements.yml` (optional, for Galaxy roles)
  - `roles/` directory (optional, for pre-imported roles)

---

## 🖥️ VM Characteristics

| Setting          | Value                          |
|------------------|--------------------------------|
| OS               | Kali Linux Rolling             |
| VM Name          | `Kali-Ansible`                 |
| Static IP        | `192.168.2.2`                  |
| Gateway          | `192.168.2.1`                  |
| VirtualBox Network | `vboxnet4` (Red Team zone?)  |
| Memory           | 4 GB                           |
| CPU              | 2 cores                        |
| GUI              | Yes                            |

---

## ⚙️ Deployment

Start the VM:
vagrant up

Automated Steps

    Ansible is automatically installed in the VM.

    The local Ansible playbook is executed from:

/vagrant/provision/playbook.yml

    Manual network gateway configuration must be added in:

/etc/network/interfaces

    The VM is automatically rebooted to apply the configuration.

## 📂 Expected Directory Structure
```
.
├── Vagrantfile
└── provision/
├── playbook.yml
├── requirements.yml # optional
└── roles/ # optional
```
📡 Network

The Kali VM is connected to the internal VirtualBox network vboxnet4, often used to simulate Red Team scenarios in labs.

It communicates with the gateway at:

📍 192.168.2.1 (typically a pfSense instance)

🛑 Cleanup

To stop the VM:
```
vagrant halt
```
To destroy the VM:
```
vagrant destroy
```
