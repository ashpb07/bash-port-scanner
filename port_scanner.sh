#!/bin/bash

# Get user input
response=$(zenity --forms \
  --title="Port Scanner" \
  --text="Enter scan details" \
  --add-combo="Type" --combo-values="hostname|ip" \
  --add-entry="Hostname or IP" \
  --add-entry="Start Port" \
  --add-entry="End Port")

# If cancelled
if [ $? -ne 0 ]; then
    echo "Cancelled"
    exit 1
fi

# Parse input
IFS="|" read type input_addr start end <<< "$response"

# Validate inputs
if [ -z "$input_addr" ] || [ -z "$start" ] || [ -z "$end" ]; then
    zenity --error --text="All fields are required"
    exit 1
fi

if ! [[ "$start" =~ ^[0-9]+$ && "$end" =~ ^[0-9]+$ ]]; then
    zenity --error --text="Ports must be numbers"
    exit 1
fi

if [ "$start" -gt "$end" ]; then
    zenity --error --text="Start port must be <= End port"
    exit 1
fi

# Resolve hostname if needed
if [ "$type" == "hostname" ]; then
    target=$(host "$input_addr" | awk '/has address/ {print $4; exit}')
    
    if [ -z "$target" ]; then
        zenity --error --text="Could not resolve hostname"
        exit 1
    fi
else
    target="$input_addr"
fi

echo "Scanning $target from port $start to $end..."

# Scan ports
open_ports=""

for ((port=start; port<=end; port++)); do
    if nc -znv -w 1 "$target" "$port" 2>&1 | grep -q "succeeded"; then
        echo "Open port: $port"
        open_ports+="Port $port\n"
    fi
done

# Show results
if [ -z "$open_ports" ]; then
    zenity --info --text="No open ports found"
else
    zenity --info --title="Scan Results" --text="Open Ports:\n$open_ports"
fi