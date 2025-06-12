<div id="top" align="center">

<!-- Shields Header -->
[![Contributors][contributors-shield]](https://github.com/remington666/Vortex/graphs/contributors)
[![Forks][forks-shield]](https://github.com/remington666/Vortex/network/members)
[![Stargazers][stars-shield]](https://github.com/remington666/Vortex/stargazers)
[![Issues][issues-shield]](https://github.com/remington666/Vortex/issues)
[![License][license-shield]](https://github.com/remington666/Vortex/blob/main/LICENSE)

<!-- Logo -->
<a href="https://github.com/remington666/Vortex">
  <img src="https://raw.githubusercontent.com/remington666/Vortex/main/docs/github/graphical_resources/Logo-With_background-Vortex.png" alt="Vortex Logo" width="auto" height="auto">
</a>

<!-- Title & Tagline -->
<h3 align="center">🌀 Vortex</h3>
<p align="center">
    <em>Automated Purple Team Cyber Lab – Built with Vagrant & Ansible.</em>
    <br>
    Fully modular and scriptable infrastructure to simulate real-world attacks and defenses, reinforce enterprise resilience, and bridge the gap between Red & Blue Teams.
</p>

<!-- Links & Demo -->
<p align="center">
    <a href="https://github.com/remington666/Vortex/blob/main/README.md" class="button-style"><strong>📘 Explore the full documentation</strong></a>
    ·
    <a href="https://asciinema.org/a/" class="button-style">🎥 View Demo</a>
    ·
    <a href="https://github.com/remington666/Vortex/issues">🐞 Report Bug</a>
    ·
    <a href="https://github.com/remington666/Vortex/issues">🛠️ Request Feature</a>
</p>

</div>

## 📜 Table of Contents

<details open>
  <summary><strong>Click to collapse/expand</strong></summary>
  <ol>
    <li><a href="#-about">📖 About</a></li>
    <li><a href="#-installation">🛠️ Installation</a></li>
    <li><a href="#-usage">🎮 Usage</a></li>
    <li><a href="#-troubleshooting">❗ Troubleshooting</a></li>
    <li><a href="#-contributing">🤝 Contributing</a></li>
    <li><a href="#%EF%B8%8F-legal-disclaimer">⚖️ Legal Disclaimer</a></li>
    <li><a href="#-star-evolution">🌠 Star Evolution</a></li>
    <li><a href="#-license">📜 License</a></li>
  </ol>
</details>

## 📖 About

**Vortex – Purple Team Lab** is a work-in-progress cyber range environment focused on enhancing enterprise resilience through realistic Purple Team exercises.

Built with Vagrant and Ansible, it enables automated deployment of virtual infrastructures to simulate advanced attack and defense scenarios.

Designed for:

- Practicing MITRE ATT&CK TTPs in a structured lab.
- Building modular topologies with Domain Controllers, SOC tools, firewalls, and attacker machines.
- Testing post-exploitation, log collection, detection engineering, and threat hunting workflows.

> ⚠️ This project is developed during personal time, outside of any professional context. It is actively evolving and may be subject to changes.

<p align="center">
  <img src="https://raw.githubusercontent.com/remington666/Vortex/main/docs/github/graphical_resources/Screenshot-Vortex_Demo.png" alt="Vortex Demo Screenshot" width="auto" height="auto">
</p>

---

## Current Lab Topology

The lab currently includes:

| Role            | Technology                          |
|-----------------|-------------------------------------|
| 🟣 Purple Backbone  | Ansible Controller (Debian), orchestrates all provisioning |
| ⚙️ Domain 1   | Windows Server 2022 – Domain Controller     |
| ⚙️ Domain 2   | Windows Server 2016 – Domain Controller     |
| 🔐 Firewall     | PfSense |
| 🧾 Vulnerable target | GLPI (with RCE)    |
| 🔴 Red Team     | Kali Linux |
| 🔵 Blue Team     | Wazuh SIEM (Debian), Suricata (Ubuntu) |

Each system is deployed as an independent VM using VirtualBox, with provisioning handled by the Ansible Controller.

This setup allows users to simulate end-to-end Purple Team scenarios, from attack emulation to detection, logging, and analysis.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🚀 Installation

### Prerequisites (tested on Debian 12)

To use Vortex, make sure your system is properly configured with the following tools and settings:

- Base system setup
```bash
apt update && apt install -y \
    curl wget git gpg \
    build-essential gcc make perl \
    linux-headers-$(uname -r)
```

- Install Vagrant
```bash
wget -O- https://apt.releases.hashicorp.com/gpg \
  | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  | tee /etc/apt/sources.list.d/hashicorp.list

apt update && apt install -y vagrant
```

- Install VirtualBox 7.1
```bash
wget https://download.virtualbox.org/virtualbox/7.1.6/virtualbox-7.1_7.1.6-167084~Debian~bookworm_amd64.deb
dpkg -i virtualbox-7.1_7.1.6-167084~Debian~bookworm_amd64.deb || apt --fix-broken install -y
```
If you encounter kernel module issues:
/sbin/vboxconfig

- Install Ansible (Ubuntu PPA)
```bash
UBUNTU_CODENAME=jammy

wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" \
  | gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" \
  | tee /etc/apt/sources.list.d/ansible.list

apt update && apt install -y ansible
```

- Install required Vagrant plugins
```bash
vagrant plugin update
vagrant plugin install winrm-elevated
vagrant plugin install virtualbox
```

- Configure VirtualBox Networking
Add trusted subnets:
```bash
echo "* 10.10.1.0/24 10.10.2.0/24 10.10.0.0/24 192.168.1.0/24 192.168.2.0/24" >> /etc/vbox/networks.conf
```

Create and configure host-only interfaces:
```bash
for i in {1..5}; do
  VBoxManage hostonlyif create
done

VBoxManage hostonlyif ipconfig vboxnet1 --ip=10.10.1.254
VBoxManage hostonlyif ipconfig vboxnet2 --ip=10.10.2.254
VBoxManage hostonlyif ipconfig vboxnet3 --ip=10.10.0.254
VBoxManage hostonlyif ipconfig vboxnet4 --ip=192.168.2.254
VBoxManage hostonlyif ipconfig vboxnet5 --ip=192.168.1.254
```

> 🧪 Recommended environment: Debian 12 with the above configuration.
> Ensure you have at least 32 GB of RAM and 256 GB of disk space available for smooth usage.

---

### Steps

1. **Git clone the repository**
```bash
git clone https://github.com/remington666/Vortex.git
cd Vortex
```

2. **Launch the infrastructure** (manual method)
Provision each module in order (except the Ansible Controller, which should be launched last):
```bash
cd domaine1 && vagrant up --provision && cd ..
cd domaine2 && vagrant up --provision && cd ..
cd firewall && vagrant up --provision && cd ..
cd glpi-vagrant-ansible && vagrant up --provision && cd ..
cd kali-vagrant-ansible && vagrant up --provision && cd ..
cd soc && vagrant up --provision && cd ..
cd suricata && vagrant up --provision && cd ..
cd ansible-controller && vagrant up
```

Once everything is deployed, you can access the controller:
```bash
vagrant ssh
```

📁 The Ansible configuration is automatically copied to /tmp on the controller VM.

3. **Use the CLI helper** (recommended – alpha)
You can also use the experimental CLI script vortex.sh to automate most actions:
```bash
chmod +x vortex.sh
./vortex.sh up           # Launch all modules except the controller
./vortex.sh controller   # Launch the Ansible Controller only
./vortex.sh destroy      # Destroy all modules except the controller
./vortex.sh destroy-all  # Destroy everything
./vortex.sh list         # Show all available modules
```

> ⚠️ vortex.sh is in alpha. Contributions and feedback are welcome.

> 💡 Notes
> Each module is deployed as an isolated VirtualBox VM, using Vagrant.
> The Ansible Controller is used to provision Windows servers, SOC components, and support post-deployment automation.
> The project is developed entirely in personal time and is still under active development.

--- 

**Docker Integration** (coming soon)

> We are actively working on a Docker-based version of Vortex to streamline deployment and portability.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🎮 Usage

As mentioned in the installation section, you can use it in two ways:

- ✅ With the CLI script vortex.sh (recommended):
    Automates all actions – provisioning, starting, destroying, listing.

- 🛠️ Manually via vagrant up --provision in each folder (see Installation).

After deployment, you can connect to the Ansible Controller:
```bash
cd ansible-controller
vagrant ssh
```
    
<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🔧 Troubleshooting

Encountering issues? Don't worry. If you come across any problems or have questions, please don't hesitate to submit a ticket: [Submit an issue on GitHub](https://github.com/remington666/Vortex/issues)

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🤝 Contributing

We truly appreciate and welcome community involvement. Your contributions, feedback, and suggestions play a crucial role in improving the project for everyone. If you're interested in contributing or have ideas for enhancements, please feel free to open an issue or submit a pull request on our GitHub repository. Every contribution, no matter how big or small, is highly valued and greatly appreciated!

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## ⚖️ Legal Disclaimer

Please be aware that the use of the `Vortex` tool may be subject to specific laws and regulations in your country or region. Before using this tool, it is your responsibility to ensure that its use is in compliance with the laws applicable in your jurisdiction.

The creator of `Vortex` cannot be held responsible for any improper or illegal use of this tool. By using `Vortex`, you acknowledge and agree that you are solely responsible for complying with local laws and regulations.

In some instances, the use of `Vortex` might be justified for legitimate purposes such as protection against authoritarian regimes or for survival matters. However, it is strongly advised to take all necessary measures to protect yourself and to abide by the law.

By using `Vortex`, you acknowledge having read this disclaimer and agree to act accordingly. The creator of `Vortex` does not in any way endorse the use of this tool for illegal or harmful purposes.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🌠 Star Evolution

Explore the star history of this project and see how it has evolved over time:

<a href="https://star-history.com/#remington666/Vortex&Timeline">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=remington666/Vortex&type=Timeline&theme=dark" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=remington666/Vortex&type=Timeline" />
  </picture>
</a>

Your support is greatly appreciated. We're grateful for every star! Your backing fuels our passion. ✨

## 📚 License

This project is licensed under the GNU Affero General Public License, Version 3.0. For more details, please refer to the LICENSE file in the repository: [Read the license on GitHub](https://github.com/remington666/Vortex/blob/main/LICENSE)

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/remington666/Vortex.svg?style=for-the-badge
[contributors-url]: https://github.com/remington666/Vortex/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/remington666/Vortex.svg?style=for-the-badge
[forks-url]: https://github.com/remington666/Vortex/network/members
[stars-shield]: https://img.shields.io/github/stars/remington666/Vortex.svg?style=for-the-badge
[stars-url]: https://github.com/remington666/Vortex/stargazers
[issues-shield]: https://img.shields.io/github/issues/remington666/Vortex.svg?style=for-the-badge
[issues-url]: https://github.com/remington666/Vortex/issues
[license-shield]: https://img.shields.io/github/license/remington666/Vortex.svg?style=for-the-badge
[license-url]: https://github.com/remington666/Vortex/blob/main/LICENSE
