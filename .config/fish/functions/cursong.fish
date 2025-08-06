function cursong
    echo '{ "command": ["get_property_string", "filename"] }' | \
        socat - $HOME/.config/mpv/socket | jq .data -r
end
