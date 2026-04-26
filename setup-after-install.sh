#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v nixos-generate-config >/dev/null 2>&1; then
  echo "nixos-generate-config was not found. Run this on NixOS after installation." >&2
  exit 1
fi

# 1. Capture hardware and rebuild
sudo nixos-generate-config --show-hardware-config > modules/hosts/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#desktop

# 2. Add Flatpak remote
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

cat <<'MSG'

NixOS switch complete.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 SECURE BOOT SETUP (Lanzaboote)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Reboot and enter BIOS firmware settings
2. Set Secure Boot to "Setup Mode" (clears factory keys)
3. Boot back into NixOS, then run:

   sudo sbctl create-keys
   sudo sbctl enroll-keys --microsoft
   sudo nixos-rebuild boot --flake .#desktop
   sudo sbctl verify

4. Reboot, enable Secure Boot in BIOS (keep it enabled)
5. Verify with: sbctl status

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 POST-SETUP (run inside the relevant devshell)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
.NET global tools (nix develop .#dotnet):
  dotnet tool install -g dotnet-ef
  dotnet tool install -g binlogtool

Node global tools (nix develop .#nodejs):
  npm install -g nx

VSCode extensions:
  xargs -n 1 code --install-extension < docs/vscode-extensions.txt

MSG
