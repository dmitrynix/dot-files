#!/bin/bash

set -ex

export RAILS_ENV=test

rm -fr db/schema.rb
rm -fr db/structure.sql

rake db:drop
rake db:create
rake db:migrate
