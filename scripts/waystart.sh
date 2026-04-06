#!/bin/bash
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export XDG_RUNTIME_DIR=/run/user/vj
export CHROMIUM_FLAGS="--enable-features=UseOzonePlatform --ozone-platform=wayland"
export WLR_BACKENDS=drm
export WLR_DRM_DEVICES=/dev/dri/card0
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=24
export QT_QPA_PLATFORM=wayland
export LIBSEAT_BACKEND=seatd
export XDG_CURRENT_DESKTOP=$1
export XDG_SESSION_TYPE=wayland
doas mkdir -p $XDG_RUNTIME_DIR
doas chown vj $XDG_RUNTIME_DIR
doas chmod a+rw /run/seatd.sock
dbus-run-session sh -c "pkill wire; pipewire & sleep 1; wireplumber & pipewire-pulse & exec $*"
