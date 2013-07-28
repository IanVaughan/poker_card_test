require 'card'
require 'pack'

class Hand
  attr_reader :cards

  def initialize cards
    @cards = cards
  end

  def count
    @cards.count
  end

  def same_suit?
    @cards.all? { |s| s.suit == @cards.first.suit }
  end

  def sort
    @cards.sort { |c1, c2| Pack::VALUES.index(c1.value) <=> Pack::VALUES.index(c2.value) }
  end

  def sequential?
    ordered = sort
    start_index = Pack::VALUES.index(ordered.first.value)
    ordered.each_cons(2).all? do |c1, c2|
      Pack::VALUES.index(c1.value) == Pack::VALUES.index(c2.value) - 1
    end
  end
end
