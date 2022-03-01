export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
if [[ $(command -v brew) != "" ]]; then
    export PATH=/opt/homebrew/bin:$PATH
fi
