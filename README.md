# Dockerised Rails

This is essentially a script that creates a dockerised Ruby on Rails environment with a Postgres database. The intent of this project it to automate the creation of a dockerised Rails app for pet projects.

## Installation

Simply clone this repo.

## Usage

To run the rough-and-ready 'dockerised Ruby on Rails' [script](installer.sh) run
```Shell
make install
```

This will create an `app` directory which will contain a Rails app with a [Dockerfile](Dockerfile) and [docker-compose.yml](docker-compose.yml).

You can now rename and copy the `app` directory to whatever and where ever you like. It is its own Rails project! While in the `app` directory it will be possible to run the following to boot up Rails and Postgres:
```Shell
make run
```

Now you can go to http://0.0.0.0:3000 to see the default Rails page. Rails is running! See app's [Makefile](Makefile.app) for some other commands provided.

To clean up ([crudely](Makefile)) any files that have been generated and docker images or containers that might not be working correctly run
```Shell
make clean
```

## Development

Pull down and have at it. This a rough project and PRs would be welcomed to improve it :).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronanduddy/Dockerised-Ruby-on-Rails. Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENCE.md) file for details
