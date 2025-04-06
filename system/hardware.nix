{ config, pkgs, lib, ... }:
{
  boot = {
    initrd.availableKernelModules = [ "ufshcd_pci" "xhci_pci" "dwc3_pci" "usbhid" "usb_storage" "sd_mod" ];
    kernelModules = [ "kvm-intel" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/6d1fef92-79cb-4d28-bf90-0bbaea75c736";
      fsType = "btrfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/6D65-B403";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
