#!/bin/bash
bundle update
bundle install
rails db:migrate
rm /usr/src/app/tmp/pids/server.pid

exec "$@"
