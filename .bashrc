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

if [ -t 0 ]; then
    eval `dircolors`

    BASE16_SHELL="$HOME/git/base16-shell/base16-chalk.dark.sh"
    [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
fi

# http://samrowe.com/wordpress/ssh-agent-and-gnu-screen
function grabssh() {

    SSH_ENV=$HOME/.ssh/ssh_env_vars

    SSHV="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

    for x in ${SSHV} ; do
        (eval echo $x=\$$x) | sed  's/=/="/
        s/$/"/
        s/^/export /'

    done 1>"$SSH_ENV"
    chmod 0600 "$SSH_ENV"
}

function fixssh() {

    SSH_ENV=$HOME/.ssh/ssh_env_vars

    source "$SSH_ENV"
}

alias screen='grabssh ; screen'
alias ssh='fixssh ; ssh'

function git_ps1() {

    CWD=`pwd`

    if [ -d "$CWD/.git" ]; then
        BRANCH=`git rev-parse --abbrev-ref HEAD`
        echo "($BRANCH)"
        return 1
    fi

    return 0
}

function venv_ps1 {

    if [ ! -z "$VIRTUAL_ENV" ]; then
        VINV=`basename $VIRTUAL_ENV`
        echo "($VINV)"
    fi
}

if [[ "$PS1" ]]; then
    export PS1='\[\033[00m\]\[\033[01;37m\]$(git_ps1)(\j) \[\033[01;32m\]\u@\h\[\033[00m\]: \[\033[01;34m\]\w \$\[\033[00m\] '
fi
