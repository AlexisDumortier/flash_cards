class Turn

  attr_reader :card, :guess

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    self.guess.downcase == card.answer.downcase
  end

end
