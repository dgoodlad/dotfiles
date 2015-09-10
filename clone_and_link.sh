#!/bin/bash

cd &&
[ -d '.dot-files' ] || git clone git://github.com/dgoodlad/dot-files.git .dot-files &&
find .dot-files/files -depth 1 | while read f; do
  #[ "$f" == '.dot-files/files/.git' ] ||
  ([ "$f" == '.dot-files/files/oh-my-zsh' ] && ln -vsf "$f" .oh-my-zsh) ||
  ln -vsf "$f" .
done

cd &&
[ -d '.emacs.d' ] || git clone --recurse-submodules https://github.com/syl20bnr/spacemacs .emacs.d
