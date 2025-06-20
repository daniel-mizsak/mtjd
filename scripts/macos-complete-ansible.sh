#!/usr/bin/env bash

set -e # exit if a command fails

# Prepare environment
echo "Making sure the repository is present."
if [[ ! -d "${HOME}/mtjd" ]]; then
    git clone "https://github.com/daniel-mizsak/mtjd.git" "${HOME}/mtjd" --quiet
fi

echo "Making sure the python virtual environment and dependencies are present."
if [[ ! -d "${HOME}/mtjd/.venv" ]]; then
    python3 -m venv --upgrade-deps "${HOME}/mtjd/.venv" > /dev/null
fi

# Activate virtual environment and install dependencies
source "${HOME}/mtjd/.venv/bin/activate"
pip3 install ansible -qqq
export ANSIBLE_PYTHON_INTERPRETER="${HOME}/mtjd/.venv/bin/python"

# Run tasks
for task in "programs" "system" "dockutil" "terminal"; do
    # Run the ansible playbook for each task
    echo "Running ${task} setup."
    ansible-playbook \
        "${HOME}/mtjd/ansible/playbook.yml" \
        --extra-vars "task_name=${task}"
done

# Restart Finder and Dock
echo "Restarting Finder and Dock."
killall Finder
killall Dock
