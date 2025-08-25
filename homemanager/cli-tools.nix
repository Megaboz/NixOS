{ config, pkgs, lib, hostName, eza, ... }:
{
    home.packages = with pkgs; [
    
        # Shell
        zsh
        ohmyzsh
        
        # System administration
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
        dd
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
        
        # NixOS
        nix-index
        
        # file management
        wget
        moreutils
        xdg-utils
        dos2unix
        mmv
        less
        mktemp
        pwgen
        
        # backups
        rsnapshot
        
        # ssh
        openssh
        openssl
        
        # text UI
        dialog
        ncurses
        
        # multiplexing
        screen
        tmux
        tmuxp
        
        # git
        tig
        git
        git-lfs
        
        # compression/decompression tools
        zip
        unzip
        unp
        bzip2
        gzip
        rar
        gnutar
        p7zip
        
        # diff
        wdiff
        diffpdf
        diffutils
        delta
        
        # search
        ack
        findutils
        
        # Javas
        
        # Code
        gnumake
        
        # Other
        yt-dlp
        bc
        jq
        pdfminer
        qpdf
        pdfannots
        stc-cli
    ];
    
    programs.tmux = {
        enable = true;
        shortcut = "a";
        baseIndex = 1;
        newSession = true;
        escapeTime = 0;
        
        plugins = with pkgs; [
            tmuxPlugins.better-mouse-mode
        ];
        
        extraConfig = ''
            set -g default-terminal "xterm-256color"
            set -ga terminal-overrides ",*256col*:Tc"
            set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
            set-environment -g COLORTERM "truecolor"
            
            set-window-option -g window-status-style fg=white,bg=black
            set -g status-fg green
            set -g status-bg black
            set -g status-left "#[default]@#h#[fg=red]:#S#[fg=white] |"
            set -g status-right-length 34
            set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=cyan,bold]%Y-%m-%d %H:%M#[default]'
            
            set -g base-index 1
            
            unbind C-b
            set -g prefix C-a
            bind C-a send-prefix
            bind-key a  send-prefix
            
            setw -g monitor-activity on
            
            ## m -> notify me on 10s of silence
            bind-key m set-window-option monitor-activity off \; set-window-option monitor-silence 10
            ## M -> notify me on activity again (as usual)
            bind-key M set-window-option monitor-activity on \; set-window-option monitor-silence 0

            bind-key P new-window -a -n "procmail" -t 1 "/usr/bin/vim /home/karl/.procmailrc"
            bind-key C-a last-window
        '';
        
    };
    
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
          enable = true;
          theme = "fishy";
          plugins = [
            "git" "history-substring-search" "colored-man-pages" "colorize" "fzf" "python" "systemd" "thefuck" "tmux"
          ];  
        }; # - End oh my zsh
        
        plugins = [
        {
            # will source zsh-autosuggestions.plugin.zsh
            name = "zsh-autosuggestions";
            src = pkgs.fetchFromGitHub {
                owner = "zsh-users";
                repo = "zsh-autosuggestions";
                rev = "v0.7.1";
                sha256 = "02p5wq93i12w41cw6b00hcgmkc8k80aqzcy51qfzi0armxig555y";
            };
          };
        ];
        
        history = {
            share = true;
            size = 9999999;
            save = 9999999;
            ignoreDups = true;
            extended = true;
            ignoreSpace = false;
        };
        
        dirHashes = {
            
        };
        
        shellAliases = {
          "dl" = "ls -lhtr --color=always ~/Downloads | tail -n 10"; # Show the 10 newest Downloads
          "open" = "xdg-open";
          "ll" = "ls -l";  
        };
    }; # - End ZSH
    
    programs.git = {
        enable = true;
        userName = "Chris Angelini";
        userEmail = "megaboz@gmail.com";
        aliases = {
          ct = "commit";
          co = "checkout";
          s = "status";  
        };
    };
    
    # Home files
    
    # home.file.".gnupg/gpg-agent.conf" = {
    #   text = ''
    #     default-cache-ttl 600
    #     max-cache-ttl 6000
    #     pinentry-program ${pkgs.pinentry.gtk2}/bin/pinentry
    #   '';
    # };
    
}
