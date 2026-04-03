set -x PATH $HOME/.cabal/bin $HOME/.ghcup/bin $HOME/dotfiles/scripts $HOME/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /sbin /bin /usr/lib/jvm/default-jdk/bin /usr/lib/jvm/default-jre/bin $HOME/.cargo/bin $HOME/.local/go $HOME/.local/bin $HOME/go/bin $PATH
set -gx EDITOR nvim
set -gx GPG_TTY (tty)
set -gx ASAN_OPTIONS "abort_on_error=1:halt_on_error=1"
set -gx UBSAN_OPTIONS "abort_on_error=1:halt_on_error=1"
set fish_greeting

zoxide init fish | source

# Aliases
alias ls='eza --icons auto'
alias virt-setup='xhost si:localuser:root'

abbr gss 'git status --short'
abbr gl 'git pull'
abbr glr 'git pull --rebase'
abbr glm 'git pull --rebase=false'
abbr gp 'git push'
abbr gc 'git commit'
abbr gsw 'git switch'
abbr grs 'git restore'
abbr gwt 'git worktree'
abbr gd 'git diff'

abbr dl 'yt-dlp --cookies-from-browser chromium -x'

abbr --add dotdot --regex '^\.\.+$' --function multicd

if status --is-login; and not set -q WAYLAND_DISPLAY; and not set -q FISH_LOGIN_INIT_DONE
    set -gx FISH_LOGIN_INIT_DONE 1
    $HOME/scripts/themeswitchservice/run
    $HOME/scripts/log.sh
end

# opencode
fish_add_path /home/vj/.opencode/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
