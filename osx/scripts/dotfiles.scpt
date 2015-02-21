JsOsaDAS1.001.00bplist00�Vscript_�app = Application.currentApplication()
app.includeStandardAdditions = true

dialog = app.displayDialog('Show or hide dotfiles?', {
	buttons: ['Show', 'Hide', 'Cancel'],
	defaultButton: 'Cancel',
	cancelButton: 'Cancel',
	withTitle: 'Text',
})

if (dialog["buttonReturned"] == "Show") {
	app.doShellScript('defaults write com.apple.finder AppleShowAllFiles YES')
	app.doShellScript('killall Finder /System/Library/CoreServices/Finder.app')
}
else if (dialog["buttonReturned"] == "Hide") {
	app.doShellScript('defaults write com.apple.finder AppleShowAllFiles NO')
	app.doShellScript('killall Finder /System/Library/CoreServices/Finder.app')
}                              � jscr  ��ޭ