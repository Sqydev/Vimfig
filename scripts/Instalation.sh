cd "$HOME/.config/" || exit 1

rm -rf nvim

REPO_SSH="git@github.com:Sqydev/Vimfig.git"
REPO_HTTPS="https://github.com/Sqydev/Vimfig.git"

echo "Checking SSH access to GitHub..."

if ssh -T git@github.com -o BatchMode=yes -o ConnectTimeout=5 2>&1 | grep -q "successfully authenticated"; then
    echo "SSH detected. Cloning via SSH..."
    git clone "$REPO_SSH" || exit 1
else
    echo "SSH not available. Cloning via HTTPS..."
    git clone "$REPO_HTTPS" || exit 1
fi

mv Vimfig nvim
