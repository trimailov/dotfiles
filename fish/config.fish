# use aliases
. ~/.config/fish/functions/aliases.fish

# set locale to en_US.UTF-8
set -gx  LC_ALL en_US.UTF-8
set -gx  LC_CTYPE en_US.UTF-8

# set default editor
set -x EDITOR nvim

# homebrew sbin
set -x PATH $PATH /usr/local/sbin

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
