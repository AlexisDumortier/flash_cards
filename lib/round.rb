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

end
