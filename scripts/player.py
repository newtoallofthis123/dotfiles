#!/bin/python3

import subprocess

cmd = subprocess.Popen('playerctl metadata --format "{{artist}} - {{title}}"', shell=True, stdout=subprocess.PIPE)
