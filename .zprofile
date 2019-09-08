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

if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export GPG_TTY=$(tty)

gpg-connect-agent updatestartuptty /bye >/dev/null
