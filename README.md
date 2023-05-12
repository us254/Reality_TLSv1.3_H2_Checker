# Anyplace1525
TLSv1.3 and HTTP/2 Protocol Checker
This repository contains a shell script that checks whether a website supports the TLSv1.3 protocol and the HTTP/2 protocol. The script uses the OpenSSL command-line tool to connect to the specified website and check its supported protocols. If the website supports TLSv1.3 and HTTP/2, the script outputs a success message. If not, the script outputs a failure message. The script also checks for the X25519 elliptic curve, which is recommended for use with TLSv1.3. The script can be easily modified to check multiple websites at once.
