# TLS Checker

The `tlschecker.sh` script is designed to automate the process of checking if a list of URLs supports certain security protocols: TLSv1.3, HTTP/2, and whether they use the X25519 key for server temporary key and provide OCSP responses.

## Getting Started

These instructions will get you a copy of the script up and running on your local machine for development and testing purposes.

### Prerequisites

You will need the following installed on your system:

- `bash` shell (typically pre-installed on most UNIX environments)
- `curl`
- `grep`
- `openssl`
- `parallel` (GNU Parallel)

Also, ensure the script has permissions to execute:

```bash
chmod +x tlschecker.sh
