#!/bin/bash

# configure git
echo '- setting up global user.name and user.email for git'
git config --global user.name "crblanaru"
git config --global user.email "crblanaru@gmail.com"

# install extensions
echo '- installing extensions'
/app/code-server/bin/code-server --extensions-dir /config/extensions/ --install-extension rust-lang.rust
/app/code-server/bin/code-server --extensions-dir /config/extensions/ --install-extension vadimcn.vscode-lldb

# set my branch
git checkout cristian
