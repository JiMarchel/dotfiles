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
          "cpu"
          "memory"
          "battery"
          "pulseaudio"
          "network"
          "tray"
          "clock"
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

        clock = {
          format = " {:%a, %d %b, %I:%M %p}";
          tooltip = "true";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = " {:%d/%m}";
        };

        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = " {capacity}% ";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" ""];
        };

        memory = {
          format = "󰍛 {}%";
          format-alt = "󰍛 {used}/{total} GiB";
          interval = 5;
        };
        cpu = {
          format = "󰻠 {usage}%";
          format-alt = "󰻠 {avg_frequency} GHz";
          interval = 5;
        };
        network = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "󰈀 100% ";
          tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "󰖪 0% ";
        };
        tray = {
          icon-size = 20;
          spacing = 8;
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
          };
          # on-scroll-up= "bash ~/.scripts/volume up";
          # on-scroll-down= "bash ~/.scripts/volume down";
          scroll-step = 5;
          on-click = "pavucontrol";
        };
      }
    ];
  };
}
