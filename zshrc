# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zplug/init.zsh

is_installed() {
  command -v "$1" > /dev/null
}

is_darwin() {
  [[ $(uname -s) == "Darwin" ]]
}

is_linux() {
  [[ $(uname -s) == "Linux" ]]
}

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting", as:plugin, defer:2


# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*darwin*amd64*"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Also prezto
zplug "modules/prompt", from:prezto

# Load if "if" tag returns true
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
#zplug "jhawthorn/fzy", \
#    as:command, \
#    rename-to:fzy, \
#    hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
#zplug "stedolan/jq", \
#    from:gh-r, \
#    as:command, \
#    rename-to:jq
#zplug "b4b4r07/emoji-cli", \
#    on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
zplug "~/.zsh", from:local

# Load theme file
#zplug 'dracula/zsh', as:theme
zplug romkatv/powerlevel10k, as:theme, depth:1

zplug "lib/history", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

prompt skwp

export PATH=/usr/local/opt/python/libexec/bin:/Users/rvdm/Library/Python/3.7/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:/Users/rvdm/Library/Python/3.7/bin:~/bin:$PATH
export PATH=$PATH:~/go/bin:/home/rvdm/.local/bin
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export CLICOLOR=1

#export HISTFILE=~/.zsh_history     #Where to save history to disk
#export SAVEHIST=5000
#export HISTSIZE=5000
#setopt appendhistory
#setopt sharehistory
#setopt inc_append_history
#export PAGER="most"
#alias less=most
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
export EDITOR=nvim
export QUOTING_STYLE=literal
export AWS_REGION=eu-west-1

# color stuff
is_darwin && export CLICOLOR=y
is_linux && alias ls='ls --color=auto'
alias grep='grep --color=auto'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

# homebrew
[[ ! -f /opt/homebrew/bin/brew ]] || eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
[[ ! -d ~/.pyenv/bin ]] || export PATH=$PATH:~/.pyenv/bin
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


# dummy change
export PATH="$PATH:/Users/rvdm/.local/bin"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/rvdm/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
eval "$(direnv hook zsh)"
[[ ! -f ~/.secrets.zsh ]] || source ~/.secrets.zsh
alias ring_gethostsfile='scp leaseweb02.ring.nlnog.net:/etc/ssh/ssh_known_hosts ~/.ssh/known_hosts_ring'
