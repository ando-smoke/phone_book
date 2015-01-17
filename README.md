Phone Book
======================

Manages a contact list and their phone numbers.

Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
sinatra
sinatra-contrib
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

At the time of initial creation of this application, Ruby version 2.0.0
was used.

Usage
-----

Upon completion of the above steps in the Installation section, open
up your preferred web browser and enter the following address:

```url
localhost:4567/
```

Initially populate the phone book with one or more desired contacts
via data entry fields for first name, last name, phone type and phone
number. As the phone book is populated, the contacts are listed in
alphabetical order at the bottom of the main html page. Any contact
within this list can be clicked on for more detail on contact name
and phone number, as well as additional phone numbers to be added.

Known Bugs
----------

None as of 2014-01-16.

Author
------

Andy Uppendahl

License
-------

MIT license.
