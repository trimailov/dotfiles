# set locale to en_US.UTF-8
set -gx  LC_ALL en_US.UTF-8
set -gx  LC_CTYPE en_US.UTF-8

# set default editor
set -x EDITOR nvim

# gnu coreutils without `g` prefix
fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin
fish_add_path /usr/local/opt/coreutils/libexec/gnubin

# homebrew sbin
fish_add_path /use/local/sbin

# pyenv's shims path
fish_add_path ~/.pyenv/bin
set -x PYTHON_CONFIGURE_OPTS "--enable-framework"
set -Ux PYENV_ROOT ~/.pyenv

# d pyenv automaticaly
# status --is-interactive; and source (pyenv init -|psub)
if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

# Rust's Cargo bin
fish_add_path ~/.cargo/bin

# Go's bin
fish_add_path ~/go/bin

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
fish_add_path ~/.nimble/bin

fish_add_path "/usr/local/opt/openssl@1.1/bin"
fish_add_path "/usr/local/opt/sqlite/bin"

# fzf
fish_add_path ~/.fzf/bin

# python
fish_add_path ~/.local/bin

# MySQL
alias mysql /usr/local/mysql/bin/mysql
alias mysqladmin /usr/local/mysql/bin/mysqladmin
fish_add_path "/usr/local/opt/tcl-tk/bin"

# . /Users/justas/z.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
