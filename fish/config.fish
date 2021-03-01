# use aliases
. ~/.config/fish/functions/aliases.fish

# set locale to en_US.UTF-8
set -gx  LC_ALL en_US.UTF-8
set -gx  LC_CTYPE en_US.UTF-8

# set default editor
set -x EDITOR nvim

# gnu coreutils without `g` prefix
set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

# homebrew sbin
set -x PATH $PATH /usr/local/sbin

# pyenv's shims path
set -x PATH ~/.pyenv/shims $PATH
set -x PATH ~/.pyenv/bin $PATH
set -x PYTHON_CONFIGURE_OPTS "--enable-framework"
set -Ux PYENV_ROOT ~/.pyenv
# https://fishshell.com/docs/current/tutorial.html#path
# Note: you should NOT add this line to config.fish. If you do, the variable will get longer each time you run fish!
# set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# d pyenv automaticaly
# status --is-interactive; and source (pyenv init -|psub)
if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

# Rust's Cargo bin
set -x PATH $PATH ~/.cargo/bin

# Go's bin
set -x PATH $PATH ~/go/bin

# remove welcome message
set fish_greeting

# function to remove wifi preferences on OS X
function rm_wifi_preferences --description 'Remove OS X wifi preferences on wifi hiccups'
    rm /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist
    rm /Library/Preferences/SystemConfiguration/com.apple.network.identification.plist
    rm /Library/Preferences/SystemConfiguration/com.apple.wifi.message-tracer.plist
    rm /Library/Preferences/SystemConfiguration/NetworkInterfaces.plist
    rm /Library/Preferences/SystemConfiguration/preferences.plist
end

# NIM lang
set -x PATH $PATH /Users/justas/.nimble/bin

# set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -x PATH "/usr/local/opt/openssl/bin" $PATH
set -x PATH "/usr/local/opt/sqlite/bin" $PATH

# fzf
set -x PATH ~/.fzf/bin $PATH

# python
set -x PATH ~/.local/bin $PATH

# MySQL
alias mysql /usr/local/mysql/bin/mysql
alias mysqladmin /usr/local/mysql/bin/mysqladmin
# set -g fish_user_paths "/usr/local/opt/tcl-tk/bin" $fish_user_paths
set -x PATH "/usr/local/opt/tcl-tk/bin" $PATH
. /Users/justas/z.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

