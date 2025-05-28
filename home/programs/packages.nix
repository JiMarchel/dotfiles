{pkgs, ...}: {
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    font-awesome
    btop
    brightnessctl
    ripgrep
    bat

    #wifi
    networkmanagerapplet

    #terminal filemanager
    yazi

    #dev
    rustup
    gcc

    #audio
    pavucontrol

    #player
    playerctl

    #screenshot
    hyprshot

    #bluetooth
    blueman
  ];
}
