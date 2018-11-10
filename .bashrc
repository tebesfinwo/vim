export EDITOR=/usr/local/bin/nvim

# shopt -s globstar

# Happy dev
alias cp='cp -v'                                   # Preferred 'cp' implementation
alias mv='mv -v'                                   # Preferred 'mv' implementation
alias rm='rm -v'                                   # Preferred 'rm' implenentation
alias mkdir='mkdir -pv'                             # Preferred 'mkdir' implementation
alias ls="ls -FHG"
alias ll='ls -FGlAhp'                               # Preferred 'ls' implementation
alias lx='ls -lXB'                                  #  Sort by extension.
alias lk='ls -lSr'                                  #  Sort by size, biggest last.
alias lt='ls -ltr'                                  #  Sort by date, most recent last.
alias lc='ls -ltcr'                                 #  Sort by/show change time,most recent last.
alias lu='ls -ltur'                                 #  Sort by/show access time,most recent last.
alias less='less -FSRXc'                            # Preferred 'less' implementation

 cd() { builtin cd "$@"; ll; }                       # Always list directory contents upon 'cd'
alias ~="cd ~"                                      # ~:            Go Home
alias c='clear'                                     # c:            Clear terminal display

alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

alias qfind="find . -name "                         # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }              # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }          # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }          # ffe:      Find file whose name ends with a given string

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
complete -f -o default -X '!*.+(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extrac

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

function my_ip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

#
# Begin ssh-agent hack.
#
SSH_ENVIRONMENT=~/.ssh/environment

start_agent() {
    printf 'Starting ssh-agent...'
    ssh-agent | sed '/^echo /d' > "${SSH_ENVIRONMENT}"
    chmod 600 "${SSH_ENVIRONMENT}"
    echo 'done.'
    . "${SSH_ENVIRONMENT}" > /dev/null
    ssh-add
}

if [ -f "${SSH_ENVIRONMENT}" ]; then
    . "${SSH_ENVIRONMENT}" > /dev/null
    ps "${SSH_AGENT_PID}" > /dev/null || start_agent
else
    start_agent
fi
#
# End ssh-agent hack.
#

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}

complete -o default -F _pip_completion pip
# pip bash completion end

# Git command completion start
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# Git command completion ends

# Django command completion start
if [ -f ~/.django-completion.bash ]; then
  . ~/.django-completion.bash
fi
# Django command completion ends

# Handy Extract Program
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

alias did="nvim +'normal Go' +'r!date' ~/did.md"
