{ config, pkgs, lib, ... }:
{
    home.packages = with pkgs; [

    ];

    programs.tmux = {
        enable = true;
        shortcut = "a";
        baseIndex = 1;
        newSession = true;
        # Stop tmux+escape craziness.
        escapeTime = 0;
        secureSocket = true;

        plugins = with pkgs; [
            tmuxPlugins.better-mouse-mode
        ];

      extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      ## ======== personal configuration:

      # Highlighting the active window in status bar
      set-window-option -g window-status-style fg=white,bg=black
      set -g status-fg green
      set -g status-bg black
      set -g status-left "#[default]@#h#[fg=red]:#S#[fg=white] |"
      set -g status-right-length 34
      set -g status-right '#[fg=yellow]#(cut -d " " -f 1-3 /proc/loadavg)#[default] #[fg=cyan,bold]%Y-%m-%d %H:%M#[default]'

      ## start with windows number 1 (not 0)
      set -g base-index 1

      ## switch default prefix to C-a
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      ## "C-a a" sends C-a
      bind-key a  send-prefix

      # Notifying if other windows has activities
      setw -g monitor-activity on

      ## m -> notify me on 10s of silence
      bind-key m set-window-option monitor-activity off \; set-window-option monitor-silence 10
      ## M -> notify me on activity again (as usual)
      bind-key M set-window-option monitor-activity on \; set-window-option monitor-silence 0

      bind-key C-a last-window
      set -g mode-keys emacs
      set -g status-keys emacs


      '';

    }; # - end of tmux

}
