set -gx PATH $HOME/dotfiles/scripts $HOME/bin /usr/local/bin $PATH /home/vj/.cargo/bin $HOME/.local/go /home/vj/.local/bin
set -gx EDITOR nvim
set -gx GPG_TTY (tty)
set -gx ASAN_OPTIONS "abort_on_error=1:halt_on_error=1"
set -gx UBSAN_OPTIONS "abort_on_error=1:halt_on_error=1"
# Pipx
set -gx PATH $PATH /home/vj/.local/bin

zoxide init fish | source

# Aliases
alias ls="eza --icons auto"
alias emacs="emacs -nw"
alias virt-setup="xhost si:localuser:root"

if test -f /home/vj/.ghcup/env
    source /home/vj/.ghcup/env
end

if status is-interactive
    #idk    
end
