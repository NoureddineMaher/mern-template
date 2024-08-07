PROJECT_ROOT="$(dirname "$(realpath "$0")")/../.."
SERVER_DIR="$PROJECT_ROOT/server"
SERVER_PACKAGES_FILE="$PROJECT_ROOT/scripts/dependencies/serverRequirements.txt"

echo "Starting server setup..."
if [ -d "$SERVER_DIR" ]; then
    echo "Navigating to $SERVER_DIR..."
    cd "$SERVER_DIR" || exit

    if [ ! -f "package.json" ]; then
        echo "package.json not found. Running npm init -y..."
        npm init -y
    fi

    echo "Running npm install in $SERVER_DIR..."
    npm install

    if [ -f "$SERVER_PACKAGES_FILE" ]; then
        echo "Found package file at $SERVER_PACKAGES_FILE. Installing packages..."
        while IFS= read -r package; do
            if [ ! -z "$package" ]; then
                echo "Installing $package..."
                npm install "$package"
            fi
        done < "$SERVER_PACKAGES_FILE"
    else
        echo "No package file found at $SERVER_PACKAGES_FILE."
    fi

    cd - || exit
else
    echo "Directory $SERVER_DIR does not exist."
fi

echo "Server setup complete ! Happy Coding :)"
