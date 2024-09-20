# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "jekyll-heroicons"
require "minitest/autorun"

# Parse a string into a liquid template
def parse(string)
  Liquid::Template.parse(string)
end

# Parse and render a string
def render(string, assigns = {})
  parse(string).render!(assigns)
end
