# frozen_string_literal: true

require_relative "jekyll-heroicons/version"
require_relative "jekyll-heroicons/icon"
require "liquid"
require "jekyll/liquid_extensions"

module Jekyll
  class Heroicons < Liquid::Tag
    include Jekyll::LiquidExtensions

    def self.root
      File.dirname(__dir__)
    end

    # In case no variant is specified, use solid as default
    DEFAULT_VARIANT = "solid"

    # Syntax for the heroicon symbol
    SYNTAX = /\A(#{Liquid::VariableSignature}+)/

    # For interpolation, look for liquid variables
    VARIABLE = /\{\{\s*(\w+\.?\w*)\s*\}\}/i

    # Copied from Liquid::TagAttributes to allow dashes in tag names:
    #
    #   {% heroicon alert area-label:"Hello World!" %}
    #
    TAG_ATTRIBUTES = /([\w-]+)\s*:\s*(#{Liquid::QuotedFragment})/o

    def initialize(tag_name, markup, options)
      super
      @markup = markup

      # If there's interpolation going on, we need to do this in render
      prepare(markup) unless markup.match(VARIABLE)
    end

    def render(context)
      prepare(interpolate(@markup, context)) if @markup.match(VARIABLE)

      return nil if @symbol.nil?

      Icon.new(@symbol, @variant, @options.except(:variant, :disable_default_class)).raw
    end

    private

    def config
      @@config ||= begin
        Jekyll.configuration.dig("heroicons")
      rescue NoMethodError
        {}
      end
    end

    def prepare(markup)
      @symbol = symbol(markup)
      @options = string_to_hash(markup)
      @variant = variant(markup)
      prepend_default_classes
    end

    # This method checks if heroicons liquid tag has a variant specified. If not, it check default variant in the config file. If both of those are not defined, it falls back to the default variant.
    def variant(markup)
      if @options.key?(:variant)
        @options[:variant]
      elsif config["variant"]
        config["variant"]
      else
        DEFAULT_VARIANT
      end
    end

    def prepend_default_classes
      return if @options[:disable_default_class].eql?('true')
      return unless config.dig("default_class", @variant)

      if @options[:class]
        @options[:class] += " #{config.dig("default_class", @variant)}"
      else
        @options[:class] = config.dig("default_class", @variant)
      end
    end

    def interpolate(markup, context)
      markup.scan VARIABLE do |variable|
        markup = markup.gsub(VARIABLE, lookup_variable(context, variable.first))
      end
      markup
    end

    # Create a ruby hash from a string passed by the jekyll tag
    def string_to_hash(markup)
      options = {}

      if markup.match(SYNTAX)
        markup.scan(TAG_ATTRIBUTES) do |key, value|
          options[key.to_sym] = value.gsub(/\A"|"\z/, "")
        end
      end

      options
    end

    def symbol(markup)
      if (match = markup.split("/")).length > 1
        match[1].match(SYNTAX)
      else
        markup.match(SYNTAX)
      end
    end
  end
end

Liquid::Template.register_tag("heroicon", Jekyll::Heroicons)
