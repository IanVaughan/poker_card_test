require 'rspec/core'

CARDS_IN_HAND = 5

def straight_flush(start_value, suit)
  v = Pack::VALUES.index(start_value)
  cards = CARDS_IN_HAND.times.collect do |c|
    Card.new(Pack::VALUES[v+c], suit)
  end
  Hand.new(cards)
end
end
