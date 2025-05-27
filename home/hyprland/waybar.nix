{
  pkgs,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        margin-top = 10;
        modules-left = [
          "custom/startmenu"
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
          "tray"
          "battery"
          "pulseaudio"
          "network"
          "clock"
          "custom/power-menu"
        ];
        "custom/power-menu" = {
          format = " ⏻ ";
          on-click = "wlogout";
        };

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

        "custom/startmenu" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && rofi-launcher";
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

    style = ''
        *{
            font-family: JetBrainsMono Nerd Font Mono;
            font-size: 16px;
            border-radius: 10px;
            font-weight: bold;
        }

        window#waybar {
            background-color: transparent;
            color: #${config.lib.stylix.colors.base00}; /*pink*/
        }

        .modules-left {
              margin-left: 10px;
        }

        .modules-right {
              margin-right: 10px
        }


      #custom-startmenu {
              color: #${config.lib.stylix.colors.base0B};
              padding: 0px 14px;
              font-size: 20px;
              background: #${config.lib.stylix.colors.base00};
            }

        #workspaces {
              background-color: #${config.lib.stylix.colors.base00};
              padding: 0px 5.6px 0px 0px;
        }

        #workspaces button.active {
            color: #${config.lib.stylix.colors.base0E};

        }

        #network,
        #custom-power-menu,
        #pulseaudio,
        #clock,
        #battery {
              color: #${config.lib.stylix.colors.base08};
              background-color: #${config.lib.stylix.colors.base00};
              padding: 0 15px 0 15px;
              margin:0 0 0 15px;
        }
    '';
  };
}
