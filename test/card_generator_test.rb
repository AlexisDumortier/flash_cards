require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    new_set = CardGenerator.new("cards.txt")
    assert_instance_of CardGenerator, new_set
  end

  def test_output_of_cardgenerator_cards
    # tests that .cards is a method of CardGenerator
    assert_respond_to CardGenerator.new("cards.txt"), :cards
    # tests that it returns an array
    assert_kind_of Array, CardGenerator.new("cards.txt").cards
    # tests that the elements of the array are cards
    assert_kind_of Card, CardGenerator.new("cards.txt").cards.at(0)
    assert_kind_of Card, CardGenerator.new("cards.txt").cards.at(1)
    assert_kind_of Card, CardGenerator.new("cards.txt").cards.at(2)
  end

end
