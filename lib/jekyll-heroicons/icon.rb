require "nokogiri"

module Jekyll
  class Heroicons < Liquid::Tag
    class Icon
      def initialize(symbol, variant, options = {})
        @symbol = symbol
        @variant = variant
        @options = options
      end

      def raw
        doc = Nokogiri::HTML::DocumentFragment.parse(file)
        svg = doc.at_css "svg"

        @options.each do |key, value|
          svg[key.to_s] = value
        end

        doc.to_html(save_with: 0).delete("\n")
      end

      private

      def file
        @file ||= File.read(file_path).force_encoding("UTF-8")
      end

      def file_path
        File.join(Jekyll::Heroicons.root, "icons/#{@variant}/#{@symbol}.svg")
      end
    end
  end
end
