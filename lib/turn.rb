class Turn

  attr_reader :card, :guess

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    @guess.downcase == card.answer.downcase
  end

  def feedback
    correct? ? 'Correct!' : 'Incorrect.'
  end

end
