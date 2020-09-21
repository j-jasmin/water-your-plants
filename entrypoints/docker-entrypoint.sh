#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo '--- run yarn install'
yarn install

echo '--- run bundle install'
bundle check || bundle install

bundle exec rails s -b 0.0.0.0
