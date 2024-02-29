### Using the `check_tls.sh` Script on Ubuntu System

To utilize the `check_tls.sh` script from the GitHub repository "Reality_TLSv1.3_H2_Checker" on an Ubuntu system, follow these straightforward steps:

**Step 1: Install Dependencies**
Before executing the script, make sure you have `git` and `openssl` installed on your system. These are essential for the script to work correctly. You can install them using Ubuntu's package manager.

Open a terminal and run:

```bash
sudo apt update
sudo apt install git openssl -y
```

**Step 2: Clone the GitHub Repository**
Clone the repository to your local system using the `git` command.

```bash
git clone https://github.com/us254/Reality_TLSv1.3_H2_Checker.git
```

**Step 3: Navigate to the Repository Directory**
Change into the directory that you just cloned.

```bash
cd Reality_TLSv1.3_H2_Checker/
```

**Step 4: Make the Script Executable**
Before running the script, you need to make it executable.

```bash
chmod +x check_tls.sh
```

**Step 5: Run the Script**
Now, you can run the script. Provide one or more URLs (separated by spaces) to check their TLS 1.3 and HTTP/2 support.

```bash
./check_tls.sh https://example.com https://anotherexample.com
```

Replace `https://example.com` and `https://anotherexample.com` with the URLs you wish to examine.

**Additional Notes**
- **Updating the Script:** If the author updates the script, pull these changes into your local clone by navigating to the script's directory and running `git pull`.
- **Dependencies:** The script relies on `openssl`. Ensure your `openssl` version supports TLS 1.3 for accurate results.
- **Script Modifications:** If you're familiar with shell scripting, customize the `check_tls.sh` script to suit your requirements, like adding verbose output or altering the checks it performs.
- **Running as Sudo:** If the script needs access to privileged ports or operations, consider running it with `sudo`, although it's generally not required for this script.

This script serves as a valuable tool for administrators, web developers, or security enthusiasts to swiftly assess the security configurations (specifically TLS 1.3 and HTTP/2 support) of websites directly from the command line. 🛡️
