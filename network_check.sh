#!/bin/bash
hosts=("google.com" "github.com")
ports=(80 443 22)

for host in "${hosts[@]}"; do
    echo "Checking $host ..."

    # Ping
    ping -n 2 $host >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Ping: Success"
    else
        echo "Ping: Failed"
    fi

    # Curl HTTP check
    curl -Is http://$host | head -n 1

    # Port check using PowerShell
    for port in "${ports[@]}"; do
        powershell.exe Test-NetConnection -ComputerName $host -Port $port
    done

    # Traceroute
    tracert -h 5 $host
    echo "---------------------------"
done
