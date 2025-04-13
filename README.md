# jumpbox
Nixos configuration for Minisforum S100 as a jumpbox.

## Initialization
```bash
sudo sh -c 'HOME=$(mktemp -d) nix-shell --command fish --packages fish git vim'

# Partitioning and formatting
parted /dev/sdb -- mklabel gpt
parted /dev/sdb -- mkpart root btrfs 512MB 100%
parted /dev/sdb -- mkpart ESP fat32 1MB 512MB
parted /dev/sdb -- set 2 esp on

mkfs.btrfs -fL nixos /dev/sdb1

mount /dev/disk/by-label/nixos /mnt
mkdir -p /mnt/boot
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot

# Installing
cd /etc/nixos && git clone https://github.com/fancl20/jumpbox.git .

nixos-install

# Cleanup and reboot
rm -rf /root/.* && reboot
```

## Updating
```bash
nix flake update
nixos-switch
```
