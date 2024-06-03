#!/usr/bin/env bash

apt list --installed 2> /dev/null | grep emacs-mozc > /dev/null
if [ $? -ne 0 ]; then
  sudo apt install emacs-mozc
fi
