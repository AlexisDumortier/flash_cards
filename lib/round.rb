# frozen_string_literal: true

class Round
  attr_reader :deck, :turns, :scores
  attr_accessor :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @scores = Hash.new(0)
  end

  def current_card
    deck.cards[turns.size]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    
    if turn.correct?
      self.number_correct += 1
      @scores[current_card.category.to_sym] += 1 # changes the key to a symbol
    else
      @scores[current_card.category.to_sym] += 0
    end
    turns << turn
    turn
  end

  def number_correct_by_category(name)
    scores[name]
  end

  def percent_correct
    (self.number_correct / turns.size.to_f * 100).round
  end

  def percent_correct_by_category(name)
    array_cards_in_categ = deck.cards_in_category(name)
    (number_correct_by_category(name) / array_cards_in_categ.size.to_f * 100.0).round(1)
  end

  def start
    puts "Welcome! You're playing with #{deck.cards.size} cards. \n"
    puts "-------------------------------------------------\n"

    until turns.size == deck.cards.size
      puts "This is card #{turns.size + 1} out of #{deck.cards.size}"
      puts current_card.question + "\n"
      input = gets.chomp
      take_turn(input)
      puts turns.last.feedback
    end

    puts '****** Game over! ******'

    if self.number_correct == 1
      puts "You had #{self.number_correct} guess out of #{turns.size} for" \
      " a total score of #{percent_correct}%."
    else
      puts "You had #{self.number_correct} guesses out of #{turns.size} for" \
       "a total score of #{percent_correct}%."
    end

    scores.keys.each do |key|  
        puts "#{key} - #{percent_correct_by_category(key)}% correct."
    end

    puts "\n"
  end
end
