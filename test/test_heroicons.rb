# frozen_string_literal: true

require_relative "test_helper"

class JekyllHeroiconsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Heroicons::VERSION
  end

  def test_render
    output = render("{% heroicon solid/arrow-up %}")
    expected_content = File.read(File.expand_path("../icons/solid/arrow-up.svg", __dir__))
    assert_equal expected_content, output

    output = render("{% heroicon outline/arrow-down %}")
    expected_content = File.read(File.expand_path("../icons/outline/arrow-down.svg", __dir__))

    assert_equal expected_content, output
  end

  def test_render_nothing
    assert_equal '', render("{% heroicon %}")
  end

  def test_parses_tag_options
    output = render("{% heroicon arrow-up height:32 class:\"left right\" aria-label:hi%}")

    assert_match /height="32"/, output
    assert_match /class="[^"]+ left right/, output
    assert_match /aria-label="hi"/, output
  end

  def test_parses_interpolation_of_variables
    template = render("{% assign symbol = \"solid/arrow-up\" %}{% heroicon {{ symbol }} %}")
    assert_match /<svg.*.*/, template
  end
end
