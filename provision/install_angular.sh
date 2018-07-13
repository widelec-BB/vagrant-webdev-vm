#!/bin/sh

echo "---------- INSTALLING ANGULAR ---------------"

command -v npm >/dev/null 2>&1 || export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

npm install -g @angular/cli &>/dev/null
