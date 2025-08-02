{pkgs, lib, ...}:

{
  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    vim
  ];
  wayland.windowManager.sway.enable = true;
  programs.nushell = {
    enable = true;
  };
  
  home.shell.enableNushellIntegration = true;
  imports = [
    ./programming.nix
  ];
}
