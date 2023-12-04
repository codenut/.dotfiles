ZSH_DISABLE_COMPFIX=true

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias abrew="/opt/homebrew/bin/brew"
alias ipod="arch -x86_64 pod"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim=nvim
export PATH=/opt/homebrew/bin:/Users/michael/Library/Python/3.8/bin:/opt/homebrew/opt/openjdk/bin:$PATH

alias ydla="youtube-dl -x --audio-format mp3 --audio-quality 0 "

eval "$(starship init zsh)"

export VISUAL=nvim
export EDITOR="$VISUAL"

export PYENV_ROOT="$HOME/.pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH" 
eval "$(pyenv init --path)" 
eval "$(pyenv init -)"

alias gcj_java="/usr/local/Cellar/openjdk/18/libexec/openjdk.jdk/Contents/Home/bin/java -Xms896m -Xmx896m -Xss64m -XX:+UseSerialGC"

# BEGIN env Setup -- Managed by Ansible DO NOT EDIT.

# Setup INDEED_ENV_DIR earlier.
if [ -z "${INDEED_ENV_DIR}" ]; then
    export INDEED_ENV_DIR="/Users/mvalladolid/env"
fi

# Single-brace syntax because this is required in bash and sh alike
if [ -e "${INDEED_ENV_DIR}/etc/indeedrc" ]; then
    . "${INDEED_ENV_DIR}/etc/indeedrc"
fi
# END env Setup -- Managed by Ansible DO NOT EDIT.

export PATH=$HOME/.cargo/bin:/opt/homebrew/bin:/Users/michael/Library/Python/3.8/bin:/opt/homebrew/opt/openjdk/bin:/Users/mvalladolid/.pyenv/shims:/Users/mvalladolid/env/bin:/Users/mvalladolid/indeed/hobo/bin:/Users/mvalladolid/.tfenv/bin:/Users/mvalladolid/indeed/system-setup/bin:/Users/mvalladolid/.indeed-dev-tools/bin:/Users/mvalladolid/indeed/javadev/bin/po:/Users/mvalladolid/indeed/javadev/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/ed/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-indent/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/gettext@0.20.2/bin:/usr/local/opt/gnu-which/libexec/gnubin:/usr/local/opt/gnutls/bin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/openssl/bin:/usr/local/opt/python@3.6.8/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/usr/local/go/bin:/Users/mvalladolid/go/bin:/usr/local/opt/mongodb-community@3.6/bin:/usr/local/opt/fzf/bin:$PATH

alias ydla="youtube-dl -x --audio-format mp3 --audio-quality 0 "
alias ydlv="youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' "
alias olym="/Users/mvalladolid/Library/Mobile Documents/com~apple~CloudDocs/olympiad"


alias iclouddrive='/Users/mvalladolid/Library/Mobile Documents/com~apple~CloudDocs'


 export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias "raco fmt"="raco fmt --width 40"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/mambaforge/base/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/usr/local/Caskroom/mambaforge/base/etc/profile.d/mamba.sh" ]; then
    . "/usr/local/Caskroom/mambaforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
