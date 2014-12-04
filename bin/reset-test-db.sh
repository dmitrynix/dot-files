#!/bin/bash

set -ex

export RAILS_ENV=test

rm -fr db/schema.rb
rm -fr db/structure.sql

bundle exec rake db:drop
bundle exec rake db:create
bundle exec rake db:migrate
