#!/bin/bash
set -e

rm -f /usr/src/app/tmp/pids/server.pid

echo "bundle install..."
bundle check || bundle install --jobs 4
bundle update --bundler

exec "$@"
