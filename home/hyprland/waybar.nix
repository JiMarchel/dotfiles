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
          "hyprland/workspaces"
        ];
        modules-center = [
          "custom/playerlabel"
        ];
        modules-right = [
          "battery"
          "pulseaudio"
          # "network"
          "tray"
          "clock"
          "custom/power-menu"
        ];

        "custom/playerlabel" = {
          format = "<span>󰎈 {} 󰎈</span>";
          return-type = "json";
          max-length = 35;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "";
        };

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
          format = " {:%I:%M %p}";
          tooltip = "true";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = " {:%d/%m}";
        };

        "custom/startmenu" = {
          tooltip = false;
          format = "";
          on-click = "rofi -show";
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
            color: #${config.lib.stylix.colors.base0B};
            border: none;
        }

        #custom-playerlabel {
                  background-color: #${config.lib.stylix.colors.base00};
                  color: #${config.lib.stylix.colors.base0B};
                  padding: 0 20px;
                  border-radius: 24px 10px 24px 10px;
        }

        #custom-startmenu, #workspaces{
              margin-right: 15px;
        }

        #network,
        #custom-power-menu,
        #pulseaudio,
        #clock,
        #tray,
        #battery {
              color: #${config.lib.stylix.colors.base0B};
              background-color: #${config.lib.stylix.colors.base00};
              padding: 0 15px 0 15px;
              margin:0 0 0 15px;
        }
    '';
  };
}
