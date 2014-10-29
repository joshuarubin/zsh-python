if (( $+commands[virtualenvwrapper_lazy.sh] )); then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/working
  export VIRTUALENVWRAPPER_SCRIPT=$(which virtualenvwrapper.sh)
  source $(which virtualenvwrapper_lazy.sh)
fi

VIRTUAL_ENV_DISABLE_PROMPT=true
