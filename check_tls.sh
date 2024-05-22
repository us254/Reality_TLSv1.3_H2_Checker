#!/bin/bash

# Function to perform checks for a single URL
check_url() {
    local url="$1"
    local domain=$(echo "$url" | grep -oE '([^/]+)' | head -n 1)
    local output=$(echo QUIT | openssl s_client -connect "$domain:443" -servername "$domain" -tls1_3 -alpn h2 -status 2>&1)

    local tls=$(echo "$output" | grep -Eo 'Protocol\s+: TLSv1.3')
    local h2=$(echo "$output" | grep -o 'ALPN protocol: h2')
    local key=$(echo "$output" | grep -o 'Server Temp Key: X25519')
    local ocsp=$(echo "$output" | grep -o 'OCSP Response Status: successful')

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
