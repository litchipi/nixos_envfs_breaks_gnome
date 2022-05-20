{ config, lib, pkgs, ...}:
{

  users.users."joe" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    password = "joe";
  };
  
  networking.hostName = "joevm";

  users.mutableUsers = false;
  
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = lib.mkForce "no";
    kbdInteractiveAuthentication = false;
  };

  virtualisation = {
    cores = 2;
    memorySize = 2048;
    diskSize = 1024*4;
  };

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  system.stateVersion = "22.05";
}
