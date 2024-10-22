# Download Znap, if it's not there yet.
[[ -r ~/zsh_plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/zsh_plugins/znap
source ~/zsh_plugins/znap/znap.zsh  # Start Znap

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

znap source marlonrichert/zsh-autocomplete
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Can fix WSL GUI problems
export MESA_D3D12_DEFAULT_ADAPTER_NAME=nvidia


eval "$(oh-my-posh init zsh --config https://raw.githubusercontent.com/vilhei/Configs/main/ohmyposh.omp.json)"

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# Ctrl+Backspace deletes word. Dependening on system '^H' might not be right. Use "showkey -a" command to find out on your systesm correct symbol for ctrl+backspace
bindkey '^H' backward-kill-word 

