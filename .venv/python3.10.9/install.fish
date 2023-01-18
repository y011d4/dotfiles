#!/usr/bin/fish
pyenv init - | source
pyenv local 3.10.9
python -m venv ~/.virtualenvs/3.10.9
source ~/.virtualenvs/3.10.9/bin/activate.fish
poetry export -f requirements.txt > requirements.txt
pip3 install -r requirements.txt
poetry install
