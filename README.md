# NineGag Client

Hi 9gag fellows :)!

This is a easy to use gem for querying 9gag api.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nine_gag_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nine_gag_client

## Usage

```ruby
require 'nine_gag'
```

So far there are two models implemented, which have to basic methods.

### Post

```ruby
# Will return first page of all posts
first_page = NineGag::Collection::Post.all
# => [#<NineGag::Model::Post:0x00007fed9db469b8 @id="arGAmVB", @url="...

# Will return next page
first_page.next_page
# => [#<NineGag::Model::Post:0x00007fed9daabad0 @id="a3QA19e", @url="...
```

### Comment

```ruby
# Will return first page of all posts
first_page = NineGag::Collection::Comment.for_post('arGAmVB')
# => [#<NineGag::Model::Comment:0x00007fed9dadd940 @id="c_155138422298394255", @post_id="arGAmVB", @url="...

# Will return next page
first_page.next_page
# => [#<NineGag::Model::Comment:0x00007fed9db5c150 @id="c_155138430083567088", @post_id="arGAmVB", @url="...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also
run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version
number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git
commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Planned updates / ideas

- Adding error handling
- Adding sections and types filter to posts
- Single fetch for models, eg. NineGag::Model::Comment.find(id)
- Session handling (loggin into own account)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nine_gag_client. This project is
intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NineGagClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to
follow the [code of conduct](https://github.com/[USERNAME]/nine_gag_client/blob/master/CODE_OF_CONDUCT.md).
