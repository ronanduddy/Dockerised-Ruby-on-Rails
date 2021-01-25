# Dockerised Rails

This is essentially a script that creates a dockerised Ruby on Rails environment with a Postgres database and Devise set up so that users can be registered.

The intent of this project it to automate the creation of a dockerised Rails app for pet projects.

## Installation

Simply clone this repo and to generate the 'dockerised Ruby on Rails' application run
```Shell
make install
```

It will take about 5 minutes to run the [installer](installer.sh).

Now an `app` directory will be created containing the Rails application. This directory can now be copied/moved and renamed to whatever and where ever you like. It is its own Rails project! Search and replace instances of `myapp` with the name you want to call your new Rails app.

While in the Rails directory run the following to setup your generated app
```Shell
make setup
```

In a separate terminal, you will be able to stop the running services for the application by running
```Shell
make stop
```

To get the services running again run
```Shell
make run
```

Now you can go to http://0.0.0.0:3000 to see the default Rails page. Rails is running! See the [Makefile](Makefile.app) for some other commands provided.

At anytime things have become muddled, it's possible to clean up any generated docker artifacts and the generated Rails application by running
```Shell
make clean
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronanduddy/Dockerised-Ruby-on-Rails. Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENCE.md) file for details
