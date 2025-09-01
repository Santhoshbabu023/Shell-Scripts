#!/bin/bash
domains=("google.com" "github.com" "example.com")

for domain in "${domains[@]}"; do
    echo "Checking $domain ..."
    
    # Use nslookup instead of dig
    nslookup $domain >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "DNS Resolution Success"
    else
        echo "DNS Resolution Failed"
    fi
    echo "----------------------"
done
