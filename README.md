Here's the markdown:


## Code.sh

This is a bash script that defines two functions: `check_url` and `is_tlsv1_3_h2`. These functions are used to check if a URL supports specific security protocols, such as TLS 1.3, HTTP/2, X25519 and OCSP. The functions use `parallel` to run the checks for multiple URLs in parallel and create a log file named `joblog.txt`.

### Requirements

- Bash
- OpenSSL
- Parallel

### Usage

To use this script, follow these steps:

1. Download the code file from the address using `wget` or `curl`. For example, you can type:
   ```
   wget https://raw.githubusercontent.com/us254/Anyplace1525/main/Ravage3184
   ````
   Or:
   ```
   curl -O https://raw.githubusercontent.com/us254/Anyplace1525/main/Ravage3184
   ````
   This will download the file to your current directory and name it `Ravage3184`.

2. Install `parallel` on your system using your package manager or by downloading it from the website. For example, if you are using Debian/Ubuntu, you can type:
   ```
   sudo apt install parallel
   ````
   This will install `parallel` from the official repository of your Linux distribution.

3. Rename the file to `code.sh` and make it executable by using the `mv` and `chmod` commands. For example, you can type:
   ```
   mv Ravage3184 code.sh
   chmod +x code.sh
   ````
   This will rename the file to `code.sh` and give it the execute permission.

4. Source the `code.sh` file to load the functions into your current shell session by running:
   ```
   source code.sh
   ````
   Or using the dot operator:
   ```
   . code.sh
   ````
   This will make the `check_url` and `is_tlsv1_3_h2` functions available in your current shell session.

5. Export the `check_url` function to subshells or subprocesses that inherit the environment from the current shell by running:
   ```
   export -f check_url
   ````
   This will make the `check_url` function available to any subshell or subprocess that inherits the environment from the current shell.

6. Run the `check_url` function to check a single URL by passing it as an argument. For example:
   ```
   check_url https://www.cloudflare.com
   ````
   This will print a message indicating if the URL supports TLS 1.3, HTTP/2, X25519 and OCSP.

7. Run the `is_tlsv1_3_h2` function to check multiple URLs in parallel by passing them as arguments separated by spaces. For example:
   ```
   is_tlsv1_3_h2 https://example.com https://google.com
   ````
   This will print a message for each URL indicating if it supports TLS 1.3, HTTP/2, X25519 and OCSP. It will also create a log file named `joblog.txt` with information about each job.

8. View the log file by running:
   ```
   cat joblog.txt
   ````
   This will print a line for each job with information such as the command, the exit code, and the output.

### License

This script is licensed under GNU GPL version 3 or later https://gnu.org/licenses/gpl.html. This is free software: you are free to change and redistribute it.
```
