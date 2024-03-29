# Setting up fresh macOS envrionment

- Install [brew](https://brew.sh/);
- Install [iterm](https://iterm2.com/downloads.html):
    - Setup alt-backspace behaviour to delete word: [https://unix.stackexchange.com/a/224335](https://unix.stackexchange.com/a/224335);
    - In Preferences > Profiles > Keys. Create a Key combination "⌥ ← Delete" and have it Send Hex Codes: 0x1B 0x08;
- Install [macpass](https://macpassapp.org/);
- Connect [google drive](https://www.google.com/drive/download/) for keypass db;
- Install fish shell: `brew install fish`:
- Install better LT keyboard layout:
- Install [docker](https://www.docker.com/products/docker-desktop):
	- Do not forget to adjust available RAM and/or disk if you have a beefy machine;
- Set fish as default shell:
	- `sudo echo (which fish) >> /etc/shells`
	- `chsh -s (which fish)`
- Run `fish_config` to setup your prompt, theme, etc.;
- Set dock hide time to 0: `defaults write com.apple.dock autohide-time-modifier -int 0 && Killall Dock`
- Set keyrepeat to lower that system preferences allow ([https://apple.stackexchange.com/a/83923](https://apple.stackexchange.com/a/83923)):
	- `defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)`;
	- `defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)`;
	- logout is required for changes to take effect;
- Download [tomorrow](https://github.com/chriskempson/tomorrow-theme) for iterm
- Install markdown quick look [utility](https://github.com/toland/qlmarkdown/):
	- `brew cask install qlmarkdown`;
- Install [pyenv](https://github.com/pyenv/pyenv): `brew install pyenv`
- Install [z](https://github.com/rupa/z/):
    - `fisher install z`
- Instal coc extensions in nvim:
    - `:CocInstall coc-python coc-git coc-tsserver`

Faster keyboard repeats:
```
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```
