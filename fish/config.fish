# use aliases
. ~/.config/fish/functions/aliases.fish

# set locale to en_US.UTF-8
set -gx  LC_ALL en_US.UTF-8
set -gx  LC_CTYPE en_US.UTF-8

# set default editor
set -x EDITOR vim

# homebrew sbin
set -x PATH $PATH /usr/local/sbin

# basictex bin
set -x PATH $PATH /usr/local/texlive/2015basic/bin/universal-darwin

# pyenv's shims path
set -x PATH ~/.pyenv/shims $PATH
set -x PYTHON_CONFIGURE_OPTS "--enable-framework"

# Rust's Cargo bin
set -x PATH $PATH ~/.cargo/bin

# GOPATH
set -x GOPATH ~/Documents/programming/Go
set -x PATH $PATH $GOPATH/bin

# # ANDROID
# set -x ANDROID_HOME ~/Library/Android/sdk
# set -x PATH $PATH $ANDROID_HOME/tools
# set -x PATH $PATH $ANDROID_HOME/platform-tools

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
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
