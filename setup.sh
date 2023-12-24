#!/bin/bash

env_name="venv"

if [ -d "$env_name" ]; then
    echo "Virtual environment '$env_name' already exists. Aborting."
    exit 1
fi

python3 -m venv "$env_name"
# shellcheck disable=SC1090
source "./$env_name/bin/activate"
pip install -U pip

if [ -f "requirements.txt" ]; then
    pip install -r ./requirements.txt
fi

echo ''
python3 ./asu-notifier.py -h
