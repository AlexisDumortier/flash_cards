# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'

class DeckTest < Minitest::Test

  def setup 
    @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and \
      reports about the surface of which planet?", 'Mars', :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5 \
      clockwise from due north?", 'North north west', :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_deck_has_cards
    @cards = [@card_1, @card_2, @card_3]
    assert_equal @cards, @deck.cards
  end

  def test_deck_has_count
    cards1 = [@card_1, @card_2]
    deck1 = Deck.new(cards1)
    assert_equal 2, deck1.count
    cards2 = [@card_1, @card_2, @card_3]
    deck2 = Deck.new(cards2)
    assert_equal 3, deck2.count
  end

  def test_returns_cards_per_category
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
    assert_equal [], @deck.cards_in_category('Pop Culture')
  end
end
