#  Zenity Port Scanner (Bash)

A lightweight **GUI-based TCP port scanner** built using Bash, leveraging Zenity for user interaction and Netcat (`nc`) for fast port scanning.

This tool provides a simple interface to scan open ports on a target system using either an IP address or a hostname.

---

##  Features

*  Interactive GUI input using Zenity
*  Supports both **hostname and IP scanning**
*  Automatic hostname → IPv4 resolution
*  Fast TCP connect scan using Netcat
*  Displays results via popup + terminal output
*  Input validation (ports, empty fields, range checks)

---

##  Tech Stack

* Bash scripting
* Zenity (GUI dialogs)
* Netcat (nc) (port scanning)
* DNS utilities (`host`)

---

##  Prerequisites

Make sure the following packages are installed:

* Zenity
* Netcat (`nc`)
* dnsutils (for `host` command)

### Debian / Ubuntu

```bash
sudo apt update
sudo apt install zenity netcat dnsutils
```

---

## ▶ Usage

### 1. Make the script executable

```bash
chmod +x port-scanner.sh
```

### 2. Run the script

```bash
./port-scanner.sh
```

---

##  Input Fields

The GUI will prompt for:

* **Type** → `hostname` or `ip`
* **Target** → domain (e.g., `scanme.nmap.org`) or IP (`127.0.0.1`)
* **Start Port** → beginning of range
* **End Port** → end of range

---

##  Example

```
Type: hostname
Target: scanme.nmap.org
Start Port: 20
End Port: 100
```

---

##  Disclaimer

* This tool performs a **basic TCP connect scan**
* Results may be affected by:

  * Firewalls
  * IDS/IPS systems
  * Network filtering

 Do not scan unauthorized systems
Use only on:

* Your own machine
* Local network
* Authorized test targets (e.g., scanme.nmap.org)

---

##  Future Improvements

*  Progress bar using Zenity
*  Parallel scanning (multi-threaded)
*  Export results to file
*  Service/version detection (like Nmap)
*  Replace with SYN scan for stealth

---

##  Learning Value

This project demonstrates:

* Bash scripting for real-world tools
* GUI integration in shell scripts
* Networking fundamentals (TCP ports, scanning)
* Practical cybersecurity concepts

---

##  File Structure

```
.
├── port-scanner.sh
└── README.md
```

---

##   Author Notes

This is a **beginner-to-intermediate cybersecurity project** that bridges:

* Linux scripting
* Networking
* Offensive security basics
