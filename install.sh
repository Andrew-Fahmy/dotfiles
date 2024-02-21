#!/usr/bin/env bash

if ! command -v stow &> /dev/null
then
  echo 'stow is not installed, exiting'
  exit 1
fi

stow . -v --ignore=install.sh
