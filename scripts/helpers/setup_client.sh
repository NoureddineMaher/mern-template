#!/bin/bash

PROJECT_ROOT="$(dirname "$(realpath "$0")")/../.."
CLIENT_DIR="$PROJECT_ROOT/client"
CLIENT_PACKAGES_FILE="$PROJECT_ROOT/scripts/dependencies/clientRequirements.txt"

echo "Starting client setup...⏳"
if [ -d "$CLIENT_DIR" ]; then
    echo "Navigating to $CLIENT_DIR..."
    cd "$CLIENT_DIR" || exit

    if [ ! -f "package.json" ]; then
        echo "package.json not found. Running npm init -y...🧹🧹"
        npm init -y
    fi

    echo "Running npm install in $CLIENT_DIR..."
    npm install

    if [ -f "$CLIENT_PACKAGES_FILE" ]; then
        echo "Found package file at $CLIENT_PACKAGES_FILE. Installing packages..."
        while IFS= read -r package; do
            if [ ! -z "$package" ]; then
                echo "Installing $package...⏳⏳⏳"
                npm install "$package"
            fi
        done < "$CLIENT_PACKAGES_FILE"
    else
        echo "🔴 🔴  No package file found at $CLIENT_PACKAGES_FILE."
    fi

    cd - || exit
else
    echo "🔴 Directory $CLIENT_DIR does not exist."
fi

echo "Client setup complete ! Happy Coding ✅✅✅"
