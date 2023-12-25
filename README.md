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
```

### Installing

To use the script, you should clone this repository or simply download the `tlschecker.sh` file and ensure it is executable as shown above.

### Usage

To run the script:

```bash
./tlschecker.sh <url1> <url2> <url3>...
```

Replace `<url1> <url2> <url3>...` with the actual URLs you wish to check.

For example:

```bash
./tlschecker.sh www.example.com www.anotherdomain.com
```

### How It Works

The script performs the following actions:

1. Downloads a required function definition from a specified GitHub repository.
2. Sources this downloaded file to import function definitions.
3. Defines additional functions for checking individual URLs against the provided criteria.
4. Runs these checks in parallel by harnessing the power of GNU Parallel for efficiency.

### Output

The script will output the domains that fulfill all the set criteria (supporting TLSv1.3, HTTP/2, utilize the X25519 key exchange, and have OCSP responses). This information will be printed to `stdout`, and a log file named `joblog.txt` will be created to record the jobs carried out by GNU Parallel.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
