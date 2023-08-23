# Aliases
alias ll='ls -alF'
alias cls='clear'
alias grep='grep --color=auto'

# Custom colors
# Add your preferred color codes here
# For example:
# GREEN='\[\e[1;32m\]'
# BLUE='\[\e[1;34m\]'
# RED='\[\e[1;31m\]'
# RESET='\[\e[0m\]'

# Icons for Git status
GIT_ICON=""

# Custom prompt with Git branch and colors
PS1="$GREEN\u@\h $BLUE\w $RED\$(parse_git_branch) $RESET\$ "

# Function to parse the Git branch
parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -E "s/(.*)/ $GIT_ICON \1/"
}

# Function to quickly create a directory and change to it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Function for quick note-taking
notes() {
    touch ~/notes/"$1".txt
    nano ~/notes/"$1".txt
}

# Increase command history size
HISTSIZE=10000

# Add more customizations and functions as needed


