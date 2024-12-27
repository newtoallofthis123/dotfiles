#!/bin/python3

import os

try:
    os.system("cp -r ~/.config/i3 .")
except:
    print("Failed at", "i3")
try:
    os.system("cp -r ~/.config/i3blocks .")
except:
    print("Failed at", "i3blocks")
try:
    os.system("cp -r ~/.config/kitty .")
except:
    print("Failed at", "kitty")
try:
    os.system("cp -r ~/.config/micro .")
except:
    print("Failed at", "micro")
try:
    os.system("cp -r ~/.config/fish .")
except:
    print("Failed at", "fish")
try:
    os.system("cp -r ~/.config/sway .")
except:
    print("Failed at", "sway")
try:
    os.system("cp -r ~/.config/waybar .")
except:
    print("Failed at", "waybar")
try:
    os.system("cp -r ~/.config/zellij .")
except:
    print("Failed at", "zellij")
try:
    os.system("cp -r ~/.config/scripts .")
except:
    print("Failed at", "scripts")
try:
    os.system("cp -r ~/.config/zed .")
except:
    print("Failed at", "zed")
try:
    os.system("cp -r ~/.config/ghostty .")
except:
    print("Failed at", "ghostty")
try:
    os.system("cp ~/.tmux.conf .tmux.conf")
except:
    print("Failed at", "tmux")
try:
    os.system("cp ~/.vimrc .vimrc")
except:
    print("Failed at", "vimrc")
try:
    os.system("cp ~/.bashrc .bashrc")
except:
    print("Failed at", "bashrc")
try:
    os.system("cp ~/.zshrc .zshrc")
except:
    print("Failed at", "zshrc")
