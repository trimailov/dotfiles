# use aliases
. ~/.config/fish/functions/aliases.fish

# set locale to en_US.UTF-8
set -gx  LC_ALL en_US.UTF-8
set -gx  LC_CTYPE en_US.UTF-8

# set default editor
set -x EDITOR nvim

# remove welcome message
set fish_greeting
