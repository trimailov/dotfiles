# ag aliases

alias ag="ag --path-to-ignore ~/.ignore"

# GIT aliases

alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gfap="git fetch --all --prune"
alias glg="git log"
alias glgg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gp="git push"
alias gpf="git push -f"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias gst="git status"
alias gsta="git stash"
alias gstp="git stash pop"
alias gup="git pull"
alias gupr="git pull --rebase"

# VIM aliases

# it's just annoying to accidenatly get into vi
alias nvi="nvim"
alias vi="vim"

# TIG aliases
alias tiga="tig --all"

# Misc.
alias journal="mkdir -p ~/journal/(date +%Y); vim + ~/journal/(date +%Y)/(date +%Y-%m-%d).md"
