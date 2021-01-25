#!/bin/bash

# make directory for the rails app
mkdir app

# copy important files to app directory
cp docker-compose.yml Dockerfile entrypoint.sh Gemfile Gemfile.lock app
cp CODE_OF_CONDUCT.md LICENCE.md app

# copyname Makefile.app
cp Makefile.app app/Makefile

# Install and setup commands
RAILS_INSTALL="rails new . --skip-test --skip-system-test --force --database=postgresql;"
ADD_GEMS="bundle add pry --skip-install -g=development,test;"
ADD_GEMS+="bundle add rspec-rails --skip-install -g=development,test;"
ADD_GEMS+="bundle add guard --skip-install -g=development,test;"
ADD_GEMS+="bundle add guard-rspec --skip-install -g=development,test;"
ADD_GEMS+="bundle add factory_bot_rails --skip-install -g=development,test;"
ADD_GEMS+="bundle add database_cleaner-active_record --skip-install -g=test;"
ADD_GEMS+="bundle add devise --skip-install;"
BUNDLE="bundle install;"
INIT_RSPEC="rails generate rspec:install;"
INIT_GUARD="guard init;"
INIT_DEVISE="rails generate devise:install; rails generate devise User;"
CMD="$RAILS_INSTALL$ADD_GEMS$BUNDLE$INIT_RSPEC$INIT_GUARD$INIT_DEVISE"

# generate rails with gems installed,
# chown and copy db config, build changes
# and generate schema
(
  cd app &&
  docker-compose run --rm --no-deps web bash -c "${CMD}" &&
  sudo chown -R $USER:$USER ../app &&
  cp ../database.yml config &&
  docker-compose build &&
  docker-compose up -d test &&
  docker-compose run --rm web bash -c "rails db:create db:migrate"
)

# now that all is generated, clean docker images, containers and volumes
make docker_clean

echo "Completed!"
echo "Copy/move and rename your Dockerised Ruby on Rails application found in app/"
echo "Finally run the following command in your new Rails app directory to boot it up:"
echo "make setup"
