function del_cursong
    rm -i (echo '{ "command": ["get_property_string", "path"] }' | \
      socat - "$HOME/.config/mpv/socket" | jq .data -r)
end
