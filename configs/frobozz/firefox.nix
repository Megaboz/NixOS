{ self, config, pkgs, lib, ... }:

let 
    inherit (lib) mkForce;
in {
    programs.firefox = {
        package = pkgs.firefox;
        policies = {
            AppAutoUpdate = false;
            BackgroundAppUpdate = false;
            DisableBuiltinPDFViewer = true;
            DisableFirefoxStudies = true;
            DisableFirefoxAccounts = false;
            DisableFirefoxScreenshots = true;
            DisableForgetButton = true;
            DisableMasterPasswordCreation = true;
            DisableProfileImport = true;
            DisableProfileRefresh = true;
            DisableSetDesktopBackground = true;
            DisplayMenuBar = "default-off";
            DisablePocket = true;
            DisableTelemetry = true;
            DisableFormHistory = false;
            DisablePasswordReveal = true;
            DontCheckDefaultBrowser = true;
            HardwareAcceleration = false;
            OfferToSaveLogins = false;
            EnableTrackingProtection = {
                Value = true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
                EmailTracking = true;
                Exceptions = ["https://example.com"];
            };
            ExtensionSettings = {
                installation_mode = "blocked";
                blocked_install_message = "Please only install extensions via nix config";
            };
        };

    };


}
