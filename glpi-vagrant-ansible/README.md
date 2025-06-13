# 🧰 Automatic Deployment of GLPI on Debian with Vagrant & Ansible

This module automatically deploys a Debian VM with the GLPI IT asset management tool, using a local Ansible playbook.

---

## 📦 Prerequisites

- VirtualBox  
- Vagrant  
- A `./provision` directory containing the `playbook.yml` file for the GLPI installation

---

## 🖥️ VM Characteristics

| Setting   | Value             |
|-----------|-------------------|
| OS        | Debian Bullseye 64 |
| VM Name   | `Debian-GLPI`     |
| Private IP| `192.168.56.10`   |
| Memory    | 2048 MB           |
| CPU       | 2 cores           |
| GUI       | Enabled           |

---

## ⚙️ Installation

Start the VM deployment:

```
vagrant up --provision
```
Automated tasks:

System update and manual installation of Ansible via apt (more stable than Ruby/Vagrant version).

Execution of the local Ansible playbook located at:

./provision/playbook.yml

⚠️ Provisioning is done locally inside the VM using ansible_local.

📂 Expected Directory Structure
```
.
├── Vagrantfile
└── provision/
    └── playbook.yml
```

🛑 Cleaning

To power off and destroy the VM:
```
vagrant halt
vagrant destroy
```

🔗 GLPI access
After the installation with Ansible, GLPI should be accessible from the host :

📍 http://192.168.56.10 (or depending of the role defined in the playbook)
