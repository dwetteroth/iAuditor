# IAuditor

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/iAuditor`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iAuditor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iAuditor

## Usage

Easy initial setup:

All you need is your email and password, grant_type can be set to whatever, but if you don't know use "password"

a = IAuditor.client(IAuditor::Base.token(email, password, grant_type))

Now from a you can call many things out of the api

a.audits.search

a.audits.search({ field: "audit_id",field: "modified_at"  })

a.audits.search({ field: "audit_id",field: "modified_at", modified_at: "2018-04-03T11:15:26.644Z"  })

a.audits.search({ field: "audit_id",field: "modified_at", modified_at: "2018-04-03T11:15:26.644Z"  })

a.audits.search({ field: "audit_id",field: "modified_at", modified_after: "2018-04-03T11:15:26.644Z"  })

a.audits.search({ template: ""  })

a.audits.search({ archived: "both"  })

a.audits.search({ completed: "true"  })

a.audits.fetch()

a.actions.search({audit_id: ["", ""]})

a.templates.search()

a.export.profiles()

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/iAuditor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IAuditor project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/iAuditor/blob/master/CODE_OF_CONDUCT.md).
