set -x PATH $HOME/.cabal/bin $HOME/.ghcup/bin $HOME/dotfiles/scripts $HOME/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/sbin /sbin /bin /usr/lib/jvm/default-jdk/bin /usr/lib/jvm/default-jre/bin $HOME/.cargo/bin $HOME/.local/go $HOME/.local/bin $PATH
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
abbr gp 'git push'
abbr gc 'git commit'
abbr gsw 'git switch'
abbr grs 'git restore'
abbr gwt 'git worktree'
abbr gd 'git diff'

abbr dl 'yt-dlp -x'

abbr --add dotdot --regex '^\.\.+$' --function multicd

if status --is-login
    if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
        $HOME/scripts/themeswitchservice/run
        exec startx
    end
end
