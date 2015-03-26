#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

if (( $+commands[pyenv] )); then
  #eval "$(pyenv init -)"
  export PYENV_SHELL=zsh
  source '/usr/local/Cellar/pyenv/20150226/completions/pyenv.zsh'
  #pyenv rehash 2>/dev/null
  pyenv() {
    local command
    command="$1"
    if [ "$#" -gt 0 ]; then
      shift
    fi

    case "$command" in
    rehash|shell)
      eval "`pyenv "sh-$command" "$@"`";;
    *)
      command pyenv "$command" "$@";;
    esac
  }
fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pyenv] )); then
  return 1
fi

if (( $+commands[virtualenvwrapper_lazy.sh] )); then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/working
  export VIRTUALENVWRAPPER_SCRIPT=$(which virtualenvwrapper.sh)
  VIRTUAL_ENV_DISABLE_PROMPT=1
  source $(which virtualenvwrapper_lazy.sh)
fi

#
# Aliases
#

alias py='python'
