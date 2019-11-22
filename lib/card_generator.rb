class CardGenerator

  attr_reader :cards, :filename

  def initialize(file)
    @filename = file
  end

  def cards
    # opens the file
    file = File.open(self.filename)
    # stores the content of the file in data
    data = file.read
    # closes the file
    file.close
    batch_cards = data.split("\n")
    all_cards = []
    batch_cards.each do |card|
      temp_card = card.split(",")
      all_cards << Card.new(temp_card.at(0), temp_card.at(1), temp_card.at(2))
    end
    all_cards
  end

end
