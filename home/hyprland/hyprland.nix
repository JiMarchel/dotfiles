{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;

    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      exec-one = [
        "${pkgs.hyprpanel}/bin/hyprpanel"
      ];
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/screens"
      ];
      monitor = "eDP-1,preferred,auto,1";

      "$mainMod" = "SUPER";
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        #col.active_border = rgba(cfbdfeff);
        #col.inactive_border = rgba(cbc2dcff);

        resize_on_border = true;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 0.9;
        inactive_opacity = 0.8;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          #color = rgba(1a1a1aee);
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "yes";

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };
      #master ={
      #new_status = master;
      #};

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
      };

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      bind = [
        # Exit
        "CTRL ALT, Q, exit"
        "$mainMod SHIFT, Q, exec, wlogout"

        # Top level bindings
        "$mainMod, Tab, cyclenext"
        "$mainMod, Return, exec, kitty"
        "$mainMod, W, exec, rofi -show drun"
        "$mainMod, E, exec, nautilus"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, B, exec, firefox"
        "$mainMod, F, exec, fullscreen"
        "$mainMod, G, togglegroup,"
        "$mainMod, P, pseudo,"
        "$mainMod, T, togglesplit,"
        "$mainMod, S, swapsplit,"

        # Second level bindings
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, Space, togglefloating,"

        # Move focus with modifier + arrow keys
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # Switch workspaces with modifier + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with modifier + Shift + [0-9]
        "$mainMod Shift, 1, movetoworkspace, 1"
        "$mainMod Shift, 2, movetoworkspace, 2"
        "$mainMod Shift, 3, movetoworkspace, 3"
        "$mainMod Shift, 4, movetoworkspace, 4"
        "$mainMod Shift, 5, movetoworkspace, 5"
        "$mainMod Shift, 6, movetoworkspace, 6"
        "$mainMod Shift, 7, movetoworkspace, 7"
        "$mainMod Shift, 8, movetoworkspace, 8"
        "$mainMod Shift, 9, movetoworkspace, 9"
        "$mainMod Shift, 0, movetoworkspace, 10"
      ];

      bindm = [
        "$mainMod, mouse:273, resizewindow"
        "$mainMod, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        "$mainMod, bracketright, exec, brightnessctl s 10%+"
        "$mainMod, bracketleft,  exec, brightnessctl s 10%-"
      ];

      # Audio playback
      bindl = [
        ", XF86AudioNext,  exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay,  exec, playerctl play-pause"
        ", XF86AudioPrev,  exec, playerctl previous"
      ];
    };
  };
}
