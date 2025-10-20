# Zenity Port Scanner (Bash)

A small interactive port scanner script that uses `zenity` for a GUI input form and `nc` (netcat) to check ports.  
This is a lightweight utility for quickly checking open TCP ports on an IP address or a hostname (resolved to an IP).

> **Script file:** `port-scanner.sh`  
> (Make sure it's executable: `chmod +x port-scanner.sh`)

---

## ⚙️ Features

- GUI input using `zenity` (form with fields for target and port range)
- Resolves hostname to IPv4 address (if you tell it you entered a hostname)
- Uses `nc` (netcat) to check ports quickly
- Displays each open port using a `zenity --info` dialog and prints to stdout

---

## 🚨 Prerequisites

Install these packages first:

- `zenity` — GUI dialog tool (used for input and popup messages)  
- `netcat` (`nc`) — for port checking  
- `host` (from the `bind-utils`/`dnsutils` package) — used to resolve hostnames

On Debian/Ubuntu:
```bash
sudo apt update
sudo apt install zenity netcat dnsutils
