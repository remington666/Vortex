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
    <em>Automated Red & Blue Team Cyber Range – Powered by Vagrant & Ansible.</em>
    <br>
    Modular, realistic, and fully scriptable infrastructure for offensive & defensive cyber exercises.
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

**Vortex – Lab Purple Team** is a fully automated cyber range environment tailored for **Red Team**, **Blue Team**, and **Purple Team** scenarios.

It’s designed for:
- 🧠 Practicing advanced TTPs aligned with **MITRE ATT&CK**.
- 🔄 Automating deployments via **Vagrant + Ansible**.
- 🧩 Modular topologies for **SOC / AD / Threat Emulation**.
- 📈 Lab-based exercises for detection engineering, post-exploitation, GPO abuse, lateral movement, log collection & threat hunting.

> You can use it for **training**, **research**, **demoing tools**, or **developing detections**.


<p align="center">
  <img src="https://raw.githubusercontent.com/remington666/Vortex/main/docs/github/graphical_resources/Screenshot-Vortex_Demo.png" alt="Vortex Demo Screenshot" width="auto" height="auto">
</p>

---

## 🏗️ Architecture

The lab currently includes:

| Role            | Technology                          |
|-----------------|-------------------------------------|
| 🔵 Blue Team     | Wazuh, Suricata, Sysmon, EventLogs |
| 🔴 Red Team      | Kali, Covenant, C2 custom support   |
| 🟣 Purple Infra  | Domain Controller, GPO, SMB shares |
| ⚙️ SOC/Logging   | ELK, Filebeat, custom pipelines     |
| 🧠 Scenarios     | MITRE TTPs, PowerShell, lolbins, etc. |
| ☁️ Infra as Code | Vagrant + Ansible orchestration    |

All systems are deployed as **isolated virtual machines** using VirtualBox.

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🚀 Installation

### Prerequisites

- Vagrant ≥ 2.2.19
- VirtualBox ≥ 6.1
- Ansible ≥ 2.10 (used within controller VM)

### Steps

1. **Git clone the repository**:
```bash
git clone https://github.com/remington666/Vortex.git && cd Vortex
```

2. **Bring up infrastructure**:
```bash
cd soc/
vagrant up --provision
```

3. **Access Ansible controller**:

```bash
cd ../ansible-controller
vagrant ssh
```

4. **Run playbooks inside**:

```bash
cd /vagrant
ansible-playbook -i hosts.yml playbook.yml
```

5. **Docker integration**:

For a Docker-based setup, refer to our Docker-specific guide: [Vortex Docker Setup](https://github.com/remington666/Vortex/blob/main/docker/README.md).

<p align="right">(<a href="#top">🔼 Back to top</a>)</p>

## 🎮 Usage

Each role is modular, with:

- 🔹 roles/windows/ (GPO, hardening, event forwarding)
- 🔹 roles/redteam/ (implant staging, payloads, lateral moves)
- 🔹 roles/soc/ (Wazuh, ELK, Suricata)

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
