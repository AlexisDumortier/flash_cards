class Round

  attr_reader :deck, :turns, :scores
  attr_accessor :number_correct, :number_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_turn = 0
    @scores = Hash.new(0)
  end

  def current_card
    self.deck.cards[self.number_turn]
  end

  def take_turn(guess)
    turn = Turn.new(guess, self.current_card)
    if turn.correct?
       self.number_correct += 1
       self.scores[self.current_card.category] += 1
     else
       self.scores[self.current_card.category] += 0
    end
    self.turns << turn
    self.number_turn += 1
    turn
  end

  def number_correct_by_category(name)
    self.scores[name]
  end

  def percent_correct
    (self.number_correct/self.number_turn.to_f * 100).round
  end

end
