{lib, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };
      background = lib.mkForce [
        {
          path = "/home/marchel/Pictures/wallpaper/64.png";
          blur_passes = 3;
        }
      ];

      image = [
        {
          path = "/home/marchel/Pictures/wallpaper/chika.jpg";
          size = 200;
          border_size = 4;
          # border_color = "rgb(0C96F9)";
          rounding = -1; # Negative means circle
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
      ];
      input-field = lib.mkForce [
        {
          size = "20%, 5%";
          position = "0, -20";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          # font_color = "rgb(CFE6F4)";
          # inner_color = "rgb(657DC2)";
          # outer_color = "rgb(0D0E15)";
          outline_thickness = 5;
          placeholder_text = "Password...";
          shadow_passes = 2;
        }
      ];
    };
  };
}
