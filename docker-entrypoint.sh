#!/bin/sh
set -e

# Create auth directory if it doesn't exist
mkdir -p /CLIProxyAPI/auths

CONFIG_FILE="/CLIProxyAPI/config.yaml"

# Generate config.yaml from environment variables if they exist
if [ -n "$CONFIG_YAML" ]; then
    echo "$CONFIG_YAML" > "$CONFIG_FILE"
elif [ ! -f "$CONFIG_FILE" ]; then
    # Create minimal config if none exists
    # Use printf to avoid shell interpretation of special characters
    printf '%s\n' \
      'host: ""' \
      'port: 8317' \
      'remote-management:' \
      '  allow-remote: true' \
      "  secret-key: '${MANAGEMENT_KEY}'" \
      "management-password: '${MANAGEMENT_PASSWORD}'" \
      'api-keys:' \
      "  - '${API_KEY}'" \
      > "$CONFIG_FILE"
fi

exec ./CLIProxyAPI "$@"
