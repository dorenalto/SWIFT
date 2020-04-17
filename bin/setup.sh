#!/bin/sh

if [ `gem list -i "^bundler$"` = false ]; then gem install bundler; fi
bundle install