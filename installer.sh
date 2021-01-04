#!/bin/bash

# make directory for rails app
mkdir app

# copy important files to app directory
cp docker-compose.yml Dockerfile entrypoint.sh Gemfile app

# copy makefile
cp Makefile.app app/Makefile

# run `rails new .` in app directory (populate with files)
(cd app && docker-compose run --rm --no-deps web rails new . --force --database=postgresql)

# on ubuntu; change permissions
sudo chown -R $USER:$USER app

# copy database config
cp database.yml app/config

# rebuild image (creates dangling '<none>'-named image...) and create db
(cd app && docker-compose build && docker-compose run --rm web rake db:create)
