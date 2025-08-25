{ config, pkgs, lib, ... }:
{

  services.clipman.enable = true;

  home.packages = with pkgs; [

  ];

  xfconf.settings = {
    xfce4-session = {

    };

    xfwm4 = {
        "general/workspace_count" = 9;
        "general/workspace_names" = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" ];
        "general/borderless_maximize" = true;
        "general/click_to_focus" = true;
        "general/cycle_apps_only" = false;
        "general/cycle_draw_frame" = true;
        "general/cycle_hidden" = true;
        "general/cycle_minimized" = false;
        "general/cycle_minimum" = true;
        "general/cycle_preview" = true;
        "general/cycle_raise" = false;
        "general/cycle_tabwin_mode" = 0;
        "general/cycle_workspaces" = false;
        "general/double_click_action" = "maximize";  # Window Manager -> Advanced -> Double click action
        "general/double_click_distance" = 5;
        "general/double_click_time" = 250;
        "general/easy_click" = "Alt";
        "general/focus_delay" = 141;
        "general/focus_hint" = true;
        "general/focus_new" = true;
        "general/prevent_focus_stealing" = false;
        "general/raise_delay" = 250;
        "general/raise_on_click" = true;
        "general/raise_on_focus" = false;
        "general/raise_with_any_button" = false;
        "general/scroll_workspaces" = false;
        "general/snap_resist" = false;
        "general/snap_to_border" = true;
        "general/snap_to_windows" = true;
        "general/snap_width" = 10;
        "general/theme" = "Adwaita-dark-Xfce";
        "general/tile_on_move" = true;
        "general/title_alignment" = "center";
        "general/title_font" = 9;
        "general/title_horizontal_offset" = 0;
        "general/title_shadow_active" = false;
        "general/title_shadow_inactive" = false;
        "general/toggle_workspaces" = false;
        "general/wrap_cycle" = false;
        "general/wrap_layout" = false;
        "general/wrap_resistance" = 10;
        "general/wrap_windows" = false;
        "general/wrap_workspaces" = false;
        "general/zoom_desktop" = true;
        "general/zoom_pointer" = true;
    }; # - End xfwm4

    xfce4-desktop = {
        "desktop-icons/file-icons/show-filesystem" = true;
        "desktop-icons/file-icons/show-home" = true;
        "desktop-icons/file-icons/show-removable" = false;
        "desktop-icons/file-icons/show-trash" = true;
        "desktop-icons/icon-size" = 32;
        "desktop-menu/show" = true;
        "backdrop/single-workspace-mode" = true;
        "backdrop/single-workspace-number" = 1;
    }; # - End xfce4-desktop

    xfce4-panel = {
        "panels" = [ 1 ];
        "panels/dark-mode" = true;
        "panels/panel-1/nrows" = 1; # number of rows
        "panels/panel-1/mode" = 0; # Horizontal
        "panels/panel-1/output-name" = "Automatic";
        "panels/panel-1/span-monitors" = false;
        "panels/panel-1/background-style" = 0; # None (use system style)
        "panels/panel-1/icon-size" = 0; # Adjust size automatically
        "panels/panel-1/size" = 24; # Row size (pixels)
        "panels/panel-1/length" = 100.0;
        "panels/panel-1/length-adjust" = true;
        "panels/panel-1/position" = "p=6;x=0;y=0";
        "panels/panel-1/enable-struts" = true;
        "panels/panel-1/position-locked" = true;
        "panels/panel-1/plugin-ids" = [ 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 ];
        # Application menu = whiskermenu
        "plugins/plugin-1" = "whiskermenu";
        # Tasklist
        "plugins/plugin-2" = "tasklist";
        "plugins/plugin-2/grouping" = false;
        "plugins/plugin-2/show-handle" = true;
        "plugins/plugin-2/show-labels" = true;
        "plugins/plugin-2/flat-buttons" = false;
        "plugins/plugin-2/include-all-monitors" = true;
        "plugins/plugin-2/window-scrolling" = false;
        "plugins/plugin-2/sort-order" = 1; # Group title and timestamp
        "plugins/plugin-2/middle-click" = 0; # Nothing
        "plugins/plugin-2/show-wireframes" = false;
        "plugins/plugin-2/include-all-workspaces" = false;
        # Separator
        "plugins/plugin-3" = "separator";
        "plugins/plugin-3/style" = 0; # transparent
        "plugins/plugin-3/expand" = true;
        # Workspaces
        "plugins/plugin-4" = "pager";
        "plugins/plugin-4/rows" = 1;
        "plugins/plugin-4/miniature-view" = false; # show name instead of preview
        "plugins/plugin-4/numbering" = false;
        "plugins/plugin-4/workspace-scrolling" = false;
        # screenshooter (if order of this item is changed → also change order of symlink below: "files in ~/.config/")
        "plugins/plugin-5" = "screenshooter";
        # Separator
        "plugins/plugin-6" = "separator";
        "plugins/plugin-6/style" = 0; # transparent
        # Sys tray
        "plugins/plugin-7" = "systray";
        # CPU graph (if order of this item is changed → also change order of symlink below: "files in ~/.config/")
        "plugins/plugin-8" = "cpugraph";
        # Pulse audio
        "plugins/plugin-9" = "pulseaudio";
        "plugins/plugin-9/enable-keyboard-shortcuts" = true;
        # Network monitor (if order of this item is changed → also change order of symlink below: "files in ~/.config/")
        "plugins/plugin-10" = "netload";
        # clipboard
        "plugins/plugin-11" = "xfce4-clipman-plugin";
        "plugins/clipman/settings/save-on-quit" = true;
        "plugins/clipman/settings/max-texts-in-history" = 1000;
        "plugins/clipman/settings/add-primary-clipboard" = false;
        # Notification
        "plugins/plugin-12" = "notification-plugin";
        # Separator
        "plugins/plugin-13" = "separator";
        "plugins/plugin-13/style" = 0; # transparent
        # Power manager
        "plugins/plugin-14" = "power-manager-plugin";
        # Clock
        "plugins/plugin-15" = "clock";
        "plugins/plugin-15/digital-layout" = 3; # Time Only
        "plugins/plugin-15/digital-time-font" = "Sans 11";
        "plugins/plugin-15/digital-time-format" = "%a %d %R";
        "plugins/plugin-15/tooltip-format" = "%A %d %B %Y"; # Saturday 29 July 2023
        "plugins/plugin-15/mode" = 2; # digital
        "plugins/plugin-15/show-frame" = false;
    }; # - End xfce4-panel

    xfce4-screensaver = {
        "/saver/enabled" = false;
    };

    xfce4-appfinder = {
        
    }; # - End xfce4-appfinder

  };

}
