# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/zap-prompt"
# plug "spaceship-prompt/spaceship-prompt"
plug "zap-zsh/exa"
# plug "romkatv/powerlevel10k"

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
alias wezconfig='cd ~/.config/wezterm/ && nvim wezterm.lua'
alias notes='nvim ~/Desktop/apuntes.md'
alias wnotes='nvim ~/Desktop/work/notes.md'
alias dev='cd ~/Desktop/dev/'
alias work='cd ~/Desktop/work/'
alias vim='nvim'
alias lg='lazygit'

# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

source ~/.config/zsh/.zsh_functions/custom.sh
