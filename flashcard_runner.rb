require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

card1 = Card.new("What's the capital of Japan?", "Tokyo", :Geography)
card2 = Card.new("What is the firstname of Seinfeld's best friend?", "George", :Popculture)
card3 = Card.new("Who is the oldest Beatles? (Ringo, John, Paul or George)", "Ringo", :Popculture)
card4 = Card.new("How many states are there in the US?", "50", :Geography)
card5 = Card.new("What is the square root of 169?", "13", :STEM)

cards = [card1, card2, card3, card4, card5]
deck = Deck.new(cards)
round = Round.new(deck)

system('clear')
round.start
