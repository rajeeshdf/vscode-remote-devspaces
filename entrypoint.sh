#!/bin/bash

set -e

# VS remote attach script fails if folder exists
# if [ ! -L "/root/.vscode-remote" ]; then
#   # Create Symlink for VSCode data
#   ln -s /data/.vscode-remote /root/.vscode-remote
# fi

# Start SSH server
/usr/sbin/sshd -D &

exec "$@"
