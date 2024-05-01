# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/exa"

# plug "spaceship-prompt/spaceship-prompt"

# Load and initialise completion system
autoload -Uz compinit
compinit

# eval "$(starship init zsh)"

# Key bindings
# bindkey '^ ' autosuggest-accept

# Disable fzf default key bindings.
export FZF_CTRL_T_COMMAND=""

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target"


alias ll='eza -lag --icons --no-time'
alias lt='eza --tree --level=3 --icons'

alias kittyconfig='cd ~/.config/kitty/ && nvim kitty.conf'
alias alconfig='cd ~/.config/alacritty/ && nvim alacritty.toml'
alias zshconfig="cd ~/.config/zsh/ && nvim .zshrc"
alias notes='nvim ~/Desktop/apuntes.md'
alias dev='cd ~/Desktop/dev/'
alias vim='nvim'

# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads rbenv
# eval "$(~/.rbenv/bin/rbenv init - zsh)"

export STARSHIP_CONFIG=~/.config/starship/starship.toml
