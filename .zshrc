# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DISPLAY=:0
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PAGER=cat

alias desk='cd ~/Desktop/'
alias coll='cd ~/Desktop/College/'

alias cn='cd ~/Desktop/College/Sem5/CN/'
alias pc='cd ~/Desktop/College/Sem5/PC/'
alias se='cd ~/Desktop/College/Sem5/SE/'
alias eom='cd ~/Desktop/College/Sem5/EOM/'
alias os='cd ~/Desktop/College/Sem5/OS/'

alias cmpd='cd ~/Desktop/College/Sem6/CD/'
alias pcap='cd ~/Desktop/College/Sem6/PCAP/'
alias efm='cd ~/Desktop/College/Sem6/EFM/'


sem() {
  if [ -z "$1" ]; then
    echo "Usage : sem {number}"
    return 1
  fi
  #sem path
  target="$HOME/Desktop/College/Sem$1"
  cd "$target" 2>/dev/null || mkdir -p  "$target" && cd "$target"
}

lab() {
  if [ -z "$1" ]; then
    echo "Usage: lab {number}"
    return 1
  fi

  # Get current directory name (last part of path)
  current=$(basename "$PWD")

  # Expected lab path
  target="$PWD/Lab/Lab$1"

  # If already inside a course folder 
  if [[ "$current" =~ ^(PC|CN|OS|SE|EOM|CD|EFM|PCAP)$ ]]; then
    cd "$target" 2>/dev/null || echo "Lab$1 does not exist in $current"
  else
    echo "You must be inside a course folder to use lab command"
  fi
}

comp() {
  local pattern="*"
  local ext_filter=""

  # Parse args
  if [[ "$1" == "-t" ]]; then
    ext_filter="$2"
  elif [[ -n "$1" ]]; then
    pattern="$1"
    if [[ "$2" == "-t" ]]; then
      ext_filter="$3"
    fi
  fi

  # Find files
  local files=()
  while IFS= read -r file; do
    files+=("${file#./}")
  done < <(
    if [[ -n "$ext_filter" ]]; then
      find . -maxdepth 1 -type f -name "*${ext_filter}"
    else
      find . -maxdepth 1 -type f -name "${pattern}"
    fi
  )

  if [ ${#files[@]} -eq 0 ]; then
    echo "No files found!"
  fi

  for file in "${files[@]}"; do
    [[ "$file" == *.* ]] || continue  # Skip files with no extension
    local base="${file%.*}"

    case "$file" in
      *.c)
        echo "Compiling: $file"
        gcc "$file" -o "$base"
        ;;
      *.cpp)
        echo "Compiling: $file"
        g++ "$file" -o "$base"
        ;;
      *.java)
        echo "Compiling: $file"
        javac "$file"
        ;;
    esac
  done
}


run() {
  repo_dir="."
  pattern="*"

  # Use pattern from argument if provided
  if [ -n "$1" ]; then
      pattern="$1"
  fi

  # Find all matching files, ignore .git, check if executable, run in a new ptyxis window
  find "$repo_dir" -type f -not -path "*/.git/*" -name "${pattern}*" | while read -r file; do
      if [ -x "$file" ]; then
          echo "Opening $file in a new window"
          ptyxis --new-window -- zsh -c "./$file; exec zsh"
      else
          echo "Skipping $file (not executable)"
      fi
  done
}

#converts all ppts in current directory into pdfs
pdf() {
  setopt NULL_GLOB
  for f in *.ppt *.pptx *.ppsx *.pptx *.docx *.doc; do
      [ -e "$f" ] || continue
      libreoffice --headless --convert-to pdf "$f" && rm -- "$f"
  done
}

# The following lines were added by compinstall

zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/sinhaa/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
