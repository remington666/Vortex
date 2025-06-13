# 🖥️ Vagrant Configuration for Kali Linux Threat Emulation VM

This Vagrantfile configures a single Kali Linux VM intended for threat emulation and Red Team exercises.

---

## 🧩 VM Definition

- **Name:** `kali.redteam`  
- **Box:** `kalilinux/rolling` (latest rolling release of Kali Linux)  
- **Hostname:** `kali.redteam`  
- **Network:** Private network on VirtualBox internal network `vboxnet4`  
  - 📍 Static IP: `192.168.1.2`

---

## ⚙️ VM Resources

- 💾 Memory: 2048 MB (2 GB)  
- 🧠 CPUs: 1 core

---

## 🚀 Provisioning Script

The VM runs a shell script during provisioning which performs the following:

1. 🔄 Updates the package lists and upgrades all packages:

    ```bash
    sudo apt update -y && sudo apt upgrade -y
    ```

2. 📦 Installs essential tools:  
   - `git-all` (for cloning repositories)  
   - `python3-pip` and `python3-venv` (Python package manager and virtual environment)  
   - `npm` (Node.js package manager)

3. 🎨 Sets the default system target to graphical mode:

    ```bash
    sudo systemctl set-default graphical.target
    ```

4. 📥 Clones the MITRE Caldera repository into `/opt`:

    ```bash
    cd /opt
    git clone https://github.com/mitre/caldera.git --recursive
    ```

5. 🐍 Sets up a Python virtual environment and installs Caldera dependencies:

    ```bash
    cd /opt/caldera
    python3 -m venv myenv
    source myenv/bin/activate
    python3 -m pip install --upgrade pip
    pip3 install -r requirements.txt
    ```

6. ▶️ Runs the Caldera server in insecure mode and builds it:

    ```bash
    python3 server.py --insecure --build
    ```
