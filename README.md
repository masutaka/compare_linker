# Compare Linker

[![Travis Status](https://img.shields.io/travis/masutaka/compare_linker.svg?style=flat-square)][travisci]
[![License](https://img.shields.io/github/license/masutaka/compare_linker.svg?style=flat-square)][license]
[![Gem](https://img.shields.io/gem/v/compare_linker.svg?style=flat-square)][gem-link]

[travisci]: https://travis-ci.org/masutaka/compare_linker
[license]: https://github.com/masutaka/compare_linker/blob/master/LICENSE.txt
[gem-link]: http://badge.fury.io/rb/compare_linker

## Description

Create GitHub's compare view URLs for pull request from diff of `Gemfile.lock` (and post comment to pull request).

![screen shot 2016-10-09 at 7 53 23 pm](https://cloud.githubusercontent.com/assets/170014/19219899/fd06eab8-8e5a-11e6-95fb-3b467088a712.png)

[GitHub Compare View](https://github.com/blog/612-introducing-github-compare-view) rocks.But [diff of Gemfile.lock](https://github.com/kyanny/compare_linker_demo/pull/14/files) sucks. So I made Compare Linker.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'compare_linker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install compare_linker

## Usage

```ruby
require 'compare_linker'

ENV['OCTOKIT_ACCESS_TOKEN'] = 'xxx'

compare_linker = CompareLinker.new('masutaka/compare_linker', '17')
compare_linker.formatter = CompareLinker::Formatter::Markdown.new
comment = compare_linker.make_compare_links.to_a.join("\n")
compare_linker.add_comment('masutaka/compare_linker', '17', comment)
```

### GitHub Enterprise

Set the following environment variable.

```ruby
ENV['OCTOKIT_API_ENDPOINT'] = 'www.example.com'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masutaka/compare_linker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
