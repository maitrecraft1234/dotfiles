#!/usr/bin/env fish

clear
echo "Select your session:"
echo "  1) i3 (X11)"
echo "  2) sway (Wayland)"
echo "  3) niri (Wayland) default"
echo "  4) Exit"
echo
read -P "Choice: " choice

switch $choice
    case '1'
        startx
        exit
    case '2'
        /home/vj/scripts/waystart.sh sway
        exit
    case '' '3'
        /home/vj/scripts/waystart.sh niri
        exit
    case '*'
        exit
end
