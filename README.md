# Jekyll-heroicons

Jekyll liquid tags for the beautiful hand-crafted SVG icons, Heroicons.

This gem has no official affiliation with Tailwind CSS or the Heroicons team. Check out their sites:

- [Tailwind CSS](https://tailwindcss.com/)
- [Tailwind UI](https://tailwindui.com/)
- [Heroicons](https://heroicons.com/)

This is heavily inspired by https://github.com/jclusso/heroicons

## Installation

1. Add this to `Gemfile`:

  ```ruby
  gem 'jekyll-heroicons'
  ```
2. Add this to your jekyll `_config.yml`:

  ```yaml
  plugins:
    - jekyll-heroicons
  ```

## Usage
Configure default settings in `_config.yml`:

```ruby
heroicons:
  variant: 'solid'
```

And then you can use:

```liquid
{% heroicon alert class:"right left" %}
```

Another way to provide variant would be like so:
```liquid
{% heroicon solid/alert class:"right left"%}
# or
{% heroicon alert variant: "solid" class:"right left"%}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jekyll-heroicons. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/jekyll-heroicons/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jekyll::Heroicons project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-heroicons/blob/master/CODE_OF_CONDUCT.md).
