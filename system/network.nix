{ config, pkgs, ... }:
{
  systemd.network = {
    enable = true;
    networks = {
      "10-lan" = {
        matchConfig.Name = "enp2s0";
        address = [ "192.168.1.4/24" ];
        routes = [{ Gateway = "192.168.1.1"; GatewayOnLink = true; }];
        linkConfig.RequiredForOnline = "routable";
      };
    };
  };
  networking.useDHCP = false;
}
