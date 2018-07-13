#!/bin/bash

echo "---------- INSTALLING LARAVEL-ECHO-SERVER ---------------"

command -v npm >/dev/null 2>&1 || export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

npm install -g laravel-echo-server >/dev/null
