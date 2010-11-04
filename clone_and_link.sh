#!/bin/bash

cd &&
[ -d '.dot-files' ] || git clone git://github.com/dgoodlad/dotfiles.git .dot-files &&
find .dot-files/files -depth 1 | while read f; do
  [ "$f" == '.dot-files/files/.git' ] ||
  ([ "$f" == '.dot-files/oh-my-zsh' ] && ln -vsf "$f" .oh-my-zsh) ||
  ln -vsf "$f" .
done
