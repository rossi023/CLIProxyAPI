#!/bin/sh
set -e

# Create auth directory if it doesn't exist
mkdir -p /CLIProxyAPI/auths

exec ./CLIProxyAPI "$@"
