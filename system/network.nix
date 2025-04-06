{ config, pkgs, ... }:
{
  systemd.network = {
    enable = true;
    networks = {
      "10-lan" = {
        matchConfig.Name = "enp2s0";
        DHCP = "ipv4";
      };
    };
  };
}
