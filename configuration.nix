{ config, lib, pkgs, ... }:
{
  imports = [
    ./system/hardware.nix
    ./system/users.nix
    ./system/network.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "jumpbox";
  services.openssh.enable = true;

  time.timeZone = "Australias/Sydney";

  environment.systemPackages = [ (pkgs.writeShellScriptBin "configure" ''
    cd /etc/nixos && \
    sudo sh -ec '
      HOME=$(mktemp -d) nix-shell \
      --packages fish git vim dnsutils tcpdump \
      --command "EDITOR=vim EMAIL=fancl20@gmail.com fish"
    '
  '') ];

  system.stateVersion = "24.11";
}
