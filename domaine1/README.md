# 🧱 Parent Domain Architecture

Three machines are deployed on an isolated private network (`vboxnet1`) with static IP addresses:

| Name     | Role                      | Operating System        | IP Address   |
|----------|---------------------------|--------------------------|--------------|
| dc01     | Domain Controller         | Windows Server 2022      | 10.10.1.2    |
| file_srv | File Server               | Windows Server 2022      | 10.10.1.3    |
| debian   | DVWA Target + Linux Agent | Debian 12                | 10.10.1.4    |

---

## ⚙️ Installed Components

### 🔹 On the Windows machines (`dc01`, `file_srv`)
- **Wazuh Agent 4.10.1**: Host-based Intrusion Detection System (HIDS) agent for log and system activity monitoring.
- **Sysmon**: Advanced logging tool from Microsoft Sysinternals.
- **PowerShell Scripts**:
  - `sysmon.ps1`: Installs and configures Sysmon.
  - `sysmonconfig.xml`: Sysmon configuration file specifying which events to monitor.
  - `Configure-Channel.ps1`: Enables specific Windows log channels required for event correlation.

### 🔹 On the Linux machine (`debian`)
- **Apache2**: Web server used to host the DVWA application.
- **DVWA (Damn Vulnerable Web Application)**: A deliberately vulnerable web app used for simulating web attacks.
- **Wazuh Agent**: Linux version of the Wazuh agent.
- **Manual network configuration**: Static interface set up with gateway and DNS.

---

## ▶️ Starting the Environment

Clone the repository:

```bash
git clone <repository-url>
cd <project-folder>

Start the machines:
vagrant up --provision
Wait until the agents, services and scripts are installed (this might take a few minutes)
Access DVWA via your browser :
http://10.10.1/
