#!/bin/sh
set -e

# Create config.yaml from example if it doesn't exist
if [ ! -f /CLIProxyAPI/config.yaml ]; then
    echo "Creating default config.yaml from config.example.yaml..."
    cp /CLIProxyAPI/config.example.yaml /CLIProxyAPI/config.yaml
fi

# Create auth directory if it doesn't exist
mkdir -p /CLIProxyAPI/auths

exec ./CLIProxyAPI "$@"
