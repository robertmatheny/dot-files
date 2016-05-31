#!/bin/bash
#Robert Matheny
#Sample .bashrc
#4/27/2015
#Changed def path from sfw to /opt due to security concern
Os=$(uname)
if [ $(uname) == "Darwin" ] ; then
   export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
   export CLICOLOR=1
   alias dbvis="open -a DbVisualizer.app"
   alias sqldeveloper='open -a SQLDeveloper.app'
   alias listen="netstat -atp tcp | grep LIST "
   alias grep='grep --color=always'
   export GREP_COLOR='1;35;40'
fi

#Shell Basics
umask 0022
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for example
if [ -t 0 ] ; then #In a TTY Session
   #stty erase ^H
   stty erase  
   stty istrip
fi

hgrep(){
history 10000 | grep ${*:1}
}

rhost(){
if [[ $1 =~ ^[0-9]+$ ]]; then 
   sed -i "$1"d ${HOME}/.ssh/known_hosts; 
else 
   echo "rhost [n]"
fi 
}



# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#Hist Control
export HISTSIZE=10000
export HISTFILESIZE=200000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:ls *" 
export HISTTIMEFORMAT="%h%d_%H:%M:%S++"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export NSS_SSL_CBC_RANDOM_IV=0

# User specific environment and startup programs 
export PATH=${PATH}:~/work/opt/bin:/sbin
export CRFPERLBIN=/usr/bin
export CRF_JAVA_HOME=/jdk
export LD_LIBRARY_PATH=/usr/lib64:/usr/lib:/usr/local/lib:/usr/local/lib/purple-2:${LD_LIBRARY_PATH}:${ORACLE_HOME}/lib
#Shell Basics
export EDITOR=vi 
#Prompt
#PS1="\h<\u>\!\$ "
HOSTNAME=`hostname`
USER=$LOGNAME
PS1="\n\[\033[1;37m\]\w\n\[\033[0m\]\[\033[31m\]<\u@\h>\[\033[0m\]\[\033[32m\]\[\033[0m\] $"
#Aliases
alias dusk='du -sk * | sort -n';alias findbiglogs='find $ORACLE_HOME -type f -size +100M -ls'
alias ll='ls -l'; alias latr='ls -latr '
alias h='history 1000'
alias rm='rm -i'; alias mv='mv -i'
alias base='cd $ORACLE_BASE'; alias home='cd $ORACLE_HOME'
alias pass-gen='openssl rand -base64 12 '
#My Functions
test -f ~/.host_aliases && . ~/.host_aliases
test -f ~/.menurc && . ~/.menurc
test -f ~/.bash_custom && . ~/.bash_custom
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib
