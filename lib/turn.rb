class Turn

  attr_reader :card, :guess

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    self.guess.downcase == card.answer.downcase
  end

  def feedback
    if self.correct?
     "Correct!"
    else
     "Incorrect."
    end
  end

end
