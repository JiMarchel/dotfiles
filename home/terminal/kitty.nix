{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 4;
      #background_opacity = "0.8";
      #background_blur = 5;
    };
  };
}
