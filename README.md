# utilities-check-version

This repository hosts a collection of Python and Shell scripts designed to check the versions of various utilities on any Linux machine. This tool is especially useful for system administrators, developers, and IT professionals who need to quickly verify the version information of critical software like Docker, Python, NetworkManager, and more.

## Supported Utilities

- Docker
- Firewalld
- Git
- Network Manager
- Nginx
- NodeJS
- Openssl
- Postgresql
- Python2
- Python3
- Systemctl
- Tanium 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Ensure you have a Linux operating system with bash and Python installed. Specific scripts may have additional requirements.

### Installing

To use the scripts in this repository, first clone the repo on your Linux machine:

```bash
git clone https://github.com/DevOps/utilities-check-version.git
```

Navigate to the cloned directory:

```bash
cd utilities-check-version
```

Set the scripts as executable:

```bash
chmod +x *.sh *.py
```

### Usage

This script supports multiple modes of operation, determined by the `output_mode` variable. Here's how to use the script in different modes:

- **Display Mode**: This is the default mode where the script prints both the labels and the versions to the terminal. Use this command to run the script in display mode:
  ```bash
  bash ./check-version.sh display
  ```

- **Excel Mode**: In this mode, the script writes the output to a CSV file named `system_versions.csv`. Use this command to run the script in excel mode:
  ```bash
  bash ./check-version.sh excel
  ```

- **Column Mode**: This mode outputs just the version information as a single column without any labels. Use this command to run the script in column mode:
  ```bash
  bash ./check-version.sh column
  ```

Choose the mode that best suits your needs for displaying or saving the version information of the utilities.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/XFeature`)
3. Commit your Changes (`git commit -m 'Add some XFeature'`)
4. Push to the Branch (`git push origin feature/XFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Authors

* **Haitam ELKADIRI** - *Initial work* - [HaitamDevOps](https://github.com/HaitamDevOps)
