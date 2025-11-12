# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#source ~/.zplug/init.zsh

# replace zplug with zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

is_installed() {
  command -v "$1" > /dev/null
}

is_darwin() {
  [[ $(uname -s) == "Darwin" ]]
}

is_linux() {
  [[ $(uname -s) == "Linux" ]]
}

#zplug "zsh-users/zsh-history-substring-search"
zinit light "zsh-users/zsh-history-substring-search"
#zplug "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-autosuggestions"
#zplug "plugins/git",   from:oh-my-zsh
zinit snippet OMZ::plugins/git
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
zinit light "zsh-users/zsh-syntax-highlighting"
# manage local plugins
# zplug "~/.zsh", from:local
#zplug "lib/history", from:oh-my-zsh
#zinit snippet OMZ::lib/history

# Install plugins if there are plugins that have not been installed
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

# Then, source plugins and add commands to $PATH
#zplug load

#prompt skwp

export PATH=/usr/local/opt/python/libexec/bin:/Users/rvdm/Library/Python/3.7/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:/Users/rvdm/Library/Python/3.7/bin:~/bin:$PATH
export PATH=$PATH:~/go/bin:/home/rvdm/.local/bin
export PATH=/snap/bin/:$PATH
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export CLICOLOR=1

[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rvdm/code/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rvdm/code/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rvdm/code/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rvdm/code/google-cloud-sdk/completion.zsh.inc'; fi

if [ -f '/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh' ]; then source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh; fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias vim="nvim"
alias vi="nvim"
alias view="nvim -R"
alias ip='ip -color=auto'
export EDITOR=nvim
export QUOTING_STYLE=literal
export AWS_REGION=eu-west-1

# color stuff
is_darwin && export CLICOLOR=y
is_linux && alias ls='ls --color=auto'
alias grep='grep --color=auto'

# homebrew
[[ ! -f /opt/homebrew/bin/brew ]] || eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
[[ ! -d ~/.pyenv/bin ]] || export PATH=$PATH:~/.pyenv/bin
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export PATH="$PATH:/Users/rvdm/.local/bin"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/rvdm/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
eval "$(direnv hook zsh)"
[[ ! -f ~/.secrets.zsh ]] || source ~/.secrets.zsh
alias ring_gethostsfile='scp leaseweb02.ring.nlnog.net:/etc/ssh/ssh_known_hosts ~/.ssh/known_hosts_ring'

# launch the starship
eval "$(starship init zsh)"
# ensure neovim backupdir existence
[[ -d ~/.neovim_temp ]] || mkdir ~/.neovim_temp

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

setopt share_history
setopt inc_append_history
export HISTFILE=~/.zsh_history
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

export HOMEBREW_DOWNLOAD_CONCURRENCY=auto


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/rvdm/.lmstudio/bin"
# End of LM Studio CLI section

