# frozen_string_literal: true

require_relative "test_helper"

class JekyllHeroiconsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Heroicons::VERSION
  end

  def test_render
    output = render("{% heroicon arrow-up variant:outline  %}")
    expected_content = File.read(File.expand_path("../icons/outline/arrow-up.svg", __dir__))

    assert_equal append_default_classes(expected_content), output

    output = render("{% heroicon arrow-down variant: outline %}")
    expected_content = File.read(File.expand_path("../icons/outline/arrow-down.svg", __dir__))

    assert_equal append_default_classes(expected_content), output

    output = render('{% heroicon arrow-down variant:"micro" %}')
    expected_content = File.read(File.expand_path("../icons/micro/arrow-down.svg", __dir__))

    assert_equal append_default_classes(expected_content), output
  end

  def append_default_classes(svg_content)
    doc = Nokogiri::HTML::DocumentFragment.parse(svg_content)
    doc.to_html.delete("\n")
  end

  def test_render_nothing
    assert_equal "", render("{% heroicon %}")
  end

  def test_parses_tag_options
    output = render('{% heroicon arrow-up variant:"solid" height:32 class:"left right" aria-label:hi%}')

    assert_match(/height="32"/, output)
    assert_match(/class="left right/, output)
    assert_match(/aria-label="hi"/, output)
  end

  def test_parses_interpolation_of_variables
    template = render('{% assign symbol = "solid/arrow-up" %}{% heroicon {{ symbol }} %}')
    assert_match(/<svg.*.*/, template)
  end
end
