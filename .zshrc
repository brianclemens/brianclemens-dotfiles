# Source files in configuration directory
for file in "$HOME/.config/zsh.d"/*; do
    source "$file"
done
