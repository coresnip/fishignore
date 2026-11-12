#!/usr/bin/env fish

set -l repo_url "https://raw.githubusercontent.com/coresnip/fishignore/main"
set -l fish_dir "$HOME/.config/fish"

echo "installing fishignore..."

mkdir -p "$fish_dir/functions"

curl -fsSL "$repo_url/fishignore.fish" \
    -o "$fish_dir/functions/fishignore.fish"

or begin
    echo "failed to download fishignore function :("
    return 1
end

echo ""
echo "fishignore installed successfully :)"
echo "restart your shell or run: source $fish_dir/functions/fishignore.fish"