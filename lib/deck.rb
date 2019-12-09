class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(type)

    array_cards_in_category = @cards.select do |card|
      card.category == type
    end
    array_cards_in_category

  end

end
