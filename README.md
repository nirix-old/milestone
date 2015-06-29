Milestone
=========

Milestone is a multiple project and issue tracker powered by the Ruby on Rails framework.
It is essentially the Ruby version of [Traq](https://traq.io).

[![Build Status](https://travis-ci.org/nirix/milestone.png?branch=master)](https://travis-ci.org/nirix/milestone)
[![Code Climate](https://codeclimate.com/github/nirix/milestone.png)](https://codeclimate.com/github/nirix/milestone)
[![Test Coverage](https://codeclimate.com/github/nirix/milestone/badges/coverage.svg)](https://codeclimate.com/github/nirix/milestone/coverage)

Setup / Installation
--------------------

Rename `config/database.yml.new` to `config/database.yml` and enter your
database details then:

````
bundle install
bundle exec rake db:migrate db:seed
bundle exec rails s
````

There is no default admin account yet, so you will need to manually create one.

Databases
---------

Milestone tries to use PostgreSQL by default, if you'd like to use MariaDB /
MySQL instead, you will need to set the `DB` environment variable to `mysql`.

````
DB=mysql rake db:migrate db:seed
DB=mysql rails s
````

License
-------

Milestone is released under the [Apache-2.0](http://www.apache.org/licenses/LICENSE-2.0) license.
