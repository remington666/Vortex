# 🧾 Overview

This Vagrantfile configures two Windows Server 2016 virtual machines:

- **dc02**: Domain Controller  
- **iis**: IIS Web Server

Both are connected to a VirtualBox private network (`vboxnet2`) with fixed IP addresses.

---

## 🏗️ Configuration Details

### 🔹 Machine `dc02`

- Box: `jborean93/WindowsServer2016` version 1.2.0  
- Private IP: `10.10.2.2`  
- Hostname: `dc02`  
- Resources: 3 CPU / 3072 MB RAM  
- WinRM Transport: SSL (with certificate verification disabled)  
- Provisioning:  
  - Download of Wazuh Agent 4.10.1  
  - Download of Sysmon  
  - Copy of:  
    - `sysmon.ps1` (installation/configuration script)  
    - `sysmonconfig.xml` (Sysmon configuration)  
    - `Configure-Channel.ps1` (probably for configuring Windows logs)

### 🔹 Machine `iis`

Identical to `dc02` except for:  
- Private IP: `10.10.2.3`  
- Hostname: `IIS16`

---

## 🔒 Security / Network

- Uses WinRM with SSL, but with `ssl_peer_verification = false`, which:  
  - Avoids certificate errors during automation.  
  - **Important:** Be cautious in production environments, as this may pose a security risk.

---

## ⚙️ Script Usage in the Project

This setup is part of a Windows environment monitored with Wazuh and Sysmon:  

- **Wazuh Agent** → collects security logs  
- **Sysmon** → logs detailed system events  
- **PowerShell scripts (.ps1)** → automate configuration and installation
