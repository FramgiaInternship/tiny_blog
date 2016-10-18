# Ruby on Rails Tutorial sample application

## License

All source code in this blog is available jointly under the MIT License
and the Beerware License. See [LICENSE.md](LICENSE.md) for details.

## See demo here
https://sontd-tinyblog.herokuapp.com/

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).
