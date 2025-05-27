{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          # "custom/startmenu"
          # "custom/arrow6"
          # "pulseaudio"
          # "cpu"
          # "memory"
          # "idle_inhibitor"
          # "custom/arrow7"
          # "hyprland/window"
          "hyprland/workspaces"
        ];
        modules-center = [];
        modules-right = [
          # "custom/arrow4"
          # "custom/hyprbindings"
          # "custom/arrow3"
          # "custom/notification"
          # "custom/arrow3"
          # "custom/exit"
          # "battery"
          # "custom/arrow2"
          # "tray"
          # "custom/arrow1"
          # "clock"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            urgent = "󰀨";
            active = "󰮯";
            default = "";
          };
          persistent-workspaces = {
            "*" = 3;
          };
        };
      }
    ];
  };
}
