#!/bin/bash

# Function to perform checks for a single URL
check_url() {
  local url="$1"
  local domain=$(echo "$url" | sed -E 's#^https?://([^/]+).*#\1#')
  local output=$(openssl s_client -connect "$domain:443" -servername "$domain" \
    -tls1_3 -alpn h2 -status 2>&1 <<< "QUIT")

  # Use grep -q for boolean checks
  local tls_supported=$(grep -q 'Protocol\s+: TLSv1.3' <<< "$output")
  local h2_supported=$(grep -q 'ALPN protocol: h2' <<< "$output")
  local key_supported=$(grep -q 'Server Temp Key: X25519' <<< "$output")
  local ocsp_supported=$(grep -q 'OCSP Response Status: successful' <<< "$output")

  if [[ $tls_supported && $h2_supported && $key_supported && $ocsp_supported ]]; then
    echo "$domain: Supports TLSv1.3, HTTP/2, X25519, and shows OCSP response"
  else
    echo "$domain: Does NOT support all required protocols and responses"
  fi
}

# Loop through all URLs provided as arguments
for url in "$@"; do
  check_url "$url"
done
