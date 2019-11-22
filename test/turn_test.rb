require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_turn_exists
    card = card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_turn_has_a_guess
    card = card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
  end

  def test_turn_has_a_card
    card = card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal card, turn.card
  end

  def test_can_check_correctness
    card = card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Washington", card)
    refute turn1.correct?
    turn2 = Turn.new("Juneau", card)
    assert turn2.correct?
  end

end
