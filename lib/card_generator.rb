# frozen_string_literal: true

class CardGenerator
  attr_reader :cards, :filename

  def initialize(file)
    @filename = file
  end

  def cards
    # opens the file
    file = File.open(filename)
    # stores the content of the file in data
    data = file.read # use readline instead
    # closes the file
    batch_cards = data.split("\n")
    all_cards = []
    batch_cards.each do |card|
      temp_card = card.split(',')
      # syntax
      all_cards << Card.new(temp_card[0], temp_card.at(1), temp_card.at(2))
    end
    all_cards
  end
end
