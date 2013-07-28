require 'card'
require 'pack'

class Hand
  attr_reader :cards

  def initialize cards
    @cards = cards
    @cards = sort
  end

  def count
    @cards.count
  end

  def highest_card
    @cards.last
  end

  def beats?(other_hand)
    if straight_flush? || other_hand.straight_flush?
      return true if straight_flush? && !other_hand.straight_flush?
      return false if !straight_flush? && other_hand.straight_flush?
      if straight_flush? && other_hand.straight_flush?
        return highest_card.value > other_hand.highest_card.value ? true : false
      end
    end
    raise
  end

  def straight_flush?
    (same_suit? && sequential?) ? true : false
  end

  def same_suit?
    @cards.all? { |s| s.suit == @cards.first.suit }
  end

  def sort
    @cards.sort { |c1, c2| Pack::VALUES.index(c1.value) <=> Pack::VALUES.index(c2.value) }
  end

  def sequential?
    start_index = Pack::VALUES.index(@cards.first.value)
    @cards.each_cons(2).all? do |c1, c2|
      Pack::VALUES.index(c1.value) == Pack::VALUES.index(c2.value) - 1
    end
  end
end
