{ config, pkgs, ... }:
{
  programs.fish.enable = true;
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user = { name = "fancl20"; email = "fancl20@gmail.com"; };
    };
  };
  users.users.nixos = {
      shell = pkgs.fish;
      packages = with pkgs; [
        dnsutils
        google-cloud-sdk talosctl fluxcd terraform kubectl _1password-cli
      ];
  };
}
