# jumpbox
Nixos configuration for Minisforum S100 as a jumpbox.

## Initialization
```bash
sudo sh -c 'HOME=$(mktemp -d) nix-shell --command fish --packages fish git vim'

# In nix-shell
cd /etc/nixos && git clone https://github.com/fancl20/jumpbox.git .

nixos-rebuild boot

# Cleanup and reboot
rm -rf /root/.* && reboot
```

## Updating
```bash
nix flake update
nixos-switch
```
