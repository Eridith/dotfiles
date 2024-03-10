# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias ls='colorls'
alias grep='grep --color=auto'
alias upgrade='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/Josh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -Uz promptinit
promptinit

# Pywal
(cat ~/.cache/wal/sequences &)

# Key Binds
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
#key[Shift-Left]="${terminfo[kRIT5]}"
#key[Shift-Right]="${terminfo[kRIT5]}"
#key[Shift-Home]="${terminfo[kRIT5]}"
#key[Shift-End]="${terminfo[kRIT5]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
bindkey "^H" backward-delete-word # Ctrl-Backspace
bindkey "^[[3;5~" delete-word # Ctrl-Del
bindkey "\e\e" sudo-command-line # ESC ESC
	zle -N sudo-command-line
      sudo-command-line() {
            [[ -z $BUFFER ]] && zle up-history
            if [[ $BUFFER == sudo\ * ]]; then
                  LBUFFER="${LBUFFER#sudo }"
            else
                  LBUFFER="sudo $LBUFFER"
            fi
      }
#[[ -n "${key[Control-Backspace]}"  ]] && bindkey -- "${key[Control-Backspace]}"  backward-delete-word
#[[ -n "${key[Control-Delete]}" ]] && bindkey -- "${key[Control-Delete]}" delete-word
#[[ -n "${key[Shift-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  select-backward-word
#[[ -n "${key[Shift-Right]}" ]] && bindkey -- "${key[Control-Right]}" select-forward-word
#[[ -n "${key[Shift-Home]}"  ]] && bindkey -- "${key[Shift-Home]}"  backward-word
#[[ -n "${key[Shift-End]}" ]] && bindkey -- "${key[Shift-End]}" forward-word

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
