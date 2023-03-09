# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Fixes colors not showing properly in `vim` inside `tmux`
# # Reference: https://askubuntu.com/questions/125526/vim-in-tmux-display-wrong-colors
export TERM="xterm-256color"

# To show correct powerline symbols
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
source $ZSH/oh-my-zsh.sh

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle command-not-found
antigen bundle rand-quote 

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jeffreytse/zsh-vi-mode

# Tell Antigen that you're done.
antigen apply

# Preferred editor for local and remote sessions
export EDITOR='vim'


# Aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias tmuxconfig="vim ~/.tmux.conf"

# For Django
alias djServer="python manage.py runserver"

# For Docker
alias docker='sudo docker'
alias docker-compose='sudo docker-compose'

# For AWS SSM
alias sshSimfonianalyticsProd="aws ssm start-session --target 'i-0ebf2bbf6b474c569' --region 'us-east-1'"
alias sshSimfoniAnalyticsDev="aws ssm start-session --target 'i-01d853ae5211dec67' --region 'eu-west-1'"
alias sshSourceforceDev="aws ssm start-session --target 'i-0eef6d1c2f2e131ea' --region 'eu-west-2'"
alias sshSourceforceProd="aws ssm start-session --target 'i-090270bd272480999' --region 'eu-west-2'"
alias sshVitessProd="aws ssm start-session --target i-03c1d05d5c293e921 --region 'eu-west-2'"
alias sshVitessDev="aws ssm start-session --target i-034dd618ec4dcb1c0 --region 'eu-west-2'"
alias sshTools="aws ssm start-session --target 'i-0e0be520ca4df2136' --region 'eu-west-1'"
alias sshVitesseStage="aws ssm start-session --target i-076ad37c34cbeda31 --region 'eu-west-2'"
alias sshNewVitesseStage="aws ssm start-session --target i-0ca7945f6de86f6c7 --region 'eu-west-2'"
alias sshNewVitesseDev="aws ssm start-session --target i-0f5ee21639c2c4a84 --region 'eu-west-2'"
alias sshTempVitesseCelery="ssh -i /home/dotgourav/Workspace/Simfoni/DevOps/london-generic.pem ubuntu@18.170.102.244"
alias sshVitesseDemoWeb0="ssh -i /home/dotgourav/Workspace/Simfoni/DevOps/new_keys_26102021.pem ubuntu@172.31.59.203"
alias sshVitesseDemoCelery0="ssh -i /home/dotgourav/Workspace/Simfoni/DevOps/new_keys_26102021.pem ubuntu@172.31.68.78"

# New Infra
alias sshVitesseDevBastion="ssh -i /home/dotgourav/Workspace/Simfoni/DevOps/automationterraform ubuntu@10.100.0.63"
alias sshVitesseProdBastion="ssh -i /home/dotgourav/Workspace/Simfoni/DevOps/automationterraform ubuntu@10.1.0.223"
alias sshVitesseStageBastion="ssh -i /home/dotgourav/Workspace/Simfoni/DevOps/automationterraform ubuntu@10.101.0.166"
alias sshVitesseDemoBastion="ssh -i /home/dotgourav/Workspace/Simfoni/DevOps/automationterraform ubuntu@3.238.78.89"

# For Tmuxinator completion
alias mux='tmuxinator'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
