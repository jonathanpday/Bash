## This file was copied from /etc/bashrc to use a a template for 
## my bash login script. 

# Local .bash_profile file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

## TODO: Add some color in there. 
##
PS1='\n\e[37;1m\h:\W\e[0m \e[34;1m\u\e[0m\$ '

if [ -x /usr/bin/dircolors ]; then
	DIRCOLORS_FILE=~/.dircolors
	test -r $DIRCOLORS_FILE && eval "$(dircolors -b $DIRCOLORS_FILE)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
fi

# set up some generic aliases
alias vim='open -a MacVim'
alias minicom='minicom -D /dev/tty.usbserial-B -b 115200'

# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
