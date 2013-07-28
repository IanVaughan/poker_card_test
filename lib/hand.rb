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

  def beats?(other_hand)
    if straight_flush? || other_hand.straight_flush?
      return true if straight_flush? && !other_hand.straight_flush?
      return false if !straight_flush? && other_hand.straight_flush?
      if straight_flush? && other_hand.straight_flush?
        return sort.last.value > other_hand.sort.last.value ? true : false
      end
    end
    raise
  end

  def straight_flush?
    return false unless same_suit? && sequential?
    true
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
