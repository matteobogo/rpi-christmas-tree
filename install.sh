#!/usr/bin/env bash

_START_HOUR=17
_START_MINUTE=0
_END_HOUR=1
_END_MINUTE=0

_APP_NAME=xmas_tree.py

echo "installing dependencies.."
apt-get install python-gpiozero -y > /dev/null
apt-get install python3-gpiozero -y > /dev/null

echo "setting up the autostart.."

crontab -l > xmas_tree
echo "
    ${_START_MINUTE} ${_START_HOUR} * * * python ${PWD}/xmas_tree.py --mode=start &
    ${_END_MINUTE} ${_END_HOUR} * * * python ${PWD}/xmas_tree.py -m stop && pkill -f xmas_tree" >> xmas_tree

crontab xmas_tree
rm xmas_tree