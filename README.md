# nmv NixOS Flake

This is a small dendritic-style NixOS configuration for the desktop currently
running Fedora 43 KDE.

The entry point is `flake.nix`. Every other `.nix` file under `modules/` is a
top-level flake-parts module imported through `import-tree`, following the
dendritic pattern from <https://github.com/mightyiam/dendritic>.

## First Boot Setup

After installing NixOS, copy or keep this repository at:

```sh
/mnt/mics/Dev/flake
```

Then run:

```sh
cd /mnt/mics/Dev/flake
sudo nixos-generate-config --show-hardware-config > modules/hosts/hardware-configuration.nix
sudo nixos-rebuild switch --flake .#desktop
```

There is also a helper script:

```sh
./setup-after-install.sh
```

The generated hardware file is intentionally not pre-filled with old disk UUIDs,
because a reinstall usually creates new UUIDs.

## Post-install Manual Commands

Install your .NET tools:

```sh
dotnet tool install -g dotnet-ef --version 10.0.6
dotnet tool install -g binlogtool --version 1.0.29
```

Install global Node tooling if you still want it outside project-local dev
shells:

```sh
npm install -g nx@22.5.4
corepack enable
```

Install VS Code extensions:

```sh
xargs -n 1 code --install-extension < docs/vscode-extensions.txt
```

Flatpak apps are installed by the `nmv-install-flatpaks` systemd service after
the first rebuild with network access.

## Useful Commands

```sh
nixos-rebuild dry-run --flake .#desktop
sudo nixos-rebuild switch --flake .#desktop
nix flake update
nix flake check
```

## Layout

```text
flake.nix
modules/
  flake-parts.nix
  nixos-configurations.nix
  options.nix
  hosts/
    desktop.nix
    hardware-configuration.nix
  features/
    *.nix
docs/
  vscode-extensions.txt
```
