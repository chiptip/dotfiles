# https://github.com/pyenv/pyenv-virtualenvwrapper

# use pyenv with virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# ensure initialation is done
eval "$(pyenv init -)"

export WORKON_HOME=$HOME/.virtualenvs
pyenv virtualenvwrapper_lazy