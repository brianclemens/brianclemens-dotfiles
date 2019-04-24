# General options
export BROWSER="firefox"
export DEFAULT_USER="brian"
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export NO_AT_BRIDGE=1
export TERMINAL="urxvtc"
export VISUAL="nvim"
export WWW_HOME="https://duckduckgo.com"

# Ansible
export ANSIBLE_HOME="$HOME/Documents/ansible"
export ANSIBLE_CONFIG="$ANSIBLE_HOME/ansible.cfg"

# Firefox
export MOZ_USE_XINPUT2=1    # Pixel-perfect scrolling

# FZF
export FZF_DEFAULT_OPTS="--layout=reverse --no-height --preview '$HOME/.config/ranger/scope.sh {} 0 0 0 0'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:wrap"

# Gimp
export GIMP2_DIRECTORY="$HOME/.config/gimp"

# GTK
export GDK_DPI_SCALE=1.5

# Java
export _JAVA_AWT_WM_NONREPARENTING=1    # Fix for tiling window managers
export _JAVA_OPTIONS="-Dsun.java2d.opengl=true"

# Less
export LESS="-giMnRS#3~"
export LESSHISTFILE="/dev/null"
export LESSOPEN="| pygmentize -g -f terminal256 -P style=abap %s"
export LESS_TERMCAP_mb=$'\e[0;31m'      # Start blink escape sequence
export LESS_TERMCAP_md=$'\e[0;34m'      # Start bold escape sequence
export LESS_TERMCAP_me=$'\e[0m'         # End bold, blink, and underline
export LESS_TERMCAP_se=$'\e[0m'         # Stop standout escape sequence
export LESS_TERMCAP_so=$'\e[0;34;36m'   # Start standout escape sequence
export LESS_TERMCAP_ue=$'\e[0m'         # Stop underline escape sequence
export LESS_TERMCAP_us=$'\e[0;35m'      # Start underline escape sequence
export MANROFFOPT="-c"
export SYSTEMD_LESS="$LESS"

# Make
export MAKEFLAGS="$MAKEFLAGS -j$(($(nproc)))"   # Use all vcpus

# Notmuch
export NOTMUCH_CONFIG="$HOME/.config/notmuch/notmuch-config"

# Pass
export PASSWORD_STORE_DIR="$HOME/.config/pass"

# Path
PATH="/snap/bin:$PATH"
PATH="$HOME/.config/node_modules/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.luarocks/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$HOME/go/bin:$PATH"

# QT
export QT_QPA_PLATFORMTHEME="gtk2"
export QT_STYLE_OVERRIDE="GTK+"

# Sudo
export SUDO_EDITOR="nvim"

# Taskwarrior
export TASKDATA="$HOME/.config/task/data"
export TASKRC="$HOME/.config/task/taskrc"

# Urxvt
export URXVT_PERL_LIB="$HOME/.config/urxvt/ext"

# Weechat
export WEECHAT_HOME="$HOME/.config/weechat"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.config"

# zplugin
export ZPLG_HOME="$HOME/.config/zplugin"

# zsh
export COLUMNS                  # Remember columns for subprocesses
export skip_global_compinit=1   # Compinit handled in zshrc
