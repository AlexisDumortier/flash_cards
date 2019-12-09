require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and \
      reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5 \
      clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_round_has_deck
    assert_equal @round.deck, @deck
  end

  def test_rounds_starts_with_an_empty_turns_array
   assert_equal [], @round.turns
  end

  def test_round_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_takes_turn_returns_the_correct_turn_and_changes_current_card
    turn1 = @round.take_turn("Washington")
    # tests that a turn is returned when the take_turn method is called
    assert_instance_of Turn, turn1
    # tests that the guess associated with the turn returned matches the test
    # used when calling take_turn
    assert_equal "Washington", turn1.guess
    # tests that the turns array now has the turn initiated stored
    assert_equal [turn1], @round.turns
    # test that after taking a turn the current card changes
    assert_equal @card_2, @round.current_card
  end

  def test_number_correct_answers
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
    @round.take_turn("North north west")
    assert_equal 2, @round.number_correct
  end

  def test_number_correct_per_category
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    @round.take_turn("Mars")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 1, @round.number_correct_by_category(:STEM)
    @round.take_turn("North north west")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 2, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Washington")
    assert_equal 0.0, @round.percent_correct
    @round.take_turn("Mars")
    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    @round.take_turn("Mars")
    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
    @round.take_turn("leftish")
    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
  end

end
