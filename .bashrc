# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vim="~/.local/bin/vim"
alias pm="python manage.py"
export PATH="$PATH:~/.local/bin"

export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export WORKON_HOME=$HOME/.virtualenvs

source /usr/bin/virtualenvwrapper.sh

case "$TERM" in
*-256color)
    alias ssh="TERM=${TERM%-256color} ssh"
    ;;
*)
    POTENTIAL_TERM=${TERM}-256color
    POTENTIAL_TERMINFO=${TERM:0:1}/$POTENTIAL_TERM

    # better to check $(toe -a | awk "{print $1}") maybe?
    BOX_TERMINFO_DIR=/usr/share/terminfo
    [[ -f $BOX_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM

    HOME_TERMINFO_DIR=$HOME/.terminfo
    [[ -f $HOME_TERMINFO_DIR/$POTENTIAL_TERMINFO ]] && \
        export TERM=$POTENTIAL_TERM
    ;;
esac

eval `dircolors`

BASE16_SHELL="$HOME/git/base16-shell/base16-chalk.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# http://samrowe.com/wordpress/ssh-agent-and-gnu-screen
function grabssh() {

    FIXSSH=$HOME/bin/fixssh

    SSHV="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

    for x in ${SSHV} ; do
        (eval echo $x=\$$x) | sed  's/=/="/
        s/$/"/
        s/^/export /'

    done 1>"$FIXSSH"

    if [[ -x "$FIXSSH" ]]
    then
        echo ""
    else
        chmod +x "$FIXSSH"
    fi
}

alias screen='grabssh ; screen'
alias ssh='fixssh ; ssh'
