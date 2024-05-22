#!/bin/bash

# Function to perform checks for a single URL
check_url() {
    local url="$1"
    local domain=$(sed -nE 's/([^/]+).*/\1/p' <<< "$url")
    local output=$(openssl s_client -connect "$domain:443" -servername "$domain" -tls1_3 -alpn h2 -status 2>&1 <<< "QUIT")

    local tls=$(grep -Eo 'Protocol\s+: TLSv1.3' <<< "$output")
    local h2=$(grep -o 'ALPN protocol: h2' <<< "$output")
    local key=$(grep -o 'Server Temp Key: X25519' <<< "$output")
    local ocsp=$(grep -o 'OCSP Response Status: successful' <<< "$output")

    if [ -n "$tls" ] && [ -n "$h2" ] && [ -n "$key" ] && [ -n "$ocsp" ]; then
        echo "$domain: Supports TLSv1.3, HTTP/2, X25519, and shows OCSP response"
    else
        echo "$domain: Does NOT support all required protocols and responses"
    fi
}

# Loop through all URLs provided as arguments
for url in "$@"; do
    check_url "$url"
done
