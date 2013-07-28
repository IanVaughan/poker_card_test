require 'rspec/core'
require './lib/pack'

CARDS_IN_HAND = 5

def straight_flush_cards(start_value, suit)
  v = Pack::VALUES.index(start_value)
  CARDS_IN_HAND.times.collect do |c|
    Card.new(Pack::VALUES[v+c], suit)
  end
end

def straight_flush_hand(start_value, suit)
  Hand.new(straight_flush_cards(start_value, suit))
end


def four_of_a_kind_cards(value)
  4.times.collect do |c|
    Card.new(Pack::VALUES.index(value), 'k')
  end
end

def four_of_a_kind_hand(value)
  Hand.new(four_of_a_kind_cards(value) << Card.new('2', 'x'))
end

def random_hand
  Pack.new.deal(CARDS_IN_HAND)
end
