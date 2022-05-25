#!/bin/bash

# configure git
git config --global user.name "username"
git config --global user.email "email address"

# install extensions
/app/code-server/bin/code-server --extensions-dir /config/extensions/ --install-extension rust-lang.rust