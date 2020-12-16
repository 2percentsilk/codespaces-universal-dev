#!/bin/bash
SCRIPT_DIR="$(cd "dirname $0" && pwd)"

# Add benv init into /etc/bash.bashrc and /etc/zsh/zshrc and emove "current" symlinks from path they're 
# not needed in this scenario. They're there primarily for non-interactive, non-login shells
cat <<'EOF' | tee -a /etc/bash.bashrc >> /etc/zsh/zshrc
. benv $(cat /opt/oryx/default-platform-versions | tr "\n" " ") 2>/dev/null
export PATH="$(echo "${PATH}" | sed -r 's/\/opt\/[^\/]+\/current\/bin:?//g' | sed -r 's/\/opt\/dotnet\/current:?//g')"
EOF

# Make sure script is executable and in the path
chmod +x ${SCRIPT_DIR}/oryx-env
ln -s ${SCRIPT_DIR}/oryx-env /usr/local/bin/oryx-env

