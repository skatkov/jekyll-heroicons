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

    output = render("{% heroicon solid/arrow-down %}")
    expected_content = File.read(File.expand_path("../icons/solid/arrow-down.svg", __dir__))

    assert_equal expected_content, output
  end
end
