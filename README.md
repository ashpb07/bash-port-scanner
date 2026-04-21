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
```mermaid

flowchart TD

A([Start]) --> B[Launch Zenity Form]

B --> C{User Cancelled?}
C -->|Yes| D[Exit Script]
C -->|No| E[Parse Input<br/>(Type, Target, Start Port, End Port)]

E --> F{Valid Input?}
F -->|No| G[Show Error via Zenity<br/>Exit]
F -->|Yes| H{Type = Hostname?}

H -->|Yes| I[Resolve Hostname using host]
I --> J{Resolution Successful?}
J -->|No| G
J -->|Yes| K[Set Target IP]

H -->|No| K

K --> L[Initialize Open Ports List]

L --> M[Loop: Port = Start → End]

M --> N[Scan Port using nc]

N --> O{Port Open?}
O -->|Yes| P[Add Port to List]
O -->|No| Q[Continue]

P --> Q
Q --> R{More Ports?}

R -->|Yes| M
R -->|No| S{Any Open Ports Found?}

S -->|No| T[Show "No Open Ports" via Zenity]
S -->|Yes| U[Display Open Ports via Zenity]

T --> V([End])
U --> V
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
