#!/bin/bash

# Check for output mode argument
output_mode=${1:-display}  # default to 'display' if no argument is given

# Start of CSV file for Excel output
csv_file="system_versions.csv"
if [[ $output_mode == "excel" ]]; then
    echo "Component,Version" > "$csv_file"
fi

# Function to execute a command, print its version, or "NOK" if not found
check_version() {
    component=$2
    # Execute the command and capture both stdout and stderr
    output=$($1 2>&1)
    
    # Check if the output contains "commande introuvable"
    if echo "$output" | grep -q "commande introuvable"; then
        version="NOK"
    elif [[ $component == "Docker" ]]; then
        # Extract the first line containing 'Version' for Docker
        version=$(echo "$output" | grep "Version" | head -n 1)
    else
        version=$(echo "$output" | head -n 1)
    fi

    # Handle output based on mode
    case $output_mode in
        display)
            echo "-> $component version:"
            echo "$version"
            ;;
        excel)
            echo "$component,$version" >> "$csv_file"
            ;;
        column)
            echo "$version"
            ;;
        *)
            echo "Invalid output mode. Use 'display', 'excel', or 'column'."
            exit 1
            ;;
    esac
}

# List of components to check
components=(
    "Docker,docker version"
    "Firewalld,firewall-cmd --version"
    "Git,git version"
    "Network Manager,nmcli -v"
    "Nginx,nginx -v"
    "NodeJS,node -v"
    "Openssl,openssl version"
    "Postgresql,postgres --version"
    "Python2,python2 -V"
    "Python3,python3 -V"
    "Systemctl,systemctl --version"
    "Tanium,/opt/Tanium/TaniumClient/TaniumClient -v"
)

# Iterate through components and check versions
for item in "${components[@]}"; do
    IFS=',' read -r name command <<< "$item"
    check_version "$command" "$name"
done

# Final message for Excel mode
if [[ $output_mode == "excel" ]]; then
    echo "Version information saved to $csv_file"
fi
