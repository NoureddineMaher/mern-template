#!/bin/bash

# Define paths
DB_CONFIG_FILE="../dependencies/dbConfigRequirements.txt"
ENV_FILE="../../server/.env"

# Print debug information
echo "DB_CONFIG_FILE: $DB_CONFIG_FILE"
echo "ENV_FILE: $ENV_FILE"

# Check if the DB config file exists
if [ ! -f "$DB_CONFIG_FILE" ]; then
  echo "Error: $DB_CONFIG_FILE does not exist."
  exit 1
fi

# Create or clear the .env file
if ! touch "$ENV_FILE"; then
  echo "Error: Could not create .env file. Check directory permissions."
  exit 1
fi
> "$ENV_FILE" && echo "Cleared or created .env file successfully."

# Copy variables from dbConfigRequirements.txt to .env
while IFS= read -r line; do
  # Skip empty lines or lines starting with #
  [[ -z "$line" || "$line" == \#* ]] && continue
  
  # Write the line to the .env file
  if echo "$line" >> "$ENV_FILE"; then
    echo "Added line to .env file: $line"
  else
    echo "Error: Could not write to .env file."
    exit 1
  fi
done < "$DB_CONFIG_FILE"

echo ".env file created and variables added successfully."
