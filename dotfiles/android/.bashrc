# Aliases
alias ll='ls -alF'
alias cls='clear'
alias grep='grep --color=auto'

GRAY="\[\e[2;37m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
PURPLE="\[\e[1;35m\]"
BLUE="\[\e[1;34m\]"
DBLUE="\[\e[1;34m\]"
CYAN="\[\e[2;36m\]"
DRED="\[\e[01;38;5;52m\]"
COLOR_NONE="\[\e[0m\]"
# Background and Foreground Colors
BG_Yellow='\[\e[48;5;226m\]'
FG_Maroon='\[\e[38;5;88m\]'

# Detect whether the current directory is a git repository.
function is_git_repository() {
  git branch > /dev/null 2>&1
}

function set_git_branch () {
    # Note that for new repo without commit, git rev-parse --abbrev-ref HEAD
    # will error out.
    if git rev-parse --abbrev-ref HEAD > /dev/null 2>&1; then
        BRANCH=$(git rev-parse --abbrev-ref HEAD)
    else
        BRANCH="bare repo!"
    fi
}

function set_bash_prompt () {

    if is_git_repository; then
        set_git_branch
    else
        BRANCH=''
    fi

    PS1=""
    PS1+="${CYAN}╭─${COLOT_NONE}"
    # set up user and host
    PS1+="${DBLUE}\u@\h${COLOR_NONE} "
    # set up working directory
    PS1+="${GREEN}\w${COLOR_NONE} "
    # set up git branch
    PS1+="${YELLOW}${BRANCH}${COLOR_NONE}\n"
    # set up prompt character
    PS1+="${CYAN}╰${COLOR_NONE} "
#    PS1+="${FG_Yellow}${BG_Maroon}${COLOR_NONE} "
    PS1+="${GREEN} ${COLOR_NONE} " 
}

export PROMPT_COMMAND=set_bash_prompt
#PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;97m\]\[\e[0m\] '

# Function to parse the Git branch
#parse_git_branch() {
#    git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -E "s/(.*)/ $GIT_ICON \1/"
#}

# Increase command history size
HISTSIZE=10000

# Add more customizations and functions as needed
