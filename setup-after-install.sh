#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v nixos-generate-config >/dev/null 2>&1; then
  echo "nixos-generate-config was not found. Run this on NixOS after installation." >&2
  exit 1
fi

sudo nixos-generate-config --show-hardware-config > modules/hosts/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#desktop

cat <<'MSG'

NixOS switch complete.

Recommended follow-up:
  dotnet tool install -g dotnet-ef --version 10.0.6
  dotnet tool install -g binlogtool --version 1.0.29
  npm install -g nx@22.5.4
  xargs -n 1 code --install-extension < docs/vscode-extensions.txt

MSG
