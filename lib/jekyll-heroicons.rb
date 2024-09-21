# frozen_string_literal: true

require_relative 'jekyll-heroicons/version'
require 'liquid'
require 'jekyll/liquid_extensions'

module Jekyll
  class Heroicons < Liquid::Tag
    include Jekyll::LiquidExtensions

    # Syntax for the heroicon symbol
    Syntax = /\A(#{Liquid::VariableSignature}+)/

    # For interpolation, look for liquid variables
    Variable = /\{\{\s*([\w]+\.?[\w]*)\s*\}\}/i

    # Copied from Liquid::TagAttributes to allow dashes in tag names:
    #
    #   {% heroicon alert area-label:"Hello World!" %}
    #
    TagAttributes = /([\w-]+)\s*\:\s*(#{Liquid::QuotedFragment})/o

    def initialize(tag_name, markup, options)
      super
      @markup = markup

      @symbol = symbol(markup)
      @variant = "solid"

      # If there's interpolation going on, we need to do this in render
      prepare(markup) unless markup.match(Variable)
    end

    def render(context)
      prepare(interpolate(@markup, context)) if @markup.match(Variable)

      return nil if @symbol.nil?

      File.read(File.expand_path("../icons/#{@variant}/#{@symbol}.svg", __dir__))
    end

    private

    def prepare(markup)
      @symbol = symbol(markup)
      @options = string_to_hash(markup)
    end

    def interpolate(markup, context)
      markup.scan Variable do |variable|
        markup = markup.gsub(Variable, lookup_variable(context, variable.first))
      end
      markup
    end

    # Create a ruby hash from a string passed by the jekyll tag
    def string_to_hash(markup)
      options = {}

      if markup.match(Syntax)
        markup.scan(TagAttributes) do |key, value|
          options[key.to_sym] = value.gsub(/\A"|"\z/, '')
        end
      end

      options
    end

    def symbol(markup)
      if (match = markup.split('/')).length > 1
        match[1].match(Syntax)
      else
        markup.match(Syntax)
      end
    end
  end
end

Liquid::Template.register_tag('heroicon', Jekyll::Heroicons)
