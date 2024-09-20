# frozen_string_literal: true

require_relative "jekyll-heroicons/version"
require 'liquid'

module Jekyll
  class Heroicons < Liquid::Tag
    def initialize(tag_name, markup, options)
      super
    end

    def render(context)
      File.read(File.expand_path("../icons/#{@markup.strip}.svg", __dir__))
    end
  end
end

Liquid::Template.register_tag("heroicon", Jekyll::Heroicons)
