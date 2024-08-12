# Compare Linker

[![Test Status](https://img.shields.io/github/actions/workflow/status/masutaka/compare_linker/test.yml?branch=main&style=flat-square&logo=githubactions&label=Test)][test]
[![CodeQL Status](https://img.shields.io/github/actions/workflow/status/masutaka/compare_linker/github-code-scanning%2Fcodeql?branch=main&style=flat-square&logo=githubactions&label=CodeQL)][codeql]
[![GitHub License](https://img.shields.io/github/license/masutaka/compare_linker?style=flat-square&label=License)][license]
[![Gem](https://img.shields.io/gem/v/compare_linker.svg?logo=ruby&style=flat-square)][gem-link]

[test]: https://github.com/masutaka/compare_linker/actions/workflows/test.yml?query=branch%3Amain
[codeql]: https://github.com/masutaka/compare_linker/actions/workflows/github-code-scanning/codeql?query=branch%3Amain
[license]: https://github.com/masutaka/compare_linker/blob/main/LICENSE.txt
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
In addition to OCTOKIT_ACCESS_TOKEN, set the following environment variables.

```ruby
ENV['ENTERPRISE_OCTOKIT_ACCESS_TOKEN'] = 'xxx'
ENV['ENTERPRISE_OCTOKIT_API_ENDPOINT'] = 'https://www.example.com/api/v3'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masutaka/compare_linker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
