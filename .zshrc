CONFIG_DIR="$HOME/.config/zsh.d"

# Source files in configuration directory
for file in "$CONFIG_DIR"/*; do
    source "$file"
done
