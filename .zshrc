# Vars
export DISPLAY=:0
#export WAYLAND_DISPLAY=wayland-0

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt correct
setopt extendedglob
setopt nocaseglob
setopt nocheckjobs
setopt autocd
unsetopt autocd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle :compinstall filename '/home/Josh/.zshrc'

autoload -Uz promptinit && promptinit

# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias c='clear'
alias ..='cd ..'
alias ...='cd ../../'
alias ls='ls --color'
alias ff='fastfetch'
alias clients='hyprctl clients'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias compress='tar -cvf'
alias extract='tar -xvf'
alias s='pacman -Ss'
alias q='pacman -Q | grep'
alias u='sudo pacman -Syu;yay -a'
alias i='sudo pacman -S'
alias d='sudo pacman -Rns'

alias start='dbus-run-session start-hyprland' #/home/Josh/.local/bin/wrapped_hl.sh
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias hyprupdate='/home/Josh/.config/hypr/Scripts/Update/hyprupdate.sh'
alias weather='curl wttr.in'
alias hackerman='genact -m bruteforce'
alias sigint='sudo pkill -2'
alias apphide='/home/Josh/Documents/Scripts/apphider.sh'
alias bios='loginctl reboot --firmware-setup'
alias lspkg="pacman -Qqen > ~/Templates/pkglist.txt && sdiff -s <(pacman -Qqen) <(pacman -Qqe) | awk '{print \$2}' > ~/Templates/aurlist.txt"

#mergeaudio() {
#'ffmpeg -i $(read $filename) -filter_complex "[0:a:0][0:a:1]amix=2:longest[aout]" -map 0:V:0 -map "[aout]" -c:v copy -c:a aac -b:a 320k output.mkv'
#}

# Pywal
(cat ~/.cache/wal/sequences &)

# Key Binds
typeset -g -A key
bindkey -e
#bindkey '' history_search_backward
#bindkey '' history_search_forward
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
# setup key accordingly
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-history
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-history
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
bindkey "^H"      backward-delete-word # Ctrl-Backspace
bindkey "^[[3;5~" delete-word     # Ctrl-Del
bindkey "\e\e"    sudo-command-line  # ESC-ESC
	zle -N sudo-command-line
      sudo-command-line() {
            [[ -z $BUFFER ]] && zle up-history
            if [[ $BUFFER == sudo\ * ]]; then
                  LBUFFER="${LBUFFER#sudo }"
            else
                  LBUFFER="sudo $LBUFFER"
            fi
      }

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/Josh/.dart-cli-completion/zsh-config.zsh ]] && . /home/Josh/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# bun completions
[ -s "/home/Josh/.bun/_bun" ] && source "/home/Josh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.experimental.omp.toml)"

fastfetch

if [[ "$EUID" -ne 0 && "$(tty)" == "/dev/tty1" ]]; then
    #exec dbus-run-session /home/Josh/.local/bin/wrapped_hl.sh
    exec dbus-run-session start-hyprland
fi

# pnpm
export PNPM_HOME="/home/Josh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
