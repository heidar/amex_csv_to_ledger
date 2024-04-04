# AMEX CSV to Ledger

Configurable Ruby gem to convert American Express CSV statements to Ledger 3
format.

## Dependencies

Requires Ruby 2.6 or above.

## Installation

It's easiest to install it as a Ruby gem:

    $ gem install amex_csv_to_ledger

## Usage

Run the executable that ships with the gem and pass in the path to an AMEX CSV.

    $ amex_csv_to_ledger statement.csv

The output will be the converted statement.

## Configuration

It's possible to configure various things in the output of this script, such as
the currency, what category names to use, tabs vs. spaces, etc.

There's a template that is populated with the default values in the doc folder.
Copy it to your home config directory to use it.

    mkdir ~/.config/amex_csv_to_ledger
    cp doc/config.yml.example ~/.config/amex_csv_to_ledger/config.yml

Then edit it to your liking, it's a normal YAML file.

## Development

After checking out the repo, run `bundle` to install dependencies. Then, run
`rake test` to run the tests.

Bear in mind when running tests that the tests will pick up the config in your
home directory. Remove it if you are getting failures.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and the created tag, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome. Send via email to the author, the
address is in git.
