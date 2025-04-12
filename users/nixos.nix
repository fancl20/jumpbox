{ config, pkgs, ... }:
{
  programs.fish.enable = true;
  users.users.nixos = {
      shell = pkgs.fish;
      packages = with pkgs; [
        git vim dnsutils
        google-cloud-sdk talosctl fluxctl terraform kubectl
        (pkgs.writeShellScriptBin "gcloud-login" ''
          gcloud --project=home-servers-275405 auth application-default login
        '')
      ];
  };
}
