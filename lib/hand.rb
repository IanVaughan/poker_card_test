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

    if four_of_a_kind? || other_hand.four_of_a_kind?
      return true if four_of_a_kind? && !other_hand.four_of_a_kind?
      return false if !four_of_a_kind? && other_hand.four_of_a_kind?
      if four_of_a_kind? && other_hand.four_of_a_kind?
        return highest_card.value > other_hand.highest_card.value ? true : false
      end
    end

    raise "Not Implemented rule yet!"
  end

  def straight_flush?
    same_suit? && sequential?
  end

  def four_of_a_kind?
    @cards.any? { |c| occurance_count_of(c.value) == 4 }
  end

  def same_suit?
    @cards.all? { |s| s.suit == @cards.first.suit }
  end

  def occurance_count_of value
    @cards.count { |c| c.value == value }
  end

  def sort
    @cards.sort { |c1, c2| Pack::VALUES.index(c1.value) <=> Pack::VALUES.index(c2.value) }
  end

  def sequential?
    @cards.each_cons(2).all? do |c1, c2|
      Pack::VALUES.index(c1.value) == Pack::VALUES.index(c2.value) - 1
    end
  end
end
