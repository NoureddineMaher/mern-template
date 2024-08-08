#!/bin/bash

server_folders=(
    "controllers"
    "models"
    "routes"
    "middlewares"
    "helpers"
)

# Project root directory
PROJECT_ROOT="$(dirname "$(realpath "$0")")/../.."

echo "Creating client folder and setting up React app...⏳⏳⏳"
cd "$PROJECT_ROOT" || exit
mkdir -p client
cd client || exit
npx create-react-app .
cd ..

echo "Creating server folder and subdirectories...⏳⏳⏳"
mkdir -p server
cd server || exit
for folder in "${server_folders[@]}"; do
    mkdir -p "$folder"
    echo "Created $folder ✅"
done
cd ..

echo "Project setup complete! ✅✅✅"
