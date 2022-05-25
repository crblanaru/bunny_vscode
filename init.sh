#!/bin/bash

# configure git
git config --global user.name "crblanaru"
git config --global user.email "crblanaru@gmail.com"

# install extensions
/app/code-server/bin/code-server --extensions-dir /config/extensions/ --install-extension rust-lang.rust
