#!/bin/bash

python_version="3.10.9"

if [ ! -e "$HOME/.virtualenvs/$python_version" ]; then
  eval "$(pyenv init --path)"
  pyenv local $python_version
  if [ $? -ne 0 ]; then
    pyenv install $python_version
    pyenv local $python_version
  fi
  python3 -m venv "$HOME/.virtualenvs/$python_version"
fi
source "$HOME/.virtualenvs/$python_version/bin/activate"
poetry lock
poetry export -f requirements.txt > requirements.txt
pip3 install -r requirements.txt
poetry install
