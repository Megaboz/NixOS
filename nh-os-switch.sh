#!/usr/bin/env sh
nice ionice time nh os switch --ask "/home/frobozz/nixos"
notify-send "nh os switch" "finished"
