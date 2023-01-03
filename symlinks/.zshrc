# Font
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# iTerm & tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t main || tmux new -s main
fi

cd ~

# nnn: exit at cwd on 'Q'
n ()
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
   
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# Add new one: git clone $1 /Users/gyzavyalov/.oh-my-zsh/custom/plugins/$1
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Environ configuration
for SOURCEFILE in `find /Users/gyzavyalov/.env/dotfiles/source`
do
  [ -f "$SOURCEFILE" ] && source "$SOURCEFILE"
done

# PROMPT:
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship.toml

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh autocompletions for tools
fpath=(~/.zsh/completion ${fpath})
autoload -U compinit && compinitfpath=(~/.zsh/completion ${fpath})
autoload -U compinit && compinit
