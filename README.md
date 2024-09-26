# Jekyll-heroicons

Jekyll liquid tags for the beautiful hand-crafted SVG icons, Heroicons.

This gem has no official affiliation with Tailwind CSS or the Heroicons team. Check out their sites:

- [Tailwind CSS](https://tailwindcss.com/)
- [Tailwind UI](https://tailwindui.com/)
- [Heroicons](https://heroicons.com/)

This is heavily inspired by https://github.com/jclusso/heroicons

If you are looking to build a Jekyll website with Tailwind and no-build, take a look at [Jekyll CLI Template](https://github.com/skatkov/jekyll-tailwind-cli-template) that contains already this gem.

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
```liquid
{% heroicon bell %}
```
Heroicons comes in 4 variants: `solid`, `outline`, `mini`, and `micro`. The default variant is `solid`.
This can be changed through configuration in `_config.yml`:

```ruby
heroicons:
  variant: 'solid'
```

Another way to provide variant and override defaults defined in config is to pass 'variant' to liquid tag:
```liquid
{% heroicon bell variant: "mini" %}
```

It's also possible to provide classes to the icon:
```liquid
{% heroicon bell class: "text-red-500" %}
```

Any other attributes will be passed to the SVG tag as well. As example:

```liquid
{% heroicon bell class: "text-red-500" aria-hidden: true height:32 aria-label:hi %}
```
## Configuration
Besides variants, it's also possible to define default classes for each variant. Here is a recommended default configuration for `_config.yml`:

```ruby
heroicons:
  variant: 'solid'
  default_class: {
    solid: "size-6",
    outline: "size-6",
    mini: "size-5",
    micro: "size-4",
  }
```

This default class will be applied to every icon. You can disable this on a per-icon basis by passing `disable_default_class: true`.

```liquid
{% heroicon bell disable_default_class: true %}
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
