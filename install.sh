#!/usr/bin/env bash

_APP_NAME=xmas_tree.py
_SERVICE_NAME=xmas_tree.service

echo "installing dependencies.."
sudo apt-get install python-gpiozero -y > /dev/null
sudo apt-get install python3-gpiozero -y > /dev/null

echo "setting up the autostart.."
echo "
[Unit]
Description=A program for handling the lights of a Christmas Tree
After=multi-user.target

[Service]
Type=idle
ExecStart=/usr/bin/python $(pwd)/$_APP_NAME

[Install]
WantedBy=multi-user.target
" > /lib/systemd/system/${_SERVICE_NAME}

systemctl daemon-reload
systemctl enable ${_SERVICE_NAME}

echo "Rebooting.."
sleep 5

reboot