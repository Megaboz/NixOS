{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [

        #Browsers
        firefox  

        # Cli - sysadmin
        htop
        btop
        dnsutils
        mtr
        mc
        ncdu
        nmap
        whois
        pmutils
        lsof
        usbutils
        hwinfo
        iotop
        fuse
        gpart
        gparted
        hddtemp
        hdparm
        hwdata
        acpi
        rsync
        traceroute
        arp-scan
        util-linux
        file
        pciutils
        ncftp
        socat
        cryptsetup
        tcpdump

        # Cli - NixOS
        nix-index

        # Cli - file management
        wget
        moreutils
        xdg-utils
        dos2unix
        mmv
        less
        mktemp
        pwgen

        # Cli - Backups
        rsnapshot

        # Cli - Text UI
        dialog
        ncurses

        # Cli - Multiplexing
        screen
        tmux
        tmuxp

        # Cli - Git
        tig
        git
        git-lfs

        # Cli - Compression/Decompression
        zip
        unzip
        unp
        bzip2
        gzip
        rar
        gnutar
        p7zip

        # Cli - Diff
        wdiff
        diffpdf
        diffutils
        delta

        # Cli - search
        ack
        findutils

        # Cli - Other
        yt-dlp
        bc
        jq
        pdfminer
        qpdf
        pdfannots
        stc-cli
     
    ];
}
