#!/bin/bash

cd &&
[ -d '.dot-files' ] || git clone git://github.com/dgoodlad/dot-files.git .dot-files &&
ls -ld .dot-files/files/* .dot-files/files/.* | while read f; do
  [ "$f" == '.dot-files/files/.' ] ||
  [ "$f" == '.dot-files/files/..' ] ||
  [ "$f" == '.dot-files/files/.git' ] ||
  ln -vsf "$f" .
done
