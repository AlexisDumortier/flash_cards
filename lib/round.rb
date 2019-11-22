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

  def percent_correct_by_category(name)
    temp = self.deck.cards_in_category(name)
    (number_correct_by_category(name)/temp.size.to_f * 100.0).round
  end

  def start
    puts "Welcome! You're playing with #{self.deck.cards.size} cards. \n"
    puts "-------------------------------------------------\n"
    until self.number_turn == self.deck.cards.size
      puts "This is card #{self.number_turn + 1} out of #{self.deck.cards.size}"
      puts self.current_card.question + "\n"
      input = gets.chomp
      self.take_turn(input)
      puts self.turns.last.feedback
    end
    puts "****** Game over! ******"
    if self.number_correct == 1
      puts "You had #{self.number_correct} guess out of #{self.number_turn} for a total score of #{self.percent_correct}%."
    else
      puts "You had #{self.number_correct} guesses out of #{self.number_turn} for a total score of #{self.percent_correct}%."
    end
    self.scores.keys.each do |key|
      if key.is_a? Symbol
        puts "#{key.to_s} - #{self.percent_correct_by_category(key)}% correct."
      else
        puts "#{key} - #{self.percent_correct_by_category(key)}% correct."
      end
    end
    puts "\n"
  end

end
