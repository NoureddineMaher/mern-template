#!/bin/bash

# Define the correct path to the Node.js script
NODE_PATH="../_js_scripts/generate_modals.js"

# Check if the Node.js script exists
if [ ! -f "$NODE_PATH" ]; then
  echo "🔴🔴 Error: File $NODE_PATH does not exist."
  exit 1
fi

# Run the Node.js script to generate models
node "$NODE_PATH"
