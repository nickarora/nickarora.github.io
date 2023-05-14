#!/usr/bin/env bash

set -euo pipefail

rm -f ./Gemfile.lock
rm -rf ./gems

bundle config set --local path ./gems
bundle install --standalone

# include the deploy environment
bundle lock --add-platform x86_64-linux
