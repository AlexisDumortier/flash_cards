require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    new_set = CardGenerator.new("cards.txt")
    assert_instance_of CardGenerator, new_set
  end

end
