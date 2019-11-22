class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    self.cards.size
  end

  def cards_in_category(type)
    temp = []
    cards.each do |card|
      if card.category == type
        temp << card
      end
    end
    temp
  end

end
