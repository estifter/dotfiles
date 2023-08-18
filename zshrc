PROMPT='%B%F{240}%3~%f%b %# '

CLICOLOR=1
alias ls="ls -G"
alias ll="ls -alG"
alias vim="nvim"
export PATH="$PATH:/opt/homebrew/bin"

# opam configuration
[[ ! -r /Users/estifter/.opam/opam-init/init.zsh ]] || source /Users/estifter/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
# Add quarto to the path
if [[ -d /Users/estifter/Applications/quarto/bin ]]; then
  export PATH="/Users/estifter/Applications/quarto/bin:$PATH"
fi
