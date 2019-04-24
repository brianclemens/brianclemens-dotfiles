# Set default file permissions
umask 077

# Use curses pinentry for GPG on SSH sessions
if [[ -n "$SSH_CONNECTION" ]] ;then
    export PINENTRY_USER_DATA="USE_CURSES=1"
fi

# Start GPG agent
if [ -x /usr/bin/gpg-agent ]; then
 eval "$(/usr/bin/gpg-agent --daemon)"
fi

# Start x11 on vt1
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -le 1 ]; then
    # Intentionally forked and not exec'd, in case I break my X11 session
    startx
fi
