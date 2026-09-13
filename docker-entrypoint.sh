#!/bin/sh
set -e

# Create auth directory if it doesn't exist
mkdir -p /CLIProxyAPI/auths

# Generate config.yaml from environment variables if they exist
if [ -n "$CONFIG_YAML" ]; then
    echo "$CONFIG_YAML" > /CLIProxyAPI/config.yaml
elif [ ! -f /CLIProxyAPI/config.yaml ]; then
    # Create minimal config if none exists
    cat > /CLIProxyAPI/config.yaml << EOF
host: ""
port: 8317
remote-management:
  allow-remote: true
  management-key: "${MANAGEMENT_KEY:-changeme}"
management-password: "${MANAGEMENT_PASSWORD:-changeme}"
api-keys:
  - "${API_KEY:-changeme}"
EOF
fi

exec ./CLIProxyAPI "$@"
