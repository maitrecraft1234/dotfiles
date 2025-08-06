#!/bin/bash

if [[ $1 == "dark" ]]; then
    cp ~/.config/alacritty/ayu_dark.toml ~/.config/alacritty/theme.toml
    echo dark > /tmp/.theme
elif [[ $1 == "light" ]]; then
    cp ~/.config/alacritty/catppuccin-latte.toml ~/.config/alacritty/theme.toml
    echo light > /tmp/.theme
else
    echo idk
fi
