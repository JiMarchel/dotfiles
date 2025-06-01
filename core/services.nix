{pkgs, ...}: {
  services = {
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      # displayManager = {
      #   sddm.enable = true;
      #   sddm.theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
      # };

      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };
}
