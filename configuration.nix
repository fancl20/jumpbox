{ config, lib, pkgs, ... }:
{
  imports = [
    ./system/hardware.nix
    ./system/users.nix
    ./system/network.nix
    ./system/os.nix

    ./users/nixos.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "jumpbox";
  services.openssh.enable = true;

  time.timeZone = "Australia/Sydney";

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "nixos-configure" ''
      cd /etc/nixos && \
      sudo sh -ec '
        HOME=$(mktemp -d) nix-shell \
        --packages fish git vim dnsutils \
        --command "EDITOR=vim EMAIL=fancl20@gmail.com fish"
      '
    '')
    (pkgs.writeShellScriptBin "nixos-switch" ''
      sudo sh -ec 'HOME=$(mktemp -d) nixos-rebuild switch --flake /etc/nixos/'
    '')
  ];

  system.stateVersion = "24.11";
}
