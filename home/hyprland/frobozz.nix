{ config, pkgs, lib, ... }:
{

    wayland.windowManager.hyprland.settings = {
        decoration = {
            shadow_offset = "0 5";
            "col.shadow" = "rgba(00000099)";
        };

        extraConfig = {
            windowrulev2 = [
                "float, class:^()$"
            ];

        };

        bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
            "$mod ALT, mouse:272, resizewindow"
        ];


    };

}
