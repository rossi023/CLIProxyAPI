#!/bin/bash
# Generate secure random password for CLIProxyAPI
# Usage: ./generate-password.sh [length]

LENGTH=${1:-32}
PASSWORD=$(openssl rand -base64 $LENGTH | tr -dc 'a-zA-Z0-9!@#$%^&*()_+-=' | head -c $LENGTH)
echo "Generated password: $PASSWORD"
echo ""
echo "Add to Render environment variables:"
echo "  MANAGEMENT_PASSWORD=$PASSWORD"
echo ""
echo "Add to config.yaml:"
echo "  management-password: \"$PASSWORD\""
