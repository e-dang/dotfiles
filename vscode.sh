#!/bin/bash

dotfiledir=$1

# install extensions
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension file-icons.file-icons
code --install-extension formulahendry.code-runner
code --install-extension njpwerner.autodocstring
code --install-extension fabiospampinato.vscode-highlight
code --install-extension redhat.vscode-yaml

# copy user settings
cp ${dotfiledir}/settings/vscode_keybindings.json /Users/ericdang/Library/Application\ Support/Code/User/keybindings.json
cp ${dotfiledir}/settings/vscode_settings.json /Users/ericdang/Library/Application\ Support/Code/User/settings.json