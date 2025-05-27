{pkgs, ...}: {
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    font-awesome
    btop
    yazi

    #dev
    rustup
    gcc

    pavucontrol
  ];
}
