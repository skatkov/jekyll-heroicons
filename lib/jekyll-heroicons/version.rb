# frozen_string_literal: true

# prevent bundler errors
module Liquid; class Tag; end; end

module Jekyll
  class Heroicons < Liquid::Tag
    VERSION = "0.2"
  end
end
