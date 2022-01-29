# Using zplug here, so it must be installed
source /usr/share/zsh/scripts/zplug/init.zsh

# Spaceship is slow with default options, this only loads relevant stuff
SPACESHIP_PROMPT_ORDER=(user host dir git exec_time line_sep exit_code char)
# Much more beautiful paths for this theme
SPACESHIP_DIR_COLOR='#C678DD'

zplug "agkozak/zsh-z"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zdharma/fast-syntax-highlighting"
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Go with a space into icognito
setopt histignorespace

export EDITOR="nvim"

# Flutter stuff
export CHROME_EXECUTABLE="chromium"

HISTCONTROL=ignorespace:erasedups
SAVEHIST=100
KEYTIMEOUT=1
HISTFILE=~/.zsh_history

# Cat images
alias icat="kitty +kitten icat --align=left"

# Beautiful ls
alias l="lsd"
alias ll="l -l"
alias lla="l -Al"
alias llt="l --tree"

# Useful stuff
alias R="R --quiet"
alias tmux="TERM=xterm-256color tmux"
alias nv="nvim"
alias aic="ascii-image-converter"
alias curl="curl -s"
alias turl="curl --socks5-hostname arch:9050"
alias uchroot="fakechroot fakeroot chroot"

export PATH="$HOME/.local/bin:$PATH"

# More adaptions for specific computers
custom_path="$HOME/private.sh"
[[ -e $custom_path ]] && source "$custom_path"

function banner() {
    sentences=(
        "Attached"
        "Roll Safe"
        "Hit or miss?"
        "Levitation"
        "Lets get it"
        "SubZero"
        "Wooosh"
        "Lets Rustify"
        "Elite"
        "Leet"
        "Bloodbath"
        "Vivien"
        "I use Arch btw"
        "c mamo"
    )

    fonts=(
        "3d"
        "ANSI Shadow"
        "3d"
        "ANSI Shadow"
        "ANSI Shadow"
        "Elite"
        "Bloody"
        "ANSI Shadow"
        "Elite"
        "Elite"
        "Bloody"
        "THIS"
        "Elite"
        "Bloody"
    )

    size_sentence=${#sentences[@]}
    index_sentence=$(($RANDOM % $size_sentence + 1))
    random_sentence=${sentences[$index_sentence]}
    random_font=${fonts[$index_sentence]}

    echo
    figlet -t -f $random_font $random_sentence | lolcat
    echo
}

banner
