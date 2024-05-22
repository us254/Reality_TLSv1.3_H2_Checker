# TLSv1.3 and HTTP/2 Checker

This Bash script checks if a given list of URLs supports TLSv1.3, HTTP/2, X25519, and OCSP response.

## Prerequisites

- Bash shell
- `openssl` command-line tool

## Usage

1. Save the script to a file, e.g., `check_tls.sh`.

2. Make the script executable:

   ```bash
   chmod +x check_tls.sh
   ```

3. Run the script with the URLs you want to check as arguments:

   ```bash
   ./check_tls.sh https://example.com https://another-example.com
   ```

   The script will output the status of each URL, indicating whether it supports the required protocols and responses.

## Example Output

```
example.com: Supports TLSv1.3, HTTP/2, X25519, and shows OCSP response
another-example.com: Does NOT support all required protocols and responses
```

## How it Works

1. The script defines a `check_url` function that takes a URL as an argument.

2. Inside the `check_url` function, the script extracts the domain name from the URL using a `sed` command.

3. The script then uses the `openssl` command to connect to the domain on port 443 and check for the following:
   - TLSv1.3 support
   - HTTP/2 support
   - X25519 server key
   - Successful OCSP response

4. The script parses the `openssl` output to determine if the domain supports all the required protocols and responses.

5. The script prints the result for the domain, indicating whether it supports the required protocols and responses.

6. The script loops through all the URLs provided as arguments and calls the `check_url` function for each one.

## Running on Ubuntu

To run the script on Ubuntu, follow these steps:

1. Open a terminal on your Ubuntu system.

2. Install the `openssl` package if it's not already installed:

   ```bash
   sudo apt-get update
   sudo apt-get install -y openssl
   ```

3. Download the script from the GitHub repository:

   ```bash
   wget https://raw.githubusercontent.com/us254/Reality_TLSv1.3_H2_Checker/main/check_tls.sh
   ```

4. Make the script executable:

   ```bash
   chmod +x check_tls.sh
   ```

5. Run the script with the URLs you want to check as arguments:

   ```bash
   ./check_tls.sh https://example.com https://another-example.com
   ```

   The script should now run and display the results for the provided URLs on your Ubuntu system.
