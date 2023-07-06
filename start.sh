#!/usr/bin/env bash

set -euo pipefail

rm -rf _site
bundle exec jekyll serve
