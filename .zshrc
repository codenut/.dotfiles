
ZSH_DISABLE_COMPFIX=true

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias abrew="/opt/homebrew/bin/brew"
alias ipod="arch -x86_64 pod"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias vim=nvim
export PATH=/opt/homebrew/bin:/Users/michael/Library/Python/3.8/bin:/opt/homebrew/opt/openjdk/bin:$PATH

alias ydla="youtube-dl -x --audio-format mp3 --audio-quality 0 "

eval "$(starship init zsh)"
